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


`timescale 1 ps / 1 ps
module ecpri_top #(
parameter DEVICE_FAMILY       = "Stratix 10",
parameter IP_VERSION           = 2,
parameter PROTOCOL_REVISION    = 1,
parameter IWF_SUPPORT          = "OFF",
parameter IWF_TYPE             = 1,
parameter FRAGMENTATION        = "OFF",
parameter DELAY_MEASUREMENT    = "ON", // HAS set to ON by default
parameter ONE_STEP_DELAY       = "ON",
parameter TS_FINGERPRINT_WIDTH = 1,
parameter PTP_TS_FP_WIDTH      = 6,
parameter INTEL_ORAN           = "OFF",
parameter OOO_SEQ_CHK          = "OFF",
parameter ETH_MTU              = 1500,
parameter MAC_VLAN_EN          = 0,
parameter MAC_TCP_EN           = 0,
parameter BITSPERSYMBOL        = 8,
parameter SYMBOLSPERBEAT       = 8,
parameter TXINS_READY_LATENCY  = 0,   // Tx Insertion Ready Latency, only applicable to output interface with TX Packet Queue.
parameter TX_ERROR_WIDTH       = 1,
parameter RX_ERROR_WIDTH       = 6,
parameter integer DATA_WIDTH   = BITSPERSYMBOL*SYMBOLSPERBEAT, //VHDL port type fix
parameter NOCT                 = DATA_WIDTH/8,
parameter EWIDTH               = 3,
parameter ETH_25G_PTP          = 1,
parameter LL10G_PTP            = 0,
parameter EHIP_PTP             = 0,
parameter READY_LATENCY        = 3,  //Generic Ready Latency followed the Ethernet MAC IP setting. Applied to TX Insertion input interface from eCPRI TX
parameter EXT_SOURCE_FIFO_DEPTH   = 32,
parameter EXT_SINK_0_DFIFO_DEPTH = 128,
parameter EXT_SINK_1_DFIFO_DEPTH = 128,
parameter NUMBER_EXT_SINK_INT     = 1,
parameter ECC_ENABLE           = 0,  //Temporary for local use
parameter IPV4_ENABLE          = 1,
parameter IPV6_ENABLE          = 1,
parameter MSG4_MODE            = 1,  // 1 to enable MSG4 buffer mode
parameter ADV_MAP              = "OFF",
parameter MSG4_TIMER_EN        = "ON",
parameter MSG6_TIMER_EN        = "ON",
parameter MSG4_TIMER_WIDTH     = 12,
parameter MSG5_TIMER_WIDTH     = 16,
parameter MSG6_TIMER_WIDTH     = 12,
parameter SRC_MAC_ADDR0        = 48'h0,
parameter DEST_MAC_ADDR0       = 48'h0,
parameter DEST_MAC_ADDR1       = 48'h0,
parameter DEST_MAC_ADDR2       = 48'h0,
parameter DEST_MAC_ADDR3       = 48'h0,
parameter DEST_MAC_ADDR4       = 48'h0,
parameter DEST_MAC_ADDR5       = 48'h0,
parameter DEST_MAC_ADDR6       = 48'h0,
parameter DEST_MAC_ADDR7       = 48'h0,
parameter VID_ADDR_DF          = 12'h0,
parameter MATCH_MACADDR_VLANID = "MACADDR",
parameter TX_ARBITRATION_SCHEME = "FIXED",
parameter ARB_QUEUE_0_DEPTH    = 128,
parameter ARB_QUEUE_1_DEPTH    = 128,
parameter ARB_QUEUE_2_DEPTH    = 128,
parameter ARB_QUEUE_3_DEPTH    = 128,
parameter ARB_QUEUE_4_DEPTH    = 128,
parameter ARB_QUEUE_5_DEPTH    = 128,
parameter ARB_QUEUE_6_DEPTH    = 128,
parameter ARB_QUEUE_7_DEPTH    = 128
)
(
//Common clock and Reset
input  logic                            mac_clk_tx,
input  logic                            mac_clk_rx,

input  logic                            clk_tx,
input  logic                            clk_rx,
input  logic                            clk_csr,
input  logic                            ext_sink_clk,

input  logic                            rst_tx_n,
input  logic                            rst_rx_n,
input  logic                            rst_csr_n,

// New reset added for IWF in 20.3
output logic                            tx_sync_rst_n,
output logic                            rx_sync_rst_n,

output logic                            err_interrupt,
output logic                            mac_sink_ready,

//AVST Eth MAC to eCPRI
input  logic                            mac_sink_valid,
input  logic [DATA_WIDTH-1 : 0]         mac_sink_data,
input  logic                            mac_sink_sop,
input  logic                            mac_sink_eop,
input  logic [EWIDTH-1 : 0]             mac_sink_empty,
input  logic [RX_ERROR_WIDTH-1 : 0]     mac_sink_error,

//AVST from external Agent
//duplicate to ext sink 0 and 1
/*
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
//PTP_TS_FP_WIDTH now using 6-30 bit (default 6) (6 only for Etile)
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
output logic                            mac_source_error,  //Modelsim VHDL model cannot support [0:0] for_outputs
//Mapper
// user i/f to eCPRI
input  logic                            avst_sink_valid,
input  logic [DATA_WIDTH-1 : 0]         avst_sink_data,
input  logic                            avst_sink_sop,
input  logic                            avst_sink_eop,
input  logic [EWIDTH-1 : 0]             avst_sink_empty,
output logic                            avst_sink_ready,
input  logic                            avst_sink_error,
// sideband
input  logic [31:0]                     sink_pc_id,
input  logic [31:0]                     sink_seq_id,
input  logic [15:0]                     sink_rtc_id,
input  logic                            sink_concatenation,
input  logic [7:0]                      sink_msg_type,

input  logic [7:0]                      sink_mem_acc_id,
input  logic [7:0]                      sink_op_type,
input  logic [15:0]                     sink_element_id,
input  logic [47:0]                     sink_address,
input  logic [15:0]                     sink_length,
input  logic [15:0]                     sink_reset_id,
input  logic [7:0]                      sink_reset_op,
input  logic [7:0]                      sink_event_id,
input  logic [7:0]                      sink_event_type,
// input  logic [7:0]                   sink_notif, // removed as per article:1507615848
// Use in 9K mode
input  logic [15:0]                     sink_pkt_size,
input  logic [15:0]                     sink_pkt_checksum,
input  logic                            tx_transport_c_u,
//AVST for Demapper
// eCPRI to user i/f
output logic                            avst_source_valid,
output logic [DATA_WIDTH-1 : 0]         avst_source_data,
output logic                            avst_source_sop,
output logic                            avst_source_eop,
output logic [EWIDTH-1 : 0]             avst_source_empty,
// input  logic                         avst_source_ready, // removed as per article:1507615848
output logic                            avst_source_error,

// sideband
output logic [31:0]                     source_pc_id,
output logic [31:0]                     source_seq_id,
output logic [15:0]                     source_rtc_id,
output logic [7:0]                      source_msg_type,
output logic                            source_concatenation, //Modelsim VHDL model cannot support [0:0] for outputs
// Stub
output logic [7:0]                      source_mem_acc_id,
output logic [7:0]                      source_op_type,
output logic [15:0]                     source_element_id,
output logic [47:0]                     source_address,
output logic [15:0]                     source_length,
output logic [15:0]                     source_reset_id,
output logic [7:0]                      source_reset_op,
output logic [7:0]                      source_event_id,
output logic [7:0]                      source_event_type,
output logic [7:0]                      source_notif,
output logic                            rx_transport_c_u,

output logic [15:0]                     ptp_offset_timestamp,
output logic [15:0]                     ptp_offset_correction_field,
output logic                            ptp_timestamp_insert,
output logic                            ptp_tx_etstamp_ins_ctrl_residence_time_update,
output logic [PTP_TS_FP_WIDTH+1:0]      ptp_timestamp_request_fingerprint,
output logic                            ptp_timestamp_request_valid,
output logic [95:0]                     ptp_tx_ingress_timestamp_96b_data,

output logic                            tx_queue_0_fifo_full,
output logic                            tx_queue_1_fifo_full,
output logic                            tx_queue_2_fifo_full,
output logic                            tx_queue_3_fifo_full,
output logic                            tx_queue_4_fifo_full,
output logic                            tx_queue_5_fifo_full,
output logic                            tx_queue_6_fifo_full,
output logic                            tx_queue_7_fifo_full,

input  logic                            tx_lanes_stable,
input  logic                            rx_pcs_ready,

//drive to zero for now
output logic                            tx_etstamp_ins_ctrl_timestamp_format,
output logic                            tx_etstamp_ins_ctrl_residence_time_calc_format,
output logic [15:0]                     tx_etstamp_ins_ctrl_offset_checksum_field,
output logic [15:0]                     tx_etstamp_ins_ctrl_offset_checksum_correction,
output logic [95:0]                     tx_etstamp_ins_ctrl_ingress_timestamp_96b,
output logic                            tx_etstamp_ins_ctrl_checksum_zero,
output logic                            tx_etstamp_ins_ctrl_checksum_correct,

// PTP sideband signals form Ethernet MAC & TOD modules
input  logic                            tx_egress_timestamp_96b_valid,
input  logic [95:0]                     tx_egress_timestamp_96b_data,
input  logic [PTP_TS_FP_WIDTH+1:0]      tx_egress_timestamp_96b_fingerprint,
input  logic                            rx_ingress_timestamp_96b_valid,
input  logic [95:0]                     rx_ingress_timestamp_96b_data,
output logic [95:0]                     ext_rx_ingress_timestamp_96b_data,

input logic [95:0]                      rx_tod_time_of_day_96b_data,
input logic [95:0]                      tx_tod_time_of_day_96b_data,

//reconfig                              
input  logic [31:0]                     csr_writedata,
input  logic                            csr_write,
output logic [31:0]                     csr_readdata,
output logic                            csr_readdatavalid,
output logic                            csr_waitrequest,
input  logic                            csr_read,
input  logic [15:0]                     csr_address
);

// localparam
localparam MSG5_ENABLED       = (DELAY_MEASUREMENT == "ON") ? 1 : 0;
localparam BUFFER_MODE_ENABLE = (INTEL_ORAN        == "ON") ? 0 : MSG4_MODE;
localparam ENABLE_MSG4_TIMER  = (INTEL_ORAN        == "ON") ? 0 : (MSG4_TIMER_EN == "ON");
localparam ENABLE_MSG6_TIMER  = (INTEL_ORAN        == "ON") ? 0 : (MSG6_TIMER_EN == "ON");
localparam ENABLE_ADV_MAP     = (ADV_MAP           == "ON") ? 1 : 0;
// Remove localparam TS_FINGERPRINT_UD    = (PTP_TS_FP_WIDTH == 10) ? 1 : 0 ;
//localparam DESC_WIDTH           = TS_FINGERPRINT_UD      ? PTP_TS_FP_WIDTH-3 : 1;
localparam DESC_WIDTH           = PTP_TS_FP_WIDTH;
localparam EXT_TX_TS_FIFO_WIDTH = 96 + PTP_TS_FP_WIDTH;
localparam EXT_TX_TS_FIFO_DEPTH = 8 ;


logic     [2:0]             ecpri_vlan_pcp;
logic                       ecpri_dout_ready;
logic                       ecpri_source_sop_in;
logic                       ecpri_source_eop_in;
logic                       ecpri_source_valid_in;
logic                       ecpri_source_ready_out;
logic     [2:0]             ecpri_source_empty_in;
logic     [DATA_WIDTH-1:0]  ecpri_source_data_in;
logic                       ecpri_source_error_in;
logic                       ecpri_core_ready;

logic                       parser_sop_out;
logic                       parser_eop_out;
logic                       parser_valid_out;
logic     [2:0]             parser_empty_out;
logic     [DATA_WIDTH-1:0]  parser_data_out;
logic     [6-1:0]           parser_error_out;

logic [47:0]                mac_sa0_addr;
logic [15:0]                mac_ethertype;
logic [31:0]                ipv4_src_addr;
logic [15:0]                udp_src0_port;
logic [31:0]                ipv6_src_addr0;
logic [31:0]                ipv6_src_addr1;
logic [31:0]                ipv6_src_addr2;
logic [31:0]                ipv6_src_addr3;

logic [11:0]                vid_addr;
logic                       macaddr_vlanid;
logic [ 2:0]                ecpri_priority;
//logic [ 2:0]                ext_sink_0_priority;
//logic [ 2:0]                ext_sink_1_priority;
logic [ 2:0]                ptp_priority;
logic [ 2:0]                misc_priority;
logic                       en_pq_starvation_ext1;
logic                       en_pq_starvation_ext0;
logic                       rx_ptp_o;
logic                       rx_ecpri_o;
logic                       rx_vlan_o;
logic                       rx_svlan_o;
logic                       rx_ipv4_o;
logic                       rx_ipv6_o;
logic                       rx_udp_o;
logic [3:0]                 rx_ptp_message_type_o;
logic                       rx_ptp_two_step_flag_o;
                            
logic [15:0]                msg5_offset_correction_field;
logic [15:0]                msg5_offset_timestamp;
                            
logic                       ecpri_tx_egress_timestamp_96b_valid;  /* synthesis preserve_syn_only */
logic [95:0]                ecpri_tx_egress_timestamp_96b_data; /* synthesis preserve_syn_only */
logic                       ecpri_tx_egress_timestamp_96b_valid_r;  /* synthesis preserve_syn_only */
logic [95:0]                ecpri_tx_egress_timestamp_96b_data_r; /* synthesis preserve_syn_only */
//logic                       ext_tx_egress_timestamp_96b_valid_i;  /* synthesis preserve_syn_only */
//logic [95:0]                ext_tx_egress_timestamp_96b_data_i; /* synthesis preserve_syn_only */
//logic [PTP_TS_FP_WIDTH-4:0] ext_tx_egress_timestamp_96b_fp_i; /* synthesis preserve_syn_only */

logic                       ext_sink_0_tx_egress_timestamp_96b_valid_i;  /* synthesis preserve_syn_only */
logic                       ext_sink_1_tx_egress_timestamp_96b_valid_i;  /* synthesis preserve_syn_only */
logic [95:0]                ext_sink_0_tx_egress_timestamp_96b_data_i; /* synthesis preserve_syn_only */
logic [95:0]                ext_sink_1_tx_egress_timestamp_96b_data_i; /* synthesis preserve_syn_only */
logic [PTP_TS_FP_WIDTH-1:0] ext_sink_0_tx_egress_timestamp_96b_fp_i; /* synthesis preserve_syn_only */
logic [PTP_TS_FP_WIDTH-1:0] ext_sink_1_tx_egress_timestamp_96b_fp_i; /* synthesis preserve_syn_only */

logic [95:0]                rx_ingress_timestamp_96b_data_o;
logic                       rx_ingress_timestamp_96b_valid_o;

//logic                       ext_tx_ts_fifo_empty;
logic                       ext_sink_0_tx_ts_fifo_empty;
logic                       ext_sink_1_tx_ts_fifo_empty;


logic                       tx_ts_fifo_empty;
//logic [DESC_WIDTH-1:0]      ext_sink_desc;\
//Add for sink 0 and sink 1
logic [DESC_WIDTH-1:0]      ext_sink_0_desc;
logic [DESC_WIDTH-1:0]      ext_sink_1_desc;
logic                       ext_sink_0_desc_valid;
logic                       ext_sink_1_desc_valid;

//logic [96+PTP_TS_FP_WIDTH-2:0] datain_ts_96b;
//logic [96+PTP_TS_FP_WIDTH-2:0] dataout_ts_96b;
logic [96+PTP_TS_FP_WIDTH-1:0] ext_sink_0_datain_ts_96b;
logic [96+PTP_TS_FP_WIDTH-1:0] ext_sink_0_dataout_ts_96b;
logic [96+PTP_TS_FP_WIDTH-1:0] ext_sink_1_datain_ts_96b;
logic [96+PTP_TS_FP_WIDTH-1:0] ext_sink_1_dataout_ts_96b;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++//
// Reset Scheme - HAS0.8
//++++++++++++++++++++++++++++++++++++++++++++++++++++++//
logic                           mm_srst_n;
logic                       tx_srst_n;
logic                       rx_srst_n;
logic [2:0]                 tx_srst_sync_n;
logic [2:0]                 rx_srst_sync_n;
logic                       mm_srst_sync_n;
logic                       tx_srst_mm_n;
logic                       rx_srst_mm_n;
logic                       tx_aggr_nrst;
logic                       rx_aggr_nrst;
logic                       tx_mm_sync_nrst;
logic                       rx_mm_sync_nrst;
logic                       int_tx_mm_sync;
logic                       int_rx_mm_sync;
logic                       tx_srst_n_mac_clk_pre;
logic                       rx_srst_n_mac_clk_pre;
logic                       tx_srst_n_ext_clk_pre;
logic [1:0]                 tx_srst_n_mac_clk;
logic                       rx_srst_n_mac_clk;
logic                       tx_srst_n_ext_clk;
logic                       rx_avst_err;

sync_reset_logic reset_logic_inst (
.clk_tx (clk_tx),
.clk_rx (clk_rx),
.clk_csr (clk_csr),
.mac_clk_tx (mac_clk_tx),
.mac_clk_rx (mac_clk_rx),
.ext_sink_clk (ext_sink_clk),

.rst_tx_n (rst_tx_n),
.rst_rx_n (rst_rx_n),
.rst_csr_n (rst_csr_n),

.tx_lanes_stable (tx_lanes_stable),
.rx_pcs_ready (rx_pcs_ready),

.mm_srst_n (mm_srst_n),
.tx_srst_n (tx_srst_n),
.rx_srst_n (rx_srst_n),
.tx_srst_mm_n (tx_srst_mm_n),
.rx_srst_mm_n (rx_srst_mm_n),
.tx_aggr_nrst (tx_aggr_nrst),
.rx_aggr_nrst (rx_aggr_nrst),
.tx_mm_sync_nrst (tx_mm_sync_nrst),
.rx_mm_sync_nrst (rx_mm_sync_nrst),
.int_tx_mm_sync (int_tx_mm_sync),
.int_rx_mm_sync (int_rx_mm_sync),

.tx_srst_n_mac_clk_pre (tx_srst_n_mac_clk_pre),
.rx_srst_n_mac_clk_pre (rx_srst_n_mac_clk_pre),
.tx_srst_n_ext_clk_pre (tx_srst_n_ext_clk_pre),
.tx_srst_n_mac_clk (tx_srst_n_mac_clk),
.rx_srst_n_mac_clk (rx_srst_n_mac_clk),
.tx_srst_n_ext_clk (tx_srst_n_ext_clk),

.tx_srst_sync_n (tx_srst_sync_n),
.rx_srst_sync_n (rx_srst_sync_n),
.mm_srst_sync_n (mm_srst_sync_n)
);

// Generate TX/RX reset OR
logic msg5_tx_srst_sync, msg5_tx_srst_sync_n;
logic msg5_rx_srst_sync, msg5_rx_srst_sync_n;

alt_ecpri_std_synchronizer_nocut #(.depth(4), .rst_value(0)) msg5_cdc_tx_srst_sync (.clk(clk_tx),       .reset_n(tx_aggr_nrst & int_rx_mm_sync), .din(1'b1), .dout(msg5_tx_srst_sync));
alt_ecpri_std_synchronizer_nocut #(.depth(4), .rst_value(0)) msg5_cdc_rx_srst_sync (.clk(clk_rx),       .reset_n(rx_aggr_nrst & int_tx_mm_sync), .din(1'b1), .dout(msg5_rx_srst_sync));

always_ff @(posedge clk_tx)     msg5_tx_srst_sync_n <= {1{msg5_tx_srst_sync}};
always_ff @(posedge clk_rx)     msg5_rx_srst_sync_n <= {1{msg5_rx_srst_sync}};

// reset for IWF in 20.3
assign tx_sync_rst_n = tx_srst_sync_n[2];
assign rx_sync_rst_n = rx_srst_sync_n[2];

//TODO: drive to zero for now, pending for discussion to decide
assign tx_etstamp_ins_ctrl_timestamp_format = 1'b0;
assign tx_etstamp_ins_ctrl_residence_time_calc_format = 1'b0;
assign tx_etstamp_ins_ctrl_offset_checksum_field = 16'h0;
assign tx_etstamp_ins_ctrl_offset_checksum_correction = 16'h0;
assign tx_etstamp_ins_ctrl_ingress_timestamp_96b = 96'h0;
assign tx_etstamp_ins_ctrl_checksum_zero = 1'b0;
assign tx_etstamp_ins_ctrl_checksum_correct = 1'b0;

//if (TS_FINGERPRINT_UD) begin : genblk_conf_fp
always_ff @(posedge mac_clk_tx) begin
  if (tx_srst_n_mac_clk[0] == 1'b0) begin
     ecpri_tx_egress_timestamp_96b_valid <= 1'b0;
     ext_sink_0_tx_egress_timestamp_96b_valid_i <= 1'b0;
     ext_sink_1_tx_egress_timestamp_96b_valid_i <= 1'b0;
  end else begin
     //2 bit decode for selection: ext_sink_0(PTP)=2'bx00, eCPRI=2'bx01, ext_sink_1(MISC)=2'bx10, other=RESERVED
     ecpri_tx_egress_timestamp_96b_valid        <= (tx_egress_timestamp_96b_fingerprint[PTP_TS_FP_WIDTH+1:PTP_TS_FP_WIDTH] == 2'b01)? tx_egress_timestamp_96b_valid : '0;
     ext_sink_0_tx_egress_timestamp_96b_valid_i <= (tx_egress_timestamp_96b_fingerprint[PTP_TS_FP_WIDTH+1:PTP_TS_FP_WIDTH] == 2'b00)? tx_egress_timestamp_96b_valid : '0;
     ext_sink_1_tx_egress_timestamp_96b_valid_i <= (tx_egress_timestamp_96b_fingerprint[PTP_TS_FP_WIDTH+1:PTP_TS_FP_WIDTH] == 2'b10)? tx_egress_timestamp_96b_valid : '0;

  end
end

always_ff @(posedge mac_clk_tx) begin
    if (tx_srst_n_mac_clk[0] == 1'b0) begin
        ecpri_tx_egress_timestamp_96b_data        <= '0; 
        ext_sink_0_tx_egress_timestamp_96b_data_i <= '0; 
        ext_sink_0_tx_egress_timestamp_96b_fp_i   <= '0;  
        ext_sink_1_tx_egress_timestamp_96b_data_i <= '0;
        ext_sink_1_tx_egress_timestamp_96b_fp_i   <= '0;
    end else begin
        ecpri_tx_egress_timestamp_96b_data        <= (tx_egress_timestamp_96b_fingerprint[PTP_TS_FP_WIDTH+1:PTP_TS_FP_WIDTH] == 2'b01)? tx_egress_timestamp_96b_data : '0;
        ext_sink_0_tx_egress_timestamp_96b_data_i <= (tx_egress_timestamp_96b_fingerprint[PTP_TS_FP_WIDTH+1:PTP_TS_FP_WIDTH] == 2'b00)? tx_egress_timestamp_96b_data : '0;
        ext_sink_0_tx_egress_timestamp_96b_fp_i   <= (tx_egress_timestamp_96b_fingerprint[PTP_TS_FP_WIDTH+1:PTP_TS_FP_WIDTH] == 2'b00)? tx_egress_timestamp_96b_fingerprint[PTP_TS_FP_WIDTH-1:0] : '0;
        ext_sink_1_tx_egress_timestamp_96b_data_i <= (tx_egress_timestamp_96b_fingerprint[PTP_TS_FP_WIDTH+1:PTP_TS_FP_WIDTH] == 2'b10)? tx_egress_timestamp_96b_data : '0;
        ext_sink_1_tx_egress_timestamp_96b_fp_i   <= (tx_egress_timestamp_96b_fingerprint[PTP_TS_FP_WIDTH+1:PTP_TS_FP_WIDTH] == 2'b10)? tx_egress_timestamp_96b_fingerprint[PTP_TS_FP_WIDTH-1:0] : '0;
    end
end

//end 
/*else begin : genblk_stat_fp
 always_ff @(posedge mac_clk_tx) begin
   if (tx_srst_n_mac_clk[0] == 1'b0) begin
      ecpri_tx_egress_timestamp_96b_valid <= 1'b0;
      ext_sink_0_tx_egress_timestamp_96b_valid_i <= 1'b0;
   end else begin
      ecpri_tx_egress_timestamp_96b_valid <= tx_egress_timestamp_96b_valid && (tx_egress_timestamp_96b_fingerprint == 4'h1);
      ext_sink_0_tx_egress_timestamp_96b_valid_i <= tx_egress_timestamp_96b_valid && (tx_egress_timestamp_96b_fingerprint == 4'h2);
   end
 end
end*/


always_ff @(posedge mac_clk_rx) begin
    rx_avst_err <= (~rx_srst_n_mac_clk)? 1'b0 : mac_sink_valid & mac_sink_eop & (|mac_sink_error);
end

//assign ext_tx_egress_timestamp_96b_valid = ~ext_tx_ts_fifo_empty;
assign ext_sink_0_tx_egress_timestamp_96b_valid = ~ext_sink_0_tx_ts_fifo_empty;
assign ext_sink_1_tx_egress_timestamp_96b_valid = ~ext_sink_1_tx_ts_fifo_empty;

//assign datain_ts_96b[96 +: (PTP_TS_FP_WIDTH-3)]  = ext_tx_egress_timestamp_96b_fp_i  ;
//assign datain_ts_96b[ 0 +: 96]                   = ext_tx_egress_timestamp_96b_data_i;
//assign ext_tx_egress_timestamp_96b_data          = dataout_ts_96b[ 0  +: 96 ];
//assign ext_tx_egress_timestamp_96b_fingerprint   = dataout_ts_96b[ 96 +: (PTP_TS_FP_WIDTH-3) ];
assign ext_sink_0_datain_ts_96b[96 +: PTP_TS_FP_WIDTH] = ext_sink_0_tx_egress_timestamp_96b_fp_i  ;
assign ext_sink_0_datain_ts_96b[ 0 +: 96]              = ext_sink_0_tx_egress_timestamp_96b_data_i;
assign ext_sink_0_tx_egress_timestamp_96b_data         = ext_sink_0_dataout_ts_96b[ 0  +: 96 ];
assign ext_sink_0_tx_egress_timestamp_96b_fingerprint  = ext_sink_0_dataout_ts_96b[ 96 +: PTP_TS_FP_WIDTH ];

assign ext_sink_1_datain_ts_96b[96 +: PTP_TS_FP_WIDTH] = ext_sink_1_tx_egress_timestamp_96b_fp_i  ;
assign ext_sink_1_datain_ts_96b[ 0 +: 96]              = ext_sink_1_tx_egress_timestamp_96b_data_i;
assign ext_sink_1_tx_egress_timestamp_96b_data         = ext_sink_1_dataout_ts_96b[ 0  +: 96 ];
assign ext_sink_1_tx_egress_timestamp_96b_fingerprint  = ext_sink_1_dataout_ts_96b[ 96 +: PTP_TS_FP_WIDTH ];

/*
alt_ecpri_fifo #(
    .DEVICE_FAMILY ( DEVICE_FAMILY                         ),
    .DEPTH         ( EXT_TX_TS_FIFO_DEPTH                  ),
    .WIDTH         ( EXT_TX_TS_FIFO_WIDTH                  ),
    .SKID_BUFFER   ( 1                                     ),
    .DUAL_CLOCK    ( 1                                     ),
    .QUAL_PKT_SIG  ( 0                                     )
) ext_tx_ts_fifo (
    .aclr          ( ~tx_srst_n                            ),
    .sclr          ( ~tx_srst_n_ext_clk                    ),
    .wrclk         ( mac_clk_tx                            ),
    .data          ( datain_ts_96b                         ),
    .wrreq         ( ext_tx_egress_timestamp_96b_valid_i   ),
    .wrusedw       (                                       ),
    .rdclk         ( ext_sink_clk                          ),
    .q             ( dataout_ts_96b                        ),
    .rdreq         ( ext_tx_egress_timestamp_96b_valid     ),
    .rdempty       ( ext_tx_ts_fifo_empty                  ),
    // unused
    .wrfull        (                                       ),
    .rdusedw       (                                       ),

    .clock         (                                       ),
    .empty         (                                       ),
    .usedw         (                                       ),
    .almost_full   (                                       )
);
*/
alt_ecpri_fifo #(
    .DEVICE_FAMILY ( DEVICE_FAMILY                              ),
    .DEPTH         ( EXT_TX_TS_FIFO_DEPTH                       ),
    .WIDTH         ( EXT_TX_TS_FIFO_WIDTH                       ),
    .SKID_BUFFER   ( 1                                          ),
    .DUAL_CLOCK    ( 1                                          ),
    .QUAL_PKT_SIG  ( 0                                          )
) ext_sink_0_tx_ts_fifo (
    .aclr          ( ~tx_srst_n                                 ),
    .sclr          ( ~tx_srst_n_ext_clk                         ),
    .wrclk         ( mac_clk_tx                                 ),
    .data          ( ext_sink_0_datain_ts_96b                   ),
    .wrreq         ( ext_sink_0_tx_egress_timestamp_96b_valid_i ),
    .wrusedw       (                                            ),
    .rdclk         ( ext_sink_clk                               ),
    .q             ( ext_sink_0_dataout_ts_96b                  ),
    .rdreq         ( ext_sink_0_tx_egress_timestamp_96b_valid   ),
    .rdempty       ( ext_sink_0_tx_ts_fifo_empty                ),
    // unused
    .wrfull        (                                            ),
    .rdusedw       (                                            ),

    .clock         (                                            ),
    .empty         (                                            ),
    .usedw         (                                            ),
    .almost_full   (                                            )
);

alt_ecpri_fifo #(
    .DEVICE_FAMILY ( DEVICE_FAMILY                              ),
    .DEPTH         ( EXT_TX_TS_FIFO_DEPTH                       ),
    .WIDTH         ( EXT_TX_TS_FIFO_WIDTH                       ),
    .SKID_BUFFER   ( 1                                          ),
    .DUAL_CLOCK    ( 1                                          ),
    .QUAL_PKT_SIG  ( 0                                          )
) ext_sink_1_tx_ts_fifo (
    .aclr          ( ~tx_srst_n                                 ),
    .sclr          ( ~tx_srst_n_ext_clk                         ),
    .wrclk         ( mac_clk_tx                                 ),
    .data          ( ext_sink_1_datain_ts_96b                   ),
    .wrreq         ( ext_sink_1_tx_egress_timestamp_96b_valid_i ),
    .wrusedw       (                                            ),
    .rdclk         ( ext_sink_clk                               ),
    .q             ( ext_sink_1_dataout_ts_96b                  ),
    .rdreq         ( ext_sink_1_tx_egress_timestamp_96b_valid   ),
    .rdempty       ( ext_sink_1_tx_ts_fifo_empty                ),
    // unused
    .wrfull        (                                            ),
    .rdusedw       (                                            ),

    .clock         (                                            ),
    .empty         (                                            ),
    .usedw         (                                            ),
    .almost_full   (                                            )
);

assign ecpri_tx_egress_timestamp_96b_valid_r = ~tx_ts_fifo_empty;

alt_ecpri_fifo #(
    .DEVICE_FAMILY ( DEVICE_FAMILY                         ),
    .DEPTH         ( 8                                     ),
    .WIDTH         ( 96                                    ),
    .SKID_BUFFER   ( 1                                     ),
    .DUAL_CLOCK    ( 1                                     ),
    .QUAL_PKT_SIG  ( 0                                     )
) tx_ts_fifo (
    .aclr          ( ~tx_srst_n                            ),
    .sclr          ( ~tx_srst_sync_n[0]                    ),
    .wrclk         ( mac_clk_tx                            ),
    .data          ( ecpri_tx_egress_timestamp_96b_data    ),
    .wrreq         ( ecpri_tx_egress_timestamp_96b_valid   ),
    .wrusedw       (                                       ),
    .rdclk         ( clk_tx                                ),
    .q             ( ecpri_tx_egress_timestamp_96b_data_r  ),
    .rdreq         ( ecpri_tx_egress_timestamp_96b_valid_r ),
    .rdempty       ( tx_ts_fifo_empty                      ),
    // unused
    .wrfull        (                                       ),
    .rdusedw       (                                       ),

    .clock         (                                       ),
    .empty         (                                       ),
    .usedw         (                                       ),
    .almost_full   (                                       )
);

//DUT RTL
ecpri #(
  .DEVICE_FAMILY        (DEVICE_FAMILY),
  .IP_VERSION           (IP_VERSION),
  .PROTOCOL_REVISION    (PROTOCOL_REVISION),
  .IWF_SUPPORT          (IWF_SUPPORT),
  .IWF_TYPE             (IWF_TYPE),
  .FRAGMENTATION        (FRAGMENTATION),
  .MSG5_ENABLED         (MSG5_ENABLED),
  .ONE_STEP_DELAY       (ONE_STEP_DELAY),
  .INTEL_ORAN           (INTEL_ORAN),
  .ETH_MTU              (ETH_MTU),
  .OOO_SEQ_CHK          (OOO_SEQ_CHK),
  .MAC_VLAN_EN          (MAC_VLAN_EN),
  .MAC_TCP_EN           (MAC_TCP_EN),
  .BITSPERSYMBOL        (BITSPERSYMBOL),
  .SYMBOLSPERBEAT       (SYMBOLSPERBEAT),
  .TXINS_READY_LATENCY  (TXINS_READY_LATENCY),
  .DATA_WIDTH           (BITSPERSYMBOL*SYMBOLSPERBEAT),
  .TX_ERROR_WIDTH       (TX_ERROR_WIDTH),
  .RX_ERROR_WIDTH       (RX_ERROR_WIDTH),
  .IPV4_ENABLE          (IPV4_ENABLE),
  .IPV6_ENABLE          (IPV6_ENABLE),
  .ECC_ENABLE           (ECC_ENABLE),
  .ADV_MAP              (ENABLE_ADV_MAP),
  .BUFFER_MODE_ENABLE   (BUFFER_MODE_ENABLE),
  .ENABLE_MSG4_TIMER    (ENABLE_MSG4_TIMER),
  .ENABLE_MSG6_TIMER    (ENABLE_MSG6_TIMER),
  .MSG4_TIMER_WIDTH     (MSG4_TIMER_WIDTH),
  .MSG5_TIMER_WIDTH     (MSG5_TIMER_WIDTH),
  .MSG6_TIMER_WIDTH     (MSG6_TIMER_WIDTH),
  .SRC_MAC_ADDR0        (SRC_MAC_ADDR0 ),
  .DEST_MAC_ADDR0       (DEST_MAC_ADDR0),
  .DEST_MAC_ADDR1       (DEST_MAC_ADDR1),
  .DEST_MAC_ADDR2       (DEST_MAC_ADDR2),
  .DEST_MAC_ADDR3       (DEST_MAC_ADDR3),
  .DEST_MAC_ADDR4       (DEST_MAC_ADDR4),
  .DEST_MAC_ADDR5       (DEST_MAC_ADDR5),
  .DEST_MAC_ADDR6       (DEST_MAC_ADDR6),
  .DEST_MAC_ADDR7       (DEST_MAC_ADDR7),
  .VID_ADDR_DF          (VID_ADDR_DF),
  .MATCH_MACADDR_VLANID (MATCH_MACADDR_VLANID),
  .TX_ARBITRATION_SCHEME(TX_ARBITRATION_SCHEME)  
) ecpri_i (
// dangles here
.err_interrupt(err_interrupt),

//CLK and RESET
.clk_tx     (clk_tx),
.clk_rx     (clk_rx),
.clk_csr    (clk_csr),
.mac_clk_tx (mac_clk_tx),

//RX mac clk & rst for csrunit used
.mac_clk_rx (mac_clk_rx),
.rst_rx_n_mac_clk (rx_srst_n_mac_clk),

.arst_tx_n        (tx_srst_n),
.rst_tx_n         (tx_srst_sync_n[0]),
.rst_rx_n         (rx_srst_sync_n[0]),
.rst_tx_n_mac_clk (tx_srst_n_mac_clk[0]),

.rst_csr_n(mm_srst_sync_n),
.rst_msg5_tx_n(msg5_tx_srst_sync_n),
.rst_msg5_rx_n(msg5_rx_srst_sync_n),
.tx_mm_sync_nrst (tx_mm_sync_nrst),
.rx_mm_sync_nrst (rx_mm_sync_nrst),

//AVMM for CSR
.csr_address(csr_address),
.csr_write(csr_write),
.csr_writedata(csr_writedata),
.csr_read(csr_read),
.csr_readdata(csr_readdata),
.csr_readdatavalid(csr_readdatavalid),
.csr_waitrequest(csr_waitrequest),

//CSR rx_avst_in_err
.rx_avst_err    (rx_avst_err),

//from MAC AVST RX
.mac_sink_sop (parser_sop_out),
.mac_sink_eop (parser_eop_out),
.mac_sink_valid (parser_valid_out),
.mac_sink_data (parser_data_out),
.mac_sink_empty (parser_empty_out),
.mac_sink_error (parser_error_out),
.mac_sink_channel(16'b0),
.mac_sink_ready (ecpri_core_ready),
//to MAC AVST TX
.mac_source_valid (ecpri_source_valid_in),
.mac_source_data  (ecpri_source_data_in),
.mac_source_sop   (ecpri_source_sop_in),
.mac_source_eop   (ecpri_source_eop_in),
.mac_source_empty (ecpri_source_empty_in),
.mac_source_ready (ecpri_source_ready_out),
.mac_source_error (ecpri_source_error_in),
.ecpri_vlan_pcp (ecpri_vlan_pcp),
.ecpri_dout_ready (ecpri_dout_ready),
.mac_source_channel(),
//AVST for Demapper
.avst_source_valid(avst_source_valid),
.avst_source_data(avst_source_data),
//.avst_source_channel(),
.avst_source_sop(avst_source_sop),
.avst_source_eop(avst_source_eop),
.avst_source_empty(avst_source_empty),
.avst_source_ready(1'b0),
.avst_source_error(avst_source_error),
.source_concat(source_concatenation),
.source_pc_id(source_pc_id),
.source_seq_id(source_seq_id),
.source_rtc_id(source_rtc_id),
.source_msg_type(source_msg_type),
.source_mem_acc_id(source_mem_acc_id),
.source_op_type(source_op_type),
.source_element_id(source_element_id),
.source_address(source_address),
.source_length(source_length),
.source_reset_id(source_reset_id),
.source_reset_op(source_reset_op),
.source_event_id(source_event_id),
.source_event_type(source_event_type),
.source_notif(source_notif),

//AVST for Mapper
.avst_sink_valid(avst_sink_valid),
.avst_sink_data(avst_sink_data),
//.avst_sink_channel(16'b0),
.avst_sink_sop(avst_sink_sop),
.avst_sink_eop(avst_sink_eop),
.avst_sink_empty(avst_sink_empty),
.avst_sink_ready(avst_sink_ready),
.avst_sink_error(avst_sink_error),
.sink_pc_id(sink_pc_id),
.sink_seq_id(sink_seq_id),
.sink_rtc_id(sink_rtc_id),
.sink_concatenation(sink_concatenation),
.sink_msg_type(sink_msg_type),
.sink_mem_acc_id(sink_mem_acc_id),
.sink_op_type(sink_op_type),
.sink_element_id(sink_element_id),
.sink_address(sink_address),
.sink_length(sink_length),
.sink_reset_id(sink_reset_id),
.sink_reset_op(sink_reset_op),
.sink_event_id(sink_event_id),
.sink_event_type(sink_event_type),
.sink_notif(8'b0),
.sink_pkt_size(sink_pkt_size),
.sink_pkt_checksum(sink_pkt_checksum),

.tx_transport_c_u(tx_transport_c_u),
.rx_transport_c_u(rx_transport_c_u),

.pc_ip_vlan(rx_vlan_o),
.pc_ip_svlan(rx_svlan_o),
.pc_ip_ipv4(rx_ipv4_o),
.pc_ip_ipv6(rx_ipv6_o),
.pc_ip_udp(rx_udp_o),
.pc_ip_ecpri(rx_ecpri_o),

.msg5_pkt       (msg5_pkt),
.msg5_ts_insert (msg5_ts_insert),
.msg5_ts_valid  (msg5_ts_valid),
.msg5_ts_rt_update (msg5_ts_rt_update),
.msg5_offset_correction_field (msg5_offset_correction_field),
.msg5_offset_timestamp (msg5_offset_timestamp),
.in_timestamp_valid_rx (rx_ingress_timestamp_96b_valid_o),
.in_timestamp_rx (rx_ingress_timestamp_96b_data_o),
.in_timestamp_valid_tx (ecpri_tx_egress_timestamp_96b_valid_r),
.in_timestamp_tx (ecpri_tx_egress_timestamp_96b_data_r),

.mac_sa0_addr     (mac_sa0_addr),
.mac_ethertype    (mac_ethertype),
.ipv4_src_addr    (ipv4_src_addr),
.udp_src0_port    (udp_src0_port),
.ipv6_src_addr0   (ipv6_src_addr0),
.ipv6_src_addr1   (ipv6_src_addr1),
.ipv6_src_addr2   (ipv6_src_addr2),
.ipv6_src_addr3   (ipv6_src_addr3),
.vid_addr_o       (vid_addr),
.macaddr_vlanid_o (macaddr_vlanid),
//.ecpri_priority_o (ecpri_priority),            
.ptp_priority_o   (ptp_priority),      
.misc_priority_o  (misc_priority),
.en_pq_starvation_ext1_o (en_pq_starvation_ext1),
.en_pq_starvation_ext0_o (en_pq_starvation_ext0)
);

//assign ext_sink_desc = TS_FINGERPRINT_UD ? ext_ptp_timestamp_request_fingerprint : '0;
//Add sink 0 and sink 1
assign ext_sink_0_desc       = ext_sink_0_timestamp_request_fingerprint;
assign ext_sink_0_desc_valid = ext_sink_0_timestamp_request_valid;
assign ext_sink_1_desc       = ext_sink_1_timestamp_request_fingerprint;
assign ext_sink_1_desc_valid = ext_sink_1_timestamp_request_valid;

packet_queue #(
.DEVICE_FAMILY        (DEVICE_FAMILY),
.BITSPERSYMBOL        (BITSPERSYMBOL),
.SYMBOLSPERBEAT       (SYMBOLSPERBEAT),
.READY_LATENCY        (READY_LATENCY),
.DATA_PATH            ("TX"),
.MAC_VLAN_EN          (MAC_VLAN_EN),
.MAC_TCP_EN           (MAC_TCP_EN),
.ERROR_WIDTH          (TX_ERROR_WIDTH),
.EMPTY_WIDTH          (EWIDTH),
.EXT_SINK_0_DFIFO_DEPTH  (EXT_SINK_0_DFIFO_DEPTH),
.EXT_SINK_1_DFIFO_DEPTH  (EXT_SINK_1_DFIFO_DEPTH),
.NUMBER_EXT_SINK_INT      (NUMBER_EXT_SINK_INT),
.DESC_WIDTH               (DESC_WIDTH),
.PTP_TS_FP_WIDTH          (PTP_TS_FP_WIDTH),
//.TS_FINGERPRINT_UD        (TS_FINGERPRINT_UD),
.TX_ARBITRATION_SCHEME    (TX_ARBITRATION_SCHEME),
.ARB_QUEUE_0_DEPTH      (ARB_QUEUE_0_DEPTH),
.ARB_QUEUE_1_DEPTH      (ARB_QUEUE_1_DEPTH),
.ARB_QUEUE_2_DEPTH      (ARB_QUEUE_2_DEPTH),
.ARB_QUEUE_3_DEPTH      (ARB_QUEUE_3_DEPTH),
.ARB_QUEUE_4_DEPTH      (ARB_QUEUE_4_DEPTH),
.ARB_QUEUE_5_DEPTH      (ARB_QUEUE_5_DEPTH),
.ARB_QUEUE_6_DEPTH      (ARB_QUEUE_6_DEPTH),
.ARB_QUEUE_7_DEPTH      (ARB_QUEUE_7_DEPTH)
) packet_queue_inst (

.mac_source_clk   (mac_clk_tx),
.ext_sink_clk     (ext_sink_clk),

.reset_n          (tx_srst_n),
.reset_n_src_clk  (tx_srst_n_mac_clk[1]),

//Avalon St logic DataIn (Sink) Interface from External HPS
/* Remove ext_sink port
.ext_sink_sop   (ext_sink_sop),
.ext_sink_eop   (ext_sink_eop),
.ext_sink_valid (ext_sink_valid),
.ext_sink_data  (ext_sink_data),
.ext_sink_empty (ext_sink_empty),
.ext_sink_error (ext_sink_error),
.ext_sink_ready (ext_sink_ready),
.ext_sink_desc  (ext_sink_desc),
.ext_tx_ingress_timestamp_96b_data             (ext_tx_ingress_timestamp_96b_data),
*/
//Add ext_sink_0 port
.ext_sink_0_sop   (ext_sink_0_sop),
.ext_sink_0_eop   (ext_sink_0_eop),
.ext_sink_0_valid (ext_sink_0_valid),
.ext_sink_0_data  (ext_sink_0_data),
.ext_sink_0_empty (ext_sink_0_empty),
.ext_sink_0_error (ext_sink_0_error),
.ext_sink_0_ready (ext_sink_0_ready),
.ext_sink_0_desc  (ext_sink_0_desc),
.ext_sink_0_desc_valid (ext_sink_0_desc_valid),
.ext_sink_0_tx_ingress_timestamp_96b_data (ext_sink_0_tx_ingress_timestamp_96b_data),
//Add ext_sink_1 port
.ext_sink_1_sop   (ext_sink_1_sop),
.ext_sink_1_eop   (ext_sink_1_eop),
.ext_sink_1_valid (ext_sink_1_valid),
.ext_sink_1_data  (ext_sink_1_data),
.ext_sink_1_empty (ext_sink_1_empty),
.ext_sink_1_error (ext_sink_1_error),
.ext_sink_1_ready (ext_sink_1_ready),
.ext_sink_1_desc  (ext_sink_1_desc),
.ext_sink_1_desc_valid (ext_sink_1_desc_valid),
.ext_sink_1_tx_ingress_timestamp_96b_data (ext_sink_1_tx_ingress_timestamp_96b_data),

.mac_frame_srcaddr (mac_sa0_addr),
.mac_ethertype     (mac_ethertype),
.ipv4_src_addr     (ipv4_src_addr),
.udp_src0_port     (udp_src0_port),
.ipv6_src_addr0    (ipv6_src_addr0),
.ipv6_src_addr1    (ipv6_src_addr1),
.ipv6_src_addr2    (ipv6_src_addr2),
.ipv6_src_addr3    (ipv6_src_addr3),

.ecpri_sink_sop     (ecpri_source_sop_in),
.ecpri_sink_eop     (ecpri_source_eop_in),
.ecpri_sink_valid   (ecpri_source_valid_in),
.ecpri_source_ready (ecpri_source_ready_out),
.ecpri_sink_data    (ecpri_source_data_in),
.ecpri_sink_empty   (ecpri_source_empty_in),
.ecpri_sink_error   (ecpri_source_error_in),
.ecpri_vlan_pcp     (ecpri_vlan_pcp), 
.ecpri_dout_ready   (ecpri_dout_ready),

//Avalon St logic DataOut (Source) Interface to Ethernet MAC
.mac_source_sop     (mac_source_sop),
.mac_source_eop     (mac_source_eop),
.mac_source_valid   (mac_source_valid),
.mac_source_ready   (mac_source_ready),
.mac_source_data    (mac_source_data),
.mac_source_empty   (mac_source_empty),
.mac_source_error   (mac_source_error),

.msg5_pkt                                      (msg5_pkt),
.msg5_ptp_ts_insert                            (msg5_ts_insert),
.msg5_ptp_ts_valid                             (msg5_ts_valid),
.msg5_ptp_ts_rt_update                         (msg5_ts_rt_update),
.msg5_offset_correction_field                  (msg5_offset_correction_field),
.msg5_offset_timestamp                         (msg5_offset_timestamp),
.ptp_offset_timestamp                          (ptp_offset_timestamp),
.ptp_offset_correction_field                   (ptp_offset_correction_field),
.ptp_timestamp_insert                          (ptp_timestamp_insert),
.ptp_tx_etstamp_ins_ctrl_residence_time_update (ptp_tx_etstamp_ins_ctrl_residence_time_update),
.ptp_timestamp_request_fingerprint             (ptp_timestamp_request_fingerprint),
.ptp_timestamp_request_valid                   (ptp_timestamp_request_valid),

.tx_queue_0_fifo_full                          (tx_queue_0_fifo_full),
.tx_queue_1_fifo_full                          (tx_queue_1_fifo_full),
.tx_queue_2_fifo_full                          (tx_queue_2_fifo_full),
.tx_queue_3_fifo_full                          (tx_queue_3_fifo_full),
.tx_queue_4_fifo_full                          (tx_queue_4_fifo_full),
.tx_queue_5_fifo_full                          (tx_queue_5_fifo_full),
.tx_queue_6_fifo_full                          (tx_queue_6_fifo_full),
.tx_queue_7_fifo_full                          (tx_queue_7_fifo_full),

//.ecpri_priority                                (ecpri_priority),            
.ptp_priority                                  (ptp_priority),      
.misc_priority                                 (misc_priority),
.en_pq_starvation_ext1                         (en_pq_starvation_ext1),
.en_pq_starvation_ext0                         (en_pq_starvation_ext0),

.ptp_tx_ingress_timestamp_96b_data             (ptp_tx_ingress_timestamp_96b_data)
);

packet_parser #(
.DEVICE_FAMILY  (DEVICE_FAMILY),
.DATA_PATH      ("RX"),
.BITSPERSYMBOL  (BITSPERSYMBOL),
.SYMBOLSPERBEAT (SYMBOLSPERBEAT),
.ERROR_WIDTH    (RX_ERROR_WIDTH),
.MAC_VLAN_EN    (MAC_VLAN_EN),
.MAC_TCP_EN     (MAC_TCP_EN),
.EXT_SOURCE_FIFO_DEPTH (EXT_SOURCE_FIFO_DEPTH),
.READY_LATENCY  (READY_LATENCY),
.EMPTY_WIDTH    (EWIDTH),
.DESC_WIDTH     (1)
) rx_packet_parser_inst (
//Common clock and Reset
.data_sink_clk   (mac_clk_rx),
.data_source_clk (clk_rx),
.ext_source_clk  (ext_sink_clk),

.rst_n           (rx_srst_n),
.rst_n_sink_clk  (rx_srst_n_mac_clk),
.rst_n_src_clk   (rx_srst_sync_n[1]),

//Avalon St logic DataIn (Sink) Interface from MAC
.ext_sink_sop   (mac_sink_sop),
.ext_sink_eop   (mac_sink_eop),
.ext_sink_valid (mac_sink_valid),
.ext_sink_data  (mac_sink_data),
.ext_sink_empty (mac_sink_empty),
.ext_sink_error (mac_sink_error),
.ext_sink_ready (mac_sink_ready),

//tie 0 for rx path, not used in RX
.ext_sink_desc       ('0),
.ext_sink_desc_valid ('0),
.ptp_priority        ('0),
.misc_priority       ('0),

.mac_frame_srcaddr   (mac_sa0_addr),
.mac_ethertype       (mac_ethertype),

.ipv4_src_addr  (ipv4_src_addr),
.udp_src0_port  (udp_src0_port),
.ipv6_src_addr0 (ipv6_src_addr0),
.ipv6_src_addr1 (ipv6_src_addr1),
.ipv6_src_addr2 (ipv6_src_addr2),
.ipv6_src_addr3 (ipv6_src_addr3),

.vid_addr       (vid_addr),
.macaddr_vlanid (macaddr_vlanid),

.ecpri_o             (rx_ecpri_o),
.vlan_o              (rx_vlan_o),
.svlan_o             (rx_svlan_o),
.ipv4_o              (rx_ipv4_o),
.ipv6_o              (rx_ipv6_o),
.ptp_o               (rx_ptp_o),
.udp_o               (rx_udp_o),
.ptp_message_type_o  (rx_ptp_message_type_o),
.ptp_two_step_flag_o (rx_ptp_two_step_flag_o),

.rx_ingress_timestamp_96b_valid (rx_ingress_timestamp_96b_valid),
.rx_ingress_timestamp_96b_data (rx_ingress_timestamp_96b_data),
.rx_ingress_timestamp_96b_data_o (rx_ingress_timestamp_96b_data_o),
.rx_ingress_timestamp_96b_valid_o (rx_ingress_timestamp_96b_valid_o),
.ext_rx_ingress_timestamp_96b_data_o (ext_rx_ingress_timestamp_96b_data),
.ext_tx_ingress_timestamp_96b_data (96'h0),
.ptp_tx_ingress_timestamp_96b_data (),
//Avalon St logic DataOut (Source) Interface to eCPRI/user
.data_source_ready (ecpri_core_ready),
.data_source_sop   (parser_sop_out),
.data_source_eop   (parser_eop_out),
.data_source_valid (parser_valid_out),
.data_source_data  (parser_data_out),
.data_source_empty (parser_empty_out),
.data_source_error (parser_error_out),
.data_source_desc  (),
.data_source_vlan_pcp (),

//Avalon St logic DataOut (Source) Interface to external agent, no backpressure at here
.ext_source_ready (1'b1),
.ext_source_sop   (ext_source_sop),
.ext_source_eop   (ext_source_eop),
.ext_source_valid (ext_source_valid),
.ext_source_data  (ext_source_data),
.ext_source_empty (ext_source_empty),
.ext_source_error (ext_source_error),
.ext_source_vlan_pcp (),
.ext_source_pkt_type(ext_source_pkt_type)
);

endmodule
