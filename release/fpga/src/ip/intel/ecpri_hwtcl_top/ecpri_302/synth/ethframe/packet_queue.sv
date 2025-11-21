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

module packet_queue
#(
parameter DEVICE_FAMILY   = "Stratix 10",
parameter DATA_PATH       = "TX",
parameter BITSPERSYMBOL   = 8,                                    // Streaming Data symbol width in bits
parameter SYMBOLSPERBEAT  = 8,                                    // Streaming Number of symbols per symb
parameter READY_LATENCY   = 3,                                    // Streaming ready latency
parameter MAC_TCP_EN      = 0,
parameter MAC_VLAN_EN     = 0,
parameter DATA_WIDTH      = (BITSPERSYMBOL * SYMBOLSPERBEAT),     // Streaming Data bit width
parameter ERROR_WIDTH     = 1,                                    // Streaming port error width
parameter EMPTY_WIDTH     = 3,                                    // Streaming Empty width
parameter EXT_SINK_0_DFIFO_DEPTH  = 256,
parameter EXT_SINK_1_DFIFO_DEPTH  = 256,
parameter NUMBER_EXT_SINK_INT = 1,
parameter DESC_WIDTH         = 6,
parameter PTP_TS_FP_WIDTH    = 6,
//parameter TS_FINGERPRINT_UD  = 0,
parameter TX_ARBITRATION_SCHEME  = "FIXED",
parameter ARB_QUEUE_0_DEPTH  = 256,
parameter ARB_QUEUE_1_DEPTH  = 256,
parameter ARB_QUEUE_2_DEPTH  = 256,
parameter ARB_QUEUE_3_DEPTH  = 256,
parameter ARB_QUEUE_4_DEPTH  = 256,
parameter ARB_QUEUE_5_DEPTH  = 256,
parameter ARB_QUEUE_6_DEPTH  = 256,
parameter ARB_QUEUE_7_DEPTH  = 256
)
(
//Common clock and Reset
input  logic                     ext_sink_clk, // from external HPS clock domain
input  logic                     mac_source_clk, // clktxmac
input  logic                     reset_n,
input  logic                     reset_n_src_clk,

//Avalon St logic DataIn (Sink) Interface from MAC
//Add ext sink 0 & 1 seperately
input  logic                     ext_sink_0_sop,
input  logic                     ext_sink_0_eop,
input  logic                     ext_sink_0_valid,
input  logic [(DATA_WIDTH)-1:0]  ext_sink_0_data,
input  logic [EMPTY_WIDTH-1:0]   ext_sink_0_empty,
input  logic [(ERROR_WIDTH)-1:0] ext_sink_0_error,
output logic                     ext_sink_0_ready,
input  logic [DESC_WIDTH-1:0]    ext_sink_0_desc,
input  logic                     ext_sink_0_desc_valid,
input logic  [95:0]              ext_sink_0_tx_ingress_timestamp_96b_data,

input  logic                     ext_sink_1_sop,
input  logic                     ext_sink_1_eop,
input  logic                     ext_sink_1_valid,
input  logic [(DATA_WIDTH)-1:0]  ext_sink_1_data,
input  logic [EMPTY_WIDTH-1:0]   ext_sink_1_empty,
input  logic [(ERROR_WIDTH)-1:0] ext_sink_1_error,
output logic                     ext_sink_1_ready,
input  logic [DESC_WIDTH-1:0]    ext_sink_1_desc,
input  logic                     ext_sink_1_desc_valid,
input logic  [95:0]              ext_sink_1_tx_ingress_timestamp_96b_data,

//These input signal not related to ext_sink_0 and ext_sink_1, remain connected in upper module for now.
input  logic [47:0]              mac_frame_srcaddr,
input  logic [15:0]              mac_ethertype,
input  logic [31:0]              ipv4_src_addr,
input  logic [15:0]              udp_src0_port,
input  logic [31:0]              ipv6_src_addr0,
input  logic [31:0]              ipv6_src_addr1,
input  logic [31:0]              ipv6_src_addr2,
input  logic [31:0]              ipv6_src_addr3,

//Avalon St logic DataIn (Sink) Interface from eCPRI P2 (second priority)
input  logic                     ecpri_sink_sop,
input  logic                     ecpri_sink_eop,
input  logic                     ecpri_sink_valid,
output logic                     ecpri_source_ready /* synthesis preserve_syn_only */,
input  logic [(DATA_WIDTH)-1:0]  ecpri_sink_data,
input  logic [EMPTY_WIDTH-1:0]   ecpri_sink_empty,
input  logic [(ERROR_WIDTH)-1:0] ecpri_sink_error,
input  logic [2:0]               ecpri_vlan_pcp,
input  logic                     ecpri_dout_ready,

//Avalon St logic DataOut (Source) Interface to Ethernet MAC
output logic                     mac_source_sop,
output logic                     mac_source_eop,
output logic                     mac_source_valid,
input  logic                     mac_source_ready,
output logic [(DATA_WIDTH)-1:0]  mac_source_data,
output logic [EMPTY_WIDTH-1:0]   mac_source_empty,
output logic [(ERROR_WIDTH)-1:0] mac_source_error,

input  logic                     msg5_pkt,
input  logic                     msg5_ptp_ts_insert,
input  logic                     msg5_ptp_ts_valid,
input  logic                     msg5_ptp_ts_rt_update,
input logic [15:0]               msg5_offset_correction_field,
input logic [15:0]               msg5_offset_timestamp,

input logic [ 2:0]               ptp_priority,
input logic [ 2:0]               misc_priority,
input logic                      en_pq_starvation_ext1,
input logic                      en_pq_starvation_ext0,

output logic   [15:0]            ptp_offset_timestamp,
output logic   [15:0]            ptp_offset_correction_field,
//One step processing, ETH MAC will overwrite the timestamp information in the current packet
output logic                     ptp_timestamp_insert,
//Two step processing, ETH MAC will no overwrite the timestamp information in the current packet
output logic                     ptp_tx_etstamp_ins_ctrl_residence_time_update,
output logic[PTP_TS_FP_WIDTH+1:0]ptp_timestamp_request_fingerprint,
output logic                     ptp_timestamp_request_valid,

output logic                     tx_queue_0_fifo_full,
output logic                     tx_queue_1_fifo_full,
output logic                     tx_queue_2_fifo_full,
output logic                     tx_queue_3_fifo_full,
output logic                     tx_queue_4_fifo_full,
output logic                     tx_queue_5_fifo_full,
output logic                     tx_queue_6_fifo_full,
output logic                     tx_queue_7_fifo_full,


//input  logic [95:0]              ext_tx_ingress_timestamp_96b_data,

output logic [95:0]              ptp_tx_ingress_timestamp_96b_data
);

logic                     l2cos_ecpri_sink_sop;
logic                     l2cos_ecpri_sink_eop;
logic                     l2cos_ecpri_sink_valid;
logic                     l2cos_ecpri_source_ready;
logic [(DATA_WIDTH)-1:0]  l2cos_ecpri_sink_data;
logic [EMPTY_WIDTH-1:0]   l2cos_ecpri_sink_empty;
logic [(ERROR_WIDTH)-1:0] l2cos_ecpri_sink_error;
logic [2:0]               l2cos_ecpri_vlan_pcp;
logic                     l2cos_ecpri_dout_ready;
logic                     l2cos_ecpri_state_l2cos_idle;

