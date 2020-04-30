EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
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
L BAT-HLD-001:BAT-HLD-001 U2
U 1 1 5E9C706C
P 1450 1600
F 0 "U2" H 1725 1803 60  0000 C CNN
F 1 "BAT-HLD-001" H 1725 1697 60  0000 C CNN
F 2 "0my_footprints:BAT-HLD-001" H 1734 1258 60  0001 C CNN
F 3 "https://linxtechnologies.com/wp/wp-content/uploads/catalog-battery-holders.pdf" H 1450 1600 60  0001 C CNN
F 4 "Linx Technologies Inc." H -200 -100 50  0001 C CNN "MFR"
F 5 "BAT-HLD-001" H -200 -100 50  0001 C CNN "MPN"
F 6 "BAT-HLD-001-ND" H -200 -100 50  0001 C CNN "DPN"
F 7 "-" H -200 -100 50  0001 C CNN "LCSCPN"
F 8 "-" H -200 -100 50  0001 C CNN "SPR"
F 9 "-" H -200 -100 50  0001 C CNN "SPN"
F 10 "-" H -200 -100 50  0001 C CNN "SIM"
	1    1450 1600
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5E9D6756
P 2300 2350
F 0 "#PWR01" H 2300 2100 50  0001 C CNN
F 1 "GND" H 2305 2177 50  0000 C CNN
F 2 "" H 2300 2350 50  0001 C CNN
F 3 "" H 2300 2350 50  0001 C CNN
	1    2300 2350
	-1   0    0    -1  
$EndComp
$Comp
L LTC4054LES5-4.2_TRPBF:LTC4054LES5-4.2#TRPBF IC4
U 1 1 5E9DF23D
P 4250 2100
F 0 "IC4" H 4050 2600 50  0000 C CNN
F 1 "LTC4054LES5-4.2#TRPBF" H 4250 1600 50  0000 C CNN
F 2 "0my_footprints:LTC4054LES5-4.2_TRPBF" H 4250 2100 50  0001 L BNN
F 3 "http://www.linear.com/docs/2068" H 4250 2100 50  0001 L BNN
F 4 "Linear Technology" H 4250 2100 50  0001 L BNN "Field4"
F 5 "Linear Technology/Analog Devices" H -5150 -100 50  0001 C CNN "MFR"
F 6 "LTC4054LES5-4.2#TRPBF" H -5150 -100 50  0001 C CNN "MPN"
F 7 "LTC4054LES5-4.2#TRPBFCT-ND" H -5150 -100 50  0001 C CNN "DPN"
F 8 "-" H -5150 -100 50  0001 C CNN "LCSCPN"
F 9 "-" H -5150 -100 50  0001 C CNN "SPR"
F 10 "-" H -5150 -100 50  0001 C CNN "SPN"
F 11 "-" H -5150 -100 50  0001 C CNN "SIM"
	1    4250 2100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID1
U 1 1 5E9C7124
P 1200 6900
F 0 "FID1" H 1285 6946 50  0000 L CNN
F 1 "Fiducial" H 1285 6855 50  0000 L CNN
F 2 "Fiducial:Fiducial_0.5mm_Mask1mm" H 1200 6900 50  0001 C CNN
F 3 "~" H 1200 6900 50  0001 C CNN
F 4 "-" H 0   -100 50  0001 C CNN "MFR"
F 5 "-" H 0   -100 50  0001 C CNN "MPN"
F 6 "-" H 0   -100 50  0001 C CNN "DPN"
F 7 "-" H 0   -100 50  0001 C CNN "LCSCPN"
F 8 "-" H 0   -100 50  0001 C CNN "SPR"
F 9 "-" H 0   -100 50  0001 C CNN "SPN"
F 10 "-" H 0   -100 50  0001 C CNN "SIM"
	1    1200 6900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID2
U 1 1 5E9C7A0B
P 1200 7250
F 0 "FID2" H 1285 7296 50  0000 L CNN
F 1 "Fiducial" H 1285 7205 50  0000 L CNN
F 2 "Fiducial:Fiducial_0.5mm_Mask1mm" H 1200 7250 50  0001 C CNN
F 3 "~" H 1200 7250 50  0001 C CNN
F 4 "-" H 0   0   50  0001 C CNN "MFR"
F 5 "-" H 0   0   50  0001 C CNN "MPN"
F 6 "-" H 0   0   50  0001 C CNN "DPN"
F 7 "-" H 0   0   50  0001 C CNN "LCSCPN"
F 8 "-" H 0   0   50  0001 C CNN "SPR"
F 9 "-" H 0   0   50  0001 C CNN "SPN"
F 10 "-" H 0   0   50  0001 C CNN "SIM"
	1    1200 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5EA027B7
