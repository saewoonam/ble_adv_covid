EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 3600 1250
$Comp
L power:GND #PWR015
U 1 1 5EC0DD61
P 2300 750
AR Path="/5EA608FF/5EC0DD61" Ref="#PWR015"  Part="1" 
AR Path="/5EC0DD61" Ref="#PWR?"  Part="1" 
F 0 "#PWR015" H 2300 500 50  0001 C CNN
F 1 "GND" V 2305 622 50  0000 R CNN
F 2 "" H 2300 750 50  0001 C CNN
F 3 "" H 2300 750 50  0001 C CNN
	1    2300 750 
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EC0DD5B
P 2450 750
AR Path="/5EC0DD5B" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC0DD5B" Ref="C11"  Part="1" 
F 0 "C11" V 2702 750 50  0000 C CNN
F 1 "4.7uF" V 2611 750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2488 600 50  0001 C CNN
F 3 "~" H 2450 750 50  0001 C CNN
	1    2450 750 
	0    1    1    0   
$EndComp
Wire Wire Line
	4050 900  4050 1750
Text Label 4200 1350 1    50   ~ 0
VDD_3V
Wire Wire Line
	4300 1350 4200 1350
$Comp
L power:GND #PWR021
U 1 1 5EC0DD4E
P 4600 1350
AR Path="/5EA608FF/5EC0DD4E" Ref="#PWR021"  Part="1" 
AR Path="/5EC0DD4E" Ref="#PWR?"  Part="1" 
F 0 "#PWR021" H 4600 1100 50  0001 C CNN
F 1 "GND" V 4605 1222 50  0000 R CNN
F 2 "" H 4600 1350 50  0001 C CNN
F 3 "" H 4600 1350 50  0001 C CNN
	1    4600 1350
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EC0DD48
P 4450 1350
AR Path="/5EC0DD48" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC0DD48" Ref="C18"  Part="1" 
F 0 "C18" V 4702 1350 50  0000 C CNN
F 1 "4.7uF" V 4611 1350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4488 1200 50  0001 C CNN
F 3 "~" H 4450 1350 50  0001 C CNN
	1    4450 1350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5EC0DD42
P 4600 900
AR Path="/5EA608FF/5EC0DD42" Ref="#PWR020"  Part="1" 
AR Path="/5EC0DD42" Ref="#PWR?"  Part="1" 
F 0 "#PWR020" H 4600 650 50  0001 C CNN
F 1 "GND" V 4605 772 50  0000 R CNN
F 2 "" H 4600 900 50  0001 C CNN
F 3 "" H 4600 900 50  0001 C CNN
	1    4600 900 
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EC0DD3C
P 4450 900
AR Path="/5EC0DD3C" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC0DD3C" Ref="C17"  Part="1" 
F 0 "C17" V 4702 900 50  0000 C CNN
F 1 "820pF" V 4611 900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4488 750 50  0001 C CNN
F 3 "~" H 4450 900 50  0001 C CNN
	1    4450 900 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 900  4300 900 
Wire Wire Line
	3800 1750 4050 1750
Connection ~ 3900 1500
Wire Wire Line
	3900 1250 3900 1500
$Comp
L Device:C C?
U 1 1 5EC0DD31
P 3750 1250
AR Path="/5EC0DD31" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC0DD31" Ref="C16"  Part="1" 
F 0 "C16" V 3498 1250 50  0000 C CNN
F 1 "0" V 3589 1250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3788 1100 50  0001 C CNN
F 3 "~" H 3750 1250 50  0001 C CNN
	1    3750 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	3700 1500 3900 1500
Wire Wire Line
	3600 1100 3600 1250
