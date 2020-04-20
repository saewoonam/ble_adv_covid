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
L AU-Y1006-R:AU-Y1006-R J2
U 1 1 5E9BAB23
P 5900 3950
F 0 "J2" H 6142 3363 60 0000 C CNN
F 1 "AU-Y1006-R" H 6142 3469 60 0000 C CNN
F 2 "0my_footprints:AU-Y1006-R" H 6300 3690 60 0001 C CNN
F 3 "http://www.assmann-wsw.com/fileadmin/datasheets/ASS_5774_CO.pdf" H 5900 3950 60 0000 C CNN
F 4 "Assmann WSW Components" H 0 0 50 0001 C CNN "MFR"
F 5 "AU-Y1006-2" H 0 0 50 0001 C CNN "MPN"
F 6 "AE11187-ND" H 0 0 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    5900 3950
	1    0    0    -1  
$EndComp
$Comp
L usb_a_plug:USB_A_PLUG J1
U 1 1 5E9BBD32
P 1600 4050
F 0 "J1" H 1978 3898 60 0000 L CNN
F 1 "USB_A_PLUG" H 1978 3792 60 0000 L CNN
F 2 "0my_footprints:usbA-PCB" H 1978 3686 60 0000 L CNN
F 3 "" H 1600 4050 60 0000 C CNN
F 4 "-" H 0 0 50 0001 C CNN "MFR"
F 5 "-" H 0 0 50 0001 C CNN "MPN"
F 6 "-" H 0 0 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    1600 4050
	0    -1   1    0   
$EndComp
$Comp
L Power_Protection:TPD2E2U06 U1
U 1 1 5E9C3AB8
P 4850 4100
F 0 "U1" H 4850 4467 50 0000 C CNN
F 1 "TPD2E2U06" H 4850 4376 50 0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-543" H 4050 3850 50 0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tpd2e2u06.pdf" H 4650 4300 50 0001 C CNN
F 4 "Texas Instruments" H 0 0 50 0001 C CNN "MFR"
F 5 "TPD2E2U06DRLR" H 0 0 50 0001 C CNN "MPN"
F 6 "296-38361-1-ND" H 0 0 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    4850 4100
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5E9CC857
P 4850 4400
F 0 "#PWR0101" H 4850 4150 50 0001 C CNN
F 1 "GND" H 4855 4227 50 0000 C CNN
F 2 "" H 4850 4400 50 0001 C CNN
F 3 "" H 4850 4400 50 0001 C CNN
	1    4850 4400
	1    0    0    -1  
$EndComp
$Comp
L TPD1E10B06DPYR:TPD1E10B06DPYR D1
U 1 1 5E9C4738
P 3150 4050
F 0 "D1" H 3150 4337 50 0000 C CNN
F 1 "TPD1E10B06DPYR" H 3150 4246 50 0000 C CNN
F 2 "DIODFN100X60X45-2N" H 3150 4050 50 0001 L BNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftpd1e10b06" H 3150 4050 50 0001 L BNN
F 4 "Manufacturer Recommendation" H 3150 4050 50 0001 L BNN "Field4"
F 5 "None" H 3150 4050 50 0001 L BNN "Field5"
F 6 "Texas Instruments" H 3150 4050 50 0001 L BNN "Field6"
F 7 "XDFN-2 Texas Instruments" H 3150 4050 50 0001 L BNN "Field7"
F 8 "Single Channel ESD in 0402 package with 10pF Capacitance and 6V Breakdown 2-X1SON -40 to 125" H 3150 4050 50 0001 L BNN "Field8"
F 9 "Unavailable" H 3150 4050 50 0001 L BNN "Field9"
F 10 "Texas Instruments" H 0 0 50 0001 C CNN "MFR"
F 11 "TPD1E10B06DPYR" H 0 0 50 0001 C CNN "MPN"
F 12 "296-30406-1-ND" H 0 0 50 0001 C CNN "DPN"
F 13 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 14 "-" H 0 0 50 0001 C CNN "SPR"
F 15 "-" H 0 0 50 0001 C CNN "SPN"
F 16 "-" H 0 0 50 0001 C CNN "SIM"
	1    3150 4050
	0    1    1    0   
