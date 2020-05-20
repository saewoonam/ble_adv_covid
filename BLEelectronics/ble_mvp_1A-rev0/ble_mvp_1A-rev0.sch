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
L BAT-HLD-001:BAT-HLD-001 U2
U 1 1 5E9C706C
P 1650 1700
F 0 "U2" H 1925 1903 60  0000 C CNN
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
L power:GND #PWR01
U 1 1 5E9D6756
P 2850 2450
F 0 "#PWR01" H 2850 2200 50  0001 C CNN
F 1 "GND" H 2855 2277 50  0000 C CNN
F 2 "" H 2850 2450 50  0001 C CNN
F 3 "" H 2850 2450 50  0001 C CNN
	1    2850 2450
	-1   0    0    -1  
$EndComp
$Comp
L LTC4054LES5-4.2_TRPBF:LTC4054LES5-4.2#TRPBF IC4
U 1 1 5E9DF23D
P 9200 2100
F 0 "IC4" H 9000 2600 50  0000 C CNN
F 1 "LTC4054LES5-4.2#TRPBF" H 9200 1600 50  0000 C CNN
F 2 "0my_footprints:LTC4054LES5-4.2_TRPBF" H 9200 2100 50  0001 L BNN
F 3 "http://www.linear.com/docs/2068" H 9200 2100 50  0001 L BNN
F 4 "Linear Technology" H 9200 2100 50  0001 L BNN "Field4"
F 5 "Linear Technology/Analog Devices" H -200 -100 50  0001 C CNN "MFR"
F 6 "LTC4054LES5-4.2#TRPBF" H -200 -100 50  0001 C CNN "MPN"
F 7 "LTC4054LES5-4.2#TRPBFCT-ND" H -200 -100 50  0001 C CNN "DPN"
F 8 "-" H -200 -100 50  0001 C CNN "LCSCPN"
F 9 "-" H -200 -100 50  0001 C CNN "SPR"
F 10 "-" H -200 -100 50  0001 C CNN "SPN"
F 11 "-" H -200 -100 50  0001 C CNN "SIM"
	1    9200 2100
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
P 8550 1550
F 0 "C3" H 8665 1596 50  0000 L CNN
F 1 "1uF" H 8665 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8588 1400 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL10A105KO5LNNC.jsp" H 8550 1550 50  0001 C CNN
F 4 "Samsung" H -200 -100 50  0001 C CNN "MFR"
F 5 "CL10A105KO5LNNC" H -200 -100 50  0001 C CNN "MPN"
F 6 "1276-1862-1-ND" H -200 -100 50  0001 C CNN "DPN"
F 7 "-" H -200 -100 50  0001 C CNN "LCSCPN"
F 8 "-" H -200 -100 50  0001 C CNN "SPR"
F 9 "-" H -200 -100 50  0001 C CNN "SPN"
F 10 "-" H -200 -100 50  0001 C CNN "SIM"
	1    8550 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5EA027BD
P 8550 1700
F 0 "#PWR05" H 8550 1450 50  0001 C CNN
F 1 "GND" H 8555 1527 50  0000 C CNN
F 2 "" H 8550 1700 50  0001 C CNN
F 3 "" H 8550 1700 50  0001 C CNN
	1    8550 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5EA04301
P 10050 2300
F 0 "R6" H 10120 2346 50  0000 L CNN
F 1 "1.69K" H 10120 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 9980 2300 50  0001 C CNN
F 3 "~" H 10050 2300 50  0001 C CNN
F 4 "Yageo" H -200 -100 50  0001 C CNN "MFR"
F 5 "RC0201FR-071K69L" H -200 -100 50  0001 C CNN "MPN"
F 6 "YAG2487CT-ND" H -200 -100 50  0001 C CNN "DPN"
F 7 "-" H -200 -100 50  0001 C CNN "LCSCPN"
F 8 "-" H -200 -100 50  0001 C CNN "SPR"
F 9 "-" H -200 -100 50  0001 C CNN "SPN"
F 10 "-" H -200 -100 50  0001 C CNN "SIM"
	1    10050 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5EA08150
P 10350 1950
F 0 "R7" V 10143 1950 50  0000 C CNN
F 1 "0" V 10234 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10280 1950 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 10350 1950 50  0001 C CNN
F 4 "RC0603JR-070RL" V 10350 1950 50  0001 C CNN "MPN"
F 5 "Yageo" V 10350 1950 50  0001 C CNN "MFR"
F 6 "311-0.0GRCT-ND" V 10350 1950 50  0001 C CNN "DPN"
F 7 "-" H -50 -100 50  0001 C CNN "LCSCPN"
F 8 "-" H -50 -100 50  0001 C CNN "SPR"
F 9 "-" H -50 -100 50  0001 C CNN "SPN"
F 10 "-" H -50 -100 50  0001 C CNN "SIM"
	1    10350 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5EA09643
P 9200 1250
F 0 "R5" V 8993 1250 50  0000 C CNN
F 1 "0" V 9084 1250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 9130 1250 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 9200 1250 50  0001 C CNN
F 4 "RC0603JR-070RL" V 9200 1250 50  0001 C CNN "MPN"
F 5 "Yageo" V 9200 1250 50  0001 C CNN "MFR"
F 6 "311-0.0GRCT-ND" V 9200 1250 50  0001 C CNN "DPN"
F 7 "-" H -200 -100 50  0001 C CNN "LCSCPN"
F 8 "-" H -200 -100 50  0001 C CNN "SPR"
F 9 "-" H -200 -100 50  0001 C CNN "SPN"
F 10 "-" H -200 -100 50  0001 C CNN "SIM"
	1    9200 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5EA09E9A
