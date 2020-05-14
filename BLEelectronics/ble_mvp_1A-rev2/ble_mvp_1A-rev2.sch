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
L power:GND #PWR03
U 1 1 5E9D6756
P 2850 2450
F 0 "#PWR03" H 2850 2200 50  0001 C CNN
F 1 "GND" H 2855 2277 50  0000 C CNN
F 2 "" H 2850 2450 50  0001 C CNN
F 3 "" H 2850 2450 50  0001 C CNN
	1    2850 2450
	-1   0    0    -1  
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
L pcf8523t-timer_rtc:PCF8523T-Timer_RTC IC2
U 1 1 5E9F84DB
P 7450 4650
F 0 "IC2" H 7800 5100 50  0000 L CNN
F 1 "PCF8523T" H 7700 5000 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 8250 4300 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/PCF8523.pdf" H 7450 4650 50  0001 C CNN
F 4 "NXP USA Inc." H 300 550 50  0001 C CNN "MFR"
F 5 "PCF8523T/1,118" H 300 550 50  0001 C CNN "MPN"
F 6 "568-5306-1-ND" H 300 550 50  0001 C CNN "DPN"
F 7 "-" H 300 550 50  0001 C CNN "LCSCPN"
F 8 "-" H 300 550 50  0001 C CNN "SPR"
F 9 "-" H 300 550 50  0001 C CNN "SPN"
F 10 "-" H 300 550 50  0001 C CNN "SIM"
	1    7450 4650
	1    0    0    -1  
$EndComp
$Comp
L mx25R6435FM2IL:MX25R6435FM2IL0 IC3
U 1 1 5E9F9A1A
P 8750 4400
F 0 "IC3" H 9600 4750 60  0000 C CNN
F 1 "MX25R6435FM2IL0" H 9600 4600 60  0000 C CNN
F 2 "0my_footprints:MX25R6435FM2IL0" H 10050 4640 60  0001 C CNN
F 3 "http://www.macronix.com/Lists/Datasheet/Attachments/7428/MX25R6435F,%20Wide%20Range,%2064Mb,%20v1.4.pdf" H 8750 4400 60  0001 C CNN
F 4 "Macronix" H 0   400 50  0001 C CNN "MFR"
F 5 "MX25R6435FM2IL0" H 0   400 50  0001 C CNN "MPN"
F 6 "1092-1200-ND" H 0   400 50  0001 C CNN "DPN"
F 7 "-" H 0   400 50  0001 C CNN "LCSCPN"
F 8 "-" H 0   400 50  0001 C CNN "SPR"
F 9 "-" H 0   400 50  0001 C CNN "SPN"
F 10 "-" H 0   400 50  0001 C CNN "SIM"
	1    8750 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5EA0EA9A
P 7450 5050
F 0 "#PWR09" H 7450 4800 50  0001 C CNN
F 1 "GND" H 7455 4877 50  0000 C CNN
F 2 "" H 7450 5050 50  0001 C CNN
F 3 "" H 7450 5050 50  0001 C CNN
	1    7450 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5EA074F4
P 6800 4300
F 0 "R3" H 6870 4346 50  0000 L CNN
F 1 "10K" H 6870 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6730 4300 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 6800 4300 50  0001 C CNN
F 4 "Yageo" H 350 550 50  0001 C CNN "MFR"
F 5 "RC0603JR-0710KL" H 350 550 50  0001 C CNN "MPN"
F 6 "311-10KGRCT-ND" H 350 550 50  0001 C CNN "DPN"
F 7 "C99198" H 350 550 50  0001 C CNN "LCSCPN"
F 8 "-" H 350 550 50  0001 C CNN "SPR"
F 9 "-" H 350 550 50  0001 C CNN "SPN"
F 10 "-" H 350 550 50  0001 C CNN "SIM"
	1    6800 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5EA0D031
