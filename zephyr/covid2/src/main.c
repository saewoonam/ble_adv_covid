/*
 * Copyright (c) 2019 Intel Corporation
 *
 * SPDX-License-Identifier: Apache-2.0
 */

/**
 * @file
 * @brief Sample echo app for CDC ACM class
 *
 * Sample app for USB CDC ACM class driver. The received data is echoed back
 * to the serial port.
 */

// Includes for bluetooth scan/adv
#include <zephyr/types.h>
#include <stddef.h>
#include <sys/printk.h>
#include <sys/util.h>

#include <bluetooth/bluetooth.h>
#include <bluetooth/hci.h>

// Includes for usbserial
#include <stdio.h>
#include <string.h>
#include <device.h>
#include <drivers/uart.h>
#include <zephyr.h>
#include <sys/ring_buffer.h>

#include <usb/usb_device.h>
#include <logging/log.h>

// Includes for led
#include "led.h"
#include <sys/__assert.h>
#define STACKSIZE 1024
#define PRIORITY 7
LOG_MODULE_REGISTER(cdc_acm_echo, LOG_LEVEL_INF);

#define RING_BUF_SIZE 1024
u8_t in_ring_buffer[RING_BUF_SIZE];
u8_t out_ring_buffer[RING_BUF_SIZE];
u8_t ring_buffer[RING_BUF_SIZE];

// globals for usbserial
struct ring_buf ringbuf;
struct device *dev;

struct device *led_dev;
bool led_is_on = true;
void led1_init(void)
{
    int ret;

    led_dev = device_get_binding(LED0);
    if (led_dev == NULL) {
        return;
    }

    ret = gpio_pin_configure(led_dev, PIN, GPIO_OUTPUT_ACTIVE | FLAGS);
    if (ret < 0) {
        return;
    }
    gpio_pin_set(led_dev, PIN, 0 );

}
void led1(u8_t blink) {
    while(blink--) {
        gpio_pin_set(led_dev, PIN, 1);
        k_msleep(10);
        gpio_pin_set(led_dev, PIN, 0);
    }
}

static void interrupt_handler(struct device *dev)
{
    while (uart_irq_update(dev) && uart_irq_is_pending(dev)) {
        if (uart_irq_rx_ready(dev)) {
            int recv_len, rb_len;
            u8_t buffer[64];
            size_t len = MIN(ring_buf_space_get(&ringbuf),
                     sizeof(buffer));

            recv_len = uart_fifo_read(dev, buffer, len);

            rb_len = ring_buf_put(&ringbuf, buffer, recv_len);
            if (rb_len < recv_len) {
                LOG_ERR("Drop %u bytes", recv_len - rb_len);
            }

            LOG_DBG("tty fifo -> ringbuf %d bytes", rb_len);

            uart_irq_tx_enable(dev);
        }

        if (uart_irq_tx_ready(dev)) {
            u8_t buffer[64];
            int rb_len, send_len;

            rb_len = ring_buf_get(&ringbuf, buffer, sizeof(buffer));
            if (!rb_len) {
                LOG_DBG("Ring buffer empty, disable TX IRQ");
                uart_irq_tx_disable(dev);
                continue;
            }

            send_len = uart_fifo_fill(dev, buffer, rb_len);
            if (send_len < rb_len) {
                LOG_ERR("Drop %d bytes", rb_len - send_len);
            }

            LOG_DBG("ringbuf -> tty fifo %d bytes", send_len);
        }
    }
}

void usb_printf(char *format, ...) {

  va_list arg;
  va_start(arg, format);
  int len;
  static char print_buffer[4096];

  len = vsnprintf(print_buffer, 4096,format, arg);
  va_end(arg);

  int num_written = 0;
  while (len - num_written > 0) {
    unsigned int key = irq_lock();
    num_written +=
      // ring_buf_put(&out_ringbuf,
      ring_buf_put(&ringbuf,
                   (print_buffer + num_written),
                   (len - num_written));
    irq_unlock(key);
    uart_irq_tx_enable(dev);
  }
}

static void usb_status_cb(enum usb_dc_status_code status, const u8_t *param)
{
    led1(10);
    switch (status) {
    case USB_DC_CONFIGURED:
        break;
    case USB_DC_SOF:
        break;
    default:
        LOG_DBG("status %u unhandled", status);
        break;
    }
}

