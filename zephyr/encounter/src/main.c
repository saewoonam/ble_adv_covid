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

#include <time.h>
// includes for files
#include <fs/fs.h>
#include <fs/littlefs.h>
#include <storage/flash_map.h>
#ifdef ENCOUNTER
#include "encounter.h"
#endif
bool bt_started=false;
bool start_adv=false;
bool cdc_open=false;
bool write_flash=false;
bool flash_full=false;
bool show_raw=false;
bool show_binary=true;
bool show_kernel=false;
bool usb_error=false;

extern void button_init(void);
extern void bt_init(void);
extern void start_scan(void);
extern void stop_scan(void);
extern void bt_adv(void);
#define STACKSIZE 1024

struct bt_le_scan_param scan_param = {
    .type       = BT_HCI_LE_SCAN_PASSIVE,
    .options    = BT_LE_SCAN_OPT_NONE,
    .interval   = 0x0200,
    .window     = 0x0200,
};

#define RING_BUF_SIZE 1024
u8_t in_ring_buffer[RING_BUF_SIZE];
u8_t out_ring_buffer[RING_BUF_SIZE];
u8_t flash_ring_buffer[8192];

struct device *cdc_dev;
struct ring_buf inringbuf;
struct ring_buf outringbuf;
struct ring_buf flashringbuf;

struct device *button_dev;

#define MAX_PATH_LEN 255

#define LINE_LENGTH 100
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
extern void ls(void);
extern void encounter_info(void);

uint32_t minute_timestamp=0;

uint8_t private_key[32];
uint8_t public_key[32];
uint8_t shared_key[32];
uint32_t next_minute;
uint32_t epochtimesync;
uint32_t offsettime=0;
uint8_t saewoo_hack[2];
#ifdef ENCOUNTER
Encounter_record encounters[IDX_MASK+1];
#endif
uint32_t c_fifo_last_idx=0;
uint32_t p_fifo_start_idx=0;
uint32_t p_fifo_last_idx=0;

bool hide_mac = true;

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
// #define CHUNK 4000

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
    // delete file with "unlink"
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

void uart_print(char *buffer, int len){
    unsigned int key = irq_lock();
    ring_buf_put(&outringbuf, buffer, len);
    irq_unlock(key);
    uart_irq_tx_enable(cdc_dev);
}

void uart_printf(char *format, ...) {

    va_list arg;
    va_start(arg, format);
    int len;
    static char buffer[64];

    len = vsnprintf(buffer, 64,format, arg);

    unsigned int key = irq_lock();
    ring_buf_put(&outringbuf, buffer, len);
    irq_unlock(key);
    uart_irq_tx_enable(cdc_dev);
}

void write_time (uint32_t local, uint32_t rawtime) {
    int rc;
    char fname[MAX_PATH_LEN];
    struct fs_file_t time_file;

    snprintf(fname, sizeof(fname), "%s/timeinfo", mp->mnt_point);

    rc = fs_open(&time_file, fname);
    if (rc < 0) {
        uart_printf("FAIL: open %s: %d\n", fname, rc);
        return;
    }

    //     rc = fs_read(&file, &boot_count, sizeof(boot_count));
    //     printk("%s read count %u: %d\n", fname, boot_count, rc);

    rc = fs_write(&time_file, &local, sizeof(local));
    rc = fs_write(&time_file, &rawtime, sizeof(rawtime));
    rc = fs_close(&time_file);
}

void read_time(uint32_t *local, uint32_t *rawtime) {
    int rc;
    char fname[MAX_PATH_LEN];
    struct fs_file_t time_file;

    snprintf(fname, sizeof(fname), "%s/timeinfo", mp->mnt_point);

    rc = fs_open(&time_file, fname);
    if (rc < 0) {
        uart_printf("FAIL: open %s: %d\n", fname, rc);
        return;
    }

    rc = fs_read(&time_file, local, 4);
    rc = fs_read(&time_file, rawtime, 4);
    rc = fs_close(&time_file);

}

