#include "led.h"

void led_init(struct led *led) {
    int ret;
    led->dev = device_get_binding(led->gpio_dev_name);
    __ASSERT(led->dev != NULL, "Error: didn't find %s device\n",
            led->gpio_dev_name);

    ret = gpio_pin_configure(led->dev, led->gpio_pin, led->gpio_flags);
    if (ret != 0) {
        printk("Error %d: failed to configure pin %d '%s'\n",
            ret, led->gpio_pin, led->gpio_pin_name);
    }
    gpio_pin_set(led->dev, led->gpio_pin, 0);
}

void blink(struct led *led, uint8_t blink) 
{
    while(blink--) {
        gpio_pin_set(led->dev, led->gpio_pin, 1);
        k_msleep(200);
        gpio_pin_set(led->dev, led->gpio_pin, 0);
        k_msleep(200);
    }
}

void flash(struct led *led)
{
    gpio_pin_set(led->dev, led->gpio_pin, 1);
    k_msleep(20);
    gpio_pin_set(led->dev, led->gpio_pin, 0);
}