$Comp
L power:GND #PWR019
U 1 1 5EC0DD27
P 3050 1100
AR Path="/5EA608FF/5EC0DD27" Ref="#PWR019"  Part="1" 
AR Path="/5EC0DD27" Ref="#PWR?"  Part="1" 
F 0 "#PWR019" H 3050 850 50  0001 C CNN
F 1 "GND" V 3055 972 50  0000 R CNN
F 2 "" H 3050 1100 50  0001 C CNN
F 3 "" H 3050 1100 50  0001 C CNN
	1    3050 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 1500 3500 1500
Wire Wire Line
	3350 1100 3600 1100
$Comp
L Device:C C?
U 1 1 5EC0DD1F
P 3200 1100
AR Path="/5EC0DD1F" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC0DD1F" Ref="C15"  Part="1" 
F 0 "C15" V 2948 1100 50  0000 C CNN
F 1 "100pF" V 3039 1100 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3238 950 50  0001 C CNN
F 3 "~" H 3200 1100 50  0001 C CNN
	1    3200 1100
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EC0DD18
P 3100 1500
AR Path="/5EC0DD18" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC0DD18" Ref="C14"  Part="1" 
F 0 "C14" V 2848 1500 50  0000 C CNN
F 1 "0" V 2939 1500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3138 1350 50  0001 C CNN
F 3 "~" H 3100 1500 50  0001 C CNN
	1    3100 1500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5EC0DD12
P 2950 1500
AR Path="/5EA608FF/5EC0DD12" Ref="#PWR018"  Part="1" 
AR Path="/5EC0DD12" Ref="#PWR?"  Part="1" 
F 0 "#PWR018" H 2950 1250 50  0001 C CNN
F 1 "GND" V 2955 1372 50  0000 R CNN
F 2 "" H 2950 1500 50  0001 C CNN
F 3 "" H 2950 1500 50  0001 C CNN
	1    2950 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 1850 3400 1850
$Comp
L Device:C C?
U 1 1 5EC0DD04
P 3000 1850
AR Path="/5EC0DD04" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC0DD04" Ref="C13"  Part="1" 
F 0 "C13" V 2748 1850 50  0000 C CNN
F 1 "100nF" V 2839 1850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3038 1700 50  0001 C CNN
F 3 "~" H 3000 1850 50  0001 C CNN
	1    3000 1850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5EC0DCFE
P 2850 1850
AR Path="/5EA608FF/5EC0DCFE" Ref="#PWR017"  Part="1" 
AR Path="/5EC0DCFE" Ref="#PWR?"  Part="1" 
F 0 "#PWR017" H 2850 1600 50  0001 C CNN
F 1 "GND" V 2855 1722 50  0000 R CNN
F 2 "" H 2850 1850 50  0001 C CNN
F 3 "" H 2850 1850 50  0001 C CNN
	1    2850 1850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5EC0DCF7
P 4800 1700
AR Path="/5EA608FF/5EC0DCF7" Ref="#PWR022"  Part="1" 
AR Path="/5EC0DCF7" Ref="#PWR?"  Part="1" 
F 0 "#PWR022" H 4800 1450 50  0001 C CNN
F 1 "GND" V 4805 1572 50  0000 R CNN
F 2 "" H 4800 1700 50  0001 C CNN
F 3 "" H 4800 1700 50  0001 C CNN
	1    4800 1700
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EC0DCF1
P 4650 1700
AR Path="/5EC0DCF1" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC0DCF1" Ref="C19"  Part="1" 
F 0 "C19" V 4902 1700 50  0000 C CNN
F 1 "1uF" V 4811 1700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4688 1550 50  0001 C CNN
F 3 "~" H 4650 1700 50  0001 C CNN
	1    4650 1700
	0    -1   -1   0   
$EndComp
Connection ~ 1400 3000
Wire Wire Line
	1400 3000 1150 3000
Wire Wire Line
	1500 3000 1400 3000
Connection ~ 2200 3000
Wire Wire Line
	1800 3000 2200 3000
Wire Wire Line
	2300 3000 2200 3000
