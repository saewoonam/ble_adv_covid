#include "led.h"
#include <stdio.h>
#include <string.h>
#include <sys/ring_buffer.h>
#include <drivers/uart.h>

extern struct device *cdc_dev;
extern struct ring_buf outringbuf;

extern struct device *button_dev;

void button_pressed(struct device *dev, struct gpio_callback *cb,
            u32_t pins)
{
    char buffer[40];
    sprintf(buffer, "Button\n");
    ring_buf_put(&outringbuf, buffer, strlen(buffer));
    uart_irq_tx_enable(cdc_dev);
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

