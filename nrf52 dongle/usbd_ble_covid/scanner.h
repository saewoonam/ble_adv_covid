/*
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include "nordic_common.h"
*/
#include "app_error.h"
/*
#include "app_timer.h"
#include "app_util.h"
#include "bsp_btn_ble.h"
#include "ble.h"
#include "ble_gap.h"
#include "ble_hci.h"
*/
#include "nrf_sdh.h"
#include "nrf_sdh_ble.h"
#include "nrf_sdh_soc.h"
#include "nrf_pwr_mgmt.h"

#include "nrf_ble_scan.h"
/*
#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"
*/

#define APP_BLE_CONN_CFG_TAG    1

static void scan_init(void);
static void scan_start(void);