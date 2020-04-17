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

/* 
 *  This sketch implements most of the RF protocol for contact tracing proposed
 *  by Apple and Google
 *  
 */
//  Stuff to store data on the external QSPI
#include <SPI.h>
#include <SdFat.h>
#include <Adafruit_SPIFlash.h>

// On-board external flash (QSPI or SPI) macros should already
// defined in your board variant if supported
// - EXTERNAL_FLASH_USE_QSPI
// - EXTERNAL_FLASH_USE_CS/EXTERNAL_FLASH_USE_SPI
#if defined(EXTERNAL_FLASH_USE_QSPI)
  Adafruit_FlashTransport_QSPI flashTransport;

#elif defined(EXTERNAL_FLASH_USE_SPI)
  Adafruit_FlashTransport_SPI flashTransport(EXTERNAL_FLASH_USE_CS, EXTERNAL_FLASH_USE_SPI);

#else
  #error No QSPI/SPI flash are defined on your board variant.h !
#endif

Adafruit_SPIFlash flash(&flashTransport);

// file system object from SdFat
FatFileSystem fatfs;
 
#include <bluefruit.h>

#define PIN_ADV       A0
#define ADV_TIMEOUT   60 // seconds

uint8_t rpi[18];
File writeFile;
uint8_t logdata_bool = true;

void setup() 
{
  Serial.begin(115200);
  while ( !Serial ) delay(10);   // This waits for serial port to get opened
  
  /*
  Serial.println("Bluefruit52 covid tracking Example");
  Serial.println("----------------------------------------\n");
  
  // Initialize flash library and check its chip ID.
  if (!flash.begin()) {
    Serial.println("Error, failed to initialize flash chip!");
    while(1) yield();
  }
  Serial.print("Flash chip JEDEC ID: 0x"); Serial.println(flash.getJEDECID(), HEX);

  // First call begin to mount the filesystem.  Check that it returns true
  // to make sure the filesystem was mounted.
  if (!fatfs.begin(&flash)) {
    Serial.println("Error, failed to mount newly formatted filesystem!");
    Serial.println("Was the flash chip formatted with the SdFat_format example?");
    while(1) yield();
  }
  Serial.println("Mounted filesystem!");
  */
  flash.begin();   // Need to do something if it fails
  fatfs.begin(&flash);  // Need to do something if it fails
  // Create a file in the test directory and write data to it.
  // Note the FILE_WRITE parameter which tells the library you intend to
  // write to the file.  This will create the file if it doesn't exist,
  // otherwise it will open the file and start appending new data to the
  // end of it.
  writeFile = fatfs.open("/contact.dat", FILE_WRITE);  // Need to do somthing if it fails
  /* 
  if (!writeFile) {
    Serial.println("Error, failed to open contact.dat for writing!");
    while(1) yield();
  }
  Serial.println("Opened file /contact.dat for writing/appending...");  
  
  */
  Serial.print("Size: "); Serial.println(writeFile.size());
  Serial.print("Position: ");
  Serial.println(writeFile.position());
  // Sync clock and log to file


  
  // Initialize Bluefruit with maximum connections as Peripheral = 0, Central = 1
  // SRAM usage required by SoftDevice will increase dramatically with number of connections
  Bluefruit.begin(1, 1);
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

  // Serial.println("Scanning ...");  
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

  // Serial.println("Advertising is started"); 
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
      
      unsigned long now = millis();
      /*
      Serial.printf("[%9d]  ", now);
      // MAC is in little endian --> print reverse
      Serial.printBufferReverse(report->peer_addr.addr, 6, ':');
      */
      if (logdata_bool) {
        //Serial.println("logging data");
        uint8_t len[1] = {0x4};
        writeFile.write(len, 1);
        writeFile.write(&now, 4);
        *len = 6;
        writeFile.write(len, 1);
        writeFile.write(report->peer_addr.addr, *len);
        writeFile.flush();
      }
      /* 
       Serial.print("\n");
  
      // RSSI value 
      Serial.printf("%14s %d dBm\n", "RSSI", report->rssi);
  
      // Raw buffer contents 
      // Serial.printf("%14s %d bytes\n", "PAYLOAD", report->data.len);
      */
      if (report->data.len)
      {
        //Serial.printf("%3s", " ");
        if (logdata_bool) {
          //Serial.printBuffer(report->data.p_data, report->data.len, '-');
          //Serial.println();
          writeFile.write(report->data.p_data, report->data.len);
          writeFile.flush();
        }
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
    uint8_t flag = 0x06; // BLE_GAP_ADV_FLAG_LE_GENERAL_DISC_MODE  ; 
                   // BLE_GAP_ADV_FLAG_LE_BR_EDR_CONTROLLER ;
                   //  BLE_GAP_ADV_FLAG_LE_BR_EDR_HOST  ;
    // Serial.println(flag);
    Bluefruit.Advertising.addFlags(flag);  
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

void loop() 
{
  // Only check pin when advertising has already stopped
  uint8_t buf[ 64 ];
  if ( Serial.available() )
  {
    char choice = Serial.read();
    uint8_t got;
    if (choice=='r') {
      File readFile = fatfs.open("\contact.dat", FILE_READ); 
      do {
        got = readFile.read(buf, 42);
        if (got==0) break; 
        Serial.printBuffer(buf, 42,' ');
        Serial.println();
      } while (true);
      readFile.close();
      Serial.println("Done.");
    } else if (choice=='s' ) { // "s" sync
      uint8_t raw_time[8];
      Serial.readBytes(raw_time, 8);
      Serial.printBuffer(raw_time, 8);
      unsigned long now = millis();
      uint8_t len[1] = {0x0C};
      
      writeFile.write(len, 1);
      writeFile.write(raw_time, 8);
      writeFile.write(&now, 4);
      writeFile.flush();
    } else if (choice=='c') { // 'c' clear/erase log
      uint8_t zero = 0;
      writeFile.close();
      fatfs.remove("/contact.dat");
      writeFile = fatfs.open("/contact.dat", FILE_WRITE);  // Need to do somthing if it fails      
    }

  }
}
