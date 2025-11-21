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

import ecpri_pkg::*;

module csrunit #(
    parameter eCPRI_REV  = 1,
    parameter IP_REV     = 1,
    parameter ADDR_WIDTH = 16,
    parameter IPV4_ENABLE= 1,
    parameter IPV6_ENABLE= 1,
    parameter DATA_WIDTH = 32,
    parameter ONE_STEP_DELAY = "ON",
    parameter SRC_MAC_ADDR0  = 48'h0,
    parameter DEST_MAC_ADDR0 = 48'h0,
    parameter DEST_MAC_ADDR1 = 48'h0,
    parameter DEST_MAC_ADDR2 = 48'h0,
    parameter DEST_MAC_ADDR3 = 48'h0,
    parameter DEST_MAC_ADDR4 = 48'h0,
    parameter DEST_MAC_ADDR5 = 48'h0,
    parameter DEST_MAC_ADDR6 = 48'h0,
    parameter DEST_MAC_ADDR7 = 48'h0,
    parameter VID_ADDR_DF = 12'h0,
    parameter MATCH_MACADDR_VLANID = "MACADDR"

)
(
  input                   tx_clk,
  input                   rx_clk,
  input                   mac_clk_tx,
  input                   tx_rst_n,
  input                   rx_rst_n,
  input                   rst_tx_n_mac_clk,

  //For CSR used
  input                   mac_clk_rx,
  input                   rst_rx_n_mac_clk,

  // MAC ready
  input                   tx_mm_sync_nrst,
  input                   rx_mm_sync_nrst,

  // AVMM access
  input                   mm_rst_n,
  input                   mm_clk,

  input  [ADDR_WIDTH-1:0] mm_addr,
  input                   mm_write,
  input  [DATA_WIDTH-1:0] mm_wdata,
  input                   mm_read,
  output [DATA_WIDTH-1:0] mm_rdata,
  output                  mm_rdata_valid,
  output                  mm_waitrequest,

  input                   tx_miss_sop_err,
  input                   tx_miss_eop_err,
  input                   tx_overflow_err,
  input                   tx_ecc_err,
  input                   tx_msg_type_err,
  input                   tx_con_timeout_err,
  input                   tx_m_msg_size_err,
  input                   tx_s_msg_size_err,
  input                   tx_9k_msg_size_err,
  input                   tx_avst_if_err,
  
  input                   rx_miss_sop_err,
  input                   rx_miss_eop_err,
  input                   rx_overflow_err,
  input                   rx_ecc_err,
  input                   rx_msg_type_err,
  input                   rx_meas_id_err,
  input                   rx_inv_msg5_req_err,
  input                   rx_inv_msg5_fup_err,
  input                   rx_inv_msg5_resp_err,
  input                   rx_msg5_pkt_err,
  input                   rx_no_resp_msg5_err,
  input                   rx_no_rst_resp_err,
  input                   rx_no_mem_resp_err,
  input                   rx_msg4_buffer_mode_err,
  input                   rx_msg_payload_length_mismatch_err,
  input                   rx_msg_invalid_concan_bit_received_err,
  input                   rx_err_msg_rx_in_avst_err,
  
  output                  intr_msg4_noresp_ready,
  input [7:0]             mem_acc_id_log_err,
  input [5:0]             msg_type_log_err,
  input [7:0]             msg5_actype_log_err,
  input [7:0]             msg_meas_id_log_err,
  
  input                   hdr_chksum_err,
  input                   udp_chksum_err,

  input  [31:0]           scratch_i,
  output [31:0]           scratch_o,
  output                  mode_msg4,
  input                   msg5_meas_complete,
  output                  msg5_meas_start,
  output                  msg5_remote_req,
  output                  msg5_meas_mode,
  output [7:0]            msg5_meas_id,
  output [7:0]            msg5_dummy_bytes,
  output                  fragmentation_en,
  output [1:0]            fragmentation_sz,
  output				  mf_en,
  
  input [31:0]            compv_lsb,
  input [31:0]            compv_msb,

  input [31:0]            msg5_td0,
  input [31:0]            msg5_td1,
  input [15:0]            msg5_td2,

  output                  irq_ecpri_all,

  //Eth frame 
   output  [31:0] 	  ethfrm_scratch,
   output  [31:0] 	  mac_sa0_addr0,
   output  [15:0] 	  mac_sa0_addr1,
   output  [31:0] 	  mac_da0_addr0,
   output  [15:0] 	  mac_da0_addr1,

   output  [31:0] 	  mac_da1_addr0,
   output  [15:0] 	  mac_da1_addr1,
   output  [31:0] 	  mac_da2_addr0,
   output  [15:0] 	  mac_da2_addr1,
   output  [31:0] 	  mac_da3_addr0,
   output  [15:0] 	  mac_da3_addr1,
   output  [31:0] 	  mac_da4_addr0,
   output  [15:0] 	  mac_da4_addr1,
   output  [31:0] 	  mac_da5_addr0,
   output  [15:0] 	  mac_da5_addr1,
   output  [31:0] 	  mac_da6_addr0,
   output  [15:0] 	  mac_da6_addr1,
   output  [31:0] 	  mac_da7_addr0,
   output  [15:0] 	  mac_da7_addr1,
   
    output  [11:0] 	  mac_vlan_tag0_vid,
    output         	  mac_vlan_tag0_dei,
    output  [2:0]  	  mac_vlan_tag0_pcp,
    output  [15:0] 	  mac_vlan_tag0_tpid,
    output  [11:0] 	  mac_vlan_tag1_vid,
    output         	  mac_vlan_tag1_dei,
    output  [2:0]  	  mac_vlan_tag1_pcp,
    output  [15:0] 	  mac_vlan_tag1_tpid,
    output  [11:0] 	  mac_vlan_tag2_vid,
    output         	  mac_vlan_tag2_dei,
    output  [2:0]  	  mac_vlan_tag2_pcp,
    output  [15:0] 	  mac_vlan_tag2_tpid,
    output  [11:0] 	  mac_vlan_tag3_vid,
    output         	  mac_vlan_tag3_dei,
    output  [2:0]  	  mac_vlan_tag3_pcp,
    output  [15:0] 	  mac_vlan_tag3_tpid,
    output  [11:0] 	  mac_vlan_tag4_vid,
    output         	  mac_vlan_tag4_dei,
    output  [2:0]  	  mac_vlan_tag4_pcp,
    output  [15:0] 	  mac_vlan_tag4_tpid,
    output  [11:0] 	  mac_vlan_tag5_vid,
    output         	  mac_vlan_tag5_dei,
    output  [2:0]  	  mac_vlan_tag5_pcp,
    output  [15:0] 	  mac_vlan_tag5_tpid,
    output  [11:0] 	  mac_vlan_tag6_vid,
    output         	  mac_vlan_tag6_dei,
    output  [2:0]  	  mac_vlan_tag6_pcp,
    output  [15:0] 	  mac_vlan_tag6_tpid,
    output  [11:0] 	  mac_vlan_tag7_vid,
    output         	  mac_vlan_tag7_dei,
    output  [2:0]  	  mac_vlan_tag7_pcp,
    output  [15:0] 	  mac_vlan_tag7_tpid,
	 
    output         	  mac_packet_type_en_ipv6_en,
    output         	  mac_packet_type_en_ipv4_en,
    output         	  mac_packet_type_en_vlan_en,
    output         	  mac_packet_type_en_svlan_en,
    output         	  mac_packet_type_en_udp_en,
  
    output  [15:0] 	    mac_ethertype,
	output  [15:0] 	    ipv4_dw0_tl,
	output  [7:0] 		ipv4_dw0_tos,
	output  [3:0] 		ipv4_dw0_hl,
	output  [3:0] 		ipv4_dw0_ver,
	output  [12:0] 		ipv4_dw1_frag_offs,
	output  [2:0] 		ipv4_dw1_flg,
	output  [15:0] 		ipv4_dw1_id,
	output  [15:0] 		ipv4_dw2_hdchksum,
	output  [7:0] 		ipv4_dw2_prot,
	output  [7:0] 		ipv4_dw2_tol,
	output  [31:0] 		ipv4_src_addr,
	output  [31:0] 		ipv4_dest_addr,
	output  [15:0] 		udp_dw0_chksum,
	output  [15:0] 		udp_dw0_length,
	output  [15:0] 		udp_src0_port,
	output  [15:0] 		udp_dest0_port,
	
	output  [19:0] ipv6_dw0_fl,
	output  [7:0]  ipv6_dw0_tc,
	output  [3:0]  ipv6_dw0_ver,
	output  [7:0]  ipv6_dw1_hl,
	output  [7:0]  ipv6_dw1_nh,
	output  [15:0] ipv6_dw1_pl,
	output  [31:0] ipv6_src_addr0,
	output  [31:0] ipv6_src_addr1,
	output  [31:0] ipv6_src_addr2,
	output  [31:0] ipv6_src_addr3,
	output  [31:0] ipv6_dest_addr0,
	output  [31:0] ipv6_dest_addr1,
	output  [31:0] ipv6_dest_addr2,
	output  [31:0] ipv6_dest_addr3,

	output logic [15:0] ipv4_header_checksum,
	output logic [15:0] ipv6_header_checksum,

	output  [11:0] vid_addr_o,
	output         macaddr_vlanid_o,
        output  [ 2:0] ecpri_priority_o,
        output  [ 2:0] ptp_priority_o,
        output  [ 2:0] misc_priority_o,
        output logic   en_pq_starvation_ext0_o,
        output logic   en_pq_starvation_ext1_o
);