Connection ~ 1800 3000
$Comp
L Device:C C?
U 1 1 5EC0DCE4
P 2200 3150
AR Path="/5EC0DCE4" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC0DCE4" Ref="C10"  Part="1" 
F 0 "C10" H 2315 3196 50  0000 L CNN
F 1 "1pF" H 2315 3105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2238 3000 50  0001 C CNN
F 3 "~" H 2200 3150 50  0001 C CNN
	1    2200 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC0DCDE
P 1800 3150
AR Path="/5EC0DCDE" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC0DCDE" Ref="C7"  Part="1" 
F 0 "C7" H 1915 3196 50  0000 L CNN
F 1 "0" H 1915 3105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1838 3000 50  0001 C CNN
F 3 "~" H 1800 3150 50  0001 C CNN
	1    1800 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:Antenna AE?
U 1 1 5EC0DCD8
P 950 3000
AR Path="/5EC0DCD8" Ref="AE?"  Part="1" 
AR Path="/5EA608FF/5EC0DCD8" Ref="AE1"  Part="1" 
F 0 "AE1" V 1167 2943 50  0000 C CNN
F 1 "Antenna" V 1076 2943 50  0000 C CNN
F 2 "" H 950 3000 50  0001 C CNN
F 3 "~" H 950 3000 50  0001 C CNN
	1    950  3000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EC0DCD2
P 1650 3000
AR Path="/5EC0DCD2" Ref="R?"  Part="1" 
AR Path="/5EA608FF/5EC0DCD2" Ref="R10"  Part="1" 
F 0 "R10" V 1443 3000 50  0000 C CNN
F 1 "0" V 1534 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1580 3000 50  0001 C CNN
F 3 "~" H 1650 3000 50  0001 C CNN
	1    1650 3000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5EC0DCCC
P 1400 3300
AR Path="/5EA608FF/5EC0DCCC" Ref="#PWR010"  Part="1" 
AR Path="/5EC0DCCC" Ref="#PWR?"  Part="1" 
F 0 "#PWR010" H 1400 3050 50  0001 C CNN
F 1 "GND" V 1405 3172 50  0000 R CNN
F 2 "" H 1400 3300 50  0001 C CNN
F 3 "" H 1400 3300 50  0001 C CNN
	1    1400 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC0DCC6
P 1400 3150
AR Path="/5EC0DCC6" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC0DCC6" Ref="C6"  Part="1" 
F 0 "C6" H 1515 3196 50  0000 L CNN
F 1 "1pF" H 1515 3105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1438 3000 50  0001 C CNN
F 3 "~" H 1400 3150 50  0001 C CNN
	1    1400 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5EC0DCC0
P 1800 3300
AR Path="/5EA608FF/5EC0DCC0" Ref="#PWR012"  Part="1" 
AR Path="/5EC0DCC0" Ref="#PWR?"  Part="1" 
F 0 "#PWR012" H 1800 3050 50  0001 C CNN
F 1 "GND" V 1805 3172 50  0000 R CNN
F 2 "" H 1800 3300 50  0001 C CNN
F 3 "" H 1800 3300 50  0001 C CNN
	1    1800 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5EC0DCBA
P 2200 3300
AR Path="/5EA608FF/5EC0DCBA" Ref="#PWR014"  Part="1" 
AR Path="/5EC0DCBA" Ref="#PWR?"  Part="1" 
F 0 "#PWR014" H 2200 3050 50  0001 C CNN
F 1 "GND" V 2205 3172 50  0000 R CNN
F 2 "" H 2200 3300 50  0001 C CNN
F 3 "" H 2200 3300 50  0001 C CNN
	1    2200 3300
	1    0    0    -1  