logic                     l2cos_msg5_pkt;
logic                     l2cos_msg5_ts_insert;
logic                     l2cos_msg5_ts_valid;
logic                     l2cos_msg5_ts_rt_update;
logic [15:0]              l2cos_msg5_offset_correction_field;
logic [15:0]              l2cos_msg5_offset_timestamp;

logic                     ext_sink_0_ptp_o;
logic                     ext_sink_0_ipv4_o;
logic                     ext_sink_0_ipv6_o;
logic [3:0]               ext_sink_0_ptp_message_type_o;
logic                     ext_sink_0_ecpri_o;
logic                     ext_sink_0_vlan_o;
logic                     ext_sink_0_svlan_o;
logic                     ext_sink_0_udp_o;

logic                     ext_sink_1_ptp_o;
logic                     ext_sink_1_ipv4_o;
logic                     ext_sink_1_ipv6_o;
logic [3:0]               ext_sink_1_ptp_message_type_o;
logic                     ext_sink_1_ecpri_o;
logic                     ext_sink_1_vlan_o;
logic                     ext_sink_1_svlan_o;
logic                     ext_sink_1_udp_o;

logic                     o_ext_sink_0_sop;
logic                     o_ext_sink_0_eop;
logic                     o_ext_sink_0_valid;
logic [(DATA_WIDTH)-1:0]  o_ext_sink_0_data;
logic [EMPTY_WIDTH-1:0]   o_ext_sink_0_empty;
logic [(ERROR_WIDTH)-1:0] o_ext_sink_0_error;
logic [DESC_WIDTH-1:0]    o_ext_sink_0_desc;
logic                     o_ext_sink_0_desc_valid;
logic [2:0]               o_ext_sink_0_vlan_pcp;

logic                     o_ext_sink_1_sop;
logic                     o_ext_sink_1_eop;
logic                     o_ext_sink_1_valid;
logic [(DATA_WIDTH)-1:0]  o_ext_sink_1_data;
logic [EMPTY_WIDTH-1:0]   o_ext_sink_1_empty;
logic [(ERROR_WIDTH)-1:0] o_ext_sink_1_error;
logic [DESC_WIDTH-1:0]    o_ext_sink_1_desc;
logic                     o_ext_sink_1_desc_valid;
logic [2:0]               o_ext_sink_1_vlan_pcp;

logic [95:0]              o_ext_sink_0_tx_ingress_timestamp_96b_data;
logic [95:0]              o_ext_sink_1_tx_ingress_timestamp_96b_data;

logic                     queue_ext_sink_0_ready_out;
logic                     queue_ext_sink_1_ready_out;

logic                     queue_ext_sink_0_ptp_out;//23.3 new port, indicator for ptp, 1 = ptp.
logic                     queue_ext_sink_0_sop_out;
logic                     queue_ext_sink_0_eop_out;
logic                     queue_ext_sink_0_valid_out;
logic [(DATA_WIDTH)-1:0]  queue_ext_sink_0_data_out;
logic [(DESC_WIDTH)-1:0]  queue_ext_sink_0_desc_out;
logic                     queue_ext_sink_0_desc_valid_out;
logic [EMPTY_WIDTH-1:0]   queue_ext_sink_0_empty_out;
logic [(ERROR_WIDTH)-1:0] queue_ext_sink_0_error_out;
logic [2:0]               queue_ext_sink_0_vlan_pcp_out;
logic [95:0]              queue_ext_sink_0_tx_ingress_timestamp_96b_data;
logic                     queue_ext_sink_0_ready_in /* synthesis preserve_syn_only */;

logic                     queue_ext_sink_1_ptp_out;//23.3 new port, indicator for ptp, 1 = ptp.
logic                     queue_ext_sink_1_sop_out;
logic                     queue_ext_sink_1_eop_out;
logic                     queue_ext_sink_1_valid_out;
logic [(DATA_WIDTH)-1:0]  queue_ext_sink_1_data_out;
logic [(DESC_WIDTH)-1:0]  queue_ext_sink_1_desc_out;
logic                     queue_ext_sink_1_desc_valid_out;
logic [EMPTY_WIDTH-1:0]   queue_ext_sink_1_empty_out;
logic [(ERROR_WIDTH)-1:0] queue_ext_sink_1_error_out;
logic [2:0]               queue_ext_sink_1_vlan_pcp_out;
logic [95:0]              queue_ext_sink_1_tx_ingress_timestamp_96b_data;
logic                     queue_ext_sink_1_ready_in /* synthesis preserve_syn_only */;


logic                     queue_ext_sink_0_dout_ready;
logic                     queue_ext_sink_1_dout_ready;

logic                     queue_ext_sink_0_priority_flag;
logic                     queue_ext_sink_0_clr_cnt;
logic                     queue_ext_sink_0_sop_cnt_en;

logic                     queue_ext_sink_1_priority_flag;
logic                     queue_ext_sink_1_clr_cnt;
logic                     queue_ext_sink_1_sop_cnt_en;

logic                     queue_ext_sink_0_one_step_en;
logic                     queue_ext_sink_0_two_step_en;
logic       [15:0]        queue_ext_sink_0_offset_timestamp;
logic       [15:0]        queue_ext_sink_0_offset_correction_field;

logic                     queue_ext_sink_1_one_step_en;
logic                     queue_ext_sink_1_two_step_en;
logic       [15:0]        queue_ext_sink_1_offset_timestamp;
logic       [15:0]        queue_ext_sink_1_offset_correction_field;


logic                       queue_ext_sink_0_timestamp_insert;
logic [PTP_TS_FP_WIDTH+1:0] queue_ext_sink_0_timestamp_request_fingerprint;
logic                       queue_ext_sink_0_timestamp_request_valid;
logic                       queue_ext_sink_0_tx_etstamp_ins_ctrl_residence_time_update;

logic                       queue_ext_sink_1_timestamp_insert;
logic [PTP_TS_FP_WIDTH+1:0] queue_ext_sink_1_timestamp_request_fingerprint;
logic                       queue_ext_sink_1_timestamp_request_valid;
logic                       queue_ext_sink_1_tx_etstamp_ins_ctrl_residence_time_update;

logic                     sync_reset_n_pre;
logic                     sync_reset_n /* synthesis preserve_syn_only maxfan = 30 */;

//logic [ 3:0]              sync_ecpri_priority;
logic [ 2:0]              sync_ptp_priority;
logic [ 2:0]              sync_misc_priority;
logic                     sync_en_pq_starvation_ext1;
logic                     sync_en_pq_starvation_ext0;