localparam HEADER_WIDTH                     = 6;
localparam IPV4_LENGTH                      = 5'h14; //6'd20;
localparam IPV6_LENGTH                      = 6'h28; //6'd40;
localparam UDP_LENGTH                       = 4'h8;
localparam IPV6_HDR_CNT_PER_WORD            = 5'd20;
localparam IPV4_HDR_CNT_PER_WORD            = 4'd8;
localparam ONE_STEP_DELAY_EN = (ONE_STEP_DELAY == "ON") ? 1'b1 : 1'b0; // 1'b1 for One Step delay, 1'b0 for Two Step Delay

localparam [31:0] SRC_MAC_ADDR0_0_DF  =  SRC_MAC_ADDR0[0  +: 32];
localparam [15:0] SRC_MAC_ADDR0_1_DF  =  SRC_MAC_ADDR0[32 +: 16];
localparam [31:0] DEST_MAC_ADDR0_0_DF = DEST_MAC_ADDR0[0  +: 32];
localparam [15:0] DEST_MAC_ADDR0_1_DF = DEST_MAC_ADDR0[32 +: 16];
localparam [31:0] DEST_MAC_ADDR1_0_DF = DEST_MAC_ADDR1[0  +: 32];
localparam [15:0] DEST_MAC_ADDR1_1_DF = DEST_MAC_ADDR1[32 +: 16];
localparam [31:0] DEST_MAC_ADDR2_0_DF = DEST_MAC_ADDR2[0  +: 32];
localparam [15:0] DEST_MAC_ADDR2_1_DF = DEST_MAC_ADDR2[32 +: 16];
localparam [31:0] DEST_MAC_ADDR3_0_DF = DEST_MAC_ADDR3[0  +: 32];
localparam [15:0] DEST_MAC_ADDR3_1_DF = DEST_MAC_ADDR3[32 +: 16];
localparam [31:0] DEST_MAC_ADDR4_0_DF = DEST_MAC_ADDR4[0  +: 32];
localparam [15:0] DEST_MAC_ADDR4_1_DF = DEST_MAC_ADDR4[32 +: 16];
localparam [31:0] DEST_MAC_ADDR5_0_DF = DEST_MAC_ADDR5[0  +: 32];
localparam [15:0] DEST_MAC_ADDR5_1_DF = DEST_MAC_ADDR5[32 +: 16];
localparam [31:0] DEST_MAC_ADDR6_0_DF = DEST_MAC_ADDR6[0  +: 32];
localparam [15:0] DEST_MAC_ADDR6_1_DF = DEST_MAC_ADDR6[32 +: 16];
localparam [31:0] DEST_MAC_ADDR7_0_DF = DEST_MAC_ADDR7[0  +: 32];
localparam [15:0] DEST_MAC_ADDR7_1_DF = DEST_MAC_ADDR7[32 +: 16];

localparam MACADDR_VLANID = (MATCH_MACADDR_VLANID == "VLANID") ? 1'b1 : 1'b0; // 1'b1 for VLANID, 1'b0 for MACADDR & Default
localparam [2:0] ECPRI_PRIORITY_DEFAULT = 6;
localparam [2:0] PTP_DEFAULT = 7;
localparam [2:0] MISC_DEFAULT = 5;

wire irq_ecpri_msg5_ctrl;
wire irq_ecpri_tx_err_msg;
wire irq_ecpri_rx_err_msg;
wire irq_checksum_err;
wire irq_ecpri_global_en;

// Output from pulse_stretcher
wire tx_miss_sop_err_ps;
wire tx_miss_eop_err_ps;
wire tx_overflow_err_ps;
wire tx_ecc_err_ps;
wire tx_msg_type_err_ps;
wire tx_con_timeout_err_ps;
wire tx_m_msg_size_err_ps;
wire tx_s_msg_size_err_ps;
wire tx_9k_msg_size_err_ps;
wire tx_err_msg_avst_if_err_ps;

wire rx_miss_sop_err_ps;
wire rx_miss_eop_err_ps;
wire rx_overflow_err_ps;
wire rx_ecc_err_ps;
wire rx_msg_type_err_ps;
wire rx_meas_id_err_sync_valid;
wire rx_meas_id_err_sync;
wire rx_no_resp_msg5_err_sync;
wire rx_inv_msg5_req_err_ps;
wire rx_inv_msg5_fup_err_ps;
wire rx_inv_msg5_resp_err_ps;
wire rx_err_msg_msg5_pkt_err_ps;
// wire rx_no_resp_msg5_err_ps;
wire rx_no_rst_resp_err_ps;
// wire rx_no_mem_resp_err_ps;
wire rx_msg4_buffer_mode_err_ps;
wire rx_msg_payload_length_mismatch_err_ps;
wire rx_msg_invalid_concan_bit_received_err_ps;
wire rx_err_msg_rx_in_avst_err_ps;
wire hdr_chksum_err_ps;


