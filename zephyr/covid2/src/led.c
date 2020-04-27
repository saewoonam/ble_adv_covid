#include "led.h"

void led_init(void)
{
    int ret;

    led0_dev = device_get_binding(LED0);
    if (led0_dev == NULL) {
        return;
    }
    ret = gpio_pin_configure(led0_dev, PIN, GPIO_OUTPUT_ACTIVE | FLAGS);
    if (ret < 0) {
        return;
    }
    gpio_pin_set(led0_dev, PIN, 0 );
}

void blink_led(struct device *led_dev, u8_t blink) {
    while(blink--) {
        gpio_pin_set(led_dev, PIN, 1);
        k_msleep(200);
        gpio_pin_set(led_dev, PIN, 0);
        k_msleep(200);
    }
}


