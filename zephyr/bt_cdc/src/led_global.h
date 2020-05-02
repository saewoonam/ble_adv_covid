struct led led1 = {
    .gpio_dev_name = DT_ALIAS_LED0_GPIOS_CONTROLLER,
    .gpio_pin_name = DT_ALIAS_LED0_LABEL,
    .gpio_pin = DT_ALIAS_LED0_GPIOS_PIN,
    .gpio_flags = GPIO_OUTPUT | DT_ALIAS_LED0_GPIOS_FLAGS,
    .dev = NULL
};

struct led led2 = {
    .gpio_dev_name = DT_ALIAS_LED1_GPIOS_CONTROLLER,
    .gpio_pin_name = DT_ALIAS_LED1_LABEL,
    .gpio_pin = DT_ALIAS_LED1_GPIOS_PIN,
    .gpio_flags = GPIO_OUTPUT | DT_ALIAS_LED1_GPIOS_FLAGS,
    .dev = NULL
};
/*
struct led led3 = {
    .gpio_dev_name = DT_ALIAS_LED2_GPIOS_CONTROLLER,
    .gpio_pin_name = DT_ALIAS_LED2_LABEL,
    .gpio_pin = DT_ALIAS_LED2_GPIOS_PIN,
    .gpio_flags = GPIO_OUTPUT | DT_ALIAS_LED2_GPIOS_FLAGS,
    .dev = NULL
};

struct led led4 = {
    .gpio_dev_name = DT_ALIAS_LED3_GPIOS_CONTROLLER,
    .gpio_pin_name = DT_ALIAS_LED3_LABEL,
    .gpio_pin = DT_ALIAS_LED3_GPIOS_PIN,
    .gpio_flags = GPIO_OUTPUT | DT_ALIAS_LED3_GPIOS_FLAGS,
    .dev = NULL
};
*/
