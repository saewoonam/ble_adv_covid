#ifndef CONFIG_H
#define CONFIG_H

// UUID
#define CONTACT_UUID      0xFD6F

#define SCAN_TIMEOUT_10MS 800

#define RE_CHECK_MS 100

#define MAC_ADDR_ROTATE_TIME_S 30

typedef struct
{
  uint8_t    *p_data;  /**< Pointer to the data buffer provided to/from the application. */
  size_t     len;     /**< Length of the data buffer, in bytes. */
} ble_data_t_sdk;

typedef struct
{
  ble_data_t_sdk       adv_data;                     /**< Advertising data.
                                                      @note
                                                      Advertising data can only be specified for a @ref ble_gap_adv_properties_t::type
                                                      that is allowed to contain advertising data. */
  ble_data_t_sdk       scan_rsp_data;                /**< Scan response data.
                                                      @note
                                                      Scan response data can only be specified for a @ref ble_gap_adv_properties_t::type
                                                      that is scannable. */
} ble_gap_adv_data_t_sdk;


#endif //CONFIG_H