P 9900 2450
F 0 "#PWR06" H 9900 2200 50  0001 C CNN
F 1 "GND" H 9905 2277 50  0000 C CNN
F 2 "" H 9900 2450 50  0001 C CNN
F 3 "" H 9900 2450 50  0001 C CNN
	1    9900 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5EA74258
P 6500 1700
F 0 "#PWR09" H 6500 1450 50  0001 C CNN
F 1 "GND" V 6505 1572 50  0000 R CNN
F 2 "" H 6500 1700 50  0001 C CNN
F 3 "" H 6500 1700 50  0001 C CNN
	1    6500 1700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5EA75FDA
P 6500 2400
F 0 "#PWR010" H 6500 2150 50  0001 C CNN
F 1 "GND" V 6505 2272 50  0000 R CNN
F 2 "" H 6500 2400 50  0001 C CNN
F 3 "" H 6500 2400 50  0001 C CNN
	1    6500 2400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5EA772EE
P 5300 2400
F 0 "#PWR08" H 5300 2150 50  0001 C CNN
F 1 "GND" V 5305 2272 50  0000 R CNN
F 2 "" H 5300 2400 50  0001 C CNN
F 3 "" H 5300 2400 50  0001 C CNN
	1    5300 2400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5EA9F122
P 8750 4300
F 0 "#PWR011" H 8750 4050 50  0001 C CNN
F 1 "GND" H 8755 4127 50  0000 C CNN
F 2 "" H 8750 4300 50  0001 C CNN
F 3 "" H 8750 4300 50  0001 C CNN
	1    8750 4300
	1    0    0    -1  
$EndComp
$Comp
L Timer_RTC:PCF8523T IC2
U 1 1 5E9F84DB
P 7450 4150
F 0 "IC2" H 7800 4600 50  0000 L CNN
F 1 "PCF8523T" H 7700 4500 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 8250 3800 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/PCF8523.pdf" H 7450 4150 50  0001 C CNN
F 4 "NXP USA Inc." H 300 50  50  0001 C CNN "MFR"
F 5 "PCF8523T/1,118" H 300 50  50  0001 C CNN "MPN"
F 6 "568-5306-1-ND" H 300 50  50  0001 C CNN "DPN"
F 7 "-" H 300 50  50  0001 C CNN "LCSCPN"
F 8 "-" H 300 50  50  0001 C CNN "SPR"
F 9 "-" H 300 50  50  0001 C CNN "SPN"
F 10 "-" H 300 50  50  0001 C CNN "SIM"
	1    7450 4150
	1    0    0    -1  
$EndComp
$Comp
L CR2025_Nordic-rescue:MX25R6435FM2IL0-mx25R6435FM2IL IC3
U 1 1 5E9F9A1A
P 8750 4000
F 0 "IC3" H 9600 4350 60  0000 C CNN
F 1 "MX25R6435FM2IL0" H 9600 4200 60  0000 C CNN
F 2 "0my_footprints:MX25R6435FM2IL0" H 10050 4240 60  0001 C CNN
F 3 "http://www.macronix.com/Lists/Datasheet/Attachments/7428/MX25R6435F,%20Wide%20Range,%2064Mb,%20v1.4.pdf" H 8750 4000 60  0001 C CNN
F 4 "Macronix" H 0   0   50  0001 C CNN "MFR"
F 5 "MX25R6435FM2IL0" H 0   0   50  0001 C CNN "MPN"
F 6 "1092-1200-ND" H 0   0   50  0001 C CNN "DPN"
F 7 "-" H 0   0   50  0001 C CNN "LCSCPN"
F 8 "-" H 0   0   50  0001 C CNN "SPR"
F 9 "-" H 0   0   50  0001 C CNN "SPN"
F 10 "-" H 0   0   50  0001 C CNN "SIM"
	1    8750 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5EA0EA9A
P 7450 4550
F 0 "#PWR0101" H 7450 4300 50  0001 C CNN
F 1 "GND" H 7455 4377 50  0000 C CNN
F 2 "" H 7450 4550 50  0001 C CNN
F 3 "" H 7450 4550 50  0001 C CNN
	1    7450 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5EA074F4
P 6800 3800
F 0 "R9" H 6870 3846 50  0000 L CNN
F 1 "4.7K" H 6870 3755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6730 3800 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 6800 3800 50  0001 C CNN
F 4 "Yageo" H 350 50  50  0001 C CNN "MFR"
F 5 "RC0603FR-074K7L" H 350 50  50  0001 C CNN "MPN"
F 6 "311-4.70KHRCT-ND" H 350 50  50  0001 C CNN "DPN"
F 7 "-" H 350 50  50  0001 C CNN "LCSCPN"
F 8 "-" H 350 50  50  0001 C CNN "SPR"
F 9 "-" H 350 50  50  0001 C CNN "SPN"
F 10 "-" H 350 50  50  0001 C CNN "SIM"
	1    6800 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5EA0D031
