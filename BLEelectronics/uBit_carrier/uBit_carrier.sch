EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Memory_Flash:W25Q32JVSS U1
U 1 1 5EC613D0
P 6900 3300
F 0 "U1" H 6900 3881 50  0000 C CNN
F 1 "W25Q32JVSS" H 6900 3790 50  0000 C CNN
F 2 "Package_SO:SOIC-8_5.23x5.23mm_P1.27mm" H 6900 3300 50  0001 C CNN
F 3 "http://www.winbond.com/resource-files/w25q32jv%20revg%2003272018%20plus.pdf" H 6900 3300 50  0001 C CNN
	1    6900 3300
	1    0    0    -1  
$EndComp
$Comp
L lib_microbit_connector:microbit_edge_connector J1
U 1 1 5EC62855
P 5000 3500
F 0 "J1" H 5000 5525 50  0000 C CNN
F 1 "microbit_edge_connector" H 5000 5434 50  0000 C CNN
F 2 "Connector_PCBEdge:4UCON_10156_2x40_P1.27mm_Socket_Horizontal" H 4900 3400 50  0001 C CNN
F 3 "https://www.microbit.co.uk/device/pins" H 4900 3400 50  0001 C CNN
	1    5000 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3900 6200 3900
Wire Wire Line
	6200 3900 6200 3200
Wire Wire Line
	6400 3400 5500 3400
Wire Wire Line
	6400 3200 6200 3200
Text Label 5500 3200 0    50   ~ 0
mosi
Text Label 5500 3300 0    50   ~ 0
miso
Text Label 7400 3100 0    50   ~ 0
mosi
Text Label 7400 3200 0    50   ~ 0
miso
Text Label 7400 3400 0    50   ~ 0
wp
Text Label 5500 3100 0    50   ~ 0
wp
Text Label 7400 3500 0    50   ~ 0
hold
Text Label 5500 4300 0    50   ~ 0
hold
Wire Wire Line
	5500 2500 5600 2500
Wire Wire Line
	6900 2500 6900 2900
Wire Wire Line
	6900 3700 6900 4050
$Comp
L power:GND #PWR02
U 1 1 5EC692F8
P 6900 4050
F 0 "#PWR02" H 6900 3800 50  0001 C CNN
F 1 "GND" H 6905 3877 50  0000 C CNN
F 2 "" H 6900 4050 50  0001 C CNN
F 3 "" H 6900 4050 50  0001 C CNN
	1    6900 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5EC69338
P 5750 1700
F 0 "#PWR01" H 5750 1450 50  0001 C CNN
F 1 "GND" H 5755 1527 50  0000 C CNN
F 2 "" H 5750 1700 50  0001 C CNN
F 3 "" H 5750 1700 50  0001 C CNN
	1    5750 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 1700 5550 1700
$Comp
L Device:C C1
U 1 1 5EC69CB4
P 6900 2350
F 0 "C1" H 7015 2396 50  0000 L CNN
F 1 "0.1uF" H 7015 2305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6938 2200 50  0001 C CNN
F 3 "~" H 6900 2350 50  0001 C CNN
	1    6900 2350
	1    0    0    -1  
$EndComp
Connection ~ 6900 2500
Wire Wire Line
	5750 1700 6900 1700
Wire Wire Line
	6900 1700 6900 2200
Connection ~ 5750 1700
$Comp
L Regulator_Linear:XC6206PxxxMR U2
U 1 1 5EC6BB5B
P 7900 2500
F 0 "U2" H 7900 2649 50  0000 C CNN
F 1 "XC6206PxxxMR" H 7900 2740 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7900 2725 50  0001 C CIN
F 3 "https://www.torexsemi.com/file/xc6206/XC6206.pdf" H 7900 2500 50  0001 C CNN
	1    7900 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	6900 1700 7450 1700
Wire Wire Line
	7900 1700 7900 2200
Connection ~ 6900 1700
Wire Wire Line
	6900 2500 7450 2500
$Comp
L Device:C C2
U 1 1 5EC738B4
P 7450 2350
F 0 "C2" H 7565 2396 50  0000 L CNN
F 1 "1uF" H 7565 2305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7488 2200 50  0001 C CNN
F 3 "~" H 7450 2350 50  0001 C CNN
	1    7450 2350
	1    0    0    -1  
$EndComp
Connection ~ 7450 2500
Wire Wire Line
	7450 2500 7600 2500
Wire Wire Line
	7450 2200 7450 1700
Connection ~ 7450 1700
Wire Wire Line
	7450 1700 7900 1700
$Comp
L Device:C C3
U 1 1 5EC74158
P 8350 2300
F 0 "C3" H 8465 2346 50  0000 L CNN
F 1 "1uF" H 8465 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8388 2150 50  0001 C CNN
F 3 "~" H 8350 2300 50  0001 C CNN
	1    8350 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2500 8350 2500
Wire Wire Line
	8350 2500 8350 2450
Wire Wire Line
	7900 1700 8350 1700