logic msg5_meas_mode_o;
logic msg5_remote_req_o;
logic msg5_meas_start_o;
logic [7:0] msg5_meas_id_o;
logic [7:0] msg5_dummy_bytes_o;

logic [ 2:0] ecpri_priority;

// Stretch error signal generated by TX/RX with avmm domain
alt_ecpri_pulse_stretch_sync rx_sop_err_stretch      ( .aclr_fast_clk(~rx_rst_n), .fast_clk(rx_clk), .aclr_slow_clk(~rx_mm_sync_nrst), .slow_clk(mm_clk), .din(rx_miss_sop_err), .dout (rx_miss_sop_err_ps));
alt_ecpri_pulse_stretch_sync rx_eop_err_stretch      ( .aclr_fast_clk(~rx_rst_n), .fast_clk(rx_clk), .aclr_slow_clk(~rx_mm_sync_nrst), .slow_clk(mm_clk), .din(rx_miss_eop_err), .dout (rx_miss_eop_err_ps));
alt_ecpri_pulse_stretch_sync rx_overflow_err_stretch ( .aclr_fast_clk(~rx_rst_n), .fast_clk(rx_clk), .aclr_slow_clk(~rx_mm_sync_nrst), .slow_clk(mm_clk), .din(rx_overflow_err), .dout (rx_overflow_err_ps));
alt_ecpri_pulse_stretch_sync rx_ecc_err_stretch      ( .aclr_fast_clk(~rx_rst_n), .fast_clk(rx_clk), .aclr_slow_clk(~rx_mm_sync_nrst), .slow_clk(mm_clk), .din(rx_ecc_err),      .dout (rx_ecc_err_ps));

alt_ecpri_pulse_stretch_sync rx_msg5_req_stretch    ( .aclr_fast_clk(~rx_rst_n), .fast_clk(rx_clk), .aclr_slow_clk(~rx_mm_sync_nrst), .slow_clk(mm_clk), .din(rx_inv_msg5_req_err), .dout (rx_inv_msg5_req_err_ps));
alt_ecpri_pulse_stretch_sync rx_msg5_fup_stretch    ( .aclr_fast_clk(~rx_rst_n), .fast_clk(rx_clk), .aclr_slow_clk(~rx_mm_sync_nrst), .slow_clk(mm_clk), .din(rx_inv_msg5_fup_err), .dout (rx_inv_msg5_fup_err_ps));
alt_ecpri_pulse_stretch_sync rx_msg5_resp_stretch   ( .aclr_fast_clk(~rx_rst_n), .fast_clk(rx_clk), .aclr_slow_clk(~rx_mm_sync_nrst), .slow_clk(mm_clk), .din(rx_inv_msg5_resp_err), .dout (rx_inv_msg5_resp_err_ps));
alt_ecpri_pulse_stretch_sync rx_msg5_pkterr_stretch ( .aclr_fast_clk(~rx_rst_n), .fast_clk(rx_clk), .aclr_slow_clk(~rx_mm_sync_nrst), .slow_clk(mm_clk), .din(rx_msg5_pkt_err), .dout (rx_err_msg_msg5_pkt_err_ps));

alt_ecpri_pulse_stretch_sync rx_msg4_bufmode_stretch ( .aclr_fast_clk(~rx_rst_n), .fast_clk(rx_clk), .aclr_slow_clk(~rx_mm_sync_nrst), .slow_clk(mm_clk), .din(rx_msg4_buffer_mode_err), .dout (rx_msg4_buffer_mode_err_ps));
alt_ecpri_pulse_stretch_sync rx_pldsz_miss_stretch   ( .aclr_fast_clk(~rx_rst_n), .fast_clk(rx_clk), .aclr_slow_clk(~rx_mm_sync_nrst), .slow_clk(mm_clk), .din(rx_msg_payload_length_mismatch_err), .dout (rx_msg_payload_length_mismatch_err_ps));
alt_ecpri_pulse_stretch_sync rx_conc_miss_stretch    ( .aclr_fast_clk(~rx_rst_n), .fast_clk(rx_clk), .aclr_slow_clk(~rx_mm_sync_nrst), .slow_clk(mm_clk), .din(rx_msg_invalid_concan_bit_received_err), .dout (rx_msg_invalid_concan_bit_received_err_ps));
alt_ecpri_pulse_stretch_sync rx_avst_err_stretch    ( .aclr_fast_clk(~rst_rx_n_mac_clk), .fast_clk(mac_clk_rx), .aclr_slow_clk(~rx_mm_sync_nrst), .slow_clk(mm_clk), .din(rx_err_msg_rx_in_avst_err), .dout (rx_err_msg_rx_in_avst_err_ps));
alt_ecpri_pulse_stretch_sync rx_rst_resp_stretch     ( .aclr_fast_clk(~rx_rst_n), .fast_clk(rx_clk), .aclr_slow_clk(~rx_mm_sync_nrst), .slow_clk(mm_clk), .din(rx_no_rst_resp_err), .dout (rx_no_rst_resp_err_ps));

alt_ecpri_pulse_stretch_sync rx_hdrchksum_err_stretch ( .aclr_fast_clk(~rx_rst_n), .fast_clk(rx_clk), .aclr_slow_clk(~rx_mm_sync_nrst), .slow_clk(mm_clk), .din(hdr_chksum_err), .dout (hdr_chksum_err_ps));

// Wide bus synchronizer.
// Crossing msg5 csr instr to tx_clk
logic msg5_meas_start_dly;
logic msg5_meas_start_ps;
always_ff @(posedge mm_clk) begin
 if(!mm_rst_n) msg5_meas_start_dly <= '0;
 else msg5_meas_start_dly <= msg5_meas_start_o;
end
assign msg5_meas_start_ps = msg5_meas_start_o & !msg5_meas_start_dly; // pulse to trigger transfer

alt_ecpri_clkcrosser #(.BITS_PER_SYMBOL(18)) msg5_instr_cc (
 .in_clk    (mm_clk),
 .in_rst_n  (mm_rst_n),
 .in_ready  (), // Low toggling input. Not using this for now
 .in_valid  (msg5_meas_start_ps),
 .in_data   ({msg5_meas_mode_o,msg5_remote_req_o,msg5_meas_id_o,msg5_dummy_bytes_o}),
 .out_clk   (tx_clk),
 .out_rst_n (tx_rst_n),
 .out_ready (1'b1), // always ready
 .out_valid (msg5_meas_start),
 .out_data  ({msg5_meas_mode,msg5_remote_req,msg5_meas_id,msg5_dummy_bytes})
);

wire msg5_meas_complete_sync;
wire [79:0] td_meas_sync;
alt_ecpri_clkcrosser #(.BITS_PER_SYMBOL(80)) msg5_td_cc(
 .in_clk   (rx_clk),
 .in_rst_n (rx_rst_n),
 .in_ready (), // Low toggling input. Not using this for now
 .in_valid (msg5_meas_complete),
 .in_data  ({msg5_td2,msg5_td1,msg5_td0}),
 .out_clk  (mm_clk),
 .out_rst_n(rx_mm_sync_nrst),
 .out_ready(1'b1), // always ready
 .out_valid(msg5_meas_complete_sync),
 .out_data ({td_meas_sync})
);

