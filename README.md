# nRF520840 project to implement bluetooth part of Google/Apple contact tracing bluetooth protocol, radio part works for Adafruit nRF52840 feather, nrf52840 dongle in progress
[Apple/Google announcment](https://www.apple.com/covid19/contacttracing/)  
[Bluetooth spec](https://covid19-static.cdn-apple.com/applications/covid19/current/static/contact-tracing/pdf/ContactTracing-BluetoothSpecificationv1.1.pdf)

#  Adafruit notes

##  Implementation notes:
1.  Data is logged in external Flash memory
2.  Data can be fetched by sending commands via usb-serial to the device
3.  time information can be transferred to the device via usb-serial, untested

##  Things missing for Adafruit
1.  Cryptographic code for calculting RPI
2.  Real time clock for crypto
3.  How to handle error?

##  Remaining minor issues
1. Figure out how to port this to the nRF52840 Dongle from Nordic Semiconductors with their SDK so it can be ported to other types of dongles.
2. The scanner does not seem to continuously receive advertisements... It could be because of the interval settings, but I have not checked carefully.   Need to do that.
3. Check if it can be powered by an external source and still be connected to a computer as needed to retrieve data or sync the clock
4.  Need to sort out the byte order of the UUID.

##  Requirements
1.  Hardware: Adafruit nRF52840
2.  Libraries: nRF52 Adafruit arduino library

##  Modifications to nRF52 library
1.  Need to modify files installed by the arduino IDE to run the board.  The base location by operating system is
* macOS  : `~/Library/Arduino15/packages/adafruit/hardware/nrf52`
* Linux  : `~/.arduino15/packages/adafruit/hardware/nrf52`
* Windows: `%APPDATA%\Local\Arduino15\packages\adafruit\hardware\nrf52`
2. Need to replace these two files  which are located relative to the base path above in 0.19.0/libraries/Bluefruit52Lib/src  
   a. BLEAdvertising.cpp  
   b. BLEAdvertising.h  
3. These files are modified so that the advertising data which contains the rotating proximity identifier can be changed easily.  The modified files are in the subdirectory modified_files in the repo
  
## Tested with Arduino 1.18.12, nRF52 library 0.19

#  nRF52840 dongle
## Progress so far
1. Tried to adapt a project included in the nRF5 SDK   It is in the folder 'nrf52 dongle\ble_app_beacon
2. Also, tried another advertising beacon tutorial it is in the folder: 'nrf52 dongle/nrf52-ble-tutorial-advertising'

SaeWoo Nam, 2020-04-13
