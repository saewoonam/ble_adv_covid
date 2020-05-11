# uBIT notes
## This implements bluetooth advertising and scanning
*  Instead of using the rolling RPI's, it advertises the raw readings of the acceleromter and the compass
*  The format of the advertized packet is as follows:
    * 3 bytes containing containing advertising flag information
    * 4 bytes containing the follwing bytes, the last two bytes are little endian format  
0x03 0x03 0x6F 0xFD  
    * 24 bytes, little endian first, trying to follow the google apple protocol, except the RPI has been replaced with accelerometer and compass information  
    - first 8 bytes: 0x17 0x16 0x6F 0xFD 0x00 0x00 0x00 0x04  
    - next 6 bytes, littlendian order, accelerometer x, y, z each 2 bytes  
    - next 6 bytes, littlendian order, compass x, y, z each 2 bytes  
    - next 2 bytes, counter incremented on each sensor reading, little endian this will roll over  
    - next 2 bytes, 0x19 0xC0    (little endian)  

*  When connected to a usb port, it can stream the scanned data over a usb-serial connection.   
    -  Need to send the letter 'r', to start streaming raw data.   
    -  Send 'z' to end raw streaming of data