P 6500 4400
F 0 "R2" H 6570 4446 50  0000 L CNN
F 1 "10K" H 6570 4355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6430 4400 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 6500 4400 50  0001 C CNN
F 4 "Yageo" H 50  650 50  0001 C CNN "MFR"
F 5 "RC0603JR-0710KL" H 50  650 50  0001 C CNN "MPN"
F 6 "311-10KGRCT-ND" H 50  650 50  0001 C CNN "DPN"
F 7 "C99198" H 50  650 50  0001 C CNN "LCSCPN"
F 8 "-" H 50  650 50  0001 C CNN "SPR"
F 9 "-" H 50  650 50  0001 C CNN "SPN"
F 10 "-" H 50  650 50  0001 C CNN "SIM"
	1    6500 4400
	1    0    0    -1  
$EndComp
$Comp
L ltc4412xs6:LTC4412xS6 IC1
U 1 1 5E9DE63A
P 2450 6250
F 0 "IC1" H 2450 6831 50  0000 C CNN
F 1 "LTC4412xS6" H 2450 6740 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-6" H 3100 5900 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/4412fb.pdf" H 4550 6050 50  0001 C CNN
F 4 "Linear Technology/Analog Devices" H -2950 3750 50  0001 C CNN "MFR"
F 5 "LTC4412ES6#TRPBF" H -2950 3750 50  0001 C CNN "MPN"
F 6 "LTC4412ES6#TRPBFCT-ND" H -2950 3750 50  0001 C CNN "DPN"
F 7 "C107968" H -2950 3750 50  0001 C CNN "LCSCPN"
F 8 "-" H -2950 3750 50  0001 C CNN "SPR"
F 9 "-" H -2950 3750 50  0001 C CNN "SPN"
F 10 "-" H -2950 3750 50  0001 C CNN "SIM"
	1    2450 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5E9D65E7
P 1600 6250
F 0 "C1" H 1350 6300 50  0000 L CNN
F 1 "0.1uF" H 1300 6200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1638 6100 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_X7R_6.3V-to-50V_18.pdf" H 1600 6250 50  0001 C CNN
F 4 "Yageo" H -3000 3750 50  0001 C CNN "MFR"
F 5 "CC0603KRX7R9BB104" H -3000 3750 50  0001 C CNN "MPN"
F 6 "311-1344-2-ND" H -3000 3750 50  0001 C CNN "DPN"
F 7 "C14663" H -3000 3750 50  0001 C CNN "LCSCPN"
F 8 "-" H -3000 3750 50  0001 C CNN "SPR"
F 9 "-" H -3000 3750 50  0001 C CNN "SPN"
F 10 "-" H -3000 3750 50  0001 C CNN "SIM"
	1    1600 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5E9D9BC8
P 1600 6400
F 0 "#PWR01" H 1600 6150 50  0001 C CNN
F 1 "GND" H 1605 6227 50  0000 C CNN
F 2 "" H 1600 6400 50  0001 C CNN
F 3 "" H 1600 6400 50  0001 C CNN
	1    1600 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5E9D2D00
P 5300 5650
F 0 "C4" H 5415 5696 50  0000 L CNN
F 1 "0.1uF" H 5415 5605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5338 5500 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/mlcc/UPY-GPHC_X7R_6.3V-to-50V_18.pdf" H 5300 5650 50  0001 C CNN
F 4 "Yageo" H -1700 3750 50  0001 C CNN "MFR"
F 5 "CC0603KRX7R9BB104" H -1700 3750 50  0001 C CNN "MPN"
F 6 "311-1344-2-ND" H -1700 3750 50  0001 C CNN "DPN"
F 7 "C14663" H -1700 3750 50  0001 C CNN "LCSCPN"
F 8 "-" H -1700 3750 50  0001 C CNN "SPR"
F 9 "-" H -1700 3750 50  0001 C CNN "SPN"
F 10 "-" H -1700 3750 50  0001 C CNN "SIM"
	1    5300 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5E9D3A19
P 5300 5800
F 0 "#PWR06" H 5300 5550 50  0001 C CNN
F 1 "GND" H 5305 5627 50  0000 C CNN
F 2 "" H 5300 5800 50  0001 C CNN
F 3 "" H 5300 5800 50  0001 C CNN
	1    5300 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5E9D42B2
