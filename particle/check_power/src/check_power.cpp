/******************************************************/
//       THIS IS A GENERATED FILE - DO NOT EDIT       //
/******************************************************/

#line 1 "/Users/nams/Documents/projects/covid/adafruit/ble_adv_covid/particle/check_power/src/check_power.ino"
/*
 * Project check_power
 * Description: Check if plugged into usb and lipo
 * Author: SaeWoo
 * Date: April 20, 2020
 */

#include "Particle.h"

void setup();
void loop();
#line 10 "/Users/nams/Documents/projects/covid/adafruit/ble_adv_covid/particle/check_power/src/check_power.ino"
SerialLogHandler logHandler;

char lastMsg[128];
unsigned long lastPublish = 0;

void setup() {
	Serial.begin();
	pinMode(PWR, INPUT);
	pinMode(CHG, INPUT);
}

void loop() {
	float voltage = analogRead(BATT) * 0.0011224;

	// PWR: 0=no USB power, 1=USB powered
	// CHG: 0=charging, 1=not charging
	char buf[128];
	snprintf(buf, sizeof(buf), "voltage=%.1f PWR=%d CHG=%d", voltage, digitalRead(PWR), digitalRead(CHG));

	if (strcmp(buf, lastMsg) != 0 && millis() - lastPublish > 2000) {
		Particle.publish("battery", buf, PRIVATE);
		Log.info(buf);
		strcpy(lastMsg, buf);
		lastPublish = millis();
	}
}
