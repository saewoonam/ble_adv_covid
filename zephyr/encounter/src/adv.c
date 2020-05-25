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

#include "x25519-cortex-m4.h"
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
extern uint32_t next_minute;
extern uint8_t saewoo_hack[2];

#define BT_LE_ADV_NCONN2 BT_LE_ADV_PARAM(4, BT_GAP_ADV_FAST_INT_MIN_2, \
                                        BT_GAP_ADV_FAST_INT_MAX_2, NULL)
extern bool hide_mac;
void bt_init(void) {
    int err;
    printk("Starting Scanner/Advertiser Demo\n");

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

bool update_public_key(void) {
        // Check if we need to change key
        //
        //  Need to handle rollover... at some point
        u32_t timestamp = k_uptime_get_32();
        if (timestamp >= next_minute) {
            while (k_uptime_get_32() >= next_minute) {
                next_minute += 60000;
            }
            // update secret key
            sys_csrand_get(private_key, 32);
            X25519_calc_public_key(public_key, private_key);
            if (start_adv) {  // blink once a minute if advertising
                blink(&led1,1);
                if (write_flash) {
                    blink(&led3,1);
                }
            }
            return true;
        }
        return false;
}

void bt_adv (void) {
    /* 
     *
     *
     *
     * NEED TO FIX 1 SECOND PROBLEM with updating keys and current_minute
     *
     *
     *
     */

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
    bool adv_part_a = true;
    int err;

    tcn = encounter_ad[2].data+2; // 3rd item in array of messages is RPI
    tcn[3] = 0x4;  // set to 4 by google/apple protocol

    do {
        if (!start_adv) {
            bt_le_adv_stop();

            while (!start_adv) {
                k_sleep(K_MSEC(1000));
                update_public_key();
            }
            if(hide_mac) {
                err = bt_le_adv_start(BT_LE_ADV_NCONN, encounter_ad,
                                        ARRAY_SIZE(encounter_ad), NULL, 0);
            } else {
                err = bt_le_adv_start(BT_LE_ADV_NCONN2, encounter_ad,
                                    ARRAY_SIZE(encounter_ad), NULL, 0);
            }
            if (err) {
                printk("Advertising failed to start (err %d)\n", err);
                return;
            }
        }
        bool bool_new_key = update_public_key();
        // update tcn
        if (adv_part_a) {
            // advertise the first 16 bytes of public_key
            tcn[0] = 0;
            memcpy(tcn+4, public_key, 16);
            adv_part_a = false;
        } else {
            // advertise the second 16 bytes of public_key
            tcn[0] = 1;
            memcpy(tcn+4, public_key+16, 16);
            adv_part_a = true;
        }
        if (bool_new_key && hide_mac) {
            bt_le_adv_stop();
            err = bt_le_adv_start(BT_LE_ADV_NCONN, encounter_ad,
                                  ARRAY_SIZE(encounter_ad), NULL, 0);
        } else {
            err = bt_le_adv_update_data(encounter_ad, ARRAY_SIZE(encounter_ad), NULL, 0);
        }
        k_sleep(K_MSEC(1000));

        printk("Update rpi\n");
    } while (1);
}