wire msg5_meas_complete_cv_sync;
wire [63:0] cv_meas_sync;
alt_ecpri_clkcrosser #(.BITS_PER_SYMBOL(64)) msg5_comp_cc (
 .in_clk   (rx_clk),
 .in_rst_n (rx_rst_n),
 .in_ready (), // Low toggling input. Not using this for now
 .in_valid (msg5_meas_complete),
 .in_data  ({compv_msb,compv_lsb}),
 .out_clk  (mm_clk),
 .out_rst_n(rx_mm_sync_nrst),
 .out_ready(1'b1), // always ready
 .out_valid(msg5_meas_complete_cv_sync),
 .out_data (cv_meas_sync)
);

wire [7:0] msg5_meas_id_log_sync;
wire [7:0] msg5_actype_log_sync;
alt_ecpri_clkcrosser #(.BITS_PER_SYMBOL(16+2)) measIdLog_cc (
 .in_clk   (rx_clk),
 .in_rst_n (rx_rst_n),
 .in_ready (), // Low toggling input. Not using this for now
 .in_valid (rx_meas_id_err|rx_no_resp_msg5_err),
 .in_data  ({rx_meas_id_err,rx_no_resp_msg5_err,msg_meas_id_log_err,msg5_actype_log_err}),
 .out_clk  (mm_clk),
 .out_rst_n(rx_mm_sync_nrst),
 .out_ready(1'b1), // always ready
 .out_valid(rx_meas_id_err_sync_valid),
 .out_data ({rx_meas_id_err_sync, rx_no_resp_msg5_err_sync,msg5_meas_id_log_sync,msg5_actype_log_sync})
);

logic [5:0] msg_type_log_err_sync;
logic tx_msg_type_err_sync;
logic rx_msg_type_err_sync;
logic rx_msg_type_err_valid;
alt_ecpri_clkcrosser #(.BITS_PER_SYMBOL(8)) rsvd_msg_cc (
 .in_clk   (rx_clk),
 .in_rst_n (rx_rst_n),
 .in_ready (), // Low toggling input. Not using this for now
 .in_valid (tx_msg_type_err|rx_msg_type_err),
 .in_data  ({tx_msg_type_err,rx_msg_type_err,msg_type_log_err}),
 .out_clk  (mm_clk),
 .out_rst_n(rx_mm_sync_nrst),
 .out_ready(1'b1), // always ready
 .out_valid(rx_msg_type_err_valid),
 .out_data ({tx_msg_type_err_sync,rx_msg_type_err_sync,msg_type_log_err_sync})
);

logic [7:0] mem_acc_id_log_err_sync;
logic rx_no_mem_resp_err_sync;
alt_ecpri_clkcrosser #(.BITS_PER_SYMBOL(8)) mem_acc_noresp_cc (
 .in_clk   (rx_clk),
 .in_rst_n (rx_rst_n),
 .in_ready (), // Low toggling input. Not using this for now
 .in_valid (rx_no_mem_resp_err),
 .in_data  (mem_acc_id_log_err),
 .out_clk  (mm_clk),
 .out_rst_n(rx_mm_sync_nrst),
 .out_ready(1'b1), // always ready
 .out_valid(rx_no_mem_resp_err_sync),
 .out_data (mem_acc_id_log_err_sync)
);

logic intr_msg5_id_err;
logic intr_msg5_noresp_err;
logic intr_rsvd_msg_rx_err;
logic intr_rsvd_msg_tx_err;
logic intr_msg4_noresp_err;
logic intr_msg5_id_err_d;
logic intr_msg5_noresp_err_d;
logic intr_rsvd_msg_err_d;
logic intr_msg4_noresp_err_d;
logic we_intr_msg5_id_err;
logic we_intr_msg5_noresp_err;
logic we_intr_rsvd_msg;
logic we_intr_msg4_noresp_err;

logic [7:0] mem_acc_id_log_err_sync_dly;
logic [5:0] msg_type_log_err_sync_dly;
logic [7:0] msg5_meas_id_log_sync_dly; 
logic [7:0] msg5_actype_log_sync_dly;

// create pulse as we for logging
always_ff @(posedge mm_clk) begin
 intr_msg5_id_err_d     <= intr_msg5_id_err;
 intr_msg5_noresp_err_d <= intr_msg5_noresp_err;
 intr_rsvd_msg_err_d    <= intr_rsvd_msg_rx_err|intr_rsvd_msg_tx_err;
 intr_msg4_noresp_err_d <= intr_msg4_noresp_err;
 // Delay 1 tick
 mem_acc_id_log_err_sync_dly <= mem_acc_id_log_err_sync;
 msg_type_log_err_sync_dly   <= msg_type_log_err_sync;
 msg5_meas_id_log_sync_dly   <= msg5_meas_id_log_sync;
 msg5_actype_log_sync_dly    <= msg5_actype_log_sync;   
end

assign we_intr_rsvd_msg = (intr_rsvd_msg_rx_err|intr_rsvd_msg_tx_err) & !intr_rsvd_msg_err_d;
assign we_intr_msg5_id_err = intr_msg5_id_err & !intr_msg5_id_err_d;
assign we_intr_msg5_noresp_err = intr_msg5_noresp_err & !intr_msg5_noresp_err_d;
assign we_intr_msg4_noresp_err = intr_msg4_noresp_err & !intr_msg4_noresp_err_d;

alt_ecpri_std_synchronizer_nocut #(.depth(2), .rst_value(0)) intr_msg4_noresp_sync (.clk(rx_clk),  .reset_n(rx_rst_n),  .din(!intr_msg4_noresp_err), .dout(intr_msg4_noresp_ready));
alt_ecpri_std_synchronizer_nocut #(.depth(3), .width(3), .rst_value(0)) ecpri_prio_synch      (.clk(mac_clk_tx),  .reset_n(/*mm_rst_n*/ rst_tx_n_mac_clk),  .din(ecpri_priority), .dout(ecpri_priority_o));