P 3600 1550
F 0 "C3" H 3715 1596 50  0000 L CNN
F 1 "1uF" H 3715 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3638 1400 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL10A105KO5LNNC.jsp" H 3600 1550 50  0001 C CNN
F 4 "Samsung" H -5150 -100 50  0001 C CNN "MFR"
F 5 "CL10A105KO5LNNC" H -5150 -100 50  0001 C CNN "MPN"
F 6 "1276-1862-1-ND" H -5150 -100 50  0001 C CNN "DPN"
F 7 "-" H -5150 -100 50  0001 C CNN "LCSCPN"
F 8 "-" H -5150 -100 50  0001 C CNN "SPR"
F 9 "-" H -5150 -100 50  0001 C CNN "SPN"
F 10 "-" H -5150 -100 50  0001 C CNN "SIM"
	1    3600 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5EA027BD
P 3600 1700
F 0 "#PWR05" H 3600 1450 50  0001 C CNN
F 1 "GND" H 3605 1527 50  0000 C CNN
F 2 "" H 3600 1700 50  0001 C CNN
F 3 "" H 3600 1700 50  0001 C CNN
	1    3600 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5EA04301
P 5100 2300
F 0 "R6" H 5170 2346 50  0000 L CNN
F 1 "1.69K" H 5170 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5030 2300 50  0001 C CNN
F 3 "~" H 5100 2300 50  0001 C CNN
F 4 "Yageo" H -5150 -100 50  0001 C CNN "MFR"
F 5 "RC0201FR-071K69L" H -5150 -100 50  0001 C CNN "MPN"
F 6 "YAG2487CT-ND" H -5150 -100 50  0001 C CNN "DPN"
F 7 "-" H -5150 -100 50  0001 C CNN "LCSCPN"
F 8 "-" H -5150 -100 50  0001 C CNN "SPR"
F 9 "-" H -5150 -100 50  0001 C CNN "SPN"
F 10 "-" H -5150 -100 50  0001 C CNN "SIM"
	1    5100 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5EA08150
P 5400 1950
F 0 "R7" V 5193 1950 50  0000 C CNN
F 1 "0" V 5284 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5330 1950 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 5400 1950 50  0001 C CNN
F 4 "RC0603JR-070RL" V 5400 1950 50  0001 C CNN "MPN"
F 5 "Yageo" V 5400 1950 50  0001 C CNN "MFR"
F 6 "311-0.0GRCT-ND" V 5400 1950 50  0001 C CNN "DPN"
F 7 "-" H -5000 -100 50  0001 C CNN "LCSCPN"
F 8 "-" H -5000 -100 50  0001 C CNN "SPR"
F 9 "-" H -5000 -100 50  0001 C CNN "SPN"
F 10 "-" H -5000 -100 50  0001 C CNN "SIM"
	1    5400 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5EA09643
P 4250 1250
F 0 "R5" V 4043 1250 50  0000 C CNN
F 1 "0" V 4134 1250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4180 1250 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 4250 1250 50  0001 C CNN
F 4 "RC0603JR-070RL" V 4250 1250 50  0001 C CNN "MPN"
F 5 "Yageo" V 4250 1250 50  0001 C CNN "MFR"
F 6 "311-0.0GRCT-ND" V 4250 1250 50  0001 C CNN "DPN"
F 7 "-" H -5150 -100 50  0001 C CNN "LCSCPN"
F 8 "-" H -5150 -100 50  0001 C CNN "SPR"
F 9 "-" H -5150 -100 50  0001 C CNN "SPN"
F 10 "-" H -5150 -100 50  0001 C CNN "SIM"
	1    4250 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5EA09E9A
P 4950 2450
F 0 "#PWR06" H 4950 2200 50  0001 C CNN
F 1 "GND" H 4955 2277 50  0000 C CNN
F 2 "" H 4950 2450 50  0001 C CNN
F 3 "" H 4950 2450 50  0001 C CNN
	1    4950 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5EA9F122
P 8750 5700
F 0 "#PWR011" H 8750 5450 50  0001 C CNN
F 1 "GND" H 8755 5527 50  0000 C CNN
F 2 "" H 8750 5700 50  0001 C CNN
F 3 "" H 8750 5700 50  0001 C CNN
	1    8750 5700
	1    0    0    -1  
$EndComp
$Comp
L Timer_RTC:PCF8523T IC2
U 1 1 5E9F84DB
P 7450 5600
F 0 "IC2" H 7800 6050 50  0000 L CNN
F 1 "PCF8523T" H 7700 5950 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 8250 5250 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/PCF8523.pdf" H 7450 5600 50  0001 C CNN
F 4 "NXP USA Inc." H 300 1500 50  0001 C CNN "MFR"
F 5 "PCF8523T/1,118" H 300 1500 50  0001 C CNN "MPN"
F 6 "568-5306-1-ND" H 300 1500 50  0001 C CNN "DPN"
F 7 "-" H 300 1500 50  0001 C CNN "LCSCPN"
F 8 "-" H 300 1500 50  0001 C CNN "SPR"
F 9 "-" H 300 1500 50  0001 C CNN "SPN"
F 10 "-" H 300 1500 50  0001 C CNN "SIM"
	1    7450 5600
	1    0    0    -1  
