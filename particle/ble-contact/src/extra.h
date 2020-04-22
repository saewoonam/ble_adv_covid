#ifndef CONFIG_H
#define CONFIG_H

// UUID
#define CONTACT_UUID      0xFD6F

#define SCAN_TIMEOUT_10MS 800

#define RE_CHECK_MS 100

#define MAC_ADDR_ROTATE_TIME_S 30

/**@brief User Memory Block. */
typedef struct
{
  uint8_t          *p_mem;      /**< Pointer to the start of the user memory block. */
  uint16_t          len;        /**< Length in bytes of the user memory block. */
} ble_user_mem_block_t;

/**@brief Event structure for @ref BLE_EVT_USER_MEM_REQUEST. */
typedef struct
{
  uint8_t                     type;     /**< User memory type, see @ref BLE_USER_MEM_TYPES. */
} ble_evt_user_mem_request_t;

/**@brief Event structure for @ref BLE_EVT_USER_MEM_RELEASE. */
typedef struct
{
  uint8_t                     type;       /**< User memory type, see @ref BLE_USER_MEM_TYPES. */
  ble_user_mem_block_t        mem_block;  /**< User memory block */
} ble_evt_user_mem_release_t;

/**@brief Event structure for events not associated with a specific function module. */
typedef struct
{
  uint16_t conn_handle;                                 /**< Connection Handle on which this event occurred. */
  union
  {
    ble_evt_user_mem_request_t      user_mem_request;    /**< User Memory Request Event Parameters. */
    ble_evt_user_mem_release_t      user_mem_release;    /**< User Memory Release Event Parameters. */
  } params;                                              /**< Event parameter union. */
} ble_common_evt_t;

/**@brief BLE Event header. */
typedef struct
{
  uint16_t evt_id;                /**< Value from a BLE_<module>_EVT series. */
  uint16_t evt_len;               /**< Length in octets including this header. */
} ble_evt_hdr_t;


/**
 * @brief BLE GATTC connection configuration parameters, set with @ref sd_ble_cfg_set.
 */
typedef struct
{
  uint8_t  write_cmd_tx_queue_size; /**< The guaranteed minimum number of Write without Response that can be queued for transmission.
                                          The default value is @ref BLE_GATTC_WRITE_CMD_TX_QUEUE_SIZE_DEFAULT */
} ble_gattc_conn_cfg_t;

/**@brief Operation Handle Range. */
typedef struct
{
  uint16_t          start_handle; /**< Start Handle. */
  uint16_t          end_handle;   /**< End Handle. */
} ble_gattc_handle_range_t;


/**@brief GATT service. */
typedef struct
{
  ble_uuid_t               uuid;          /**< Service UUID. */
  ble_gattc_handle_range_t handle_range;  /**< Service Handle Range. */
} ble_gattc_service_t;


/**@brief  GATT include. */
typedef struct
{
  uint16_t            handle;           /**< Include Handle. */
  ble_gattc_service_t included_srvc;    /**< Handle of the included service. */
} ble_gattc_include_t;


/**@brief GATT characteristic. */
typedef struct
{
  ble_uuid_t              uuid;                 /**< Characteristic UUID. */
  ble_gatt_char_props_t   char_props;           /**< Characteristic Properties. */
  uint8_t                 char_ext_props : 1;   /**< Extended properties present. */
  uint16_t                handle_decl;          /**< Handle of the Characteristic Declaration. */
  uint16_t                handle_value;         /**< Handle of the Characteristic Value. */
} ble_gattc_char_t;


/**@brief GATT descriptor. */
typedef struct
{
  uint16_t          handle;         /**< Descriptor Handle. */
  ble_uuid_t        uuid;           /**< Descriptor UUID. */
} ble_gattc_desc_t;