void got_g(void) {
    struct fs_file_t file;
    char line[128];
    char fname[MAX_PATH_LEN];
    int rc;
    int total_bytes = 0;
    int pos = 0;
    int record_length = 0;
    int out_len = 0;
    memset(line, 0, 128);

    if (show_binary) {
        record_length = 32;
    } else {
        record_length = 100;
    }

    snprintf(fname, sizeof(fname), "%s/encounters", mp->mnt_point);

    rc = fs_open(&file, fname);
    if (rc < 0) {
        printk("FAIL: open %s: %d\n", fname, rc);
        return;
    }
    printk("Opened file rc: %d\n", rc);
    int line_count = 0;
    while((rc = fs_read(&file, line, record_length))) {
        line[rc] = 0;
        if (rc == record_length) {
            unsigned int key = irq_lock();
            out_len = ring_buf_put(&outringbuf, line, rc);
            irq_unlock(key);
            uart_irq_tx_enable(cdc_dev);
            if (out_len < rc) {
                uart_printf("problem got_g, out_len: %d, line_len: %d\n", out_len, rc);
            }

            total_bytes += out_len;
            line_count++;
        }
    }
    pos = fs_tell(&file);
    rc = fs_close(&file);
    // printk("Close file rc: %d\n", rc);
    uart_printf("total_bytes: %d\n", total_bytes);
    // uart_print(line, rc);
}