alt_ecpri_pulse_stretch_sync tx_sop_err_stretch         ( .aclr_fast_clk(~tx_rst_n), .fast_clk(tx_clk), .aclr_slow_clk(~tx_mm_sync_nrst), .slow_clk(mm_clk), .din(tx_miss_sop_err), .dout (tx_miss_sop_err_ps));
alt_ecpri_pulse_stretch_sync tx_eop_err_stretch         ( .aclr_fast_clk(~tx_rst_n), .fast_clk(tx_clk), .aclr_slow_clk(~tx_mm_sync_nrst), .slow_clk(mm_clk), .din(tx_miss_eop_err), .dout (tx_miss_eop_err_ps));
alt_ecpri_pulse_stretch_sync tx_overflow_err_stretch    ( .aclr_fast_clk(~tx_rst_n), .fast_clk(tx_clk), .aclr_slow_clk(~tx_mm_sync_nrst), .slow_clk(mm_clk), .din(tx_overflow_err), .dout (tx_overflow_err_ps));
alt_ecpri_pulse_stretch_sync tx_ecc_err_stretch         ( .aclr_fast_clk(~tx_rst_n), .fast_clk(tx_clk), .aclr_slow_clk(~tx_mm_sync_nrst), .slow_clk(mm_clk), .din(tx_ecc_err),      .dout (tx_ecc_err_ps));
//alt_ecpri_pulse_stretch_sync tx_msgtype_err_stretch   ( .aclr_fast_clk(~tx_rst_n), .fast_clk(tx_clk), .aclr_slow_clk(~mm_rst_n), .slow_clk(mm_clk), .din(tx_msg_type_err), .dout (tx_msg_type_err_ps));
alt_ecpri_pulse_stretch_sync tx_con_timeout_err_stretch ( .aclr_fast_clk(~tx_rst_n), .fast_clk(tx_clk), .aclr_slow_clk(~tx_mm_sync_nrst), .slow_clk(mm_clk), .din(tx_con_timeout_err), .dout (tx_con_timeout_err_ps));
alt_ecpri_pulse_stretch_sync tx_m_msg_size_err_stretch  ( .aclr_fast_clk(~tx_rst_n), .fast_clk(tx_clk), .aclr_slow_clk(~tx_mm_sync_nrst), .slow_clk(mm_clk), .din(tx_m_msg_size_err),  .dout (tx_m_msg_size_err_ps));
alt_ecpri_pulse_stretch_sync tx_s_msg_size_err_stretch  ( .aclr_fast_clk(~tx_rst_n), .fast_clk(tx_clk), .aclr_slow_clk(~tx_mm_sync_nrst), .slow_clk(mm_clk), .din(tx_s_msg_size_err),  .dout (tx_s_msg_size_err_ps));
alt_ecpri_pulse_stretch_sync tx_pkt_size_err_stretch    ( .aclr_fast_clk(~tx_rst_n), .fast_clk(tx_clk), .aclr_slow_clk(~tx_mm_sync_nrst), .slow_clk(mm_clk), .din(tx_9k_msg_size_err),  .dout (tx_9k_msg_size_err_ps));
alt_ecpri_pulse_stretch_sync tx_avstif_err_stretch      ( .aclr_fast_clk(~tx_rst_n), .fast_clk(tx_clk), .aclr_slow_clk(~tx_mm_sync_nrst), .slow_clk(mm_clk), .din(tx_avst_if_err),  .dout (tx_err_msg_avst_if_err_ps));

// Interrupt 
assign irq_ecpri_all = irq_ecpri_global_en & (irq_ecpri_msg5_ctrl|irq_ecpri_tx_err_msg|irq_ecpri_rx_err_msg|irq_checksum_err);

// ========================Start of of IPV4/6 Checksum===============================//
logic [HEADER_WIDTH-1:0]  	ipv4_hdr_length;
logic [HEADER_WIDTH-1:0]  	ipv6_hdr_length;
logic [HEADER_WIDTH:0]    	total_ipvx_length;
logic [HEADER_WIDTH:0] 		header_length_per_words;
logic                       mac_packet_type_en_ipv4_en_prev;
logic                       mac_packet_type_en_ipv6_en_prev;
	