alt_ecpri_std_synchronizer_nocut #(.depth(2), .rst_value(0)) parser_reset_sync (.clk(ext_sink_clk),  .reset_n(reset_n),  .din(1'b1), .dout(sync_reset_n_pre));
//Synchronizer for csr value
alt_ecpri_std_synchronizer_nocut #(.depth(3), .width(3), .rst_value(0)) ptp_prio_synch (.clk(ext_sink_clk),  .reset_n(/*reset_n*/sync_reset_n_pre),  .din(ptp_priority), .dout(sync_ptp_priority));
alt_ecpri_std_synchronizer_nocut #(.depth(3), .width(3), .rst_value(0)) misc_prio_synch (.clk(ext_sink_clk),  .reset_n(/*reset_n*/sync_reset_n_pre),  .din(misc_priority), .dout(sync_misc_priority));
alt_ecpri_std_synchronizer_nocut #(.depth(2), .width(1), .rst_value(0)) en_pq_starvation_ext1_synch (.clk(mac_source_clk),  .reset_n(/*reset_n*/reset_n_src_clk),  .din(en_pq_starvation_ext1), .dout(sync_en_pq_starvation_ext1));
alt_ecpri_std_synchronizer_nocut #(.depth(2), .width(1), .rst_value(0)) en_pq_starvation_ext0_synch (.clk(mac_source_clk),  .reset_n(/*reset_n*/reset_n_src_clk),  .din(en_pq_starvation_ext0), .dout(sync_en_pq_starvation_ext0));

always_ff @(posedge ext_sink_clk) begin
   sync_reset_n <= sync_reset_n_pre;
end

