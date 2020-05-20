/* main.c - Application main entry point */

/*
 * Copyright (c) 2020 Sae Woo Nam
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

#include <drivers/gpio.h>
#include <sys/util.h>
#include <inttypes.h>

#include <display/mb_display.h>

bool bt_started=false;
bool start_adv=false;
bool cdc_open=false;
bool write_flash=false;
bool show_raw=false;
struct device *uart_dev;
struct device *i2c_dev;
struct mb_display *disp;

extern void bt_init(void);
extern void start_scan(void);
extern void bt_adv(void);

struct bt_le_scan_param scan_param = {
    .type       = BT_HCI_LE_SCAN_PASSIVE,
    .options    = BT_LE_SCAN_OPT_NONE,
    .interval   = 0x0010,
    .window     = 0x0010,
};

uint8_t saewoo_hack[2] = {0xDE, 0xAD};
struct device *button_dev;
extern void uart_print(struct device *dev, char *buffer);

void button_pressed(struct device *dev, struct gpio_callback *cb,
            u32_t pins)
{
    struct mb_image pixel = {};
    pixel.row[4] = BIT(0);

    uart_print(uart_dev, "button\n");
    start_adv = !start_adv;
    mb_display_image(disp, MB_DISPLAY_MODE_SINGLE,
            K_MSEC(50), &pixel, 1);
    
}

void button_init(void){
    int ret;
    static struct gpio_callback button_cb_data;

    button_dev = device_get_binding(DT_ALIAS_SW0_GPIOS_CONTROLLER);
    if (button_dev == NULL) {
        return;
    }

    ret = gpio_pin_configure(button_dev, DT_ALIAS_SW0_GPIOS_PIN,
                 DT_ALIAS_SW0_GPIOS_FLAGS | GPIO_INPUT);
    if (ret != 0) {
        return;
    }

    ret = gpio_pin_interrupt_configure(button_dev, DT_ALIAS_SW0_GPIOS_PIN,
                       GPIO_INT_EDGE_TO_ACTIVE);
    if (ret != 0) {
        return;
    }

    gpio_init_callback(&button_cb_data, button_pressed,
               BIT(DT_ALIAS_SW0_GPIOS_PIN));
    gpio_add_callback(button_dev, &button_cb_data);

}


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

    int x=0;
    int y=0;
    disp = mb_display_get();
    struct mb_image pixel = {};
    pixel.row[y] = BIT(x);
    mb_display_image(disp, MB_DISPLAY_MODE_SINGLE,
                     K_MSEC(1000), &pixel, 1);

    i2c_dev = device_get_binding(DT_ALIAS_I2C_0_LABEL);
    // i2c_dev = device_get_binding("LSM303AGR-ACCEL");
    // *mag_dev = device_get_binding("LSM303AGR-MAGN");

    if (i2c_dev == NULL) {
            // printf("Could not get i2c device\n");
            return;
    }
    // Setup output to usb-serial port on computer
    uart_dev = device_get_binding("UART_0");
    // Change baud rate to 9600 per DAP_link notes
    // https://tech.microbit.org/software/daplink-interface/
    rc = uart_config_get(uart_dev, &cfg);
    cfg.baudrate = 9600;
    rc = uart_configure(uart_dev, &cfg);
    button_init();
    // Start BT
    bt_init();
    start_adv = true;
    // printk("Bluetooth initialized\n");
    start_scan();
    bt_adv();
}