/**@brief Write Parameters. */
typedef struct
{
  uint8_t        write_op;             /**< Write Operation to be performed, see @ref BLE_GATT_WRITE_OPS. */
  uint8_t        flags;                /**< Flags, see @ref BLE_GATT_EXEC_WRITE_FLAGS. */
  uint16_t       handle;               /**< Handle to the attribute to be written. */
  uint16_t       offset;               /**< Offset in bytes. @note For WRITE_CMD and WRITE_REQ, offset must be 0. */
  uint16_t       len;                  /**< Length of data in bytes. */
  uint8_t const *p_value;              /**< Pointer to the value data. */
} ble_gattc_write_params_t;

/**@brief Attribute Information for 16-bit Attribute UUID. */
typedef struct
{
  uint16_t       handle;               /**< Attribute handle. */
  ble_uuid_t     uuid;                 /**< 16-bit Attribute UUID. */
} ble_gattc_attr_info16_t;

/**@brief Attribute Information for 128-bit Attribute UUID. */
typedef struct
{
  uint16_t       handle;               /**< Attribute handle. */
  ble_uuid128_t  uuid;                 /**< 128-bit Attribute UUID. */
} ble_gattc_attr_info128_t;

/**@brief Event structure for @ref BLE_GATTC_EVT_PRIM_SRVC_DISC_RSP. */
typedef struct
{
  uint16_t             count;           /**< Service count. */
  ble_gattc_service_t services[1];      /**< Service data. @note This is a variable length array. The size of 1 indicated is only a placeholder for compilation.
                                             See @ref sd_ble_evt_get for more information on how to use event structures with variable length array members. */
} ble_gattc_evt_prim_srvc_disc_rsp_t;

/**@brief Event structure for @ref BLE_GATTC_EVT_REL_DISC_RSP. */
typedef struct
{
  uint16_t             count;           /**< Include count. */
  ble_gattc_include_t includes[1];      /**< Include data. @note This is a variable length array. The size of 1 indicated is only a placeholder for compilation.
                                             See @ref sd_ble_evt_get for more information on how to use event structures with variable length array members. */
} ble_gattc_evt_rel_disc_rsp_t;

/**@brief Event structure for @ref BLE_GATTC_EVT_CHAR_DISC_RSP. */
typedef struct
{
  uint16_t            count;          /**< Characteristic count. */
  ble_gattc_char_t    chars[1];       /**< Characteristic data. @note This is a variable length array. The size of 1 indicated is only a placeholder for compilation.
                                           See @ref sd_ble_evt_get for more information on how to use event structures with variable length array members. */
} ble_gattc_evt_char_disc_rsp_t;

/**@brief Event structure for @ref BLE_GATTC_EVT_DESC_DISC_RSP. */
typedef struct
{
  uint16_t            count;          /**< Descriptor count. */
  ble_gattc_desc_t    descs[1];       /**< Descriptor data. @note This is a variable length array. The size of 1 indicated is only a placeholder for compilation.
                                           See @ref sd_ble_evt_get for more information on how to use event structures with variable length array members. */
} ble_gattc_evt_desc_disc_rsp_t;

/**@brief Event structure for @ref BLE_GATTC_EVT_ATTR_INFO_DISC_RSP. */
typedef struct
{
  uint16_t                     count;            /**< Attribute count. */
  uint8_t                      format;           /**< Attribute information format, see @ref BLE_GATTC_ATTR_INFO_FORMAT. */
  union {
    ble_gattc_attr_info16_t  attr_info16[1];     /**< Attribute information for 16-bit Attribute UUID.
                                                      @note This is a variable length array. The size of 1 indicated is only a placeholder for compilation.
                                                      See @ref sd_ble_evt_get for more information on how to use event structures with variable length array members. */
    ble_gattc_attr_info128_t attr_info128[1];    /**< Attribute information for 128-bit Attribute UUID.
                                                      @note This is a variable length array. The size of 1 indicated is only a placeholder for compilation.
                                                      See @ref sd_ble_evt_get for more information on how to use event structures with variable length array members. */
  } info;                                        /**< Attribute information union. */
} ble_gattc_evt_attr_info_disc_rsp_t;