void usbcdc_init(void)   // void main(void)
{
    // struct device *dev;
    u32_t baudrate, dtr = 0U;
    int ret;

    ret = usb_enable(usb_status_cb);
    if (ret != 0) {
        LOG_ERR("Failed to enable USB");
        return;
    }


    dev = device_get_binding("CDC_ACM_0");
    if (!dev) {
        LOG_ERR("CDC ACM device not found");
        return;
    }

    ring_buf_init(&ringbuf, sizeof(ring_buffer), ring_buffer);

    LOG_INF("Wait for DTR");

    while (true) {
        uart_line_ctrl_get(dev, UART_LINE_CTRL_DTR, &dtr);
        if (dtr) {
            break;
        } else {
            /* Give CPU resources to low priority threads. */
            k_sleep(K_MSEC(100));
        }
    }

    LOG_INF("DTR set");

    /* They are optional, we use them to test the interrupt endpoint */
    ret = uart_line_ctrl_set(dev, UART_LINE_CTRL_DCD, 1);
    if (ret) {
        LOG_WRN("Failed to set DCD, ret code %d", ret);
    }

    ret = uart_line_ctrl_set(dev, UART_LINE_CTRL_DSR, 1);
    if (ret) {
        LOG_WRN("Failed to set DSR, ret code %d", ret);
    }

    /* Wait 1 sec for the host to do all settings */
    k_busy_wait(1000000);

    ret = uart_line_ctrl_get(dev, UART_LINE_CTRL_BAUD_RATE, &baudrate);
    if (ret) {
        LOG_WRN("Failed to get baudrate, ret code %d", ret);
    } else {
        LOG_INF("Baudrate detected: %d", baudrate);
    }

    uart_irq_callback_set(dev, interrupt_handler);

    /* Enable rx interrupts */
    uart_irq_rx_enable(dev);
}
/*
static u8_t adv_header[] = { 0x02, 0x0A, 0x04,
                             0x02, 0x01, 0x06,
                             0x03, 0x03, 0x6F, 0xFD,
                             0x13, 0x16, 0x6F, 0xFD
};
*/
u8_t *rpi;

/*
static void add_rpi(u8_t *data) {
    for (u8_t i=0; i<16; i++) {
        data[i] = 15-i;
    }
}

static void build_adv(void) {
    memcpy(adv, adv_header, 14);
}
*/
// static const struct bt_data ad[] = {
struct bt_data ad[] = {
    BT_DATA_BYTES(BT_DATA_FLAGS, BT_LE_AD_NO_BREDR),
    BT_DATA_BYTES(BT_DATA_TX_POWER, 0),
    BT_DATA_BYTES(BT_DATA_UUID16_ALL, 0x6F, 0xFD),
    BT_DATA_BYTES(BT_DATA_SVC_DATA16,
            0x6F, 0xFD,
            0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0)
            };
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
static void scan_cb(const bt_addr_le_t *addr, s8_t rssi, u8_t adv_type,
            struct net_buf_simple *buf)
{
    char buffer[60];
    u8_t uuid16[2]={0, 0};
    u8_t size = 0;

    u32_t timestamp = k_uptime_get_32();

    for (u8_t i=0; i<buf->len; i++) {
        size += sprintf(buffer+size, "%02x", buf->data[i]);
    }
    bt_data_parse(buf, data_cb, uuid16);
    if ((uuid16[0]==0x6F) && (uuid16[1]==0xFD)) {
        usb_printf("%ld, %d, %s\n", timestamp, rssi, buffer);
        // usb_printf("%02x %02x\n", uuid16[0], uuid16[1]);
    }
}

/*
K_THREAD_DEFINE(blink1_id, STACKSIZE, led1, NULL, NULL, NULL,
        PRIORITY, 0, 0);
*/
void main(void){
    struct bt_le_scan_param scan_param = {
        .type       = BT_HCI_LE_SCAN_PASSIVE,
        .options    = BT_LE_SCAN_OPT_NONE,
        .interval   = 0x0010,
        .window     = 0x0010,
    };
    int err;
    led1_init();
    // Try to start usb cdc interface

    // Need to program an interrupt system around the usb
    // If it detects USB, then to do an init... 
    // Right now, have to open usbserial to proceed with BT part afterwards
    usbcdc_init();

    // printk("Starting Scanner/Advertiser Demo\n");
    usb_printf("Starting Scanner/Advertiser Demo\n");

    /* Initialize the Bluetooth Subsystem */
    err = bt_enable(NULL);
    if (err) {
        printk("Bluetooth init failed (err %d)\n", err);
        return;
    }
    rpi = ad[3].data+2;
    rpi[15] = 0xC0;
    rpi[14] = 0x19;
    rpi[13] = 0;
    rpi[12] = 0;

    printk("Bluetooth initialized\n");

    err = bt_le_scan_start(&scan_param, scan_cb);
    if (err) {
        printk("Starting scanning failed (err %d)\n", err);
        return;
    }
    u32_t round=0;
    do {
        k_sleep(K_MSEC(400));
        // led1();

        /* Start advertising */
        // err = bt_le_adv_start(BT_LE_ADV_NCONN, adv, 30,
        err = bt_le_adv_start(BT_LE_ADV_NCONN, ad, ARRAY_SIZE(ad),
                      NULL, 0);
        if (err) {
            printk("Advertising failed to start (err %d)\n", err);
            return;
        }

        k_sleep(K_MSEC(4000));

        memcpy(rpi, &round, 4);  // try to copy round to lowest 4 bytes of rpi
        round++;
        err = bt_le_adv_stop();
        if (err) {
            printk("Advertising failed to stop (err %d)\n", err);
            return;
        }

    } while (1);
}


