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


// Copyright 2012 Altera Corporation. All rights reserved.
// Altera products are protected under numerous U.S. and foreign patents,
// maskwork rights, copyrights and other intellectual property laws.
//
// This reference design file, and your use thereof, is subject to and governed
// by the terms and conditions of the applicable Altera Reference Design
// License Agreement (either as signed by you or found at www.altera.com).  By
// using this reference design file, you indicate your acceptance of such terms
// and conditions between you and Altera Corporation.  In the event that you do
// not agree with such terms and conditions, you may not use the reference
// design file and please promptly destroy any copies you have made.
//
// This reference design file is being provided on an "as-is" basis and as an
// accommodation and therefore all warranties, representations or guarantees of
// any kind (whether express, implied or statutory) including, without
// limitation, warranties of merchantability, non-infringement, or fitness for
// a particular purpose, are specifically disclaimed.  By making this reference
// design file available, Altera expressly does not recommend, suggest or
// require that this reference design file be used in combination with any
// other product not provided by Altera.
/////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

import ecpri_pkg::*;

module ecpri #(
parameter MAC_VLAN_EN  = 0,
parameter MAC_TCP_EN  = 0,
parameter BITSPERSYMBOL  = 8,
parameter SYMBOLSPERBEAT  = 8,
parameter DATA_WIDTH  = BITSPERSYMBOL * SYMBOLSPERBEAT,
parameter TX_ERROR_WIDTH  = 1,
parameter RX_ERROR_WIDTH  = 6,
parameter DEVICE_FAMILY        = "Stratix 10",
parameter IP_VERSION           = 1,
parameter PROTOCOL_REVISION    = 1,
parameter IWF_SUPPORT          = "OFF",
parameter IWF_TYPE             = 1,
parameter FRAGMENTATION        = "OFF",
parameter DELAY_MEASUREMENT    = "OFF", // HAS set to ON by default
parameter ONE_STEP_DELAY       = "OFF",
// parameter TWO_STEP_DELAY       = "OFF",
parameter TS_FINGERPRINT_WIDTH = 1,
parameter INTEL_ORAN           = "OFF",
parameter READY_LATENCY        = 3,
parameter TXINS_READY_LATENCY  = 3,                                 // Tx Insertion Ready Latency
parameter OOO_SEQ_CHK          = "OFF",
parameter ETH_MTU              = 1500,
parameter MSG5_ENABLED         = 1,  
parameter ADV_MAP    	       = 0, 
parameter ECC_ENABLE           = 0, 
parameter BUFFER_MODE_ENABLE   = 0,
parameter ENABLE_MSG4_TIMER    = 1,
parameter ENABLE_MSG6_TIMER    = 1,  
parameter MSG4_TIMER_WIDTH     = 10,
parameter MSG5_TIMER_WIDTH     = 16,
parameter MSG6_TIMER_WIDTH     = 10,
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
// Anything below this line is localparam
parameter CWIDTH               = 16,
parameter NOCT                 = DATA_WIDTH/8,
parameter EWIDTH               = log2(NOCT-1),
parameter IPV4_ENABLE          = 1,     //Temporary for local use, future may go to user configurable
parameter IPV6_ENABLE          = 0      //Temporary for local use, future may go to user configurable
)(
output        err_interrupt,         //  Error Interrupt signal. Indicate errors occur in eCPRI IP. Software can poll eCPRI Error Message Register to determine error info

// AVMM I/F
input  [15:0] csr_address,
input         csr_write,
input  [31:0] csr_writedata,
input         csr_read,
output [31:0] csr_readdata,
output        csr_readdatavalid,
output        csr_waitrequest,

// eCPRI to Eth MAC
output                     mac_source_valid,
output [DATA_WIDTH-1 : 0]  mac_source_data,
output [CWIDTH-1 : 0]      mac_source_channel,
output                     mac_source_sop,
output                     mac_source_eop,
output [EWIDTH-1 : 0]      mac_source_empty,
input                      mac_source_ready,
output [TX_ERROR_WIDTH-1 : 0] mac_source_error,
output [2:0]               ecpri_vlan_pcp,
output					   ecpri_dout_ready,

// Eth MAC to eCPRI
input                     mac_sink_valid,
input [DATA_WIDTH-1 : 0]  mac_sink_data,
input [CWIDTH-1 : 0]      mac_sink_channel,
input                     mac_sink_sop,
input                     mac_sink_eop,
input [EWIDTH-1 : 0]      mac_sink_empty,
output                    mac_sink_ready,
input [RX_ERROR_WIDTH-1:0] mac_sink_error,

// eCPRI to user i/f
output                    avst_source_valid,
output [DATA_WIDTH-1 : 0] avst_source_data,
output [CWIDTH-1 : 0]     avst_source_channel,
output                    avst_source_sop,
output                    avst_source_eop,
output [EWIDTH-1 : 0]     avst_source_empty,
input                     avst_source_ready,
output                    avst_source_error,
// sideband
output         source_concat,
output [31:0]  source_pc_id,
output [31:0]  source_seq_id,
output [15:0]  source_rtc_id,
output [7:0]   source_msg_type,
// Stub
output [7:0]   source_mem_acc_id,
output [7:0]   source_op_type,
output [15:0]  source_element_id,
output [47:0]  source_address,
output [15:0]  source_length,
output [15:0]  source_reset_id,
output [7:0]   source_reset_op,
output [7:0]   source_event_id,
output [7:0]   source_event_type,
output [7:0]   source_notif,

// user i/f to eCPRI
input                     avst_sink_valid,
input [DATA_WIDTH-1 : 0]  avst_sink_data,
//input [CWIDTH-1 : 0]      avst_sink_channel,
input                     avst_sink_sop,
input                     avst_sink_eop,
input [EWIDTH-1 : 0]      avst_sink_empty,
output                    avst_sink_ready,
input [TX_ERROR_WIDTH-1 : 0] avst_sink_error,
// sideband
input [31:0]   sink_pc_id,
input [31:0]   sink_seq_id,
input [15:0]   sink_rtc_id,
input          sink_concatenation,
input [7:0]    sink_msg_type,
// Stub
input [7:0]    sink_mem_acc_id,
input [7:0]    sink_op_type,
input [15:0]   sink_element_id,
input [47:0]   sink_address,
input [15:0]   sink_length,
input [15:0]   sink_reset_id,
input [7:0]    sink_reset_op,
input [7:0]    sink_event_id,
input [7:0]    sink_event_type,
input [7:0]    sink_notif,
input [15:0]   sink_pkt_size,
input [15:0]   sink_pkt_checksum,

// ORAN (n/c in ecpri1.2)
input          tx_transport_c_u,
output         rx_transport_c_u,

// Misc
output  [47:0] 	          mac_sa0_addr,
output  [15:0] 	     	  mac_ethertype,
output  [31:0]            ipv4_src_addr,
output  [15:0]            udp_src0_port,
output  [31:0]            ipv6_src_addr0,
output  [31:0]            ipv6_src_addr1,
output  [31:0]            ipv6_src_addr2,
output  [31:0]            ipv6_src_addr3,
output  [11:0]            vid_addr_o,
output                    macaddr_vlanid_o,
//output  [ 2:0]            ecpri_priority_o,
output  [ 2:0]            ptp_priority_o,
output  [ 2:0]            misc_priority_o,
output                    en_pq_starvation_ext1_o,
output                    en_pq_starvation_ext0_o,
//RX packet classifier control signals to Header Removal 
input logic            pc_ip_vlan,
input logic            pc_ip_svlan,
input logic            pc_ip_ipv4,
input logic            pc_ip_ipv6,
input logic            pc_ip_udp,
input logic            pc_ip_ecpri,

output logic 			msg5_pkt,
output logic 			msg5_ts_insert,
output logic 			msg5_ts_valid,
output logic 			msg5_ts_rt_update,
output logic [15:0]     msg5_offset_correction_field,
output logic [15:0]     msg5_offset_timestamp,
input  logic			in_timestamp_valid_tx,
input  logic [95:0] 	in_timestamp_tx,
input  logic			in_timestamp_valid_rx,
input  logic [95:0] 	in_timestamp_rx,

//CSR rx_avst_in_err
input                   rx_avst_err,

// Clock
input         clk_tx,
input         clk_rx,
input         mac_clk_tx,
input         clk_csr,  // 100MHz

//For csrunit used
input         mac_clk_rx,
input         rst_rx_n_mac_clk,

// Reset
input         arst_tx_n,  //
input         rst_tx_n,  //
input         rst_rx_n,  //
input         rst_tx_n_mac_clk,  //
input         rst_csr_n, //
input         rst_msg5_tx_n,
input         rst_msg5_rx_n,
// MAC ready
input tx_mm_sync_nrst,
input rx_mm_sync_nrst

);