assign ipv4_hdr_length         = (mac_packet_type_en_ipv4_en == 1'b1) ? (IPV4_LENGTH): '0;
assign ipv6_hdr_length         = (mac_packet_type_en_ipv6_en == 1'b1) ? (IPV6_LENGTH): '0;
assign total_ipvx_length       = ipv4_hdr_length + ipv6_hdr_length;
assign header_length_per_words = divceil(total_ipvx_length, 4'h4);

always_ff @(posedge mm_clk) begin
mac_packet_type_en_ipv4_en_prev	<= mac_packet_type_en_ipv4_en;
mac_packet_type_en_ipv6_en_prev	<= mac_packet_type_en_ipv6_en;
end

generate
	if(IPV4_ENABLE) begin : gen_ipv4_checksum
		logic ipv4_reg_det;
		logic [127:0] ipv4_header;
		logic [3:0] ipv4_counter;
		assign ipv4_header = {ipv4_dest_addr, ipv4_src_addr, ipv4_dw2_tol, ipv4_dw2_prot, ipv4_dw1_id, ipv4_dw1_flg, ipv4_dw1_frag_offs, ipv4_dw0_ver, header_length_per_words[3:0],ipv4_dw0_tos};

		always_ff @(posedge mm_clk or negedge mm_rst_n) begin
			if(mm_rst_n == 0) begin
				ipv4_header_checksum 		<= '0;
				ipv4_counter         		<= '0;
				ipv4_reg_det         		<= '0;
			end else begin
					if((mm_write & mm_addr inside {[16'h2c:16'h30]}) | (mac_packet_type_en_ipv4_en_prev^mac_packet_type_en_ipv4_en) | (mac_packet_type_en_ipv6_en_prev^mac_packet_type_en_ipv6_en)) begin
						ipv4_reg_det 		<= 1'b1;
					end else begin
							ipv4_reg_det 	<= 1'b0;
						end 
						
					if (ipv4_reg_det) begin	// reset again entire values due to changed in the csr fields
						ipv4_header_checksum 			<= '0;
						ipv4_counter					<= '0;
					end else begin
							if (ipv4_counter < IPV4_HDR_CNT_PER_WORD) begin
								ipv4_header_checksum	<= update_calc_checksum(ipv4_header_checksum,ipv4_header[(ipv4_counter*16)+:16]);
								ipv4_counter			<= ipv4_counter + 1'd1;
							end
						end
				end
		end
	end
endgenerate

generate
  if(IPV6_ENABLE) begin : gen_ipv6_checksum
	  logic ipv6_reg_det;
	  logic [319:0] ipv6_header;
	  logic [4:0] ipv6_counter;
  assign ipv6_header = {ipv6_dest_addr3, ipv6_dest_addr2, ipv6_dest_addr1, ipv6_dest_addr0, ipv6_src_addr3, ipv6_src_addr2, ipv6_src_addr1, ipv6_src_addr0, ipv6_dw1_pl, ipv6_dw1_nh, ipv6_dw1_hl, ipv6_dw0_ver, ipv6_dw0_tc, ipv6_dw0_fl};
	  always_ff @(posedge mm_clk or negedge mm_rst_n) begin
		  if(mm_rst_n == 0) begin
		  ipv6_header_checksum <= '0;
		  ipv6_counter         <= '0;
		  ipv6_reg_det         <= '0;
		  end 
		  else begin
			  if((mm_write & mm_addr inside {[16'h33:16'h3c]}) | (mac_packet_type_en_ipv4_en_prev^mac_packet_type_en_ipv4_en) | (mac_packet_type_en_ipv6_en_prev^mac_packet_type_en_ipv6_en)) begin
			  ipv6_reg_det <= 1'b1;
		  end
			  else begin
			  ipv6_reg_det <= 1'b0;
			  end 
		  if (ipv6_reg_det) begin
				  ipv6_header_checksum <= '0;
				  ipv6_counter         <= '0;
		  end else begin
				  if (ipv6_counter < IPV6_HDR_CNT_PER_WORD) begin
				  ipv6_header_checksum <= update_calc_checksum(ipv6_header_checksum,ipv6_header[(ipv6_counter*16)+:16]);
				  ipv6_counter         <= ipv6_counter + 1'd1;
				  end
			  end
		   end
		end
   end
endgenerate

// ========================End of IPV4/6 Checksum===============================//
// csr block ( based on HAS0.8)
ecpri_csr ecpri_csr_inst (
  
  .intr_msg5_id_err (intr_msg5_id_err),
  .intr_msg5_noresp_err (intr_msg5_noresp_err),
  .intr_rsvd_msg_rx_err (intr_rsvd_msg_rx_err),
  .intr_rsvd_msg_tx_err (intr_rsvd_msg_tx_err),
  .intr_msg4_noresp_err (intr_msg4_noresp_err),

  // register offset : 0x00, field offset : 0, access : RO, ecpri_version.ip_version
  .iprev_defaultValue_i (IP_REV[31:0]),
  
  // register offset : 0x04, field offset : 0, access : RW, ecpri_scratch.scratch
  //.we_ecpri_scratch_scratch (1'b0),
  //.ecpri_scratch_scratch_i  (scratch_i), 
  .ecpri_scratch_scratch    (scratch_o),
  
  // register offset : 0x08, field offset : 0, access : RO, ecpri_common_ctrl.rev
  .rev_defaultValue_i           (eCPRI_REV[3:0]),
  .ecpri_common_ctrl_msg4_mode  (mode_msg4),
  .ecpri_common_ctrl_frag_en    (fragmentation_en),	// Not Used
  .ecpri_common_ctrl_err_mask   (), // Not Used
  .ecpri_common_ctrl_frag_sz    (fragmentation_sz),
  .ecpri_common_ctrl_irq_en     (irq_ecpri_global_en),
  .ecpri_common_ctrl_mf_en	(mf_en),
  
  // register offset : 0x0c, field offset : 0, access : RW, ecpri_msg5_ctrl.meas_mode
  .msg5_op_defaultValue_i          (!ONE_STEP_DELAY_EN),  
  .irq_ecpri_msg5_ctrl             (irq_ecpri_msg5_ctrl),
  .ecpri_msg5_ctrl_meas_mode       (msg5_meas_mode_o),
  .ecpri_msg5_ctrl_meas_id         (msg5_meas_id_o),
  .ecpri_msg5_ctrl_remote_request  (msg5_remote_req_o),
  .ecpri_msg5_ctrl_meas_start      (msg5_meas_start_o),
  .ecpri_msg5_ctrl_meas_complete_i (msg5_meas_complete_sync),
  
  .ecpri_msg5_ctrl_dummy_bytes     (msg5_dummy_bytes_o),  

  // register offset : 0x10, field offset : 0, access : W1C, interrupt : Status
  .irq_ecpri_tx_err_msg                (irq_ecpri_tx_err_msg),
  .ecpri_tx_err_msg_tx_miss_sop_err_i  (tx_miss_sop_err_ps),
  .ecpri_tx_err_msg_tx_miss_eop_err_i  (tx_miss_eop_err_ps),
  .ecpri_tx_err_msg_tx_overflow_err_i  (tx_overflow_err_ps),
  .ecpri_tx_err_msg_tx_ecc_err_i       (tx_ecc_err_ps),
  .ecpri_tx_err_msg_tx_msg_type_err_i  (rx_msg_type_err_valid & tx_msg_type_err_sync),
  .ecpri_tx_err_msg_con_timeout_err_i  (tx_con_timeout_err_ps),
  .ecpri_tx_err_msg_m_msg_size_err_i   (tx_m_msg_size_err_ps),
  .ecpri_tx_err_msg_s_msg_size_err_i   (tx_s_msg_size_err_ps),
  .ecpri_tx_err_msg_usr_msg_size_err_i (tx_9k_msg_size_err_ps),
  .ecpri_tx_err_msg_avst_if_err_i      (tx_err_msg_avst_if_err_ps),
  
  // register offset : 0x14, field offset : 0, access : W1C, interrupt : Status
  .irq_ecpri_rx_err_msg                (irq_ecpri_rx_err_msg),
  .ecpri_rx_err_msg_rx_miss_sop_err_i  (rx_miss_sop_err_ps),
  .ecpri_rx_err_msg_rx_miss_eop_err_i  (rx_miss_eop_err_ps),
  .ecpri_rx_err_msg_rx_overflow_err_i  (rx_overflow_err_ps),
  .ecpri_rx_err_msg_rx_ecc_err_i       (rx_ecc_err_ps),
  .ecpri_rx_err_msg_rx_msg_type_err_i  (rx_msg_type_err_valid & rx_msg_type_err_sync),
  .ecpri_rx_err_msg_rx_meas_id_err_i   (rx_meas_id_err_sync_valid & rx_meas_id_err_sync),
  .ecpri_rx_err_msg_inv_msg5_req_err_i (rx_inv_msg5_req_err_ps),
  .ecpri_rx_err_msg_inv_msg5_fup_err_i (rx_inv_msg5_fup_err_ps),
  .ecpri_rx_err_msg_inv_msg5_resp_err_i(rx_inv_msg5_resp_err_ps),
  .ecpri_rx_err_msg_msg5_pkt_err_i     (rx_err_msg_msg5_pkt_err_ps),
  .ecpri_rx_err_msg_no_resp_msg5_err_i (rx_meas_id_err_sync_valid & rx_no_resp_msg5_err_sync),
  .ecpri_rx_err_msg_no_rst_resp_err_i  (rx_no_rst_resp_err_ps),
  .ecpri_rx_err_msg_no_mem_resp_err_i  (rx_no_mem_resp_err_sync),
  .ecpri_rx_err_msg_msg4_buffer_mode_err_i (rx_msg4_buffer_mode_err_ps),
  .ecpri_rx_err_msg_payload_length_mismatch_err_i	(rx_msg_payload_length_mismatch_err_ps),
  .ecpri_rx_err_msg_invalid_concan_bit_received_err_i (rx_msg_invalid_concan_bit_received_err_ps),
  .ecpri_rx_err_msg_rx_in_avst_err_i                  (rx_err_msg_rx_in_avst_err_ps),

  // register offset : 0x1c, field offset : 0, access : W1C, ecpri_err_log_msg.mem_acc_id_log_err
  .we_ecpri_err_log_msg_mem_acc_id_log_err  (we_intr_msg4_noresp_err),
  .ecpri_err_log_msg_mem_acc_id_log_err_i   (mem_acc_id_log_err_sync_dly),
  .we_ecpri_err_log_msg_msg_type_log_err    (we_intr_rsvd_msg),
  .ecpri_err_log_msg_msg_type_log_err_i     (msg_type_log_err_sync_dly),
  .we_ecpri_err_log_msg_msg5_actype_log_err ((we_intr_msg5_id_err|we_intr_msg5_noresp_err)),
  .ecpri_err_log_msg_msg5_actype_log_err_i  (msg5_actype_log_sync_dly),
  .we_ecpri_err_log_msg_meas_id_log_err     ((we_intr_msg5_id_err|we_intr_msg5_noresp_err)),
  .ecpri_err_log_msg_meas_id_log_err_i      (msg5_meas_id_log_sync_dly),

  // 0x20
  .we_ecpri_msg5_cv0_msg5_cv0   (msg5_meas_complete_cv_sync),
  .ecpri_msg5_cv0_msg5_cv0_i    (cv_meas_sync[31:0]),
  .ecpri_msg5_cv0_msg5_cv0      (), // Not used
  // 0x24
  .we_ecpri_msg5_cv1_msg5_cv1   (msg5_meas_complete_cv_sync),
  .ecpri_msg5_cv1_msg5_cv1_i    (cv_meas_sync[63:32]),
  .ecpri_msg5_cv1_msg5_cv1      (), // Not used

  // 0x28
  .we_ecpri_msg5_td0_ecpri_msg5_td0   (msg5_meas_complete_sync),
  .ecpri_msg5_td0_ecpri_msg5_td0_i    (td_meas_sync[31:0]),
  .ecpri_msg5_td0_ecpri_msg5_td0      (), // Not used
 
  // 0x2c
  .we_ecpri_msg5_td1_ecpri_msg5_td1   (msg5_meas_complete_sync),
  .ecpri_msg5_td1_ecpri_msg5_td1_i    (td_meas_sync[63:32]),
  .ecpri_msg5_td1_ecpri_msg5_td1      (), // Not used
 
  // 0x30
  .we_ecpri_msg5_td2_ecpri_msg5_td2   (msg5_meas_complete_sync),
  .ecpri_msg5_td2_ecpri_msg5_td2_i    (td_meas_sync[79:64]),
  .ecpri_msg5_td2_ecpri_msg5_td2      (), // Not used
 
 
  //Eth frame
  //.we_eth_frame_scratch_ethfrm_scratch  (1'b0),
  //.eth_frame_scratch_ethfrm_scratch_i	('hAEFEAEFE), 
  .eth_frame_scratch_ethfrm_scratch	(ethfrm_scratch),

  .source_mac_addr0_0_defaultValue_i (SRC_MAC_ADDR0_0_DF),
  .source_mac_addr0_1_defaultValue_i (SRC_MAC_ADDR0_1_DF),
  .dest_mac_addr0_0_defaultValue_i   (DEST_MAC_ADDR0_0_DF),
  .dest_mac_addr0_1_defaultValue_i   (DEST_MAC_ADDR0_1_DF),
  .dest_mac_addr1_0_defaultValue_i   (DEST_MAC_ADDR1_0_DF),
  .dest_mac_addr1_1_defaultValue_i   (DEST_MAC_ADDR1_1_DF),
  .dest_mac_addr2_0_defaultValue_i   (DEST_MAC_ADDR2_0_DF),
  .dest_mac_addr2_1_defaultValue_i   (DEST_MAC_ADDR2_1_DF),
  .dest_mac_addr3_0_defaultValue_i   (DEST_MAC_ADDR3_0_DF),
  .dest_mac_addr3_1_defaultValue_i   (DEST_MAC_ADDR3_1_DF),
  .dest_mac_addr4_0_defaultValue_i   (DEST_MAC_ADDR4_0_DF),
  .dest_mac_addr4_1_defaultValue_i   (DEST_MAC_ADDR4_1_DF),
  .dest_mac_addr5_0_defaultValue_i   (DEST_MAC_ADDR5_0_DF),
  .dest_mac_addr5_1_defaultValue_i   (DEST_MAC_ADDR5_1_DF),
  .dest_mac_addr6_0_defaultValue_i   (DEST_MAC_ADDR6_0_DF),
  .dest_mac_addr6_1_defaultValue_i   (DEST_MAC_ADDR6_1_DF),
  .dest_mac_addr7_0_defaultValue_i   (DEST_MAC_ADDR7_0_DF),
  .dest_mac_addr7_1_defaultValue_i   (DEST_MAC_ADDR7_1_DF),
  
  .source_mac_addr0_0_mac_sa_addr0_0    (mac_sa0_addr0),
  .source_mac_addr0_1_mac_sa_addr0_1    (mac_sa0_addr1),
  // .source_mac_addr0_1_mac_sa_addr0_1_reserved        (),
  .dest_mac_addr0_0_mac_addr0_0      (mac_da0_addr0),
  .dest_mac_addr0_1_mac_addr0_1      (mac_da0_addr1),
  // .dest_mac_addr0_1_mac_addr0_1_reserved          (),
  
  .dest_mac_addr1_0_mac_addr1_0      (mac_da1_addr0),
  .dest_mac_addr1_1_mac_addr1_1      (mac_da1_addr1),
  // .dest_mac_addr1_1_mac_addr1_1_reserved          (),
  
  .dest_mac_addr2_0_mac_addr2_0      (mac_da2_addr0),
  .dest_mac_addr2_1_mac_addr2_1      (mac_da2_addr1),
  // .dest_mac_addr2_1_mac_addr2_1_reserved          (),
  
  .dest_mac_addr3_0_mac_addr3_0      (mac_da3_addr0),
  .dest_mac_addr3_1_mac_addr3_1      (mac_da3_addr1),
  // .dest_mac_addr3_1_mac_addr3_1_reserved          (),
  
  .dest_mac_addr4_0_mac_addr4_0      (mac_da4_addr0),
  .dest_mac_addr4_1_mac_addr4_1      (mac_da4_addr1),
  // .dest_mac_addr4_1_mac_addr4_1_reserved          (),
  
   
  .dest_mac_addr5_0_mac_addr5_0      (mac_da5_addr0),
  .dest_mac_addr5_1_mac_addr5_1      (mac_da5_addr1),
  // .dest_mac_addr5_1_mac_addr5_1_reserved          (), 
  
  .dest_mac_addr6_0_mac_addr6_0      (mac_da6_addr0),
  .dest_mac_addr6_1_mac_addr6_1      (mac_da6_addr1),
  // .dest_mac_addr6_1_mac_addr6_1_reserved          (),
  
  .dest_mac_addr7_0_mac_addr7_0      (mac_da7_addr0),
  .dest_mac_addr7_1_mac_addr7_1      (mac_da7_addr1),
  // .dest_mac_addr7_1_mac_addr7_1_reserved          (),
  
  .ipv4_tpid_defaultValue_i         (16'h8100),
  .ipv4_dei_defaultValue_i          (1'b0),
  .mac_vlan_tag_0_vid               (mac_vlan_tag0_vid),
  .mac_vlan_tag_0_dei               (mac_vlan_tag0_dei),
  .mac_vlan_tag_0_pcp               (mac_vlan_tag0_pcp),
  .mac_vlan_tag_0_tpid              (mac_vlan_tag0_tpid),
  
  .mac_vlan_tag_1_vid               (mac_vlan_tag1_vid),
  .mac_vlan_tag_1_dei                (mac_vlan_tag1_dei),
  .mac_vlan_tag_1_pcp               (mac_vlan_tag1_pcp),
  .mac_vlan_tag_1_tpid               (mac_vlan_tag1_tpid),
  
  .mac_vlan_tag_2_vid               (mac_vlan_tag2_vid),
  .mac_vlan_tag_2_dei               (mac_vlan_tag2_dei),
  .mac_vlan_tag_2_pcp               (mac_vlan_tag2_pcp),
  .mac_vlan_tag_2_tpid              (mac_vlan_tag2_tpid),
  
  .mac_vlan_tag_3_vid               (mac_vlan_tag3_vid),
  .mac_vlan_tag_3_dei               (mac_vlan_tag3_dei),
  .mac_vlan_tag_3_pcp               (mac_vlan_tag3_pcp),
  .mac_vlan_tag_3_tpid              (mac_vlan_tag3_tpid),
  
  .mac_vlan_tag_4_vid               (mac_vlan_tag4_vid),
  .mac_vlan_tag_4_dei                (mac_vlan_tag4_dei),
  .mac_vlan_tag_4_pcp               (mac_vlan_tag4_pcp),
  .mac_vlan_tag_4_tpid               (mac_vlan_tag4_tpid),
  
  .mac_vlan_tag_5_vid               (mac_vlan_tag5_vid),
  .mac_vlan_tag_5_dei               (mac_vlan_tag5_dei),
  .mac_vlan_tag_5_pcp               (mac_vlan_tag5_pcp),
  .mac_vlan_tag_5_tpid              (mac_vlan_tag5_tpid),
  
  .mac_vlan_tag_6_vid               (mac_vlan_tag6_vid),
  .mac_vlan_tag_6_dei                (mac_vlan_tag6_dei),
  .mac_vlan_tag_6_pcp               (mac_vlan_tag6_pcp),
  .mac_vlan_tag_6_tpid               (mac_vlan_tag6_tpid),
  
  .mac_vlan_tag_7_vid               (mac_vlan_tag7_vid),
  .mac_vlan_tag_7_dei               (mac_vlan_tag7_dei),
  .mac_vlan_tag_7_pcp               (mac_vlan_tag7_pcp),
  .mac_vlan_tag_7_tpid              (mac_vlan_tag7_tpid),
  
  .ecpri_ethertype_defaultValue_i   (16'hAEFE),
  .mac_ethertype_ethtype            (mac_ethertype),
  // .mac_ethertype_reserved           (),

  .ipv4_dw0_address_dw0_tl 	  		(ipv4_dw0_tl),
  .ipv4_dw0_address_dw0_tos   		(ipv4_dw0_tos),
  .ipv4_dw0_address_dw0_hl   		(ipv4_dw0_hl),
  .ipv4_dw0_address_dw0_ver   		(ipv4_dw0_ver),
  .ipv4_dw1_address_dw1_frag_offs   (ipv4_dw1_frag_offs),
  .ipv4_dw1_address_dw1_flg  		(ipv4_dw1_flg),
  .ipv4_dw1_address_dw1_id			(ipv4_dw1_id),
  .ipv4_dw2_address_dw2_hdchksum 	(ipv4_dw2_hdchksum),
  .ipv4_dw2_address_dw2_prot   		(ipv4_dw2_prot),
  .ipv4_dw2_address_dw2_tol  		(ipv4_dw2_tol),
  .ipv4_src_address_0_ipv4_src_address_0   (ipv4_src_addr),
  .ipv4_dst_address_0_ipv4_dst_address_0  	(ipv4_dest_addr),
  
  .mudp_dw0_address_udp_dw0_chksum   	(udp_dw0_chksum),
  .mudp_dw0_address_udp_dw0_length  		(udp_dw0_length),
  .mudp_address_0_udp_src_port   (udp_src0_port),
  .mudp_address_0_udp_dest_port  (udp_dest0_port), 
 
  /* Not support in 20.1
  .ipv6_dw0_address_dw0_fl   (ipv6_dw0_fl),
  .ipv6_dw0_address_dw0_tc   (ipv6_dw0_tc),
  .ipv6_dw0_address_dw0_ver  (ipv6_dw0_ver),
  .ipv6_dw1_address_dw1_hl   (ipv6_dw1_hl),
  .ipv6_dw1_address_dw1_nh   (ipv6_dw1_nh),
  .ipv6_dw1_address_dw1_pl   (ipv6_dw1_pl), 

  .ipv6_src_address_0_mac_ipv6_src_addr0   (ipv6_src_addr0),
  .ipv6_src_address_1_mac_ipv6_src_addr1  (ipv6_src_addr1),
  .ipv6_src_address_2_mac_ipv6_src_addr2   (ipv6_src_addr2),
  .ipv6_src_address_3_mac_ipv6_src_addr3  (ipv6_src_addr3), 
  
  .ipv6_dst_address_0_mac_ipv6_dest_addr0   (ipv6_dest_addr0),
  .ipv6_dst_address_1_mac_ipv6_dest_addr1  (ipv6_dest_addr1),
  .ipv6_dst_address_2_mac_ipv6_dest_addr2   (ipv6_dest_addr2),
  .ipv6_dst_address_3_mac_ipv6_dest_addr3  (ipv6_dest_addr3), 
  */
  .packet_type_enable_ipv6_en	(mac_packet_type_en_ipv6_en),
  .packet_type_enable_ipv4_en	(mac_packet_type_en_ipv4_en),
  .packet_type_enable_vlan_en	(mac_packet_type_en_vlan_en),
  .packet_type_enable_svlan_en	(mac_packet_type_en_svlan_en),
  .packet_type_enable_udp_en	(mac_packet_type_en_udp_en),
	
  .irq_rx_error_address               (irq_checksum_err),
  .rx_error_address_ipv4_chksum_err_i (hdr_chksum_err_ps),
  .rx_error_address_udp_chksum_err_i  (1'b0), // Not Supported yet in 20.1
  
  .cu_vlanid_match_address_vid_addr_defaultValue_i (VID_ADDR_DF),
  .cu_vlanid_match_address_vid_addr                (vid_addr_o),
  
  .cu_vlanid_match_address_match_macaddr_vlanid_defaultValue_i (MACADDR_VLANID),
  .cu_vlanid_match_address_match_macaddr_vlanid                (macaddr_vlanid_o),
  .ecpri_priority_defaultValue_i       (ECPRI_PRIORITY_DEFAULT),
  .ecpri_priority_ecpri_priority_value (ecpri_priority),
  .ptp_priority_defaultValue_i         (PTP_DEFAULT),
  .ptp_priority_ptp_priority_value     (ptp_priority_o),
  .misc_priority_defaultValue_i        (MISC_DEFAULT),
  .misc_priority_misc_priority_value   (misc_priority_o),
  .pq_starvation_en_pq_starvation_ext0 (en_pq_starvation_ext0_o),
  .pq_starvation_en_pq_starvation_ext1 (en_pq_starvation_ext1_o),
  //Bus Interface
  .clk           (mm_clk),
  .reset         (~mm_rst_n),
  .writedata     (mm_wdata),
  .read          (mm_read),
  .write         (mm_write),
  .byteenable    (4'b1111),
  .readdata      (mm_rdata),
  .readdatavalid (mm_rdata_valid),
  //byte to word addressing conversion as the word address format from top
  .address       ({mm_addr, 2'b00}),
  .waitrequest   (mm_waitrequest)
);

// Stub unused ports
assign ipv6_dw0_fl      = '0;
assign ipv6_dw0_tc      = '0;
assign ipv6_dw0_ver     = '0;
assign ipv6_dw1_hl      = '0;
assign ipv6_dw1_nh      = '0;
assign ipv6_dw1_pl      = '0;
assign ipv6_src_addr0   = '0;
assign ipv6_src_addr1   = '0;
assign ipv6_src_addr2   = '0;
assign ipv6_src_addr3   = '0;
assign ipv6_dest_addr0  = '0;
assign ipv6_dest_addr1  = '0;
assign ipv6_dest_addr2  = '0;
assign ipv6_dest_addr3  = '0;

endmodule