P 5150 6200
F 0 "R1" H 5220 6246 50  0000 L CNN
F 1 "560K" H 5220 6155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5080 6200 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 5150 6200 50  0001 C CNN
F 4 "Yageo" H -1700 3750 50  0001 C CNN "MFR"
F 5 "RC0201FR-07560KL" H -1700 3750 50  0001 C CNN "MPN"
F 6 "RC0201FR-071K69L" H -1700 3750 50  0001 C CNN "DPN"
F 7 "C295807" H -1700 3750 50  0001 C CNN "LCSCPN"
F 8 "-" H -1700 3750 50  0001 C CNN "SPR"
F 9 "-" H -1700 3750 50  0001 C CNN "SPN"
F 10 "-" H -1700 3750 50  0001 C CNN "SIM"
	1    5150 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 5E9EFF12
P 4500 4750
F 0 "D1" H 4500 4966 50  0000 C CNN
F 1 "D_Schottky" H 4500 4875 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 4500 4750 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/SL14PL-SL110PL(SOD-123FL)-B.pdf" H 4500 4750 50  0001 C CNN
F 4 "SL14PL-TP" H 4500 4750 50  0001 C CNN "MPN"
F 5 "Micro Commercial Co" H 4500 4750 50  0001 C CNN "MFR"
F 6 "SL14PL-TPMSCT-ND" H -1650 3500 50  0001 C CNN "DPN"
F 7 "C417542" H -1650 3500 50  0001 C CNN "LCSCPN"
F 8 "-" H -1650 3500 50  0001 C CNN "SPR"
F 9 "-" H -1650 3500 50  0001 C CNN "SPN"
F 10 "-" H -1650 3500 50  0001 C CNN "SIM"
	1    4500 4750
	-1   0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LP5907MFX-3.3 U4
U 1 1 5EA3D589
P 3900 4650
F 0 "U4" H 3900 5017 50  0000 C CNN
F 1 "LP5907MFX-3.3" H 3900 4926 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 3900 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lp5907.pdf" H 3900 5150 50  0001 C CNN
F 4 "Texas Instruments" H 50  300 50  0001 C CNN "MFR"
F 5 "LP5907MFX-3.3" H 50  300 50  0001 C CNN "MPN"
F 6 "296-38557-1-ND" H 50  300 50  0001 C CNN "DPN"
F 7 "C80670" H 50  300 50  0001 C CNN "LCSCPN"
F 8 "LCSC" H 50  300 50  0001 C CNN "SPR"
F 9 "C143028" H 50  300 50  0001 C CNN "SPN"
F 10 "-" H 50  300 50  0001 C CNN "SIM"
	1    3900 4650
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5EA4312B
P 3900 4100
F 0 "#PWR04" H 3900 3850 50  0001 C CNN
F 1 "GND" H 3905 3927 50  0000 C CNN
F 2 "" H 3900 4100 50  0001 C CNN
F 3 "" H 3900 4100 50  0001 C CNN
	1    3900 4100
	-1   0    0    1   
$EndComp
$Comp
L Device:C C2
U 1 1 5EA4DCA4
P 3450 4250
F 0 "C2" H 3565 4296 50  0000 L CNN
F 1 "1uF" H 3565 4205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3488 4100 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf?ref_disty=digikey" H 3450 4250 50  0001 C CNN
F 4 "TDK Corporation" H -5300 2600 50  0001 C CNN "MFR"
F 5 "C1608X5R1C105K080AA" H -5300 2600 50  0001 C CNN "MPN"
F 6 "445-1416-1-ND" H -5300 2600 50  0001 C CNN "DPN"
F 7 "C385893" H -5300 2600 50  0001 C CNN "LCSCPN"
F 8 "-" H -5300 2600 50  0001 C CNN "SPR"
F 9 "-" H -5300 2600 50  0001 C CNN "SPN"
F 10 "-" H -5300 2600 50  0001 C CNN "SIM"
	1    3450 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5EA4EF46
