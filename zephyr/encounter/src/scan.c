#include <zephyr/types.h>
#include <stddef.h>
#include <sys/printk.h>
#include <sys/util.h>

#include <bluetooth/bluetooth.h>
#include <bluetooth/hci.h>
#include <stdio.h>

#define RPI_PERIOD 10000  // mSec
#include "led.h"
#include <drivers/uart.h>
#include <sys/ring_buffer.h>

#include <fs/fs.h>
#include "encounter.h"
#include "x25519-cortex-m4.h"
#define SCAN_DEBUG
extern void rpi_init(u8_t *rpi);
extern void rpi_update(u8_t *rpi);
extern void uart_printf(char *format, ...);

extern bool bt_started;
extern bool start_adv;
extern bool cdc_open;
extern bool write_flash;
extern bool flash_full;
extern bool show_binary;
extern bool show_raw;
extern bool show_kernel;
extern struct bt_le_scan_param scan_param ;
extern struct device *cdc_dev;
extern struct ring_buf outringbuf;
extern struct ring_buf flashringbuf;
extern struct fs_file_t encounter_file;
extern int total_cache;
extern uint8_t private_key[32];
extern uint8_t public_key[32];
extern uint8_t shared_key[32];

extern uint8_t saewoo_hack[2];

extern Encounter_record encounters[IDX_MASK+1];

extern uint32_t epochtimesync;
extern uint32_t offsettime;
extern uint32_t next_minute;

extern uint32_t c_fifo_last_idx;

extern uint32_t p_fifo_last_idx;

static bool data_cb_local(struct bt_data *data, void *user_data)
{
    u8_t *uuid16 = user_data;

    switch (data->type) {
    case BT_DATA_UUID16_ALL:
        memcpy(uuid16, data->data, 2);
        return false;
    default:
        return true;
    }
}

void uart_ch_rssi(struct Ch_data e) {
    uart_printf("%d %d %d %d %d\n", e.n, e.max, e.min, e.mean, e.var);

}

int in_encounters_fifo(const uint8_t * mac, uint32_t epoch_minute) {
    /*
     *
     * Search backward during the "last minutes" worth of encounters
     *
     */
    Encounter_record *current_encounter;
    if (c_fifo_last_idx == 0) return -1;
    int start = c_fifo_last_idx - 1;
    do {
        current_encounter = encounters + (start & IDX_MASK);
        if (current_encounter->minute < epoch_minute) return -1;
        if (memcmp(current_encounter->mac, mac, 6) == 0) return start;
        start--;
    } while (start>=0);
    return -1;
}

static void scan_cb_orig(const bt_addr_le_t *addr, s8_t rssi, u8_t adv_type,
            struct net_buf_simple *buf)
{
    // flash(&led2);
    u8_t uuid16[2] = {0, 0};
    u32_t timestamp = k_uptime_get_32();
    // uint8_t raw_event[32];
    char rpi_string[64];
    /*
    bt_addr_le_t a[CONFIG_BT_ID_MAX];
    int count;
    */
#ifdef SCAN_DEBUG
    printk("%u\tIn scan callback\n", timestamp);
#endif
    /*
    bt_id_get(a, &count);
    uart_printf("num of id: %d\n", count);
    for (int i=0; i<count; i++) {
        bt_addr_le_to_str(a+i, rpi_string, BT_ADDR_STR_LEN);
        uart_printf("id %d: %s\n", i, rpi_string);
    }
    int size = 0;
    for(u8_t i=0; i<buf->len; i++) {
        size += sprintf(rpi_string+size, "%02X", buf->data[i]);
    }
    uart_printf("name: %s\n", bt_get_name());
    bt_addr_le_to_str(addr, rpi_string, BT_ADDR_STR_LEN);
    uart_printf("%s  ", rpi_string);
    */

    rssi = -rssi;

    bt_data_parse(buf, data_cb_local, uuid16);
#ifdef SCAN_DEBUG
    printk("\tfinish parse data\n");
#endif
    
