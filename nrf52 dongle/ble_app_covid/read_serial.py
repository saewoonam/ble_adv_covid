import serial
import os
import time
s = serial.Serial('/dev/tty.usbmodemCDD1529701C81')
count = 0
while True:
    try:
        while s.in_waiting:  # Or: while ser.inWaiting():
            print(count, s.readline())
            count = count + 1
        time.sleep(0.1)
    except Exception as e:
        print(e)
        s.close()
        count = 0
        while not os.path.exists('/dev/tty.usbmodemCDD1529701C81'):
            time.sleep(0.1)
            pass
        s = serial.Serial('/dev/tty.usbmodemCDD1529701C81')