P 6500 3900
F 0 "R8" H 6570 3946 50  0000 L CNN
F 1 "4.7K" H 6570 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6430 3900 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 6500 3900 50  0001 C CNN
F 4 "Yageo" H 50  150 50  0001 C CNN "MFR"
F 5 "RC0603FR-074K7L" H 50  150 50  0001 C CNN "MPN"
F 6 "311-4.70KHRCT-ND" H 50  150 50  0001 C CNN "DPN"
F 7 "-" H 50  150 50  0001 C CNN "LCSCPN"
F 8 "-" H 50  150 50  0001 C CNN "SPR"
F 9 "-" H 50  150 50  0001 C CNN "SPN"
F 10 "-" H 50  150 50  0001 C CNN "SIM"
	1    6500 3900
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
L CR2025_Nordic-rescue:LTC4412xS6-ltc4412xs6 IC1
U 1 1 5E9DE63A
P 2450 5850
F 0 "IC1" H 2450 6431 50  0000 C CNN
F 1 "LTC4412xS6" H 2450 6340 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-6" H 3100 5500 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/4412fb.pdf" H 4550 5650 50  0001 C CNN
F 4 "Linear Technology/Analog Devices" H -2950 3350 50  0001 C CNN "MFR"
F 5 "LTC4412ES6#TRPBF" H -2950 3350 50  0001 C CNN "MPN"
F 6 "LTC4412ES6#TRPBFCT-ND" H -2950 3350 50  0001 C CNN "DPN"
F 7 "-" H -2950 3350 50  0001 C CNN "LCSCPN"
F 8 "-" H -2950 3350 50  0001 C CNN "SPR"
F 9 "-" H -2950 3350 50  0001 C CNN "SPN"
F 10 "-" H -2950 3350 50  0001 C CNN "SIM"
	1    2450 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5E9D65E7
P 1600 5850
F 0 "C1" H 1350 5900 50  0000 L CNN
F 1 "0.1uF" H 1300 5800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1638 5700 50  0001 C CNN
F 3 "~" H 1600 5850 50  0001 C CNN
F 4 "Yageo" H -3000 3350 50  0001 C CNN "MFR"
F 5 "CC0603KRX7R9BB104" H -3000 3350 50  0001 C CNN "MPN"
F 6 "311-1344-2-ND" H -3000 3350 50  0001 C CNN "DPN"
F 7 "-" H -3000 3350 50  0001 C CNN "LCSCPN"
F 8 "-" H -3000 3350 50  0001 C CNN "SPR"
F 9 "-" H -3000 3350 50  0001 C CNN "SPN"
F 10 "-" H -3000 3350 50  0001 C CNN "SIM"
	1    1600 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5E9D9BC8
P 1600 6000
F 0 "#PWR03" H 1600 5750 50  0001 C CNN
F 1 "GND" H 1605 5827 50  0000 C CNN
F 2 "" H 1600 6000 50  0001 C CNN
F 3 "" H 1600 6000 50  0001 C CNN
	1    1600 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5E9FCC69
P 1900 6000
F 0 "R1" V 1693 6000 50  0000 C CNN
F 1 "0" V 1784 6000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1830 6000 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 1900 6000 50  0001 C CNN
F 4 "RC0603JR-070RL" V 1900 6000 50  0001 C CNN "MPN"
F 5 "Yageo" V 1900 6000 50  0001 C CNN "MFR"
F 6 "311-0.0GRCT-ND" V 1900 6000 50  0001 C CNN "DPN"
F 7 "-" H -2900 3350 50  0001 C CNN "LCSCPN"
F 8 "-" H -2900 3350 50  0001 C CNN "SPR"
F 9 "-" H -2900 3350 50  0001 C CNN "SPN"
F 10 "-" H -2900 3350 50  0001 C CNN "SIM"
	1    1900 6000
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 5E9D2D00
P 5300 5250
F 0 "C2" H 5415 5296 50  0000 L CNN
F 1 "0.1uF" H 5415 5205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5338 5100 50  0001 C CNN
F 3 "~" H 5300 5250 50  0001 C CNN
F 4 "Yageo" H -1700 3350 50  0001 C CNN "MFR"
F 5 "CC0603KRX7R9BB104" H -1700 3350 50  0001 C CNN "MPN"
F 6 "311-1344-2-ND" H -1700 3350 50  0001 C CNN "DPN"
F 7 "-" H -1700 3350 50  0001 C CNN "LCSCPN"
F 8 "-" H -1700 3350 50  0001 C CNN "SPR"
F 9 "-" H -1700 3350 50  0001 C CNN "SPN"
F 10 "-" H -1700 3350 50  0001 C CNN "SIM"
	1    5300 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5E9D3A19
P 5300 5400
F 0 "#PWR04" H 5300 5150 50  0001 C CNN
F 1 "GND" H 5305 5227 50  0000 C CNN
F 2 "" H 5300 5400 50  0001 C CNN
F 3 "" H 5300 5400 50  0001 C CNN
	1    5300 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5E9D42B2
