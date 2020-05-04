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

extern void rpi_init(u8_t *rpi);
extern void rpi_update(u8_t *rpi);
extern void cdc_printf(char *format, ...);

extern bool bt_started;
extern bool start_adv;
extern bool cdc_open;
extern bool write_flash;
extern bool show_raw;
extern struct bt_le_scan_param scan_param ;
extern struct device *cdc_dev;
extern struct ring_buf outringbuf;
#define BT_LE_ADV_NCONN2 BT_LE_ADV_PARAM(4, BT_GAP_ADV_FAST_INT_MIN_2, \
                                        BT_GAP_ADV_FAST_INT_MAX_2, NULL)
void bt_init(void) {
    int err;
    printk("Starting Scanner/Advertiser Demo\n");
    bt_addr_le_t static_addr;
    static_addr.a.val[5]= 0xF;
    static_addr.type = 1;
    bt_set_id_addr(&static_addr);
    /* Initialize the Bluetooth Subsystem */
    err = bt_enable(NULL);
    if (err) {
        printk("Bluetooth init failed (err %d)\n", err);
        // blink(&led2, 1);
        return;
    }
    bt_started = true;
    printk("Bluetooth initialized\n");
}


void bt_adv (void) {
    u8_t *tcn;
    struct bt_data encounter_ad[] = {
            BT_DATA_BYTES(BT_DATA_FLAGS, BT_LE_AD_NO_BREDR),
            // BT_DATA_BYTES(BT_DATA_TX_POWER, 0),
            BT_DATA_BYTES(BT_DATA_UUID16_ALL, 0x6F, 0xFD),
            BT_DATA_BYTES(BT_DATA_SVC_DATA16,
                            0x6F, 0xFD,
                            0,0,0,0,0,0,0,0,
                            0,0,0,0,0,0,0,0,
                            0x04, 0x3, 0x2, 0x1)
    };
    while (!start_adv) {
        printk("BT not started\n");
        k_sleep(K_MSEC(1000));
    } 
    printk("Trying to start advertising\n");

    tcn = encounter_ad[2].data+2; // 3rd item in array of messages is RPI
    rpi_init(tcn);
    // u32_t round=0;
    k_sleep(K_MSEC(400));

    /* Start advertising */
    /*
     *
     *  We will move start into the loop to change the address repeatably
     *  For now, outside the loop so that it is easier to debug and use in BT
     *  tests
     *
     */
    rpi_update(tcn);
    int err = bt_le_adv_start(BT_LE_ADV_NCONN2, encounter_ad,
                              ARRAY_SIZE(encounter_ad), NULL, 0);
    if (err) {
        printk("Advertising failed to start (err %d)\n", err);
        return;
    }

    do {
        blink(&led1,1);
        k_sleep(K_MSEC(RPI_PERIOD));

        rpi_update(tcn);
        err = bt_le_adv_update_data(encounter_ad, ARRAY_SIZE(encounter_ad), NULL, 0);
        /*  Will not use update... but stop in version that randomized MAC */
        // err = bt_le_adv_stop();
        if (err) {
            printk("Advertising failed to stop (err %d)\n", err);
            return;
        }
        printk("Update rpi\n");
    } while (1);
}

/*
static bool data_cb(struct bt_data *data, void *user_data)
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
*/
/*
static void scan_cb(const bt_addr_le_t *addr, s8_t rssi, u8_t adv_type,
            struct net_buf_simple *buf)
{
    char buffer[60];
    char line[1024];
    u8_t uuid16[2]={0, 0};
    u8_t size = 0;

    u32_t timestamp = k_uptime_get_32();
    flash(&led2);
    for (u8_t i=0; i<buf->len; i++) {
        size += sprintf(buffer+size, "%02x", buf->data[i]);
    }
    bt_data_parse(buf, data_cb, uuid16);
    if ((uuid16[0]==0x6F) && (uuid16[1]==0xFD)) {
        // flash(&led2);
        char addr_string[BT_ADDR_LE_STR_LEN];
        bt_addr_le_to_str(addr, addr_string, sizeof(addr_string));
        if (write_flash) {
            sprintf(line, "%12u, %3d, %s, %s\n", timestamp, rssi, addr_string, buffer);
            printk("line len: %d\n", strlen(line));
        }
        if (show_raw && cdc_open) {
            printk("%12u, %3d, %s, %s\n", timestamp, rssi, addr_string, buffer);
        }
    }
}
*/

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

static void scan_cb_orig(const bt_addr_le_t *addr, s8_t rssi, u8_t adv_type,
            struct net_buf_simple *buf)
{
    // flash(&led2);
    u8_t uuid16[2] = {0, 0};
    u32_t timestamp = k_uptime_get_32();
    char rpi_string[64];
    int size = 0;
    for(u8_t i=0; i<buf->len; i++) {
        size += sprintf(rpi_string+size, "%02X", buf->data[i]);
    }

    bt_data_parse(buf, data_cb_local, uuid16);
    if ((uuid16[0]==0x6F) && (uuid16[1]==0xFD)) {
        flash(&led2);
        char addr_string[20];
        size = 0;
        for(u8_t i=0; i<5; i++) {
            size += sprintf(addr_string+size, "%02X:", addr->a.val[5-i]);
        }
        size += sprintf(addr_string+size, "%02X", addr->a.val[0]);
        char line[128];
        int line_len = sprintf(line, "%12d, %3d, %s, %s\n",
                        timestamp, rssi, addr_string, rpi_string);
        if (show_raw) {  // This puts it on the debugger
            printk("%s", line);
        }
        if (cdc_open&&show_raw) {  // This puts it on the debugger
            unsigned int key = irq_lock();
            int out_len = ring_buf_put(&outringbuf, line, line_len);
            irq_unlock(key);
            // printk("out_len: %d\n", out_len);
            uart_irq_tx_enable(cdc_dev);
        }
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