$EndComp
Connection ~ 2600 3000
$Comp
L Device:C C?
U 1 1 5EC0DCB3
P 2600 3150
AR Path="/5EC0DCB3" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC0DCB3" Ref="C12"  Part="1" 
F 0 "C12" H 2715 3196 50  0000 L CNN
F 1 "1.5pF" H 2715 3105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2638 3000 50  0001 C CNN
F 3 "~" H 2600 3150 50  0001 C CNN
	1    2600 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5EC0DCAD
P 2450 3000
AR Path="/5EC0DCAD" Ref="L?"  Part="1" 
AR Path="/5EA608FF/5EC0DCAD" Ref="L1"  Part="1" 
F 0 "L1" V 2640 3000 50  0000 C CNN
F 1 "L" V 2549 3000 50  0000 C CNN
F 2 "Inductor_SMD:L_0402_1005Metric" H 2450 3000 50  0001 C CNN
F 3 "~" H 2450 3000 50  0001 C CNN
	1    2450 3000
	0    -1   -1   0   
$EndComp
Text Label 5500 7200 0    50   ~ 0
D-
Text Label 5500 7300 0    50   ~ 0
D+
NoConn ~ 2900 6600
NoConn ~ 2900 6700
Text Label 5500 4400 0    50   ~ 0
WP
Text Label 5500 4600 0    50   ~ 0
SDA
Text Label 5500 3800 0    50   ~ 0
SCL
Text Label 5500 4100 0    50   ~ 0
SCLK
Text Label 5500 4200 0    50   ~ 0
SI
Text Label 5500 4000 0    50   ~ 0
CS
Text Label 5500 4300 0    50   ~ 0
SO
$Comp
L power:GND #PWR016
U 1 1 5EC0DC98
P 2600 3300
AR Path="/5EA608FF/5EC0DC98" Ref="#PWR016"  Part="1" 
AR Path="/5EC0DC98" Ref="#PWR?"  Part="1" 
F 0 "#PWR016" H 2600 3050 50  0001 C CNN
F 1 "GND" V 2605 3172 50  0000 R CNN
F 2 "" H 2600 3300 50  0001 C CNN
F 3 "" H 2600 3300 50  0001 C CNN
	1    2600 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 3000 2600 3000
Text Notes 700  7200 0    50   ~ 0
Confirm no pull-up/down\nresistors for SPI protocol
Text Notes 700  7400 0    50   ~ 0
P1.15 is a low frequency GPIO (<10kHz)
Text Notes 700  7600 0    50   ~ 0
GPIO not marked for any other function \nor low frequency include P0.13, 15, 17, 20, 22, 24, P1.00
Wire Wire Line
	4000 750  2600 750 
NoConn ~ 4300 2000
NoConn ~ 4400 2000
$Comp
L Device:C C?
U 1 1 5EC366A0
P 1950 5000
AR Path="/5EC366A0" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC366A0" Ref="C9"  Part="1" 
F 0 "C9" V 2202 5000 50  0000 C CNN
F 1 "12pF" V 2111 5000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1988 4850 50  0001 C CNN
F 3 "~" H 1950 5000 50  0001 C CNN
	1    1950 5000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5EC366A6
P 1800 5150
AR Path="/5EA608FF/5EC366A6" Ref="#PWR013"  Part="1" 
AR Path="/5EC366A6" Ref="#PWR?"  Part="1" 
F 0 "#PWR013" H 1800 4900 50  0001 C CNN
F 1 "GND" V 1805 5022 50  0000 R CNN
F 2 "" H 1800 5150 50  0001 C CNN
F 3 "" H 1800 5150 50  0001 C CNN
	1    1800 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC36FE9
P 1950 4600
AR Path="/5EC36FE9" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC36FE9" Ref="C8"  Part="1" 
F 0 "C8" V 2202 4600 50  0000 C CNN
F 1 "12pF" V 2111 4600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1988 4450 50  0001 C CNN
F 3 "~" H 1950 4600 50  0001 C CNN
	1    1950 4600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1800 5150 1800 5000
Wire Wire Line
	1800 4600 1800 5000