P 5150 5800
F 0 "R4" H 5220 5846 50  0000 L CNN
F 1 "560K" H 5220 5755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5080 5800 50  0001 C CNN
F 3 "~" H 5150 5800 50  0001 C CNN
F 4 "Yageo" H -1700 3350 50  0001 C CNN "MFR"
F 5 "RC0201FR-07560KL" H -1700 3350 50  0001 C CNN "MPN"
F 6 "RC0201FR-071K69L" H -1700 3350 50  0001 C CNN "DPN"
F 7 "-" H -1700 3350 50  0001 C CNN "LCSCPN"
F 8 "-" H -1700 3350 50  0001 C CNN "SPR"
F 9 "-" H -1700 3350 50  0001 C CNN "SPN"
F 10 "-" H -1700 3350 50  0001 C CNN "SIM"
	1    5150 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5E9F9456
P 4900 5100
F 0 "R3" V 4693 5100 50  0000 C CNN
F 1 "0" V 4784 5100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4830 5100 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 4900 5100 50  0001 C CNN
F 4 "RC0603JR-070RL" V 4900 5100 50  0001 C CNN "MPN"
F 5 "Yageo" V 4900 5100 50  0001 C CNN "MFR"
F 6 "311-0.0GRCT-ND" V 4900 5100 50  0001 C CNN "DPN"
F 7 "-" H -1700 3350 50  0001 C CNN "LCSCPN"
F 8 "-" H -1700 3350 50  0001 C CNN "SPR"
F 9 "-" H -1700 3350 50  0001 C CNN "SPN"
F 10 "-" H -1700 3350 50  0001 C CNN "SIM"
	1    4900 5100
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D3
U 1 1 5E9EFF12
P 4500 4350
F 0 "D3" H 4500 4566 50  0000 C CNN
F 1 "D_Schottky" H 4500 4475 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 4500 4350 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/SL14PL-SL110PL(SOD-123FL)-B.pdf" H 4500 4350 50  0001 C CNN
F 4 "SL14PL-TP" H 4500 4350 50  0001 C CNN "MPN"
F 5 "Micro Commercial Co" H 4500 4350 50  0001 C CNN "MFR"
F 6 "SL14PL-TPMSCT-ND" H -1650 3100 50  0001 C CNN "DPN"
F 7 "-" H -1650 3100 50  0001 C CNN "LCSCPN"
F 8 "-" H -1650 3100 50  0001 C CNN "SPR"
F 9 "-" H -1650 3100 50  0001 C CNN "SPN"
F 10 "-" H -1650 3100 50  0001 C CNN "SIM"
	1    4500 4350
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E9F603B
P 4900 4350
F 0 "R2" V 4693 4350 50  0000 C CNN
F 1 "0" V 4784 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4830 4350 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 4900 4350 50  0001 C CNN
F 4 "RC0603JR-070RL" V 4900 4350 50  0001 C CNN "MPN"
F 5 "Yageo" V 4900 4350 50  0001 C CNN "MFR"
F 6 "311-0.0GRCT-ND" V 4900 4350 50  0001 C CNN "DPN"
F 7 "-" H -1700 3100 50  0001 C CNN "LCSCPN"
F 8 "-" H -1700 3100 50  0001 C CNN "SPR"
F 9 "-" H -1700 3100 50  0001 C CNN "SPN"
F 10 "-" H -1700 3100 50  0001 C CNN "SIM"
	1    4900 4350
	0    1    1    0   
$EndComp
$Comp
L Regulator_Linear:LP5907MFX-3.3 U1
U 1 1 5EA3D589
P 3900 4250
F 0 "U1" H 3900 4617 50  0000 C CNN
F 1 "LP5907MFX-3.3" H 3900 4526 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 3900 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lp5907.pdf" H 3900 4750 50  0001 C CNN
F 4 "Texas Instruments" H 50  -100 50  0001 C CNN "MFR"
F 5 "LP5907MFX-3.3" H 50  -100 50  0001 C CNN "MPN"
F 6 "296-38557-1-ND" H 50  -100 50  0001 C CNN "DPN"
F 7 "-" H 50  -100 50  0001 C CNN "LCSCPN"
F 8 "LCSC" H 50  -100 50  0001 C CNN "SPR"
F 9 "C143028" H 50  -100 50  0001 C CNN "SPN"
F 10 "-" H 50  -100 50  0001 C CNN "SIM"
	1    3900 4250
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5EA4312B
P 3900 3700
F 0 "#PWR07" H 3900 3450 50  0001 C CNN
F 1 "GND" H 3905 3527 50  0000 C CNN
F 2 "" H 3900 3700 50  0001 C CNN
F 3 "" H 3900 3700 50  0001 C CNN
	1    3900 3700
	-1   0    0    1   
$EndComp
$Comp
L Device:C C4
U 1 1 5EA4DCA4
P 3450 3850
F 0 "C4" H 3565 3896 50  0000 L CNN
F 1 "1uF" H 3565 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3488 3700 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL10A105KO5LNNC.jsp" H 3450 3850 50  0001 C CNN
F 4 "Samsung" H -5300 2200 50  0001 C CNN "MFR"
F 5 "CL10A105KO5LNNC" H -5300 2200 50  0001 C CNN "MPN"
F 6 "1276-1862-1-ND" H -5300 2200 50  0001 C CNN "DPN"
F 7 "-" H -5300 2200 50  0001 C CNN "LCSCPN"
F 8 "-" H -5300 2200 50  0001 C CNN "SPR"
F 9 "-" H -5300 2200 50  0001 C CNN "SPN"
F 10 "-" H -5300 2200 50  0001 C CNN "SIM"
	1    3450 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5EA4EF46