/**@brief GATT read by UUID handle value pair. */
typedef struct
{
  uint16_t            handle;          /**< Attribute Handle. */
  uint8_t            *p_value;         /**< Pointer to the Attribute Value, length is available in @ref ble_gattc_evt_char_val_by_uuid_read_rsp_t::value_len. */
} ble_gattc_handle_value_t;

/**@brief Event structure for @ref BLE_GATTC_EVT_CHAR_VAL_BY_UUID_READ_RSP. */
typedef struct
{
  uint16_t                  count;            /**< Handle-Value Pair Count. */
  uint16_t                  value_len;        /**< Length of the value in Handle-Value(s) list. */
  uint8_t                   handle_value[1];  /**< Handle-Value(s) list. To iterate through the list use @ref sd_ble_gattc_evt_char_val_by_uuid_read_rsp_iter.
                                                   @note This is a variable length array. The size of 1 indicated is only a placeholder for compilation.
                                                   See @ref sd_ble_evt_get for more information on how to use event structures with variable length array members. */
} ble_gattc_evt_char_val_by_uuid_read_rsp_t;

/**@brief Event structure for @ref BLE_GATTC_EVT_READ_RSP. */
typedef struct
{
  uint16_t            handle;         /**< Attribute Handle. */
  uint16_t            offset;         /**< Offset of the attribute data. */
  uint16_t            len;            /**< Attribute data length. */
  uint8_t             data[1];        /**< Attribute data. @note This is a variable length array. The size of 1 indicated is only a placeholder for compilation.
                                           See @ref sd_ble_evt_get for more information on how to use event structures with variable length array members. */
} ble_gattc_evt_read_rsp_t;

/**@brief Event structure for @ref BLE_GATTC_EVT_CHAR_VALS_READ_RSP. */
typedef struct
{
  uint16_t            len;            /**< Concatenated Attribute values length. */
  uint8_t             values[1];      /**< Attribute values. @note This is a variable length array. The size of 1 indicated is only a placeholder for compilation.
                                           See @ref sd_ble_evt_get for more information on how to use event structures with variable length array members. */
} ble_gattc_evt_char_vals_read_rsp_t;

/**@brief Event structure for @ref BLE_GATTC_EVT_WRITE_RSP. */
typedef struct
{
  uint16_t            handle;           /**< Attribute Handle. */
  uint8_t             write_op;         /**< Type of write operation, see @ref BLE_GATT_WRITE_OPS. */
  uint16_t            offset;           /**< Data offset. */
  uint16_t            len;              /**< Data length. */
  uint8_t             data[1];          /**< Data. @note This is a variable length array. The size of 1 indicated is only a placeholder for compilation.
                                             See @ref sd_ble_evt_get for more information on how to use event structures with variable length array members. */
} ble_gattc_evt_write_rsp_t;

/**@brief Event structure for @ref BLE_GATTC_EVT_HVX. */
typedef struct
{
  uint16_t            handle;         /**< Handle to which the HVx operation applies. */
  uint8_t             type;           /**< Indication or Notification, see @ref BLE_GATT_HVX_TYPES. */
  uint16_t            len;            /**< Attribute data length. */
  uint8_t             data[1];        /**< Attribute data. @note This is a variable length array. The size of 1 indicated is only a placeholder for compilation.
                                           See @ref sd_ble_evt_get for more information on how to use event structures with variable length array members. */
} ble_gattc_evt_hvx_t;

/**@brief Event structure for @ref BLE_GATTC_EVT_EXCHANGE_MTU_RSP. */
typedef struct
{
  uint16_t          server_rx_mtu;            /**< Server RX MTU size. */
} ble_gattc_evt_exchange_mtu_rsp_t;

/**@brief Event structure for @ref BLE_GATTC_EVT_TIMEOUT. */
typedef struct
{
  uint8_t          src;                       /**< Timeout source, see @ref BLE_GATT_TIMEOUT_SOURCES. */
} ble_gattc_evt_timeout_t;