Connection ~ 1800 5000
NoConn ~ 5500 3200
NoConn ~ 5500 3300
NoConn ~ 5500 3000
NoConn ~ 5500 3400
NoConn ~ 5500 3700
NoConn ~ 5500 3900
NoConn ~ 5500 4800
NoConn ~ 5500 4900
NoConn ~ 5500 5000
NoConn ~ 5500 5100
NoConn ~ 5500 5200
NoConn ~ 5500 5300
Wire Wire Line
	2900 6500 2500 6500
Text Label 2500 6500 0    50   ~ 0
RESET
Text Label 5500 4500 0    50   ~ 0
SIO3
Text Label 2800 3350 0    50   ~ 0
VSS_PA
Wire Wire Line
	2800 3350 2700 3350
Wire Wire Line
	2700 3350 2700 3300
Wire Wire Line
	2700 3300 2600 3300
Connection ~ 2600 3300
Wire Wire Line
	4600 2000 4600 1950
Wire Wire Line
	5200 1950 5200 1900
Text Label 4000 7600 2    50   ~ 0
VSS
Wire Wire Line
	4200 7600 4000 7600
Text Label 4500 7600 0    50   ~ 0
VSS_PA
Wire Wire Line
	5200 1600 5200 1500
$Comp
L Device:L L2
U 1 1 5EC4EE6E
P 5200 1350
F 0 "L2" H 5253 1396 50  0000 L CNN
F 1 "10uH" H 5253 1305 50  0000 L CNN
F 2 "Inductor_SMD:L_0603_1608Metric" H 5200 1350 50  0001 C CNN
F 3 "~" H 5200 1350 50  0001 C CNN
	1    5200 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:L L3
U 1 1 5EC4E3E1
P 5200 1750
F 0 "L3" H 5253 1796 50  0000 L CNN
F 1 "15nH" H 5253 1705 50  0000 L CNN
F 2 "Inductor_SMD:L_0402_1005Metric" H 5200 1750 50  0001 C CNN
F 3 "~" H 5200 1750 50  0001 C CNN
	1    5200 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 7600 4300 7600
Wire Wire Line
	4000 2000 4000 750 
Wire Wire Line
	3900 1500 3900 2000
Wire Wire Line
	3800 2000 3800 1750
Wire Wire Line
	3700 2000 3700 1500
Wire Wire Line
	3600 1250 3600 2000
Wire Wire Line
	3500 1500 3500 2000
Wire Wire Line
	3400 2000 3400 1850
Wire Wire Line
	4600 1950 5200 1950
$Comp
L Device:C C?
U 1 1 5EC48F16
P 5650 1950
AR Path="/5EC48F16" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC48F16" Ref="C20"  Part="1" 
F 0 "C20" V 5902 1950 50  0000 C CNN
F 1 "1uF" V 5811 1950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5688 1800 50  0001 C CNN
F 3 "~" H 5650 1950 50  0001 C CNN
	1    5650 1950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR023
U 1 1 5EC49FD5
P 5950 1950
AR Path="/5EA608FF/5EC49FD5" Ref="#PWR023"  Part="1" 
AR Path="/5EC49FD5" Ref="#PWR?"  Part="1" 
F 0 "#PWR023" H 5950 1700 50  0001 C CNN
F 1 "GND" V 5955 1822 50  0000 R CNN
F 2 "" H 5950 1950 50  0001 C CNN
F 3 "" H 5950 1950 50  0001 C CNN
	1    5950 1950
	0    -1   -1   0   
$EndComp
Text Label 5900 2100 0    50   ~ 0
VSS
Wire Wire Line
	5800 1950 5900 1950
Wire Wire Line
	5900 1950 5900 2100
Wire Wire Line
	5950 1950 5900 1950
Connection ~ 5900 1950
Connection ~ 5200 1950
Wire Wire Line
	5200 1050 4100 1050
