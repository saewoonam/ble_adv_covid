#  log data to file
#  For nrf52840dongle that reads the channel info
#  First arg is name of the serial port that is connected to the dongle
#  2nd arg is the filename
#  3rd arg is number of points
#  Press ctrl-c to quit

#  Issues:
#
#   When quitting with Ctrl-c...  The serial communicaiton can get messed
#   up...  The next time you run the program it may hang   You need to ctrl-c
#   to quit.   And try again.  Things should get reset properly then.
#


import sys
import serial
import time

if len(sys.argv)==3:
    filename = sys.argv[2]
    num_pts = 1e9;
elif len(sys.argv)==4:
    filename = sys.argv[2]
    num_pts = int(sys.argv[3])

print(f"filename: {filename}, num_pts: {num_pts}")
f = open(filename, 'w')
count = 0
header = "local_time, rssi, channel, remote_mac, rpi\n"
f.write(header)
print(f"header: {header}", end="")

s = serial.Serial(sys.argv[1], timeout=10)
s.write(b'zz\n')
s.flush();
s.write(b'rr\n')  #  Command to send data to serial port

try:
    while True:
        line = []
        line.append("%.2f" % time.time())
        raw = s.read(32)
        if len(raw) == 0:
            print("No received signal for 10 seconds, trying again")
            # s.close()
            # s = serial.Serial(sys.argv[1], timeout=1)
        else:
            rssi = int.from_bytes(raw[:1],byteorder='little', signed=True)
            line.append(rssi)
            channel = int.from_bytes(raw[1:2],byteorder='little', signed=True)
            line.append(channel)
            mac = raw[2:8]
            mac = mac[::-1]
            mac = mac.hex().upper()
            mac = ':'.join(mac[i:i+2] for i in range(0, len(mac), 2))
            line.append(mac)
            rpi = raw[8:];
            line.append(rpi.hex().upper())
            line = [str(e) for e in line]
            line = ", ".join(line)
            f.write(line+'\n')
            f.flush()
            print("\r%7d, %s" % (count, line), end="")
            sys.stdout.flush()
            count += 1
            if count==num_pts:
                break;
except KeyboardInterrupt:
    pass

s.write(b'zz\n')   #  Command to stop sending data to serial port
s.flush()
s.close()
f.close()

