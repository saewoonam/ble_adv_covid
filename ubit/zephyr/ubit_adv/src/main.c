/* main.c - Application main entry point */

/*
 * Copyright (c) 2015-2016 Intel Corporation
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <zephyr/types.h>
#include <stddef.h>
// #include <sys/printk.h>
#include <sys/util.h>

#include <bluetooth/bluetooth.h>
#include <bluetooth/hci.h>

bool bt_started=false;
bool start_adv=false;
bool cdc_open=false;
bool write_flash=false;
bool show_raw=false;

extern void bt_init(void);
extern void bt_adv(void);

struct bt_le_scan_param scan_param = {
    .type       = BT_HCI_LE_SCAN_PASSIVE,
    .options    = BT_LE_SCAN_OPT_NONE,
    .interval   = 0x0010,
    .window     = 0x0010,
};

void main(void)
{
    // int err;
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
    // printk("Starting Scanner/Advertiser Demo\n");
    */
    bt_init();
    start_adv = true;
    // printk("Bluetooth initialized\n");
    bt_adv();
}