/**@brief Event structure for @ref BLE_GATTC_EVT_WRITE_CMD_TX_COMPLETE. */
typedef struct
{
  uint8_t             count;            /**< Number of write without response transmissions completed. */
} ble_gattc_evt_write_cmd_tx_complete_t;

/**@brief GATTC event structure. */
typedef struct
{
  uint16_t            conn_handle;                /**< Connection Handle on which event occurred. */
  uint16_t            gatt_status;                /**< GATT status code for the operation, see @ref BLE_GATT_STATUS_CODES. */
  uint16_t            error_handle;               /**< In case of error: The handle causing the error. In all other cases @ref BLE_GATT_HANDLE_INVALID. */
  union
  {
    ble_gattc_evt_prim_srvc_disc_rsp_t          prim_srvc_disc_rsp;         /**< Primary Service Discovery Response Event Parameters. */
    ble_gattc_evt_rel_disc_rsp_t                rel_disc_rsp;               /**< Relationship Discovery Response Event Parameters. */
    ble_gattc_evt_char_disc_rsp_t               char_disc_rsp;              /**< Characteristic Discovery Response Event Parameters. */
    ble_gattc_evt_desc_disc_rsp_t               desc_disc_rsp;              /**< Descriptor Discovery Response Event Parameters. */
    ble_gattc_evt_char_val_by_uuid_read_rsp_t   char_val_by_uuid_read_rsp;  /**< Characteristic Value Read by UUID Response Event Parameters. */
    ble_gattc_evt_read_rsp_t                    read_rsp;                   /**< Read Response Event Parameters. */
    ble_gattc_evt_char_vals_read_rsp_t          char_vals_read_rsp;         /**< Characteristic Values Read Response Event Parameters. */
    ble_gattc_evt_write_rsp_t                   write_rsp;                  /**< Write Response Event Parameters. */
    ble_gattc_evt_hvx_t                         hvx;                        /**< Handle Value Notification/Indication Event Parameters. */
    ble_gattc_evt_exchange_mtu_rsp_t            exchange_mtu_rsp;           /**< Exchange MTU Response Event Parameters. */
    ble_gattc_evt_timeout_t                     timeout;                    /**< Timeout Event Parameters. */
    ble_gattc_evt_attr_info_disc_rsp_t          attr_info_disc_rsp;         /**< Attribute Information Discovery Event Parameters. */
    ble_gattc_evt_write_cmd_tx_complete_t       write_cmd_tx_complete;      /**< Write without Response transmission complete Event Parameters. */
  } params;                                                                 /**< Event Parameters. @note Only valid if @ref gatt_status == @ref BLE_GATT_STATUS_SUCCESS. */
} ble_gattc_evt_t;


/**@addtogroup BLE_L2CAP_STRUCTURES Structures
 * @{ */

/**
 * @brief BLE L2CAP connection configuration parameters, set with @ref sd_ble_cfg_set.
 *
 * @note  These parameters are set per connection, so all L2CAP channels created on this connection
 *        will have the same parameters.
 *
 * @retval ::NRF_ERROR_INVALID_PARAM  One or more of the following is true:
 *                                    - rx_mps is smaller than @ref BLE_L2CAP_MPS_MIN.
 *                                    - tx_mps is smaller than @ref BLE_L2CAP_MPS_MIN.
 *                                    - ch_count is greater than @ref BLE_L2CAP_CH_COUNT_MAX.
 * @retval ::NRF_ERROR_NO_MEM         rx_mps or tx_mps is set too high.
 */
