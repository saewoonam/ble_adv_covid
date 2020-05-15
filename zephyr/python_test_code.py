import serial

s = serial.Serial(port)


if True: 
    s.write(b'n');   # put it in text output + binary mode
    s.write(b'r'); 
    print(s.readline()); 
    raw = s.read(32); 
    s.write(b'z'); 

# format of raw
# raw[0:3] : timestamp, lsb in time since boot
# raw[4:9] : MAC address
# raw[10]: 0xFF
# raw[11]: power, signed 1 byte integer
# raw[12:]: advertisement data, 4 bytes of extra info, 16 bytes of rpi (both
#           littlendian

int.from_bytes([0xDD], byteorder='little', signed=True)    
int.from_bytes([0x39, 0x39, 0, 0], byteorder='little', signed=True)
for r in raw: 
     print('%02X '%r, end="") 

#  Send time information
#  Day starts from 1
#  Month starts from 0
#  Year starts from 1900
msg = b't'+int(time.time()).to_bytes(4,'little')
s.write(msg) 
s.readline()
s.readline()