P 4250 4250
F 0 "C3" H 4365 4296 50  0000 L CNN
F 1 "1uF" H 4365 4205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4288 4100 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/mlcc_commercial_general_en.pdf?ref_disty=digikey" H 4250 4250 50  0001 C CNN
F 4 "TDK Corporation" H -4500 2600 50  0001 C CNN "MFR"
F 5 "C1608X5R1C105K080AA" H -4500 2600 50  0001 C CNN "MPN"
F 6 "445-1416-1-ND" H -4500 2600 50  0001 C CNN "DPN"
F 7 "C385893" H -4500 2600 50  0001 C CNN "LCSCPN"
F 8 "-" H -4500 2600 50  0001 C CNN "SPR"
F 9 "-" H -4500 2600 50  0001 C CNN "SPN"
F 10 "-" H -4500 2600 50  0001 C CNN "SIM"
	1    4250 4250
	1    0    0    -1  
$EndComp
$Comp
L nordic_nrf52840_breakout:Nordic_nRF52840_breakout J1
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
L power:GND #PWR02
U 1 1 5EA2FE2A
P 2350 4150
F 0 "#PWR02" H 2350 3900 50  0001 C CNN
F 1 "GND" H 2355 3977 50  0000 C CNN
F 2 "" H 2350 4150 50  0001 C CNN
F 3 "" H 2350 4150 50  0001 C CNN
	1    2350 4150
	-1   0    0    1   
$EndComp
$Comp
L ESD401DPYR:ESD401DPYR D2
U 1 1 5EA48F38
P 2200 2000
F 0 "D2" V 2253 1871 60  0000 R CNN
F 1 "ESD401" V 2147 1871 60  0000 R CNN
F 2 "0my_footprints:ESD401DPYR" H 2200 1940 60  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fesd401" V 2094 1871 60  0001 R CNN
F 4 "Texas Instruments" H -150 0   50  0001 C CNN "MFR"
F 5 "ESD401DPYR" H -150 0   50  0001 C CNN "MPN"
F 6 "296-47160-1-ND" H -150 0   50  0001 C CNN "DPN"
F 7 "C316041" H -150 0   50  0001 C CNN "LCSCPN"
F 8 "-" H -150 0   50  0001 C CNN "SPR"
F 9 "-" H -150 0   50  0001 C CNN "SPN"
F 10 "-" H -150 0   50  0001 C CNN "SIM"
	1    2200 2000
	0    -1   -1   0   
$EndComp
$Comp
L ESD401DPYR:ESD401DPYR D3
U 1 1 5EA4E7E7
P 2350 4450
F 0 "D3" V 2403 4321 60  0000 R CNN
F 1 "ESD401" V 2297 4321 60  0000 R CNN
F 2 "0my_footprints:ESD401DPYR" H 2350 4390 60  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fesd401" V 2244 4321 60  0001 R CNN
F 4 "Texas Instruments" H 0   2450 50  0001 C CNN "MFR"
F 5 "ESD401DPYR" H 0   2450 50  0001 C CNN "MPN"
F 6 "296-47160-1-ND" H 0   2450 50  0001 C CNN "DPN"
F 7 "C316041" H 0   2450 50  0001 C CNN "LCSCPN"
F 8 "-" H 0   2450 50  0001 C CNN "SPR"
F 9 "-" H 0   2450 50  0001 C CNN "SPN"
F 10 "-" H 0   2450 50  0001 C CNN "SIM"
	1    2350 4450
	0    -1   -1   0   