$EndComp
$Comp
L TPD1E10B06DPYR:TPD1E10B06DPYR D2
U 1 1 5E9C6764
P 2250 1950
F 0 "D2" H 2250 2237 50 0000 C CNN
F 1 "TPD1E10B06DPYR" H 2250 2146 50 0000 C CNN
F 2 "DIODFN100X60X45-2N" H 2250 1950 50 0001 L BNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftpd1e10b06" H 2250 1950 50 0001 L BNN
F 4 "Manufacturer Recommendation" H 2250 1950 50 0001 L BNN "Field4"
F 5 "None" H 2250 1950 50 0001 L BNN "Field5"
F 6 "Texas Instruments" H 2250 1950 50 0001 L BNN "Field6"
F 7 "XDFN-2 Texas Instruments" H 2250 1950 50 0001 L BNN "Field7"
F 8 "Single Channel ESD in 0402 package with 10pF Capacitance and 6V Breakdown 2-X1SON -40 to 125" H 2250 1950 50 0001 L BNN "Field8"
F 9 "Unavailable" H 2250 1950 50 0001 L BNN "Field9"
F 10 "Texas Instruments" H 0 0 50 0001 C CNN "MFR"
F 11 "TPD1E10B06DPYR" H 0 0 50 0001 C CNN "MPN"
F 12 "296-30406-1-ND" H 0 0 50 0001 C CNN "DPN"
F 13 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 14 "-" H 0 0 50 0001 C CNN "SPR"
F 15 "-" H 0 0 50 0001 C CNN "SPN"
F 16 "-" H 0 0 50 0001 C CNN "SIM"
	1    2250 1950
	0    1    -1   0   
$EndComp
$Comp
L BAT-HLD-001:BAT-HLD-001 U2
U 1 1 5E9C706C
P 1650 1700
F 0 "U2" H 1925 1903 60 0000 C CNN
F 1 "BAT-HLD-001" H 1925 1797 60 0000 C CNN
F 2 "0my_footprints:BAT-HLD-001" H 1934 1358 60 0001 C CNN
F 3 "https://linxtechnologies.com/wp/wp-content/uploads/catalog-battery-holders.pdf" H 1650 1700 60 0001 C CNN
F 4 "Linx Technologies Inc." H 0 0 50 0001 C CNN "MFR"
F 5 "BAT-HLD-001" H 0 0 50 0001 C CNN "MPN"
F 6 "BAT-HLD-001-ND" H 0 0 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    1650 1700
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5E9D630A
P 5650 4400
F 0 "#PWR02" H 5650 4150 50 0001 C CNN
F 1 "GND" H 5655 4227 50 0000 C CNN
F 2 "" H 5650 4400 50 0001 C CNN
F 3 "" H 5650 4400 50 0001 C CNN
	1    5650 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5E9D6756
P 2850 2500
F 0 "#PWR01" H 2850 2250 50 0001 C CNN
F 1 "GND" H 2855 2327 50 0000 C CNN
F 2 "" H 2850 2500 50 0001 C CNN
F 3 "" H 2850 2500 50 0001 C CNN
	1    2850 2500
	-1   0    0    -1  
$EndComp
$Comp
L Power_Management:LTC4412xS6 U3
U 1 1 5E9DE63A
P 5400 2500
F 0 "U3" H 5400 3081 50 0000 C CNN
F 1 "LTC4412xS6" H 5400 2990 50 0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-6" H 6050 2150 50 0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/4412fb.pdf" H 7500 2300 50 0001 C CNN
F 4 "Linear Technology/Analog Devices" H 0 0 50 0001 C CNN "MFR"
F 5 "LTC4412ES6#TRPBF" H 0 0 50 0001 C CNN "MPN"
F 6 "LTC4412ES6#TRPBFCT-ND" H 0 0 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    5400 2500
	1    0    0    -1  
$EndComp
$Comp
L LTC4054LES5-4.2_TRPBF:LTC4054LES5-4.2#TRPBF U4
U 1 1 5E9DF23D
P 9400 2200
F 0 "U4" H 9200 2700 50 0000 C CNN
F 1 "LTC4054LES5-4.2#TRPBF" H 9400 1700 50 0000 C CNN
F 2 "0my_footprints:LTC4054LES5-4.2_TRPBF" H 9400 2200 50 0001 L BNN
F 3 "http://www.linear.com/docs/2068" H 9400 2200 50 0001 L BNN
F 4 "Linear Technology" H 9400 2200 50 0001 L BNN "Field4"
F 5 "Linear Technology/Analog Devices" H 0 0 50 0001 C CNN "MFR"
F 6 "LTC4054LES5-4.2#TRPBF" H 0 0 50 0001 C CNN "MPN"
F 7 "LTC4054LES5-4.2#TRPBFCT-ND" H 0 0 50 0001 C CNN "DPN"
F 8 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 9 "-" H 0 0 50 0001 C CNN "SPR"
F 10 "-" H 0 0 50 0001 C CNN "SPN"
F 11 "-" H 0 0 50 0001 C CNN "SIM"
	1    9400 2200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID1
