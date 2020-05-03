#include <stdio.h>
#include <string.h>
#include <device.h>
#include <drivers/uart.h>
#include <zephyr.h>
#include <sys/ring_buffer.h>

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
    
}