P 4250 3850
F 0 "C5" H 4365 3896 50  0000 L CNN
F 1 "1uF" H 4365 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4288 3700 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL10A105KO5LNNC.jsp" H 4250 3850 50  0001 C CNN
F 4 "Samsung" H -4500 2200 50  0001 C CNN "MFR"
F 5 "CL10A105KO5LNNC" H -4500 2200 50  0001 C CNN "MPN"
F 6 "1276-1862-1-ND" H -4500 2200 50  0001 C CNN "DPN"
F 7 "-" H -4500 2200 50  0001 C CNN "LCSCPN"
F 8 "-" H -4500 2200 50  0001 C CNN "SPR"
F 9 "-" H -4500 2200 50  0001 C CNN "SPN"
F 10 "-" H -4500 2200 50  0001 C CNN "SIM"
	1    4250 3850
	1    0    0    -1  
$EndComp
$Comp
L CR2025_Nordic-rescue:Nordic_nRF52840_breakout-nordic_nrf52840_breakout J1
U 1 1 5EA6E901
P 5900 1950
F 0 "J1" H 6250 2700 50  0000 C CNN
F 1 "Nordic_nRF52840_breakout" H 5900 2850 50  0000 C CNN
F 2 "0my_footprints:Nordic_nRF52840_FeatherHeader" H 5900 2700 50  0001 C CNN
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
L Device:D_Schottky D4
U 1 1 5EA54A0B
P 10000 1950
F 0 "D4" H 10000 2166 50  0000 C CNN
F 1 "D_Schottky" H 10000 2075 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 10000 1950 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/SL14PL-SL110PL(SOD-123FL)-B.pdf" H 10000 1950 50  0001 C CNN
F 4 "SL14PL-TP" H 10000 1950 50  0001 C CNN "MPN"
F 5 "Micro Commercial Co" H 10000 1950 50  0001 C CNN "MFR"
F 6 "SL14PL-TPMSCT-ND" H 3850 700 50  0001 C CNN "DPN"
F 7 "-" H 3850 700 50  0001 C CNN "LCSCPN"
F 8 "-" H 3850 700 50  0001 C CNN "SPR"
F 9 "-" H 3850 700 50  0001 C CNN "SPN"
F 10 "-" H 3850 700 50  0001 C CNN "SIM"
	1    10000 1950
	-1   0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_2_Open JP3
U 1 1 5EA10100
P 4150 4750
F 0 "JP3" H 4350 4850 50  0000 C CNN
F 1 "Jumper_2_Open" H 4150 4894 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4150 4750 50  0001 C CNN
F 3 "~" H 4150 4750 50  0001 C CNN
F 4 "-" H -2550 2650 50  0001 C CNN "MFR"
F 5 "-" H -2550 2650 50  0001 C CNN "MPN"
F 6 "-" H -2550 2650 50  0001 C CNN "DPN"
F 7 "-" H -2550 2650 50  0001 C CNN "LCSCPN"
F 8 "-" H -2550 2650 50  0001 C CNN "SPR"
F 9 "-" H -2550 2650 50  0001 C CNN "SPN"
F 10 "-" H -2550 2650 50  0001 C CNN "SIM"
	1    4150 4750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J4
U 1 1 5EA8C546
P 7950 4350
F 0 "J4" V 7842 4398 50  0000 L CNN
F 1 "Conn_01x01_Female" H 7978 4285 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 7950 4350 50  0001 C CNN
F 3 "~" H 7950 4350 50  0001 C CNN
F 4 "-" H 0   0   50  0001 C CNN "MFR"
F 5 "-" H 0   0   50  0001 C CNN "MPN"
F 6 "-" H 0   0   50  0001 C CNN "DPN"
F 7 "-" H 0   0   50  0001 C CNN "LCSCPN"
F 8 "-" H 0   0   50  0001 C CNN "SPR"
F 9 "-" H 0   0   50  0001 C CNN "SPN"
F 10 "-" H 0   0   50  0001 C CNN "SIM"
	1    7950 4350
	0    1    1    0   
$EndComp
$Comp
L Si7463DP:Si7463DP Q2
U 1 1 5EAE0222
P 4050 5650
F 0 "Q2" V 4450 5650 50  0000 C CNN
F 1 "Si7463DP" V 4350 5650 50  0000 C CNN
F 2 "Package_SO:PowerPAK_SO-8_Single" H 4300 5575 50  0001 L CIN
F 3 "http://www.vishay.com/docs/72440/si7463dp.pdf" H 4050 5650 50  0001 L CNN
F 4 "Vishay Siliconix" H 0   0   50  0001 C CNN "MFR"
F 5 "SI7463DP-T1-GE3" H 0   0   50  0001 C CNN "MPN"
F 6 "SI7463DP-T1-GE3" H 0   0   50  0001 C CNN "DPN"
F 7 "-" H 0   0   50  0001 C CNN "LCSCPN"
F 8 "-" H 0   0   50  0001 C CNN "SPR"
F 9 "-" H 0   0   50  0001 C CNN "SPN"
F 10 "-" H 0   0   50  0001 C CNN "SIM"
	1    4050 5650
	0    1    -1   0   
