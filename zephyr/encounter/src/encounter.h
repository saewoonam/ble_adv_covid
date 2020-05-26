#pragma once
#ifndef ENCOUNTER_H
#define ENCOUNTER_H

#define IDX_MASK        15

struct Ch_data {
    uint8_t mean;
    uint8_t n;
    uint8_t min;
    uint8_t max;
    uint16_t var;
};

struct RSSI_data {
   struct Ch_data ch37;
   struct Ch_data ch38;
   struct Ch_data ch39;
};

typedef struct Encounter_records {
   uint8_t  mac[6];
   uint8_t first_time;
   uint8_t last_time;
   uint32_t minute;
   uint8_t public_key[32];
   struct Ch_data rssi_data[3];
   uint8_t flag;
   uint8_t flag2;
} Encounter_record;



#endif // ENCOUNTER_H
