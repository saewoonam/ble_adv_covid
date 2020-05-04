/* main.c - Application main entry point */

/*
 * Copyright (c) 2015-2016 Intel Corporation
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <zephyr/types.h>
#include <stddef.h>
#include <sys/util.h>

#include <bluetooth/bluetooth.h>
#include <bluetooth/hci.h>

#include <sys/printk.h>
#include <sys/util.h>
#include <stdio.h>

#include <drivers/sensor.h>

#include <zephyr.h>
#include <drivers/gpio.h>
#include <device.h>
#include <display/mb_display.h>

#define RPI_PERIOD 50  // mSec

#define BT_LE_ADV_NCONN2 BT_LE_ADV_PARAM(4, BT_GAP_ADV_FAST_INT_MIN_2, \
                                        BT_GAP_ADV_FAST_INT_MAX_2, NULL)


extern void rpi_init(u8_t *rpi);
extern void rpi_update(u8_t *rpi);

struct device *i2c_dev;
/*
struct bt_le_scan_param scan_param = {
    .type       = BT_HCI_LE_SCAN_PASSIVE,
    .options    = BT_LE_SCAN_OPT_NONE,
    .interval   = 0x0010,
    .window     = 0x0010,
};
*/

void main(void)
{
    int err;
    /*
    led_init(&led1);
    led_init(&led2);
    led_init(&led3);
    led_init(&led4);
    for (int i=0; i<5; i++){
        flash(&led1);
        flash(&led2);
        flash(&led3);
        flash(&led4);
    }
    */
    int x=0;
    int y=0;

    struct mb_display *disp = mb_display_get();
                        struct mb_image pixel = {};
                        pixel.row[y] = BIT(x);
                        mb_display_image(disp, MB_DISPLAY_MODE_SINGLE,
                                         K_MSEC(1000), &pixel, 1);

    i2c_dev = device_get_binding(DT_ALIAS_I2C_0_LABEL);
    // i2c_dev = device_get_binding("LSM303AGR-ACCEL");
    // *mag_dev = device_get_binding("LSM303AGR-MAGN");

    if (i2c_dev == NULL) {
            printf("Could not get i2c device\n");
            return;
    }
    bt_set_name("COVID 19");
    printk("%s\n", bt_get_name());
    err = bt_enable(NULL);
    if (err) {
        printk("Bluetooth init failed (err %d)\n", err);
        return;
    }
    printk("Bluetooth initialized\n");

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
    err = bt_le_adv_start(BT_LE_ADV_NCONN2, encounter_ad,
                            ARRAY_SIZE(encounter_ad), NULL, 0);
    if (err) {
        printk("Advertising failed to start (err %d)\n", err);
        return;
    }
    int flash_counter = 0;
    pixel.row[y] = BIT(0);
    do {
        if (flash_counter==0) {
            mb_display_image(disp, MB_DISPLAY_MODE_SINGLE,
                    K_MSEC(RPI_PERIOD), &pixel, 1);
        } else {
            k_sleep(K_MSEC(RPI_PERIOD));
        }
        flash_counter++;
        flash_counter = flash_counter % 10;

        rpi_update(tcn);
        err = bt_le_adv_update_data(encounter_ad, ARRAY_SIZE(encounter_ad), NULL, 0);
        if (err) {
            printk("Advertising failed to stop (err %d)\n", err);
            return;
        }
        printk("Update rpi\n");
    } while (1);

}