// stub output signal until design complete.
wire rx_sop_missing;
wire rx_eop_missing;
wire rx_overflow;   
wire rx_ecc_err;    
wire rx_rsvd_msg_err;    
wire [7:0] rx_rsvd_msg;    
wire tx_sop_missing;
wire tx_eop_missing;
wire tx_overflow;   
wire tx_ecc_err;    
wire tx_rsvd_msg_err;    
wire [7:0] tx_rsvd_msg;    
wire cont_timeout_err;
wire sing_gt_mtu_err;
wire mult_gt_mtu_err;
wire pkt_size_err;
wire buffer_mode_en;
wire buffer_mode_err;

wire  [ 2:0]      ecpri_priority_o;

wire  [31:0] 	  ethfrm_scratch;
wire  [31:0] 	  mac_sa0_addr0;
wire  [15:0] 	  mac_sa0_addr1;
wire  [31:0] 	  mac_da0_addr0;
wire  [15:0] 	  mac_da0_addr1;

wire  [31:0] 	  mac_da1_addr0;
wire  [15:0] 	  mac_da1_addr1;
wire  [31:0] 	  mac_da2_addr0;
wire  [15:0] 	  mac_da2_addr1;
wire  [31:0] 	  mac_da3_addr0;
wire  [15:0] 	  mac_da3_addr1;
wire  [31:0] 	  mac_da4_addr0;
wire  [15:0] 	  mac_da4_addr1;
wire  [31:0] 	  mac_da5_addr0;
wire  [15:0] 	  mac_da5_addr1;
wire  [31:0] 	  mac_da6_addr0;
wire  [15:0] 	  mac_da6_addr1;
wire  [31:0] 	  mac_da7_addr0;
wire  [15:0] 	  mac_da7_addr1;

wire  [11:0] 	  mac_vlan_tag0_vid;
wire         	  mac_vlan_tag0_dei;
wire  [2:0]  	  mac_vlan_tag0_pcp;
wire  [15:0] 	  mac_vlan_tag0_tpid;
wire  [11:0] 	  mac_vlan_tag1_vid;
wire         	  mac_vlan_tag1_dei;
wire  [2:0]  	  mac_vlan_tag1_pcp;
wire  [15:0] 	  mac_vlan_tag1_tpid;
wire  [11:0] 	  mac_vlan_tag2_vid;
wire         	  mac_vlan_tag2_dei;
wire  [2:0]  	  mac_vlan_tag2_pcp;
wire  [15:0] 	  mac_vlan_tag2_tpid;
wire  [11:0] 	  mac_vlan_tag3_vid;
wire         	  mac_vlan_tag3_dei;
wire  [2:0]  	  mac_vlan_tag3_pcp;
wire  [15:0] 	  mac_vlan_tag3_tpid;
wire  [11:0] 	  mac_vlan_tag4_vid;
wire         	  mac_vlan_tag4_dei;
wire  [2:0]  	  mac_vlan_tag4_pcp;
wire  [15:0] 	  mac_vlan_tag4_tpid;
wire  [11:0] 	  mac_vlan_tag5_vid;
wire         	  mac_vlan_tag5_dei;
wire  [2:0]  	  mac_vlan_tag5_pcp;
wire  [15:0] 	  mac_vlan_tag5_tpid;
wire  [11:0] 	  mac_vlan_tag6_vid;
wire         	  mac_vlan_tag6_dei;
wire  [2:0]  	  mac_vlan_tag6_pcp;
wire  [15:0] 	  mac_vlan_tag6_tpid;
wire  [11:0] 	  mac_vlan_tag7_vid;
wire         	  mac_vlan_tag7_dei;
wire  [2:0]  	  mac_vlan_tag7_pcp;
wire  [15:0] 	  mac_vlan_tag7_tpid;

