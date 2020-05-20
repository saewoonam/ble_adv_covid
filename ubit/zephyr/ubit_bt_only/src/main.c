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

#include <zephyr.h>
#include <device.h>
#include <drivers/uart.h>

bool bt_started=false;
bool start_adv=false;
bool cdc_open=false;
bool write_flash=false;
bool show_raw=true;
struct device *uart_dev;

extern void bt_init(void);
extern void start_scan(void);
extern void bt_adv(void);

struct bt_le_scan_param scan_param = {
    .type       = BT_HCI_LE_SCAN_PASSIVE,
    .options    = BT_LE_SCAN_OPT_NONE,
    .interval   = 0x0010,
    .window     = 0x0010,
};
uint8_t saewoo_hack[2];

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
    */
    struct uart_config cfg;
    int rc;
    // Setup output to usb-serial port on computer
    uart_dev = device_get_binding("UART_0");
    // Change baud rate to 9600 per DAP_link notes
    // https://tech.microbit.org/software/daplink-interface/
    rc = uart_config_get(uart_dev, &cfg);
    cfg.baudrate = 9600;
    rc = uart_configure(uart_dev, &cfg);
    // Start BT
    bt_init();
    start_adv = true;
    // printk("Bluetooth initialized\n");
    start_scan();
    bt_adv();
}
