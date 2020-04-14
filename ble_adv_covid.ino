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

  Serial.println("Bluefruit52 covid tracking Example");
  Serial.println("----------------------------------------\n");
  
  // Initialize Bluefruit with maximum connections as Peripheral = 0, Central = 1
  // SRAM usage required by SoftDevice will increase dramatically with number of connections
  Bluefruit.begin(0, 1);
  Bluefruit.setTxPower(4);    // Check bluefruit.h for supported values
  Bluefruit.setName("CovidBluefruit52");
  //
  //
  /*******************************
   * Setup scan/observing
   */


  /* Start Central Scanning
   * - Enable auto scan if disconnected
   * - Filter out packet with a min rssi
   * - Interval = 100 ms, window = 50 ms
   * - Use active scan (used to retrieve the optional scan response adv packet)
   * - Start(0) = will scan forever since no timeout is given
   */
  Bluefruit.Scanner.setRxCallback(scan_callback);
  Bluefruit.Scanner.restartOnDisconnect(true);
  Bluefruit.Scanner.filterRssi(-80);
  //  Can we use a filter to call the routine to log the contact/encounter?
  //Bluefruit.Scanner.filterUuid(BLEUART_UUID_SERVICE); // only invoke callback if detect bleuart service
  Bluefruit.Scanner.setInterval(160, 80);       // in units of 0.625 ms
  //  No scan response
  Bluefruit.Scanner.useActiveScan(false);        // Do not Request scan response data
  Bluefruit.Scanner.start(0);                   // 0 = Don't stop scanning after n seconds

  Serial.println("Scanning ...");  
  //
  // 
  /*******************************
   *   Setup advertising
   */
  // Setup private random nonresolvable MAC address, change every 60*15 seconds
  
  ble_gap_privacy_params_t prvt_conf;
  memset(&prvt_conf, 0, sizeof(prvt_conf));
  prvt_conf.privacy_mode = BLE_GAP_PRIVACY_MODE_DEVICE_PRIVACY;
  prvt_conf.private_addr_type = BLE_GAP_ADDR_TYPE_RANDOM_PRIVATE_NON_RESOLVABLE ;
  prvt_conf.private_addr_cycle_s = 60*15;
  // Should add the adafruit error checking wrapper around the command below
  uint8_t err_code = sd_ble_gap_privacy_set(&prvt_conf);
  
  // Set up and start advertising
  startAdv();

  Serial.println("Advertising is started"); 
  /*  Check that using modified bluefruit libraries  */
  if (false) {
    Serial.print("test should be 1, it is: ");
    Serial.println(Bluefruit.Advertising.test());
  }
}

void scan_callback(ble_gap_evt_adv_report_t* report)
{
  PRINT_LOCATION();
  uint8_t len = 0;
  uint8_t buffer[32];
  memset(buffer, 0, sizeof(buffer));

  /*  This is where we would check advertisement and log if contact  */
  if ( ~report->type.connectable ) 
  {
    if (report->rssi >-60) {
      
      
      Serial.printf("[%9d]  ", millis());
      // MAC is in little endian --> print reverse
      Serial.printBufferReverse(report->peer_addr.addr, 6, ':');
      /* 
       Serial.print("\n");
  
      // RSSI value 
      Serial.printf("%14s %d dBm\n", "RSSI", report->rssi);
  
      // Raw buffer contents 
      // Serial.printf("%14s %d bytes\n", "PAYLOAD", report->data.len);
      */
      if (report->data.len)
      {
        //Serial.printf("%15s", " ");
        Serial.printf("%3s", " ");
        Serial.printBuffer(report->data.p_data, report->data.len, '-');
        Serial.println();
      }
    }
  }

  // For Softdevice v6: after received a report, scanner will be paused
  // We need to call Scanner resume() to continue scanning
  Bluefruit.Scanner.resume();
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
  Bluefruit.Advertising.setType(BLE_GAP_ADV_TYPE_NONCONNECTABLE_NONSCANNABLE_UNDIRECTED);
  if (true) {
    Bluefruit.Advertising.addTxPower();
  } 
  if (false) {
    Bluefruit.Advertising.addData(0x1, flag, 1 ); // Cannot get this received by a scanner 
  } else {
    Bluefruit.Advertising.addFlags(BLE_GAP_ADV_FLAGS_LE_ONLY_GENERAL_DISC_MODE);  
  }
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
  Serial.println("Advertising time passed, changing RPI and restarting.");
  update_rpi();
  Bluefruit.Advertising.re_adv();
  Bluefruit.Advertising.start(ADV_TIMEOUT);  
}