$EndComp
$Comp
L mx25R6435FM2IL:MX25R6435FM2IL0 IC3
U 1 1 5E9F9A1A
P 8750 5400
F 0 "IC3" H 9600 5750 60  0000 C CNN
F 1 "MX25R6435FM2IL0" H 9600 5600 60  0000 C CNN
F 2 "0my_footprints:MX25R6435FM2IL0" H 10050 5640 60  0001 C CNN
F 3 "http://www.macronix.com/Lists/Datasheet/Attachments/7428/MX25R6435F,%20Wide%20Range,%2064Mb,%20v1.4.pdf" H 8750 5400 60  0001 C CNN
F 4 "Macronix" H 0   1400 50  0001 C CNN "MFR"
F 5 "MX25R6435FM2IL0" H 0   1400 50  0001 C CNN "MPN"
F 6 "1092-1200-ND" H 0   1400 50  0001 C CNN "DPN"
F 7 "-" H 0   1400 50  0001 C CNN "LCSCPN"
F 8 "-" H 0   1400 50  0001 C CNN "SPR"
F 9 "-" H 0   1400 50  0001 C CNN "SPN"
F 10 "-" H 0   1400 50  0001 C CNN "SIM"
	1    8750 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5EA0EA9A
P 7450 6000
F 0 "#PWR0101" H 7450 5750 50  0001 C CNN
F 1 "GND" H 7455 5827 50  0000 C CNN
F 2 "" H 7450 6000 50  0001 C CNN
F 3 "" H 7450 6000 50  0001 C CNN
	1    7450 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5EA074F4
P 6800 5250
F 0 "R9" H 6870 5296 50  0000 L CNN
F 1 "10K" H 6870 5205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6730 5250 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 6800 5250 50  0001 C CNN
F 4 "Yageo" H 350 1500 50  0001 C CNN "MFR"
F 5 "RC0603FR-074K7L" H 350 1500 50  0001 C CNN "MPN"
F 6 "311-4.70KHRCT-ND" H 350 1500 50  0001 C CNN "DPN"
F 7 "-" H 350 1500 50  0001 C CNN "LCSCPN"
F 8 "-" H 350 1500 50  0001 C CNN "SPR"
F 9 "-" H 350 1500 50  0001 C CNN "SPN"
F 10 "-" H 350 1500 50  0001 C CNN "SIM"
	1    6800 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5EA0D031
P 6500 5350
F 0 "R8" H 6570 5396 50  0000 L CNN
F 1 "10K" H 6570 5305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6430 5350 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 6500 5350 50  0001 C CNN
F 4 "Yageo" H 50  1600 50  0001 C CNN "MFR"
F 5 "RC0603FR-074K7L" H 50  1600 50  0001 C CNN "MPN"
F 6 "311-4.70KHRCT-ND" H 50  1600 50  0001 C CNN "DPN"
F 7 "-" H 50  1600 50  0001 C CNN "LCSCPN"
F 8 "-" H 50  1600 50  0001 C CNN "SPR"
F 9 "-" H 50  1600 50  0001 C CNN "SPN"
F 10 "-" H 50  1600 50  0001 C CNN "SIM"
	1    6500 5350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5EA39936
P 2000 7050
F 0 "H1" H 2100 7096 50  0000 L CNN
F 1 "MountingHole" H 2100 7005 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 2000 7050 50  0001 C CNN
F 3 "~" H 2000 7050 50  0001 C CNN
F 4 "-" H 0   0   50  0001 C CNN "MFR"
F 5 "-" H 0   0   50  0001 C CNN "MPN"
F 6 "-" H 0   0   50  0001 C CNN "DPN"
F 7 "-" H 0   0   50  0001 C CNN "LCSCPN"
F 8 "-" H 0   0   50  0001 C CNN "SPR"
F 9 "-" H 0   0   50  0001 C CNN "SPN"
F 10 "-" H 0   0   50  0001 C CNN "SIM"
	1    2000 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D4
U 1 1 5EA54A0B
P 5050 1950
F 0 "D4" H 5050 2166 50  0000 C CNN
F 1 "D_Schottky" H 5050 2075 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 5050 1950 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/SL14PL-SL110PL(SOD-123FL)-B.pdf" H 5050 1950 50  0001 C CNN
F 4 "SL14PL-TP" H 5050 1950 50  0001 C CNN "MPN"
F 5 "Micro Commercial Co" H 5050 1950 50  0001 C CNN "MFR"
F 6 "SL14PL-TPMSCT-ND" H -1100 700 50  0001 C CNN "DPN"
F 7 "-" H -1100 700 50  0001 C CNN "LCSCPN"
F 8 "-" H -1100 700 50  0001 C CNN "SPR"
F 9 "-" H -1100 700 50  0001 C CNN "SPN"
F 10 "-" H -1100 700 50  0001 C CNN "SIM"
	1    5050 1950
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J4
U 1 1 5EA8C546
P 7950 5800
F 0 "J4" V 7842 5848 50  0000 L CNN
F 1 "Conn_01x01_Female" H 7978 5735 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 7950 5800 50  0001 C CNN
F 3 "~" H 7950 5800 50  0001 C CNN
F 4 "-" H 0   1450 50  0001 C CNN "MFR"
F 5 "-" H 0   1450 50  0001 C CNN "MPN"
F 6 "-" H 0   1450 50  0001 C CNN "DPN"
F 7 "-" H 0   1450 50  0001 C CNN "LCSCPN"
F 8 "-" H 0   1450 50  0001 C CNN "SPR"
F 9 "-" H 0   1450 50  0001 C CNN "SPN"
F 10 "-" H 0   1450 50  0001 C CNN "SIM"
	1    7950 5800
	0    1    1    0   