Wire Wire Line
	8350 1700 8350 2150
Connection ~ 7900 1700
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5EC756CE
P 9200 2500
F 0 "J2" H 9172 2382 50  0000 R CNN
F 1 "Conn_01x02_Male" H 9172 2473 50  0000 R CNN
F 2 "Connector_JST:JST_EH_S2B-EH_1x02_P2.50mm_Horizontal" H 9200 2500 50  0001 C CNN
F 3 "~" H 9200 2500 50  0001 C CNN
	1    9200 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	8350 1700 9000 1700
Wire Wire Line
	9000 1700 9000 2400
Connection ~ 8350 1700
Wire Wire Line
	5550 1700 5550 1800
Wire Wire Line
	5550 2200 5500 2200
Connection ~ 5550 1700
Wire Wire Line
	5550 1700 5750 1700
Wire Wire Line
	5500 2100 5550 2100
Connection ~ 5550 2100
Wire Wire Line
	5550 2100 5550 2200
Wire Wire Line
	5500 2000 5550 2000
Connection ~ 5550 2000
Wire Wire Line
	5550 2000 5550 2100
Wire Wire Line
	5500 1900 5550 1900
Connection ~ 5550 1900
Wire Wire Line
	5550 1900 5550 2000
Wire Wire Line
	5500 1800 5550 1800
Connection ~ 5550 1800
Wire Wire Line
	5550 1800 5550 1900
Wire Wire Line
	5600 2500 5600 2600
Wire Wire Line
	5600 3000 5500 3000
Connection ~ 5600 2500
Wire Wire Line
	5500 2900 5600 2900
Connection ~ 5600 2900
Wire Wire Line
	5600 2900 5600 3000
Wire Wire Line
	5500 2800 5600 2800
Connection ~ 5600 2800
Wire Wire Line
	5600 2800 5600 2900
Wire Wire Line
	5500 2700 5600 2700
Connection ~ 5600 2700
Wire Wire Line
	5600 2700 5600 2800
Wire Wire Line
	5500 2600 5600 2600
Connection ~ 5600 2600
Wire Wire Line
	5600 2600 5600 2700
Wire Wire Line
	5500 5200 5600 5200
Wire Wire Line
	5600 5200 5600 5300
Wire Wire Line
	5600 5500 5500 5500
Wire Wire Line
	5500 5400 5600 5400
Connection ~ 5600 5400
Wire Wire Line
	5600 5400 5600 5500
Wire Wire Line
	5500 5300 5600 5300
Connection ~ 5600 5300
Wire Wire Line
	5600 5300 5600 5400
Wire Wire Line
	5500 4700 5600 4700
Wire Wire Line
	5600 4700 5600 4600
Wire Wire Line
	5600 4400 5500 4400
Wire Wire Line
	5500 4500 5600 4500
Connection ~ 5600 4500
Wire Wire Line
	5600 4500 5600 4400
Wire Wire Line
	5500 4600 5600 4600
Connection ~ 5600 4600
Wire Wire Line
	5600 4600 5600 4500
Wire Wire Line
	5500 3500 5600 3500
Wire Wire Line
	5600 3500 5600 3600
Wire Wire Line
	5600 3800 5500 3800
Wire Wire Line
	5500 3700 5600 3700
Connection ~ 5600 3700
Wire Wire Line
	5600 3700 5600 3800
Wire Wire Line
	5500 3600 5600 3600
Connection ~ 5600 3600
Wire Wire Line
	5600 3600 5600 3700
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5EC8B4A7
P 5750 1700
F 0 "#FLG0101" H 5750 1775 50  0001 C CNN
F 1 "PWR_FLAG" H 5750 1873 50  0000 C CNN
F 2 "" H 5750 1700 50  0001 C CNN
F 3 "~" H 5750 1700 50  0001 C CNN
	1    5750 1700
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5EC8BC46
P 8800 2500
F 0 "#FLG0102" H 8800 2575 50  0001 C CNN
F 1 "PWR_FLAG" H 8800 2673 50  0000 C CNN
F 2 "" H 8800 2500 50  0001 C CNN
F 3 "~" H 8800 2500 50  0001 C CNN
	1    8800 2500
	1    0    0    -1  
$EndComp
Text Label 6250 2500 0    50   ~ 0
3.3V
NoConn ~ 5500 5600
NoConn ~ 5500 5100
NoConn ~ 5500 5000
NoConn ~ 5500 4900
NoConn ~ 5500 4800
NoConn ~ 5500 4200
NoConn ~ 5500 4100
NoConn ~ 5500 4000
NoConn ~ 5500 2400
NoConn ~ 5500 2300
Wire Wire Line
	8800 2500 9000 2500
Connection ~ 8800 2500
Connection ~ 8350 2500
Wire Wire Line
	8350 2500 8800 2500
Wire Wire Line
	5600 2500 6900 2500
Text Label 5850 3400 0    50   ~ 0
sclk
Text Label 5800 3900 0    50   ~ 0
~CS
$EndSCHEMATC