$EndComp
$Comp
L si2307cds:Si2307CDS Q1
U 1 1 5E9CEE32
P 3600 5600
F 0 "Q1" V 3950 5550 50  0000 L CNN
F 1 "Si2307CDS" V 3850 5350 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3800 5525 50  0001 L CIN
F 3 "http://www.vishay.com/docs/68768/si2307cds.pdf" H 3600 5600 50  0001 L CNN
F 4 "Vishay Siliconix" H -2550 3750 50  0001 C CNN "MFR"
F 5 "SI2307CDS-T1-GE3" H -2550 3750 50  0001 C CNN "MPN"
F 6 "SI2307CDS-T1-GE3CT-ND" H -2550 3750 50  0001 C CNN "DPN"
F 7 "C141561" H -2550 3750 50  0001 C CNN "LCSCPN"
F 8 "-" H -2550 3750 50  0001 C CNN "SPR"
F 9 "-" H -2550 3750 50  0001 C CNN "SPN"
F 10 "-" H -2550 3750 50  0001 C CNN "SIM"
	1    3600 5600
	0    -1   -1   0   
$EndComp
$Comp
L Device:Crystal X1
U 1 1 5EB305AF
P 6350 4800
F 0 "X1" V 6304 4931 50  0000 L CNN
F 1 "32.768KHZ" V 6395 4931 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_3215-2Pin_3.2x1.5mm" H 6350 4800 50  0001 C CNN
F 3 "https://www.microcrystal.com/fileadmin/Media/Products/32kHz/Datasheet/CM7V-T1A_Low-ESR.pdf" H 6350 4800 50  0001 C CNN
F 4 "Micro Crystal AG" V 6350 4800 50  0001 C CNN "MFR"
F 5 "CM7VT1A-LOWESR-32.768KHZ-12.5PF-20-TA-QC" V 6350 4800 50  0001 C CNN "MPN"
F 6 "2195-CM7VT1ALOWESR32.768KHZ12.5PF20TAQCCT-ND" V 6350 4800 50  0001 C CNN "DPN"
F 7 "-" H 0   400 50  0001 C CNN "LCSCPN"
F 8 "-" H 0   400 50  0001 C CNN "SPR"
F 9 "-" H 0   400 50  0001 C CNN "SPN"
F 10 "-" H 0   400 50  0001 C CNN "SIM"
	1    6350 4800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5EA9F122
P 8750 4700
F 0 "#PWR010" H 8750 4450 50  0001 C CNN
F 1 "GND" H 8755 4527 50  0000 C CNN
F 2 "" H 8750 4700 50  0001 C CNN
F 3 "" H 8750 4700 50  0001 C CNN
	1    8750 4700
	1    0    0    -1  
$EndComp
Text Label 6500 1500 0    50   ~ 0
5Vusb
Text Notes 1150 1100 0    50   ~ 0
20mm diam. coin cell holder
Text Notes 1150 6850 0    50   ~ 0
Power source selection logic
Text Notes 1150 3250 0    50   ~ 0
CR2032/CR2025 Coin Cell holder \nand ESD/Surge protection
Text Label 2850 1700 0    50   ~ 0
3V
Text Notes 8550 5500 0    50   ~ 0
SPI interface flash memory with SPI
Text Label 6500 1600 0    50   ~ 0
VDD_3V
Text Label 10400 4400 0    50   ~ 0
VDD_3V
Text Label 7350 4250 1    50   ~ 0
VDD_3V
Text Notes 6250 5500 0    50   ~ 0
Real time clock module with i2c interface
Text Notes 3950 3050 0    50   ~ 0
GPIO not marked for any other function or low frequency include P0.13, 15, 17, 20, 22, 24, P1.00
Text Label 6400 4450 2    50   ~ 0
SCL
Text Label 6400 4550 2    50   ~ 0
SDA
Text Label 8750 4500 2    50   ~ 0
SO
Text Label 10400 4500 0    50   ~ 0
RESET
Text Label 8750 4400 2    50   ~ 0
CS
Text Label 5300 1600 2    50   ~ 0
SO
Text Label 5300 1500 2    50   ~ 0
CS
Text Label 5300 1900 2    50   ~ 0
SI
Text Label 5300 1700 2    50   ~ 0
SCLK
Text Notes 3950 2950 0    50   ~ 0
P1.15 is recommended for low frequency GPIO (<10kHz) due to\nproximity to the Antenna. Only used for pinging the RTC on startup.
Text Label 5300 1800 2    50   ~ 0
WP
Text Label 8750 4600 2    50   ~ 0
WP
Text Notes 4000 1700 0    50   ~ 0
Confirmed no pull-up/down\nresistors for SPI protocol\nAdd 100nF cap between \nGND and VCC
Text Label 6650 4050 0    50   ~ 0
VDD_3V
Text Notes 2600 1950 0    50   ~ 0
TVS diode for ESD
Text Notes 6250 5150 0    50   ~ 0
Need an external crystal
Text Label 10400 4600 0    50   ~ 0
SCLK
Text Label 10400 4700 0    50   ~ 0
SI
Text Label 1450 5500 0    50   ~ 0
3V
Text Label 5300 5500 0    50   ~ 0
VDD_3V
Text Label 1850 4750 0    50   ~ 0
5Vusb
Text Notes 2550 4300 0    50   ~ 0
TVS diode \nfor ESD\nprotection
Text Label 5300 2000 2    50   ~ 0
RESET
Text Notes 3950 2750 0    50   ~ 0
CS - P0.17\nCLK - P0.19\nSI - P0.20\nSO - P0.21\nWP - P0.22\nSIO3/HOLD/RESET(pin7) - P0.23\nPinouts from development board schematic\n
Text Notes 6700 3850 0    50   ~ 0
VDD powers chip. VBat is for time \nkeeping backup with switching logic.
Text Label 5300 2100 2    50   ~ 0
SCL
Text Label 6500 2100 0    50   ~ 0
SDA
Text Notes 8400 1000 0    50   ~ 0
NON RECHARGEABLE VERSION
Wire Wire Line
	1650 1700 1850 1700
