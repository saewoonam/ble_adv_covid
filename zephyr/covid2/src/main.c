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
#include <string.h>

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
struct ring_buf inringbuf;
struct ring_buf outringbuf;
struct device *dev;

struct device *led0_dev;
struct device *led1_dev;
bool led_is_on = true;
bool usb_error = false;
bool cdc_open = false;
bool show_raw = false;
// globals for bt
bool bt_started = true;
bool start_adv = false;

void usb_printf(char *format, ...) {
    va_list arg;
    va_start(arg, format);
    int len;
    static char print_buffer[4096];

    len = vsnprintf(print_buffer, 4096,format, arg);
    va_end(arg);
    if (cdc_open) {
        int num_written = 0;
        while (len - num_written > 0) {
        unsigned int key = irq_lock();
        num_written +=
          ring_buf_put(&outringbuf,
                       (print_buffer + num_written),
                       (len - num_written));
        irq_unlock(key);
        uart_irq_tx_enable(dev);
        }
    } else {printk("cdc_open is false: %s\n", print_buffer);}
}

static void interrupt_handler(struct device *dev)
{
    // while (uart_irq_update(dev) && uart_irq_is_pending(dev)) {
    // while (uart_irq_update(dev) && uart_irq_is_pending(dev) && (usb_error==0)) {
    LOG_INF("uart_interrupt: %d, %d", uart_irq_update(dev), uart_irq_is_pending(dev));
    while (uart_irq_update(dev) && uart_irq_is_pending(dev) && (usb_error==0)) {
        if (uart_irq_rx_ready(dev)) {
            LOG_INF("Read from uart");
            int recv_len, rb_len;
            u8_t buffer[64];
            size_t len = MIN(ring_buf_space_get(&inringbuf),
                     sizeof(buffer));
            unsigned int key = irq_lock();
            recv_len = uart_fifo_read(dev, buffer, len);
            irq_unlock(key);

            rb_len = ring_buf_put(&inringbuf, buffer, recv_len);
            if (rb_len < recv_len) {
                LOG_ERR("Drop %u bytes", recv_len - rb_len);
                usb_error = true;
            }

            LOG_INF("tty fifo -> inringbuf %d bytes", rb_len);
            //  Don't echo to tx
            //  uart_irq_tx_enable(dev);
        }

        if (uart_irq_tx_ready(dev)) {
            LOG_INF("Write to uart");
            u8_t buffer[64];
            int rb_len, send_len;

            rb_len = ring_buf_get(&outringbuf, buffer, sizeof(buffer));
            if (!rb_len) {
                LOG_INF("Ring buffer empty, disable TX IRQ");
                uart_irq_tx_disable(dev);
                continue;
            }

            send_len = uart_fifo_fill(dev, buffer, rb_len);
            if (send_len < rb_len) {
                LOG_ERR("Drop %d bytes", rb_len - send_len);
                usb_error = true;
            }

            LOG_INF("outringbuf -> tty fifo %d bytes", send_len);
        }
    }
}

bool first_time = true;
extern void usbcdc_wait_dtr(void);
extern void cdc_init(void);
extern void usb_init(void);

static void usb_status_cb(enum usb_dc_status_code status, const u8_t *param)
{
    LOG_INF("cb status: %u, first_time: %d", status, first_time);

    blink_led(led0_dev, 1);
    switch (status) {
        case USB_DC_ERROR:
            break;
        case USB_DC_RESET:
            {
            // LOG_INF("USB_DC_RESET\n");
            if(first_time) {
                LOG_INF("first time\n");
                first_time = false;
            }
            }
        case USB_DC_CONNECTED:
            {
            // printk("USB_DC_CONNECTED\n");
            if(first_time) {
                printk("first time\n");
                // usbcdc_wait_dtr();
                first_time = false;
            }

            }
        case USB_DC_CONFIGURED:
            //printk("CONIFGURED AND CDC OPEN set\n");
            cdc_open = true;
            break;
        case USB_DC_DISCONNECTED:
            {
            // printk("USB_DC_DISCONNECTED\n");
            cdc_open = false;
            // printk("CDC CLOSED\n");
            if (usb_error) {
                printk("Do RESET\n");
                usb_error = false;
                sys_arch_reboot(0);
                //  Reset is not enough

                // usb_dc_reset();
                /* 
                usb_dc_ep_flush(0x81);
                usb_dc_ep_flush(0x03);
                usb_dc_ep_flush(0x01);
                usb_dc_ep_flush(0x82);
                usb_dc_ep_disable(0x81);
                usb_dc_ep_disable(0x01);
                usb_dc_ep_disable(0x82);
                LOG_INF("Try to disable");
                usb_disable();
                usb_enable(usb_status_cb);
                */
                /*
                usb_dc_ep_clear_stall(0x81);
                usb_dc_ep_clear_stall(0x03);
                usb_dc_ep_clear_stall(0x82);
                */
                /*
                usb_disable();
                */
            }
            }
        case USB_DC_SUSPEND:
            // printk("USB_DC_SUSPEND\n");
            break;
        case USB_DC_RESUME:
            // printk("USB_DC_RESUME\n");
            break;
        case USB_DC_SOF:
            break;
        default:
            LOG_INF("status %u unhandled", status);
            break;
    }
}
void usb_init(void)   // void main(void)
{
    int ret;

    ret = usb_enable(usb_status_cb);
    if (ret != 0) {
        LOG_ERR("Failed to enable USB");
        return;
    }
    LOG_INF("enabled usb");
}
void cdc_init(void) {
    // struct device *dev;
    dev = device_get_binding("CDC_ACM_0");
    if (!dev) {
        LOG_ERR("CDC ACM device not found");
        return;
    }
    LOG_INF("create cdc device");
}