$EndComp
$Comp
L ESD401DPYR:ESD401DPYR U3
U 1 1 5EA48F38
P 2000 1900
F 0 "U3" V 2053 1771 60  0000 R CNN
F 1 "ESD401" V 1947 1771 60  0000 R CNN
F 2 "0my_footprints:ESD401DPYR" H 2000 1840 60  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fesd401" V 1894 1771 60  0001 R CNN
F 4 "Texas Instruments" H -350 -100 50  0001 C CNN "MFR"
F 5 "ESD401DPYR" H -350 -100 50  0001 C CNN "MPN"
F 6 "296-47160-1-ND" H -350 -100 50  0001 C CNN "DPN"
F 7 "-" H -350 -100 50  0001 C CNN "LCSCPN"
F 8 "-" H -350 -100 50  0001 C CNN "SPR"
F 9 "-" H -350 -100 50  0001 C CNN "SPN"
F 10 "-" H -350 -100 50  0001 C CNN "SIM"
	1    2000 1900
	0    -1   -1   0   
$EndComp
Text Notes 1300 1350 0    50   ~ 0
20mm diam. coin cell holder
Text Label 4250 1100 0    50   ~ 0
5Vusb
Text Label 5550 1950 0    50   ~ 0
3V
Text Notes 3450 2900 0    50   ~ 0
Coin cell charger circuit
Text Notes 1150 2900 0    50   ~ 0
CR2032/CR2025 Coin Cell holder \nand ESD/Surge protection
Text Label 2400 1600 0    50   ~ 0
3V
Text Notes 8550 6350 0    50   ~ 0
SPI interface flash memory with SPI
Text Label 10400 5400 0    50   ~ 0
VDD_3V
Text Label 7550 5200 1    50   ~ 0
VDD_3V
Text Notes 6250 6350 0    50   ~ 0
Real time clock module with i2c interface
Text Label 6400 5400 2    50   ~ 0
SCL
Text Label 6400 5500 2    50   ~ 0
SDA
Text Label 8750 5500 2    50   ~ 0
SO
Text Label 10400 5500 0    50   ~ 0
RESET
Text Label 8750 5400 2    50   ~ 0
CS
Text Label 8750 5600 2    50   ~ 0
WP
Text Label 6650 5000 0    50   ~ 0
VDD_3V
Text Notes 1550 2350 0    50   ~ 0
TVS diode for ESD
Text Notes 6250 6050 0    50   ~ 0
Confirm no connect\noscillator IO
Text Label 10400 5600 0    50   ~ 0
SCLK
Text Label 10400 5700 0    50   ~ 0
SI
Text Notes 4600 1400 0    50   ~ 0
Added a Schottkey Diode
Wire Wire Line
	1450 1600 1650 1600
Wire Wire Line
	2300 2200 2300 2350
Wire Wire Line
	4250 1400 3600 1400
Wire Wire Line
	4850 2150 5100 2150
Wire Wire Line
	4850 2400 4850 2450
Wire Wire Line
	4850 2450 4950 2450
Wire Wire Line
	4950 2450 5100 2450
Wire Notes Line
	2850 3000 2850 900 
Wire Notes Line
	1050 900  1050 3000
Wire Notes Line
	3300 3000 5850 3000
Wire Wire Line
	4250 1600 4250 1400
Wire Notes Line
	5850 3000 5850 900 
Wire Notes Line
	5850 900  3300 900 
Wire Notes Line
	3300 900  3300 3000
Wire Notes Line
	6150 4750 8150 4750
Wire Notes Line
	8150 6450 6150 6450
Wire Notes Line
	8450 6450 10800 6450
Wire Notes Line
	10800 4750 8450 4750
Wire Wire Line
	6950 5400 6800 5400
Wire Wire Line
	6800 5400 6400 5400
Wire Wire Line
	6500 5500 6400 5500
Wire Wire Line
	6500 5500 6950 5500
Wire Wire Line
	6500 5200 6500 5100
Wire Wire Line
	6500 5100 6650 5100
Wire Wire Line
	6650 5100 6650 5000
Wire Wire Line
	6650 5100 6800 5100
Wire Wire Line
	5250 1950 5200 1950
Wire Wire Line
	4900 1950 4850 1950
Wire Wire Line
	1550 2200 2000 2200
Connection ~ 1650 1600
Connection ~ 4950 2450
Connection ~ 4250 1400
Connection ~ 6800 5400
Connection ~ 6500 5500
Connection ~ 6650 5100
NoConn ~ 3650 2250
NoConn ~ 6950 5800
NoConn ~ 6950 5700
NoConn ~ 7350 5200
Wire Wire Line
	1650 1600 2000 1600