U 1 1 5E9C7124
P 1200 7000
F 0 "FID1" H 1285 7046 50 0000 L CNN
F 1 "Fiducial" H 1285 6955 50 0000 L CNN
F 2 "Fiducial:Fiducial_0.5mm_Mask1mm" H 1200 7000 50 0001 C CNN
F 3 "~" H 1200 7000 50 0001 C CNN
F 4 "-" H 0 0 50 0001 C CNN "MFR"
F 5 "-" H 0 0 50 0001 C CNN "MPN"
F 6 "-" H 0 0 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    1200 7000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID2
U 1 1 5E9C7A0B
P 1200 7250
F 0 "FID2" H 1285 7296 50 0000 L CNN
F 1 "Fiducial" H 1285 7205 50 0000 L CNN
F 2 "Fiducial:Fiducial_0.5mm_Mask1mm" H 1200 7250 50 0001 C CNN
F 3 "~" H 1200 7250 50 0001 C CNN
F 4 "-" H 0 0 50 0001 C CNN "MFR"
F 5 "-" H 0 0 50 0001 C CNN "MPN"
F 6 "-" H 0 0 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    1200 7250
	1    0    0    -1  
$EndComp
$Comp
L si2307cds:Si2307CDS Q1
U 1 1 5E9CEE32
P 6150 1850
F 0 "Q1" V 6500 1800 50 0000 L CNN
F 1 "Si2307CDS" V 6400 1650 50 0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6350 1775 50 0001 L CIN
F 3 "http://www.vishay.com/docs/68768/si2307cds.pdf" H 6150 1850 50 0001 L CNN
F 4 "Vishay Siliconix" H 0 0 50 0001 C CNN "MFR"
F 5 "SI2307CDS-T1-GE3" H 0 0 50 0001 C CNN "MPN"
F 6 "SI2307CDS-T1-GE3CT-ND" H 0 0 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    6150 1850
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C2
U 1 1 5E9D2D00
P 7000 1900
F 0 "C2" H 7115 1946 50 0000 L CNN
F 1 "0.1uF" H 7115 1855 50 0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7038 1750 50 0001 C CNN
F 3 "~" H 7000 1900 50 0001 C CNN
F 4 "Yageo" H 0 0 50 0001 C CNN "MFR"
F 5 "CC0603KRX7R9BB104" H 0 0 50 0001 C CNN "MPN"
F 6 "311-1344-2-ND" H 0 0 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    7000 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5E9D3A19
P 7000 2050
F 0 "#PWR04" H 7000 1800 50 0001 C CNN
F 1 "GND" H 7005 1877 50 0000 C CNN
F 2 "" H 7000 2050 50 0001 C CNN
F 3 "" H 7000 2050 50 0001 C CNN
	1    7000 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5E9D42B2
P 6850 2450
F 0 "R4" H 6920 2496 50 0000 L CNN
F 1 "560K" H 6920 2405 50 0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6780 2450 50 0001 C CNN
F 3 "~" H 6850 2450 50 0001 C CNN
F 4 "-" H 0 0 50 0001 C CNN "MFR"
F 5 "-" H 0 0 50 0001 C CNN "MPN"
F 6 "-" H 0 0 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    6850 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5E9D65E7
P 4600 2500
F 0 "C1" H 4715 2546 50 0000 L CNN
F 1 "0.1uF" H 4715 2455 50 0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4638 2350 50 0001 C CNN
F 3 "~" H 4600 2500 50 0001 C CNN
F 4 "Yageo" H 0 0 50 0001 C CNN "MFR"
F 5 "CC0603KRX7R9BB104" H 0 0 50 0001 C CNN "MPN"
F 6 "311-1344-2-ND" H 0 0 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    4600 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5E9D9BC8
P 4600 2650
F 0 "#PWR03" H 4600 2400 50 0001 C CNN
F 1 "GND" H 4605 2477 50 0000 C CNN
F 2 "" H 4600 2650 50 0001 C CNN
F 3 "" H 4600 2650 50 0001 C CNN
	1    4600 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D3