//ext_sink_0
packet_parser #(
.TX_ARBITRATION_SCHEME      (TX_ARBITRATION_SCHEME),
.DEVICE_FAMILY              (DEVICE_FAMILY),
.DATA_PATH                  (DATA_PATH),
.BITSPERSYMBOL              (BITSPERSYMBOL),
.SYMBOLSPERBEAT             (SYMBOLSPERBEAT),
.ERROR_WIDTH                (ERROR_WIDTH),
.MAC_VLAN_EN                (MAC_VLAN_EN),
.MAC_TCP_EN                 (MAC_TCP_EN),
.READY_LATENCY              (READY_LATENCY),
.EMPTY_WIDTH                (EMPTY_WIDTH),
.DESC_WIDTH                 (DESC_WIDTH)
) ext_sink_0_tx_packet_parser_inst (
//Common clock and Reset
.data_sink_clk                       (ext_sink_clk),
.data_source_clk                     (ext_sink_clk),
.ext_source_clk                      (1'b0),

.rst_n                               (reset_n),
.rst_n_sink_clk                      (sync_reset_n),
.rst_n_src_clk                       (sync_reset_n),

//Avalon St logic DataIn (Sink) Interface from external HPS
.ext_sink_sop                        (ext_sink_0_sop),
.ext_sink_eop                        (ext_sink_0_eop),
.ext_sink_valid                      (ext_sink_0_valid),
.ext_sink_data                       (ext_sink_0_data),
.ext_sink_empty                      (ext_sink_0_empty),
.ext_sink_error                      (ext_sink_0_error),
.ext_sink_ready                      (ext_sink_0_ready),
.ext_sink_desc                       (ext_sink_0_desc),
.ext_sink_desc_valid                 (ext_sink_0_desc_valid),
//.ext_sink_priority                   (sync_ext_sink_0_priority),
.ptp_priority                        (sync_ptp_priority),
.misc_priority                       (sync_misc_priority),
//This signal for RX path, TX will remain conencted but unused
.mac_frame_srcaddr                   (mac_frame_srcaddr),
.mac_ethertype                       (mac_ethertype),
.ipv4_src_addr                       (ipv4_src_addr),
.udp_src0_port                       (udp_src0_port),
.ipv6_src_addr0                      (ipv6_src_addr0),
.ipv6_src_addr1                      (ipv6_src_addr1),
.ipv6_src_addr2                      (ipv6_src_addr2),
.ipv6_src_addr3                      (ipv6_src_addr3),
.vid_addr                            (12'h0),
.macaddr_vlanid                      (1'b0),

.ecpri_o                             (ext_sink_0_ecpri_o),
.vlan_o                              (ext_sink_0_vlan_o),
.svlan_o                             (ext_sink_0_svlan_o),
.ipv4_o                              (ext_sink_0_ipv4_o),
.ipv6_o                              (ext_sink_0_ipv6_o),
.ptp_o                               (ext_sink_0_ptp_o),
.udp_o                               (ext_sink_0_udp_o),
.ptp_message_type_o                  (ext_sink_0_ptp_message_type_o),
.ext_source_pkt_type                 (),
.ptp_two_step_flag_o                 (),
.rx_ingress_timestamp_96b_valid      (1'b0),
.rx_ingress_timestamp_96b_data       (96'h0),
.rx_ingress_timestamp_96b_data_o     (),
.rx_ingress_timestamp_96b_valid_o    (),
.ext_rx_ingress_timestamp_96b_data_o (),
.ext_tx_ingress_timestamp_96b_data   (ext_sink_0_tx_ingress_timestamp_96b_data),
.ptp_tx_ingress_timestamp_96b_data   (o_ext_sink_0_tx_ingress_timestamp_96b_data),

.data_source_ready                   (queue_ext_sink_0_ready_out),
.data_source_sop                     (o_ext_sink_0_sop),
.data_source_eop                     (o_ext_sink_0_eop),
.data_source_valid                   (o_ext_sink_0_valid),
.data_source_data                    (o_ext_sink_0_data),
.data_source_empty                   (o_ext_sink_0_empty),
.data_source_error                   (o_ext_sink_0_error),
.data_source_desc                    (o_ext_sink_0_desc),
.data_source_desc_valid              (o_ext_sink_0_desc_valid),
.data_source_vlan_pcp                (o_ext_sink_0_vlan_pcp),

.ext_source_ready                    ('1)
//.ext_source_sop      (),
//.ext_source_eop      (),
//.ext_source_valid    (),
//.ext_source_data     (),
//.ext_source_empty    (),
//.ext_source_error    (),
//.ext_source_vlan_pcp ()
);

packet_queue_fifo #(
.DEVICE_FAMILY      (DEVICE_FAMILY),
.PTP_EN             (1), //Unused PARAM, replaced by ptp_o from packet_parser
.BITSPERSYMBOL      (BITSPERSYMBOL),
.SYMBOLSPERBEAT     (SYMBOLSPERBEAT),
.ERROR_WIDTH        (ERROR_WIDTH),
.EMPTY_WIDTH        (EMPTY_WIDTH),
.QUEUE_DFIFO_DEPTH  (EXT_SINK_0_DFIFO_DEPTH),
.QUEUE_COUNT        (10),
.DESC_WIDTH         (DESC_WIDTH)
) ext_sink_0_queue_fifo (
.data_sink_clk                          (ext_sink_clk),
.data_source_clk                        (mac_source_clk),
.reset_n                                (reset_n),
.reset_n_src_clk                        (reset_n_src_clk),

.data_sink_sop                          (o_ext_sink_0_sop),
.data_sink_eop                          (o_ext_sink_0_eop),
.data_sink_valid                        (o_ext_sink_0_valid),
.data_sink_ready                        (queue_ext_sink_0_ready_out),
.data_sink_data                         (o_ext_sink_0_data),
.data_sink_desc                         (o_ext_sink_0_desc),
.data_sink_desc_valid                   (o_ext_sink_0_desc_valid),
.data_sink_empty                        (o_ext_sink_0_empty),
.data_sink_error                        (o_ext_sink_0_error),
.data_sink_vlan_pcp                     (o_ext_sink_0_vlan_pcp),
.data_sink_ingress_timestamp_96b_data   (o_ext_sink_0_tx_ingress_timestamp_96b_data),

.data_source_ptp                        (queue_ext_sink_0_ptp_out),//23.3 new port, indicator for ptp, 1 = ptp.
.data_source_sop                        (queue_ext_sink_0_sop_out),
.data_source_eop                        (queue_ext_sink_0_eop_out),
.data_source_valid                      (queue_ext_sink_0_valid_out),
.data_source_ready                      (queue_ext_sink_0_ready_in),
.data_source_data                       (queue_ext_sink_0_data_out),
.data_source_desc                       (queue_ext_sink_0_desc_out),  // carry fingerprint ID only
.data_source_desc_valid                 (queue_ext_sink_0_desc_valid_out),
.data_source_empty                      (queue_ext_sink_0_empty_out),
.data_source_error                      (queue_ext_sink_0_error_out),
.data_source_vlan_pcp                   (queue_ext_sink_0_vlan_pcp_out),
.data_source_ingress_timestamp_96b_data (queue_ext_sink_0_tx_ingress_timestamp_96b_data),
.ptp_o                                  (ext_sink_0_ptp_o), //This signal now repalce the PTP_EN PARAM to determine packet in fifo
.ipv4_o                                 (ext_sink_0_ipv4_o),
.ipv6_o                                 (ext_sink_0_ipv6_o),
.ptp_message_type_o                     (ext_sink_0_ptp_message_type_o),
.vlan_o                                 (ext_sink_0_vlan_o),
.svlan_o                                (ext_sink_0_svlan_o),
.one_step_en                            (queue_ext_sink_0_one_step_en),
.two_step_en                            (queue_ext_sink_0_two_step_en),
.offset_timestamp                       (queue_ext_sink_0_offset_timestamp),
.offset_correction_field                (queue_ext_sink_0_offset_correction_field),
.queue_fifo_dout_ready                  (queue_ext_sink_0_dout_ready),

//Starvation Handling
.en_pq_starvation                       (sync_en_pq_starvation_ext0),
.queue_priority_flag                    (queue_ext_sink_0_priority_flag),
.queue_clr_cnt                          (queue_ext_sink_0_clr_cnt),
.queue_sop_cnt_en                       (queue_ext_sink_0_sop_cnt_en)
);

generate if (NUMBER_EXT_SINK_INT == 2) begin : EXT_SINK_1_BLK_EN
    //ext_sink_1
    packet_parser #(
    .TX_ARBITRATION_SCHEME      (TX_ARBITRATION_SCHEME),
    .DEVICE_FAMILY              (DEVICE_FAMILY),
    .DATA_PATH                  (DATA_PATH),
    .BITSPERSYMBOL              (BITSPERSYMBOL),
    .SYMBOLSPERBEAT             (SYMBOLSPERBEAT),
    .ERROR_WIDTH                (ERROR_WIDTH),
    .MAC_VLAN_EN                (MAC_VLAN_EN),
    .MAC_TCP_EN                 (MAC_TCP_EN),
    .READY_LATENCY              (READY_LATENCY),
    .EMPTY_WIDTH                (EMPTY_WIDTH),
    .DESC_WIDTH                 (DESC_WIDTH)
    ) ext_sink_1_tx_packet_parser_inst (
    //Common clock and Reset
    .data_sink_clk                       (ext_sink_clk),
    .data_source_clk                     (ext_sink_clk),
    .ext_source_clk                      (1'b0),

    .rst_n                               (reset_n),
    .rst_n_sink_clk                      (sync_reset_n),
    .rst_n_src_clk                       (sync_reset_n),

    //Avalon St logic DataIn (Sink) Interface from external HPS
    .ext_sink_sop                        (ext_sink_1_sop),
    .ext_sink_eop                        (ext_sink_1_eop),
    .ext_sink_valid                      (ext_sink_1_valid),
    .ext_sink_data                       (ext_sink_1_data),
    .ext_sink_empty                      (ext_sink_1_empty),
    .ext_sink_error                      (ext_sink_1_error),
    .ext_sink_ready                      (ext_sink_1_ready),
    .ext_sink_desc                       (ext_sink_1_desc),
    .ext_sink_desc_valid                 (ext_sink_1_desc_valid),
    .ptp_priority                        (sync_ptp_priority),
    .misc_priority                       (sync_misc_priority),

    //This signal for RX path, TX will remain conencted but unused
    .mac_frame_srcaddr                   (mac_frame_srcaddr),
    .mac_ethertype                       (mac_ethertype),
    .ipv4_src_addr                       (ipv4_src_addr),
    .udp_src0_port                       (udp_src0_port),
    .ipv6_src_addr0                      (ipv6_src_addr0),
    .ipv6_src_addr1                      (ipv6_src_addr1),
    .ipv6_src_addr2                      (ipv6_src_addr2),
    .ipv6_src_addr3                      (ipv6_src_addr3),
    .vid_addr                            (12'h0),
    .macaddr_vlanid                      (1'b0),

    .ecpri_o                             (ext_sink_1_ecpri_o),
    .vlan_o                              (ext_sink_1_vlan_o),
    .svlan_o                             (ext_sink_1_svlan_o),
    .ipv4_o                              (ext_sink_1_ipv4_o),
    .ipv6_o                              (ext_sink_1_ipv6_o),
    .ptp_o                               (ext_sink_1_ptp_o),
    .udp_o                               (ext_sink_1_udp_o),
    .ptp_message_type_o                  (ext_sink_1_ptp_message_type_o),
    .ext_source_pkt_type                 (),
    .ptp_two_step_flag_o                 (),
    .rx_ingress_timestamp_96b_valid      (1'b0),
    .rx_ingress_timestamp_96b_data       (96'h0),
    .rx_ingress_timestamp_96b_data_o     (),
    .rx_ingress_timestamp_96b_valid_o    (),
    .ext_rx_ingress_timestamp_96b_data_o (),
    .ext_tx_ingress_timestamp_96b_data   (ext_sink_1_tx_ingress_timestamp_96b_data),
    .ptp_tx_ingress_timestamp_96b_data   (o_ext_sink_1_tx_ingress_timestamp_96b_data),

    .data_source_ready                   (queue_ext_sink_1_ready_out),
    .data_source_sop                     (o_ext_sink_1_sop),
    .data_source_eop                     (o_ext_sink_1_eop),
    .data_source_valid                   (o_ext_sink_1_valid),
    .data_source_data                    (o_ext_sink_1_data),
    .data_source_empty                   (o_ext_sink_1_empty),
    .data_source_error                   (o_ext_sink_1_error),
    .data_source_desc                    (o_ext_sink_1_desc),
    .data_source_desc_valid              (o_ext_sink_1_desc_valid),
    .data_source_vlan_pcp                (o_ext_sink_1_vlan_pcp),

    .ext_source_ready                    ('1)
    //.ext_source_sop      (),
    //.ext_source_eop      (),
    //.ext_source_valid    (),
    //.ext_source_data     (),
    //.ext_source_empty    (),
    //.ext_source_error    (),
    //.ext_source_vlan_pcp ()
    );

    packet_queue_fifo #(
    .DEVICE_FAMILY      (DEVICE_FAMILY),
    .PTP_EN             (1), //Unused PARAM, replaced by ptp_o from packet_parser
    .BITSPERSYMBOL      (BITSPERSYMBOL),
    .SYMBOLSPERBEAT     (SYMBOLSPERBEAT),
    .ERROR_WIDTH        (ERROR_WIDTH),
    .EMPTY_WIDTH        (EMPTY_WIDTH),
    .QUEUE_DFIFO_DEPTH  (EXT_SINK_1_DFIFO_DEPTH),
    .QUEUE_COUNT        (10),
    .DESC_WIDTH         (DESC_WIDTH)
    ) ext_sink_1_queue_fifo (
    .data_sink_clk                          (ext_sink_clk),
    .data_source_clk                        (mac_source_clk),
    .reset_n                                (reset_n),
    .reset_n_src_clk                        (reset_n_src_clk),

    .data_sink_sop                          (o_ext_sink_1_sop),
    .data_sink_eop                          (o_ext_sink_1_eop),
    .data_sink_valid                        (o_ext_sink_1_valid),
    .data_sink_ready                        (queue_ext_sink_1_ready_out),
    .data_sink_data                         (o_ext_sink_1_data),
    .data_sink_desc                         (o_ext_sink_1_desc),
    .data_sink_desc_valid                   (o_ext_sink_1_desc_valid),
    .data_sink_empty                        (o_ext_sink_1_empty),
    .data_sink_error                        (o_ext_sink_1_error),
    .data_sink_vlan_pcp                     (o_ext_sink_1_vlan_pcp),
    .data_sink_ingress_timestamp_96b_data   (o_ext_sink_1_tx_ingress_timestamp_96b_data),

    .data_source_ptp                        (queue_ext_sink_1_ptp_out),//23.3 new port, indicator for ptp, 1 = ptp.
    .data_source_sop                        (queue_ext_sink_1_sop_out),
    .data_source_eop                        (queue_ext_sink_1_eop_out),
    .data_source_valid                      (queue_ext_sink_1_valid_out),
    .data_source_ready                      (queue_ext_sink_1_ready_in),
    .data_source_data                       (queue_ext_sink_1_data_out),
    .data_source_desc                       (queue_ext_sink_1_desc_out),  // carry fingerprint ID only
    .data_source_desc_valid                 (queue_ext_sink_1_desc_valid_out),
    .data_source_empty                      (queue_ext_sink_1_empty_out),
    .data_source_error                      (queue_ext_sink_1_error_out),
    .data_source_vlan_pcp                   (queue_ext_sink_1_vlan_pcp_out),
    .data_source_ingress_timestamp_96b_data (queue_ext_sink_1_tx_ingress_timestamp_96b_data),
    .ptp_o                                  (ext_sink_1_ptp_o), //This signal now repalce the PTP_EN PARAM to determine packet in fifo
    .ipv4_o                                 (ext_sink_1_ipv4_o),
    .ipv6_o                                 (ext_sink_1_ipv6_o),
    .ptp_message_type_o                     (ext_sink_1_ptp_message_type_o),
    .vlan_o                                 (ext_sink_1_vlan_o),
    .svlan_o                                (ext_sink_1_svlan_o),
    .one_step_en                            (queue_ext_sink_1_one_step_en),
    .two_step_en                            (queue_ext_sink_1_two_step_en),
    .offset_timestamp                       (queue_ext_sink_1_offset_timestamp),
    .offset_correction_field                (queue_ext_sink_1_offset_correction_field),
    .queue_fifo_dout_ready                  (queue_ext_sink_1_dout_ready),

    //Starvation Handling
    .en_pq_starvation                       (sync_en_pq_starvation_ext1),
    .queue_priority_flag                    (queue_ext_sink_1_priority_flag),
    .queue_clr_cnt                          (queue_ext_sink_1_clr_cnt),
    .queue_sop_cnt_en                       (queue_ext_sink_1_sop_cnt_en)

    );

    end : EXT_SINK_1_BLK_EN
    else begin : EXT_SINK_1_BLK_DIS
        //assign output tie to 0
        //output port from packet_parser
        assign ext_sink_1_ready                           = '0;
        assign ext_sink_1_ecpri_o                         = '0;
        assign ext_sink_1_vlan_o                          = '0;
        assign ext_sink_1_svlan_o                         = '0;
        assign ext_sink_1_ipv4_o                          = '0;
        assign ext_sink_1_ipv6_o                          = '0;
        assign ext_sink_1_ptp_o                           = '0;
        assign ext_sink_1_udp_o                           = '0;
        assign ext_sink_1_ptp_message_type_o              = '0;
        assign o_ext_sink_1_tx_ingress_timestamp_96b_data = '0;
        assign o_ext_sink_1_sop                           = '0;
        assign o_ext_sink_1_eop                           = '0;
        assign o_ext_sink_1_valid                         = '0;
        assign o_ext_sink_1_data                          = '0;
        assign o_ext_sink_1_empty                         = '0;
        assign o_ext_sink_1_error                         = '0;
        assign o_ext_sink_1_desc                          = '0;
        assign o_ext_sink_1_desc_valid                    = '0;
        assign o_ext_sink_1_vlan_pcp                      = '0;

        //output port from packet_queue_fifo
        assign queue_ext_sink_1_ready_out                     = '0;
        assign queue_ext_sink_1_ptp_out                       = '0;
        assign queue_ext_sink_1_sop_out                       = '0;
        assign queue_ext_sink_1_eop_out                       = '0;
        assign queue_ext_sink_1_valid_out                     = '0;
        assign queue_ext_sink_1_data_out                      = '0;
        assign queue_ext_sink_1_desc_out                      = '0;
        assign queue_ext_sink_1_desc_valid_out                = '0;
        assign queue_ext_sink_1_empty_out                     = '0;
        assign queue_ext_sink_1_error_out                     = '0;
        assign queue_ext_sink_1_vlan_pcp_out                  = '0;
        assign queue_ext_sink_1_tx_ingress_timestamp_96b_data = '0;
        assign queue_fifo_dout_ready                          = '0;
        assign queue_ext_sink_1_one_step_en                   = '0;
        assign queue_ext_sink_1_two_step_en                   = '0;
        assign queue_ext_sink_1_offset_timestamp              = '0;
        assign queue_ext_sink_1_offset_correction_field       = '0;
        assign queue_ext_sink_1_dout_ready                    = '0;
        assign queue_ext_sink_1_priority_flag                 = '0;

    end : EXT_SINK_1_BLK_DIS
endgenerate


//TODO DONE signal name changes in packet parser & queue fifo, to revisit here after done packet parser and queue fifo work
//PTP sideband signals control
//assign queue_ptp_timestamp_insert                               = (queue_ptp_one_step_en & queue_ptp_sop_out & queue_ptp_valid_out) ? 1'b1 : 1'b0;
//assign queue_ptp_tx_etstamp_ins_ctrl_residence_time_update      = 1'b0;
////set 1 for eCPRI message 5 packet, 2 for external PTP packet
//assign queue_ptp_timestamp_request_valid                        = (queue_ptp_two_step_en & queue_ptp_sop_out & queue_ptp_valid_out) ? 1'b1 : 1'b0;

assign queue_ext_sink_0_timestamp_insert                               = (queue_ext_sink_0_one_step_en & queue_ext_sink_0_sop_out & queue_ext_sink_0_valid_out) ? 1'b1 : 1'b0;
assign queue_ext_sink_0_tx_etstamp_ins_ctrl_residence_time_update      = 1'b0;
//set 1 for eCPRI message 5 packet, 2 for external ext_sink_0 packet
//assign queue_ext_sink_0_timestamp_request_valid                        = (queue_ext_sink_0_ptp_out)? ((queue_ext_sink_0_two_step_en & queue_ext_sink_0_sop_out & queue_ext_sink_0_valid_out) ? queue_ext_sink_0_desc_valid_out : 1'b0) : ((queue_ext_sink_0_sop_out & queue_ext_sink_0_valid_out) ? queue_ext_sink_0_desc_valid_out : 1'b0);
//assign queue_ext_sink_0_timestamp_request_valid                        = (queue_ext_sink_0_ptp_out)? ((queue_ext_sink_0_two_step_en & queue_ext_sink_0_sop_out & queue_ext_sink_0_valid_out) ? queue_ext_sink_0_desc_valid_out : 1'b0) : ((queue_ext_sink_0_sop_out & queue_ext_sink_0_valid_out) ? queue_ext_sink_0_desc_valid_out : 1'b0);
//TODO Current remove the two step checking for ptp packet.
assign queue_ext_sink_0_timestamp_request_valid                        = queue_ext_sink_0_sop_out & queue_ext_sink_0_valid_out & queue_ext_sink_0_desc_valid_out;

assign queue_ext_sink_1_timestamp_insert                               = (queue_ext_sink_1_one_step_en & queue_ext_sink_1_sop_out & queue_ext_sink_1_valid_out) ? 1'b1 : 1'b0;
assign queue_ext_sink_1_tx_etstamp_ins_ctrl_residence_time_update      = 1'b0;
//set 1 for eCPRI message 5 packet, 2 for external ext_sink_1 packet
//assign queue_ext_sink_1_timestamp_request_valid                        = (queue_ext_sink_1_two_step_en & queue_ext_sink_1_sop_out & queue_ext_sink_1_valid_out) ? queue_ext_sink_1_desc_valid_out : 1'b0;
//assign queue_ext_sink_1_timestamp_request_valid                        = (queue_ext_sink_1_ptp_out)? ((queue_ext_sink_1_two_step_en & queue_ext_sink_1_sop_out & queue_ext_sink_1_valid_out) ? queue_ext_sink_1_desc_valid_out : 1'b0) : ((queue_ext_sink_1_sop_out & queue_ext_sink_1_valid_out) ? queue_ext_sink_1_desc_valid_out : 1'b0);
assign queue_ext_sink_1_timestamp_request_valid                        = queue_ext_sink_1_sop_out & queue_ext_sink_1_valid_out & queue_ext_sink_1_desc_valid_out;

//
//if(TS_FINGERPRINT_UD) begin : TS_FINGERPRINT_UD_EN
  //assign queue_ptp_timestamp_request_fingerprint = (queue_ptp_two_step_en & queue_ptp_sop_out & queue_ptp_valid_out) ? {1'b0,queue_ptp_desc_out} : '0;
  //assign queue_ext_sink_0_timestamp_request_fingerprint = (queue_ext_sink_0_ptp_out)? ((queue_ext_sink_0_two_step_en & queue_ext_sink_0_sop_out & queue_ext_sink_0_valid_out) ? {2'b00,queue_ext_sink_0_desc_out} : '0) : ((queue_ext_sink_0_sop_out & queue_ext_sink_0_valid_out) ? {2'b00,queue_ext_sink_0_desc_out} : '0);
  //Inject encoding bit, 00 = ext_sink_0, 10 = ext_sink_1
  assign queue_ext_sink_0_timestamp_request_fingerprint = (queue_ext_sink_0_sop_out & queue_ext_sink_0_valid_out)? {2'b00,queue_ext_sink_0_desc_out} : '0;
  //assign queue_ext_sink_1_timestamp_request_fingerprint = (queue_ext_sink_1_ptp_out)? ((queue_ext_sink_1_two_step_en & queue_ext_sink_1_sop_out & queue_ext_sink_1_valid_out) ? {2'b00,queue_ext_sink_1_desc_out} : '0) : ((queue_ext_sink_1_sop_out & queue_ext_sink_1_valid_out) ? {2'b00,queue_ext_sink_1_desc_out} : '0);
  assign queue_ext_sink_1_timestamp_request_fingerprint = (queue_ext_sink_1_sop_out & queue_ext_sink_1_valid_out)? {2'b10,queue_ext_sink_1_desc_out} : '0;

//  assign queue_ext_sink_1_timestamp_request_fingerprint = (queue_ext_sink_1_two_step_en & queue_ext_sink_1_sop_out & queue_ext_sink_1_valid_out) ? {2'b10,queue_ext_sink_1_desc_out} : '0;

/*end else begin  : TS_FINGERPRINT_UD_DIS
  assign queue_ext_sink_0_timestamp_request_fingerprint = (queue_ext_sink_0_two_step_en & queue_ext_sink_0_sop_out & queue_ext_sink_0_valid_out) ? 4'd2 : 4'd0;
  assign queue_ext_sink_1_timestamp_request_fingerprint = (queue_ext_sink_1_two_step_en & queue_ext_sink_1_sop_out & queue_ext_sink_1_valid_out) ? 4'd2 : 4'd0;
end*/

// L2COS Priorirty Module
// VLAN PCP = 7 Highest Priority
// VLAN PCP = 0 Lowest Priority
generate
   if (TX_ARBITRATION_SCHEME == "L2COS") begin : ecpri_l2cos

        //packet_queue_l2cos_arb
        ecpri_l2cos_top
        #(

            .DEVICE_FAMILY              (DEVICE_FAMILY             ),
            .BITSPERSYMBOL              (BITSPERSYMBOL             ),
            .SYMBOLSPERBEAT             (SYMBOLSPERBEAT            ),
            .READY_LATENCY              (READY_LATENCY             ),
            .DATA_WIDTH                 (DATA_WIDTH                ),
            .ERROR_WIDTH                (ERROR_WIDTH               ),
            .EMPTY_WIDTH                (EMPTY_WIDTH               ),
            .ARB_QUEUE_0_DEPTH          (ARB_QUEUE_0_DEPTH         ),
            .ARB_QUEUE_1_DEPTH          (ARB_QUEUE_1_DEPTH         ),
            .ARB_QUEUE_2_DEPTH          (ARB_QUEUE_2_DEPTH         ),
            .ARB_QUEUE_3_DEPTH          (ARB_QUEUE_3_DEPTH         ),
            .ARB_QUEUE_4_DEPTH          (ARB_QUEUE_4_DEPTH         ),
            .ARB_QUEUE_5_DEPTH          (ARB_QUEUE_5_DEPTH         ),
            .ARB_QUEUE_6_DEPTH          (ARB_QUEUE_6_DEPTH         ),
            .ARB_QUEUE_7_DEPTH          (ARB_QUEUE_7_DEPTH         )

        ) ecpri_l2cos_inst (

            //Common clock and Reset
            .clk                              (mac_source_clk),                      // mac_source from PQ clktxmac
            .reset_n                          (reset_n_src_clk),                     // reset_n_src_clk
            //Avalon St logic DataIn (Sink) Interface from Ethernet top
            .i_ecpri_sop                      (ecpri_sink_sop     ),
            .i_ecpri_eop                      (ecpri_sink_eop     ),
            .i_ecpri_valid                    (ecpri_sink_valid   ),
            .o_ecpri_ready                    (ecpri_source_ready ),
            .i_ecpri_data                     (ecpri_sink_data    ),
            .i_ecpri_empty                    (ecpri_sink_empty   ),
            .i_ecpri_error                    (ecpri_sink_error   ),
            .i_ecpri_vlan_pcp                 (ecpri_vlan_pcp     ),
            //.i_ecpri_ready                    (ecpri_dout_ready   ),
            .i_ecpri_state_l2cos_idle        (l2cos_ecpri_state_l2cos_idle),

            .i_msg5_pkt                       (msg5_pkt                     ),
            .i_msg5_ts_insert                 (msg5_ptp_ts_insert           ),
            .i_msg5_ts_valid                  (msg5_ptp_ts_valid            ),
            .i_msg5_ts_rt_update              (msg5_ptp_ts_rt_update        ),
            .i_msg5_offset_correction_field   (msg5_offset_correction_field ),
            .i_msg5_offset_timestamp          (msg5_offset_timestamp        ),

            //Avalon St logic DataOut (Source) Interface to Ethernet MAC
            .o_ecpri_sop                      (l2cos_ecpri_sink_sop     ),
            .o_ecpri_eop                      (l2cos_ecpri_sink_eop     ),
            .o_ecpri_valid                    (l2cos_ecpri_sink_valid   ),
            .i_ecpri_ready                    (l2cos_ecpri_source_ready ),
            .o_ecpri_data                     (l2cos_ecpri_sink_data    ),
            .o_ecpri_empty                    (l2cos_ecpri_sink_empty   ),
            .o_ecpri_error                    (l2cos_ecpri_sink_error   ),
            .o_ecpri_vlan_pcp                 (l2cos_ecpri_vlan_pcp     ),
            .o_ecpri_dout_ready               (l2cos_ecpri_dout_ready   ),

            .o_msg5_pkt                       (l2cos_msg5_pkt                     ),
            .o_msg5_ts_insert                 (l2cos_msg5_ts_insert               ),
            .o_msg5_ts_valid                  (l2cos_msg5_ts_valid                ),
            .o_msg5_ts_rt_update              (l2cos_msg5_ts_rt_update            ),
            .o_msg5_offset_correction_field   (l2cos_msg5_offset_correction_field ),
            .o_msg5_offset_timestamp          (l2cos_msg5_offset_timestamp        ),

            .tx_queue_0_fifo_full             (tx_queue_0_fifo_full),
            .tx_queue_1_fifo_full             (tx_queue_1_fifo_full),
            .tx_queue_2_fifo_full             (tx_queue_2_fifo_full),
            .tx_queue_3_fifo_full             (tx_queue_3_fifo_full),
            .tx_queue_4_fifo_full             (tx_queue_4_fifo_full),
            .tx_queue_5_fifo_full             (tx_queue_5_fifo_full),
            .tx_queue_6_fifo_full             (tx_queue_6_fifo_full),
            .tx_queue_7_fifo_full             (tx_queue_7_fifo_full)

        );
   end : ecpri_l2cos
   else begin : ecpri_l2cos_dis
       assign l2cos_ecpri_sink_sop               = ecpri_sink_sop              ;
       assign l2cos_ecpri_sink_eop               = ecpri_sink_eop              ;
       assign l2cos_ecpri_sink_valid             = ecpri_sink_valid            ;
       assign ecpri_source_ready                 = l2cos_ecpri_source_ready    ;
       assign l2cos_ecpri_sink_data              = ecpri_sink_data             ;
       assign l2cos_ecpri_sink_empty             = ecpri_sink_empty            ;
       assign l2cos_ecpri_sink_error             = ecpri_sink_error            ;
       assign l2cos_ecpri_vlan_pcp               = ecpri_vlan_pcp              ;
       assign l2cos_ecpri_dout_ready             = ecpri_dout_ready            ;

       assign l2cos_msg5_pkt                     = msg5_pkt                    ;
       assign l2cos_msg5_ts_insert               = msg5_ptp_ts_insert          ;
       assign l2cos_msg5_ts_valid                = msg5_ptp_ts_valid           ;
       assign l2cos_msg5_ts_rt_update            = msg5_ptp_ts_rt_update       ;
       assign l2cos_msg5_offset_correction_field = msg5_offset_correction_field;
       assign l2cos_msg5_offset_timestamp        = msg5_offset_timestamp       ;

       assign tx_queue_0_fifo_full = 1'b0;
       assign tx_queue_1_fifo_full = 1'b0;
       assign tx_queue_2_fifo_full = 1'b0;
       assign tx_queue_3_fifo_full = 1'b0;
       assign tx_queue_4_fifo_full = 1'b0;
       assign tx_queue_5_fifo_full = 1'b0;
       assign tx_queue_6_fifo_full = 1'b0;
       assign tx_queue_7_fifo_full = 1'b0;

   end : ecpri_l2cos_dis
endgenerate


// FIXED Priorirty Module
//  packet / priority
//  -------/---------
//  PTP    / HIGH
//  eCPRI  / MID
//  MISC   / LOW

generate
   begin : fixed_priority

      packet_queue_fixed_arb
        #(
        .DEVICE_FAMILY              (DEVICE_FAMILY             ),
        .BITSPERSYMBOL              (BITSPERSYMBOL             ),
        .SYMBOLSPERBEAT             (SYMBOLSPERBEAT            ),
        .READY_LATENCY              (READY_LATENCY             ),
        .DATA_WIDTH                 (DATA_WIDTH                ),
        .ERROR_WIDTH                (ERROR_WIDTH               ),
        .EMPTY_WIDTH                (EMPTY_WIDTH               ),
        //.TS_FINGERPRINT_UD          (TS_FINGERPRINT_UD         ),
        .PTP_TS_FP_WIDTH            (PTP_TS_FP_WIDTH           )
        )
        fixed_arb
        (
        //Common clock and Reset
        .clk                               (mac_source_clk),                      // mac_source from PQ clktxmac
        .reset_n                           (reset_n_src_clk),                     // reset_n_src_clk
        //Avalon St logic DataIn (Sink) Interface from Ethernet top
        .ecpri_sop_in                      (l2cos_ecpri_sink_sop               ),
        .ecpri_eop_in                      (l2cos_ecpri_sink_eop               ),
        .ecpri_valid_in                    (l2cos_ecpri_sink_valid             ),
        .ecpri_ready_out                   (l2cos_ecpri_source_ready           ),
        .ecpri_data_in                     (l2cos_ecpri_sink_data              ),
        .ecpri_empty_in                    (l2cos_ecpri_sink_empty             ),
        .ecpri_error_in                    (l2cos_ecpri_sink_error             ),
        .ecpri_vlan_pcp_in                 (l2cos_ecpri_vlan_pcp               ),
        .ecpri_ready_in                    (l2cos_ecpri_dout_ready             ),
        .ecpri_state_l2cos_idle           (l2cos_ecpri_state_l2cos_idle      ),

        .msg5_pkt                          (l2cos_msg5_pkt                     ),
        .msg5_ptp_ts_insert                (l2cos_msg5_ts_insert               ),
        .msg5_ptp_ts_valid                 (l2cos_msg5_ts_valid                ),
        .msg5_ptp_ts_rt_update             (l2cos_msg5_ts_rt_update            ),
        .msg5_offset_correction_field      (l2cos_msg5_offset_correction_field ),
        .msg5_offset_timestamp             (l2cos_msg5_offset_timestamp        ),


        //DataIn (Sink) Interface from ext_sink_0 Packet Queue
        .ext_sink_0_ptp_in                                       (queue_ext_sink_0_ptp_out),
        .ext_sink_0_ready_in                                     (queue_ext_sink_0_dout_ready),         // Queue Ready  Data available
        .ext_sink_0_sop_in                                       (queue_ext_sink_0_sop_out),
        .ext_sink_0_eop_in                                       (queue_ext_sink_0_eop_out),
        .ext_sink_0_valid_in                                     (queue_ext_sink_0_valid_out),
        .ext_sink_0_data_in                                      (queue_ext_sink_0_data_out),
        .ext_sink_0_empty_in                                     (queue_ext_sink_0_empty_out),      /* synthesis preserve_syn_only */
        .ext_sink_0_vlan_pcp_in                                  (queue_ext_sink_0_vlan_pcp_out),
        .ext_sink_0_error_in                                     (queue_ext_sink_0_error_out),
        .ext_sink_0_ready_out                                    (queue_ext_sink_0_ready_in),

        .ext_sink_0_offset_timestamp_in                          (queue_ext_sink_0_offset_timestamp),
        .ext_sink_0_offset_correction_field_in                   (queue_ext_sink_0_offset_correction_field),
        .ext_sink_0_timestamp_insert_in                          (queue_ext_sink_0_timestamp_insert),
        .ext_sink_0_timestamp_request_valid_in                   (queue_ext_sink_0_timestamp_request_valid),
        .ext_sink_0_timestamp_request_fingerprint_in             (queue_ext_sink_0_timestamp_request_fingerprint),
        .ext_sink_0_tx_ingress_timestamp_96b_data_in             (queue_ext_sink_0_tx_ingress_timestamp_96b_data),
        .ext_sink_0_tx_etstamp_ins_ctrl_residence_time_update_in (queue_ext_sink_0_tx_etstamp_ins_ctrl_residence_time_update),

        //DataIn (Sink) Interface from ext_sink_1 Packet Queue
        .ext_sink_1_ptp_in                                       (queue_ext_sink_1_ptp_out),
        .ext_sink_1_ready_in                                     (queue_ext_sink_1_dout_ready),        // Queue Ready  Data available
        .ext_sink_1_sop_in                                       (queue_ext_sink_1_sop_out),
        .ext_sink_1_eop_in                                       (queue_ext_sink_1_eop_out),
        .ext_sink_1_valid_in                                     (queue_ext_sink_1_valid_out),
        .ext_sink_1_data_in                                      (queue_ext_sink_1_data_out),
        .ext_sink_1_empty_in                                     (queue_ext_sink_1_empty_out),
        .ext_sink_1_error_in                                     (queue_ext_sink_1_error_out),
        .ext_sink_1_vlan_pcp_in                                  (queue_ext_sink_1_vlan_pcp_out),
        .ext_sink_1_ready_out                                    (queue_ext_sink_1_ready_in),    /* synthesis preserve_syn_only */

        .ext_sink_1_offset_timestamp_in                          (queue_ext_sink_1_offset_timestamp),
        .ext_sink_1_offset_correction_field_in                   (queue_ext_sink_1_offset_correction_field),
        .ext_sink_1_timestamp_insert_in                          (queue_ext_sink_1_timestamp_insert),
        .ext_sink_1_timestamp_request_valid_in                   (queue_ext_sink_1_timestamp_request_valid),
        .ext_sink_1_timestamp_request_fingerprint_in             (queue_ext_sink_1_timestamp_request_fingerprint),
        .ext_sink_1_tx_ingress_timestamp_96b_data_in             (queue_ext_sink_1_tx_ingress_timestamp_96b_data),
        .ext_sink_1_tx_etstamp_ins_ctrl_residence_time_update_in (queue_ext_sink_1_tx_etstamp_ins_ctrl_residence_time_update),

        //Avalon St logic DataOut (Source) Interface to Ethernet MAC
        .data_source_sop                   (mac_source_sop),
        .data_source_eop                   (mac_source_eop),
        .data_source_valid                 (mac_source_valid),
        .data_source_data                  (mac_source_data),
        .data_source_empty                 (mac_source_empty),
        .data_source_error                 (mac_source_error),
        .data_source_ready                 (mac_source_ready),

        .ptp_offset_timestamp_out                          (ptp_offset_timestamp                         ),
        .ptp_offset_correction_field_out                   (ptp_offset_correction_field                  ),
        .ptp_timestamp_insert_out                          (ptp_timestamp_insert                         ),
        .ptp_timestamp_request_valid_out                   (ptp_timestamp_request_valid                  ),
        .ptp_timestamp_request_fingerprint_out             (ptp_timestamp_request_fingerprint            ),
        .ptp_tx_ingress_timestamp_96b_data_out             (ptp_tx_ingress_timestamp_96b_data            ),
        .ptp_tx_etstamp_ins_ctrl_residence_time_update_out (ptp_tx_etstamp_ins_ctrl_residence_time_update),

        .queue_ext_sink_0_priority_flag_in                 (queue_ext_sink_0_priority_flag),
        .queue_ext_sink_0_clr_cnt_o                        (queue_ext_sink_0_clr_cnt   ),
        .queue_ext_sink_0_sop_cnt_en_o                     (queue_ext_sink_0_sop_cnt_en),

        .queue_ext_sink_1_priority_flag_in                 (queue_ext_sink_1_priority_flag),
        .queue_ext_sink_1_clr_cnt_o                        (queue_ext_sink_1_clr_cnt   ),
        .queue_ext_sink_1_sop_cnt_en_o                     (queue_ext_sink_1_sop_cnt_en)

        );
     //end else begin : fixed_priority_dis
         //assign queue_clr_cnt    = 1'b0;
         //assign queue_sop_cnt_en = 1'b0;
    end : fixed_priority 

endgenerate

endmodule