$EndComp
$Comp
L si2307cds:Si2307CDS Q1
U 1 1 5E9CEE32
P 3600 5200
F 0 "Q1" V 3950 5150 50  0000 L CNN
F 1 "Si2307CDS" V 3850 4950 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3800 5125 50  0001 L CIN
F 3 "http://www.vishay.com/docs/68768/si2307cds.pdf" H 3600 5200 50  0001 L CNN
F 4 "Vishay Siliconix" H -2550 3350 50  0001 C CNN "MFR"
F 5 "SI2307CDS-T1-GE3" H -2550 3350 50  0001 C CNN "MPN"
F 6 "SI2307CDS-T1-GE3CT-ND" H -2550 3350 50  0001 C CNN "DPN"
F 7 "-" H -2550 3350 50  0001 C CNN "LCSCPN"
F 8 "-" H -2550 3350 50  0001 C CNN "SPR"
F 9 "-" H -2550 3350 50  0001 C CNN "SPN"
F 10 "-" H -2550 3350 50  0001 C CNN "SIM"
	1    3600 5200
	0    -1   -1   0   
$EndComp
$Comp
L Jumper:Jumper_2_Open JP2
U 1 1 5EA1D258
P 3800 5850
F 0 "JP2" H 3800 6000 50  0000 C CNN
F 1 "Jumper_2_Open" H 3800 5994 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3800 5850 50  0001 C CNN
F 3 "~" H 3800 5850 50  0001 C CNN
F 4 "-" H -2900 3750 50  0001 C CNN "MFR"
F 5 "-" H -2900 3750 50  0001 C CNN "MPN"
F 6 "-" H -2900 3750 50  0001 C CNN "DPN"
F 7 "-" H -2900 3750 50  0001 C CNN "LCSCPN"
F 8 "-" H -2900 3750 50  0001 C CNN "SPR"
F 9 "-" H -2900 3750 50  0001 C CNN "SPN"
F 10 "-" H -2900 3750 50  0001 C CNN "SIM"
	1    3800 5850
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_2_Open JP1
U 1 1 5EA32B98
P 3200 5300
F 0 "JP1" H 3200 5450 50  0000 C CNN
F 1 "Jumper_2_Open" H 3200 5444 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3200 5300 50  0001 C CNN
F 3 "~" H 3200 5300 50  0001 C CNN
F 4 "-" H -3500 3200 50  0001 C CNN "MFR"
F 5 "-" H -3500 3200 50  0001 C CNN "MPN"
F 6 "-" H -3500 3200 50  0001 C CNN "DPN"
F 7 "-" H -3500 3200 50  0001 C CNN "LCSCPN"
F 8 "-" H -3500 3200 50  0001 C CNN "SPR"
F 9 "-" H -3500 3200 50  0001 C CNN "SPN"
F 10 "-" H -3500 3200 50  0001 C CNN "SIM"
	1    3200 5300
	0    -1   -1   0   
$EndComp
$Comp
L Jumper:Jumper_2_Open JP4
U 1 1 5EA4C3C0
P 4700 5300
F 0 "JP4" H 4700 5450 50  0000 C CNN
F 1 "Jumper_2_Open" H 4700 5444 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4700 5300 50  0001 C CNN
F 3 "~" H 4700 5300 50  0001 C CNN
F 4 "-" H -2000 3200 50  0001 C CNN "MFR"
F 5 "-" H -2000 3200 50  0001 C CNN "MPN"
F 6 "-" H -2000 3200 50  0001 C CNN "DPN"
F 7 "-" H -2000 3200 50  0001 C CNN "LCSCPN"
F 8 "-" H -2000 3200 50  0001 C CNN "SPR"
F 9 "-" H -2000 3200 50  0001 C CNN "SPN"
F 10 "-" H -2000 3200 50  0001 C CNN "SIM"
	1    4700 5300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5EA2FE2A
P 2350 3750
F 0 "#PWR02" H 2350 3500 50  0001 C CNN
F 1 "GND" H 2355 3577 50  0000 C CNN
F 2 "" H 2350 3750 50  0001 C CNN
F 3 "" H 2350 3750 50  0001 C CNN
	1    2350 3750
	-1   0    0    1   
$EndComp
$Comp
L ESD401DPYR:ESD401DPYR U3
U 1 1 5EA48F38
P 2200 2000
F 0 "U3" V 2253 1871 60  0000 R CNN
F 1 "ESD401" V 2147 1871 60  0000 R CNN
F 2 "0my_footprints:ESD401DPYR" H 2200 1940 60  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fesd401" V 2094 1871 60  0001 R CNN
F 4 "Texas Instruments" H -150 0   50  0001 C CNN "MFR"
F 5 "ESD401DPYR" H -150 0   50  0001 C CNN "MPN"
F 6 "296-47160-1-ND" H -150 0   50  0001 C CNN "DPN"
F 7 "-" H -150 0   50  0001 C CNN "LCSCPN"
F 8 "-" H -150 0   50  0001 C CNN "SPR"
F 9 "-" H -150 0   50  0001 C CNN "SPN"
F 10 "-" H -150 0   50  0001 C CNN "SIM"
	1    2200 2000
	0    -1   -1   0   