U 1 1 5E9EFF12
P 6150 1250
F 0 "D3" H 6150 1466 50 0000 C CNN
F 1 "D_Schottky" H 6150 1375 50 0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 6150 1250 50 0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/SL14PL-SL110PL(SOD-123FL)-B.pdf" H 6150 1250 50 0001 C CNN
F 4 "SL14PL-TP" H 6150 1250 50 0001 C CNN "MPN"
F 5 "Micro Commercial Co" H 6150 1250 50 0001 C CNN "MFR"
F 6 "SL14PL-TPMSCT-ND" H 0 0 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    6150 1250
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E9F603B
P 6600 1250
F 0 "R2" V 6393 1250 50 0000 C CNN
F 1 "0" V 6484 1250 50 0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6530 1250 50 0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 6600 1250 50 0001 C CNN
F 4 "RC0603JR-070RL" V 6600 1250 50 0001 C CNN "MPN"
F 5 "Yageo" V 6600 1250 50 0001 C CNN "MFR"
F 6 "311-0.0GRCT-ND" V 6600 1250 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    6600 1250
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5E9F9456
P 6600 1750
F 0 "R3" V 6393 1750 50 0000 C CNN
F 1 "0" V 6484 1750 50 0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6530 1750 50 0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 6600 1750 50 0001 C CNN
F 4 "RC0603JR-070RL" V 6600 1750 50 0001 C CNN "MPN"
F 5 "Yageo" V 6600 1750 50 0001 C CNN "MFR"
F 6 "311-0.0GRCT-ND" V 6600 1750 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    6600 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5E9FCC69
P 4800 2650
F 0 "R1" V 4593 2650 50 0000 C CNN
F 1 "0" V 4684 2650 50 0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4730 2650 50 0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 4800 2650 50 0001 C CNN
F 4 "RC0603JR-070RL" V 4800 2650 50 0001 C CNN "MPN"
F 5 "Yageo" V 4800 2650 50 0001 C CNN "MFR"
F 6 "311-0.0GRCT-ND" V 4800 2650 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    4800 2650
	0    1    1    0   
$EndComp
$Comp
L Device:C C3
U 1 1 5EA027B7
P 8750 1650
F 0 "C3" H 8865 1696 50 0000 L CNN
F 1 "1uF" H 8865 1605 50 0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8788 1500 50 0001 C CNN
F 3 "~" H 8750 1650 50 0001 C CNN
F 4 "Samsung" H 0 0 50 0001 C CNN "MFR"
F 5 "CL10B105KA8NNNC" H 0 0 50 0001 C CNN "MPN"
F 6 "587-2786-6-ND" H 0 0 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    8750 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5EA027BD
P 8750 1800
F 0 "#PWR05" H 8750 1550 50 0001 C CNN
F 1 "GND" H 8755 1627 50 0000 C CNN
F 2 "" H 8750 1800 50 0001 C CNN
F 3 "" H 8750 1800 50 0001 C CNN
	1    8750 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5EA04301
P 10250 2400
F 0 "R6" H 10320 2446 50 0000 L CNN
F 1 "1.69K" H 10320 2355 50 0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10180 2400 50 0001 C CNN
F 3 "~" H 10250 2400 50 0001 C CNN
F 4 "-" H 0 0 50 0001 C CNN "MFR"
F 5 "-" H 0 0 50 0001 C CNN "MPN"
F 6 "-" H 0 0 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    10250 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5EA08150
P 10400 2050
F 0 "R7" V 10193 2050 50 0000 C CNN
F 1 "0" V 10284 2050 50 0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10330 2050 50 0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 10400 2050 50 0001 C CNN
F 4 "RC0603JR-070RL" V 10400 2050 50 0001 C CNN "MPN"
F 5 "Yageo" V 10400 2050 50 0001 C CNN "MFR"
F 6 "311-0.0GRCT-ND" V 10400 2050 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    10400 2050
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5EA09643
P 9400 1350
F 0 "R5" V 9193 1350 50 0000 C CNN
F 1 "0" V 9284 1350 50 0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 9330 1350 50 0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_10.pdf" H 9400 1350 50 0001 C CNN
F 4 "RC0603JR-070RL" V 9400 1350 50 0001 C CNN "MPN"
F 5 "Yageo" V 9400 1350 50 0001 C CNN "MFR"
F 6 "311-0.0GRCT-ND" V 9400 1350 50 0001 C CNN "DPN"
F 7 "-" H 0 0 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 0 50 0001 C CNN "SPR"
F 9 "-" H 0 0 50 0001 C CNN "SPN"
F 10 "-" H 0 0 50 0001 C CNN "SIM"
	1    9400 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5EA09E9A
