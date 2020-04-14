# Arduino project for Adafruit nRF52840 feather to implement advertising part of Google/Apple contact tracing bluetooth protocol
[Apple/Google announcment](https://www.apple.com/covid19/contacttracing/)  
[Bluetooth spec](https://covid19-static.cdn-apple.com/applications/covid19/current/static/contact-tracing/pdf/ContactTracing-BluetoothSpecificationv1.1.pdf)

##  Things missing
1.  Cryptographic code for calculting RPI
2.  Real time clock for crypto

##  Remaining minor issues
1. The program won't run on the feather unless it is run from the IDE with the serial monitor on to see the print statements... Not sure why... Probably a funny setting somewhere
2. Figure out how to port this to the nRF52840 Dongle from Nordic Semiconductors

##  MAJOR ISSUE 
1. When I try to use the 0x1A for the "Flag" field of the advertised message... I don't see it in any scanner... Not sure if it is a advertise or scanner/observer issue.  For now sending, 0x06.

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

SaeWoo Nam, 2020-04-13