    //if ((uuid16[0]==0x6F) && (uuid16[1]==0xFD)) {
    if (true) {
        flash(&led2);
        Encounter_record *current_encounter;
        /*  old stuff, raw event 32 bytes
         *
         *
        memcpy(raw_event,(uint8_t *) &timestamp, 4);
        memcpy(raw_event+4, addr->a.val, 6);
        // raw_event[10] = 0xFF;
        raw_event[10] = saewoo_hack[0]+37;
        raw_event[11] = rssi;
        memcpy(raw_event+12, buf->data+6, 20);  // skip 0x6FFD patterns
        */

        // uart_printf("ch: %d, rssi: %d ", 37+saewoo_hack[0], rssi);

        int sec_timestamp = (timestamp - (next_minute - 60000)) / 1000;
        uint32_t epoch_minute = ((timestamp-offsettime) / 1000 + epochtimesync)/60;

#ifdef SCAN_DEBUG
    printk("\tTry to check if in fifo\n");
#endif
        // Check if record already exists by mac
        int idx = in_encounters_fifo(addr->a.val, epoch_minute);
#ifdef SCAN_DEBUG
    printk("\tp_idx: %d, c_idx: %d\n", p_fifo_last_idx, c_fifo_last_idx);
#endif
        // uart_printf("idx:%d  ", idx);
        if (idx<0) {
            // No index returned
#ifdef SCAN_DEBUG
    printk("\tCreat new encounter\n");
#endif
            current_encounter = encounters + (c_fifo_last_idx & IDX_MASK);
            memcpy(current_encounter->mac, addr->a.val, 6);
            current_encounter->rssi_data[saewoo_hack[0]].n = 1;
            current_encounter->rssi_data[saewoo_hack[0]].max = rssi;
            current_encounter->rssi_data[saewoo_hack[0]].min = rssi;
            current_encounter->rssi_data[saewoo_hack[0]].mean = rssi;
            current_encounter->rssi_data[saewoo_hack[0]].var = 0;
            current_encounter->first_time = sec_timestamp;
            current_encounter->last_time = sec_timestamp;
            current_encounter->minute = epoch_minute;
            c_fifo_last_idx++;
        } else {
#ifdef SCAN_DEBUG
    printk("\tFound previous encounter: %d, %d\n",idx, (idx&IDX_MASK));
#endif
            current_encounter = encounters + (idx & IDX_MASK);
#ifdef SCAN_DEBUG
    printk("\tsaewoo_hack[0]:%d\n",saewoo_hack[0] );
#endif
            int n = ++current_encounter->rssi_data[saewoo_hack[0]].n;
            if (rssi > current_encounter->rssi_data[saewoo_hack[0]].max) {
                current_encounter->rssi_data[saewoo_hack[0]].max = rssi;
            }
            if (rssi < current_encounter->rssi_data[saewoo_hack[0]].max) {
                current_encounter->rssi_data[saewoo_hack[0]].min = rssi;
            }
#ifdef SCAN_DEBUG
    printk("\tcompute new mean: n:%d\n",n );
#endif
            if (n>0) {
                int mean = current_encounter->rssi_data[saewoo_hack[0]].mean;
                int new_mean = mean + (rssi - mean + n/2)/n;
                current_encounter->rssi_data[saewoo_hack[0]].mean = new_mean;
                current_encounter->rssi_data[saewoo_hack[0]].var += (rssi-new_mean)*(rssi-mean);
            }  // otherwise, 255 interactions in 1 minute... It has rolled over... don't computer new stuff
            current_encounter->last_time = sec_timestamp;
            current_encounter->minute = epoch_minute;
        }
        // uart_ch_rssi(current_encounter->rssi_data[saewoo_hack[0]]);
        // Update bobs shared key
#ifdef SCAN_DEBUG
    printk("\tDo crypto stuff\n");
#endif
        uint8_t hi_lo_byte = *(buf->data+6);
        // uart_printf("\ttime: %u, flag: %d, hi_lo_byte: %d\n", timestamp, current_encounter->flag, hi_lo_byte);
        if (( current_encounter->flag &0x3) < 3) {
            if (((current_encounter->flag & 0x1) == 0) && (hi_lo_byte==0)) {
                uart_printf("got lo part of public key\n");
                memcpy(current_encounter->public_key, buf->data+6+4, 16);
                current_encounter->flag |= 0x1;
            }
            if (((current_encounter->flag & 0x2) == 0) && (hi_lo_byte==1)) {
                uart_printf("got hi part of public key\n");
                memcpy(current_encounter->public_key+16, buf->data+6+4, 16);
                current_encounter->flag |= 0x2;
            }
        }
        if (((current_encounter->flag&0x4)==0) && ((current_encounter->flag&0x3) == 3)) {
            uart_printf("calc shared key\n");
            X25519_calc_shared_secret(shared_key, private_key, current_encounter->public_key);
            memcpy(current_encounter->public_key, shared_key, 32);
            current_encounter->flag |= 0x4;

        }
#ifdef SCAN_DEBUG
         printk("\tdone scan cb\n");
#endif
        // uart_encounter(*current_encounter);
    }
}


void start_scan(void) {
    //  Start Scan
    int err = bt_le_scan_start(&scan_param, scan_cb_orig);
    if (err) {
        printk("Starting scanning failed (err %d)\n", err);
        return;
    } else {
        printk("Scan started\n");
    }

}

void stop_scan(void) {
    int err = bt_le_scan_stop();
    if (err) {
        printk("Stop scanning failed (err %d)\n", err);
        return;
    } else {
        printk("Scan stopped\n");
    }
}
