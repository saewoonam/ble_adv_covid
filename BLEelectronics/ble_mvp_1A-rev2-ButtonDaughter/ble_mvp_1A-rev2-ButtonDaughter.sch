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
Wire Notes Line
	1050 3350 3550 3350
Wire Notes Line
	3550 900  1050 900 
Wire Notes Line
	7850 900  3900 900 
Wire Notes Line
	3900 3350 7850 3350
Wire Notes Line
	3900 3550 5900 3550
Wire Notes Line
	5900 3550 5900 5500
Wire Notes Line
	5900 5500 3900 5500
Wire Notes Line
	3900 5500 3900 3550
Wire Notes Line
	6200 3550 6200 5500
Wire Notes Line
	7850 5500 7850 3550
Wire Notes Line
	7850 900  7850 3350
Wire Notes Line
	3900 900  3900 3350
Wire Notes Line
	3550 900  3550 3350
Wire Notes Line
	1050 900  1050 3350
NoConn ~ 5300 2200
NoConn ~ 6500 2000
NoConn ~ 6500 2300
NoConn ~ 5300 2300
Text Notes 3950 3300 0    50   ~ 0
Through hole pin header for Nordic Dongle
Text Label 6500 2100 0    50   ~ 0
SDA
Text Label 5300 2100 2    50   ~ 0
SCL
Text Notes 3950 2750 0    50   ~ 0
~CS~ - P0.17\nCLK - P0.19\nSI - P0.20\nSO - P0.21\n~WP~ - P0.22\n~RESET~ (SIO3 - pin7) - P0.23\nPinouts from development board schematic\n
Text Label 5300 2000 2    50   ~ 0
~RESET~
Text Label 5300 1800 2    50   ~ 0
~WP~
Text Notes 3950 2950 0    50   ~ 0
P1.15 is recommended for low frequency GPIO (<10kHz) due to\nproximity to the Antenna. Only used for pinging the RTC on startup.
Text Label 5300 1700 2    50   ~ 0
SCLK
Text Label 5300 1900 2    50   ~ 0
SI
Text Label 5300 1500 2    50   ~ 0
~CS~
Text Label 5300 1600 2    50   ~ 0
SO
Text Notes 3950 3050 0    50   ~ 0
GPIO not marked for any other function or low frequency include P0.13, 15, 17, 20, 22, 24, P1.00
Text Label 6500 1600 0    50   ~ 0
VDD_3V
Text Label 6500 1500 0    50   ~ 0
5Vusb
$Comp
L nordic_nrf52840_breakout:Nordic_nRF52840_breakout_noSWpins J1
U 1 1 5EA6E901
P 5900 1950
F 0 "J1" H 5900 1950 50  0000 C CNN
F 1 "Nordic_nRF52840_breakout" H 5900 2700 50  0000 C CNN
F 2 "0my_footprints:Nordic_nRF52840_Narrowed_FeatherHeader" H 5900 2700 50  0001 C CNN
F 3 "https://infocenter.nordicsemi.com/index.jsp?topic=%2Fps_nrf52840%2Fpin.html&cp=3_0_0_6_0_0&anchor=aqfn73" H 6200 2650 50  0001 C CNN
F 4 "Nordic Semiconductor ASA" H 0   0   50  0001 C CNN "MFR"
F 5 "NRF52840-DONGLE" H 0   0   50  0001 C CNN "MPN"
F 6 "1490-1073-ND" H 0   0   50  0001 C CNN "DPN"
F 7 "-" H 0   0   50  0001 C CNN "LCSCPN"
F 8 "-" H 0   0   50  0001 C CNN "SPR"
F 9 "-" H 0   0   50  0001 C CNN "SPN"
F 10 "-" H 0   0   50  0001 C CNN "SIM"
	1    5900 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5EA772EE
P 5300 2400
F 0 "#PWR05" H 5300 2150 50  0001 C CNN
F 1 "GND" V 5305 2272 50  0000 R CNN
F 2 "" H 5300 2400 50  0001 C CNN
F 3 "" H 5300 2400 50  0001 C CNN
	1    5300 2400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5EA75FDA
P 6500 2400
F 0 "#PWR08" H 6500 2150 50  0001 C CNN
F 1 "GND" V 6505 2272 50  0000 R CNN
F 2 "" H 6500 2400 50  0001 C CNN
F 3 "" H 6500 2400 50  0001 C CNN
	1    6500 2400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5EA74258
P 6500 1700
F 0 "#PWR07" H 6500 1450 50  0001 C CNN
F 1 "GND" V 6505 1572 50  0000 R CNN
F 2 "" H 6500 1700 50  0001 C CNN
F 3 "" H 6500 1700 50  0001 C CNN
	1    6500 1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1750 2300 1750 2250