Wire Wire Line
	1550 2200 1550 2150
Connection ~ 2000 2200
Wire Wire Line
	2000 2200 2300 2200
$Sheet
S 8450 900  2400 2050
U 5EA608FF
F0 "nRF52840_QIAA_R" 50
F1 "nRF52840_QIAA_R.sch" 50
$EndSheet
Wire Wire Line
	2000 1600 2350 1600
Connection ~ 2000 1600
Wire Notes Line
	2850 3000 1050 3000
Wire Notes Line
	1050 900  2850 900 
Connection ~ 3650 3700
Wire Notes Line
	5850 3250 5850 6450
Wire Wire Line
	3650 3700 4000 3700
Wire Wire Line
	3200 3700 3650 3700
Wire Notes Line
	1050 3250 5850 3250
Wire Notes Line
	1050 6450 1050 3250
Wire Notes Line
	5850 6450 1050 6450
Text Notes 1200 6350 0    50   ~ 0
Power source selection logic
$Comp
L power:GND #PWR07
U 1 1 5EA4312B
P 3650 3700
F 0 "#PWR07" H 3650 3450 50  0001 C CNN
F 1 "GND" H 3655 3527 50  0000 C CNN
F 2 "" H 3650 3700 50  0001 C CNN
F 3 "" H 3650 3700 50  0001 C CNN
	1    3650 3700
	-1   0    0    1   
$EndComp
NoConn ~ 7650 3750
NoConn ~ 7650 3950
$Comp
L power:GND #PWR?
U 1 1 5EAF0FF9
P 7350 4150
AR Path="/5EA608FF/5EAF0FF9" Ref="#PWR?"  Part="1" 
AR Path="/5EAF0FF9" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 7350 3900 50  0001 C CNN
F 1 "GND" V 7355 4022 50  0000 R CNN
F 2 "" H 7350 4150 50  0001 C CNN
F 3 "" H 7350 4150 50  0001 C CNN
	1    7350 4150
	1    0    0    -1  
$EndComp
$Comp
L Power_Protection:TPD2E2U06 U5
U 1 1 5EAECA70
P 7350 3850
F 0 "U5" H 7350 4217 50  0000 C CNN
F 1 "TPD2E2U06" H 7350 4126 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-553" H 6550 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tpd2e2u06.pdf" H 7150 4050 50  0001 C CNN
	1    7350 3850
	1    0    0    -1  
$EndComp
Text Label 6750 3650 0    50   ~ 0
5Vusb
Text Label 6750 3950 0    50   ~ 0
D-
Text Label 6750 3850 0    50   ~ 0
D+
$Comp
L Connector:USB_B_Micro J2
U 1 1 5EC90B66
P 6450 3850
F 0 "J2" H 6507 4317 50  0000 C CNN
F 1 "USB_B_Micro" H 6507 4226 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Molex-105017-0001" H 6600 3800 50  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/1050170001_sd.pdf" H 6600 3800 50  0001 C CNN
F 4 "Molex" H 6450 3850 50  0001 C CNN "MFR"
F 5 "1050170001" H 6450 3850 50  0001 C CNN "MPN"
F 6 "WM1399CT-ND" H 6450 3850 50  0001 C CNN "DPN"
	1    6450 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3750 7050 3850
$Comp
L Device:C C23
U 1 1 5EAF2F68
P 7800 3850
F 0 "C23" H 7915 3896 50  0000 L CNN
F 1 "4.7uF" H 7915 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7838 3700 50  0001 C CNN
F 3 "~" H 7800 3850 50  0001 C CNN
F 4 "Yageo" H 800 1950 50  0001 C CNN "MFR"
F 5 "CC0603KRX7R9BB104" H 800 1950 50  0001 C CNN "MPN"
F 6 "311-1344-2-ND" H 800 1950 50  0001 C CNN "DPN"
F 7 "-" H 800 1950 50  0001 C CNN "LCSCPN"
F 8 "-" H 800 1950 50  0001 C CNN "SPR"
F 9 "-" H 800 1950 50  0001 C CNN "SPN"
F 10 "-" H 800 1950 50  0001 C CNN "SIM"
	1    7800 3850
	1    0    0    -1  
$EndComp
NoConn ~ 6750 4050
Wire Wire Line
	7050 3650 7050 3400
Wire Wire Line
	7800 3400 7800 3700
Wire Wire Line
	7050 3400 7800 3400
Wire Wire Line
	2950 5800 4600 5800
Wire Wire Line
	2950 5650 3350 5650
Connection ~ 1700 5100
Connection ~ 3150 5100
Wire Wire Line
	3150 5100 1700 5100
Wire Wire Line
	2100 4350 3000 4350
Wire Wire Line
	3000 4350 3200 4350
Connection ~ 3000 4350
Wire Wire Line
	3000 4350 3000 5500
Wire Wire Line
	3350 5400 3350 5650
Wire Wire Line
	4600 5450 4600 5100
Connection ~ 1700 5500
Wire Wire Line
	1700 5500 1700 5100
