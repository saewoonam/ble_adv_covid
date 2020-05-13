//  SPDX-License-Identifier: Apache-2.0
#include <zephyr/types.h>
#include <stddef.h>
#include <sys/printk.h>
#include <sys/util.h>

#include <bluetooth/bluetooth.h>
#include <bluetooth/hci.h>
#include <stdio.h>

#include <drivers/uart.h>

#include <display/mb_display.h>

#define RPI_PERIOD 200  // mSec

extern void rpi_init(u8_t *rpi);
extern void rpi_update(u8_t *rpi);

extern bool bt_started;
extern bool start_adv;
extern bool cdc_open;
extern bool write_flash;
extern bool show_raw;
extern struct bt_le_scan_param scan_param ;
extern struct device *uart_dev;
extern struct mb_display *disp;

/*
  #define BT_LE_ADV_NCONN2 BT_LE_ADV_PARAM(4, BT_GAP_ADV_FAST_INT_MIN_2, \
                                        BT_GAP_ADV_FAST_INT_MAX_2, NULL)
                                        */
#define BT_LE_ADV_NCONN2 BT_LE_ADV_PARAM(4, 100, \
                                        300, NULL)

void uart_write(struct device *dev, uint8_t *buffer, uint8_t length) {
    for(int i=0; i<length; i++) {
            uart_poll_out(dev, buffer[i]);
    }
}

void uart_print(struct device *dev, char *buffer) {
        uart_write(dev, buffer, strlen(buffer));
}

void bt_init(void) {
    int err;
    printk("Starting Scanner/Advertiser Demo\n");

    /* Initialize the Bluetooth Subsystem */
    err = bt_enable(NULL);
    if (err) {
        printk("Bluetooth init failed (err %d)\n", err);
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
    /*
    while (!start_adv) {
        printk("BT not started\n");
        k_sleep(K_MSEC(1000));
    } 
    printk("Trying to start advertising\n");
    */
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
    u32_t now, old;
    old = k_uptime_get_32();
    char c;
    int rc=0;
    int flash_counter = 0;
    struct mb_image pixel = {};
    pixel.row[0] = BIT(0);
    do {
        while (!start_adv) {
            printk("BT not started\n");
            k_sleep(K_MSEC(1000));
        }

        now = k_uptime_get_32();
        // blink(&led1,1);
        // k_sleep(K_MSEC(RPI_PERIOD));
        
        if ((now-old) > RPI_PERIOD) { 
            rpi_update(tcn);
            err = bt_le_adv_update_data(encounter_ad, ARRAY_SIZE(encounter_ad), NULL, 0);
            /*  Will not use update... but stop in version that randomized MAC */
            /*
            // err = bt_le_adv_stop();
            if (err) {
                printk("Advertising failed to stop (err %d)\n", err);
                return;
            }
            */
            old = now;
            if (flash_counter==0) {
                mb_display_image(disp, MB_DISPLAY_MODE_SINGLE,
                        K_MSEC(20), &pixel, 1);
            } else {
                k_sleep(K_MSEC(RPI_PERIOD));
            }
            flash_counter++;
            flash_counter = flash_counter % 10;
/*
            // move these two lines oustide the loop in case there are garbage
            // collection issues
            char rpi_string[64];
            int len = 0;
            //
            //
            len = sprintf(rpi_string, "Update rpi: ");
            for (int i=0; i<20; i++) {
                len += sprintf(rpi_string+len, "%02X", tcn[i]);
            }
            len += sprintf(rpi_string+len, "\n");
            uart_print(uart_dev, rpi_string);
            */
        }
        rc = uart_poll_in(uart_dev, &c);
        if (rc==0) {
            switch (c)
            {
                case 'r':
                    show_raw = true;
                    break;
                case 'z':
                    show_raw = false;
                    break;
                default:
                    break;
            }
        }
    } while (1);
}


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
        // flash(&led3);
        char addr_string[20];
        size = 0;
        for(u8_t i=0; i<5; i++) {
            size += sprintf(addr_string+size, "%02X:", addr->a.val[5-i]);
        }
        size += sprintf(addr_string+size, "%02X", addr->a.val[0]);
        char line[128];
        sprintf(line, "%12d, %3d, %s, %s\n",
                timestamp, rssi, addr_string, rpi_string);
        if (show_raw) {  // This puts it on the debugger
            size = strlen(line);
            uart_write(uart_dev, line, size);
            // printk("%s", line);
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