Wire Wire Line
	4100 1500 3900 1500
Wire Wire Line
	5200 1950 5500 1950
$Comp
L Device:C C?
U 1 1 5EC5C964
P 7200 2300
AR Path="/5EC5C964" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC5C964" Ref="C21"  Part="1" 
F 0 "C21" V 7452 2300 50  0000 C CNN
F 1 "12pF" V 7361 2300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7238 2150 50  0001 C CNN
F 3 "~" H 7200 2300 50  0001 C CNN
	1    7200 2300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5EC5C96A
P 7350 2850
AR Path="/5EA608FF/5EC5C96A" Ref="#PWR024"  Part="1" 
AR Path="/5EC5C96A" Ref="#PWR?"  Part="1" 
F 0 "#PWR024" H 7350 2600 50  0001 C CNN
F 1 "GND" V 7355 2722 50  0000 R CNN
F 2 "" H 7350 2850 50  0001 C CNN
F 3 "" H 7350 2850 50  0001 C CNN
	1    7350 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC5C970
P 7200 2700
AR Path="/5EC5C970" Ref="C?"  Part="1" 
AR Path="/5EA608FF/5EC5C970" Ref="C22"  Part="1" 
F 0 "C22" V 7452 2700 50  0000 C CNN
F 1 "12pF" V 7361 2700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7238 2550 50  0001 C CNN
F 3 "~" H 7200 2700 50  0001 C CNN
	1    7200 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 2850 7350 2700
Wire Wire Line
	7350 2700 7350 2300
Connection ~ 7350 2700
Wire Wire Line
	5500 2400 6300 2400
Wire Wire Line
	6300 2400 6300 2700
Wire Wire Line
	5200 1050 5200 1200
Wire Wire Line
	4100 1050 4100 1500
$Comp
L Device:L L4
U 1 1 5EC65BAC
P 4350 1950
F 0 "L4" V 4540 1950 50  0000 C CNN
F 1 "10uH" V 4449 1950 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" H 4350 1950 50  0001 C CNN
F 3 "~" H 4350 1950 50  0001 C CNN
	1    4350 1950
	0    -1   -1   0   
$EndComp
Connection ~ 4200 1950
Wire Wire Line
	4200 1950 4200 2000
Wire Wire Line
	4700 2000 4700 1900
Wire Wire Line
	4700 1900 4550 1900
Wire Wire Line
	4550 1900 4550 1950
Wire Wire Line
	4550 1950 4500 1950
Wire Wire Line
	4200 1350 4200 1700
Wire Wire Line
	4500 1700 4200 1700
Connection ~ 4200 1700
Wire Wire Line
	4200 1700 4200 1950
NoConn ~ 5500 2500
NoConn ~ 5500 2600
NoConn ~ 5500 2700
NoConn ~ 5500 2800
NoConn ~ 5500 5600
NoConn ~ 5500 5700
NoConn ~ 5500 5800
NoConn ~ 5500 5900
NoConn ~ 5500 6000
NoConn ~ 5500 6200
NoConn ~ 5500 6300
NoConn ~ 5500 6500
NoConn ~ 5500 6600
NoConn ~ 5500 6700
NoConn ~ 5500 6800
NoConn ~ 5500 6900
$Comp
L Device:Crystal_GND24 Y1
U 1 1 5EC864DB
P 2550 4800
F 0 "Y1" V 2596 4556 50  0000 R CNN
F 1 "32MHz" V 2505 4556 50  0000 R CNN
F 2 "Crystal:Crystal_SMD_2016-4Pin_2.0x1.6mm" H 2550 4800 50  0001 C CNN
F 3 "https://media.digikey.com/PDF/Data%20Sheets/NDK%20PDFs/NX2016AB-32MHZ%20ST2.pdf" H 2550 4800 50  0001 C CNN
F 4 "NDK America, Inc." H 2550 4800 50  0001 C CNN "MFR"
F 5 "NX2016AB-32MHZ ST2" H 2550 4800 50  0001 C CNN "MPN"
F 6 "644-1119-1-ND" H 2550 4800 50  0001 C CNN "DPN"
	1    2550 4800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2550 4650 2550 4600