Wire Wire Line
	1550 5100 1700 5100
Connection ~ 4450 5100
Connection ~ 4600 5100
Wire Wire Line
	3550 5100 4450 5100
Wire Wire Line
	4600 4350 4600 5100
Wire Wire Line
	4450 4750 4450 5100
Wire Wire Line
	4100 4750 4450 4750
Wire Wire Line
	4750 5100 4600 5100
Text Label 4750 5100 0    50   ~ 0
VDD_3V
Text Label 1550 5100 0    50   ~ 0
3V
$Comp
L si2307cds:Si2307CDS Q1
U 1 1 5E9CEE32
P 3350 5200
F 0 "Q1" V 3700 5150 50  0000 L CNN
F 1 "Si2307CDS" V 3600 4950 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3550 5125 50  0001 L CIN
F 3 "http://www.vishay.com/docs/68768/si2307cds.pdf" H 3350 5200 50  0001 L CNN
F 4 "Vishay Siliconix" H -2800 3350 50  0001 C CNN "MFR"
F 5 "SI2307CDS-T1-GE3" H -2800 3350 50  0001 C CNN "MPN"
F 6 "SI2307CDS-T1-GE3CT-ND" H -2800 3350 50  0001 C CNN "DPN"
F 7 "-" H -2800 3350 50  0001 C CNN "LCSCPN"
F 8 "-" H -2800 3350 50  0001 C CNN "SPR"
F 9 "-" H -2800 3350 50  0001 C CNN "SPN"
F 10 "-" H -2800 3350 50  0001 C CNN "SIM"
	1    3350 5200
	0    -1   -1   0   
$EndComp
$Comp
L Jumper:Jumper_2_Open JP3
U 1 1 5EA10100
P 3900 4750
F 0 "JP3" H 4100 4850 50  0000 C CNN
F 1 "Jumper_2_Open" H 3900 4894 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3900 4750 50  0001 C CNN
F 3 "~" H 3900 4750 50  0001 C CNN
F 4 "-" H -2800 2650 50  0001 C CNN "MFR"
F 5 "-" H -2800 2650 50  0001 C CNN "MPN"
F 6 "-" H -2800 2650 50  0001 C CNN "DPN"
F 7 "-" H -2800 2650 50  0001 C CNN "LCSCPN"
F 8 "-" H -2800 2650 50  0001 C CNN "SPR"
F 9 "-" H -2800 2650 50  0001 C CNN "SPN"
F 10 "-" H -2800 2650 50  0001 C CNN "SIM"
	1    3900 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5E9D2D00
P 4750 5250
F 0 "C2" H 4865 5296 50  0000 L CNN
F 1 "0.1uF" H 4865 5205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4788 5100 50  0001 C CNN
F 3 "~" H 4750 5250 50  0001 C CNN
F 4 "Yageo" H -2250 3350 50  0001 C CNN "MFR"
F 5 "CC0603KRX7R9BB104" H -2250 3350 50  0001 C CNN "MPN"
F 6 "311-1344-2-ND" H -2250 3350 50  0001 C CNN "DPN"
F 7 "-" H -2250 3350 50  0001 C CNN "LCSCPN"
F 8 "-" H -2250 3350 50  0001 C CNN "SPR"
F 9 "-" H -2250 3350 50  0001 C CNN "SPN"
F 10 "-" H -2250 3350 50  0001 C CNN "SIM"
	1    4750 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 4750 3700 4750
Wire Wire Line
	3150 4750 3150 5100
Wire Wire Line
	4450 5100 4600 5100
Wire Wire Line
	4400 4350 4600 4350
$Comp
L ltc4412xs6:LTC4412xS6 IC1
U 1 1 5E9DE63A
P 2550 5650
F 0 "IC1" H 2550 6100 50  0000 C CNN
F 1 "LTC4412xS6" H 2550 6000 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-6" H 3200 5300 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/4412fb.pdf" H 4650 5450 50  0001 C CNN
F 4 "Linear Technology/Analog Devices" H -2850 3150 50  0001 C CNN "MFR"
F 5 "LTC4412ES6#TRPBF" H -2850 3150 50  0001 C CNN "MPN"
F 6 "LTC4412ES6#TRPBFCT-ND" H -2850 3150 50  0001 C CNN "DPN"
F 7 "-" H -2850 3150 50  0001 C CNN "LCSCPN"
F 8 "-" H -2850 3150 50  0001 C CNN "SPR"
F 9 "-" H -2850 3150 50  0001 C CNN "SPN"
F 10 "-" H -2850 3150 50  0001 C CNN "SIM"
	1    2550 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5E9D65E7
P 1700 5650
F 0 "C1" H 1450 5700 50  0000 L CNN
F 1 "0.1uF" H 1400 5600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1738 5500 50  0001 C CNN
F 3 "~" H 1700 5650 50  0001 C CNN
F 4 "Yageo" H -2900 3150 50  0001 C CNN "MFR"
F 5 "CC0603KRX7R9BB104" H -2900 3150 50  0001 C CNN "MPN"
F 6 "311-1344-2-ND" H -2900 3150 50  0001 C CNN "DPN"
F 7 "-" H -2900 3150 50  0001 C CNN "LCSCPN"
F 8 "-" H -2900 3150 50  0001 C CNN "SPR"
F 9 "-" H -2900 3150 50  0001 C CNN "SPN"
F 10 "-" H -2900 3150 50  0001 C CNN "SIM"
	1    1700 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5E9D9BC8