$EndComp
Text Label 6500 1500 0    50   ~ 0
5Vusb
Text Notes 1200 1450 0    50   ~ 0
20mm diam. coin cell holder
Text Label 9200 1100 0    50   ~ 0
5Vusb
Text Label 10500 1950 0    50   ~ 0
3V
Text Notes 8400 2900 0    50   ~ 0
Coin cell charger circuit
Text Notes 1200 6350 0    50   ~ 0
Power source selection logic
Text Notes 1150 2900 0    50   ~ 0
CR2032/CR2025 Coin Cell holder \nand ESD/Surge protection
Text Label 2850 1700 0    50   ~ 0
3V
Text Notes 8550 5100 0    50   ~ 0
SPI interface flash memory with SPI
Text Label 6500 1600 0    50   ~ 0
VDD_3V
Text Label 10400 4000 0    50   ~ 0
VDD_3V
Text Label 7550 3750 1    50   ~ 0
VDD_3V
Text Notes 6250 5100 0    50   ~ 0
Real time clock module with i2c interface
Text Notes 3950 2950 0    50   ~ 0
GPIO not marked for any other function or low frequency include P0.13, 15, 17, 20, 22, 24, P1.00
Text Label 6400 3950 2    50   ~ 0
SCL
Text Label 6400 4050 2    50   ~ 0
SDA
Text Label 8750 4100 2    50   ~ 0
SO
Text Label 10400 4100 0    50   ~ 0
~RESET~
Text Label 8750 4000 2    50   ~ 0
~CS~
Text Label 5300 1600 2    50   ~ 0
SO
Text Label 5300 1500 2    50   ~ 0
~CS~
Text Label 5300 1900 2    50   ~ 0
SI
Text Label 5300 1700 2    50   ~ 0
SCLK
Text Label 5300 2100 2    50   ~ 0
SCL
Text Label 5300 2000 2    50   ~ 0
SDA
Text Notes 3950 2850 0    50   ~ 0
P1.15 is a low frequency GPIO (<10kHz)
Text Label 5300 1800 2    50   ~ 0
~WP~
Text Label 8750 4200 2    50   ~ 0
~WP~
Text Label 6650 3550 0    50   ~ 0
VDD_3V
Text Notes 2600 1950 0    50   ~ 0
TVS diode for ESD
Text Notes 6250 4600 0    50   ~ 0
Confirm no connect\noscillator IO
Text Label 10400 4200 0    50   ~ 0
SCLK
Text Label 10400 4300 0    50   ~ 0
SI
Text Notes 9550 1400 0    50   ~ 0
Added a Schottkey Diode
Text Label 1450 5100 0    50   ~ 0
3V
Text Label 5300 5100 0    50   ~ 0
VDD_3V
Text Label 1850 4350 0    50   ~ 0
5Vusb
Text Notes 2550 3900 0    50   ~ 0
TVS diode \nfor ESD\nprotection
Text Label 6500 2100 0    50   ~ 0
~RESET~
Wire Wire Line
	1650 1700 1850 1700
Wire Wire Line
	2850 2300 2850 2450
Wire Wire Line
	9200 1400 8550 1400
Wire Wire Line
	9800 2150 10050 2150
Wire Wire Line
	9800 2400 9800 2450
Wire Wire Line
	9800 2450 9900 2450
Wire Wire Line
	9900 2450 10050 2450
Wire Notes Line
	1050 3000 3550 3000
Wire Notes Line
	3550 3000 3550 900 
Wire Notes Line
	3550 900  1050 900 
Wire Notes Line
	1050 900  1050 3000
Wire Notes Line
	7850 3000 7850 900 
Wire Notes Line
	7850 900  3900 900 
Wire Notes Line
	8250 3000 10800 3000
Wire Wire Line
	9200 1600 9200 1400
Wire Notes Line
	10800 3000 10800 900 
Wire Notes Line
	10800 900  8250 900 
Wire Notes Line
	8250 900  8250 3000
Wire Notes Line
	3900 900  3900 3000
Wire Notes Line
	3900 3000 7850 3000
Wire Notes Line
	5850 6450 1050 6450
Wire Notes Line
	1050 6450 1050 3250
Wire Notes Line
	6150 3250 8150 3250
Wire Notes Line
	8150 3250 8150 5200
Wire Notes Line
	8150 5200 6150 5200
Wire Notes Line
	6150 5200 6150 3250
Wire Notes Line
	8450 3250 8450 5200
Wire Notes Line
	8450 5200 10800 5200
Wire Notes Line
	10800 5200 10800 3250
Wire Notes Line
	10800 3250 8450 3250
Wire Wire Line
	6950 3950 6800 3950
Wire Wire Line
	6800 3950 6400 3950
Wire Wire Line
	6500 4050 6400 4050
Wire Wire Line
	6500 4050 6950 4050
Wire Wire Line
	6500 3750 6500 3650
Wire Wire Line
	6500 3650 6650 3650
Wire Wire Line
	6650 3650 6650 3550
Wire Wire Line
	6650 3650 6800 3650
Wire Notes Line
	1050 3250 5850 3250
Wire Wire Line
	1600 5700 1600 5100
Wire Wire Line
	5300 5100 5150 5100
Wire Wire Line
	5150 5950 5150 6000
Wire Wire Line
	5150 5100 5150 5650
Wire Wire Line
	3600 4250 3550 4250
Wire Wire Line
	3550 4250 3550 4350
Wire Wire Line
	3550 4350 3600 4350