P 10100 2550
F 0 "#PWR06" H 10100 2300 50 0001 C CNN
F 1 "GND" H 10105 2377 50 0000 C CNN
F 2 "" H 10100 2550 50 0001 C CNN
F 3 "" H 10100 2550 50 0001 C CNN
	1    10100 2550
	1    0    0    -1  
$EndComp
$Comp
L MCU_Module:Adafruit_HUZZAH_ESP8266_breakout A1
U 1 1 5EA1DDE5
P 9600 4150
F 0 "A1" H 9600 3261 50 0000 C CNN
F 1 "Adafruit_HUZZAH_ESP8266_breakout" V 10450 4100 50 0000 C CNN
F 2 "Module:Adafruit_HUZZAH_ESP8266_breakout" H 9800 4750 50 0001 C CNN
F 3 "https://www.adafruit.com/product/2471" H 9900 4850 50 0001 C CNN
F 4 "-" H 0 -350 50 0001 C CNN "MFR"
F 5 "-" H 0 -350 50 0001 C CNN "MPN"
F 6 "-" H 0 -350 50 0001 C CNN "DPN"
F 7 "-" H 0 -350 50 0001 C CNN "LCSCPN"
F 8 "-" H 0 -350 50 0001 C CNN "SPR"
F 9 "-" H 0 -350 50 0001 C CNN "SPN"
F 10 "-" H 0 -350 50 0001 C CNN "SIM"
	1    9600 4150
	1    0    0    -1  
$EndComp
$Comp
L Memory_Flash:AT25SF081-XMHD-X U5
U 1 1 5EA2E8E6
P 9600 5800
F 0 "U5" H 10244 5846 50 0000 L CNN
F 1 "MX25R6435FM2IL0" H 10244 5755 50 0000 L CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 9600 5200 50 0001 C CNN
F 3 "https://www.adestotech.com/wp-content/uploads/DS-AT25SF081_045.pdf" H 9600 5800 50 0001 C CNN
F 4 "Macronix" H 950 -150 50 0001 C CNN "MFR"
F 5 "MX25R6435FM2IL0" H 950 -150 50 0001 C CNN "MPN"
F 6 "1092-1200-ND" H 950 -150 50 0001 C CNN "DPN"
F 7 "-" H 950 -150 50 0001 C CNN "LCSCPN"
F 8 "-" H 950 -150 50 0001 C CNN "SPR"
F 9 "-" H 950 -150 50 0001 C CNN "SPN"
F 10 "-" H 950 -150 50 0001 C CNN "SIM"
	1    9600 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EA2A2A1
P 9500 4950
F 0 "#PWR0102" H 9500 4700 50 0001 C CNN
F 1 "GND" H 9505 4777 50 0000 C CNN
F 2 "" H 9500 4950 50 0001 C CNN
F 3 "" H 9500 4950 50 0001 C CNN
	1    9500 4950
	1    0    0    -1  
$EndComp
Text Notes 1400 3650 0    50   ~ 0
PCB pad USB-A plug
Text Label 2300 4150 0    50   ~ 0
D+
Text Label 2300 4000 0    50   ~ 0
D-
Text Label 2300 4300 0    50   ~ 0
usbgnd
Text Label 5900 3950 2    50   ~ 0
Vbus
Text Notes 5750 3750 0    50   ~ 0
Socket for Nordic Dongle
Text Label 5150 4200 0    50   ~ 0
D+
Text Label 5150 4000 0    50   ~ 0
D-
Text Label 5900 4150 2    50   ~ 0
D+
Text Label 5900 4050 2    50   ~ 0
D-
Text Label 3150 3650 0    50   ~ 0
5Vusb
Text Notes 1700 1350 0    50   ~ 0
20mm diam. coin cell holder
Text Label 7600 1750 0    50   ~ 0
Vcc
Text Label 4400 1750 0    50   ~ 0
3V
Text Label 4400 1250 0    50   ~ 0
5Vusb
Text Label 9400 1200 0    50   ~ 0
5Vusb
Text Label 10550 2050 0    50   ~ 0
3V
Text Notes 8350 2950 0    50   ~ 0
Coin cell charger circuit
Text Notes 6600 2900 0    50   ~ 0
Power source selection logic
Text Notes 4000 5700 0    50   ~ 0
USB data channel ESD and USB-A connector for Nordic Dongle\n
Text Notes 1150 5750 0    50   ~ 0
PCB USB-A Plug with Vbus ESD and Surge protection
Text Notes 1150 2900 0    50   ~ 0
CR2032/CR2025 Coin Cell holder \nand ESD/Surge protection
Text Label 2850 1550 0    50   ~ 0
3V
Text Label 9400 3350 0    50   ~ 0
3V
Text Notes 8100 3400 0    50   ~ 0
Feather Header place holder\n
Text Notes 8000 5300 0    50   ~ 0
SPI interface flash memory place holder
Wire Wire Line
	2300 3850 2850 3850
