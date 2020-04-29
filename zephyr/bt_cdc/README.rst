Encounter Tracing: Scan & Advertise
###########################


Overview
********

A application demonstrating the encounter tracing protocol specified by
Apple/Google.   It does not implement the cryptography portion.   It simply
demonstrates the bluetooth radio portion.   It streams the output of any
encounters over the USB as a CDC serial port.

There seems to be difficulty in operating the CDC and the BT together.  

This is my 3rd or 4th refactor.   Everytime I add more complexity, there is a
memory leak between teh bluetooth scanning and the CDC interface.  They are not
truly compatible for some reason.   Right now, the code works.


Building and Running
********************

Follow the examples in the zephyr documentation For your board.