P 1700 5800
F 0 "#PWR03" H 1700 5550 50  0001 C CNN
F 1 "GND" H 1705 5627 50  0000 C CNN
F 2 "" H 1700 5800 50  0001 C CNN
F 3 "" H 1700 5800 50  0001 C CNN
	1    1700 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5E9FCC69
P 2000 5800
F 0 "R1" V 2100 5800 50  0000 C CNN
F 1 "0" V 1900 5800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1930 5800 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 2000 5800 50  0001 C CNN
F 4 "RC0603JR-070RL" V 2000 5800 50  0001 C CNN "MPN"
F 5 "Yageo" V 2000 5800 50  0001 C CNN "MFR"
F 6 "311-0.0GRCT-ND" V 2000 5800 50  0001 C CNN "DPN"
F 7 "-" H -2800 3150 50  0001 C CNN "LCSCPN"
F 8 "-" H -2800 3150 50  0001 C CNN "SPR"
F 9 "-" H -2800 3150 50  0001 C CNN "SPN"
F 10 "-" H -2800 3150 50  0001 C CNN "SIM"
	1    2000 5800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5E9D3A19
P 4750 5400
F 0 "#PWR04" H 4750 5150 50  0001 C CNN
F 1 "GND" H 4755 5227 50  0000 C CNN
F 2 "" H 4750 5400 50  0001 C CNN
F 3 "" H 4750 5400 50  0001 C CNN
	1    4750 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5E9D42B2
P 4600 5600
F 0 "R4" H 4400 5650 50  0000 L CNN
F 1 "560K" H 4350 5550 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4530 5600 50  0001 C CNN
F 3 "~" H 4600 5600 50  0001 C CNN
F 4 "Yageo" H -2250 3150 50  0001 C CNN "MFR"
F 5 "RC0201FR-07560KL" H -2250 3150 50  0001 C CNN "MPN"
F 6 "RC0201FR-071K69L" H -2250 3150 50  0001 C CNN "DPN"
F 7 "-" H -2250 3150 50  0001 C CNN "LCSCPN"
F 8 "-" H -2250 3150 50  0001 C CNN "SPR"
F 9 "-" H -2250 3150 50  0001 C CNN "SPN"
F 10 "-" H -2250 3150 50  0001 C CNN "SIM"
	1    4600 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D3
U 1 1 5E9EFF12
P 4250 4350
F 0 "D3" H 4250 4566 50  0000 C CNN
F 1 "D_Schottky" H 4250 4475 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 4250 4350 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/SL14PL-SL110PL(SOD-123FL)-B.pdf" H 4250 4350 50  0001 C CNN
F 4 "SL14PL-TP" H 4250 4350 50  0001 C CNN "MPN"
F 5 "Micro Commercial Co" H 4250 4350 50  0001 C CNN "MFR"
F 6 "SL14PL-TPMSCT-ND" H -1900 3100 50  0001 C CNN "DPN"
F 7 "-" H -1900 3100 50  0001 C CNN "LCSCPN"
F 8 "-" H -1900 3100 50  0001 C CNN "SPR"
F 9 "-" H -1900 3100 50  0001 C CNN "SPN"
F 10 "-" H -1900 3100 50  0001 C CNN "SIM"
	1    4250 4350
	-1   0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LP5907MFX-3.3 U1
U 1 1 5EA3D589
P 3650 4250
F 0 "U1" H 3650 4617 50  0000 C CNN
F 1 "LP5907MFX-3.3" H 3650 4526 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 3650 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lp5907.pdf" H 3650 4750 50  0001 C CNN
F 4 "Texas Instruments" H -200 -100 50  0001 C CNN "MFR"
F 5 "LP5907MFX-3.3" H -200 -100 50  0001 C CNN "MPN"
F 6 "296-38557-1-ND" H -200 -100 50  0001 C CNN "DPN"
F 7 "-" H -200 -100 50  0001 C CNN "LCSCPN"
F 8 "LCSC" H -200 -100 50  0001 C CNN "SPR"
F 9 "C143028" H -200 -100 50  0001 C CNN "SPN"
F 10 "-" H -200 -100 50  0001 C CNN "SIM"
	1    3650 4250
	1    0    0    1   
