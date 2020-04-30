# nRF520840 project to implement bluetooth part of Google/Apple contact tracing bluetooth protocol, radio part works for Adafruit nRF52840 feather, nrf52840 dongle, Particle Gen 3 devices (Argon, Boron, Xenon)
[Apple/Google announcment](https://www.apple.com/covid19/contacttracing/)  
[Bluetooth spec](https://covid19-static.cdn-apple.com/applications/covid19/current/static/contact-tracing/pdf/ContactTracing-BluetoothSpecificationv1.1.pdf)

#  Moving to Zephyr Development to make code management easier
##  Nordic Devices, nrf52840 Dongle or nRF52840DK
##  Code in zephyr/bt_cdc_fs
##  This version seems to get bt, usb-serial (CDC), and flash memory working together
##
1.  Works to advertise and scan, encounter BT signals
2.  Logs data to external flash memory when requested via usb serial
3.  Dumps logged data from flash memory to usb serial port when requested
4.  Following commands implemented via usb serial
    * 'r':  Toggles on/off streaming raw scans results to serial port
    * 'g':  Get data from flash memory and send over serial port
    * 'c':  Clear flash memory
    * 'k':  Toggles on/off stream of  raw ecounter packets to the debugger port
    * 'l':  List files on flash memory to debugger
    * 'w':  Start writing encounter packets to the flash memory
    * 's':  Stop writing encounter packets to the flash memory

##  Look in zephyr/bt_cdc folder
##  Issues
1.  This works... does not implement anything to flash memory
2.  Stripped out all "helper" code from covid2 code to eliminate memory leak
    between the BT scan and the CDC
3.  Needs to be stress tested...
4.  Also seems to solve the usb disconnect problem...   It recovers when usb is
    disconnected... Also needs to be stress tested.
5.  Does implement the latest protocol
##  Look in zephyr/covid2 folder
##  Issues
1.  Does not implement latest Apple/Google protocol
2.  BT and CDC are not playing well together.
3.  Device crashes if USB disconnects during serial port transmission
##  Trying to understand how to migrate to other boards


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
## Requirements
1. nRFConnect on computer to program
2. Uses SoftDevice 7.0
3. Uses nRF5 SDK v16

## Compiler setup
1.  Compiles only with the SEGGER IDE so far, (SaeWoo us using osX).
2.  Look in 'ses' folder in the 'nrf52 dongle/PCA10059' directory
3.   *Must* set up a global macro to the nRF5 SDK... Go to "Tools" from the menu
bar, then go to "Options...->Building -> Build -> Global macros".   Must define
a 'sdk' macro.  For SaeWoo, sdk=/Users/nams/Documents/projects/covid/nrf5/nRF5SDK160098a08e2
4. Now, the project can be built in the git repo, WITHOUT copying to a
   subdirectory of the nrf5 SDK.

## Issues
1. The dongle has no memory to log data, so it sends the data back through usb
   as a serial device
2. Trouble with CDC_ACM interface... Crashes after a while..  Can't figure out
   why.

## Progress so far
1. The app compiles in SEGGER IDE.  I didn't configure any of the other projects.  
2. The app should compile and emit a covid tracing advertisement packet that is consistent with Apple/Google bluetooth spec.
3. Sends contact packets over usb serial back to computer

## LED OUTPUTS
1. Multicolor LED:  Red periodically to indicate advertising (1 per second)
2. Multicolor Blue:  Inidicate detection of contact via bluetooth
3. Multicolor Green:  Serial port write or other serial port related stuff

## Things to do
1.  Implement capability to change advertising packet every 10 to 15 minutes
    (i.e. RPI)
2.  Crytpo
3.  Changing RPI
4.  Write code to log to an add-on flash
5.  Figure out how to power nrf52 via a battery.


#  Particle Argon/Boron

## Requirements
1. Developed using DeviceOS 1.5.0
2. Installed "Particle Workbench"

## Issues
1.  Can't access Flash memory for logging... Need to investigate how
2.  Need to figure out how to push logging data to the web for logging into a
    database for data taking / evaluation
## LED output
1. Blue LED flashes when contact detected

## Things to do for testimg
1. Implement WiFi data logging
2. For remote testing (no wifi), get flash logging working
3. Implement scheme to retrieve data from flash memory


SaeWoo Nam, started 2020-04-13, last edit 2020-04-19
