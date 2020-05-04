/* main.c - Application main entry point */

/*
 * Copyright (c) 2015-2016 Intel Corporation
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <zephyr/types.h>
#include <stddef.h>
#include <sys/printk.h>
#include <sys/util.h>

#include <bluetooth/bluetooth.h>
#include <bluetooth/hci.h>

#include "led.h"
#include "led_global.h"
#include "stdio.h"

#include <sys/ring_buffer.h>
#include <usb/usb_device.h>
#include <drivers/uart.h>

bool bt_started=false;
bool start_adv=false;
bool cdc_open=false;
bool write_flash=false;
bool show_raw=false;
bool usb_error=false;

extern void bt_init(void);
extern void start_scan(void);
extern void bt_adv(void);
#define STACKSIZE 1024

struct bt_le_scan_param scan_param = {
    .type       = BT_HCI_LE_SCAN_PASSIVE,
    .options    = BT_LE_SCAN_OPT_NONE,
    .interval   = 0x0010,
    .window     = 0x0010,
};

#define RING_BUF_SIZE 1024
u8_t in_ring_buffer[RING_BUF_SIZE];
u8_t out_ring_buffer[RING_BUF_SIZE];

struct device *cdc_dev;
struct ring_buf inringbuf;
struct ring_buf outringbuf;

void cdc_init(void)
{
    printk("cdc_init\n");
    cdc_dev = device_get_binding("CDC_ACM_0");
    if (!cdc_dev) {
        printk("CDC ACM device not found\n");
        return;
    }
}
void usb_init(void) {
    // ret = usb_enable(usb_status_cb);
    int ret = usb_enable(NULL);
    printk("usb_init\n");
    if (ret != 0) {
        printk("Failed to enable USB\n");
        return;
    }
}

K_THREAD_DEFINE(bt_adv_id, STACKSIZE, bt_adv, NULL, NULL, NULL,
            3, 0, 0);

static void cdc_interrupt_handler(struct device *dev)
{
    while (uart_irq_update(dev) && uart_irq_is_pending(dev)&&(usb_error==0)) {
        if (uart_irq_rx_ready(dev)) {
            int recv_len, rb_len;
            u8_t buffer[64];
            size_t len = MIN(ring_buf_space_get(&inringbuf),
                     sizeof(buffer));

            recv_len = uart_fifo_read(dev, buffer, len);

            rb_len = ring_buf_put(&inringbuf, buffer, recv_len);
            if (rb_len < recv_len) {
                printk("Drop %u bytes\n", recv_len - rb_len);
            }

            // LOG_DBG("tty fifo -> inringbuf %d bytes", rb_len);
        }

        if (uart_irq_tx_ready(dev)) {
            u8_t buffer[64];
            int rb_len, send_len;

            unsigned int key = irq_lock();
            rb_len = ring_buf_get(&outringbuf, buffer, sizeof(buffer));
            irq_unlock(key);
            if (!rb_len) {
                // LOG_DBG("Ring buffer empty, disable TX IRQ");
                uart_irq_tx_disable(dev);
                continue;
            }

            send_len = uart_fifo_fill(dev, buffer, rb_len);
            if (send_len < rb_len) {
                printk("Drop %d bytes\n", rb_len - send_len);
            }

            // LOG_DBG("outringbuf -> tty fifo %d bytes", send_len);
        }
    }
}
void dtr_init(void) {
    u32_t baudrate, dtr = 0U;
    int ret;

    printk("Wait for DTR");
    while (true) {
        uart_line_ctrl_get(cdc_dev, UART_LINE_CTRL_DTR, &dtr);
        if (dtr) {
            break;
        } else {
            /* Give CPU resources to low priority threads. */
            k_sleep(K_MSEC(100));
        }
    }
    printk("DTR set");

    /* They are optional, we use them to test the interrupt endpoint */
    ret = uart_line_ctrl_set(cdc_dev, UART_LINE_CTRL_DCD, 1);
    if (ret) {
        printk("Failed to set DCD, ret code %d", ret);
    }

    ret = uart_line_ctrl_set(cdc_dev, UART_LINE_CTRL_DSR, 1);
    if (ret) {
        printk("Failed to set DSR, ret code %d", ret);
    }

    /* Wait 1 sec for the host to do all settings */
    k_busy_wait(1000000);

    ret = uart_line_ctrl_get(cdc_dev, UART_LINE_CTRL_BAUD_RATE, &baudrate);
    if (ret) {
        printk("Failed to get baudrate, ret code %d", ret);
    } else {
        printk("Baudrate detected: %d\n", baudrate);
    }

    uart_irq_callback_set(cdc_dev, cdc_interrupt_handler);

    /* Enable rx interrupts */
    uart_irq_rx_enable(cdc_dev);
}
void main(void)
{
    // int err;
    led_init(&led1);
    led_init(&led2);
    // led_init(&led3);
    // led_init(&led4);
    for (int i=0; i<5; i++){
        flash(&led1);
        flash(&led2);
        //flash(&led3);
        //flash(&led4);
    }
    // printk("Starting Scanner/Advertiser Demo\n");
    ring_buf_init(&inringbuf, sizeof(in_ring_buffer), in_ring_buffer);
    ring_buf_init(&outringbuf, sizeof(out_ring_buffer), out_ring_buffer);

    bt_init();
    start_adv = true;
    // printk("Bluetooth initialized\n");
    start_scan();
    // bt_adv();
    cdc_init();
    usb_init();
    dtr_init();
    cdc_open=true;
    u8_t c;
    int counter = 0;

    while (true) {
        while(ring_buf_get(&inringbuf, &c, 1)){
            switch (c) {
                case 'g':  // Get all data from FLASH
                    {
                    printk("got g\n");
                    // got_g();
                    break;
                    }
                case 'c':  // Clear flash memory
                    {
                    printk("got c\n");
                    // clear_encounter();
                    break;
                    }
                case 'r':  // Show data on USB_SERIAL PORT
                    printk("got r\n");
                    show_raw = true ;
                    break;
                case 'z':  // Show data on USB_SERIAL PORT
                    printk("got z\n");
                    show_raw = false ;
                    break;
                case 'l':  // list files to debugger
                    {
                    printk("got l\n");
                    char buffer[64];
                    int len=sprintf(buffer, "%d: got l\n", counter++);
                    // printk("Trying to send: %s", buffer);

                    unsigned int key = irq_lock();
                    int out_len = ring_buf_put(&outringbuf, buffer, len);
                    irq_unlock(key);
                    // printk("out_len: %d\n", out_len);
                    uart_irq_tx_enable(cdc_dev);
                    // cdc_printf("%d: got l\n", counter++);
                    // ls();
                    break;
                    }
                case 'w':  // Write data to flash
                    printk("got w\n");
                    // write_flash = true ;
                    break;
                case 's':  // Stop write data to flash
                    {
                    printk("got s\n");
                    // write_flash = false;
                    // encounter_info();
                    break;
                    }
                default:
                    {
                    printk("got %c, not defined\n", c);
                    break;
                    }
            }
        }
        k_sleep(K_MSEC(200));

    }
}