typedef struct
{
  uint16_t    rx_mps;        /**< The maximum L2CAP PDU payload size, in bytes, that L2CAP shall
                                  be able to receive on L2CAP channels on connections with this
                                  configuration. The minimum value is @ref BLE_L2CAP_MPS_MIN. */
  uint16_t    tx_mps;        /**< The maximum L2CAP PDU payload size, in bytes, that L2CAP shall
                                  be able to transmit on L2CAP channels on connections with this
                                  configuration. The minimum value is @ref BLE_L2CAP_MPS_MIN. */
  uint8_t     rx_queue_size; /**< Number of SDU data buffers that can be queued for reception per
                                  L2CAP channel. The minimum value is one. */
  uint8_t     tx_queue_size; /**< Number of SDU data buffers that can be queued for transmission
                                  per L2CAP channel. The minimum value is one. */
  uint8_t     ch_count;      /**< Number of L2CAP channels the application can create per connection
                                  with this configuration. The default value is zero, the maximum
                                  value is @ref BLE_L2CAP_CH_COUNT_MAX.
                                  @note if this parameter is set to zero, all other parameters in
                                  @ref ble_l2cap_conn_cfg_t are ignored. */
} ble_l2cap_conn_cfg_t;

/**@brief L2CAP channel RX parameters. */
typedef struct
{
  uint16_t    rx_mtu;        /**< The maximum L2CAP SDU size, in bytes, that L2CAP shall be able to
                                  receive on this L2CAP channel.
                                  - Must be equal to or greater than @ref BLE_L2CAP_MTU_MIN. */
  uint16_t    rx_mps;        /**< The maximum L2CAP PDU payload size, in bytes, that L2CAP shall be
                                  able to receive on this L2CAP channel.
                                  - Must be equal to or greater than @ref BLE_L2CAP_MPS_MIN.
                                  - Must be equal to or less than @ref ble_l2cap_conn_cfg_t::rx_mps. */
  ble_data_t  sdu_buf;       /**< SDU data buffer for reception.
                                  - If @ref ble_data_t::p_data is non-NULL, initial credits are
                                    issued to the peer.
                                  - If @ref ble_data_t::p_data is NULL, no initial credits are
                                    issued to the peer. */
} ble_l2cap_ch_rx_params_t;

/**@brief L2CAP channel setup parameters. */
typedef struct
{
  ble_l2cap_ch_rx_params_t      rx_params;  /**< L2CAP channel RX parameters. */
  uint16_t                      le_psm;     /**< LE Protocol/Service Multiplexer. Used when requesting
                                                 setup of an L2CAP channel, ignored otherwise. */
  uint16_t                      status;     /**< Status code, see @ref BLE_L2CAP_CH_STATUS_CODES.
                                                 Used when replying to a setup request of an L2CAP
                                                 channel, ignored otherwise. */
} ble_l2cap_ch_setup_params_t;

/**@brief L2CAP channel TX parameters. */
typedef struct
{
  uint16_t    tx_mtu;        /**< The maximum L2CAP SDU size, in bytes, that L2CAP is able to
                                  transmit on this L2CAP channel. */
  uint16_t    peer_mps;      /**< The maximum L2CAP PDU payload size, in bytes, that the peer is
                                  able to receive on this L2CAP channel. */
  uint16_t    tx_mps;        /**< The maximum L2CAP PDU payload size, in bytes, that L2CAP is able
                                  to transmit on this L2CAP channel. This is effective tx_mps,
                                  selected by the SoftDevice as
                                  MIN( @ref ble_l2cap_ch_tx_params_t::peer_mps, @ref ble_l2cap_conn_cfg_t::tx_mps ) */
  uint16_t    credits;       /**< Initial credits given by the peer. */
} ble_l2cap_ch_tx_params_t;

/**@brief L2CAP Channel Setup Request event. */
typedef struct
{
  ble_l2cap_ch_tx_params_t  tx_params;  /**< L2CAP channel TX parameters. */
  uint16_t                  le_psm;     /**< LE Protocol/Service Multiplexer. */
} ble_l2cap_evt_ch_setup_request_t;

/**@brief L2CAP Channel Setup Refused event. */
typedef struct
{
  uint8_t  source;           /**< Source, see @ref BLE_L2CAP_CH_SETUP_REFUSED_SRCS */
  uint16_t status;           /**< Status code, see @ref BLE_L2CAP_CH_STATUS_CODES */
} ble_l2cap_evt_ch_setup_refused_t;

