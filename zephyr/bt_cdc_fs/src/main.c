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

// includes for files
#include <fs/fs.h>
#include <fs/littlefs.h>
#include <storage/flash_map.h>

bool bt_started=false;
bool start_adv=false;
bool cdc_open=false;
bool write_flash=false;
bool flash_full=false;
bool show_raw=false;
bool show_kernel=false;
bool usb_error=false;

extern void bt_init(void);
extern void start_scan(void);
extern void bt_adv(void);
#define STACKSIZE 1024

struct bt_le_scan_param scan_param = {
    .type       = BT_HCI_LE_SCAN_PASSIVE,
    .options    = BT_LE_SCAN_OPT_NONE,
    .interval   = 0x0100,
    .window     = 0x0100,
};

#define RING_BUF_SIZE 1024
u8_t in_ring_buffer[RING_BUF_SIZE];
u8_t out_ring_buffer[RING_BUF_SIZE];
u8_t flash_ring_buffer[8192];

struct device *cdc_dev;
struct ring_buf inringbuf;
struct ring_buf outringbuf;
struct ring_buf flashringbuf;


#define MAX_PATH_LEN 255

#define LINE_LENGTH 108
FS_LITTLEFS_DECLARE_DEFAULT_CONFIG(storage);
static struct fs_mount_t lfs_storage_mnt = {
.type = FS_LITTLEFS,
.fs_data = &storage,
.storage_dev = (void *)DT_FLASH_AREA_STORAGE_ID,
.mnt_point = "/lfs",
};

struct fs_mount_t *mp = &lfs_storage_mnt;
struct fs_file_t encounter_file;
extern int flash_init(void);
extern void flash_close(void);
// extern void clear_encounter(void);
extern void ls(void);
extern void encounter_info(void);

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

u8_t flash_buffer[4096];
int total_written=0;
int total_cache=0;
#define CHUNK 4000

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

void clear_encounter(void) {
    int rc;
    char fname[MAX_PATH_LEN];
    bool pause = write_flash;

    write_flash = false;
    //  Wait to finish any writes...

    //
    snprintf(fname, sizeof(fname), "%s/encounters", mp->mnt_point);
    rc = fs_close(&encounter_file);
    printk("close rc: %d\n", rc);
    rc = fs_unlink(fname);
    printk("unlink rc: %d\n", rc);

    rc = fs_open(&encounter_file, fname);
    if (rc < 0) {
        printk("FAIL: open %s: %d\n", fname, rc);
        return;
    }
    write_flash = pause;
    flash_full = false;
}

void got_g(void) {
    struct fs_file_t file;
    char line[1024];
    char fname[MAX_PATH_LEN];
    int rc;
    memset(line, 0, 1024);

    snprintf(fname, sizeof(fname), "%s/encounters", mp->mnt_point);

    rc = fs_open(&file, fname);
    if (rc < 0) {
        printk("FAIL: open %s: %d\n", fname, rc);
        return;
    }
    printk("Opened file rc: %d\n", rc);
    while((rc = fs_read(&file, line, LINE_LENGTH))) {
        // printk("Read file rc: %d:%s", rc, line);
        line[rc] = 0;
        // usb_printf("%s", line);
        unsigned int key = irq_lock();
        int out_len = ring_buf_put(&outringbuf, line, rc);
        irq_unlock(key);
        if (out_len < rc) {
            printk("Problem writing to uart/cdc\n");
        }
        // printk("out_len: %d\n", out_len);
        uart_irq_tx_enable(cdc_dev);
    }
    rc = fs_close(&file);
    printk("Close file rc: %d\n", rc);
}

void flash_store(void) {
    int space;
    int total_len = 0;
    int len_written;


    space = ring_buf_space_get(&flashringbuf);
    if (write_flash) {
        printk("Space: %d, total_written: %d, total_cache: %d\n", 
                space, total_written, total_cache);
    } 
    if (space < (8191-CHUNK)) {
        flash(&led4);
        do {
            total_len += ring_buf_get(&flashringbuf, flash_buffer, CHUNK);
        } while (total_len<CHUNK);
        len_written = fs_write(&encounter_file, flash_buffer, CHUNK);
        fs_sync(&encounter_file);
        total_written += len_written;
        printk("Space: %d, total_written: %d, total_cache: %d\n", 
                space, total_written, total_cache);
        if (len_written < CHUNK) {
            printk("Disk full???\n");
        }
    }
}

void parse_command(char c) {
    int total_len, len_written;
            switch (c) {
                case 'g':  // Get all data from FLASH
                    {
                    printk("got g\n");
                    got_g();
                    break;
                    }
                case 'c':  // Clear flash memory
                    {
                    printk("got c\n");
                    clear_encounter();
                    // clear variable keeping track of what is written
                    total_written = 0;
                    total_cache = 0;
                    printk("done clear\n");
                    break;
                    }
                case 'k':  // Show data on printk/debugger
                    printk("got k\n");
                    show_kernel = !show_kernel ;
                    break;
                case 'r':  // Show data on USB_SERIAL PORT
                    printk("got r\n");
                    show_raw = !show_raw ;
                    break;
                case 'l':  // list files to debugger
                    {
                    printk("got l\n");
                    ls();
                    break;
                    }
                case 'w':  // Write data to flash
                    printk("got w\n");
                    write_flash = true ;
                    break;
                case 's':  // Stop write data to flash
                    {
                    printk("got s\n");
                    write_flash = false;
                    // Need to wait to finish all writes to ringbuffer
                    k_sleep(K_MSEC(200));
                    // Need to dump everything in flash_buffer to flash
                    total_len = ring_buf_get(&flashringbuf, flash_buffer, 4096);
                    while (total_len>0){
                        len_written = fs_write(&encounter_file,
                                flash_buffer, total_len);
                        fs_sync(&encounter_file);
                        total_len = ring_buf_get(&flashringbuf, flash_buffer, 4096);
                        total_written += len_written;
                    }
                    printk("total_written:  %d, total_cache: %d\n",
                            total_written, total_cache);
                    encounter_info();

                    break;
                    }
                default:
                    {
                    printk("got %c, not defined\n", c);
                    break;
                    }
            }
}

void main(void)
{
    // int err;
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
    ring_buf_init(&inringbuf, sizeof(in_ring_buffer), in_ring_buffer);
    ring_buf_init(&outringbuf, sizeof(out_ring_buffer), out_ring_buffer);
    ring_buf_init(&flashringbuf, sizeof(flash_ring_buffer), flash_ring_buffer);
    flash_init();
    // printk("Bluetooth initialized\n");
    bt_init();
    start_adv = true;
    // bt_adv();
    start_scan();
    cdc_init();
    usb_init();
    dtr_init();
    cdc_open=true;
    u8_t c;

    while (true) {
        while(ring_buf_get(&inringbuf, &c, 1)){
            parse_command(c);
        }
        flash_store();
        k_sleep(K_MSEC(200));

    }
}

/* scratch work
 *
                    char buffer[64];
                    int len=sprintf(buffer, "%d: got l\n", counter++);
                    // printk("Trying to send: %s", buffer);

                    unsigned int key = irq_lock();
                    int out_len = ring_buf_put(&outringbuf, buffer, len);
                    irq_unlock(key);
                    // printk("out_len: %d\n", out_len);
                    uart_irq_tx_enable(cdc_dev);
                    // cdc_printf("%d: got l\n", counter++);

 *
 */