$EndComp
$Comp
L Device:C C4
U 1 1 5EA4DCA4
P 3200 3850
F 0 "C4" H 3315 3896 50  0000 L CNN
F 1 "1uF" H 3315 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3238 3700 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL10A105KO5LNNC.jsp" H 3200 3850 50  0001 C CNN
F 4 "Samsung" H -5550 2200 50  0001 C CNN "MFR"
F 5 "CL10A105KO5LNNC" H -5550 2200 50  0001 C CNN "MPN"
F 6 "1276-1862-1-ND" H -5550 2200 50  0001 C CNN "DPN"
F 7 "-" H -5550 2200 50  0001 C CNN "LCSCPN"
F 8 "-" H -5550 2200 50  0001 C CNN "SPR"
F 9 "-" H -5550 2200 50  0001 C CNN "SPN"
F 10 "-" H -5550 2200 50  0001 C CNN "SIM"
	1    3200 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5EA4EF46
P 4000 3850
F 0 "C5" H 4115 3896 50  0000 L CNN
F 1 "1uF" H 4115 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4038 3700 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL10A105KO5LNNC.jsp" H 4000 3850 50  0001 C CNN
F 4 "Samsung" H -4750 2200 50  0001 C CNN "MFR"
F 5 "CL10A105KO5LNNC" H -4750 2200 50  0001 C CNN "MPN"
F 6 "1276-1862-1-ND" H -4750 2200 50  0001 C CNN "DPN"
F 7 "-" H -4750 2200 50  0001 C CNN "LCSCPN"
F 8 "-" H -4750 2200 50  0001 C CNN "SPR"
F 9 "-" H -4750 2200 50  0001 C CNN "SPN"
F 10 "-" H -4750 2200 50  0001 C CNN "SIM"
	1    4000 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5EA2FE2A
P 2100 4950
F 0 "#PWR02" H 2100 4700 50  0001 C CNN
F 1 "GND" H 2250 4900 50  0000 C CNN
F 2 "" H 2100 4950 50  0001 C CNN
F 3 "" H 2100 4950 50  0001 C CNN
	1    2100 4950
	1    0    0    -1  
$EndComp
Text Label 1600 4350 0    50   ~ 0
5Vusb
Text Notes 2300 4800 0    50   ~ 0
TVS diode \nfor ESD\nprotection
Wire Wire Line
	4600 5750 4600 5800
Wire Wire Line
	3350 4250 3300 4250
Wire Wire Line
	3300 4250 3300 4350
Wire Wire Line
	3300 4350 3350 4350
Wire Wire Line
	3200 4350 3200 4000
Wire Wire Line
	3200 4350 3300 4350
Wire Wire Line
	3950 4350 4000 4350
Wire Wire Line
	4000 4350 4000 4000
Wire Wire Line
	4000 4350 4100 4350
Wire Wire Line
	3650 3950 3650 3700
Wire Wire Line
	2150 5650 1850 5650
Wire Wire Line
	1850 5650 1850 5800
Wire Wire Line
	2950 5500 3000 5500
Wire Wire Line
	1700 5500 2150 5500
Wire Wire Line
	1700 5800 1850 5800
Wire Wire Line
	1600 4350 2100 4350
Connection ~ 3300 4350
Connection ~ 3200 4350
Connection ~ 4000 4350
Connection ~ 1850 5800
Connection ~ 1700 5800
$Comp
L ESD401DPYR:ESD401DPYR U4
U 1 1 5EA4E7E7
P 2100 4650
F 0 "U4" V 2153 4521 60  0000 R CNN
F 1 "ESD401" V 2047 4521 60  0000 R CNN
F 2 "0my_footprints:ESD401DPYR" H 2100 4590 60  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fesd401" V 1994 4521 60  0001 R CNN
F 4 "Texas Instruments" H -250 2650 50  0001 C CNN "MFR"
F 5 "ESD401DPYR" H -250 2650 50  0001 C CNN "MPN"
F 6 "296-47160-1-ND" H -250 2650 50  0001 C CNN "DPN"
F 7 "-" H -250 2650 50  0001 C CNN "LCSCPN"
F 8 "-" H -250 2650 50  0001 C CNN "SPR"
F 9 "-" H -250 2650 50  0001 C CNN "SPN"
F 10 "-" H -250 2650 50  0001 C CNN "SIM"
	1    2100 4650
	0    1    1    0   
$EndComp
Connection ~ 2100 4350
Wire Wire Line
	7050 3650 6750 3650
Wire Wire Line
	6750 3850 7050 3850
Wire Wire Line
	7050 3950 6750 3950
Wire Wire Line
	6350 4250 6450 4250
Wire Wire Line
	7350 4150 6750 4150
Wire Wire Line
	6750 4150 6750 4250
Wire Wire Line
	6750 4250 6450 4250
Connection ~ 7350 4150
Connection ~ 6450 4250
Wire Wire Line
	7800 4000 7800 4150
Wire Wire Line
	7800 4150 7350 4150
Wire Notes Line
	6150 4600 8150 4600
Wire Notes Line
	8150 3250 6150 3250
Wire Notes Line
	8450 6450 8450 4750
Wire Notes Line
	10800 4750 10800 6450
Wire Notes Line
	8150 6450 8150 4750
Wire Notes Line
	6150 4750 6150 6450
Wire Notes Line
	6150 3250 6150 4600
Wire Notes Line
	8150 3250 8150 4600
Text Notes 6250 4550 0    50   ~ 0
ESD protection on USB data
$EndSCHEMATC
