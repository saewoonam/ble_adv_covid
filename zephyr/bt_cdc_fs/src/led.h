#ifndef _led_h
#define _led_h
#include <zephyr.h>
#include <device.h>
#include <devicetree.h>
#include <drivers/gpio.h>

struct led {
    const char *gpio_dev_name;
    const char *gpio_pin_name;
    unsigned int gpio_pin;
    unsigned int gpio_flags;
    struct device *dev;
};

#endif
extern struct led led1;
extern struct led led2;
extern struct led led3;
extern struct led led4;
extern void led_init(struct led *led);
extern void blink(struct led *led, uint8_t blink);
extern void flash(struct led *led);
