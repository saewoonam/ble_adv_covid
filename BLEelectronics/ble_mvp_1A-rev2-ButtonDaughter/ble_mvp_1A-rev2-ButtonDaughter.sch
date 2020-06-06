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
	7850 900  3900 900 
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
NoConn ~ 5300 2200
NoConn ~ 6500 2000
NoConn ~ 6500 2300
NoConn ~ 5300 2300
Text Notes 3950 1050 0    50   ~ 0
Through hole pin header for Nordic Dongle
Text Label 6500 2100 0    50   ~ 0
SDA
Text Label 5300 2100 2    50   ~ 0
SCL
Text Label 5300 2000 2    50   ~ 0
~RESET~
Text Label 5300 1800 2    50   ~ 0
~WP~
Text Label 5300 1700 2    50   ~ 0
SCLK
Text Label 5300 1900 2    50   ~ 0
SI
Text Label 5300 1500 2    50   ~ 0
~CS~
Text Label 5300 1600 2    50   ~ 0
SO
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
$Comp
L Switch:SW_Push SW1
U 1 1 5ED9F9E5
P 4900 4100
F 0 "SW1" H 4900 4385 50  0000 C CNN
F 1 "SW_Push" H 4900 4294 50  0000 C CNN
F 2 "0my_footprints:TS-1187A-SMD_button" H 4900 4300 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/2002271432_XKB-Enterprise-TS-1187A-C-G-B_C318886.pdf" H 4900 4300 50  0001 C CNN
F 4 "XKB Enterprise" H 4900 4100 50  0001 C CNN "MFR"
F 5 "TS-1187A-C-G-B" H 4900 4100 50  0001 C CNN "MPN"
F 6 "C318886" H 4900 4100 50  0001 C CNN "LCSCPN"
	1    4900 4100
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 5ED9FE93
P 4900 4600
F 0 "SW2" H 4900 4885 50  0000 C CNN
F 1 "SW_Push" H 4900 4794 50  0000 C CNN
F 2 "0my_footprints:TS-1187A-SMD_button" H 4900 4800 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/2002271432_XKB-Enterprise-TS-1187A-C-G-B_C318886.pdf" H 4900 4800 50  0001 C CNN
F 4 "XKB Enterprise" H 4900 4600 50  0001 C CNN "MFR"
F 5 "TS-1187A-C-G-B" H 4900 4600 50  0001 C CNN "MPN"
F 6 "C318886" H 4900 4600 50  0001 C CNN "LCSCPN"
	1    4900 4600
	1    0    0    -1  
$EndComp
Text Notes 3950 5450 0    50   ~ 0
The buttons are active low, meaning that the \ninput will be connected to ground when the\nbutton is activated. The buttons have no \nexternal pull-up resistor, and therefore, to \nuse the buttons, the pins must be configured \nas an input with an internal pull-up resistor.
Text Notes 3950 3700 0    50   ~ 0
Big buttons
$Comp
L Device:R R2
U 1 1 5EDA2493
P 5350 4600
F 0 "R2" H 5420 4646 50  0000 L CNN
F 1 "0" H 5420 4555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5280 4600 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Uniroyal-Elec-0603WAF0000T5E_C21189.pdf" H 5350 4600 50  0001 C CNN
F 4 "Uniroyal Elec" H 5350 4600 50  0001 C CNN "MFR"
F 5 "0603WAF0000T5E" H 5350 4600 50  0001 C CNN "MPN"
F 6 "C21189" H 5350 4600 50  0001 C CNN "LCSCPN"
	1    5350 4600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 4100 4550 4100
Wire Wire Line
	4700 4600 4550 4600
$Comp
L power:GND #PWR0102
U 1 1 5EDA3C8A
P 5600 4700
F 0 "#PWR0102" H 5600 4450 50  0001 C CNN
F 1 "GND" H 5605 4527 50  0000 C CNN
F 2 "" H 5600 4700 50  0001 C CNN
F 3 "" H 5600 4700 50  0001 C CNN
	1    5600 4700
	1    0    0    -1  
$EndComp
Text Label 6800 1900 0    50   ~ 0
BigButtonA
Text Label 6800 2200 0    50   ~ 0
BigButtonB
Wire Wire Line
	6800 1800 6500 1800
Wire Wire Line
	6800 1900 6500 1900
Text Label 4550 4100 2    50   ~ 0
BigButtonA
Text Label 4550 4600 2    50   ~ 0
BigButtonB
$Comp
L SpringFinger:Spring_Finger S1
U 1 1 5EDB1F7C
P 6750 4150
F 0 "S1" H 6830 4139 50  0000 L CNN
F 1 "Spring_Finger" H 6830 4048 50  0000 L CNN
F 2 "0my_footprints:SpringFingerGeneric" H 6750 4150 50  0001 C CNN
F 3 "https://cdn.harwin.com/pdfs/S7131-45R.pdf" H 6750 4150 50  0001 C CNN
F 4 "Harwin Inc." H 6750 4150 50  0001 C CNN "MFR"
F 5 "S7131-45R" H 6750 4150 50  0001 C CNN "MPN"
F 6 "952-2733-1-ND" H 6750 4150 50  0001 C CNN "DPN"
	1    6750 4150
	1    0    0    -1  
$EndComp
Text Notes 6250 3700 0    50   ~ 0
Spring finger for battery sense
Wire Notes Line
	7850 5500 6200 5500
Wire Wire Line
	6750 4350 6750 4600
Wire Wire Line
	6750 4600 6900 4600
Wire Wire Line
	6800 2200 6500 2200
Text Label 6800 1800 0    50   ~ 0
BatterySense
Text Label 6900 4600 0    50   ~ 0
BatterySense
Text Notes 6250 5450 0    50   ~ 0
Clearance between batt holder \nand board is 1.5mm. \nSpring must be taller than this.
Wire Notes Line
	7850 3550 6200 3550
Wire Notes Line
	3900 3550 5900 3550
Text Notes 3950 3200 0    50   ~ 0
P1.15 is recommended for low frequency GPIO (<10kHz) due to\nproximity to the Antenna. Only used for pinging the RTC on startup.
Text Notes 3950 3300 0    50   ~ 0
GPIO not marked for any other function or low frequency include P0.13, 15, 17, 20, 22, 24, P1.00
Text Notes 3950 2950 0    50   ~ 0
~CS~ - P0.17\nCLK - P0.19\nSI - P0.20\nSO - P0.21\n~WP~ - P0.22\n~RESET~ (SIO3 - pin7) - P0.23\nPinouts from development board schematic\n
Wire Notes Line
	3900 3350 7850 3350
$Comp
L Device:R R1
U 1 1 5EDA175A
P 5350 4100
F 0 "R1" H 5420 4146 50  0000 L CNN
F 1 "0" H 5420 4055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5280 4100 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Uniroyal-Elec-0603WAF0000T5E_C21189.pdf" H 5350 4100 50  0001 C CNN
F 4 "Uniroyal Elec" H 5350 4100 50  0001 C CNN "MFR"
F 5 "0603WAF0000T5E" H 5350 4100 50  0001 C CNN "MPN"
F 6 "C21189" H 5350 4100 50  0001 C CNN "LCSCPN"
	1    5350 4100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5500 4100 5600 4100
Wire Wire Line
	5200 4100 5100 4100
Wire Wire Line
	5600 4100 5600 4600
Wire Wire Line
	5500 4600 5600 4600
Connection ~ 5600 4600
Wire Wire Line
	5600 4600 5600 4700
Wire Wire Line
	5200 4600 5100 4600
$EndSCHEMATC
