//  SPDX-License-Identifier: Apache-2.0
#include <stdio.h>
#include <string.h>
#include <device.h>
//#include <drivers/uart.h>
#include <zephyr.h>
//#include <sys/ring_buffer.h>

#include <sys/util.h>
#include <drivers/i2c.h>

#define CFG_REG_A_M 0x60
#define CFG_REG_C_M 0x62
#define STATUS_REG_M 0x67
#define OUTX_L_REG_M 0x68
#define STATUS_REG_A 0x27
#define CTRL_REG1_A 0x20
#define OUT_X_L_A 0x28

int8_t mag[6];
int8_t acc[6];

extern struct device *i2c_dev;

static int fetch_mag(struct device *sensor, int8_t *out){
        int rc = 0;
        uint8_t status=0;
        // float x, y, z;
        uint8_t address = 0x1e;  // i2c address
        int16_t *values;
        int16_t temp;

        values = out;
        rc = i2c_reg_read_byte(sensor, address, STATUS_REG_M, &status);
        rc = i2c_burst_read(sensor, address, OUTX_L_REG_M, out, 6);
        //  Swap and negate x & y per 
        //  https://github.com/lancaster-university/microbit-dal/blob/master/source/drivers/LSM303Accelerometer.cpp
        temp = -values[0];
        values[0] = -values[1];
        values[1] = temp;
        /*
        x = out[0] + (out[1]<<8);
        y = out[2] + (out[3]<<8);
        z = out[4] + (out[5]<<8);
        printk("mag: %f, %f, %f\n", x, y, z);
        */
        return rc;
}
static int fetch_acc(struct device *sensor, int8_t *out) {
        int rc = 0;
        // float x, y, z;
        uint16_t address = 0x19;
        int16_t *values;
        int16_t temp=0;

        rc = i2c_reg_read_byte(sensor, 0x19, OUT_X_L_A, out);
        rc += i2c_reg_read_byte(sensor, 0x19, OUT_X_L_A+1, out+1);
        // x = out[0] + (out[1]<<8);
        rc += i2c_reg_read_byte(sensor, 0x19, OUT_X_L_A+2, out+2);
        rc += i2c_reg_read_byte(sensor, 0x19, OUT_X_L_A+3, out+3);
        // y = out[2] + (out[3]<<8);
        rc += i2c_reg_read_byte(sensor, 0x19, OUT_X_L_A+4, out+4);
        rc += i2c_reg_read_byte(sensor, 0x19, OUT_X_L_A+5, out+5);
        // z = out[4] + (out[5]<<8);
        // printk("acc: %f, %f, %f\n", x, y, z);

        //  Swap and negate x & y per 
        //  https://github.com/lancaster-university/microbit-dal/blob/master/source/drivers/LSM303Accelerometer.cpp
        temp = -values[0];
        values[0] = -values[1];
        values[1] = temp;
        return rc;
}


void rpi_init(u8_t *rpi) {
    /*
    rpi = encounter_ad[3].data+2; // 4th item in array of messages is RPI
    rpi[15] = 0xC0;
    rpi[14] = 0x19;
    rpi[13] = 0;
    rpi[12] = 0;
    */
    // rpi = encounter_ad[2].data+2; // 3rd item in array of messages is RPI
    rpi[19] = 0xC0;
    rpi[18] = 0x19;
    rpi[17] = 0;
    rpi[16] = 0;

    int rc = 0;
    rc = i2c_reg_write_byte(i2c_dev,0x1e, CFG_REG_A_M, 0x00) ;
    rc += i2c_reg_write_byte(i2c_dev,0x1e, CFG_REG_C_M, 0x01) ;
    rc += i2c_reg_write_byte(i2c_dev,0x19, CTRL_REG1_A, 0x57);

}

void rpi_update(u8_t *rpi) {
    static u16_t round = 0;
    // Original google/apple spec
    // memcpy(rpi, &round, 4);  // try to copy round to lowest 4 bytes of rpi
    // New google/apple spec
    round++;
    rpi[0] = 0x00;
    rpi[1] = 0x00;
    rpi[2] = 0x00;
    rpi[3] = 0x40;
    memcpy(rpi+4, &round, 2);  // try to copy round to lowest 4 bytes of rpi
    fetch_acc(i2c_dev, acc);
    memcpy(rpi+6, acc, 6);
    fetch_mag(i2c_dev, mag);
    memcpy(rpi+12, acc, 6);
}