Wire Wire Line
	2850 2300 2850 2450
Wire Notes Line
	1050 3350 3550 3350
Wire Notes Line
	3550 900  1050 900 
Wire Notes Line
	7850 900  3900 900 
Wire Notes Line
	3900 3350 7850 3350
Wire Notes Line
	6150 3650 8150 3650
Wire Notes Line
	8150 3650 8150 5600
Wire Notes Line
	8150 5600 6150 5600
Wire Notes Line
	6150 5600 6150 3650
Wire Notes Line
	8450 3650 8450 5600
Wire Notes Line
	8450 5600 10800 5600
Wire Notes Line
	10800 5600 10800 3650
Wire Notes Line
	10800 3650 8450 3650
Wire Wire Line
	6950 4450 6800 4450
Wire Wire Line
	6800 4450 6400 4450
Wire Wire Line
	6500 4550 6400 4550
Wire Wire Line
	6500 4550 6950 4550
Wire Wire Line
	6500 4250 6500 4150
Wire Wire Line
	6500 4150 6650 4150
Wire Wire Line
	6650 4150 6650 4050
Wire Wire Line
	6650 4150 6800 4150
Wire Notes Line
	1050 3650 5850 3650
Wire Wire Line
	1600 6100 1600 5500
Wire Wire Line
	5300 5500 5150 5500
Wire Wire Line
	5150 6350 5150 6400
Wire Wire Line
	5150 5500 5150 6050
Wire Wire Line
	3600 4650 3550 4650
Wire Wire Line
	3550 4650 3550 4750
Wire Wire Line
	3550 4750 3600 4750
Wire Wire Line
	3450 4750 3450 4400
Wire Wire Line
	3450 4750 3550 4750
Wire Wire Line
	4200 4750 4250 4750
Wire Wire Line
	4250 4750 4250 4400
Wire Wire Line
	3450 4100 3900 4100
Wire Wire Line
	3900 4100 4250 4100
Wire Wire Line
	4250 4750 4350 4750
Wire Wire Line
	3900 4350 3900 4100
Wire Wire Line
	2050 6250 1750 6250
Wire Wire Line
	1750 6250 1750 6400
Wire Wire Line
	2850 6100 2900 6100
Wire Wire Line
	2850 6400 5150 6400
Wire Wire Line
	1600 5500 1450 5500
Wire Wire Line
	5150 4750 5150 5500