Wire Wire Line
	2850 3850 2850 3650
Wire Wire Line
	2850 3650 3150 3650
Wire Wire Line
	3150 4450 2850 4450
Wire Wire Line
	2850 4450 2850 4300
Wire Wire Line
	2850 4300 2300 4300
Wire Wire Line
	2250 2350 1750 2350
Wire Wire Line
	1750 2350 1750 2250
Wire Wire Line
	2250 1550 1850 1550
Wire Wire Line
	1850 1550 1850 1700
Wire Wire Line
	1650 1700 1850 1700
Wire Wire Line
	5900 4250 5650 4250
Wire Wire Line
	5650 4250 5650 4400
Wire Wire Line
	2250 2350 2850 2350
Wire Wire Line
	2850 2350 2850 2500
Wire Wire Line
	6150 2050 6150 2500
Wire Wire Line
	6150 2500 5800 2500
Wire Wire Line
	7000 1750 6850 1750
Wire Wire Line
	6850 2300 6850 1750
Wire Wire Line
	6850 2600 6850 2650
Wire Wire Line
	6850 2650 5800 2650
Wire Wire Line
	5000 2500 5000 2650
Wire Wire Line
	5000 2350 4600 2350
Wire Wire Line
	4600 2350 4600 1750
Wire Wire Line
	4600 1750 5950 1750
Wire Wire Line
	4600 1750 4400 1750
Wire Wire Line
	7000 1750 7600 1750
Wire Wire Line
	5800 2350 5900 2350
Wire Wire Line
	5900 2350 5900 1250
Wire Wire Line
	5900 1250 6000 1250
Wire Wire Line
	6300 1250 6450 1250
Wire Wire Line
	6750 1250 6850 1250
Wire Wire Line
	6850 1250 6850 1750
Wire Wire Line
	6850 1750 6750 1750
Wire Wire Line
	6450 1750 6350 1750
Wire Wire Line
	5900 1250 4400 1250
Wire Wire Line
	5000 2650 4950 2650
Wire Wire Line
	4650 2650 4600 2650
Wire Wire Line
	9400 1500 8750 1500
Wire Wire Line
	10000 2250 10250 2250
Wire Wire Line
	10000 2500 10000 2550
Wire Wire Line
	10000 2550 10100 2550
Wire Wire Line
	10000 2050 10250 2050
Wire Wire Line
	10100 2550 10250 2550
Wire Notes Line
	1050 3000 3550 3000
Wire Notes Line
	3550 3000 3550 900 
Wire Notes Line
	3550 900  1050 900 
Wire Notes Line
	1050 900  1050 3000
Wire Notes Line
	1050 3350 3550 3350
Wire Notes Line
	3550 3350 3550 5800
Wire Notes Line
	3550 5800 1050 5800
Wire Notes Line
	1050 5800 1050 3350
Wire Notes Line
	3900 3350 3900 5800
Wire Notes Line
	3900 5800 7850 5800
Wire Notes Line
	7850 5800 7850 3350
Wire Notes Line
	7850 3350 3900 3350
Wire Notes Line
	3900 3000 7850 3000
Wire Notes Line
	7850 3000 7850 900 
Wire Notes Line
	7850 900  3900 900 
Wire Notes Line
	3900 900  3900 3000
Wire Notes Line
	8250 3000 10800 3000
Wire Wire Line
	9400 1700 9400 1500
Wire Notes Line
	10800 3000 10800 900 
Wire Notes Line
	10800 900  8250 900 
Wire Notes Line
	8250 900  8250 3000
Wire Wire Line
	2250 1550 2850 1550
Connection ~ 1850 1700
Connection ~ 2250 2350
Connection ~ 6850 1750
Connection ~ 4600 2350
Connection ~ 4600 1750
Connection ~ 7000 1750
Connection ~ 5900 1250
Connection ~ 5000 2650
Connection ~ 4600 2650
Connection ~ 10100 2550
Connection ~ 9400 1500
Connection ~ 2250 1550
NoConn ~ 4550 4000
NoConn ~ 4550 4200
NoConn ~ 8800 2350
$EndSCHEMATC
