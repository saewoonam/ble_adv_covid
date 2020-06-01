/*
 * Copyright (c) 2019 Intel Corporation
 *
 * SPDX-License-Identifier: Apache-2.0
 */

/**
 * @file
 * @brief Sample echo app for CDC ACM class
 *
 * Sample app for USB CDC ACM class driver. The received data is echoed back
 * to the serial port.
 */

#include <stdio.h>
#include <string.h>
#include <device.h>
#include <drivers/uart.h>
#include <zephyr.h>
#include <sys/ring_buffer.h>

#include <usb/usb_device.h>
#include <logging/log.h>

#include <drivers/i2c.h>


#include <zephyr.h>
#include <drivers/flash.h>
#include <device.h>
#include <stdio.h>
#include <string.h>

#include <devicetree.h>
#include <drivers/gpio.h>

/* 1000 msec = 1 sec */
#define SLEEP_TIME_MS   1000
/* The devicetree node identifier for the "led0" alias. */
#define LED0_NODE DT_ALIAS(led0)
#define LED0	DT_GPIO_LABEL(LED0_NODE, gpios)
#define PIN	DT_GPIO_PIN(LED0_NODE, gpios)
#define FLAGS	DT_GPIO_FLAGS(LED0_NODE, gpios)

#define FLASH_DEVICE DT_LABEL(DT_INST(0, nordic_qspi_nor))
#define FLASH_NAME "JEDEC QSPI-NOR"
#define FLASH_TEST_REGION_OFFSET 0xff000
#define FLASH_SECTOR_SIZE        4096

LOG_MODULE_REGISTER(cdc_acm_echo, LOG_LEVEL_INF);

#define RING_BUF_SIZE 1024
u8_t ring_buffer[RING_BUF_SIZE];

struct ring_buf ringbuf;
struct device *dev;
bool cdc_open = false;

void cdc_printf(char *format, ...) {
    va_list arg;
    va_start(arg, format);
    int len;
    static char print_buffer[4096];

    len = vsnprintf(print_buffer, 4096,format, arg);
    va_end(arg);
    if (cdc_open) {
        int num_written = 0;
        while (len - num_written > 0) {
        unsigned int key = irq_lock();
        num_written +=
          ring_buf_put(&ringbuf,
                       (print_buffer + num_written),
                       (len - num_written));
        irq_unlock(key);
        uart_irq_tx_enable(dev);
        }
    } else {printk("cdc_open is false: %s\n", print_buffer);}
}

static void interrupt_handler(struct device *dev)
{
	while (uart_irq_update(dev) && uart_irq_is_pending(dev)) {
		if (uart_irq_rx_ready(dev)) {
			int recv_len, rb_len;
			u8_t buffer[64];
			size_t len = MIN(ring_buf_space_get(&ringbuf),
					 sizeof(buffer));

			recv_len = uart_fifo_read(dev, buffer, len);

			rb_len = ring_buf_put(&ringbuf, buffer, recv_len);
			if (rb_len < recv_len) {
				LOG_ERR("Drop %u bytes", recv_len - rb_len);
			}

			LOG_DBG("tty fifo -> ringbuf %d bytes", rb_len);

			uart_irq_tx_enable(dev);
		}

		if (uart_irq_tx_ready(dev)) {
			u8_t buffer[64];
			int rb_len, send_len;

			rb_len = ring_buf_get(&ringbuf, buffer, sizeof(buffer));
			if (!rb_len) {
				LOG_DBG("Ring buffer empty, disable TX IRQ");
				uart_irq_tx_disable(dev);
				continue;
			}

			send_len = uart_fifo_fill(dev, buffer, rb_len);
			if (send_len < rb_len) {
				LOG_ERR("Drop %d bytes", rb_len - send_len);
			}

			LOG_DBG("ringbuf -> tty fifo %d bytes", send_len);
		}
	}
}

