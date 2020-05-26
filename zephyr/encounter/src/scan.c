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

extern Encounter_record encounters[64];

extern uint32_t epochtimesync;
extern uint32_t offsettime;
extern uint32_t next_minute;

extern uint32_t c_fifo_last_idx;

extern uint32_t p_fifo_start_idx;
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
        current_encounter = encounters + (start & 0x3F);
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
    bt_addr_le_t a[CONFIG_BT_ID_MAX];
    int count;

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
        // Check if record already exists by mac
        int idx = in_encounters_fifo(addr->a.val, epoch_minute);
        // uart_printf("idx:%d  ", idx);
        if (idx<0) {
            // No index returned
            current_encounter = encounters + (c_fifo_last_idx & 0x3F);
            //memcpy(encounters[c_fifo_last_idx&0x3F].mac, addr->a.val, 6);
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
            current_encounter = encounters + idx;
            int n = ++current_encounter->rssi_data[saewoo_hack[0]].n;
            if (rssi > current_encounter->rssi_data[saewoo_hack[0]].max) {
                current_encounter->rssi_data[saewoo_hack[0]].max = rssi;
            }
            if (rssi < current_encounter->rssi_data[saewoo_hack[0]].max) {
                current_encounter->rssi_data[saewoo_hack[0]].min = rssi;
            }
            int mean = current_encounter->rssi_data[saewoo_hack[0]].mean;
            int new_mean = mean + (rssi - mean + n/2)/n;
            current_encounter->rssi_data[saewoo_hack[0]].mean = new_mean;
            current_encounter->rssi_data[saewoo_hack[0]].var += (rssi-new_mean)*(rssi-mean);
            current_encounter->last_time = sec_timestamp;
            current_encounter->minute = epoch_minute;
        }
        // uart_ch_rssi(current_encounter->rssi_data[saewoo_hack[0]]);
        // Update bobs shared key
        uint8_t hi_lo_byte = *(buf->data+6);
        if (( current_encounter->flag &0x3) < 3) {
            if (((current_encounter->flag & 0x1) == 0) && (hi_lo_byte==0)) {
                memcpy(current_encounter->public_key, buf->data+6+4, 16);
                current_encounter->flag |= 0x1;
            }
            if (((current_encounter->flag & 0x2) == 0) && (hi_lo_byte==1)) {
                memcpy(current_encounter->public_key+16, buf->data+6+4, 16);
                current_encounter->flag |= 0x2;
            }
        }
        if (((current_encounter->flag&0x4)==0) && (current_encounter->flag&0x3 == 3)) {

            X25519_calc_shared_secret(shared_key, private_key, current_encounter->public_key);
            memcpy(current_encounter->public_key, shared_key, 32);
            current_encounter->flag |= 0x4;

        }

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