void dtr_init(void) {
    u32_t dtr = 0U;

    LOG_INF("Wait for DTR in usbcdc_init");
    while (true) {
        uart_line_ctrl_get(dev, UART_LINE_CTRL_DTR, &dtr);
        if (dtr) {
            break;
        } else {
            // Give CPU resources to low priority threads. 
            k_sleep(K_MSEC(100));
        }
    }
    LOG_INF("DTR set");
}

void uart_init(){
    int ret;
    u32_t baudrate;

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

u8_t *rpi;

struct bt_data encounter_ad[] = {
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
        char addr_string[BT_ADDR_LE_STR_LEN];
        bt_addr_le_to_str(addr, addr_string, sizeof(addr_string));
        if (show_raw && cdc_open) {
            usb_printf("%u, %d, %s, %s\n", timestamp, rssi, addr_string, buffer);
        }
        /*
        char log_buffer[128];
        sprintf(log_buffer, "%u, %d\n", timestamp, rssi);
        printk("%s", log_buffer);
        */
    }
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
void rpi_init(void) {
    rpi = encounter_ad[3].data+2; // 4th item in array of messages is RPI
    rpi[15] = 0xC0;
    rpi[14] = 0x19;
    rpi[13] = 0;
    rpi[12] = 0;
}
void bt_adv (void) {
    while (!start_adv) {
        printk("BT not started\n");
        k_sleep(K_MSEC(1000));
    } 
    printk("Trying to start advertising\n");
    rpi_init();
    u32_t round=0;
    k_sleep(K_MSEC(400));

    /* Start advertising */
    /*
     *
     *  We will move start into the loop to change the address repeatably
     *  For now, outside the loop so that it is easier to debug and use in BT
     *  tests
     *
     */
    int err = bt_le_adv_start(BT_LE_ADV_NCONN, encounter_ad,
                            ARRAY_SIZE(encounter_ad), NULL, 0);
    if (err) {
        printk("Advertising failed to start (err %d)\n", err);
        return;
    }

    do {

        k_sleep(K_MSEC(4000));

        memcpy(rpi, &round, 4);  // try to copy round to lowest 4 bytes of rpi
        round++;
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

void start_scan(void) {
    //  Start Scan
    struct bt_le_scan_param scan_param = {
        .type       = BT_HCI_LE_SCAN_PASSIVE,
        .options    = BT_LE_SCAN_OPT_NONE,
        .interval   = 0x0010,
        .window     = 0x0010,
    };
    int err = bt_le_scan_start(&scan_param, scan_cb);
    if (err) {
        printk("Starting scanning failed (err %d)\n", err);
        return;
    } else {
        printk("Scan started\n");
    }

}

/*
K_THREAD_DEFINE(bt_adv_id, STACKSIZE, bt_adv, NULL, NULL, NULL,
            3, 0, 0);
*/
void main(void){
    // ring_buf_init(&ringbuf, sizeof(ring_buffer), ring_buffer);
    ring_buf_init(&inringbuf, sizeof(in_ring_buffer), in_ring_buffer);
    ring_buf_init(&outringbuf, sizeof(out_ring_buffer), out_ring_buffer);
    led_init();
    bt_init();
    
    cdc_init();
    usb_init();
    // start_adv = true;
    dtr_init();
    uart_init();

    start_scan();
    u8_t c, idx;

    while (true) {
        while(ring_buf_get(&inringbuf, &c, 1)){
            switch (c) {
                case 'g':
                    LOG_INF("got g");
                    break;
                case 'c':
                    LOG_INF("got c");
                    break;
                case 'r':
                    LOG_INF("got r");
                    show_raw = !show_raw ;
                    break;
            }
        }
        k_sleep(K_MSEC(500));

    }
}

