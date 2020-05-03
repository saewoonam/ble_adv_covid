#include <stdio.h>
#include <string.h>
#include <device.h>
#include <drivers/uart.h>
#include <zephyr.h>
#include <sys/ring_buffer.h>

#include <zephyr.h>
#include <drivers/sensor.h>
int8_t accel[6];
int8_t mag[6];

extern struct device *accel_dev;

static void fetch(struct device *sensor, int8_t *out)
{
        static unsigned int count;
        struct sensor_value values[3];
        // const char *overrun = "";
        int rc = sensor_sample_fetch(sensor);

        ++count;
        /*
        if (rc == -EBADMSG) {
                // Sample overrun.  Ignore in polled mode. 
                if (IS_ENABLED(CONFIG_LIS2DH_TRIGGER)) {
                        overrun = "[OVERRUN] ";
                }
                rc = 0;
        }
       */
        rc = sensor_channel_get(sensor,
                                SENSOR_CHAN_ACCEL_XYZ,
                                values);
        if (rc < 0) {
                for (int i=0; i<3; i++) { 
                        out[2*i + 0] = 0;
                        out[2*i + 1] = 0;
                }
                // printk("ERROR: Update failed: %d\n", rc);
        } else {
                for (int i=0; i<3; i++) { 
                        out[2*i + 0] = (int8_t) values[i].val1;
                        out[2*i + 1] = (int8_t) (values[i].val2/10000);
                }
                /*
                printk("#%u @ %u ms: %sx %f , y %f , z %f\n",
                       count, k_uptime_get_32(), overrun,
                       sensor_value_to_double(&accel[0]),
                       sensor_value_to_double(&accel[1]),
                       sensor_value_to_double(&accel[2]));
                       */
        }
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
    
}

void rpi_update(u8_t *rpi) {
    static u32_t round = 0;
    // Original google/apple spec
    // memcpy(rpi, &round, 4);  // try to copy round to lowest 4 bytes of rpi
    // New google/apple spec
    memcpy(rpi+4, &round, 4);  // try to copy round to lowest 4 bytes of rpi
    round++;
    rpi[0] = 0x00;
    rpi[1] = 0x00;
    rpi[2] = 0x00;
    rpi[3] = 0x40;
    fetch(accel_dev, accel);
    memcpy(rpi+8, accel, 6);
}