/**@brief L2CAP Channel Setup Completed event. */
typedef struct
{
  ble_l2cap_ch_tx_params_t tx_params;  /**< L2CAP channel TX parameters. */
} ble_l2cap_evt_ch_setup_t;

/**@brief L2CAP Channel SDU Data Buffer Released event. */
typedef struct
{
  ble_data_t  sdu_buf;       /**< Returned reception or transmission SDU data buffer. The SoftDevice
                                  returns SDU data buffers supplied by the application, which have
                                  not yet been returned previously via a @ref BLE_L2CAP_EVT_CH_RX or
                                  @ref BLE_L2CAP_EVT_CH_TX event. */
} ble_l2cap_evt_ch_sdu_buf_released_t;

/**@brief L2CAP Channel Credit received event. */
typedef struct
{
  uint16_t  credits;         /**< Additional credits given by the peer. */
} ble_l2cap_evt_ch_credit_t;

/**@brief L2CAP Channel received SDU event. */
typedef struct
{
  uint16_t    sdu_len;       /**< Total SDU length, in bytes. */
  ble_data_t  sdu_buf;       /**< SDU data buffer.
                                  @note If there is not enough space in the buffer
                                        (sdu_buf.len < sdu_len) then the rest of the SDU will be
                                        silently discarded by the SoftDevice. */
} ble_l2cap_evt_ch_rx_t;

/**@brief L2CAP Channel transmitted SDU event. */
typedef struct
{
  ble_data_t  sdu_buf;       /**< SDU data buffer. */
} ble_l2cap_evt_ch_tx_t;

/**@brief L2CAP event structure. */
typedef struct
{
  uint16_t conn_handle;                                     /**< Connection Handle on which the event occured. */
  uint16_t local_cid;                                       /**< Local Channel ID of the L2CAP channel, or
                                                                 @ref BLE_L2CAP_CID_INVALID if not present. */
  union
  {
    ble_l2cap_evt_ch_setup_request_t    ch_setup_request;   /**< L2CAP Channel Setup Request Event Parameters. */
    ble_l2cap_evt_ch_setup_refused_t    ch_setup_refused;   /**< L2CAP Channel Setup Refused Event Parameters. */
    ble_l2cap_evt_ch_setup_t            ch_setup;           /**< L2CAP Channel Setup Completed Event Parameters. */
    ble_l2cap_evt_ch_sdu_buf_released_t ch_sdu_buf_released;/**< L2CAP Channel SDU Data Buffer Released Event Parameters. */
    ble_l2cap_evt_ch_credit_t           credit;             /**< L2CAP Channel Credit Received Event Parameters. */
    ble_l2cap_evt_ch_rx_t               rx;                 /**< L2CAP Channel SDU Received Event Parameters. */
    ble_l2cap_evt_ch_tx_t               tx;                 /**< L2CAP Channel SDU Transmitted Event Parameters. */
  } params;                                                 /**< Event Parameters. */
} ble_l2cap_evt_t;

/**@brief Common BLE Event type, wrapping the module specific event reports. */
typedef struct
{
  ble_evt_hdr_t header;           /**< Event header. */
  union
  {
    ble_common_evt_t  common_evt; /**< Common Event, evt_id in BLE_EVT_* series. */
    ble_gap_evt_t     gap_evt;    /**< GAP originated event, evt_id in BLE_GAP_EVT_* series. */
    ble_gattc_evt_t   gattc_evt;  /**< GATT client originated event, evt_id in BLE_GATTC_EVT* series. */
    ble_gatts_evt_t   gatts_evt;  /**< GATT server originated event, evt_id in BLE_GATTS_EVT* series. */
    ble_l2cap_evt_t   l2cap_evt;  /**< L2CAP originated event, evt_id in BLE_L2CAP_EVT* series. */
  } evt;                          /**< Event union. */
} ble_evt_t;

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