void cleanup_cache(void) {
    int total_len;
    // unsigned int key;
    char buffer[64];
    int len;
    int record_length, number_of_events;
    if (show_binary) {
        record_length = 32;
    } else {
        record_length = 100;
    }

    total_len = ring_buf_get(&flashringbuf, flash_buffer, 4096);

    // len = sprintf(buffer, "total_written:  %d, total_cache: %d left: %d\n",
    //         total_written, total_cache, total_len);
    // uart_print(buffer, len);

    ring_buf_reset(&flashringbuf);

    number_of_events = total_len / record_length;
    total_len = number_of_events * record_length; 

    // len = sprintf(buffer, "len to write to file: %d\n", total_len);
    // uart_print(buffer, len);

    int len_written = fs_write(&encounter_file, flash_buffer, total_len);
    fs_sync(&encounter_file);
    total_written += len_written;

    len = sprintf(buffer, "cleanup cache total_written:  %d, total_cache: %d\n",
            total_written, total_cache);
    uart_print(buffer, len);
}
void flash_store(void) {
    Encounter_record *current_encounter;
    // uint32_t start = p_fifo_last_idx;
    uint32_t timestamp = k_uptime_get_32();
    uint32_t epoch_minute = ((timestamp-offsettime) / 1000 + epochtimesync)/60;
    /*
    uart_printf("epoch_minute: %d, p_idx: %d, c_idx: %d\n", epoch_minute,
                    p_fifo_last_idx, c_fifo_last_idx);
    */
    while (c_fifo_last_idx > p_fifo_last_idx) {

        current_encounter = encounters + (p_fifo_last_idx & IDX_MASK);
        // uart_printf("idx: %d, minute: %d\n", p_fifo_last_idx, current_encounter->minute);
        if (current_encounter->minute < epoch_minute) { // this is an old record write to flash
            uint32_t shared_key[32];
            // X25519_calc_shared_secret(shared_key, private_key, current_encounter->public_key);
            int len_written = fs_write(&encounter_file, (uint8_t *)current_encounter, 64);
            fs_sync(&encounter_file);
            total_written += len_written;

            p_fifo_last_idx++;
        } else {
            // uart_printf("Done flash_store looking back\n");
            return;
        }
    }
    // uart_printf("Done flash_store, after while\n");

}
void flash_store_old(void) {
    int space;
    int total_len = 0;
    int len_written;
    int CHUNK = 0;

    if (show_binary) {
        CHUNK = 2048;
    } else {
        CHUNK = 4000;
    }

    space = ring_buf_space_get(&flashringbuf);
    if (!write_flash) {
        if (space<8191) {
            cleanup_cache();
        }
    } else {
        ;
        /* char buffer[64]; */
        /* int len = sprintf(buffer, "flash_store: total_written:  %d, total_cache: %d\n", */
        /*         total_written, total_cache); */
        /* uart_print(buffer, len); */
        /*
        printk("Space: %d, total_written: %d, total_cache: %d\n", 
                space, total_written, total_cache);
                */
    } 
    if (space < (8191-CHUNK)) {
        flash(&led4);
        /*
        do {
            total_len += ring_buf_get(&flashringbuf, flash_buffer, CHUNK);
        } while (total_len<CHUNK);
        */
        total_len += ring_buf_get(&flashringbuf, flash_buffer, CHUNK);
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
    // int total_len, len_written;
            switch (c) {
                case 'y':  // start_scan
                    {
                    start_scan();
                    break;
                    }
                case 'x':  // stop_scan
                    {
                    stop_scan();
                    break;
                    }
                case 'v': // change scan params
                    {
                    uint16_t interval, window;
                    int len = 0;
                    do {
                        len += ring_buf_get(&inringbuf, (uint8_t *)&(interval)+len, 1);
                    } while (len < 2);
                    len =0;
                    do {
                        len += ring_buf_get(&inringbuf, (uint8_t *)&(window)+len, 1);
                    } while (len < 2);

                    // uart_printf("interval %u, window: %u\n", interval, window);
                    scan_param.interval = interval;
                    scan_param.window = window;
                    break;
                    }
                case 'e':  // resume adv thread
                    {
                    //  thread_resume/suspend doesn't seem to work
                    //k_thread_resume(bt_adv_id);
                    start_adv = true;
                    break;
                    }
                case 'd':  // suspend adv thread
                    {
                    //  thread_resume/suspend doesn't seem to work
                    //k_thread_suspend(bt_adv_id);
                    start_adv = false;
                    break;
                    }
                case 'i': 
                    {
                    uart_printf("start_adv:%d, raw:%d, binary:%d, write_flash:%d, hide:%d\n", 
                            start_adv, show_raw, show_binary, write_flash, hide_mac);
                    break;
                    }
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
                    show_raw = true ;
                    break;
                case 'z':  // Stop data on USB_SERIAL PORT
                    printk("got z\n");
                    show_raw = false ;
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
                    // No cleanup for encounter tracing
                    // cleanup_cache();


                    break;
                    }
                case 'f': // get info about flash and cache
                    {
                    char buffer[64];
                    int len = sprintf(buffer, "total_written:  %d, total_cache: %d\n",
                            total_written, total_cache);
                    uart_print(buffer, len);
                    break;
                    }
                case 'b':  // output data as binary
                    printk("got b\n");
                    show_binary = true ;
                    break;
                case 'n':  // output data as text
                    printk("got n\n");
                    show_binary = false ;
                    break;
                case 'u':  // get timestamp
                    {
                    uint32_t local, human;
                    read_time(&local, &human); 
                    uart_printf("%u, %u\n", local, human);
                    // printk("got u\n");
                    break;
                    }
                case 't':  // get timestamp
                    {
                    printk("got t\n");
                    int len = 0;
                    // char buffer[64];
                    uint32_t timestamp = k_uptime_get_32();
                    uint8_t *temp = (uint8_t *) &epochtimesync;
                    //  Have to get 1 byte at a time...
                    do {
                        len += ring_buf_get(&inringbuf, temp+len, 1);
                    } while (len < 4);

                    // len=sprintf(buffer, "%u, %u\n", epochtimesync, timestamp);
                    // uart_print(buffer, len);
                    write_time(timestamp, epochtimesync);
                    offsettime = timestamp;
                    struct tm ts;
                    time_t rawtime = (const time_t) epochtimesync;
                    ts = *gmtime(&rawtime);
                    int delta = 60 - ts.tm_sec;
                    if (delta <= 0) {
                        delta += 60;
                    }
                    next_minute = timestamp + delta * 1000;
                    /*
                    len = sprintf(buffer, "Day: %d Month: %d Year: %d\n",
                                    ts.tm_mday, ts.tm_mon, ts.tm_year);
                    uart_print(buffer, len);
                    uint32_t a, b;
                    read_time(&a, &b); 
                    uart_printf("%u, %u\n", a, b);
                    */
                    break;
                    }
                case 'j':
                    uart_printf("scan interval %u, window: %u\n", 
                            scan_param.interval, scan_param.window);
                    #ifdef ENCOUNTER
                    uart_printf("sizeof encounter struct: %d\n", sizeof(Encounter_record));
                    #endif
                    break;
                case 'a':
                    printk("got a\r");
                    uint32_t timestamp = k_uptime_get_32();
                    printk("timestamp: %d\r", timestamp);
                    unsigned int key = irq_lock();
                    ring_buf_put(&outringbuf,(uint8_t *) &timestamp, 4);
                    irq_unlock(key);
                    uart_irq_tx_enable(cdc_dev);
                    break;
                case 'o':
                    break;
                case 'p':
                    hide_mac = false;
                    break;
                case 'q':
                    hide_mac = true;
                    break;
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
    button_init();
    // printk("Starting Scanner/Advertiser Demo\n");
    ring_buf_init(&inringbuf, sizeof(in_ring_buffer), in_ring_buffer);
    ring_buf_init(&outringbuf, sizeof(out_ring_buffer), out_ring_buffer);
    ring_buf_init(&flashringbuf, sizeof(flash_ring_buffer), flash_ring_buffer);
    flash_init();
    for (int i=0; i<5; i++){
        flash(&led1);
    }
    // printk("Bluetooth initialized\n");
    bt_init();
    // start_adv = true;
    // There is a thread that runs the bt_adv
    // bt_adv();
    //
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
        if (write_flash) flash_store();
        k_sleep(K_MSEC(2000));

    }
}