// wire  [15:0] 	     mac_ethertype;
wire  [15:0]        ipv4_dw0_tl;
wire  [7:0]         ipv4_dw0_tos;
wire  [3:0]         ipv4_dw0_hl;
wire  [3:0]         ipv4_dw0_ver;
wire  [12:0]        ipv4_dw1_frag_offs;
wire  [2:0]         ipv4_dw1_flg;
wire  [15:0]        ipv4_dw1_id;
wire  [15:0]        ipv4_dw2_hdchksum;
wire  [7:0]         ipv4_dw2_prot;
wire  [7:0] 	    ipv4_dw2_tol;
// wire  [31:0] 		ipv4_src_addr;
wire  [31:0]        ipv4_dest_addr;
wire  [15:0]        udp_dw0_chksum;
wire  [15:0]        udp_dw0_length;
// wire  [15:0] 		udp_src0_port;
wire  [15:0]        udp_dest0_port;

wire  [19:0] ipv6_dw0_fl;
wire  [7:0]  ipv6_dw0_tc;
wire  [3:0]  ipv6_dw0_ver;
wire  [7:0]  ipv6_dw1_hl;
wire  [7:0]  ipv6_dw1_nh;
wire  [15:0] ipv6_dw1_pl;
// wire  [31:0] ipv6_src_addr0;
// wire  [31:0] ipv6_src_addr1;
// wire  [31:0] ipv6_src_addr2;
// wire  [31:0] ipv6_src_addr3;
wire  [31:0] ipv6_dest_addr0;
wire  [31:0] ipv6_dest_addr1;
wire  [31:0] ipv6_dest_addr2;
wire  [31:0] ipv6_dest_addr3;

wire 		mac_packet_type_vlan_en;
wire 		mac_packet_type_ipv4_en;
wire 		mac_packet_type_ipv6_en;
wire 		mac_packet_type_svlan_en;
wire 		mac_packet_type_udp_en;
logic [15:0]    ipv4_header_checksum;
logic [15:0]    ipv6_header_checksum;

assign mac_sa0_addr = {mac_sa0_addr1,mac_sa0_addr0};

wire        mm_srst_n;
wire        srst_msg5_tx_n;
wire        srst_msg5_rx_n;
wire  [2:0] tx_srst_n;
wire  [2:0] rx_srst_n;
logic [2:0] rx_srst_n_r  /* synthesis preserve_syn_only dont_merge */;
logic [2:0] tx_srst_n_r  /* synthesis preserve_syn_only dont_merge */;
logic       rst_msg5_tx_r;
logic       rst_msg5_rx_r;

always_ff @(posedge clk_tx)  tx_srst_n_r <= {3{rst_tx_n}};
always_ff @(posedge clk_rx)  rx_srst_n_r <= {3{rst_rx_n}};

always_ff @(posedge clk_tx)  rst_msg5_tx_r <= rst_msg5_tx_n;
always_ff @(posedge clk_rx)  rst_msg5_rx_r <= rst_msg5_rx_n;


assign mm_srst_n = rst_csr_n;
assign tx_srst_n = tx_srst_n_r;
assign rx_srst_n = rx_srst_n_r;
assign srst_msg5_tx_n = rst_msg5_tx_r;
assign srst_msg5_rx_n = rst_msg5_rx_r;

// csrunit
logic msg5_meas_start;
logic msg5_remote_req;
logic msg5_meas_mode;
logic [7:0] msg5_dummy_bytes;
logic [7:0] msg5_meas_id;
logic [7:0] msg_meas_id_log_err;
logic [95:0] msg5_meas_result;
logic rx_meas_id_err;
logic [7:0] rx_actype_msgId_err;
logic msg5_meas_complete;
logic rx_no_resp_msg5_err;
logic rx_no_resp_msg6_err;
logic [7:0] rx_noresp_msgid;
logic [7:0] rx_noresp_actype;
logic rx_no_resp_msg4_err;
logic [7:0] rx_no_resp_msg4_id;
logic rx_inv_msg5_resp_err;
logic rx_inv_msg5_fup_err;
logic rx_inv_msg5_req_err;
logic mf_en;
logic rx_psz_err;
logic rx_cbit_err;
logic [7:0] msg5_id_err;
logic [7:0] msg5_actype_err;
logic [5:0] rsvd_msg;
logic tx_rsvd_msg_err_sync;
logic [5:0] tx_rsvd_msg_sync;
logic       hdr_chksum_err;
logic       udp_chksum_err;

// Sync rsvd err/id to rx sync
//alt_ecpri_std_synchronizer_nocut #(.depth(2), .rst_value(0), .width(7)) rsvd_sync (
// .clk(clk_rx),  
// .reset_n(rx_srst_n),  
// .din({tx_rsvd_msg_err,tx_rsvd_msg[5:0]}), 
// .dout({tx_rsvd_msg_err_sync,tx_rsvd_msg_sync}));