Wire Wire Line
	2550 4950 2550 5000
$Comp
L power:GND #PWR0102
U 1 1 5EC8B834
P 2750 4800
AR Path="/5EA608FF/5EC8B834" Ref="#PWR0102"  Part="1" 
AR Path="/5EC8B834" Ref="#PWR?"  Part="1" 
F 0 "#PWR0102" H 2750 4550 50  0001 C CNN
F 1 "GND" V 2755 4672 50  0000 R CNN
F 2 "" H 2750 4800 50  0001 C CNN
F 3 "" H 2750 4800 50  0001 C CNN
	1    2750 4800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5EC8CD02
P 2350 4800
AR Path="/5EA608FF/5EC8CD02" Ref="#PWR0103"  Part="1" 
AR Path="/5EC8CD02" Ref="#PWR?"  Part="1" 
F 0 "#PWR0103" H 2350 4550 50  0001 C CNN
F 1 "GND" V 2355 4672 50  0000 R CNN
F 2 "" H 2350 4800 50  0001 C CNN
F 3 "" H 2350 4800 50  0001 C CNN
	1    2350 4800
	0    1    1    0   
$EndComp
Connection ~ 2550 4600
Wire Wire Line
	2550 4600 2900 4600
Connection ~ 2550 5000
Wire Wire Line
	2550 5000 2900 5000
Wire Wire Line
	2100 4600 2550 4600
Wire Wire Line
	2100 5000 2550 5000
Text Notes 6100 4450 0    50   ~ 0
P1.15 is a low frequency GPIO (<10kHz)
Text Notes 6100 4850 0    50   ~ 0
Confirmed no pull-up/down\nresistors for SPI protocol\nAdd 100nF cap between \nGND and VCC
Text Notes 6100 5000 0    50   ~ 0
GPIO not marked for any other function or low frequency include P0.13, 15, 17, 20, 22, 24, P1.00
Text Notes 6100 4300 0    50   ~ 0
CS - P0.17\nCLK - P0.19\nSI - P0.20\nSO - P0.21\nWP - P0.22\nSIO3/HOLD/RESET(pin7) - P0.23\nPinouts from development board schematic\n
NoConn ~ 5500 3600
NoConn ~ 5500 4700
NoConn ~ 5500 5500
$Comp
L MCU_Nordic:nRF52840 U6
U 1 1 5EC0DD0A
P 4200 4800
AR Path="/5EA608FF/5EC0DD0A" Ref="U6"  Part="1" 
AR Path="/5EC0DD0A" Ref="U?"  Part="1" 
F 0 "U6" H 4150 4650 50  0000 C CNN
F 1 "nRF52840" H 4150 4550 50  0000 C CNN
F 2 "Package_DFN_QFN:Nordic_AQFN-73-1EP_7x7mm_P0.5mm" H 4200 1900 50  0001 C CNN
F 3 "http://infocenter.nordicsemi.com/topic/com.nordic.infocenter.nrf52/dita/nrf52/chips/nrf52840.html" H 3550 6700 50  0001 C CNN
	1    4200 4800
	1    0    0    -1  
$EndComp
Text Label 5500 3500 0    50   ~ 0
LED2_B
Text Label 5500 6400 0    50   ~ 0
LED2_G
Text Label 5500 3100 0    50   ~ 0
LED2_R
Text Label 5500 2900 0    50   ~ 0
LED1
NoConn ~ 5500 7000
Wire Wire Line
	5500 6100 6000 6100
