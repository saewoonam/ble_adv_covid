/*********************************************************************
 This is an example for our nRF52 based Bluefruit LE modules

 Pick one up today in the adafruit shop!

 Adafruit invests time and resources providing this open source code,
 please support Adafruit and open-source hardware by purchasing
 products from Adafruit!

 MIT license, check LICENSE for more information
 All text above, and the splash screen below must be included in
 any redistribution
*********************************************************************/

/* This sketch demonstrates the Bluefruit.Advertising API(). When powered up,
 * the Bluefruit module will start advertising for ADV_TIMEOUT seconds (by
 * default 30 seconds in fast mode, the remaining time slow mode) and then
 * stop advertising completely. The module will start advertising again if
 * PIN_ADV is grounded.
 */
#include <bluefruit.h>

#define PIN_ADV       A0
#define ADV_TIMEOUT   60 // seconds

uint8_t rpi[18];

void setup() 
{
  // configure PIN_ADV as input with a pullup (pin is active low)
  pinMode(PIN_ADV, INPUT_PULLUP);
  
  Serial.begin(115200);
  while ( !Serial ) delay(10);   // for nrf52840 with native usb

  Serial.println("Bluefruit52 Advanced Advertising Example");
  Serial.println("----------------------------------------\n");

  Bluefruit.begin();
  Bluefruit.setTxPower(4);    // Check bluefruit.h for supported values
  Bluefruit.setName("Bluefruit52");

  // Set up and start advertising
  startAdv();

  Serial.println("Advertising is started"); 
  Serial.print("test ");
  Serial.println(Bluefruit.Advertising.test());
}


void startAdv(void)
{ 
  uint8_t i=0;
  rpi[0] = 0xFD;
  rpi[1] = 0x6F;
  for (i=0; i<16; i++) {
    rpi[i+2] = i;
  }  
  uint8_t service[] = { 0x6F, 0xFD };
  uint8_t flag[] = {0x1A};
  
  // Advertising packet
  Bluefruit.Advertising.addFlags(BLE_GAP_ADV_FLAGS_LE_ONLY_GENERAL_DISC_MODE);
  // Add service 
  //Bluefruit.Advertising.addUuid(BLEUuid(0xFD6F)); // this works also
  Bluefruit.Advertising.addData(0x3, service, 2);
  // Service Data
  Bluefruit.Advertising.addData(0x16, rpi, 18);  

  /* Start Advertising
   * - Enable auto advertising if disconnected
   * - Interval:  fast mode = 20 ms, slow mode = 152.5 ms
   * - Timeout for fast mode is 30 seconds
   * - Start(timeout) with timeout = 0 will advertise forever (until connected)
   * 
   * For recommended advertising interval
   * https://developer.apple.com/library/content/qa/qa1931/_index.html
   */
  Bluefruit.Advertising.setStopCallback(adv_stop_callback);
  Bluefruit.Advertising.restartOnDisconnect(true);
  Bluefruit.Advertising.setIntervalMS(200, 200);    
  Bluefruit.Advertising.setFastTimeout(30);      // number of seconds in fast mode
  Bluefruit.Advertising.start(ADV_TIMEOUT);      // Stop advertising entirely after ADV_TIMEOUT seconds 
}

void loop() 
{
  // Only check pin when advertising has already stopped
  if ( !Bluefruit.Advertising.isRunning() )
  {
    // Check if Pin is grounded
    if ( digitalRead(PIN_ADV) == 0 )
    {
      Bluefruit.Advertising.start(ADV_TIMEOUT);
      Serial.println("Advertising is started");
    }
  }
}
void update_rpi(void)
{
  uint8_t *data, len;
  static uint8_t counter=0;
  data = Bluefruit.Advertising.getData();
  len = Bluefruit.Advertising.count();

  data[len-1] = counter;
  counter++;  
}

/**
 * Callback invoked when advertising is stopped by timeout
 */
void adv_stop_callback(void)
{
  Serial.println("Advertising time passed, advertising will now stop.");
  update_rpi();
  Bluefruit.Advertising.re_adv();
  Bluefruit.Advertising.start(ADV_TIMEOUT);  
}