alt_ecpri_clkcrosser #(.BITS_PER_SYMBOL(6)) tx_rsvd_2rx_cc (
 .in_clk   (clk_tx),
 .in_rst_n (tx_srst_n[0]),
 .in_ready (), // Low toggling input. Not using this for now
 .in_valid (tx_rsvd_msg_err),
 .in_data  (tx_rsvd_msg[5:0]),
 .out_clk  (clk_rx),
 .out_rst_n(rx_srst_n[0]),
 .out_ready(1'b1), // always ready
 .out_valid(tx_rsvd_msg_err_sync),
 .out_data (tx_rsvd_msg_sync)
);

// Must sync to mm domain together with interrupt signal
assign msg5_id_err     = rx_meas_id_err ? msg_meas_id_log_err : rx_noresp_msgid;
assign msg5_actype_err = rx_meas_id_err ? rx_actype_msgId_err : rx_noresp_actype; 
assign rsvd_msg = rx_rsvd_msg_err ? rx_rsvd_msg[5:0] : tx_rsvd_msg_sync[5:0];

csrunit #(
.eCPRI_REV            (PROTOCOL_REVISION),
.IP_REV               (IP_VERSION),
.ONE_STEP_DELAY       (ONE_STEP_DELAY),
.ADDR_WIDTH           (16),
.DATA_WIDTH           (32),
.SRC_MAC_ADDR0        (SRC_MAC_ADDR0),
.DEST_MAC_ADDR0       (DEST_MAC_ADDR0),
.DEST_MAC_ADDR1       (DEST_MAC_ADDR1),
.DEST_MAC_ADDR2       (DEST_MAC_ADDR2),
.DEST_MAC_ADDR3       (DEST_MAC_ADDR3),
.DEST_MAC_ADDR4       (DEST_MAC_ADDR4),
.DEST_MAC_ADDR5       (DEST_MAC_ADDR5),
.DEST_MAC_ADDR6       (DEST_MAC_ADDR6),
.DEST_MAC_ADDR7       (DEST_MAC_ADDR7),
.VID_ADDR_DF          (VID_ADDR_DF),
.MATCH_MACADDR_VLANID (MATCH_MACADDR_VLANID)
) csrunit (
// AVMM access
.mm_rst_n         (mm_srst_n),
.mm_clk           (clk_csr),
.tx_rst_n         (tx_srst_n[1]),
.tx_clk           (clk_tx),
.rx_rst_n         (rx_srst_n[1]),
.rx_clk           (clk_rx),
.tx_mm_sync_nrst  (tx_mm_sync_nrst),
.rx_mm_sync_nrst  (rx_mm_sync_nrst),
.mac_clk_tx       (mac_clk_tx),
.rst_tx_n_mac_clk (rst_tx_n_mac_clk),
.mac_clk_rx       (mac_clk_rx),
.rst_rx_n_mac_clk (rst_rx_n_mac_clk),

.mm_addr          (csr_address),
.mm_write         (csr_write),
.mm_wdata         (csr_writedata),
.mm_read          (csr_read),
.mm_rdata         (csr_readdata),
.mm_rdata_valid   (csr_readdatavalid),
.mm_waitrequest   (csr_waitrequest),

.tx_miss_sop_err      (tx_sop_missing  ), // must connect in POC
.tx_miss_eop_err      (tx_eop_missing  ), // must connect in POC
.tx_overflow_err      (tx_overflow     ), // must connect in POC
.tx_ecc_err           (tx_ecc_err      ), // must connect in POC
.tx_msg_type_err      (tx_rsvd_msg_err_sync), // must connect in POC
.tx_con_timeout_err   (cont_timeout_err), // must connect in POC
.tx_m_msg_size_err    (mult_gt_mtu_err ), // must connect in POC
.tx_s_msg_size_err    (sing_gt_mtu_err ), // must connect in POC
.tx_9k_msg_size_err   (pkt_size_err    ),
.tx_avst_if_err       (tx_avst_if_err  ),
		           	
.rx_miss_sop_err      (rx_sop_missing), // must connect in POC
.rx_miss_eop_err      (rx_eop_missing), // must connect in POC
.rx_overflow_err      (rx_overflow   ), // must connect in POC
.rx_ecc_err           (rx_ecc_err    ), // must connect in POC
.rx_msg_type_err      (rx_rsvd_msg_err), // must connect in POC
.rx_meas_id_err       (rx_meas_id_err),
.rx_inv_msg5_req_err  (rx_inv_msg5_req_err),
.rx_inv_msg5_fup_err  (rx_inv_msg5_fup_err),
.rx_inv_msg5_resp_err (rx_inv_msg5_resp_err),
.rx_msg5_pkt_err      (rx_msg5_pkt_err),
.rx_no_resp_msg5_err  (rx_no_resp_msg5_err),
.rx_no_rst_resp_err   (rx_no_resp_msg6_err),
.rx_no_mem_resp_err   (rx_no_resp_msg4_err),
.rx_msg4_buffer_mode_err (buffer_mode_err),
.rx_msg_payload_length_mismatch_err (rx_psz_err),
.rx_msg_invalid_concan_bit_received_err (rx_cbit_err),
.rx_err_msg_rx_in_avst_err (rx_avst_err),
.intr_msg4_noresp_ready (intr_msg4_noresp_ready),
.mem_acc_id_log_err   (rx_no_resp_msg4_id),
.msg_type_log_err     (rsvd_msg[5:0]),
.msg5_actype_log_err  (msg5_actype_err),
.msg_meas_id_log_err  (msg5_id_err),
.hdr_chksum_err       (hdr_chksum_err),
.udp_chksum_err       (udp_chksum_err),
.scratch_i            (32'b0), // not supported in POC usage?? 
.scratch_o            (),      // not supported in POC usage??
.mode_msg4            (buffer_mode_en),      //output        // n/c for POC 
.msg5_meas_complete   (msg5_meas_complete),  //input        
.msg5_meas_start      (msg5_meas_start), //output       
.msg5_remote_req      (msg5_remote_req), //output       
.msg5_meas_mode       (msg5_meas_mode), //output       
.msg5_meas_id         (msg5_meas_id),    //output [7:0] 
.msg5_dummy_bytes     (msg5_dummy_bytes),    //output [7:0] 
.fragmentation_en     (),      //output        // n/c for POC 
.fragmentation_sz     (),      //output [1:0]  // n/c for POC 
.mf_en		      (mf_en),
.compv_lsb            ({16'b0,msg5_meas_result[0 +: 16]}), // ,input [31:0]        
.compv_msb            (32'b0), // ,input [31:0]        

.msg5_td0            (msg5_meas_result[16 +: 32]), // ,input [31:0]     
.msg5_td1            (msg5_meas_result[48 +: 32]), // ,input [31:0]     
.msg5_td2            (msg5_meas_result[80 +: 16]), // ,input [15:0]     
  
.irq_ecpri_all        (err_interrupt),

//Eth frame 
.ethfrm_scratch	        (ethfrm_scratch),
.mac_sa0_addr0          (mac_sa0_addr0),
.mac_sa0_addr1          (mac_sa0_addr1),
.mac_da0_addr0          (mac_da0_addr0),
.mac_da0_addr1          (mac_da0_addr1),
.mac_da1_addr0	        (mac_da1_addr0),
.mac_da1_addr1	        (mac_da1_addr1),
.mac_da2_addr0	        (mac_da2_addr0),
.mac_da2_addr1	        (mac_da2_addr1),
.mac_da3_addr0	        (mac_da3_addr0),
.mac_da3_addr1	        (mac_da3_addr1),
.mac_da4_addr0	        (mac_da4_addr0),
.mac_da4_addr1	        (mac_da4_addr1),
.mac_da5_addr0	        (mac_da5_addr0),
.mac_da5_addr1	        (mac_da5_addr1),
.mac_da6_addr0	        (mac_da6_addr0),
.mac_da6_addr1	        (mac_da6_addr1),
.mac_da7_addr0	        (mac_da7_addr0),
.mac_da7_addr1	        (mac_da7_addr1),
   
.mac_vlan_tag0_vid      (mac_vlan_tag0_vid),
.mac_vlan_tag0_dei      (mac_vlan_tag0_dei),
.mac_vlan_tag0_pcp      (mac_vlan_tag0_pcp),
.mac_vlan_tag0_tpid     (mac_vlan_tag0_tpid),

.mac_vlan_tag1_vid      (mac_vlan_tag1_vid),
.mac_vlan_tag1_dei      (mac_vlan_tag1_dei),
.mac_vlan_tag1_pcp      (mac_vlan_tag1_pcp),
.mac_vlan_tag1_tpid     (mac_vlan_tag1_tpid),

.mac_vlan_tag2_vid      (mac_vlan_tag2_vid),
.mac_vlan_tag2_dei      (mac_vlan_tag2_dei),
.mac_vlan_tag2_pcp      (mac_vlan_tag2_pcp),
.mac_vlan_tag2_tpid     (mac_vlan_tag2_tpid),

.mac_vlan_tag3_vid      (mac_vlan_tag3_vid),
.mac_vlan_tag3_dei      (mac_vlan_tag3_dei),
.mac_vlan_tag3_pcp      (mac_vlan_tag3_pcp),
.mac_vlan_tag3_tpid     (mac_vlan_tag3_tpid),

.mac_vlan_tag4_vid      (mac_vlan_tag4_vid),
.mac_vlan_tag4_dei      (mac_vlan_tag4_dei),
.mac_vlan_tag4_pcp      (mac_vlan_tag4_pcp),
.mac_vlan_tag4_tpid     (mac_vlan_tag4_tpid),

.mac_vlan_tag5_vid      (mac_vlan_tag5_vid),
.mac_vlan_tag5_dei      (mac_vlan_tag5_dei),
.mac_vlan_tag5_pcp      (mac_vlan_tag5_pcp),
.mac_vlan_tag5_tpid     (mac_vlan_tag5_tpid),

.mac_vlan_tag6_vid      (mac_vlan_tag6_vid),
.mac_vlan_tag6_dei      (mac_vlan_tag6_dei),
.mac_vlan_tag6_pcp      (mac_vlan_tag6_pcp),
.mac_vlan_tag6_tpid     (mac_vlan_tag6_tpid),

.mac_vlan_tag7_vid      (mac_vlan_tag7_vid),
.mac_vlan_tag7_dei      (mac_vlan_tag7_dei),
.mac_vlan_tag7_pcp      (mac_vlan_tag7_pcp),
.mac_vlan_tag7_tpid     (mac_vlan_tag7_tpid),
.mac_ethertype          (mac_ethertype),

.mac_packet_type_en_ipv6_en	(mac_packet_type_ipv6_en),
.mac_packet_type_en_ipv4_en	(mac_packet_type_ipv4_en),
.mac_packet_type_en_vlan_en	(mac_packet_type_vlan_en),
.mac_packet_type_en_svlan_en	(mac_packet_type_svlan_en),
.mac_packet_type_en_udp_en		(mac_packet_type_udp_en),

.ipv4_dw0_tl            (ipv4_dw0_tl),
.ipv4_dw0_tos           (ipv4_dw0_tos),
.ipv4_dw0_hl            (ipv4_dw0_hl),
.ipv4_dw0_ver           (ipv4_dw0_ver),
.ipv4_dw1_frag_offs     (ipv4_dw1_frag_offs),
.ipv4_dw1_flg           (ipv4_dw1_flg),
.ipv4_dw1_id            (ipv4_dw1_id),
.ipv4_dw2_hdchksum      (ipv4_dw2_hdchksum),
.ipv4_dw2_prot          (ipv4_dw2_prot),
.ipv4_dw2_tol           (ipv4_dw2_tol),
.ipv4_src_addr          (ipv4_src_addr),
.ipv4_dest_addr         (ipv4_dest_addr),

.udp_dw0_chksum         (udp_dw0_chksum),
.udp_dw0_length         (udp_dw0_length),
.udp_src0_port          (udp_src0_port),
.udp_dest0_port         (udp_dest0_port),
	
.ipv6_dw0_fl            (ipv6_dw0_fl),
.ipv6_dw0_tc            (ipv6_dw0_tc),
.ipv6_dw0_ver           (ipv6_dw0_ver),
.ipv6_dw1_hl            (ipv6_dw1_hl),
.ipv6_dw1_nh            (ipv6_dw1_nh),
.ipv6_dw1_pl            (ipv6_dw1_pl),
.ipv6_src_addr0         (ipv6_src_addr0),
.ipv6_src_addr1         (ipv6_src_addr1),
.ipv6_src_addr2         (ipv6_src_addr2),
.ipv6_src_addr3         (ipv6_src_addr3),
.ipv6_dest_addr0        (ipv6_dest_addr0),
.ipv6_dest_addr1        (ipv6_dest_addr1),
.ipv6_dest_addr2        (ipv6_dest_addr2),
.ipv6_dest_addr3        (ipv6_dest_addr3),
.ipv4_header_checksum   (ipv4_header_checksum),
.ipv6_header_checksum   (ipv6_header_checksum),

.vid_addr_o             (vid_addr_o),
.macaddr_vlanid_o       (macaddr_vlanid_o),
.ecpri_priority_o       (ecpri_priority_o),
.ptp_priority_o         (ptp_priority_o),
.misc_priority_o        (misc_priority_o),
.en_pq_starvation_ext1_o(en_pq_starvation_ext1_o),
.en_pq_starvation_ext0_o(en_pq_starvation_ext0_o)
);


ecpri_mac #(
.DEVICE_FAMILY       (DEVICE_FAMILY),
.MAC_VLAN_EN         (MAC_VLAN_EN),
.MAC_TCP_EN          (MAC_TCP_EN),
.BITSPERSYMBOL       (BITSPERSYMBOL),
.SYMBOLSPERBEAT      (SYMBOLSPERBEAT),
.TXINS_READY_LATENCY (TXINS_READY_LATENCY),
.DATA_WIDTH          (BITSPERSYMBOL*SYMBOLSPERBEAT),
.TX_ERROR_WIDTH      (TX_ERROR_WIDTH),
.RX_ERROR_WIDTH      (RX_ERROR_WIDTH),
.MSG5_ENABLED        (MSG5_ENABLED),
.IPV4_ENABLE         (IPV4_ENABLE),
.IPV6_ENABLE         (IPV6_ENABLE),
.ADV_MAP             (ADV_MAP),
.ECC_ENABLE          (ECC_ENABLE),
.INTEL_ORAN          (INTEL_ORAN),
.ETH_MTU             (ETH_MTU),
.BUFFER_MODE_ENABLE  (BUFFER_MODE_ENABLE),
.ENABLE_MSG4_TIMER   (ENABLE_MSG4_TIMER),
.ENABLE_MSG6_TIMER   (ENABLE_MSG6_TIMER),
.MSG4_TIMER_WIDTH    (MSG4_TIMER_WIDTH),
.MSG5_TIMER_WIDTH    (MSG5_TIMER_WIDTH),
.MSG6_TIMER_WIDTH    (MSG6_TIMER_WIDTH),
.TX_ARBITRATION_SCHEME(TX_ARBITRATION_SCHEME)
) ecpri_mac_inst (
//input from ecpri_i CSR priority
.ecpri_priority (ecpri_priority_o),
// eCPRI to Eth MAC 
.mac_source_valid (mac_source_valid),
.mac_source_data (mac_source_data),
//.mac_source_channel (mac_source_channel),
.mac_source_sop (mac_source_sop),
.mac_source_eop (mac_source_eop),
.mac_source_empty (mac_source_empty),
.mac_source_ready (mac_source_ready),
.mac_source_error (mac_source_error),
.ecpri_vlan_pcp (ecpri_vlan_pcp),
.ecpri_dout_ready (ecpri_dout_ready),

// Eth MAC to eCPRI
.mac_sink_valid (mac_sink_valid),
.mac_sink_data (mac_sink_data),
//.mac_sink_channel (mac_sink_channel),
.mac_sink_sop (mac_sink_sop),
.mac_sink_eop (mac_sink_eop),
.mac_sink_empty (mac_sink_empty),
.mac_sink_ready (mac_sink_ready),
.mac_sink_error (mac_sink_error),

// eCPRI to user i/f
.avst_source_valid (avst_source_valid),
.avst_source_data (avst_source_data),
//.avst_source_channel (avst_source_channel),
.avst_source_sop (avst_source_sop),
.avst_source_eop (avst_source_eop),
.avst_source_empty (avst_source_empty),
.avst_source_ready (avst_source_ready),
.avst_source_error (avst_source_error),
// sideband
.source_concat (source_concat),
.source_pc_id (source_pc_id),
.source_seq_id (source_seq_id),
.source_rtc_id (source_rtc_id),
.source_msg_type (source_msg_type),
// Stub
.source_mem_acc_id (source_mem_acc_id),
.source_op_type (source_op_type),
.source_element_id (source_element_id),
.source_address (source_address),
.source_length (source_length),
.source_reset_id (source_reset_id),
.source_reset_op (source_reset_op),
.source_event_id (source_event_id),
.source_event_type (source_event_type),
.source_notif (source_notif),

// user i/f to eCPRI
.avst_sink_valid (avst_sink_valid),
.avst_sink_data (avst_sink_data),
//.avst_sink_channel (avst_sink_channel),
.avst_sink_sop (avst_sink_sop),
.avst_sink_eop (avst_sink_eop),
.avst_sink_empty (avst_sink_empty),
.avst_sink_ready (avst_sink_ready),
.avst_sink_error (avst_sink_error),
// sideband
.sink_pc_id (sink_pc_id),
.sink_seq_id (sink_seq_id),
.sink_rtc_id (sink_rtc_id),
.sink_concatenation (sink_concatenation),
.sink_msg_type (sink_msg_type),
// Stub
.sink_mem_acc_id (sink_mem_acc_id),
.sink_op_type (sink_op_type),
.sink_element_id (sink_element_id),
.sink_address (sink_address),
.sink_length (sink_length),
.sink_reset_id (sink_reset_id),
.sink_reset_op (sink_reset_op),
.sink_event_id (sink_event_id),
.sink_event_type (sink_event_type),
.sink_notif (sink_notif),
.sink_pkt_size (sink_pkt_size),
.sink_pkt_checksum (sink_pkt_checksum),

// ORAN (n/c in ecpri1.2)
.tx_transport_c_u (tx_transport_c_u),
.rx_transport_c_u (rx_transport_c_u),

// TX Errors
.tx_sop_missing (tx_sop_missing),
.tx_eop_missing (tx_eop_missing),
.tx_overflow (tx_overflow),
.tx_rsvd_msg_err (tx_rsvd_msg_err),
.tx_rsvd_msg (tx_rsvd_msg),
.tx_ecc_err (tx_ecc_err),
.concat_timeout_err (cont_timeout_err),
.single_msg_over_mtu_err (sing_gt_mtu_err),
.mult_msg_over_mtu_err (mult_gt_mtu_err),
.pkt_size_err (pkt_size_err),
.tx_avst_if_err (tx_avst_if_err),

// RX Errors
.rx_sop_missing (rx_sop_missing),
.rx_eop_missing (rx_eop_missing),
.rx_overflow (rx_overflow),
.rx_rsvd_msg_err (rx_rsvd_msg_err),
.rx_rsvd_msg (rx_rsvd_msg),
.rx_ecc_err (rx_ecc_err),   

// ethframe error
.hdr_chksum_err (hdr_chksum_err),
.udp_chksum_err (udp_chksum_err),

// CSR output
.buffer_mode_en (buffer_mode_en),
.buffer_mode_err (buffer_mode_err),
.csr_msg4_noresp_ready (intr_msg4_noresp_ready), // Monitor csr status for IRQ despatch
.csr_msg4_noresp_err (rx_no_resp_msg4_err),
.csr_msg4_noresp_id  (rx_no_resp_msg4_id),
.csr_msg6_noresp_err (rx_no_resp_msg6_err),
// MSG5 i/o

.csr_meas_start (msg5_meas_start),
.csr_remote_req (msg5_remote_req),
.csr_two_step_mode (msg5_meas_mode),
.csr_dummy_bytes (msg5_dummy_bytes),
.csr_meas_id (msg5_meas_id),
.csr_msgId (msg_meas_id_log_err),
.csr_msgId_err (rx_meas_id_err),
.csr_actype_msgId_err (rx_actype_msgId_err),
.csr_meas_result(msg5_meas_result),
.csr_meas_valid (msg5_meas_complete),
.csr_timeout_noresp_err (rx_no_resp_msg5_err),
.csr_resp_err    (rx_inv_msg5_resp_err),
.csr_msg5_pkt_err (rx_msg5_pkt_err),
.csr_fu_err      (rx_inv_msg5_fup_err),
.csr_request_err (rx_inv_msg5_req_err),
.csr_noresp_msgid  (rx_noresp_msgid),
.csr_noresp_actype (rx_noresp_actype),

.msg5_pkt (msg5_pkt),
.msg5_ts_insert (msg5_ts_insert),
.msg5_ts_valid (msg5_ts_valid),
.msg5_ts_rt_update (msg5_ts_rt_update),
.msg5_offset_correction_field (msg5_offset_correction_field),
.msg5_offset_timestamp (msg5_offset_timestamp),
.in_timestamp_valid_rx (in_timestamp_valid_rx),
.in_timestamp_valid_tx (in_timestamp_valid_tx),
.in_timestamp_rx (in_timestamp_rx),
.in_timestamp_tx (in_timestamp_tx),
.mf_en (mf_en),
.rx_cbit_err (rx_cbit_err),
.rx_psz_err  (rx_psz_err),

// Eth Frame
.ethfrm_scratch (ethfrm_scratch),
.mac_sa0_addr0 (mac_sa0_addr0),
.mac_sa0_addr1 (mac_sa0_addr1),
.mac_da0_addr0 (mac_da0_addr0),
.mac_da0_addr1 (mac_da0_addr1),
.mac_da1_addr0 (mac_da1_addr0),
.mac_da1_addr1 (mac_da1_addr1),
.mac_da2_addr0 (mac_da2_addr0),
.mac_da2_addr1 (mac_da2_addr1),
.mac_da3_addr0 (mac_da3_addr0),
.mac_da3_addr1 (mac_da3_addr1),
.mac_da4_addr0 (mac_da4_addr0),
.mac_da4_addr1 (mac_da4_addr1),
.mac_da5_addr0 (mac_da5_addr0),
.mac_da5_addr1 (mac_da5_addr1),
.mac_da6_addr0 (mac_da6_addr0),
.mac_da6_addr1 (mac_da6_addr1),
.mac_da7_addr0 (mac_da7_addr0),
.mac_da7_addr1 (mac_da7_addr1),

.mac_vlan_tag0_vid  (mac_vlan_tag0_vid),
.mac_vlan_tag0_dei  (mac_vlan_tag0_dei),
.mac_vlan_tag0_pcp  (mac_vlan_tag0_pcp),
.mac_vlan_tag0_tpid (mac_vlan_tag0_tpid),

.mac_vlan_tag1_vid      (mac_vlan_tag1_vid),
.mac_vlan_tag1_dei      (mac_vlan_tag1_dei),
.mac_vlan_tag1_pcp      (mac_vlan_tag1_pcp),
.mac_vlan_tag1_tpid     (mac_vlan_tag1_tpid),

.mac_vlan_tag2_vid      (mac_vlan_tag2_vid),
.mac_vlan_tag2_dei      (mac_vlan_tag2_dei),
.mac_vlan_tag2_pcp      (mac_vlan_tag2_pcp),
.mac_vlan_tag2_tpid     (mac_vlan_tag2_tpid),

.mac_vlan_tag3_vid      (mac_vlan_tag3_vid),
.mac_vlan_tag3_dei      (mac_vlan_tag3_dei),
.mac_vlan_tag3_pcp      (mac_vlan_tag3_pcp),
.mac_vlan_tag3_tpid     (mac_vlan_tag3_tpid),

.mac_vlan_tag4_vid      (mac_vlan_tag4_vid),
.mac_vlan_tag4_dei      (mac_vlan_tag4_dei),
.mac_vlan_tag4_pcp      (mac_vlan_tag4_pcp),
.mac_vlan_tag4_tpid     (mac_vlan_tag4_tpid),

.mac_vlan_tag5_vid      (mac_vlan_tag5_vid),
.mac_vlan_tag5_dei      (mac_vlan_tag5_dei),
.mac_vlan_tag5_pcp      (mac_vlan_tag5_pcp),
.mac_vlan_tag5_tpid     (mac_vlan_tag5_tpid),

.mac_vlan_tag6_vid      (mac_vlan_tag6_vid),
.mac_vlan_tag6_dei      (mac_vlan_tag6_dei),
.mac_vlan_tag6_pcp      (mac_vlan_tag6_pcp),
.mac_vlan_tag6_tpid     (mac_vlan_tag6_tpid),

.mac_vlan_tag7_vid      (mac_vlan_tag7_vid),
.mac_vlan_tag7_dei      (mac_vlan_tag7_dei),
.mac_vlan_tag7_pcp      (mac_vlan_tag7_pcp),
.mac_vlan_tag7_tpid     (mac_vlan_tag7_tpid),
.mac_ethertype          (mac_ethertype),

.ipv4_dw0_tl            (ipv4_dw0_tl),
.ipv4_dw0_tos           (ipv4_dw0_tos),
.ipv4_dw0_hl            (ipv4_dw0_hl),
.ipv4_dw0_ver           (ipv4_dw0_ver),
.ipv4_dw1_frag_offs     (ipv4_dw1_frag_offs),
.ipv4_dw1_flg           (ipv4_dw1_flg),
.ipv4_dw1_id            (ipv4_dw1_id),
.ipv4_dw2_hdchksum      (ipv4_dw2_hdchksum),
.ipv4_dw2_prot          (ipv4_dw2_prot),
.ipv4_dw2_tol          	(ipv4_dw2_tol),
.ipv4_src_addr          (ipv4_src_addr),
.ipv4_dest_addr         (ipv4_dest_addr),

.udp_dw0_chksum         (udp_dw0_chksum),
.udp_dw0_length         (udp_dw0_length),
.udp_src0_port          (udp_src0_port),
.udp_dest0_port         (udp_dest0_port),
	
.ipv6_dw0_fl            (ipv6_dw0_fl),
.ipv6_dw0_tc            (ipv6_dw0_tc),
.ipv6_dw0_ver           (ipv6_dw0_ver),
.ipv6_dw1_hl            (ipv6_dw1_hl),
.ipv6_dw1_nh            (ipv6_dw1_nh),
.ipv6_dw1_pl            (ipv6_dw1_pl),
.ipv6_src_addr0         (ipv6_src_addr0),
.ipv6_src_addr1       	(ipv6_src_addr1),
.ipv6_src_addr2     	(ipv6_src_addr2),
.ipv6_src_addr3         (ipv6_src_addr3),
.ipv6_dest_addr0        (ipv6_dest_addr0),
.ipv6_dest_addr1        (ipv6_dest_addr1),
.ipv6_dest_addr2        (ipv6_dest_addr2),
.ipv6_dest_addr3        (ipv6_dest_addr3),
   
//RX packet classifier control signals to Header Removal 
.pc_ip_vlan             (pc_ip_vlan),
.pc_ip_svlan            (pc_ip_svlan),
.pc_ip_ipv4             (pc_ip_ipv4),
.pc_ip_ipv6             (pc_ip_ipv6),
.pc_ip_udp              (pc_ip_udp),
.pc_ip_ecpri            (pc_ip_ecpri),

//eCPRI IP to TX Header Insertion
.csr_vlan		(mac_packet_type_vlan_en),
.csr_ipv4		(mac_packet_type_ipv4_en),
.csr_ipv6		('0), //Tie off 0 (mac_packet_type_ipv6_en),
.csr_svlan		(mac_packet_type_svlan_en),
.csr_udp		(mac_packet_type_udp_en),
.ipv4_header_checksum   (ipv4_header_checksum),
.ipv6_header_checksum   (ipv6_header_checksum),

// Clock
.clk_tx (clk_tx),
.clk_rx (clk_rx),
.mac_clk_tx (mac_clk_tx),

// Reset
.rst_msg5_tx_n (srst_msg5_tx_n),
.rst_msg5_rx_n (srst_msg5_rx_n),
.arst_tx_n (arst_tx_n),
.rst_tx_n_mac_clk (rst_tx_n_mac_clk),
.rst_tx_n (tx_srst_n[2]),
.rst_rx_n (rx_srst_n[2])
);


endmodule