Text Label 6000 6100 0    50   ~ 0
SW1
Text Notes 6600 6150 0    50   ~ 0
P1.06 are active low, they don't have an internal pullup resistor. \nThe switch must be configured to have a 10k pull-up resstor. \nWhen the button is active the pin is connected to ground. \nDetails from Dongle User Guide pg 13
$Comp
L Device:R R2
U 1 1 5EAA0A31
P 9500 850
F 0 "R2" V 9293 850 50  0000 C CNN
F 1 "220" V 9384 850 50  0000 C CNN
F 2 "" V 9430 850 50  0001 C CNN
F 3 "~" H 9500 850 50  0001 C CNN
	1    9500 850 
	0    1    1    0   
$EndComp
$Comp
L Device:LED D1
U 1 1 5EAAF1B1
P 10100 850
F 0 "D1" H 10093 1066 50  0000 C CNN
F 1 "LED" H 10093 975 50  0000 C CNN
F 2 "" H 10100 850 50  0001 C CNN
F 3 "~" H 10100 850 50  0001 C CNN
	1    10100 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 850  9650 850 
Wire Wire Line
	10250 850  10400 850 
Text Label 10400 1150 0    50   ~ 0
VDD_3V
Wire Wire Line
	10400 1450 10300 1450
Wire Wire Line
	10400 850  10400 1450
Wire Wire Line
	9800 1750 9650 1750
Wire Wire Line
	9800 1650 9800 1750
Wire Wire Line
	9900 1650 9800 1650
Wire Wire Line
	9650 1450 9900 1450
Wire Wire Line
	9800 1150 9650 1150
Wire Wire Line
	9800 1250 9800 1150
Wire Wire Line
	9900 1250 9800 1250
$Comp
L Device:LED_ABRG D2
U 1 1 5EAAE258
P 10100 1450
F 0 "D2" H 10100 1947 50  0000 C CNN
F 1 "LED_ABRG" H 10100 1856 50  0000 C CNN
F 2 "" H 10100 1450 50  0001 C CNN
F 3 "~" H 10100 1450 50  0001 C CNN
	1    10100 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 1750 9350 1750
Wire Wire Line
	8950 1450 9350 1450
Wire Wire Line
	8950 1150 9350 1150
$Comp
L Device:R R12
U 1 1 5EAA3DB3
P 9500 1750
F 0 "R12" V 9293 1750 50  0000 C CNN
F 1 "390" V 9384 1750 50  0000 C CNN
F 2 "" V 9430 1750 50  0001 C CNN
F 3 "~" H 9500 1750 50  0001 C CNN
	1    9500 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 5EAA2AE0
P 9500 1450
F 0 "R11" V 9293 1450 50  0000 C CNN
F 1 "2k2" V 9384 1450 50  0000 C CNN
F 2 "" V 9430 1450 50  0001 C CNN
F 3 "~" H 9500 1450 50  0001 C CNN
	1    9500 1450
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5EAA19A0
P 9500 1150
F 0 "R3" V 9293 1150 50  0000 C CNN
F 1 "1k2" V 9384 1150 50  0000 C CNN
F 2 "" V 9430 1150 50  0001 C CNN
F 3 "~" H 9500 1150 50  0001 C CNN
	1    9500 1150
	0    1    1    0   
$EndComp
Text Notes 8950 2050 0    50   ~ 0
LEDs are active low, which means that writing a logical \nzero '0' to the output pin will illuminate the LED.\nLED footprint and component TBD. Resistor footprint?
Text Label 8950 1750 0    50   ~ 0
LED2_G
Text Label 8950 1150 0    50   ~ 0
LED2_R
Text Label 8950 1450 0    50   ~ 0
LED2_B
Wire Wire Line
	8950 850  9350 850 
Text Label 8950 850  0    50   ~ 0
LED1
Wire Wire Line
	5500 2300 7050 2300
Wire Wire Line
	6300 2700 7050 2700
Text Notes 6450 2550 0    50   ~ 0
Low Freq XTAL
$EndSCHEMATC
