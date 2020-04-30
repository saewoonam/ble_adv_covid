Encounter Tracing: Scan & Advertise
###########################


Overview
********

A application demonstrating the encounter tracing protocol specified by
Apple/Google.   It does not implement the cryptography portion.   It simply
demonstrates the bluetooth radio portion and has an attempt to use the external
flash memory to store encounter.  It can stream output directly to the serial
port.   Or it can dump the content of the flash file to the serial port.

At the moment, writing to the flash as encounters come in causes the microcontroller to crash.  I am in the middle of implementing a small cache to store the encounter in RAM to write the data in chunks.

There seems to be difficulty in operating the CDC and the BT together.  

This is my 3rd or 4th refactor.   Everytime I add more complexity, there is a
memory leak between teh bluetooth scanning and the CDC interface.  They are not
truly compatible for some reason.   Right now, the code works.



Building and Running
********************

Follow the examples in the zephyr documentation For your board.
