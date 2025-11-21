// (C) 2001-2024 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


//This module consists of eCPRI RTL top + IWF RTL top
//This module is regarded as eCPRI top level in the perspective of eCPRI _hw.tcl
//This module will be removed in the future if and when IWF has its own _hw.tcl

`timescale 1 ps / 1 ps

module ecpri_iwf_top #(
   //eCPRI parameters
   parameter IP_VERSION              = 2,
   parameter PROTOCOL_REVISION       = 1,
   parameter IWF_SUPPORT             = "OFF",
   parameter IWF_TYPE                = 1,
   parameter FRAGMENTATION           = "OFF",
   parameter DELAY_MEASUREMENT       = "ON",
   parameter ONE_STEP_DELAY          = "ON",
   parameter TS_FINGERPRINT_WIDTH    = 1,
   parameter PTP_TS_FP_WIDTH         = 6,
   parameter INTEL_ORAN              = "OFF",
   parameter OOO_SEQ_CHK             = "OFF",
   parameter ETH_MTU                 = 1500,
   parameter MAC_VLAN_EN             = 0,
   parameter MAC_TCP_EN              = 0,
   parameter BITSPERSYMBOL           = 8,
   parameter SYMBOLSPERBEAT          = 8,
   parameter TXINS_READY_LATENCY     = 0, 
   parameter TX_ERROR_WIDTH          = 1,
   parameter RX_ERROR_WIDTH          = 6,
   parameter integer DATA_WIDTH      = BITSPERSYMBOL*SYMBOLSPERBEAT,//vhdl port type fix
   parameter NOCT                    = DATA_WIDTH/8,
   parameter EWIDTH                  = 3,
   parameter ETH_25G_PTP             = 1,
   parameter LL10G_PTP   	          = 0,
   parameter EHIP_PTP   	          = 0,
   parameter READY_LATENCY           = 3,
   parameter EXT_SOURCE_FIFO_DEPTH   = 32,
   parameter EXT_SINK_0_DFIFO_DEPTH = 128,
   parameter EXT_SINK_1_DFIFO_DEPTH = 128,
   parameter NUMBER_EXT_SINK_INT     = 1,
   parameter ECC_ENABLE              = 0, 
   parameter IPV4_ENABLE             = 1,
   parameter IPV6_ENABLE             = 1,
   parameter MSG4_MODE               = 1,
   parameter ADV_MAP                 = "OFF",
   parameter MSG4_TIMER_EN           = "ON",
   parameter MSG6_TIMER_EN           = "ON",  
   parameter MSG4_TIMER_WIDTH        = 12,
   parameter MSG5_TIMER_WIDTH        = 16,
   parameter MSG6_TIMER_WIDTH        = 12,
   parameter SRC_MAC_ADDR0           = 48'h0,
   parameter DEST_MAC_ADDR0          = 48'h0,
   parameter DEST_MAC_ADDR1          = 48'h0,
   parameter DEST_MAC_ADDR2          = 48'h0,
   parameter DEST_MAC_ADDR3          = 48'h0,
   parameter DEST_MAC_ADDR4          = 48'h0,
   parameter DEST_MAC_ADDR5          = 48'h0,
   parameter DEST_MAC_ADDR6          = 48'h0,
   parameter DEST_MAC_ADDR7          = 48'h0,
   parameter VID_ADDR_DF             = 12'h0,
   parameter MATCH_MACADDR_VLANID    = "MACADDR",
   parameter TX_ARBITRATION_SCHEME      = "FIXED",
   parameter ARB_QUEUE_0_DEPTH          = 128,
   parameter ARB_QUEUE_1_DEPTH          = 128,
   parameter ARB_QUEUE_2_DEPTH          = 128,
   parameter ARB_QUEUE_3_DEPTH          = 128,
   parameter ARB_QUEUE_4_DEPTH          = 128,
   parameter ARB_QUEUE_5_DEPTH          = 128,
   parameter ARB_QUEUE_6_DEPTH          = 128,
   parameter ARB_QUEUE_7_DEPTH          = 128,
   //IWF parameters
   parameter IWF_CPRI_LINE_RATE      = "24.33024",
   parameter TILE                    = "H", 
   parameter NUM_IWF_CPRI            = 1, 
   parameter RDY_LATENCY             = 3,
   //Shared eCPRI and IWF
   parameter DEVICE_FAMILY           = "Stratix 10"
) (
   /////////////////
   //eCPRI signals//
   /////////////////
      //Common clock and Reset
      input  logic                            mac_clk_tx,
      input  logic                            mac_clk_rx,      
      input  logic                            clk_tx,
      input  logic                            clk_rx,
      input  logic                            clk_csr,
      input  logic                     		 ext_sink_clk,
      input  logic                            rst_tx_n,
      input  logic        	                   rst_rx_n,
      input  logic                            rst_csr_n,

      //AVST Eth MAC to eCPRI
      input  logic                            mac_sink_valid,
      input  logic [DATA_WIDTH-1 : 0]         mac_sink_data,
      input  logic                            mac_sink_sop,
      input  logic                            mac_sink_eop,
      input  logic [EWIDTH-1 : 0]             mac_sink_empty,
      input  logic [RX_ERROR_WIDTH-1 : 0]     mac_sink_error,
      output logic                            mac_sink_ready,

      /* To Remove, replace with ext sink 0 and ext sink 1
      //AVST from external Agent
      input  logic                            ext_sink_sop,
      input  logic                            ext_sink_eop,
      input  logic                            ext_sink_valid,
      input  logic [DATA_WIDTH-1 : 0]         ext_sink_data,
      input  logic [EWIDTH-1 : 0]             ext_sink_empty,
      input  logic [TX_ERROR_WIDTH-1 : 0]     ext_sink_error,
      output logic                            ext_sink_ready,
      input  logic [PTP_TS_FP_WIDTH-2:0]      ext_ptp_timestamp_request_fingerprint,
      input  logic [95:0]                     ext_tx_ingress_timestamp_96b_data,
      output logic                            ext_tx_egress_timestamp_96b_valid,
      output logic [95:0]                     ext_tx_egress_timestamp_96b_data,
      output logic [PTP_TS_FP_WIDTH-2:0]      ext_tx_egress_timestamp_96b_fingerprint,
      */

      //ext sink 0
      //PTP_TS_FP_WIDTH now using 10bit
      input  logic                            ext_sink_0_sop,
      input  logic                            ext_sink_0_eop,
      input  logic                            ext_sink_0_valid,
      input  logic [DATA_WIDTH-1 : 0]         ext_sink_0_data,
      input  logic [EWIDTH-1 : 0]             ext_sink_0_empty,
      input  logic [TX_ERROR_WIDTH-1 : 0]     ext_sink_0_error,
      output logic                            ext_sink_0_ready,
      input  logic [PTP_TS_FP_WIDTH-1:0]      ext_sink_0_timestamp_request_fingerprint,
      input  logic                            ext_sink_0_timestamp_request_valid,
      input  logic [95:0]                     ext_sink_0_tx_ingress_timestamp_96b_data,
      output logic                            ext_sink_0_tx_egress_timestamp_96b_valid,
      output logic [95:0]                     ext_sink_0_tx_egress_timestamp_96b_data,
      output logic [PTP_TS_FP_WIDTH-1:0]      ext_sink_0_tx_egress_timestamp_96b_fingerprint,
      
      //ext sink 1
      input  logic                            ext_sink_1_sop,
      input  logic                            ext_sink_1_eop,
      input  logic                            ext_sink_1_valid,
      input  logic [DATA_WIDTH-1 : 0]         ext_sink_1_data,
      input  logic [EWIDTH-1 : 0]             ext_sink_1_empty,
      input  logic [TX_ERROR_WIDTH-1 : 0]     ext_sink_1_error,
      output logic                            ext_sink_1_ready,
      input  logic [PTP_TS_FP_WIDTH-1:0]      ext_sink_1_timestamp_request_fingerprint,
      input  logic                            ext_sink_1_timestamp_request_valid,
      input  logic [95:0]                     ext_sink_1_tx_ingress_timestamp_96b_data,
      output logic                            ext_sink_1_tx_egress_timestamp_96b_valid,
      output logic [95:0]                     ext_sink_1_tx_egress_timestamp_96b_data,
      output logic [PTP_TS_FP_WIDTH-1:0]      ext_sink_1_tx_egress_timestamp_96b_fingerprint,

      //AVST to external Agent
      output  logic                           ext_source_sop,
      output  logic                           ext_source_eop,
      output  logic                           ext_source_valid,
      output  logic [DATA_WIDTH-1 : 0]        ext_source_data,
      output  logic [EWIDTH-1 : 0]            ext_source_empty,
      output  logic [RX_ERROR_WIDTH-1 : 0]    ext_source_error,
      output  logic [2:0]                     ext_source_pkt_type,

      // AVST eCPRI to Eth MAC
      output logic                            mac_source_valid,
      output logic [DATA_WIDTH-1 : 0]         mac_source_data,
      output logic                            mac_source_sop,
      output logic                            mac_source_eop,
      output logic [EWIDTH-1 : 0]             mac_source_empty,
      input  logic                            mac_source_ready,
      output logic                            mac_source_error,

      output logic                            err_interrupt,

      // Mapper side sideband      
      input  logic [7:0]                      sink_mem_acc_id,
      input  logic [7:0]                      sink_op_type,
      input  logic [15:0]                     sink_element_id,
      input  logic [47:0]  					    sink_address,
      input  logic [15:0]                     sink_length,
      input  logic 		               	    tx_transport_c_u,

      // Stub
      output logic [7:0]                      source_mem_acc_id,
      output logic [7:0]                      source_op_type,
      output logic [15:0]                     source_element_id,
      output logic [47:0]                     source_address,
      output logic [15:0]                     source_length,
      output logic 	                         rx_transport_c_u,

      output logic [15:0]                     ptp_offset_timestamp,
      output logic [15:0]                     ptp_offset_correction_field,
      output logic 	                         ptp_timestamp_insert,
      output logic 	                         ptp_tx_etstamp_ins_ctrl_residence_time_update,
      output logic [PTP_TS_FP_WIDTH+1:0]         ptp_timestamp_request_fingerprint,
      output logic 	                         ptp_timestamp_request_valid,

      output logic                            tx_queue_0_fifo_full,
      output logic                            tx_queue_1_fifo_full ,
      output logic                            tx_queue_2_fifo_full ,
      output logic                            tx_queue_3_fifo_full ,
      output logic                            tx_queue_4_fifo_full ,
      output logic                            tx_queue_5_fifo_full ,
      output logic                            tx_queue_6_fifo_full ,
      output logic                            tx_queue_7_fifo_full ,

      input  logic                            tx_lanes_stable,
      input  logic                            rx_pcs_ready,

      //drive to zero for now
      output logic						          tx_etstamp_ins_ctrl_timestamp_format,
      output logic							       tx_etstamp_ins_ctrl_residence_time_calc_format, 
      output logic [15:0]                     tx_etstamp_ins_ctrl_offset_checksum_field,
      output logic [15:0]                     tx_etstamp_ins_ctrl_offset_checksum_correction, 
      output logic [95:0]                     tx_etstamp_ins_ctrl_ingress_timestamp_96b,
      output logic 	                         tx_etstamp_ins_ctrl_checksum_zero,
      output logic 	                         tx_etstamp_ins_ctrl_checksum_correct, 

      // PTP sideband signals form Ethernet MAC & TOD modules
      input logic       	 			 	 	 tx_egress_timestamp_96b_valid,  
      input logic [95:0] 				 		 tx_egress_timestamp_96b_data,
      input logic [PTP_TS_FP_WIDTH+1:0]  				 tx_egress_timestamp_96b_fingerprint,
      input logic        				 		 rx_ingress_timestamp_96b_valid,
      input logic [95:0] 					 	 rx_ingress_timestamp_96b_data, 
      output logic [95:0] 			  		       ext_rx_ingress_timestamp_96b_data,   

      input logic [95:0] 						    rx_tod_time_of_day_96b_data,
      input logic [95:0] 						    tx_tod_time_of_day_96b_data,

      
      output logic [95:0]                     ptp_tx_ingress_timestamp_96b_data,

      //reconfig | Shared between eCPRI and IWF. csr_address MSB 1 = IWF, MSB 0 = eCPRI
      input  logic [31:0]                     csr_writedata,
      input  logic                            csr_write,
      output logic [31:0]                     csr_readdata,
      output logic 	                         csr_readdatavalid,
      output logic 	                         csr_waitrequest,
      input  logic                            csr_read,
      input  logic [15:0]                     csr_address,

      input logic [15:0]                      sink_pkt_size,
      input logic [15:0]                      sink_pkt_checksum,
      input logic                             sink_concatenation,
      input logic [31:0]                      sink_pc_id,
      input logic [31:0]                      sink_seq_id,
      input logic [15:0]                      sink_rtc_id,
      input logic [7:0]                       sink_msg_type,
      input logic [15:0]                      sink_reset_id,
      input logic [7:0]                       sink_reset_op,
      input logic [7:0]                       sink_event_id,
      input logic [7:0]                       sink_event_type,

      output logic [31:0]                     source_pc_id,
      output logic [31:0]                     source_seq_id,
      output logic [15:0]                     source_rtc_id,
      output logic [7:0]                      source_msg_type,
      output logic [15:0]                     source_reset_id,
      output logic [7:0]                      source_reset_op,
      output logic [7:0]                      source_event_id,
      output logic [7:0]                      source_event_type,
      output logic [7:0]                      source_notif,
      output logic                            source_concatenation,

      input  logic                            avst_sink_valid,
      input  logic [DATA_WIDTH-1:0]           avst_sink_data,
      input  logic                            avst_sink_sop,
      input  logic                            avst_sink_eop,
      input  logic [EWIDTH-1:0]               avst_sink_empty,
      input  logic                            avst_sink_error,
      output logic                            avst_sink_ready,

      output logic                            avst_source_valid,
      output logic [DATA_WIDTH-1:0]           avst_source_data,
      output logic                            avst_source_sop,
      output logic                            avst_source_eop,
      output logic [EWIDTH-1:0]               avst_source_empty,
      output logic                            avst_source_error,

   ///////////////
   //IWF signals//
   ///////////////
      input  logic                    cpri_clkout0            ,
      input  logic                    cpri_clkout1            ,
      input  logic                    cpri_clkout2            ,
      input  logic                    cpri_clkout3            ,
      input  logic                    iwf_rst_tx_n            ,
      input  logic        	      iwf_rst_rx_n            ,
      output logic                    rst_tx_n_sync           ,
      output logic        	      rst_rx_n_sync           ,

      /* CPRI IQ Data Interface */
      input  logic [ 7:0]             iq64_rx_valid0           , // Input    8
      input  logic [63:0]             iq64_rx_data0            , // Input    64
      input  logic [ 7:0]             iq64_tx_ready0           , // Input    8
      output logic [ 7:0]             iq64_tx_valid0           , // Output   8
      output logic [63:0]             iq64_tx_data0            , // Output   64
      input  logic [ 3:0]             iq32_rx_valid0           , // Input    8
      input  logic [31:0]             iq32_rx_data0            , // Input    64
      input  logic [ 3:0]             iq32_tx_ready0           , // Input    8
      output logic [ 3:0]             iq32_tx_valid0           , // Output   8
      output logic [31:0]             iq32_tx_data0            , // Output   64

      /* CPRI Ctrl_AxC Interface */
      input  logic [ 7:0]             ctrl64_axc_rx_valid0     , // Input    8
      input  logic [63:0]             ctrl64_axc_rx_data0      , // Input    64 
      input  logic [ 7:0]             ctrl64_axc_tx_ready0     , // Input    8
      output logic [ 7:0]             ctrl64_axc_tx_valid0     , // Output   8
      output logic [63:0]             ctrl64_axc_tx_data0      , // Output   64
      input  logic [ 3:0]             ctrl32_axc_rx_valid0     , // Input    8
      input  logic [31:0]             ctrl32_axc_rx_data0      , // Input    64
      input  logic [ 3:0]             ctrl32_axc_tx_ready0     , // Input    8
      output logic [ 3:0]             ctrl32_axc_tx_valid0     , // Output   8
      output logic [31:0]             ctrl32_axc_tx_data0      , // Output   64


      /* CPRI Vendor Specific Interface */
      input  logic [ 7:0]             vs64_rx_valid0           , // Input    8
      input  logic [63:0]             vs64_rx_data0            , // Input    64
      input  logic [ 7:0]             vs64_tx_ready0           , // Input    8
      output logic [ 7:0]             vs64_tx_valid0           , // Output   8
      output logic [63:0]             vs64_tx_data0            , // Output   64
      input  logic [ 3:0]             vs32_rx_valid0           , // Input    8
      input  logic [31:0]             vs32_rx_data0            , // Input    64
      input  logic [ 3:0]             vs32_tx_ready0           , // Input    8
      output logic [ 3:0]             vs32_tx_valid0           , // Output   8
      output logic [31:0]             vs32_tx_data0            , // Output   64


      /* CPRI Real-Time Vendor Specific Interface */
      input  logic [ 1:0]             rtvs64_rx_valid0         , // Input    8
      input  logic [63:0]             rtvs64_rx_data0          , // Input    64
      input  logic [ 1:0]             rtvs64_tx_ready0         , // Input    8
      output logic [ 1:0]             rtvs64_tx_valid0         , // Output   8
      output logic [63:0]             rtvs64_tx_data0          , // Output   64
      input  logic                    rtvs32_rx_valid0         , // Input    8
      input  logic [31:0]             rtvs32_rx_data0          , // Input    64
      input  logic                    rtvs32_tx_ready0         , // Input    8
      output logic                    rtvs32_tx_valid0         , // Output   8
      output logic [31:0]             rtvs32_tx_data0          , // Output   64

      /* CPRI Gigabit Media Independent (GMII) Interface */
      input  logic                    iwf_gmii_rxclk0          , // 
      input  logic                    iwf_gmii_txclk0          , // 
      input  logic                    iwf_gmii_rxreset_n0      , // 
      input  logic                    iwf_gmii_txreset_n0      , // 
      output logic                    gmii_rxclk0              , // 
      output logic                    gmii_txclk0              , // 
      output logic                    gmii_rxreset_n0          , // 
      output logic                    gmii_txreset_n0          , // 

      input  logic                    gmii_rxdv0               , // Input    1
      input  logic                    gmii_rxer0               , // Input    1
      input  logic [7:0]              gmii_rxd0                , // Input    8
      input  logic [3:0]              gmii_rxfifo_status0      , // Input    4
      output logic                    gmii_txen0               , // Output   1
      output logic                    gmii_txer0               , // Output   1
      output logic [7:0]              gmii_txd0                , // Output   8
      input  logic [3:0]              gmii_txfifo_status0      , // Input    4

      /* IWF Gigabit Media Independent (GMII) Interface */
      output logic                    iwf_gmii_rxdv0           , // Input    1
      output logic                    iwf_gmii_rxer0           , // Input    1
      output logic [7:0]              iwf_gmii_rxd0            , // Input    8
      output logic [3:0]              iwf_gmii_rxfifo_status0  , // Input    4
      input  logic                    iwf_gmii_txen0           , // Output   1
      input  logic                    iwf_gmii_txer0           , // Output   1
      input  logic [7:0]              iwf_gmii_txd0            , // Output   8
      output logic [3:0]              iwf_gmii_txfifo_status0  , // Input    4

      /* CPRI IP L1 Control and Status */
      input  logic [5:0]              cpri_nego_bitrate_in0    , // Output   6
      input  logic [2:0]              cpri_state_startup_seq0  , // Input    6
      input  logic [2:0]              cpri_state_l1_synch0     , // Input    3
      input  logic                    cpri_local_lof0          , // Input    1
      input  logic                    cpri_local_los0          , // Input    1
      output logic                    cpri_sdi_assert0         , // Output   1
      input  logic                    cpri_local_rai0          , // Input    1
      output logic                    cpri_reset_assert0       , // Output   1
      input  logic                    cpri_remote_lof0         , // Input    1
      input  logic                    cpri_remote_los0         , // Input    1
      input  logic                    cpri_sdi_req0            , // Input    1
      input  logic                    cpri_remote_rai0         , // Input    1
      input  logic                    cpri_reset_req0          , // Input    1


      /* CPRI IQ Data Interface */
      input  logic [ 7:0]             iq64_rx_valid1           , // Input    8
      input  logic [63:0]             iq64_rx_data1            , // Input    64
      input  logic [ 7:0]             iq64_tx_ready1           , // Input    8
      output logic [ 7:0]             iq64_tx_valid1           , // Output   8
      output logic [63:0]             iq64_tx_data1            , // Output   64
      input  logic [ 3:0]             iq32_rx_valid1           , // Input    8
      input  logic [31:0]             iq32_rx_data1            , // Input    64
      input  logic [ 3:0]             iq32_tx_ready1           , // Input    8
      output logic [ 3:0]             iq32_tx_valid1           , // Output   8
      output logic [31:0]             iq32_tx_data1            , // Output   64

      /* CPRI Ctrl_AxC Interface */
      input  logic [ 7:0]             ctrl64_axc_rx_valid1     , // Input    8
      input  logic [63:0]             ctrl64_axc_rx_data1      , // Input    64 
      input  logic [ 7:0]             ctrl64_axc_tx_ready1     , // Input    8
      output logic [ 7:0]             ctrl64_axc_tx_valid1     , // Output   8
      output logic [63:0]             ctrl64_axc_tx_data1      , // Output   64
      input  logic [ 3:0]             ctrl32_axc_rx_valid1     , // Input    8
      input  logic [31:0]             ctrl32_axc_rx_data1      , // Input    64
      input  logic [ 3:0]             ctrl32_axc_tx_ready1     , // Input    8
      output logic [ 3:0]             ctrl32_axc_tx_valid1     , // Output   8
      output logic [31:0]             ctrl32_axc_tx_data1      , // Output   64


      /* CPRI Vendor Specific Interface */
      input  logic [ 7:0]             vs64_rx_valid1           , // Input    8
      input  logic [63:0]             vs64_rx_data1            , // Input    64
      input  logic [ 7:0]             vs64_tx_ready1           , // Input    8
      output logic [ 7:0]             vs64_tx_valid1           , // Output   8
      output logic [63:0]             vs64_tx_data1            , // Output   64
      input  logic [ 3:0]             vs32_rx_valid1           , // Input    8
      input  logic [31:0]             vs32_rx_data1            , // Input    64
      input  logic [ 3:0]             vs32_tx_ready1           , // Input    8
      output logic [ 3:0]             vs32_tx_valid1           , // Output   8
      output logic [31:0]             vs32_tx_data1            , // Output   64


      /* CPRI Real-Time Vendor Specific Interface */
      input  logic [ 1:0]             rtvs64_rx_valid1         , // Input    8
      input  logic [63:0]             rtvs64_rx_data1          , // Input    64
      input  logic [ 1:0]             rtvs64_tx_ready1         , // Input    8
      output logic [ 1:0]             rtvs64_tx_valid1         , // Output   8
      output logic [63:0]             rtvs64_tx_data1          , // Output   64
      input  logic                    rtvs32_rx_valid1         , // Input    8
      input  logic [31:0]             rtvs32_rx_data1          , // Input    64
      input  logic                    rtvs32_tx_ready1         , // Input    8
      output logic                    rtvs32_tx_valid1         , // Output   8
      output logic [31:0]             rtvs32_tx_data1          , // Output   64

      /* CPRI Gigabit Media Independent (GMII) Interface */
      input  logic                    iwf_gmii_rxclk1          , // 
      input  logic                    iwf_gmii_txclk1          , // 
      input  logic                    iwf_gmii_rxreset_n1      , // 
      input  logic                    iwf_gmii_txreset_n1      , // 
      output logic                    gmii_rxclk1              , // 
      output logic                    gmii_txclk1              , // 
      output logic                    gmii_rxreset_n1          , // 
      output logic                    gmii_txreset_n1          , // 

      input  logic                    gmii_rxdv1               , // Input    1
      input  logic                    gmii_rxer1               , // Input    1
      input  logic [7:0]              gmii_rxd1                , // Input    8
      input  logic [3:0]              gmii_rxfifo_status1      , // Input    4
      output logic                    gmii_txen1               , // Output   1
      output logic                    gmii_txer1               , // Output   1
      output logic [7:0]              gmii_txd1                , // Output   8
      input  logic [3:0]              gmii_txfifo_status1      , // Input    4

      /* IWF Gigabit Media Independent (GMII) Interface */
      output logic                    iwf_gmii_rxdv1           , // Input    1
      output logic                    iwf_gmii_rxer1           , // Input    1
      output logic [7:0]              iwf_gmii_rxd1            , // Input    8
      output logic [3:0]              iwf_gmii_rxfifo_status1  , // Input    4
      input  logic                    iwf_gmii_txen1           , // Output   1
      input  logic                    iwf_gmii_txer1           , // Output   1
      input  logic [7:0]              iwf_gmii_txd1            , // Output   8
      output logic [3:0]              iwf_gmii_txfifo_status1  , // Input    4

      /* CPRI IP L1 Control and Status */
      input  logic [5:0]              cpri_nego_bitrate_in1    , // Output   6
      input  logic [2:0]              cpri_state_startup_seq1  , // Input    6
      input  logic [2:0]              cpri_state_l1_synch1     , // Input    3
      input  logic                    cpri_local_lof1          , // Input    1
      input  logic                    cpri_local_los1          , // Input    1
      output logic                    cpri_sdi_assert1         , // Output   1
      input  logic                    cpri_local_rai1          , // Input    1
      output logic                    cpri_reset_assert1       , // Output   1
      input  logic                    cpri_remote_lof1         , // Input    1
      input  logic                    cpri_remote_los1         , // Input    1
      input  logic                    cpri_sdi_req1            , // Input    1
      input  logic                    cpri_remote_rai1         , // Input    1
      input  logic                    cpri_reset_req1          , // Input    1


      /* CPRI IQ Data Interface */
      input  logic [ 7:0]             iq64_rx_valid2           , // Input    8
      input  logic [63:0]             iq64_rx_data2            , // Input    64
      input  logic [ 7:0]             iq64_tx_ready2           , // Input    8
      output logic [ 7:0]             iq64_tx_valid2           , // Output   8
      output logic [63:0]             iq64_tx_data2            , // Output   64
      input  logic [ 3:0]             iq32_rx_valid2           , // Input    8
      input  logic [31:0]             iq32_rx_data2            , // Input    64
      input  logic [ 3:0]             iq32_tx_ready2           , // Input    8
      output logic [ 3:0]             iq32_tx_valid2           , // Output   8
      output logic [31:0]             iq32_tx_data2            , // Output   64

      /* CPRI Ctrl_AxC Interface */
      input  logic [ 7:0]             ctrl64_axc_rx_valid2     , // Input    8
      input  logic [63:0]             ctrl64_axc_rx_data2      , // Input    64 
      input  logic [ 7:0]             ctrl64_axc_tx_ready2     , // Input    8
      output logic [ 7:0]             ctrl64_axc_tx_valid2     , // Output   8
      output logic [63:0]             ctrl64_axc_tx_data2      , // Output   64
      input  logic [ 3:0]             ctrl32_axc_rx_valid2     , // Input    8
      input  logic [31:0]             ctrl32_axc_rx_data2      , // Input    64
      input  logic [ 3:0]             ctrl32_axc_tx_ready2     , // Input    8
      output logic [ 3:0]             ctrl32_axc_tx_valid2     , // Output   8
      output logic [31:0]             ctrl32_axc_tx_data2      , // Output   64


      /* CPRI Vendor Specific Interface */
      input  logic [ 7:0]             vs64_rx_valid2           , // Input    8
      input  logic [63:0]             vs64_rx_data2            , // Input    64
      input  logic [ 7:0]             vs64_tx_ready2           , // Input    8
      output logic [ 7:0]             vs64_tx_valid2           , // Output   8
      output logic [63:0]             vs64_tx_data2            , // Output   64
      input  logic [ 3:0]             vs32_rx_valid2           , // Input    8
      input  logic [31:0]             vs32_rx_data2            , // Input    64
      input  logic [ 3:0]             vs32_tx_ready2           , // Input    8
      output logic [ 3:0]             vs32_tx_valid2           , // Output   8
      output logic [31:0]             vs32_tx_data2            , // Output   64


      /* CPRI Real-Time Vendor Specific Interface */
      input  logic [ 1:0]             rtvs64_rx_valid2         , // Input    8
      input  logic [63:0]             rtvs64_rx_data2          , // Input    64
      input  logic [ 1:0]             rtvs64_tx_ready2         , // Input    8
      output logic [ 1:0]             rtvs64_tx_valid2         , // Output   8
      output logic [63:0]             rtvs64_tx_data2          , // Output   64
      input  logic                    rtvs32_rx_valid2         , // Input    8
      input  logic [31:0]             rtvs32_rx_data2          , // Input    64
      input  logic                    rtvs32_tx_ready2         , // Input    8
      output logic                    rtvs32_tx_valid2         , // Output   8
      output logic [31:0]             rtvs32_tx_data2          , // Output   64

      /* CPRI Gigabit Media Independent (GMII) Interface */
      input  logic                    iwf_gmii_rxclk2          , // 
      input  logic                    iwf_gmii_txclk2          , // 
      input  logic                    iwf_gmii_rxreset_n2      , // 
      input  logic                    iwf_gmii_txreset_n2      , // 
      output logic                    gmii_rxclk2              , // 
      output logic                    gmii_txclk2              , // 
      output logic                    gmii_rxreset_n2          , // 
      output logic                    gmii_txreset_n2          , // 

      input  logic                    gmii_rxdv2               , // Input    1
      input  logic                    gmii_rxer2               , // Input    1
      input  logic [7:0]              gmii_rxd2                , // Input    8
      input  logic [3:0]              gmii_rxfifo_status2      , // Input    4
      output logic                    gmii_txen2               , // Output   1
      output logic                    gmii_txer2               , // Output   1
      output logic [7:0]              gmii_txd2                , // Output   8
      input  logic [3:0]              gmii_txfifo_status2      , // Input    4

      /* IWF Gigabit Media Independent (GMII) Interface */
      output logic                    iwf_gmii_rxdv2           , // Input    1
      output logic                    iwf_gmii_rxer2           , // Input    1
      output logic [7:0]              iwf_gmii_rxd2            , // Input    8
      output logic [3:0]              iwf_gmii_rxfifo_status2  , // Input    4
      input  logic                    iwf_gmii_txen2           , // Output   1
      input  logic                    iwf_gmii_txer2           , // Output   1
      input  logic [7:0]              iwf_gmii_txd2            , // Output   8
      output logic [3:0]              iwf_gmii_txfifo_status2  , // Input    4

      /* CPRI IP L1 Control and Status */
      input  logic [5:0]              cpri_nego_bitrate_in2    , // Output   6
      input  logic [2:0]              cpri_state_startup_seq2  , // Input    6
      input  logic [2:0]              cpri_state_l1_synch2     , // Input    3
      input  logic                    cpri_local_lof2          , // Input    1
      input  logic                    cpri_local_los2          , // Input    1
      output logic                    cpri_sdi_assert2         , // Output   1
      input  logic                    cpri_local_rai2          , // Input    1
      output logic                    cpri_reset_assert2       , // Output   1
      input  logic                    cpri_remote_lof2         , // Input    1
      input  logic                    cpri_remote_los2         , // Input    1
      input  logic                    cpri_sdi_req2            , // Input    1
      input  logic                    cpri_remote_rai2         , // Input    1
      input  logic                    cpri_reset_req2          , // Input    1


      /* CPRI IQ Data Interface */
      input  logic [ 7:0]             iq64_rx_valid3           , // Input    8
      input  logic [63:0]             iq64_rx_data3            , // Input    64
      input  logic [ 7:0]             iq64_tx_ready3           , // Input    8
      output logic [ 7:0]             iq64_tx_valid3           , // Output   8
      output logic [63:0]             iq64_tx_data3            , // Output   64
      input  logic [ 3:0]             iq32_rx_valid3           , // Input    8
      input  logic [31:0]             iq32_rx_data3            , // Input    64
      input  logic [ 3:0]             iq32_tx_ready3           , // Input    8
      output logic [ 3:0]             iq32_tx_valid3           , // Output   8
      output logic [31:0]             iq32_tx_data3            , // Output   64

      /* CPRI Ctrl_AxC Interface */
      input  logic [ 7:0]             ctrl64_axc_rx_valid3     , // Input    8
      input  logic [63:0]             ctrl64_axc_rx_data3      , // Input    64 
      input  logic [ 7:0]             ctrl64_axc_tx_ready3     , // Input    8
      output logic [ 7:0]             ctrl64_axc_tx_valid3     , // Output   8
      output logic [63:0]             ctrl64_axc_tx_data3      , // Output   64
      input  logic [ 3:0]             ctrl32_axc_rx_valid3     , // Input    8
      input  logic [31:0]             ctrl32_axc_rx_data3      , // Input    64
      input  logic [ 3:0]             ctrl32_axc_tx_ready3     , // Input    8
      output logic [ 3:0]             ctrl32_axc_tx_valid3     , // Output   8
      output logic [31:0]             ctrl32_axc_tx_data3      , // Output   64


      /* CPRI Vendor Specific Interface */
      input  logic [ 7:0]             vs64_rx_valid3           , // Input    8
      input  logic [63:0]             vs64_rx_data3            , // Input    64
      input  logic [ 7:0]             vs64_tx_ready3           , // Input    8
      output logic [ 7:0]             vs64_tx_valid3           , // Output   8
      output logic [63:0]             vs64_tx_data3            , // Output   64
      input  logic [ 3:0]             vs32_rx_valid3           , // Input    8
      input  logic [31:0]             vs32_rx_data3            , // Input    64
      input  logic [ 3:0]             vs32_tx_ready3           , // Input    8
      output logic [ 3:0]             vs32_tx_valid3           , // Output   8
      output logic [31:0]             vs32_tx_data3            , // Output   64


      /* CPRI Real-Time Vendor Specific Interface */
      input  logic [ 1:0]             rtvs64_rx_valid3         , // Input    8
      input  logic [63:0]             rtvs64_rx_data3          , // Input    64
      input  logic [ 1:0]             rtvs64_tx_ready3         , // Input    8
      output logic [ 1:0]             rtvs64_tx_valid3         , // Output   8
      output logic [63:0]             rtvs64_tx_data3          , // Output   64
      input  logic                    rtvs32_rx_valid3         , // Input    8
      input  logic [31:0]             rtvs32_rx_data3          , // Input    64
      input  logic                    rtvs32_tx_ready3         , // Input    8
      output logic                    rtvs32_tx_valid3         , // Output   8
      output logic [31:0]             rtvs32_tx_data3          , // Output   64

      /* CPRI Gigabit Media Independent (GMII) Interface */
      input  logic                    iwf_gmii_rxclk3          , // 
      input  logic                    iwf_gmii_txclk3          , // 
      input  logic                    iwf_gmii_rxreset_n3      , // 
      input  logic                    iwf_gmii_txreset_n3      , // 
      output logic                    gmii_rxclk3              , // 
      output logic                    gmii_txclk3              , // 
      output logic                    gmii_rxreset_n3          , // 
      output logic                    gmii_txreset_n3          , // 

      input  logic                    gmii_rxdv3               , // Input    1
      input  logic                    gmii_rxer3               , // Input    1
      input  logic [7:0]              gmii_rxd3                , // Input    8
      input  logic [3:0]              gmii_rxfifo_status3      , // Input    4
      output logic                    gmii_txen3               , // Output   1
      output logic                    gmii_txer3               , // Output   1
      output logic [7:0]              gmii_txd3                , // Output   8
      input  logic [3:0]              gmii_txfifo_status3      , // Input    4

      /* IWF Gigabit Media Independent (GMII) Interface */
      output logic                    iwf_gmii_rxdv3           , // Input    1
      output logic                    iwf_gmii_rxer3           , // Input    1
      output logic [7:0]              iwf_gmii_rxd3            , // Input    8
      output logic [3:0]              iwf_gmii_rxfifo_status3  , // Input    4
      input  logic                    iwf_gmii_txen3           , // Output   1
      input  logic                    iwf_gmii_txer3           , // Output   1
      input  logic [7:0]              iwf_gmii_txd3            , // Output   8
      output logic [3:0]              iwf_gmii_txfifo_status3  , // Input    4

      /* CPRI IP L1 Control and Status */
      input  logic [5:0]              cpri_nego_bitrate_in3    , // Output   6
      input  logic [2:0]              cpri_state_startup_seq3  , // Input    6
      input  logic [2:0]              cpri_state_l1_synch3     , // Input    3
      input  logic                    cpri_local_lof3          , // Input    1
      input  logic                    cpri_local_los3          , // Input    1
      output logic                    cpri_sdi_assert3         , // Output   1
      input  logic                    cpri_local_rai3          , // Input    1
      output logic                    cpri_reset_assert3       , // Output   1
      input  logic                    cpri_remote_lof3         , // Input    1
      input  logic                    cpri_remote_los3         , // Input    1
      input  logic                    cpri_sdi_req3            , // Input    1
      input  logic                    cpri_remote_rai3         , // Input    1
      input  logic                    cpri_reset_req3          , // Input    1

      output  logic                   iwf_avst_source_valid   , //Output    1
      output  logic [DATA_WIDTH-1:0]  iwf_avst_source_data    , //Output    DATA_WIDTH
      output  logic                   iwf_avst_source_sop     , //Output    1
      output  logic                   iwf_avst_source_eop     , //Output    1
      output  logic [EWIDTH-1:0]      iwf_avst_source_empty   , //Output    EWIDTH
      output  logic                   iwf_avst_source_error   , //Output    1
      input   logic                   iwf_avst_source_ready   , //Input     1

      input  logic                    iwf_avst_sink_valid     , //Input     1
      input  logic [DATA_WIDTH-1:0]   iwf_avst_sink_data      , //Input     DATA_WIDTH
      input  logic                    iwf_avst_sink_sop       , //Input     1
      input  logic                    iwf_avst_sink_eop       , //Input     1
      input  logic [EWIDTH-1:0]       iwf_avst_sink_empty     , //Input     EWIDTH
      output logic                    iwf_avst_sink_ready     , //Output    1
      input  logic                    iwf_avst_sink_error     , //Input     1

      output  logic [15:0]            iwf_source_pkt_size     , //Output    16
      output  logic [15:0]            iwf_source_pkt_checksum , //Output    16
      output  logic                   iwf_source_concatenation, //Output    1
      output  logic [15:0]            iwf_source_pc_id        , //Output    16
      output  logic [15:0]            iwf_source_seq_id       , //Output    16
      output  logic [15:0]            iwf_source_rtc_id       , //Output    16
      output  logic [ 7:0]            iwf_source_msg_type     , //Output    8
      output  logic [15:0]            iwf_source_reset_id     , //Output    16
      output  logic [ 7:0]            iwf_source_reset_op     , //Output    8
      output  logic [ 7:0]            iwf_source_event_id     , //Output    8
      output  logic [ 7:0]            iwf_source_event_type   , //Output    8
      output  logic [ 7:0]            iwf_source_notif        , //Output    8

      input   logic [15:0]            iwf_sink_pc_id          , // Input    16
      input   logic [15:0]            iwf_sink_seq_id         , // Input    16
      input   logic [15:0]            iwf_sink_rtc_id         , // Input    16
      input   logic [ 7:0]            iwf_sink_msg_type       , // Input    8
      input   logic [15:0]            iwf_sink_reset_id       , // Input    16
      input   logic [ 7:0]            iwf_sink_reset_op       , // Input    8
      input   logic [ 7:0]            iwf_sink_event_id       , // Input    8
      input   logic [ 7:0]            iwf_sink_event_type       // Input    8
);

localparam ECPRI_IWF_CONNECT = 0; //only support value 0
localparam LINE_RATE         = IWF_CPRI_LINE_RATE;

generate
   if (IWF_SUPPORT == "OFF") begin
      ecpri_top #(
         .DEVICE_FAMILY          (DEVICE_FAMILY),
         .IP_VERSION             (IP_VERSION),
         .PROTOCOL_REVISION      (PROTOCOL_REVISION),
         .IWF_SUPPORT            (IWF_SUPPORT),
         .IWF_TYPE               (IWF_TYPE),
         .FRAGMENTATION          (FRAGMENTATION),
         .DELAY_MEASUREMENT      (DELAY_MEASUREMENT),
         .ONE_STEP_DELAY         (ONE_STEP_DELAY),
         .TS_FINGERPRINT_WIDTH   (TS_FINGERPRINT_WIDTH),
         .PTP_TS_FP_WIDTH        (PTP_TS_FP_WIDTH),
         .INTEL_ORAN             (INTEL_ORAN),
         .OOO_SEQ_CHK            (OOO_SEQ_CHK),
         .ETH_MTU                (ETH_MTU),
         .MAC_VLAN_EN            (MAC_VLAN_EN),
         .MAC_TCP_EN             (MAC_TCP_EN),
         .BITSPERSYMBOL          (BITSPERSYMBOL),
         .SYMBOLSPERBEAT         (SYMBOLSPERBEAT),
         .TXINS_READY_LATENCY    (TXINS_READY_LATENCY),
         .TX_ERROR_WIDTH         (TX_ERROR_WIDTH),
         .RX_ERROR_WIDTH         (RX_ERROR_WIDTH),
         .DATA_WIDTH             (DATA_WIDTH),
         .NOCT                   (NOCT),
         .EWIDTH                 (EWIDTH),
         .ETH_25G_PTP            (ETH_25G_PTP),
         .LL10G_PTP              (LL10G_PTP),
         .EHIP_PTP               (EHIP_PTP),
         .READY_LATENCY          (READY_LATENCY),
         .EXT_SOURCE_FIFO_DEPTH  (EXT_SOURCE_FIFO_DEPTH  ),
         .EXT_SINK_0_DFIFO_DEPTH (EXT_SINK_0_DFIFO_DEPTH),
         .EXT_SINK_1_DFIFO_DEPTH (EXT_SINK_1_DFIFO_DEPTH),
         .NUMBER_EXT_SINK_INT    (NUMBER_EXT_SINK_INT),
         .ECC_ENABLE             (ECC_ENABLE),
         .IPV4_ENABLE            (IPV4_ENABLE),
         .IPV6_ENABLE            (IPV6_ENABLE),
         .MSG4_MODE              (MSG4_MODE),
         .ADV_MAP                (ADV_MAP),
         .MSG4_TIMER_EN          (MSG4_TIMER_EN),
         .MSG6_TIMER_EN          (MSG6_TIMER_EN),
         .MSG4_TIMER_WIDTH       (MSG4_TIMER_WIDTH),
         .MSG5_TIMER_WIDTH       (MSG5_TIMER_WIDTH),
         .MSG6_TIMER_WIDTH       (MSG6_TIMER_WIDTH),
         .SRC_MAC_ADDR0          (SRC_MAC_ADDR0),
         .DEST_MAC_ADDR0         (DEST_MAC_ADDR0),
         .DEST_MAC_ADDR1         (DEST_MAC_ADDR1),
         .DEST_MAC_ADDR2         (DEST_MAC_ADDR2),
         .DEST_MAC_ADDR3         (DEST_MAC_ADDR3),
         .DEST_MAC_ADDR4         (DEST_MAC_ADDR4),
         .DEST_MAC_ADDR5         (DEST_MAC_ADDR5),
         .DEST_MAC_ADDR6         (DEST_MAC_ADDR6),
         .DEST_MAC_ADDR7         (DEST_MAC_ADDR7),
         .VID_ADDR_DF            (VID_ADDR_DF),
         .MATCH_MACADDR_VLANID   (MATCH_MACADDR_VLANID),
         .TX_ARBITRATION_SCHEME  (TX_ARBITRATION_SCHEME),
         .ARB_QUEUE_0_DEPTH      (ARB_QUEUE_0_DEPTH),
         .ARB_QUEUE_1_DEPTH      (ARB_QUEUE_1_DEPTH),
         .ARB_QUEUE_2_DEPTH      (ARB_QUEUE_2_DEPTH),
         .ARB_QUEUE_3_DEPTH      (ARB_QUEUE_3_DEPTH),
         .ARB_QUEUE_4_DEPTH      (ARB_QUEUE_4_DEPTH),
         .ARB_QUEUE_5_DEPTH      (ARB_QUEUE_5_DEPTH),
         .ARB_QUEUE_6_DEPTH      (ARB_QUEUE_6_DEPTH),
         .ARB_QUEUE_7_DEPTH      (ARB_QUEUE_7_DEPTH)
      ) ecpri_top_connect (
         .mac_clk_tx                                      (mac_clk_tx                                     ),
         .mac_clk_rx                                      (mac_clk_rx                                     ),
         .clk_tx                                          (clk_tx                                         ),
         .clk_rx                                          (clk_rx                                         ),
         .clk_csr                                         (clk_csr                                        ),
         .ext_sink_clk                                    (ext_sink_clk                                   ),
         .rst_tx_n                                        (rst_tx_n                                       ),
         .rst_rx_n                                        (rst_rx_n                                       ),
         .rst_csr_n                                       (rst_csr_n                                      ),
         .err_interrupt                                   (err_interrupt                                  ),
         .mac_sink_ready                                  (mac_sink_ready                                 ),
         .mac_sink_valid                                  (mac_sink_valid                                 ),
         .mac_sink_data                                   (mac_sink_data                                  ),
         .mac_sink_sop                                    (mac_sink_sop                                   ),
         .mac_sink_eop                                    (mac_sink_eop                                   ),
         .mac_sink_empty                                  (mac_sink_empty                                 ),
         .mac_sink_error                                  (mac_sink_error                                 ),
         /*Replace with ext sink 0 and ext sink 1
         .ext_sink_sop                                    (ext_sink_sop                                   ),
         .ext_sink_eop                                    (ext_sink_eop                                   ),
         .ext_sink_valid                                  (ext_sink_valid                                 ),
         .ext_sink_data                                   (ext_sink_data                                  ),
         .ext_sink_empty                                  (ext_sink_empty                                 ),
         .ext_sink_error                                  (ext_sink_error                                 ),
         .ext_sink_ready                                  (ext_sink_ready                                 ),
         .ext_ptp_timestamp_request_fingerprint           (ext_ptp_timestamp_request_fingerprint          ),
         .ext_tx_ingress_timestamp_96b_data               (ext_tx_ingress_timestamp_96b_data              ),
         .ext_tx_egress_timestamp_96b_valid               (ext_tx_egress_timestamp_96b_valid              ),
         .ext_tx_egress_timestamp_96b_data                (ext_tx_egress_timestamp_96b_data               ),
         .ext_tx_egress_timestamp_96b_fingerprint         (ext_tx_egress_timestamp_96b_fingerprint        ),
         */
         .ext_sink_0_sop                                  (ext_sink_0_sop                                 ),
         .ext_sink_0_eop                                  (ext_sink_0_eop                                 ),
         .ext_sink_0_valid                                (ext_sink_0_valid                               ),
         .ext_sink_0_data                                 (ext_sink_0_data                                ),
         .ext_sink_0_empty                                (ext_sink_0_empty                               ),
         .ext_sink_0_error                                (ext_sink_0_error                               ),
         .ext_sink_0_ready                                (ext_sink_0_ready                               ),
         .ext_sink_0_timestamp_request_fingerprint        (ext_sink_0_timestamp_request_fingerprint       ),
         .ext_sink_0_timestamp_request_valid              (ext_sink_0_timestamp_request_valid             ),
         .ext_sink_0_tx_ingress_timestamp_96b_data        (ext_sink_0_tx_ingress_timestamp_96b_data       ),
         .ext_sink_0_tx_egress_timestamp_96b_valid        (ext_sink_0_tx_egress_timestamp_96b_valid       ),
         .ext_sink_0_tx_egress_timestamp_96b_data         (ext_sink_0_tx_egress_timestamp_96b_data        ),
         .ext_sink_0_tx_egress_timestamp_96b_fingerprint  (ext_sink_0_tx_egress_timestamp_96b_fingerprint ),

         .ext_sink_1_sop                                  (ext_sink_1_sop                                 ),
         .ext_sink_1_eop                                  (ext_sink_1_eop                                 ),
         .ext_sink_1_valid                                (ext_sink_1_valid                               ),
         .ext_sink_1_data                                 (ext_sink_1_data                                ),
         .ext_sink_1_empty                                (ext_sink_1_empty                               ),
         .ext_sink_1_error                                (ext_sink_1_error                               ),
         .ext_sink_1_ready                                (ext_sink_1_ready                               ),
         .ext_sink_1_timestamp_request_fingerprint        (ext_sink_1_timestamp_request_fingerprint       ),
         .ext_sink_1_timestamp_request_valid              (ext_sink_1_timestamp_request_valid             ),
         .ext_sink_1_tx_ingress_timestamp_96b_data        (ext_sink_1_tx_ingress_timestamp_96b_data       ),
         .ext_sink_1_tx_egress_timestamp_96b_valid        (ext_sink_1_tx_egress_timestamp_96b_valid       ),
         .ext_sink_1_tx_egress_timestamp_96b_data         (ext_sink_1_tx_egress_timestamp_96b_data        ),
         .ext_sink_1_tx_egress_timestamp_96b_fingerprint  (ext_sink_1_tx_egress_timestamp_96b_fingerprint ),

         .ext_source_sop                                  (ext_source_sop                                 ),
         .ext_source_eop                                  (ext_source_eop                                 ),
         .ext_source_valid                                (ext_source_valid                               ),
         .ext_source_data                                 (ext_source_data                                ),
         .ext_source_empty                                (ext_source_empty                               ),
         .ext_source_error                                (ext_source_error                               ),
         .ext_source_pkt_type                             (ext_source_pkt_type                            ),
         .mac_source_valid                                (mac_source_valid                               ),
         .mac_source_data                                 (mac_source_data                                ),
         .mac_source_sop                                  (mac_source_sop                                 ),
         .mac_source_eop                                  (mac_source_eop                                 ),
         .mac_source_empty                                (mac_source_empty                               ),
         .mac_source_ready                                (mac_source_ready                               ),
         .mac_source_error                                (mac_source_error                               ),
         .avst_sink_valid                                 (avst_sink_valid                                ),
         .avst_sink_data                                  (avst_sink_data                                 ),
         .avst_sink_sop                                   (avst_sink_sop                                  ),
         .avst_sink_eop                                   (avst_sink_eop                                  ),
         .avst_sink_empty                                 (avst_sink_empty                                ),
         .avst_sink_ready                                 (avst_sink_ready                                ),
         .avst_sink_error                                 (avst_sink_error                                ),
         .sink_pc_id                                      (sink_pc_id                                     ),
         .sink_seq_id                                     (sink_seq_id                                    ),
         .sink_rtc_id                                     (sink_rtc_id                                    ),
         .sink_concatenation                              (sink_concatenation                             ),
         .sink_msg_type                                   (sink_msg_type                                  ),
         .sink_mem_acc_id                                 (sink_mem_acc_id                                ),
         .sink_op_type                                    (sink_op_type                                   ),
         .sink_element_id                                 (sink_element_id                                ),
         .sink_address                                    (sink_address                                   ),
         .sink_length                                     (sink_length                                    ),
         .sink_reset_id                                   (sink_reset_id                                  ),
         .sink_reset_op                                   (sink_reset_op                                  ),
         .sink_event_id                                   (sink_event_id                                  ),
         .sink_event_type                                 (sink_event_type                                ),
         .sink_pkt_size                                   (sink_pkt_size                                  ),
         .sink_pkt_checksum                               (sink_pkt_checksum                              ),
         .tx_transport_c_u                                (tx_transport_c_u                               ),
         .avst_source_valid                               (avst_source_valid                              ),
         .avst_source_data                                (avst_source_data                               ),
         .avst_source_sop                                 (avst_source_sop                                ),
         .avst_source_eop                                 (avst_source_eop                                ),
         .avst_source_empty                               (avst_source_empty                              ),
         .avst_source_error                               (avst_source_error                              ),
         .source_pc_id                                    (source_pc_id                                   ),
         .source_seq_id                                   (source_seq_id                                  ),
         .source_rtc_id                                   (source_rtc_id                                  ),
         .source_msg_type                                 (source_msg_type                                ),
         .source_concatenation                            (source_concatenation                           ),
         .source_mem_acc_id                               (source_mem_acc_id                              ),
         .source_op_type                                  (source_op_type                                 ),
         .source_element_id                               (source_element_id                              ),
         .source_address                                  (source_address                                 ),
         .source_length                                   (source_length                                  ),
         .source_reset_id                                 (source_reset_id                                ),
         .source_reset_op                                 (source_reset_op                                ),
         .source_event_id                                 (source_event_id                                ),
         .source_event_type                               (source_event_type                              ),
         .source_notif                                    (source_notif                                   ),
         .rx_transport_c_u                                (rx_transport_c_u                               ),
         .ptp_offset_timestamp                            (ptp_offset_timestamp                           ),
         .ptp_offset_correction_field                     (ptp_offset_correction_field                    ),
         .ptp_timestamp_insert                            (ptp_timestamp_insert                           ),
         .ptp_tx_etstamp_ins_ctrl_residence_time_update   (ptp_tx_etstamp_ins_ctrl_residence_time_update  ),
         .ptp_timestamp_request_fingerprint               (ptp_timestamp_request_fingerprint              ),
         .ptp_timestamp_request_valid                     (ptp_timestamp_request_valid                    ),

         .tx_queue_0_fifo_full                            (tx_queue_0_fifo_full                           ),
         .tx_queue_1_fifo_full                            (tx_queue_1_fifo_full                           ),
         .tx_queue_2_fifo_full                            (tx_queue_2_fifo_full                           ),
         .tx_queue_3_fifo_full                            (tx_queue_3_fifo_full                           ),
         .tx_queue_4_fifo_full                            (tx_queue_4_fifo_full                           ),
         .tx_queue_5_fifo_full                            (tx_queue_5_fifo_full                           ),
         .tx_queue_6_fifo_full                            (tx_queue_6_fifo_full                           ),
         .tx_queue_7_fifo_full                            (tx_queue_7_fifo_full                           ),
         .tx_lanes_stable                                 (tx_lanes_stable                                ),
         .rx_pcs_ready                                    (rx_pcs_ready                                   ),
         .tx_etstamp_ins_ctrl_timestamp_format            (tx_etstamp_ins_ctrl_timestamp_format           ),
         .tx_etstamp_ins_ctrl_residence_time_calc_format  (tx_etstamp_ins_ctrl_residence_time_calc_format ),
         .tx_etstamp_ins_ctrl_offset_checksum_field       (tx_etstamp_ins_ctrl_offset_checksum_field      ),
         .tx_etstamp_ins_ctrl_offset_checksum_correction  (tx_etstamp_ins_ctrl_offset_checksum_correction ),
         .tx_etstamp_ins_ctrl_ingress_timestamp_96b       (tx_etstamp_ins_ctrl_ingress_timestamp_96b      ),
         .tx_etstamp_ins_ctrl_checksum_zero               (tx_etstamp_ins_ctrl_checksum_zero              ),
         .tx_etstamp_ins_ctrl_checksum_correct            (tx_etstamp_ins_ctrl_checksum_correct           ),
         .tx_egress_timestamp_96b_valid                   (tx_egress_timestamp_96b_valid                  ),
         .tx_egress_timestamp_96b_data                    (tx_egress_timestamp_96b_data                   ),
         .tx_egress_timestamp_96b_fingerprint             (tx_egress_timestamp_96b_fingerprint            ),
         .rx_ingress_timestamp_96b_valid                  (rx_ingress_timestamp_96b_valid                 ),
         .rx_ingress_timestamp_96b_data                   (rx_ingress_timestamp_96b_data                  ),
         .ext_rx_ingress_timestamp_96b_data               (ext_rx_ingress_timestamp_96b_data              ),
         .rx_tod_time_of_day_96b_data                     (rx_tod_time_of_day_96b_data                    ),
         .tx_tod_time_of_day_96b_data                     (tx_tod_time_of_day_96b_data                    ),
         .ptp_tx_ingress_timestamp_96b_data               (ptp_tx_ingress_timestamp_96b_data              ),
         .csr_writedata                                   (csr_writedata                                  ),
         .csr_write                                       (csr_write                                      ),
         .csr_readdata                                    (csr_readdata                                   ),
         .csr_readdatavalid                               (csr_readdatavalid                              ),
         .csr_waitrequest                                 (csr_waitrequest                                ),
         .csr_read                                        (csr_read                                       ),
         .csr_address                                     (csr_address                                    )
      );

      // Port 0
      assign iq64_tx_valid0 = 8'd0;
      assign iq64_tx_data0  = 64'd0;
      assign iq32_tx_valid0 = 4'd0;
      assign iq32_tx_data0  = 32'd0;

      assign ctrl64_axc_tx_valid0 = 8'd0;
      assign ctrl64_axc_tx_data0  = 64'd0;
      assign ctrl32_axc_tx_valid0 = 4'd0;
      assign ctrl32_axc_tx_data0  = 32'd0;   

      assign vs64_tx_valid0 = 8'd0;
      assign vs64_tx_data0  = 64'd0;
      assign vs32_tx_valid0 = 4'd0;
      assign vs32_tx_data0  = 32'd0;

      assign rtvs64_tx_valid0 = 2'd0;
      assign rtvs64_tx_data0  = 64'd0;
      assign rtvs32_tx_valid0 = 1'b0;
      assign rtvs32_tx_data0  = 32'd0;   

      assign gmii_txen0 = 1'b0;
      assign gmii_txer0 = 1'b0;
      assign gmii_txd0  = 8'd0;

      assign gmii_rxclk0      = '0;
      assign gmii_rxclk1      = '0;
      assign gmii_rxclk2      = '0;
      assign gmii_rxclk3      = '0;
      assign gmii_rxreset_n0  = '0;
      assign gmii_rxreset_n1  = '0;
      assign gmii_rxreset_n2  = '0;
      assign gmii_rxreset_n3  = '0;
      assign gmii_txclk0      = '0;
      assign gmii_txclk1      = '0;
      assign gmii_txclk2      = '0;
      assign gmii_txclk3      = '0;
      assign gmii_txreset_n0  = '0;
      assign gmii_txreset_n1  = '0;
      assign gmii_txreset_n2  = '0;
      assign gmii_txreset_n3  = '0;
      assign rst_rx_n_sync    = '0;
      assign rst_tx_n_sync    = '0;

      assign iwf_gmii_rxdv0          = 1'b0;
      assign iwf_gmii_rxer0          = 1'b0;
      assign iwf_gmii_rxd0           = 8'd0;
      assign iwf_gmii_rxfifo_status0 = 4'd0;
      assign iwf_gmii_txfifo_status0 = 4'd0;

      //assign cpri_hfn_out0      = 8'd0;
      //assign cpri_hfn_in_valid0 = 1'b0;
      //assign cpri_bfn_out0      = 12'd0;
      //assign cpri_bfn_in_valid0 = 1'b0;
      assign cpri_sdi_assert0   = 1'b0;
      assign cpri_reset_assert0 = 1'b0;

      // Port 1
      assign iq64_tx_valid1 = 8'd0;
      assign iq64_tx_data1  = 64'd0;
      assign iq32_tx_valid1 = 4'd0;
      assign iq32_tx_data1  = 32'd0;

      assign ctrl64_axc_tx_valid1 = 8'd0;
      assign ctrl64_axc_tx_data1  = 64'd0;
      assign ctrl32_axc_tx_valid1 = 4'd0;
      assign ctrl32_axc_tx_data1  = 32'd0;   

      assign vs64_tx_valid1 = 8'd0;
      assign vs64_tx_data1  = 64'd0;
      assign vs32_tx_valid1 = 4'd0;
      assign vs32_tx_data1  = 32'd0;

      assign rtvs64_tx_valid1 = 2'd0;
      assign rtvs64_tx_data1  = 64'd0;
      assign rtvs32_tx_valid1 = 1'b0;
      assign rtvs32_tx_data1  = 32'd0;   

      assign gmii_txen1 = 1'b0;
      assign gmii_txer1 = 1'b0;
      assign gmii_txd1  = 8'd0;

      assign iwf_gmii_rxdv1          = 1'b0;
      assign iwf_gmii_rxer1          = 1'b0;
      assign iwf_gmii_rxd1           = 8'd0;
      assign iwf_gmii_rxfifo_status1 = 4'd0;
      assign iwf_gmii_txfifo_status1 = 4'd0;

      //assign cpri_hfn_out1      = 8'd0;
      //assign cpri_hfn_in_valid1 = 1'b0;
      //assign cpri_bfn_out1      = 12'd0;
      //assign cpri_bfn_in_valid1 = 1'b0;
      assign cpri_sdi_assert1   = 1'b0;
      assign cpri_reset_assert1 = 1'b0;

      // Port 2
      assign iq64_tx_valid2 = 8'd0;
      assign iq64_tx_data2  = 64'd0;
      assign iq32_tx_valid2 = 4'd0;
      assign iq32_tx_data2  = 32'd0;

      assign ctrl64_axc_tx_valid2 = 8'd0;
      assign ctrl64_axc_tx_data2  = 64'd0;
      assign ctrl32_axc_tx_valid2 = 4'd0;
      assign ctrl32_axc_tx_data2  = 32'd0;   

      assign vs64_tx_valid2 = 8'd0;
      assign vs64_tx_data2  = 64'd0;
      assign vs32_tx_valid2 = 4'd0;
      assign vs32_tx_data2  = 32'd0;

      assign rtvs64_tx_valid2 = 2'd0;
      assign rtvs64_tx_data2  = 64'd0;
      assign rtvs32_tx_valid2 = 1'b0;
      assign rtvs32_tx_data2  = 32'd0;   

      assign gmii_txen2 = 1'b0;
      assign gmii_txer2 = 1'b0;
      assign gmii_txd2  = 8'd0;

      assign iwf_gmii_rxdv2          = 1'b0;
      assign iwf_gmii_rxer2          = 1'b0;
      assign iwf_gmii_rxd2           = 8'd0;
      assign iwf_gmii_rxfifo_status2 = 4'd0;
      assign iwf_gmii_txfifo_status2 = 4'd0;

      //assign cpri_hfn_out2      = 8'd0;
      //assign cpri_hfn_in_valid2 = 1'b0;
      //assign cpri_bfn_out2      = 12'd0;
      //assign cpri_bfn_in_valid2 = 1'b0;
      assign cpri_sdi_assert2   = 1'b0;
      assign cpri_reset_assert2 = 1'b0;

      // Port 3
      assign iq64_tx_valid3 = 8'd0;
      assign iq64_tx_data3  = 64'd0;
      assign iq32_tx_valid3 = 4'd0;
      assign iq32_tx_data3  = 32'd0;

      assign ctrl64_axc_tx_valid3 = 8'd0;
      assign ctrl64_axc_tx_data3  = 64'd0;
      assign ctrl32_axc_tx_valid3 = 4'd0;
      assign ctrl32_axc_tx_data3  = 32'd0;   

      assign vs64_tx_valid3 = 8'd0;
      assign vs64_tx_data3  = 64'd0;
      assign vs32_tx_valid3 = 4'd0;
      assign vs32_tx_data3  = 32'd0;

      assign rtvs64_tx_valid3 = 2'd0;
      assign rtvs64_tx_data3  = 64'd0;
      assign rtvs32_tx_valid3 = 1'b0;
      assign rtvs32_tx_data3  = 32'd0;   

      assign gmii_txen3 = 1'b0;
      assign gmii_txer3 = 1'b0;
      assign gmii_txd3  = 8'd0;

      assign iwf_gmii_rxdv3          = 1'b0;
      assign iwf_gmii_rxer3          = 1'b0;
      assign iwf_gmii_rxd3           = 8'd0;
      assign iwf_gmii_rxfifo_status3 = 4'd0;
      assign iwf_gmii_txfifo_status3 = 4'd0;

      //assign cpri_hfn_out3      = 8'd0;
      //assign cpri_hfn_in_valid3 = 1'b0;
      //assign cpri_bfn_out3      = 12'd0;
      //assign cpri_bfn_in_valid3 = 1'b0;
      assign cpri_sdi_assert3   = 1'b0;
      assign cpri_reset_assert3 = 1'b0;

      // Common
      assign iwf_avst_source_valid = 1'b0;
      assign iwf_avst_source_data  = {DATA_WIDTH{1'b0}};
      assign iwf_avst_source_sop   = 1'b0;
      assign iwf_avst_source_eop   = 1'b0;
      assign iwf_avst_source_empty = {EWIDTH{1'b0}};
      assign iwf_avst_source_error = 1'b0;

      assign iwf_avst_sink_ready = 1'b0;

      assign iwf_source_pkt_size      = 16'd0;
      assign iwf_source_pkt_checksum  = 16'd0;
      assign iwf_source_concatenation = 1'b0;
      assign iwf_source_pc_id         = 16'd0;
      assign iwf_source_seq_id        = 16'd0;
      assign iwf_source_rtc_id        = 16'd0;
      assign iwf_source_msg_type      = 8'd0;
      assign iwf_source_reset_id      = 16'd0;
      assign iwf_source_reset_op      = 8'd0;
      assign iwf_source_event_id      = 8'd0;
      assign iwf_source_event_type    = 8'd0;
      assign iwf_source_notif         = 8'd0;
   end else if (IWF_SUPPORT == "ON" && ECPRI_IWF_CONNECT == 1) begin //Keeping old code and currently this block is unusable
      logic                  avst_iwf_valid;
      logic [DATA_WIDTH-1:0] avst_iwf_data;
      logic                  avst_iwf_sop;
      logic                  avst_iwf_eop;
      logic [EWIDTH-1:0]     avst_iwf_empty;
      logic                  avst_iwf_error;

      logic                  avst_ecpri_valid;
      logic [DATA_WIDTH-1:0] avst_ecpri_data;
      logic                  avst_ecpri_sop;
      logic                  avst_ecpri_eop;
      logic [EWIDTH-1:0]     avst_ecpri_empty;
      logic                  avst_ecpri_error;

      logic [15:0] iwf_pkt_size;
      logic [15:0] iwf_pkt_checksum;
      logic        iwf_concatenation;
      logic [31:0] iwf_pc_id;
      logic [31:0] iwf_seq_id;
      logic [15:0] iwf_rtc_id;
      logic [7:0]  iwf_msg_type;
      logic [15:0] iwf_reset_id;
      logic [7:0]  iwf_reset_op;
      logic [7:0]  iwf_event_id;
      logic [7:0]  iwf_event_type;

      logic [31:0] ecpri_pc_id;
      logic [31:0] ecpri_seq_id;
      logic [15:0] ecpri_rtc_id;
      logic [7:0]  ecpri_msg_type;
      logic [15:0] ecpri_reset_id;
      logic [7:0]  ecpri_reset_op;
      logic [7:0]  ecpri_event_id;
      logic [7:0]  ecpri_event_type;

      logic [31:0] ecpri_csr_writedata;
      logic        ecpri_csr_write;
      logic [31:0] ecpri_csr_readdata;
      logic        ecpri_csr_readdatavalid;
      logic        ecpri_csr_waitrequest;
      logic        ecpri_csr_read;
      logic [15:0] ecpri_csr_address;

      logic [31:0] iwf_csr_writedata;
      logic        iwf_csr_write;
      logic [31:0] iwf_csr_readdata;
      logic        iwf_csr_readdatavalid;
      logic        iwf_csr_waitrequest;
      logic        iwf_csr_read;
      logic [15:0] iwf_csr_address;

      ecpri_top #(
         .DEVICE_FAMILY          (DEVICE_FAMILY),
         .IP_VERSION             (IP_VERSION),
         .PROTOCOL_REVISION      (PROTOCOL_REVISION),
         .IWF_SUPPORT            (IWF_SUPPORT),
         .IWF_TYPE               (IWF_TYPE),
         .FRAGMENTATION          (FRAGMENTATION),
         .DELAY_MEASUREMENT      (DELAY_MEASUREMENT),
         .ONE_STEP_DELAY         (ONE_STEP_DELAY),
         .TS_FINGERPRINT_WIDTH   (TS_FINGERPRINT_WIDTH),
         .PTP_TS_FP_WIDTH        (PTP_TS_FP_WIDTH),
         .INTEL_ORAN             (INTEL_ORAN),
         .OOO_SEQ_CHK            (OOO_SEQ_CHK),
         .ETH_MTU                (ETH_MTU),
         .MAC_VLAN_EN            (MAC_VLAN_EN),
         .MAC_TCP_EN             (MAC_TCP_EN),
         .BITSPERSYMBOL          (BITSPERSYMBOL),
         .SYMBOLSPERBEAT         (SYMBOLSPERBEAT),
         .TXINS_READY_LATENCY    (TXINS_READY_LATENCY),
         .TX_ERROR_WIDTH         (TX_ERROR_WIDTH),
         .RX_ERROR_WIDTH         (RX_ERROR_WIDTH),
         .DATA_WIDTH             (DATA_WIDTH),
         .NOCT                   (NOCT),
         .EWIDTH                 (EWIDTH),
         .ETH_25G_PTP            (ETH_25G_PTP),
         .LL10G_PTP              (LL10G_PTP),
         .EHIP_PTP               (EHIP_PTP),
         .READY_LATENCY          (READY_LATENCY),
         .EXT_SOURCE_FIFO_DEPTH  (EXT_SOURCE_FIFO_DEPTH  ),
         .EXT_SINK_0_DFIFO_DEPTH (EXT_SINK_0_DFIFO_DEPTH),
         .EXT_SINK_1_DFIFO_DEPTH (EXT_SINK_1_DFIFO_DEPTH),
         .NUMBER_EXT_SINK_INT    (NUMBER_EXT_SINK_INT),         
         .ECC_ENABLE             (ECC_ENABLE),
         .IPV4_ENABLE            (IPV4_ENABLE),
         .IPV6_ENABLE            (IPV6_ENABLE),
         .MSG4_MODE              (MSG4_MODE),
         .ADV_MAP                (ADV_MAP),
         .MSG4_TIMER_EN          (MSG4_TIMER_EN),
         .MSG6_TIMER_EN          (MSG6_TIMER_EN),
         .MSG4_TIMER_WIDTH       (MSG4_TIMER_WIDTH),
         .MSG5_TIMER_WIDTH       (MSG5_TIMER_WIDTH),
         .MSG6_TIMER_WIDTH       (MSG6_TIMER_WIDTH),
         .SRC_MAC_ADDR0          (SRC_MAC_ADDR0),
         .DEST_MAC_ADDR0         (DEST_MAC_ADDR0),
         .DEST_MAC_ADDR1         (DEST_MAC_ADDR1),
         .DEST_MAC_ADDR2         (DEST_MAC_ADDR2),
         .DEST_MAC_ADDR3         (DEST_MAC_ADDR3),
         .DEST_MAC_ADDR4         (DEST_MAC_ADDR4),
         .DEST_MAC_ADDR5         (DEST_MAC_ADDR5),
         .DEST_MAC_ADDR6         (DEST_MAC_ADDR6),
         .DEST_MAC_ADDR7         (DEST_MAC_ADDR7),
         .VID_ADDR_DF            (VID_ADDR_DF),
         .MATCH_MACADDR_VLANID   (MATCH_MACADDR_VLANID),
         .TX_ARBITRATION_SCHEME  (TX_ARBITRATION_SCHEME),
         .ARB_QUEUE_0_DEPTH      (ARB_QUEUE_0_DEPTH),
         .ARB_QUEUE_1_DEPTH      (ARB_QUEUE_1_DEPTH),
         .ARB_QUEUE_2_DEPTH      (ARB_QUEUE_2_DEPTH),
         .ARB_QUEUE_3_DEPTH      (ARB_QUEUE_3_DEPTH),
         .ARB_QUEUE_4_DEPTH      (ARB_QUEUE_4_DEPTH),
         .ARB_QUEUE_5_DEPTH      (ARB_QUEUE_5_DEPTH),
         .ARB_QUEUE_6_DEPTH      (ARB_QUEUE_6_DEPTH),
         .ARB_QUEUE_7_DEPTH      (ARB_QUEUE_7_DEPTH)
      ) ecpri_top_connect (
         .mac_clk_tx                                      (mac_clk_tx                                     ),
         .mac_clk_rx                                      (mac_clk_rx                                     ),
         .clk_tx                                          (clk_tx                                         ),
         .clk_rx                                          (clk_rx                                         ),
         .clk_csr                                         (clk_csr                                        ),
         .ext_sink_clk                                    (ext_sink_clk                                   ),
         .rst_tx_n                                        (rst_tx_n                                       ),
         .rst_rx_n                                        (rst_rx_n                                       ),
         .tx_sync_rst_n                                   (rst_tx_n_sync                                  ),
         .rx_sync_rst_n                                   (rst_rx_n_sync                                  ),
         .rst_csr_n                                       (rst_csr_n                                      ),
         .err_interrupt                                   (err_interrupt                                  ),
         .mac_sink_ready                                  (mac_sink_ready                                 ),
         .mac_sink_valid                                  (mac_sink_valid                                 ),
         .mac_sink_data                                   (mac_sink_data                                  ),
         .mac_sink_sop                                    (mac_sink_sop                                   ),
         .mac_sink_eop                                    (mac_sink_eop                                   ),
         .mac_sink_empty                                  (mac_sink_empty                                 ),
         .mac_sink_error                                  (mac_sink_error                                 ),
                  /*Replace with ext sink 0 and ext sink 1
         .ext_sink_sop                                    (ext_sink_sop                                   ),
         .ext_sink_eop                                    (ext_sink_eop                                   ),
         .ext_sink_valid                                  (ext_sink_valid                                 ),
         .ext_sink_data                                   (ext_sink_data                                  ),
         .ext_sink_empty                                  (ext_sink_empty                                 ),
         .ext_sink_error                                  (ext_sink_error                                 ),
         .ext_sink_ready                                  (ext_sink_ready                                 ),
         .ext_ptp_timestamp_request_fingerprint           (ext_ptp_timestamp_request_fingerprint          ),
         .ext_tx_ingress_timestamp_96b_data               (ext_tx_ingress_timestamp_96b_data              ),
         .ext_tx_egress_timestamp_96b_valid               (ext_tx_egress_timestamp_96b_valid              ),
         .ext_tx_egress_timestamp_96b_data                (ext_tx_egress_timestamp_96b_data               ),
         .ext_tx_egress_timestamp_96b_fingerprint         (ext_tx_egress_timestamp_96b_fingerprint        ),
         */
         .ext_sink_0_sop                                  (ext_sink_0_sop                                 ),
         .ext_sink_0_eop                                  (ext_sink_0_eop                                 ),
         .ext_sink_0_valid                                (ext_sink_0_valid                               ),
         .ext_sink_0_data                                 (ext_sink_0_data                                ),
         .ext_sink_0_empty                                (ext_sink_0_empty                               ),
         .ext_sink_0_error                                (ext_sink_0_error                               ),
         .ext_sink_0_ready                                (ext_sink_0_ready                               ),
         .ext_sink_0_timestamp_request_fingerprint        (ext_sink_0_timestamp_request_fingerprint       ),
         .ext_sink_0_timestamp_request_valid              (ext_sink_0_timestamp_request_valid             ),
         .ext_sink_0_tx_ingress_timestamp_96b_data        (ext_sink_0_tx_ingress_timestamp_96b_data       ),
         .ext_sink_0_tx_egress_timestamp_96b_valid        (ext_sink_0_tx_egress_timestamp_96b_valid       ),
         .ext_sink_0_tx_egress_timestamp_96b_data         (ext_sink_0_tx_egress_timestamp_96b_data        ),
         .ext_sink_0_tx_egress_timestamp_96b_fingerprint  (ext_sink_0_tx_egress_timestamp_96b_fingerprint ),

         .ext_sink_1_sop                                  (ext_sink_1_sop                                 ),
         .ext_sink_1_eop                                  (ext_sink_1_eop                                 ),
         .ext_sink_1_valid                                (ext_sink_1_valid                               ),
         .ext_sink_1_data                                 (ext_sink_1_data                                ),
         .ext_sink_1_empty                                (ext_sink_1_empty                               ),
         .ext_sink_1_error                                (ext_sink_1_error                               ),
         .ext_sink_1_ready                                (ext_sink_1_ready                               ),
         .ext_sink_1_timestamp_request_fingerprint        (ext_sink_1_timestamp_request_fingerprint       ),
         .ext_sink_1_timestamp_request_valid              (ext_sink_1_timestamp_request_valid             ),
         .ext_sink_1_tx_ingress_timestamp_96b_data        (ext_sink_1_tx_ingress_timestamp_96b_data       ),
         .ext_sink_1_tx_egress_timestamp_96b_valid        (ext_sink_1_tx_egress_timestamp_96b_valid       ),
         .ext_sink_1_tx_egress_timestamp_96b_data         (ext_sink_1_tx_egress_timestamp_96b_data        ),
         .ext_sink_1_tx_egress_timestamp_96b_fingerprint  (ext_sink_1_tx_egress_timestamp_96b_fingerprint ),

         .ext_source_sop                                  (ext_source_sop                                 ),
         .ext_source_eop                                  (ext_source_eop                                 ),
         .ext_source_valid                                (ext_source_valid                               ),
         .ext_source_data                                 (ext_source_data                                ),
         .ext_source_empty                                (ext_source_empty                               ),
         .ext_source_error                                (ext_source_error                               ),
         .mac_source_valid                                (mac_source_valid                               ),
         .mac_source_data                                 (mac_source_data                                ),
         .mac_source_sop                                  (mac_source_sop                                 ),
         .mac_source_eop                                  (mac_source_eop                                 ),
         .mac_source_empty                                (mac_source_empty                               ),
         .mac_source_ready                                (mac_source_ready                               ),
         .mac_source_error                                (mac_source_error                               ),
         .avst_sink_valid                                 (avst_iwf_valid                                 ),
         .avst_sink_data                                  (avst_iwf_data                                  ),
         .avst_sink_sop                                   (avst_iwf_sop                                   ),
         .avst_sink_eop                                   (avst_iwf_eop                                   ),
         .avst_sink_empty                                 (avst_iwf_empty                                 ),
         .avst_sink_ready                                 (/*left unconnected*/                           ),
         .avst_sink_error                                 (avst_iwf_error                                 ),
         .sink_pc_id                                      (iwf_pc_id                                      ),
         .sink_seq_id                                     (iwf_seq_id                                     ),
         .sink_rtc_id                                     (iwf_rtc_id                                     ),
         .sink_concatenation                              (iwf_concatenation                              ),
         .sink_msg_type                                   (sink_msg_type                                  ),
         .sink_mem_acc_id                                 (sink_mem_acc_id                                ),
         .sink_op_type                                    (sink_op_type                                   ),
         .sink_element_id                                 (sink_element_id                                ),
         .sink_address                                    (sink_address                                   ),
         .sink_length                                     (sink_length                                    ),
         .sink_reset_id                                   (iwf_reset_id                                   ),
         .sink_reset_op                                   (iwf_reset_op                                   ),
         .sink_event_id                                   (iwf_event_id                                   ),
         .sink_event_type                                 (iwf_event_type                                 ),
         .sink_pkt_size                                   (iwf_pkt_size                                   ),
         .sink_pkt_checksum                               (iwf_pkt_checksum                               ),
         .tx_transport_c_u                                (tx_transport_c_u                               ),
         .avst_source_valid                               (avst_ecpri_valid                               ),
         .avst_source_data                                (avst_ecpri_data                                ),
         .avst_source_sop                                 (avst_ecpri_sop                                 ),
         .avst_source_eop                                 (avst_ecpri_eop                                 ),
         .avst_source_empty                               (avst_ecpri_empty                               ),
         .avst_source_error                               (avst_ecpri_error                               ),
         .source_pc_id                                    (ecpri_pc_id                                    ),
         .source_seq_id                                   (ecpri_seq_id                                   ),
         .source_rtc_id                                   (ecpri_rtc_id                                   ),
         .source_msg_type                                 (ecpri_msg_type                                 ),
         .source_concatenation                            (/*left unconnected*/                           ),
         .source_mem_acc_id                               (source_mem_acc_id                              ),
         .source_op_type                                  (source_op_type                                 ),
         .source_element_id                               (source_element_id                              ),
         .source_address                                  (source_address                                 ),
         .source_length                                   (source_length                                  ),
         .source_reset_id                                 (ecpri_reset_id                                 ),
         .source_reset_op                                 (ecpri_reset_op                                 ),
         .source_event_id                                 (ecpri_event_id                                 ),
         .source_event_type                               (ecpri_event_type                               ),
         .source_notif                                    (source_notif                                   ),
         .rx_transport_c_u                                (rx_transport_c_u                               ),
         .ptp_offset_timestamp                            (ptp_offset_timestamp                           ),
         .ptp_offset_correction_field                     (ptp_offset_correction_field                    ),
         .ptp_timestamp_insert                            (ptp_timestamp_insert                           ),
         .ptp_tx_etstamp_ins_ctrl_residence_time_update   (ptp_tx_etstamp_ins_ctrl_residence_time_update  ),
         .ptp_timestamp_request_fingerprint               (ptp_timestamp_request_fingerprint              ),
         .ptp_timestamp_request_valid                     (ptp_timestamp_request_valid                    ),
         .tx_queue_0_fifo_full                            (tx_queue_0_fifo_full                           ),
         .tx_queue_1_fifo_full                            (tx_queue_1_fifo_full                           ),
         .tx_queue_2_fifo_full                            (tx_queue_2_fifo_full                           ),
         .tx_queue_3_fifo_full                            (tx_queue_3_fifo_full                           ),
         .tx_queue_4_fifo_full                            (tx_queue_4_fifo_full                           ),
         .tx_queue_5_fifo_full                            (tx_queue_5_fifo_full                           ),
         .tx_queue_6_fifo_full                            (tx_queue_6_fifo_full                           ),
         .tx_queue_7_fifo_full                            (tx_queue_7_fifo_full                           ),
         .tx_lanes_stable                                 (tx_lanes_stable                                ),
         .rx_pcs_ready                                    (rx_pcs_ready                                   ),
         .tx_etstamp_ins_ctrl_timestamp_format            (tx_etstamp_ins_ctrl_timestamp_format           ),
         .tx_etstamp_ins_ctrl_residence_time_calc_format  (tx_etstamp_ins_ctrl_residence_time_calc_format ),
         .tx_etstamp_ins_ctrl_offset_checksum_field       (tx_etstamp_ins_ctrl_offset_checksum_field      ),
         .tx_etstamp_ins_ctrl_offset_checksum_correction  (tx_etstamp_ins_ctrl_offset_checksum_correction ),
         .tx_etstamp_ins_ctrl_ingress_timestamp_96b       (tx_etstamp_ins_ctrl_ingress_timestamp_96b      ),
         .tx_etstamp_ins_ctrl_checksum_zero               (tx_etstamp_ins_ctrl_checksum_zero              ),
         .tx_etstamp_ins_ctrl_checksum_correct            (tx_etstamp_ins_ctrl_checksum_correct           ),
         .tx_egress_timestamp_96b_valid                   (tx_egress_timestamp_96b_valid                  ),
         .tx_egress_timestamp_96b_data                    (tx_egress_timestamp_96b_data                   ),
         .tx_egress_timestamp_96b_fingerprint             (tx_egress_timestamp_96b_fingerprint            ),
         .rx_ingress_timestamp_96b_valid                  (rx_ingress_timestamp_96b_valid                 ),
         .rx_ingress_timestamp_96b_data                   (rx_ingress_timestamp_96b_data                  ),
         .ext_rx_ingress_timestamp_96b_data               (ext_rx_ingress_timestamp_96b_data              ),
         .rx_tod_time_of_day_96b_data                     (rx_tod_time_of_day_96b_data                    ),
         .tx_tod_time_of_day_96b_data                     (tx_tod_time_of_day_96b_data                    ),
         .csr_writedata                                   (ecpri_csr_writedata                            ),
         .csr_write                                       (ecpri_csr_write                                ),
         .csr_readdata                                    (ecpri_csr_readdata                             ),
         .csr_readdatavalid                               (ecpri_csr_readdatavalid                        ),
         .csr_waitrequest                                 (ecpri_csr_waitrequest                          ),
         .csr_read                                        (ecpri_csr_read                                 ),
         .csr_address                                     (ecpri_csr_address                              )
      );

      iwf_wrapper #(
         .LINE_RATE     (LINE_RATE),
         .TILE_OPTION   (TILE),
         .DEVICE_FAMILY (DEVICE_FAMILY),
         .NUM_IWF_CPRI  (NUM_IWF_CPRI),
         .RDY_LATENCY   (RDY_LATENCY)
      ) iwf_top_connect (
        .tx_clk                 (clk_tx                 ),
        .rx_clk                 (clk_rx                 ),
      	.cpri_clkout            (cpri_clkout            ),
        .rst_tx_n               (iwf_rst_tx_n           ),
        .rst_rx_n               (iwf_rst_rx_n           ),
        /* CPRI IQ Data Rx Interface */
      	.iq64_rx_valid          (iq64_rx_valid          ),
      	.iq64_rx_data           (iq64_rx_data           ),
      	.iq64_tx_ready          (iq64_tx_ready          ),
      	.iq64_tx_valid          (iq64_tx_valid          ),
      	.iq64_tx_data           (iq64_tx_data           ),
      	.iq32_rx_valid          (iq32_rx_valid          ),
      	.iq32_rx_data           (iq32_rx_data           ),
      	.iq32_tx_ready          (iq32_tx_ready          ),
      	.iq32_tx_valid          (iq32_tx_valid          ),
      	.iq32_tx_data           (iq32_tx_data           ),
      	/* CPRI Ctrl_AxC Rx Interface */
      	.ctrl64_axc_rx_valid    (ctrl64_axc_rx_valid    ),
      	.ctrl64_axc_rx_data     (ctrl64_axc_rx_data     ),	
      	.ctrl64_axc_tx_ready    (ctrl64_axc_tx_ready    ),
      	.ctrl64_axc_tx_valid    (ctrl64_axc_tx_valid    ),
      	.ctrl64_axc_tx_data     (ctrl64_axc_tx_data     ),
      	.ctrl32_axc_rx_valid    (ctrl32_axc_rx_valid    ),
      	.ctrl32_axc_rx_data     (ctrl32_axc_rx_data     ),
      	.ctrl32_axc_tx_ready    (ctrl32_axc_tx_ready    ),
      	.ctrl32_axc_tx_valid    (ctrl32_axc_tx_valid    ),
      	.ctrl32_axc_tx_data     (ctrl32_axc_tx_data     ),
      	/* CPRI Vendor Specific Rx Interface */
      	.vs64_rx_valid          (vs64_rx_valid          ),
      	.vs64_rx_data           (vs64_rx_data           ),	
      	.vs64_tx_ready          (vs64_tx_ready          ),
      	.vs64_tx_valid          (vs64_tx_valid          ),
      	.vs64_tx_data           (vs64_tx_data           ),
      	.vs32_rx_valid          (vs32_rx_valid          ),
      	.vs32_rx_data           (vs32_rx_data           ),
      	.vs32_tx_ready          (vs32_tx_ready          ),
      	.vs32_tx_valid          (vs32_tx_valid          ),
      	.vs32_tx_data           (vs32_tx_data           ),
      	/* CPRI Real-Time Vendor Specific Rx Interface */
      	.rtvs64_rx_valid        (rtvs64_rx_valid        ),
      	.rtvs64_rx_data         (rtvs64_rx_data         ),
      	.rtvs64_tx_ready        (rtvs64_tx_ready        ),
      	.rtvs64_tx_valid        (rtvs64_tx_valid        ),
      	.rtvs64_tx_data         (rtvs64_tx_data         ),
      	.rtvs32_rx_valid        (rtvs32_rx_valid        ),
      	.rtvs32_rx_data         (rtvs32_rx_data         ),
      	.rtvs32_tx_ready        (rtvs32_tx_ready        ),
      	.rtvs32_tx_valid        (rtvs32_tx_valid        ),
      	.rtvs32_tx_data         (rtvs32_tx_data         ),
      	/* CPRI Gigabit Media Independent (GMII) Rx Interface */
      	.gmii_rxdv              (gmii_rxdv              ),
      	.gmii_rxer              (gmii_rxer              ),
      	.gmii_rxd               (gmii_rxd               ),
      	.gmii_rxfifo_status     (gmii_rxfifo_status     ),
      	.iwf_gmii_rxdv          (iwf_gmii_rxdv          ),
      	.iwf_gmii_rxer          (iwf_gmii_rxer          ),
      	.iwf_gmii_rxd           (iwf_gmii_rxd           ),
      	.iwf_gmii_rxfifo_status (iwf_gmii_rxfifo_status ),
      	.gmii_txen              (gmii_txen              ),
      	.gmii_txer              (gmii_txer              ),
      	.gmii_txd               (gmii_txd               ),
      	.gmii_txfifo_status     (gmii_txfifo_status     ),
      	.iwf_gmii_txen          (iwf_gmii_txen          ),
      	.iwf_gmii_txer          (iwf_gmii_txer          ),
      	.iwf_gmii_txd           (iwf_gmii_txd           ),
      	.iwf_gmii_txfifo_status (iwf_gmii_txfifo_status ),
      	/* CPRI IP L1 Control and Status */
      	.cpri_nego_bitrate_in   (cpri_nego_bitrate_in   ),
      	.cpri_state_startup_seq (cpri_state_startup_seq ),
      	.cpri_state_l1_synch    (cpri_state_l1_synch    ),
      	//.cpri_hfn_out           (cpri_hfn_out           ),
      	//.cpri_hfn_in_valid      (cpri_hfn_in_valid      ),
      	//.cpri_bfn_out           (cpri_bfn_out           ),
      	//.cpri_bfn_in_valid      (cpri_bfn_in_valid      ),
      	.cpri_local_lof         (cpri_local_lof         ),
      	.cpri_local_los         (cpri_local_los         ),
      	.cpri_sdi_assert        (cpri_sdi_assert        ),
      	.cpri_local_rai         (cpri_local_rai         ),
      	.cpri_reset_assert      (cpri_reset_assert      ),
      	.cpri_remote_lof        (cpri_remote_lof        ),
      	.cpri_remote_los        (cpri_remote_los        ),
      	.cpri_sdi_req           (cpri_sdi_req           ),
      	.cpri_remote_rai        (cpri_remote_rai        ),
      	.cpri_reset_req         (cpri_reset_req         ),
      	/* CSR */
      	.csr_writedata          (iwf_csr_writedata      ),
      	.csr_write              (iwf_csr_write          ),
      	.csr_readdata           (iwf_csr_readdata       ),
      	.csr_readdatavalid      (iwf_csr_readdatavalid  ),
      	.csr_waitrequest        (iwf_csr_waitrequest    ),
      	.csr_read               (iwf_csr_read           ),
      	.csr_address            (iwf_csr_address        ),
      	/* Transport interface */
      	.avst_source_valid      (avst_iwf_valid         ),
      	.avst_source_data       (avst_iwf_data          ),
      	.avst_source_sop        (avst_iwf_sop           ),
      	.avst_source_eop        (avst_iwf_eop           ),
      	.avst_source_empty      (avst_iwf_empty         ),
      	.avst_source_error      (avst_iwf_error         ),
      	.source_pkt_size        (iwf_pkt_size           ),
      	.source_pkt_checksum    (iwf_pkt_checksum       ),
      	.source_concatenation   (iwf_concatenation      ),
      	.source_pc_id           (iwf_pc_id              ),
      	.source_seq_id          (iwf_seq_id             ),
      	.source_rtc_id          (iwf_rtc_id             ),
      	.source_msg_type        (iwf_msg_type           ),
      	.source_reset_id        (iwf_reset_id           ),
      	.source_reset_op        (iwf_reset_op           ),
      	.source_event_id        (iwf_event_id           ),
      	.source_event_type      (iwf_event_type         ),
      	.source_notif           (/*left unconnected*/ ),
      	.avst_sink_valid        (avst_ecpri_valid       ),
      	.avst_sink_data         (avst_ecpri_data        ),
      	.avst_sink_sop          (avst_ecpri_sop         ),
      	.avst_sink_eop          (avst_ecpri_eop         ),
      	.avst_sink_empty        (avst_ecpri_empty       ),
      	.avst_sink_ready        (/*left unconnected*/   ),
      	.avst_sink_error        (avst_ecpri_error       ),
      	.sink_pc_id             (ecpri_pc_id            ),
      	.sink_seq_id            (ecpri_seq_id           ),
      	.sink_rtc_id            (ecpri_rtc_id           ),
      	.sink_msg_type          (ecpri_msg_type         ),
      	.sink_reset_id          (ecpri_reset_id         ),
      	.sink_reset_op          (ecpri_reset_op         ),
      	.sink_event_id          (ecpri_event_id         ),
      	.sink_event_type        (ecpri_event_type       )
      );

      assign source_concatenation = 1'b0;
      assign avst_sink_ready      = 1'b0;

      //CSR address mapping
      //assign ecpri_csr_writedata = csr_writedata;
      //assign ecpri_csr_write     = (csr_address[16])? 1'b0 : csr_write;
      //assign ecpri_csr_read      = (csr_address[16])? 1'b0 : csr_read;
      //assign ecpri_csr_address   = csr_address[15:0];

      //assign iwf_csr_writedata = csr_writedata;
      //assign iwf_csr_write     = (csr_address[16])? csr_write : 1'b0;
      //assign iwf_csr_read      = (csr_address[16])? csr_read  : 1'b0;
      //assign iwf_csr_address   = csr_address[15:0];

      //assign csr_readdata      = (csr_address[16])? iwf_csr_readdata      : ecpri_csr_readdata; 
      //assign csr_readdatavalid = (csr_address[16])? iwf_csr_readdatavalid : ecpri_csr_readdatavalid;
      //assign csr_waitrequest   = (csr_address[16])? iwf_csr_waitrequest   : ecpri_csr_waitrequest;

      assign ecpri_csr_writedata = csr_writedata;
      assign ecpri_csr_write     = csr_write;
      assign ecpri_csr_read      = csr_read;
      assign ecpri_csr_address   = csr_address;

      assign iwf_csr_writedata = '0 ;
      assign iwf_csr_write     = '0 ;
      assign iwf_csr_read      = '0 ;
      assign iwf_csr_address   = '0 ;

      assign csr_readdata      = ecpri_csr_readdata; 
      assign csr_readdatavalid = ecpri_csr_readdatavalid;
      assign csr_waitrequest   = ecpri_csr_waitrequest;
   end else if(IWF_SUPPORT == "ON" && ECPRI_IWF_CONNECT == 0) begin
      logic [31:0] ecpri_csr_writedata;
      logic        ecpri_csr_write;
      logic [31:0] ecpri_csr_readdata;
      logic        ecpri_csr_readdatavalid;
      logic        ecpri_csr_waitrequest;
      logic        ecpri_csr_read;
      logic [15:0] ecpri_csr_address;

      logic [31:0] iwf_csr_writedata;
      logic        iwf_csr_write;
      logic [31:0] iwf_csr_readdata;
      logic        iwf_csr_readdatavalid;
      logic        iwf_csr_waitrequest;
      logic        iwf_csr_read;
      logic [15:0] iwf_csr_address;

      ecpri_top #(
         .DEVICE_FAMILY          (DEVICE_FAMILY),
         .IP_VERSION             (IP_VERSION),
         .PROTOCOL_REVISION      (PROTOCOL_REVISION),
         .IWF_SUPPORT            (IWF_SUPPORT),
         .IWF_TYPE               (IWF_TYPE),
         .FRAGMENTATION          (FRAGMENTATION),
         .DELAY_MEASUREMENT      (DELAY_MEASUREMENT),
         .ONE_STEP_DELAY         (ONE_STEP_DELAY),
         .TS_FINGERPRINT_WIDTH   (TS_FINGERPRINT_WIDTH),
         .PTP_TS_FP_WIDTH        (PTP_TS_FP_WIDTH),
         .INTEL_ORAN             (INTEL_ORAN),
         .OOO_SEQ_CHK            (OOO_SEQ_CHK),
         .ETH_MTU                (ETH_MTU),
         .MAC_VLAN_EN            (MAC_VLAN_EN),
         .MAC_TCP_EN             (MAC_TCP_EN),
         .BITSPERSYMBOL          (BITSPERSYMBOL),
         .SYMBOLSPERBEAT         (SYMBOLSPERBEAT),
         .TXINS_READY_LATENCY    (TXINS_READY_LATENCY),
         .TX_ERROR_WIDTH         (TX_ERROR_WIDTH),
         .RX_ERROR_WIDTH         (RX_ERROR_WIDTH),
         .DATA_WIDTH             (DATA_WIDTH),
         .NOCT                   (NOCT),
         .EWIDTH                 (EWIDTH),
         .ETH_25G_PTP            (ETH_25G_PTP),
         .LL10G_PTP              (LL10G_PTP),
         .EHIP_PTP               (EHIP_PTP),
         .READY_LATENCY          (READY_LATENCY),
         .EXT_SOURCE_FIFO_DEPTH  (EXT_SOURCE_FIFO_DEPTH),
         .EXT_SINK_0_DFIFO_DEPTH (EXT_SINK_0_DFIFO_DEPTH),
         .EXT_SINK_1_DFIFO_DEPTH (EXT_SINK_1_DFIFO_DEPTH),
         .NUMBER_EXT_SINK_INT    (NUMBER_EXT_SINK_INT),         
         .ECC_ENABLE             (ECC_ENABLE),
         .IPV4_ENABLE            (IPV4_ENABLE),
         .IPV6_ENABLE            (IPV6_ENABLE),
         .MSG4_MODE              (MSG4_MODE),
         .ADV_MAP                (ADV_MAP),
         .MSG4_TIMER_EN          (MSG4_TIMER_EN),
         .MSG6_TIMER_EN          (MSG6_TIMER_EN),
         .MSG4_TIMER_WIDTH       (MSG4_TIMER_WIDTH),
         .MSG5_TIMER_WIDTH       (MSG5_TIMER_WIDTH),
         .MSG6_TIMER_WIDTH       (MSG6_TIMER_WIDTH),
         .SRC_MAC_ADDR0          (SRC_MAC_ADDR0),
         .DEST_MAC_ADDR0         (DEST_MAC_ADDR0),
         .DEST_MAC_ADDR1         (DEST_MAC_ADDR1),
         .DEST_MAC_ADDR2         (DEST_MAC_ADDR2),
         .DEST_MAC_ADDR3         (DEST_MAC_ADDR3),
         .DEST_MAC_ADDR4         (DEST_MAC_ADDR4),
         .DEST_MAC_ADDR5         (DEST_MAC_ADDR5),
         .DEST_MAC_ADDR6         (DEST_MAC_ADDR6),
         .DEST_MAC_ADDR7         (DEST_MAC_ADDR7),
         .VID_ADDR_DF            (VID_ADDR_DF),
         .MATCH_MACADDR_VLANID   (MATCH_MACADDR_VLANID),
         .TX_ARBITRATION_SCHEME  (TX_ARBITRATION_SCHEME),
         .ARB_QUEUE_0_DEPTH      (ARB_QUEUE_0_DEPTH),
         .ARB_QUEUE_1_DEPTH      (ARB_QUEUE_1_DEPTH),
         .ARB_QUEUE_2_DEPTH      (ARB_QUEUE_2_DEPTH),
         .ARB_QUEUE_3_DEPTH      (ARB_QUEUE_3_DEPTH),
         .ARB_QUEUE_4_DEPTH      (ARB_QUEUE_4_DEPTH),
         .ARB_QUEUE_5_DEPTH      (ARB_QUEUE_5_DEPTH),
         .ARB_QUEUE_6_DEPTH      (ARB_QUEUE_6_DEPTH),
         .ARB_QUEUE_7_DEPTH      (ARB_QUEUE_7_DEPTH)
      ) ecpri_top_connect (
         .mac_clk_tx                                      (mac_clk_tx                                     ),
         .mac_clk_rx                                      (mac_clk_rx                                     ),
         .clk_tx                                          (clk_tx                                         ),
         .clk_rx                                          (clk_rx                                         ),
         .clk_csr                                         (clk_csr                                        ),
         .ext_sink_clk                                    (ext_sink_clk                                   ),
         .rst_tx_n                                        (rst_tx_n                                       ),
         .rst_rx_n                                        (rst_rx_n                                       ),
         .tx_sync_rst_n                                   (rst_tx_n_sync                                  ),
         .rx_sync_rst_n                                   (rst_rx_n_sync                                  ),
         .rst_csr_n                                       (rst_csr_n                                      ),
         .err_interrupt                                   (err_interrupt                                  ),
         .mac_sink_ready                                  (mac_sink_ready                                 ),
         .mac_sink_valid                                  (mac_sink_valid                                 ),
         .mac_sink_data                                   (mac_sink_data                                  ),
         .mac_sink_sop                                    (mac_sink_sop                                   ),
         .mac_sink_eop                                    (mac_sink_eop                                   ),
         .mac_sink_empty                                  (mac_sink_empty                                 ),
         .mac_sink_error                                  (mac_sink_error                                 ),
                  /*Replace with ext sink 0 and ext sink 1
         .ext_sink_sop                                    (ext_sink_sop                                   ),
         .ext_sink_eop                                    (ext_sink_eop                                   ),
         .ext_sink_valid                                  (ext_sink_valid                                 ),
         .ext_sink_data                                   (ext_sink_data                                  ),
         .ext_sink_empty                                  (ext_sink_empty                                 ),
         .ext_sink_error                                  (ext_sink_error                                 ),
         .ext_sink_ready                                  (ext_sink_ready                                 ),
         .ext_ptp_timestamp_request_fingerprint           (ext_ptp_timestamp_request_fingerprint          ),
         .ext_tx_ingress_timestamp_96b_data               (ext_tx_ingress_timestamp_96b_data              ),
         .ext_tx_egress_timestamp_96b_valid               (ext_tx_egress_timestamp_96b_valid              ),
         .ext_tx_egress_timestamp_96b_data                (ext_tx_egress_timestamp_96b_data               ),
         .ext_tx_egress_timestamp_96b_fingerprint         (ext_tx_egress_timestamp_96b_fingerprint        ),
         */
         .ext_sink_0_sop                                  (ext_sink_0_sop                                 ),
         .ext_sink_0_eop                                  (ext_sink_0_eop                                 ),
         .ext_sink_0_valid                                (ext_sink_0_valid                               ),
         .ext_sink_0_data                                 (ext_sink_0_data                                ),
         .ext_sink_0_empty                                (ext_sink_0_empty                               ),
         .ext_sink_0_error                                (ext_sink_0_error                               ),
         .ext_sink_0_ready                                (ext_sink_0_ready                               ),
         .ext_sink_0_timestamp_request_fingerprint        (ext_sink_0_timestamp_request_fingerprint       ),
         .ext_sink_0_timestamp_request_valid              (ext_sink_0_timestamp_request_valid             ),
         .ext_sink_0_tx_ingress_timestamp_96b_data        (ext_sink_0_tx_ingress_timestamp_96b_data       ),
         .ext_sink_0_tx_egress_timestamp_96b_valid        (ext_sink_0_tx_egress_timestamp_96b_valid       ),
         .ext_sink_0_tx_egress_timestamp_96b_data         (ext_sink_0_tx_egress_timestamp_96b_data        ),
         .ext_sink_0_tx_egress_timestamp_96b_fingerprint  (ext_sink_0_tx_egress_timestamp_96b_fingerprint ),

         .ext_sink_1_sop                                  (ext_sink_1_sop                                 ),
         .ext_sink_1_eop                                  (ext_sink_1_eop                                 ),
         .ext_sink_1_valid                                (ext_sink_1_valid                               ),
         .ext_sink_1_data                                 (ext_sink_1_data                                ),
         .ext_sink_1_empty                                (ext_sink_1_empty                               ),
         .ext_sink_1_error                                (ext_sink_1_error                               ),
         .ext_sink_1_ready                                (ext_sink_1_ready                               ),
         .ext_sink_1_timestamp_request_fingerprint        (ext_sink_1_timestamp_request_fingerprint       ),
         .ext_sink_1_timestamp_request_valid              (ext_sink_1_timestamp_request_valid             ),
         .ext_sink_1_tx_ingress_timestamp_96b_data        (ext_sink_1_tx_ingress_timestamp_96b_data       ),
         .ext_sink_1_tx_egress_timestamp_96b_valid        (ext_sink_1_tx_egress_timestamp_96b_valid       ),
         .ext_sink_1_tx_egress_timestamp_96b_data         (ext_sink_1_tx_egress_timestamp_96b_data        ),
         .ext_sink_1_tx_egress_timestamp_96b_fingerprint  (ext_sink_1_tx_egress_timestamp_96b_fingerprint ),

         .ext_source_sop                                  (ext_source_sop                                 ),
         .ext_source_eop                                  (ext_source_eop                                 ),
         .ext_source_valid                                (ext_source_valid                               ),
         .ext_source_data                                 (ext_source_data                                ),
         .ext_source_empty                                (ext_source_empty                               ),
         .ext_source_error                                (ext_source_error                               ),
         .ext_source_pkt_type                             (ext_source_pkt_type                            ),
         .mac_source_valid                                (mac_source_valid                               ),
         .mac_source_data                                 (mac_source_data                                ),
         .mac_source_sop                                  (mac_source_sop                                 ),
         .mac_source_eop                                  (mac_source_eop                                 ),
         .mac_source_empty                                (mac_source_empty                               ),
         .mac_source_ready                                (mac_source_ready                               ),
         .mac_source_error                                (mac_source_error                               ),
         .avst_sink_valid                                 (avst_sink_valid                                ),
         .avst_sink_data                                  (avst_sink_data                                 ),
         .avst_sink_sop                                   (avst_sink_sop                                  ),
         .avst_sink_eop                                   (avst_sink_eop                                  ),
         .avst_sink_empty                                 (avst_sink_empty                                ),
         .avst_sink_ready                                 (avst_sink_ready                                ),
         .avst_sink_error                                 (avst_sink_error                                ),
         .sink_pc_id                                      (sink_pc_id                                     ),
         .sink_seq_id                                     (sink_seq_id                                    ),
         .sink_rtc_id                                     (sink_rtc_id                                    ),
         .sink_concatenation                              (sink_concatenation                             ),
         .sink_msg_type                                   (sink_msg_type                                  ),
         .sink_mem_acc_id                                 (sink_mem_acc_id                                ),
         .sink_op_type                                    (sink_op_type                                   ),
         .sink_element_id                                 (sink_element_id                                ),
         .sink_address                                    (sink_address                                   ),
         .sink_length                                     (sink_length                                    ),
         .sink_reset_id                                   (sink_reset_id                                  ),
         .sink_reset_op                                   (sink_reset_op                                  ),
         .sink_event_id                                   (sink_event_id                                  ),
         .sink_event_type                                 (sink_event_type                                ),
         .sink_pkt_size                                   (sink_pkt_size                                  ),
         .sink_pkt_checksum                               (sink_pkt_checksum                              ),
         .tx_transport_c_u                                (tx_transport_c_u                               ),
         .avst_source_valid                               (avst_source_valid                              ),
         .avst_source_data                                (avst_source_data                               ),
         .avst_source_sop                                 (avst_source_sop                                ),
         .avst_source_eop                                 (avst_source_eop                                ),
         .avst_source_empty                               (avst_source_empty                              ),
         .avst_source_error                               (avst_source_error                              ),
         .source_pc_id                                    (source_pc_id                                   ),
         .source_seq_id                                   (source_seq_id                                  ),
         .source_rtc_id                                   (source_rtc_id                                  ),
         .source_msg_type                                 (source_msg_type                                ),
         .source_concatenation                            (source_concatenation                           ),
         .source_mem_acc_id                               (source_mem_acc_id                              ),
         .source_op_type                                  (source_op_type                                 ),
         .source_element_id                               (source_element_id                              ),
         .source_address                                  (source_address                                 ),
         .source_length                                   (source_length                                  ),
         .source_reset_id                                 (source_reset_id                                ),
         .source_reset_op                                 (source_reset_op                                ),
         .source_event_id                                 (source_event_id                                ),
         .source_event_type                               (source_event_type                              ),
         .source_notif                                    (source_notif                                   ),
         .rx_transport_c_u                                (rx_transport_c_u                               ),
         .ptp_offset_timestamp                            (ptp_offset_timestamp                           ),
         .ptp_offset_correction_field                     (ptp_offset_correction_field                    ),
         .ptp_timestamp_insert                            (ptp_timestamp_insert                           ),
         .ptp_tx_etstamp_ins_ctrl_residence_time_update   (ptp_tx_etstamp_ins_ctrl_residence_time_update  ),
         .ptp_timestamp_request_fingerprint               (ptp_timestamp_request_fingerprint              ),
         .ptp_timestamp_request_valid                     (ptp_timestamp_request_valid                    ),

         .tx_queue_0_fifo_full                            (tx_queue_0_fifo_full                           ),
         .tx_queue_1_fifo_full                            (tx_queue_1_fifo_full                           ),
         .tx_queue_2_fifo_full                            (tx_queue_2_fifo_full                           ),
         .tx_queue_3_fifo_full                            (tx_queue_3_fifo_full                           ),
         .tx_queue_4_fifo_full                            (tx_queue_4_fifo_full                           ),
         .tx_queue_5_fifo_full                            (tx_queue_5_fifo_full                           ),
         .tx_queue_6_fifo_full                            (tx_queue_6_fifo_full                           ),
         .tx_queue_7_fifo_full                            (tx_queue_7_fifo_full                           ),
         .tx_lanes_stable                                 (tx_lanes_stable                                ),
         .rx_pcs_ready                                    (rx_pcs_ready                                   ),
         .tx_etstamp_ins_ctrl_timestamp_format            (tx_etstamp_ins_ctrl_timestamp_format           ),
         .tx_etstamp_ins_ctrl_residence_time_calc_format  (tx_etstamp_ins_ctrl_residence_time_calc_format ),
         .tx_etstamp_ins_ctrl_offset_checksum_field       (tx_etstamp_ins_ctrl_offset_checksum_field      ),
         .tx_etstamp_ins_ctrl_offset_checksum_correction  (tx_etstamp_ins_ctrl_offset_checksum_correction ),
         .tx_etstamp_ins_ctrl_ingress_timestamp_96b       (tx_etstamp_ins_ctrl_ingress_timestamp_96b      ),
         .tx_etstamp_ins_ctrl_checksum_zero               (tx_etstamp_ins_ctrl_checksum_zero              ),
         .tx_etstamp_ins_ctrl_checksum_correct            (tx_etstamp_ins_ctrl_checksum_correct           ),
         .tx_egress_timestamp_96b_valid                   (tx_egress_timestamp_96b_valid                  ),
         .tx_egress_timestamp_96b_data                    (tx_egress_timestamp_96b_data                   ),
         .tx_egress_timestamp_96b_fingerprint             (tx_egress_timestamp_96b_fingerprint            ),
         .rx_ingress_timestamp_96b_valid                  (rx_ingress_timestamp_96b_valid                 ),
         .rx_ingress_timestamp_96b_data                   (rx_ingress_timestamp_96b_data                  ),
         .ext_rx_ingress_timestamp_96b_data               (ext_rx_ingress_timestamp_96b_data              ),
         .rx_tod_time_of_day_96b_data                     (rx_tod_time_of_day_96b_data                    ),
         .tx_tod_time_of_day_96b_data                     (tx_tod_time_of_day_96b_data                    ),
         .ptp_tx_ingress_timestamp_96b_data               (ptp_tx_ingress_timestamp_96b_data              ),
         .csr_writedata                                   (ecpri_csr_writedata                            ),
         .csr_write                                       (ecpri_csr_write                                ),
         .csr_readdata                                    (ecpri_csr_readdata                             ),
         .csr_readdatavalid                               (ecpri_csr_readdatavalid                        ),
         .csr_waitrequest                                 (ecpri_csr_waitrequest                          ),
         .csr_read                                        (ecpri_csr_read                                 ),
         .csr_address                                     (ecpri_csr_address                              )
      );

      iwf_wrapper #(
         .LINE_RATE     (LINE_RATE),
         .TILE_OPTION   (TILE),
         .DEVICE_FAMILY (DEVICE_FAMILY),
         .NUM_IWF_CPRI  (NUM_IWF_CPRI),
         .RDY_LATENCY   (RDY_LATENCY)
      ) iwf_top_connect (
        .tx_clk                 (clk_tx                   ),
        .rx_clk                 (clk_rx                   ),
        .rst_tx_n               (iwf_rst_tx_n             ),
        .rst_rx_n               (iwf_rst_rx_n             ),
      	.cpri_clkout0           (cpri_clkout0             ),
      	.cpri_clkout1           (cpri_clkout1             ),
      	.cpri_clkout2           (cpri_clkout2             ),
      	.cpri_clkout3           (cpri_clkout3             ),
        .clk_csr0               (clk_csr                  ),
        .rst_csr_n0             (rst_csr_n                ),
        .clk_csr1               (clk_csr                  ),
        .rst_csr_n1             (rst_csr_n                ),
        .clk_csr2               (clk_csr                  ),
        .rst_csr_n2             (rst_csr_n                ),
        .clk_csr3               (clk_csr                  ),
        .rst_csr_n3             (rst_csr_n                ),
        /* PORT 0 */
        /* CPRI IQ Data Rx Interface */
      	.iq64_rx_valid0           (iq64_rx_valid0          ),
      	.iq64_rx_data0            (iq64_rx_data0           ),
      	.iq64_tx_ready0           (iq64_tx_ready0          ),
      	.iq64_tx_valid0           (iq64_tx_valid0          ),
      	.iq64_tx_data0            (iq64_tx_data0           ),
      	.iq32_rx_valid0           (iq32_rx_valid0          ),
      	.iq32_rx_data0            (iq32_rx_data0           ),
      	.iq32_tx_ready0           (iq32_tx_ready0          ),
      	.iq32_tx_valid0           (iq32_tx_valid0          ),
      	.iq32_tx_data0            (iq32_tx_data0           ),
      	/* CPRI Ctrl_AxC Rx Interface */
      	.ctrl64_axc_rx_valid0     (ctrl64_axc_rx_valid0    ),
      	.ctrl64_axc_rx_data0      (ctrl64_axc_rx_data0     ),	
      	.ctrl64_axc_tx_ready0     (ctrl64_axc_tx_ready0    ),
      	.ctrl64_axc_tx_valid0     (ctrl64_axc_tx_valid0    ),
      	.ctrl64_axc_tx_data0      (ctrl64_axc_tx_data0     ),
      	.ctrl32_axc_rx_valid0     (ctrl32_axc_rx_valid0    ),
      	.ctrl32_axc_rx_data0      (ctrl32_axc_rx_data0     ),
      	.ctrl32_axc_tx_ready0     (ctrl32_axc_tx_ready0    ),
      	.ctrl32_axc_tx_valid0     (ctrl32_axc_tx_valid0    ),
      	.ctrl32_axc_tx_data0      (ctrl32_axc_tx_data0     ),
      	/* CPRI Vendor Specific Rx Interface */
      	.vs64_rx_valid0           (vs64_rx_valid0          ),
      	.vs64_rx_data0            (vs64_rx_data0           ),	
      	.vs64_tx_ready0           (vs64_tx_ready0          ),
      	.vs64_tx_valid0           (vs64_tx_valid0          ),
      	.vs64_tx_data0            (vs64_tx_data0           ),
      	.vs32_rx_valid0           (vs32_rx_valid0          ),
      	.vs32_rx_data0            (vs32_rx_data0           ),
      	.vs32_tx_ready0           (vs32_tx_ready0          ),
      	.vs32_tx_valid0           (vs32_tx_valid0          ),
      	.vs32_tx_data0            (vs32_tx_data0           ),
      	/* CPRI Real-Time Vendor Specific Rx Interface */
      	.rtvs64_rx_valid0         (rtvs64_rx_valid0        ),
      	.rtvs64_rx_data0          (rtvs64_rx_data0         ),
      	.rtvs64_tx_ready0         (rtvs64_tx_ready0        ),
      	.rtvs64_tx_valid0         (rtvs64_tx_valid0        ),
      	.rtvs64_tx_data0          (rtvs64_tx_data0         ),
      	.rtvs32_rx_valid0         (rtvs32_rx_valid0        ),
      	.rtvs32_rx_data0          (rtvs32_rx_data0         ),
      	.rtvs32_tx_ready0         (rtvs32_tx_ready0        ),
      	.rtvs32_tx_valid0         (rtvs32_tx_valid0        ),
      	.rtvs32_tx_data0          (rtvs32_tx_data0         ),
      	/* CPRI Gigabit Media Independent0          (GMII0          ) Rx Interface */
        .iwf_gmii_rxclk0          (iwf_gmii_rxclk0         ),
        .iwf_gmii_txclk0          (iwf_gmii_txclk0         ),
        .iwf_gmii_rxreset_n0      (iwf_gmii_rxreset_n0     ),
        .iwf_gmii_txreset_n0      (iwf_gmii_txreset_n0     ),
        .gmii_rxclk0              (gmii_rxclk0             ),
        .gmii_txclk0              (gmii_txclk0             ),
        .gmii_rxreset_n0          (gmii_rxreset_n0         ),
        .gmii_txreset_n0          (gmii_txreset_n0         ),
      	.gmii_rxdv0               (gmii_rxdv0              ),
      	.gmii_rxer0               (gmii_rxer0              ),
      	.gmii_rxd0                (gmii_rxd0               ),
      	.gmii_rxfifo_status0      (gmii_rxfifo_status0     ),
      	.iwf_gmii_rxdv0           (iwf_gmii_rxdv0          ),
      	.iwf_gmii_rxer0           (iwf_gmii_rxer0          ),
      	.iwf_gmii_rxd0            (iwf_gmii_rxd0           ),
      	.iwf_gmii_rxfifo_status0  (iwf_gmii_rxfifo_status0 ),
      	.gmii_txen0               (gmii_txen0              ),
      	.gmii_txer0               (gmii_txer0              ),
      	.gmii_txd0                (gmii_txd0               ),
      	.gmii_txfifo_status0      (gmii_txfifo_status0     ),
      	.iwf_gmii_txen0           (iwf_gmii_txen0          ),
      	.iwf_gmii_txer0           (iwf_gmii_txer0          ),
      	.iwf_gmii_txd0            (iwf_gmii_txd0           ),
      	.iwf_gmii_txfifo_status0  (iwf_gmii_txfifo_status0 ),
      	/* CPRI IP L1 Control and Status */
      	.cpri_nego_bitrate_in0    (cpri_nego_bitrate_in0   ),
      	.cpri_state_startup_seq0  (cpri_state_startup_seq0 ),
      	.cpri_state_l1_synch0     (cpri_state_l1_synch0    ),
      	//.cpri_hfn_out0            (cpri_hfn_out0           ),
      	//.cpri_hfn_in_valid0       (cpri_hfn_in_valid0      ),
      	//.cpri_bfn_out0            (cpri_bfn_out0           ),
      	//.cpri_bfn_in_valid0       (cpri_bfn_in_valid0      ),
      	.cpri_local_lof0          (cpri_local_lof0         ),
      	.cpri_local_los0          (cpri_local_los0         ),
      	.cpri_sdi_assert0         (cpri_sdi_assert0        ),
      	.cpri_local_rai0          (cpri_local_rai0         ),
      	.cpri_reset_assert0       (cpri_reset_assert0      ),
      	.cpri_remote_lof0         (cpri_remote_lof0        ),
      	.cpri_remote_los0         (cpri_remote_los0        ),
      	.cpri_sdi_req0            (cpri_sdi_req0           ),
      	.cpri_remote_rai0         (cpri_remote_rai0        ),
      	.cpri_reset_req0          (cpri_reset_req0         ),
        /* PORT 1 */
        /* CPRI IQ Data Rx Interface */
      	.iq64_rx_valid1           (iq64_rx_valid1          ),
      	.iq64_rx_data1            (iq64_rx_data1           ),
      	.iq64_tx_ready1           (iq64_tx_ready1          ),
      	.iq64_tx_valid1           (iq64_tx_valid1          ),
      	.iq64_tx_data1            (iq64_tx_data1           ),
      	.iq32_rx_valid1           (iq32_rx_valid1          ),
      	.iq32_rx_data1            (iq32_rx_data1           ),
      	.iq32_tx_ready1           (iq32_tx_ready1          ),
      	.iq32_tx_valid1           (iq32_tx_valid1          ),
      	.iq32_tx_data1            (iq32_tx_data1           ),
      	/* CPRI Ctrl_AxC Rx Interface */
      	.ctrl64_axc_rx_valid1     (ctrl64_axc_rx_valid1    ),
      	.ctrl64_axc_rx_data1      (ctrl64_axc_rx_data1     ),	
      	.ctrl64_axc_tx_ready1     (ctrl64_axc_tx_ready1    ),
      	.ctrl64_axc_tx_valid1     (ctrl64_axc_tx_valid1    ),
      	.ctrl64_axc_tx_data1      (ctrl64_axc_tx_data1     ),
      	.ctrl32_axc_rx_valid1     (ctrl32_axc_rx_valid1    ),
      	.ctrl32_axc_rx_data1      (ctrl32_axc_rx_data1     ),
      	.ctrl32_axc_tx_ready1     (ctrl32_axc_tx_ready1    ),
      	.ctrl32_axc_tx_valid1     (ctrl32_axc_tx_valid1    ),
      	.ctrl32_axc_tx_data1      (ctrl32_axc_tx_data1     ),
      	/* CPRI Vendor Specific Rx Interface */
      	.vs64_rx_valid1           (vs64_rx_valid1          ),
      	.vs64_rx_data1            (vs64_rx_data1           ),	
      	.vs64_tx_ready1           (vs64_tx_ready1          ),
      	.vs64_tx_valid1           (vs64_tx_valid1          ),
      	.vs64_tx_data1            (vs64_tx_data1           ),
      	.vs32_rx_valid1           (vs32_rx_valid1          ),
      	.vs32_rx_data1            (vs32_rx_data1           ),
      	.vs32_tx_ready1           (vs32_tx_ready1          ),
      	.vs32_tx_valid1           (vs32_tx_valid1          ),
      	.vs32_tx_data1            (vs32_tx_data1           ),
      	/* CPRI Real-Time Vendor Specific Rx Interface */
      	.rtvs64_rx_valid1         (rtvs64_rx_valid1        ),
      	.rtvs64_rx_data1          (rtvs64_rx_data1         ),
      	.rtvs64_tx_ready1         (rtvs64_tx_ready1        ),
      	.rtvs64_tx_valid1         (rtvs64_tx_valid1        ),
      	.rtvs64_tx_data1          (rtvs64_tx_data1         ),
      	.rtvs32_rx_valid1         (rtvs32_rx_valid1        ),
      	.rtvs32_rx_data1          (rtvs32_rx_data1         ),
      	.rtvs32_tx_ready1         (rtvs32_tx_ready1        ),
      	.rtvs32_tx_valid1         (rtvs32_tx_valid1        ),
      	.rtvs32_tx_data1          (rtvs32_tx_data1         ),
      	/* CPRI Gigabit Media Independent1          (GMII1          ) Rx Interface */
        .iwf_gmii_rxclk1          (iwf_gmii_rxclk1         ),
        .iwf_gmii_txclk1          (iwf_gmii_txclk1         ),
        .iwf_gmii_rxreset_n1      (iwf_gmii_rxreset_n1     ),
        .iwf_gmii_txreset_n1      (iwf_gmii_txreset_n1     ),
        .gmii_rxclk1              (gmii_rxclk1             ),
        .gmii_txclk1              (gmii_txclk1             ),
        .gmii_rxreset_n1          (gmii_rxreset_n1         ),
        .gmii_txreset_n1          (gmii_txreset_n1         ),
      	.gmii_rxdv1               (gmii_rxdv1              ),
      	.gmii_rxer1               (gmii_rxer1              ),
      	.gmii_rxd1                (gmii_rxd1               ),
      	.gmii_rxfifo_status1      (gmii_rxfifo_status1     ),
      	.iwf_gmii_rxdv1           (iwf_gmii_rxdv1          ),
      	.iwf_gmii_rxer1           (iwf_gmii_rxer1          ),
      	.iwf_gmii_rxd1            (iwf_gmii_rxd1           ),
      	.iwf_gmii_rxfifo_status1  (iwf_gmii_rxfifo_status1 ),
      	.gmii_txen1               (gmii_txen1              ),
      	.gmii_txer1               (gmii_txer1              ),
      	.gmii_txd1                (gmii_txd1               ),
      	.gmii_txfifo_status1      (gmii_txfifo_status1     ),
      	.iwf_gmii_txen1           (iwf_gmii_txen1          ),
      	.iwf_gmii_txer1           (iwf_gmii_txer1          ),
      	.iwf_gmii_txd1            (iwf_gmii_txd1           ),
      	.iwf_gmii_txfifo_status1  (iwf_gmii_txfifo_status1 ),
      	/* CPRI IP L1 Control and Status */
      	.cpri_nego_bitrate_in1    (cpri_nego_bitrate_in1   ),
      	.cpri_state_startup_seq1  (cpri_state_startup_seq1 ),
      	.cpri_state_l1_synch1     (cpri_state_l1_synch1    ),
      	//.cpri_hfn_out1            (cpri_hfn_out1           ),
      	//.cpri_hfn_in_valid1       (cpri_hfn_in_valid1      ),
      	//.cpri_bfn_out1            (cpri_bfn_out1           ),
      	//.cpri_bfn_in_valid1       (cpri_bfn_in_valid1      ),
      	.cpri_local_lof1          (cpri_local_lof1         ),
      	.cpri_local_los1          (cpri_local_los1         ),
      	.cpri_sdi_assert1         (cpri_sdi_assert1        ),
      	.cpri_local_rai1          (cpri_local_rai1         ),
      	.cpri_reset_assert1       (cpri_reset_assert1      ),
      	.cpri_remote_lof1         (cpri_remote_lof1        ),
      	.cpri_remote_los1         (cpri_remote_los1        ),
      	.cpri_sdi_req1            (cpri_sdi_req1           ),
      	.cpri_remote_rai1         (cpri_remote_rai1        ),
      	.cpri_reset_req1          (cpri_reset_req1         ),
        /* PORT 2 */
        /* CPRI IQ Data Rx Interface */
      	.iq64_rx_valid2           (iq64_rx_valid2          ),
      	.iq64_rx_data2            (iq64_rx_data2           ),
      	.iq64_tx_ready2           (iq64_tx_ready2          ),
      	.iq64_tx_valid2           (iq64_tx_valid2          ),
      	.iq64_tx_data2            (iq64_tx_data2           ),
      	.iq32_rx_valid2           (iq32_rx_valid2          ),
      	.iq32_rx_data2            (iq32_rx_data2           ),
      	.iq32_tx_ready2           (iq32_tx_ready2          ),
      	.iq32_tx_valid2           (iq32_tx_valid2          ),
      	.iq32_tx_data2            (iq32_tx_data2           ),
      	/* CPRI Ctrl_AxC Rx Interface */
      	.ctrl64_axc_rx_valid2     (ctrl64_axc_rx_valid2    ),
      	.ctrl64_axc_rx_data2      (ctrl64_axc_rx_data2     ),	
      	.ctrl64_axc_tx_ready2     (ctrl64_axc_tx_ready2    ),
      	.ctrl64_axc_tx_valid2     (ctrl64_axc_tx_valid2    ),
      	.ctrl64_axc_tx_data2      (ctrl64_axc_tx_data2     ),
      	.ctrl32_axc_rx_valid2     (ctrl32_axc_rx_valid2    ),
      	.ctrl32_axc_rx_data2      (ctrl32_axc_rx_data2     ),
      	.ctrl32_axc_tx_ready2     (ctrl32_axc_tx_ready2    ),
      	.ctrl32_axc_tx_valid2     (ctrl32_axc_tx_valid2    ),
      	.ctrl32_axc_tx_data2      (ctrl32_axc_tx_data2     ),
      	/* CPRI Vendor Specific Rx Interface */
      	.vs64_rx_valid2           (vs64_rx_valid2          ),
      	.vs64_rx_data2            (vs64_rx_data2           ),	
      	.vs64_tx_ready2           (vs64_tx_ready2          ),
      	.vs64_tx_valid2           (vs64_tx_valid2          ),
      	.vs64_tx_data2            (vs64_tx_data2           ),
      	.vs32_rx_valid2           (vs32_rx_valid2          ),
      	.vs32_rx_data2            (vs32_rx_data2           ),
      	.vs32_tx_ready2           (vs32_tx_ready2          ),
      	.vs32_tx_valid2           (vs32_tx_valid2          ),
      	.vs32_tx_data2            (vs32_tx_data2           ),
      	/* CPRI Real-Time Vendor Specific Rx Interface */
      	.rtvs64_rx_valid2         (rtvs64_rx_valid2        ),
      	.rtvs64_rx_data2          (rtvs64_rx_data2         ),
      	.rtvs64_tx_ready2         (rtvs64_tx_ready2        ),
      	.rtvs64_tx_valid2         (rtvs64_tx_valid2        ),
      	.rtvs64_tx_data2          (rtvs64_tx_data2         ),
      	.rtvs32_rx_valid2         (rtvs32_rx_valid2        ),
      	.rtvs32_rx_data2          (rtvs32_rx_data2         ),
      	.rtvs32_tx_ready2         (rtvs32_tx_ready2        ),
      	.rtvs32_tx_valid2         (rtvs32_tx_valid2        ),
      	.rtvs32_tx_data2          (rtvs32_tx_data2         ),
      	/* CPRI Gigabit Media Independent2          (GMII2          ) Rx Interface */
        .iwf_gmii_rxclk2          (iwf_gmii_rxclk2         ),
        .iwf_gmii_txclk2          (iwf_gmii_txclk2         ),
        .iwf_gmii_rxreset_n2      (iwf_gmii_rxreset_n2     ),
        .iwf_gmii_txreset_n2      (iwf_gmii_txreset_n2     ),
        .gmii_rxclk2              (gmii_rxclk2             ),
        .gmii_txclk2              (gmii_txclk2             ),
        .gmii_rxreset_n2          (gmii_rxreset_n2         ),
        .gmii_txreset_n2          (gmii_txreset_n2         ),
      	.gmii_rxdv2               (gmii_rxdv2              ),
      	.gmii_rxer2               (gmii_rxer2              ),
      	.gmii_rxd2                (gmii_rxd2               ),
      	.gmii_rxfifo_status2      (gmii_rxfifo_status2     ),
      	.iwf_gmii_rxdv2           (iwf_gmii_rxdv2          ),
      	.iwf_gmii_rxer2           (iwf_gmii_rxer2          ),
      	.iwf_gmii_rxd2            (iwf_gmii_rxd2           ),
      	.iwf_gmii_rxfifo_status2  (iwf_gmii_rxfifo_status2 ),
      	.gmii_txen2               (gmii_txen2              ),
      	.gmii_txer2               (gmii_txer2              ),
      	.gmii_txd2                (gmii_txd2               ),
      	.gmii_txfifo_status2      (gmii_txfifo_status2     ),
      	.iwf_gmii_txen2           (iwf_gmii_txen2          ),
      	.iwf_gmii_txer2           (iwf_gmii_txer2          ),
      	.iwf_gmii_txd2            (iwf_gmii_txd2           ),
      	.iwf_gmii_txfifo_status2  (iwf_gmii_txfifo_status2 ),
      	/* CPRI IP L1 Control and Status */
      	.cpri_nego_bitrate_in2    (cpri_nego_bitrate_in2   ),
      	.cpri_state_startup_seq2  (cpri_state_startup_seq2 ),
      	.cpri_state_l1_synch2     (cpri_state_l1_synch2    ),
      	//.cpri_hfn_out2            (cpri_hfn_out2           ),
      	//.cpri_hfn_in_valid2       (cpri_hfn_in_valid2      ),
      	//.cpri_bfn_out2            (cpri_bfn_out2           ),
      	//.cpri_bfn_in_valid2       (cpri_bfn_in_valid2      ),
      	.cpri_local_lof2          (cpri_local_lof2         ),
      	.cpri_local_los2          (cpri_local_los2         ),
      	.cpri_sdi_assert2         (cpri_sdi_assert2        ),
      	.cpri_local_rai2          (cpri_local_rai2         ),
      	.cpri_reset_assert2       (cpri_reset_assert2      ),
      	.cpri_remote_lof2         (cpri_remote_lof2        ),
      	.cpri_remote_los2         (cpri_remote_los2        ),
      	.cpri_sdi_req2            (cpri_sdi_req2           ),
      	.cpri_remote_rai2         (cpri_remote_rai2        ),
      	.cpri_reset_req2          (cpri_reset_req2         ),
        /* PORT 3 */
        /* CPRI IQ Data Rx Interface */
      	.iq64_rx_valid3           (iq64_rx_valid3          ),
      	.iq64_rx_data3            (iq64_rx_data3           ),
      	.iq64_tx_ready3           (iq64_tx_ready3          ),
      	.iq64_tx_valid3           (iq64_tx_valid3          ),
      	.iq64_tx_data3            (iq64_tx_data3           ),
      	.iq32_rx_valid3           (iq32_rx_valid3          ),
      	.iq32_rx_data3            (iq32_rx_data3           ),
      	.iq32_tx_ready3           (iq32_tx_ready3          ),
      	.iq32_tx_valid3           (iq32_tx_valid3          ),
      	.iq32_tx_data3            (iq32_tx_data3           ),
      	/* CPRI Ctrl_AxC Rx Interface */
      	.ctrl64_axc_rx_valid3     (ctrl64_axc_rx_valid3    ),
      	.ctrl64_axc_rx_data3      (ctrl64_axc_rx_data3     ),	
      	.ctrl64_axc_tx_ready3     (ctrl64_axc_tx_ready3    ),
      	.ctrl64_axc_tx_valid3     (ctrl64_axc_tx_valid3    ),
      	.ctrl64_axc_tx_data3      (ctrl64_axc_tx_data3     ),
      	.ctrl32_axc_rx_valid3     (ctrl32_axc_rx_valid3    ),
      	.ctrl32_axc_rx_data3      (ctrl32_axc_rx_data3     ),
      	.ctrl32_axc_tx_ready3     (ctrl32_axc_tx_ready3    ),
      	.ctrl32_axc_tx_valid3     (ctrl32_axc_tx_valid3    ),
      	.ctrl32_axc_tx_data3      (ctrl32_axc_tx_data3     ),
      	/* CPRI Vendor Specific Rx Interface */
      	.vs64_rx_valid3           (vs64_rx_valid3          ),
      	.vs64_rx_data3            (vs64_rx_data3           ),	
      	.vs64_tx_ready3           (vs64_tx_ready3          ),
      	.vs64_tx_valid3           (vs64_tx_valid3          ),
      	.vs64_tx_data3            (vs64_tx_data3           ),
      	.vs32_rx_valid3           (vs32_rx_valid3          ),
      	.vs32_rx_data3            (vs32_rx_data3           ),
      	.vs32_tx_ready3           (vs32_tx_ready3          ),
      	.vs32_tx_valid3           (vs32_tx_valid3          ),
      	.vs32_tx_data3            (vs32_tx_data3           ),
      	/* CPRI Real-Time Vendor Specific Rx Interface */
      	.rtvs64_rx_valid3         (rtvs64_rx_valid3        ),
      	.rtvs64_rx_data3          (rtvs64_rx_data3         ),
      	.rtvs64_tx_ready3         (rtvs64_tx_ready3        ),
      	.rtvs64_tx_valid3         (rtvs64_tx_valid3        ),
      	.rtvs64_tx_data3          (rtvs64_tx_data3         ),
      	.rtvs32_rx_valid3         (rtvs32_rx_valid3        ),
      	.rtvs32_rx_data3          (rtvs32_rx_data3         ),
      	.rtvs32_tx_ready3         (rtvs32_tx_ready3        ),
      	.rtvs32_tx_valid3         (rtvs32_tx_valid3        ),
      	.rtvs32_tx_data3          (rtvs32_tx_data3         ),
      	/* CPRI Gigabit Media Independent3          (GMII3          ) Rx Interface */
        .iwf_gmii_rxclk3          (iwf_gmii_rxclk3         ),
        .iwf_gmii_txclk3          (iwf_gmii_txclk3         ),
        .iwf_gmii_rxreset_n3      (iwf_gmii_rxreset_n3     ),
        .iwf_gmii_txreset_n3      (iwf_gmii_txreset_n3     ),
        .gmii_rxclk3              (gmii_rxclk3             ),
        .gmii_txclk3              (gmii_txclk3             ),
        .gmii_rxreset_n3          (gmii_rxreset_n3         ),
        .gmii_txreset_n3          (gmii_txreset_n3         ),
      	.gmii_rxdv3               (gmii_rxdv3              ),
      	.gmii_rxer3               (gmii_rxer3              ),
      	.gmii_rxd3                (gmii_rxd3               ),
      	.gmii_rxfifo_status3      (gmii_rxfifo_status3     ),
      	.iwf_gmii_rxdv3           (iwf_gmii_rxdv3          ),
      	.iwf_gmii_rxer3           (iwf_gmii_rxer3          ),
      	.iwf_gmii_rxd3            (iwf_gmii_rxd3           ),
      	.iwf_gmii_rxfifo_status3  (iwf_gmii_rxfifo_status3 ),
      	.gmii_txen3               (gmii_txen3              ),
      	.gmii_txer3               (gmii_txer3              ),
      	.gmii_txd3                (gmii_txd3               ),
      	.gmii_txfifo_status3      (gmii_txfifo_status3     ),
      	.iwf_gmii_txen3           (iwf_gmii_txen3          ),
      	.iwf_gmii_txer3           (iwf_gmii_txer3          ),
      	.iwf_gmii_txd3            (iwf_gmii_txd3           ),
      	.iwf_gmii_txfifo_status3  (iwf_gmii_txfifo_status3 ),
      	/* CPRI IP L1 Control and Status */
      	.cpri_nego_bitrate_in3    (cpri_nego_bitrate_in3   ),
      	.cpri_state_startup_seq3  (cpri_state_startup_seq3 ),
      	.cpri_state_l1_synch3     (cpri_state_l1_synch3    ),
      	//.cpri_hfn_out3            (cpri_hfn_out3           ),
      	//.cpri_hfn_in_valid3       (cpri_hfn_in_valid3      ),
      	//.cpri_bfn_out3            (cpri_bfn_out3           ),
      	//.cpri_bfn_in_valid3       (cpri_bfn_in_valid3      ),
      	.cpri_local_lof3          (cpri_local_lof3         ),
      	.cpri_local_los3          (cpri_local_los3         ),
      	.cpri_sdi_assert3         (cpri_sdi_assert3        ),
      	.cpri_local_rai3          (cpri_local_rai3         ),
      	.cpri_reset_assert3       (cpri_reset_assert3      ),
      	.cpri_remote_lof3         (cpri_remote_lof3        ),
      	.cpri_remote_los3         (cpri_remote_los3        ),
      	.cpri_sdi_req3            (cpri_sdi_req3           ),
      	.cpri_remote_rai3         (cpri_remote_rai3        ),
      	.cpri_reset_req3          (cpri_reset_req3         ),

      	/* CSR */
      	.csr_writedata          (iwf_csr_writedata        ),
      	.csr_write              (iwf_csr_write            ),
      	.csr_readdata           (iwf_csr_readdata         ),
      	.csr_readdatavalid      (iwf_csr_readdatavalid    ),
      	.csr_waitrequest        (iwf_csr_waitrequest      ),
      	.csr_read               (iwf_csr_read             ),
      	.csr_address            (iwf_csr_address          ),
      	/* Transport interface */
      	.avst_source_valid      (iwf_avst_source_valid    ),
      	.avst_source_data       (iwf_avst_source_data     ),
      	.avst_source_sop        (iwf_avst_source_sop      ),
      	.avst_source_eop        (iwf_avst_source_eop      ),
      	.avst_source_empty      (iwf_avst_source_empty    ),
      	.avst_source_error      (iwf_avst_source_error    ),
        .avst_source_ready      (iwf_avst_source_ready    ),
      	.source_pkt_size        (iwf_source_pkt_size      ),
      	.source_pkt_checksum    (iwf_source_pkt_checksum  ),
      	.source_concatenation   (iwf_source_concatenation ),
      	.source_pc_id           (iwf_source_pc_id         ),
      	.source_seq_id          (iwf_source_seq_id        ),
      	.source_rtc_id          (iwf_source_rtc_id        ),
      	.source_msg_type        (iwf_source_msg_type      ),
      	.source_reset_id        (iwf_source_reset_id      ),
      	.source_reset_op        (iwf_source_reset_op      ),
      	.source_event_id        (iwf_source_event_id      ),
      	.source_event_type      (iwf_source_event_type    ),
      	.source_notif           (iwf_source_notif         ),
      	.avst_sink_valid        (iwf_avst_sink_valid      ),
      	.avst_sink_data         (iwf_avst_sink_data       ),
      	.avst_sink_sop          (iwf_avst_sink_sop        ),
      	.avst_sink_eop          (iwf_avst_sink_eop        ),
      	.avst_sink_empty        (iwf_avst_sink_empty      ),
      	.avst_sink_ready        (iwf_avst_sink_ready      ),
      	.avst_sink_error        (iwf_avst_sink_error      ),
      	.sink_pc_id             (iwf_sink_pc_id           ),
      	.sink_seq_id            (iwf_sink_seq_id          ),
      	.sink_rtc_id            (iwf_sink_rtc_id          ),
      	.sink_msg_type          (iwf_sink_msg_type        ),
      	.sink_reset_id          (iwf_sink_reset_id        ),
      	.sink_reset_op          (iwf_sink_reset_op        ),
      	.sink_event_id          (iwf_sink_event_id        ),
      	.sink_event_type        (iwf_sink_event_type      )
      );

      //CSR address mapping
      //assign ecpri_csr_writedata = csr_writedata;
      //assign ecpri_csr_write     = (csr_address[16])? 1'b0 : csr_write;
      //assign ecpri_csr_read      = (csr_address[16])? 1'b0 : csr_read;
      //assign ecpri_csr_address   = csr_address[15:0];

      //assign iwf_csr_writedata = csr_writedata;
      //assign iwf_csr_write     = (csr_address[16])? csr_write : 1'b0;
      //assign iwf_csr_read      = (csr_address[16])? csr_read  : 1'b0;
      //assign iwf_csr_address   = csr_address[15:0];

      //assign csr_readdata      = (csr_address[16])? iwf_csr_readdata      : ecpri_csr_readdata; 
      //assign csr_readdatavalid = (csr_address[16])? iwf_csr_readdatavalid : ecpri_csr_readdatavalid;
      //assign csr_waitrequest   = (csr_address[16])? iwf_csr_waitrequest   : ecpri_csr_waitrequest;

      assign ecpri_csr_writedata = csr_writedata;
      assign ecpri_csr_write     = csr_write;
      assign ecpri_csr_read      = csr_read;
      assign ecpri_csr_address   = csr_address;

      assign iwf_csr_writedata = '0 ;
      assign iwf_csr_write     = '0 ;
      assign iwf_csr_read      = '0 ;
      assign iwf_csr_address   = '0 ;

      assign csr_readdata      = ecpri_csr_readdata; 
      assign csr_readdatavalid = ecpri_csr_readdatavalid;
      assign csr_waitrequest   = ecpri_csr_waitrequest;
   end
endgenerate

endmodule