void main(void)
{
	u32_t baudrate, dtr = 0U;
	int ret;

	dev = device_get_binding("CDC_ACM_0");
	if (!dev) {
		LOG_ERR("CDC ACM device not found");
		return;
	}

	ret = usb_enable(NULL);
	if (ret != 0) {
		LOG_ERR("Failed to enable USB");
		return;
	}

	ring_buf_init(&ringbuf, sizeof(ring_buffer), ring_buffer);

	LOG_INF("Wait for DTR");

	while (true) {
		uart_line_ctrl_get(dev, UART_LINE_CTRL_DTR, &dtr);
		if (dtr) {
			break;
		} else {
			/* Give CPU resources to low priority threads. */
			k_sleep(K_MSEC(100));
		}
	}

	LOG_INF("DTR set");

	/* They are optional, we use them to test the interrupt endpoint */
	ret = uart_line_ctrl_set(dev, UART_LINE_CTRL_DCD, 1);
	if (ret) {
		LOG_WRN("Failed to set DCD, ret code %d", ret);
	}

	ret = uart_line_ctrl_set(dev, UART_LINE_CTRL_DSR, 1);
	if (ret) {
		LOG_WRN("Failed to set DSR, ret code %d", ret);
	}

	/* Wait 1 sec for the host to do all settings */
	k_busy_wait(1000000);

	ret = uart_line_ctrl_get(dev, UART_LINE_CTRL_BAUD_RATE, &baudrate);
	if (ret) {
		LOG_WRN("Failed to get baudrate, ret code %d", ret);
	} else {
		LOG_INF("Baudrate detected: %d", baudrate);
	}

	uart_irq_callback_set(dev, interrupt_handler);

	/* Enable rx interrupts */
	uart_irq_rx_enable(dev);
        cdc_open = true;
        int count=0;
        cdc_printf("cdc+flash test\n");
        
        for (count=0; count<3; count++) {
                cdc_printf("hello: %d\n", count);
		k_sleep(K_MSEC(1000));
        }
        
	struct device *flash_dev;
	int rc;
        struct device *i2c_dev = device_get_binding(DT_ALIAS_I2C_0_LABEL);
        if (!i2c_dev) {
                cdc_printf("Can't find i2c driver\n");
        } else {
                cdc_printf("Found i2c driver\n");
        }
        /*
        while(true) {
                uint8_t c=0;
                int addr = 0x68;
                c = 0;

                // rc = i2c_reg_write_byte(i2c_dev, addr, 0, c );
                // rc = i2c_write(i2c_dev, &c, 1, addr);
                // cdc_printf("write: %x: %d, %d\n", addr, rc, c);
                rc = i2c_read(i2c_dev, &c, 1, addr);
                cdc_printf(" read: %x: %d, %d\n", addr, rc, c);
                // k_sleep(K_MSEC(100));
                
        }
        */
        uint8_t out[20];
        char clock_buffer[64];
        int len = 0;

        rc = i2c_reg_write_byte(i2c_dev, 0x68, 2, 0x80 );
        rc = i2c_reg_write_byte(i2c_dev, 0x68, 0x9, 0x20 );
        rc = i2c_reg_write_byte(i2c_dev, 0x68, 0x0, 0x20 );
        rc = i2c_reg_write_byte(i2c_dev, 0x68, 0x0, 0x00 );

        memset(out, 0, 20);
        for (count=0; count<20; count++){
                len += sprintf(clock_buffer+len, "%02X ", out[count]);
        }
        cdc_printf("clock: ");
        cdc_printf(clock_buffer);
        cdc_printf("\n");
        for (count=0; count<5; count++) {
                rc = i2c_reg_write_byte(i2c_dev, 0x68, 2, 0x80 );
                rc = i2c_burst_read(i2c_dev, 0x68, 0, out, 20);
                cdc_printf("i2c burst_read rc: %d\n", rc);
                len = 0;
                for (count=0; count<20; count++){
                        len += sprintf(clock_buffer+len, "%02X ", out[count]);
                }
                cdc_printf("clock: ");
                cdc_printf(clock_buffer);
                cdc_printf("\n");
                k_sleep(K_MSEC(100));
        }
        
	cdc_printf("\n" FLASH_NAME " SPI flash testing\n");
	cdc_printf("==========================\n");
        cdc_printf(FLASH_DEVICE);
        cdc_printf("\n");
        flash_dev = device_get_binding(FLASH_DEVICE);

        if (!flash_dev) {
                cdc_printf("SPI flash driver %s was not found!\n",
                       FLASH_DEVICE);
                return;
        }
	cdc_printf("\nTest 1: Flash erase\n");
	flash_write_protection_set(flash_dev, false);

	rc = flash_erase(flash_dev, FLASH_TEST_REGION_OFFSET,
			 FLASH_SECTOR_SIZE);
	if (rc != 0) {
		cdc_printf("Flash erase failed! %d\n", rc);
	} else {
		cdc_printf("Flash erase succeeded!\n");
	}

	const u8_t expected[] = { 0x55, 0xaa, 0x66, 0x99 };
	len = sizeof(expected);
	u8_t buf[sizeof(expected)];
        

	cdc_printf("\nTest 2: Flash write\n");
	flash_write_protection_set(flash_dev, false);

	cdc_printf("Attempting to write %u bytes\n", len);
	rc = flash_write(flash_dev, FLASH_TEST_REGION_OFFSET, expected, len);
	if (rc != 0) {
		cdc_printf("Flash write failed! %d\n", rc);
		return;
	}

	memset(buf, 0, len);
	rc = flash_read(flash_dev, FLASH_TEST_REGION_OFFSET, buf, len);
	if (rc != 0) {
		cdc_printf("Flash read failed! %d\n", rc);
		return;
	}

	if (memcmp(expected, buf, len) == 0) {
		cdc_printf("Data read matches data written. Good!!\n");
                cdc_printf("hello\n");
	} else {
		const u8_t *wp = expected;
		const u8_t *rp = buf;
		const u8_t *rpe = rp + len;

		cdc_printf("Data read does not match data written!!\n");
		while (rp < rpe) {
			printf("%08x wrote %02x read %02x %s\n",
			       (u32_t)(FLASH_TEST_REGION_OFFSET + (rp - buf)),
			       *wp, *rp, (*rp == *wp) ? "match" : "MISMATCH");
			++rp;
			++wp;
		}
	}
        cdc_printf("Done!\n");
	struct device *led_dev;
	bool led_is_on = true;

	led_dev = device_get_binding(LED0);
	if (led_dev == NULL) {
		return;
	}

	ret = gpio_pin_configure(led_dev, PIN, GPIO_OUTPUT_ACTIVE | FLAGS);
	if (ret < 0) {
		return;
	}

	while (1) {
		gpio_pin_set(led_dev, PIN, (int)led_is_on);
		led_is_on = !led_is_on;
		k_msleep(SLEEP_TIME_MS);
	}
}
