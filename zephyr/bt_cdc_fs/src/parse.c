#include <sys/ring_buffer.h>
#include <bluetooth/bluetooth.h>
#include <time.h>
#include <drivers/uart.h>

extern void start_scan(void);
extern void stop_scan(void);
extern void ls(void);

extern void clear_encounter(void);

extern void uart_printf(char *format, ...);
extern void write_time (uint32_t local, uint32_t rawtime);
extern void read_time(uint32_t *local, uint32_t *rawtime);
extern void got_g(void);
extern void cleanup_cache(void);

extern struct bt_le_scan_param scan_param;

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
extern struct ring_buf inringbuf;
extern struct ring_buf flashringbuf;
extern struct fs_file_t encounter_file;
extern int total_cache;
extern int total_written;
extern uint32_t next_minute;
extern uint32_t epochtimesync;
extern uint32_t offsettime;

extern bool hide_mac;
extern int ret_flash;
extern uint8_t mac_addr[6];

void parse_command(char c) {
    const char *version_str = "Version: " __DATE__ " " __TIME__;
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
                    cleanup_cache();
                    // encounter_info();

                    break;
                    }
                case 'f': // get info about flash and cache
                    {
                    char buffer[64];
                    // int len = sprintf(buffer, "init: %d, total_written:  %d, total_cache: %d\n",
                    uart_printf(buffer, "init: %d, total_written:  %d, total_cache: %d\n",
                            ret_flash, total_written, total_cache);
                    // uart_print(buffer, len);
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
                    {
                    printk("got a\r");
                    uint32_t timestamp = k_uptime_get_32();
                    printk("timestamp: %d\r", timestamp);
                    unsigned int key = irq_lock();
                    ring_buf_put(&outringbuf,(uint8_t *) &timestamp, 4);
                    irq_unlock(key);
                    uart_irq_tx_enable(cdc_dev);
                    break;
                    }
                case 'h':
                    uart_printf("%s\n", version_str);
                    break;
                case 'm': // Send MAC address
                    {
                    unsigned int key = irq_lock();
                    ring_buf_put(&outringbuf,(uint8_t *) mac_addr, 6);
                    irq_unlock(key);
                    uart_irq_tx_enable(cdc_dev);
                    break;
                    }
                case 'o':
                    {
                    // uint32_t epochtimesync;
                    // uint32_t offsettime;
                    int len=0;
                    uint8_t *temp;
                    temp = (uint8_t *) &epochtimesync;
                    //  Have to get 1 byte at a time...
                    do {
                        len += ring_buf_get(&inringbuf, temp+len, 1);
                    } while (len < 4);
                    len = 0;
                    temp = (uint8_t *) &offsettime;
                    //  Have to get 1 byte at a time...
                    do {
                        len += ring_buf_get(&inringbuf, temp+len, 1);
                    } while (len < 4);
                    uart_printf("%u %u\n", epochtimesync, offsettime);
                    write_time(offsettime, epochtimesync);
                    break;
                    }
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