Wire Wire Line
	2900 4750 2900 6100
Wire Wire Line
	2850 6250 3600 6250
Wire Wire Line
	2900 4750 3450 4750
Wire Wire Line
	3600 6250 3650 6250
Wire Wire Line
	1600 6100 2050 6100
Wire Wire Line
	1600 6400 1750 6400
Wire Wire Line
	1750 2300 2200 2300
Wire Wire Line
	1850 4750 2350 4750
Wire Wire Line
	2350 4750 2900 4750
Wire Wire Line
	1850 1700 2200 1700
Wire Wire Line
	1750 2300 1750 2250
Wire Wire Line
	2200 2300 2850 2300
Wire Wire Line
	2200 1700 2850 1700
Wire Wire Line
	3600 5800 3600 6250
Wire Wire Line
	6950 4850 6950 4950
Wire Wire Line
	6950 4950 6350 4950
Wire Wire Line
	6950 4750 6750 4750
Wire Wire Line
	6750 4750 6750 4650
Wire Wire Line
	6750 4650 6350 4650
Wire Wire Line
	2050 6400 1750 6400
Wire Wire Line
	4650 4750 5150 4750
Connection ~ 1850 1700
Connection ~ 6800 4450
Connection ~ 6500 4550
Connection ~ 6650 4150
Connection ~ 5150 5500
Connection ~ 3550 4750
Connection ~ 3450 4750
Connection ~ 3900 4100
Connection ~ 4250 4750
Connection ~ 1600 5500
Connection ~ 3600 6250
Connection ~ 2900 4750
Connection ~ 1600 6100
Connection ~ 1600 6400
Connection ~ 2350 4750
Connection ~ 2200 2300
Connection ~ 2200 1700
Connection ~ 1750 6400
NoConn ~ 5300 2300
NoConn ~ 6500 2300
NoConn ~ 6500 2000
NoConn ~ 6500 1900
NoConn ~ 6500 1800
NoConn ~ 5800 1150
NoConn ~ 5950 1150
NoConn ~ 6500 2200
NoConn ~ 5300 2200
NoConn ~ 7550 4250
NoConn ~ 7950 4650
Wire Notes Line
	7850 900  7850 3350
Wire Notes Line
	3900 900  3900 3350
Wire Notes Line
	3550 900  3550 3350
Wire Notes Line
	1050 900  1050 3350
Text Notes 3950 3300 0    50   ~ 0
Through hole pin header for Nordic Dongle
Wire Notes Line
	5850 3650 5850 6950
Wire Notes Line
	1050 6950 5850 6950
Wire Notes Line
	1050 3650 1050 6950
Connection ~ 3400 5500
Wire Wire Line
	3800 5500 4550 5500
Wire Wire Line
	1600 5500 3400 5500
Wire Wire Line
	3400 5150 3400 5500
Wire Wire Line
	4550 5150 4550 5500
Wire Wire Line
	4350 5150 4550 5150
Wire Wire Line
	3400 5150 3950 5150
$Comp
L Jumper:Jumper_2_Open JP1
U 1 1 5EA10100
P 4150 5150
F 0 "JP1" H 4350 5250 50  0000 C CNN
F 1 "Jumper_2_Open" H 4150 5294 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4150 5150 50  0001 C CNN
F 3 "~" H 4150 5150 50  0001 C CNN
F 4 "-" H -2550 3050 50  0001 C CNN "MFR"
F 5 "-" H -2550 3050 50  0001 C CNN "MPN"
F 6 "-" H -2550 3050 50  0001 C CNN "DPN"
F 7 "-" H -2550 3050 50  0001 C CNN "LCSCPN"
F 8 "-" H -2550 3050 50  0001 C CNN "SPR"
F 9 "-" H -2550 3050 50  0001 C CNN "SPN"
F 10 "-" H -2550 3050 50  0001 C CNN "SIM"
	1    4150 5150
	1    0    0    -1  
$EndComp
Connection ~ 4550 5500
Wire Wire Line
	4550 5500 5150 5500
$EndSCHEMATC