Wire Wire Line
	3450 4350 3450 4000
Wire Wire Line
	3450 4350 3550 4350
Wire Wire Line
	4200 4350 4250 4350
Wire Wire Line
	4250 4350 4250 4000
Wire Wire Line
	3450 3700 3900 3700
Wire Wire Line
	3900 3700 4250 3700
Wire Wire Line
	4250 4350 4350 4350
Wire Wire Line
	3900 3950 3900 3700
Wire Wire Line
	2050 5850 1750 5850
Wire Wire Line
	1750 5850 1750 6000
Wire Wire Line
	10200 1950 10150 1950
Wire Wire Line
	9850 1950 9800 1950
Wire Wire Line
	4700 5100 4750 5100
Wire Wire Line
	2850 5700 2900 5700
Wire Wire Line
	3400 4750 3950 4750
Wire Wire Line
	4350 4750 4700 4750
Wire Wire Line
	4700 4750 4700 5100
Wire Wire Line
	3400 4750 3400 5100
Wire Wire Line
	2850 6000 5150 6000
Wire Wire Line
	1600 5100 1450 5100
Wire Wire Line
	5150 4350 5150 5100
Wire Wire Line
	2900 4350 2900 5700
Wire Wire Line
	5050 5100 5150 5100
Wire Wire Line
	4650 4350 4750 4350
Wire Wire Line
	5050 4350 5150 4350
Wire Notes Line
	5850 3250 5850 6450
Wire Wire Line
	2850 5850 3600 5850
Wire Wire Line
	3200 5100 3400 5100
Wire Wire Line
	1600 5100 3200 5100
Wire Wire Line
	3800 5100 4700 5100
Wire Wire Line
	3600 5400 3600 5850
Wire Wire Line
	3200 5500 3850 5500
Wire Wire Line
	4250 5500 4700 5500
Wire Wire Line
	4050 5750 4050 5850
Wire Wire Line
	4050 5850 4000 5850
Wire Wire Line
	2900 4350 3450 4350
Wire Wire Line
	5150 6000 5200 6000
Wire Wire Line
	3600 5850 3650 5850
Wire Wire Line
	1600 5700 2050 5700
Wire Wire Line
	1600 6000 1750 6000
Wire Wire Line
	1750 2300 2200 2300
Wire Wire Line
	1850 4350 2350 4350
Connection ~ 1850 1700
Connection ~ 9900 2450
Connection ~ 9200 1400
Connection ~ 6800 3950
Connection ~ 6500 4050
Connection ~ 6650 3650
Connection ~ 5150 5100
Connection ~ 3550 4350
Connection ~ 3450 4350
Connection ~ 3900 3700
Connection ~ 4250 4350
Connection ~ 1750 6000
Connection ~ 1600 5100
Connection ~ 3600 5850
Connection ~ 3200 5100
Connection ~ 4700 5100
Connection ~ 3400 5100
Connection ~ 2900 4350
Connection ~ 5150 6000
Connection ~ 1600 5700
Connection ~ 1600 6000
NoConn ~ 8600 2250
NoConn ~ 5300 2300
NoConn ~ 6500 2300
NoConn ~ 6500 2000
NoConn ~ 6500 1900
NoConn ~ 6500 1800
NoConn ~ 6950 4350
NoConn ~ 6950 4250
NoConn ~ 7350 3750
NoConn ~ 5800 1150
NoConn ~ 5950 1150
NoConn ~ 6500 2200
NoConn ~ 5300 2200
$Comp
L ESD401DPYR:ESD401DPYR U4
U 1 1 5EA4E7E7
P 2350 4050
F 0 "U4" V 2403 3921 60  0000 R CNN
F 1 "ESD401" V 2297 3921 60  0000 R CNN
F 2 "0my_footprints:ESD401DPYR" H 2350 3990 60  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fesd401" V 2244 3921 60  0001 R CNN
F 4 "Texas Instruments" H 0   2050 50  0001 C CNN "MFR"
F 5 "ESD401DPYR" H 0   2050 50  0001 C CNN "MPN"
F 6 "296-47160-1-ND" H 0   2050 50  0001 C CNN "DPN"
F 7 "-" H 0   2050 50  0001 C CNN "LCSCPN"
F 8 "-" H 0   2050 50  0001 C CNN "SPR"
F 9 "-" H 0   2050 50  0001 C CNN "SPN"
F 10 "-" H 0   2050 50  0001 C CNN "SIM"
	1    2350 4050
	0    -1   -1   0   
$EndComp
Connection ~ 2350 4350
Wire Wire Line
	2350 4350 2900 4350
Wire Wire Line
	1850 1700 2200 1700
Wire Wire Line
	1750 2300 1750 2250
Connection ~ 2200 2300
Wire Wire Line
	2200 2300 2850 2300
Connection ~ 2200 1700
Wire Wire Line
	2200 1700 2850 1700
Text Notes 3950 2750 0    50   ~ 0
~CS~ - P0.17\nCLK - P0.19\nSI - P0.20\nSO - P0.21\n~WP~ - P0.22\n~RESET~ (SIO3 - pin7) - P0.23\nPinouts from development board schematic\n
Text Notes 8550 4950 0    50   ~ 0
NB: ~CS~ ~WP~ ~RESET~ use inverted logic
$EndSCHEMATC
