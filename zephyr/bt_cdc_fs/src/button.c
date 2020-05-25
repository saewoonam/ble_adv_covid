#include "led.h"
#include <stdio.h>
#include <string.h>
#include <sys/ring_buffer.h>
#include <drivers/uart.h>
#include <fs/fs.h>
#include <fs/littlefs.h>
#include <storage/flash_map.h>

extern struct device *cdc_dev;
extern struct ring_buf outringbuf;

extern struct device *button_dev;
extern bool write_flash;
extern int total_written;
extern int total_cache;
extern struct ring_buf flashringbuf;
extern u8_t *flash_buffer;

extern struct fs_file_t encounter_file;

void uart_print(char *buffer, int len);

void button_pressed(struct device *dev, struct gpio_callback *cb,
            u32_t pins)
{

    write_flash = !write_flash;
    // Flash led crashes things here...???
    // 
    //  This doesn't work all the time... Better with irq_lock
    // char buffer[64];
    // int len = sprintf(buffer, "write_flash: %d\n", write_flash);
    // uart_print(buffer, len);
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