Text Notes 1150 1100 0    50   ~ 0
20mm diam. coin cell holder
$Comp
L BAT-HLD-001:BAT-HLD-001 U1
U 1 1 5E9C706C
P 1650 1700
F 0 "U1" H 1925 1903 60  0000 C CNN
F 1 "BAT-HLD-001" H 1925 1797 60  0000 C CNN
F 2 "0my_footprints:BAT-HLD-001" H 1934 1358 60  0001 C CNN
F 3 "https://linxtechnologies.com/wp/wp-content/uploads/catalog-battery-holders.pdf" H 1650 1700 60  0001 C CNN
F 4 "Linx Technologies Inc." H 0   0   50  0001 C CNN "MFR"
F 5 "BAT-HLD-001" H 0   0   50  0001 C CNN "MPN"
F 6 "BAT-HLD-001-ND" H 0   0   50  0001 C CNN "DPN"
F 7 "-" H 0   0   50  0001 C CNN "LCSCPN"
F 8 "-" H 0   0   50  0001 C CNN "SPR"
F 9 "-" H 0   0   50  0001 C CNN "SPN"
F 10 "-" H 0   0   50  0001 C CNN "SIM"
	1    1650 1700
	0    -1   1    0   
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5ED9F9E5
P 4900 4200
F 0 "SW1" H 4900 4485 50  0000 C CNN
F 1 "SW_Push" H 4900 4394 50  0000 C CNN
F 2 "0my_footprints:TS-1187A-SMD_button" H 4900 4400 50  0001 C CNN
F 3 "~" H 4900 4400 50  0001 C CNN
	1    4900 4200
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 5ED9FE93
P 4900 4900
F 0 "SW2" H 4900 5185 50  0000 C CNN
F 1 "SW_Push" H 4900 5094 50  0000 C CNN
F 2 "0my_footprints:TS-1187A-SMD_button" H 4900 5100 50  0001 C CNN
F 3 "~" H 4900 5100 50  0001 C CNN
	1    4900 4900
	1    0    0    -1  
$EndComp
Text Notes 3950 5450 0    50   ~ 0
Check need for series resistors
Text Notes 3950 5300 0    50   ~ 0
Big buttons
$Comp
L Device:R R1
U 1 1 5EDA175A
P 5600 4350
F 0 "R1" H 5670 4396 50  0000 L CNN
F 1 "0" H 5670 4305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5530 4350 50  0001 C CNN
F 3 "~" H 5600 4350 50  0001 C CNN
	1    5600 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5EDA2493
P 5600 5050
F 0 "R2" H 5670 5096 50  0000 L CNN
F 1 "0" H 5670 5005 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5530 5050 50  0001 C CNN
F 3 "~" H 5600 5050 50  0001 C CNN
	1    5600 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4200 4550 4200
Wire Wire Line
	4700 4900 4550 4900
Wire Wire Line
	5100 4200 5600 4200
Wire Wire Line
	5100 4900 5600 4900
$Comp
L power:GND #PWR0101
U 1 1 5EDA3402
P 5600 4500
F 0 "#PWR0101" H 5600 4250 50  0001 C CNN
F 1 "GND" H 5605 4327 50  0000 C CNN
F 2 "" H 5600 4500 50  0001 C CNN
F 3 "" H 5600 4500 50  0001 C CNN
	1    5600 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EDA3C8A
P 5600 5200
F 0 "#PWR0102" H 5600 4950 50  0001 C CNN
F 1 "GND" H 5605 5027 50  0000 C CNN
F 2 "" H 5600 5200 50  0001 C CNN
F 3 "" H 5600 5200 50  0001 C CNN
	1    5600 5200
	1    0    0    -1  
$EndComp
Text Label 6800 1800 0    50   ~ 0
BigButtonA
Text Label 6800 1900 0    50   ~ 0
BigButtonB
Wire Wire Line
	6800 1800 6500 1800
Wire Wire Line
	6800 1900 6500 1900
Text Label 4550 4200 2    50   ~ 0
BigButtonA
Text Label 4550 4900 2    50   ~ 0
BigButtonB
$Comp
L SpringFinger:Spring_Finger S1
U 1 1 5EDB1F7C
P 6750 4150
F 0 "S1" H 6830 4139 50  0000 L CNN
F 1 "Spring_Finger" H 6830 4048 50  0000 L CNN
F 2 "" H 6750 4150 50  0001 C CNN
F 3 "~" H 6750 4150 50  0001 C CNN
	1    6750 4150
	1    0    0    -1  
$EndComp
Text Notes 6300 5400 0    50   ~ 0
Spring finger for battery sense
Wire Notes Line
	7850 3550 6200 3550
Wire Notes Line
	7850 5500 6200 5500
Wire Wire Line
	6750 4350 6750 4600
Wire Wire Line
	6750 4600 6900 4600
Wire Wire Line
	6800 2200 6500 2200
Text Label 6800 2200 0    50   ~ 0
BatterySense
Text Label 6900 4600 0    50   ~ 0
BatterySense
$EndSCHEMATC
