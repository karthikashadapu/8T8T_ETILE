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

module packet_parser #(
   parameter TX_ARBITRATION_SCHEME = "FIXED",
   parameter DEVICE_FAMILY   = "Stratix 10",
   parameter MAC_VLAN_EN     = 0,                                    // Enable MAC framing VLAN
   parameter MAC_TCP_EN      = 0,                                    // Enable MAC TCP/UDP framing
   parameter BITSPERSYMBOL   = 8,                                    // Streaming Data symbol width in bits
   parameter SYMBOLSPERBEAT  = 8,                                    // Streaming Number of symbols per symb
   parameter READY_LATENCY   = 3,                                    // Streaming ready latency
   parameter EXT_SOURCE_FIFO_DEPTH  = 8,                                     // External FIFO depth
   parameter DATA_WIDTH      = (BITSPERSYMBOL * SYMBOLSPERBEAT),     // Streaming Data bit width
   parameter DATA_PATH       = "TX",
   parameter ERROR_WIDTH     = 1,                                    // Streaming port error width
   parameter EMPTY_WIDTH     = log2ceil(SYMBOLSPERBEAT),             // Streaming Empty width
   parameter EMPTY_BITWIDTH  = ((EMPTY_WIDTH>0) ? (EMPTY_WIDTH-1):0),// Streaming Empty bit width
   parameter DESC_WIDTH      = 6
)
(
   //Common clock and Reset
   input  logic                     data_sink_clk,
   input  logic                     data_source_clk,
   input  logic                     ext_source_clk,

   input  logic                     rst_n_sink_clk,
   input  logic                     rst_n_src_clk,
   input  logic                     rst_n /* synthesis preserve_syn_only maxfan = 150 */,

   //Avalon St logic DataIn (Sink) Interface from MAC
   input  logic                     ext_sink_sop,
   input  logic                     ext_sink_eop,
   input  logic                     ext_sink_valid,
   input  logic [(DATA_WIDTH)-1:0]  ext_sink_data,
   input  logic [EMPTY_BITWIDTH:0]  ext_sink_empty,
   input  logic [(ERROR_WIDTH)-1:0] ext_sink_error,
   output logic                     ext_sink_ready,
   input  logic [DESC_WIDTH-1:0]    ext_sink_desc,
   input  logic                     ext_sink_desc_valid,
//   input  logic [2:0]               ext_sink_priority,//TODO complete the propagation of muxing ptp and misc priority
   input  logic [2:0]               ptp_priority,
   input  logic [2:0]               misc_priority,

   input  logic [47:0]              mac_frame_srcaddr,
   input  logic [15:0]              mac_ethertype,
   input  logic [31:0]              ipv4_src_addr,
   input  logic [15:0]              udp_src0_port,
   input  logic [31:0]              ipv6_src_addr0,
   input  logic [31:0]              ipv6_src_addr1,
   input  logic [31:0]              ipv6_src_addr2,
   input  logic [31:0]              ipv6_src_addr3,

   input  logic [11:0]              vid_addr,
   input  logic                     macaddr_vlanid,

   output logic                     ecpri_o /* synthesis preserve_syn_only */,
   output logic                     vlan_o /* synthesis preserve_syn_only */,
   output logic                     svlan_o /* synthesis preserve_syn_only */,
   output logic                     ipv4_o /* synthesis preserve_syn_only */,
   output logic                     ipv6_o /* synthesis preserve_syn_only */,
   output logic                     ptp_o /* synthesis preserve_syn_only */,
   output logic                     udp_o /* synthesis preserve_syn_only */,
   output logic [3:0]               ptp_message_type_o /* synthesis preserve_syn_only */,
   output logic                     ptp_two_step_flag_o /* synthesis preserve_syn_only */,

   input  logic                     rx_ingress_timestamp_96b_valid,
   input  logic [95:0]              rx_ingress_timestamp_96b_data,
   output logic [95:0]              rx_ingress_timestamp_96b_data_o /* synthesis preserve_syn_only */,
   output logic                     rx_ingress_timestamp_96b_valid_o /* synthesis preserve_syn_only */,
   output logic [95:0]              ext_rx_ingress_timestamp_96b_data_o,
   input  logic [95:0]              ext_tx_ingress_timestamp_96b_data,
   output logic [95:0]              ptp_tx_ingress_timestamp_96b_data,

   //Avalon St logic DataOut (Source) Interface to user
   input  logic                     data_source_ready,
   output logic                     data_source_sop,
   output logic                     data_source_eop,
   output logic                     data_source_valid,
   output logic [(DATA_WIDTH)-1:0]  data_source_data,
   output logic [EMPTY_BITWIDTH:0]  data_source_empty,
   output logic [(ERROR_WIDTH)-1:0] data_source_error,
   output logic [DESC_WIDTH-1:0]    data_source_desc,
   output logic                     data_source_desc_valid,
   output logic [2:0]               data_source_vlan_pcp,

   //This now only used in RX side, TX will not connected to this anymore
   input  logic                     ext_source_ready,
   output logic                     ext_source_sop,
   output logic                     ext_source_eop,
   output logic                     ext_source_valid,
   output logic [(DATA_WIDTH)-1:0]  ext_source_data,
   output logic [EMPTY_BITWIDTH:0]  ext_source_empty,
   output logic [(ERROR_WIDTH)-1:0] ext_source_error,
   output logic [2:0]               ext_source_vlan_pcp,
   output logic [2:0]               ext_source_pkt_type
);

   //----------------------------------------------------------------------------------------------------------
   // Local parameters
   //----------------------------------------------------------------------------------------------------------
   localparam USE_FIFO_ASYNC                   = (DATA_PATH == "RX") ? 1 : 0;

   localparam LREADY_LATENCY                   = (READY_LATENCY > 0) ? (READY_LATENCY-1) : 0;
   localparam LREADY_LAT_USE                   = (READY_LATENCY > 1) ? (READY_LATENCY-2) : 0;
   localparam BYTEPERBEAT                      = (DATA_WIDTH/8);
   localparam MAC_VLAN_LENGTH                  = MAC_VLAN_EN ? 4 : 0;
   localparam AVST_EMPTY_SHIFT                 = MAC_VLAN_EN ? 2 : 6;
   localparam AVST_EMPTY_EXP                   = (SYMBOLSPERBEAT - AVST_EMPTY_SHIFT);
   localparam AVST_EMPTY_EXP_M1                = AVST_EMPTY_EXP - 1'b1;
   localparam AVST_EMPTY_COR                   = (AVST_EMPTY_EXP + SYMBOLSPERBEAT);

   // 9 for TCP/UDP, 1 + 1 for MAC with VLAN, 1 extra pipeline to improve timing?
   localparam PARSERSTAGE                      = (7 + 1 + 1) + 1;
   localparam PIPELINE_WIDTH                   = DATA_WIDTH+(EMPTY_BITWIDTH+1)+ERROR_WIDTH+1+1;
   localparam NUMPIPELINE                      = 3;   // pipeline to ease timing closure and allow the detected bit
   localparam FIFO_NBOFELEMENTS                = 64;  // at least to be PARSERSTAGE + NUMPIPELINE + READY_LATENCY + 2 + 1, if async need extra 32
   localparam FIFO_ADDRW                       = $clog2(FIFO_NBOFELEMENTS);
   localparam READY_USEDW_DET                  = FIFO_NBOFELEMENTS - (NUMPIPELINE + READY_LATENCY + 6 + 1); // extra one for pipeline?

   localparam FIFO_CTRL_NBOFELEMENTS           = 16;
   localparam FIFO_CTRL_ALMOST_EMPTY           = FIFO_CTRL_NBOFELEMENTS - 1;
   localparam FIFO_CTRL_WIDTH                  = (DATA_PATH == "RX") ? 105 : 108 ;
   localparam FIFO_CTRL_ADDRW                  = $clog2(FIFO_CTRL_NBOFELEMENTS);

   localparam EXT_FIFO_AFULL                   = EXT_SOURCE_FIFO_DEPTH - READY_LATENCY - NUMPIPELINE - 3 - 1 - 1;
   localparam EXT_FIFO_WIDTH                   = DATA_WIDTH+EMPTY_WIDTH+ERROR_WIDTH+1+1+96+3;
   localparam EXT_FIFO_ADDRW                   = $clog2(EXT_SOURCE_FIFO_DEPTH);

   localparam CNT_THRESHOLD                    = PARSERSTAGE;
   localparam CNT_THRESHOLD_SET                = CNT_THRESHOLD - 2;

   //type
   localparam IPV4_IHL                         = 8'h45;       // {VERSION,IHL} Do not suport optional
   localparam IPV4_UDP_PROTOCOL                = 8'h11;       // UDP use 0x11
   localparam PTP_LENGTH_TYPE                  = 16'h88F7;    // PTP Length/Type field
   localparam IPV4_LENGTH_TYPE                 = 16'h0800;    // IPv4 Length/Type field
   localparam IPV6_LENGTH_TYPE                 = 16'h86DD;    // IPv6 Length/Type field
   localparam VLAN_LENGTH_TYPE                 = 16'h8100;    // VLAN Length/Type field
   localparam STACKED_VLAN_LENGTH_TYPE         = 16'h88a8;    // STACKED VLAN Length/Type field
   localparam ECPRI_LENGTH_TYPE                = 16'hAEFE;    // eCPRI Length/Type field
   localparam PROTOCOL_UDP                     = 8'h11;       // UDP Protocol field
   localparam UDP_PORT_PTP_EVENT               = 16'd319;     // UDP Port for PTP event messages
   localparam UDP_PORT_PTP_MISC                = 16'd320;     // UDP Port for PTP non-event messages

   //----------------------------------------------------------------------------------------------------------
   // Local signals
   //----------------------------------------------------------------------------------------------------------
   //logic [ 2:0]                ext_sink_priority_pipeline [NUMPIPELINE];
   logic [ 2:0]                ptp_priority_pipeline [NUMPIPELINE];
   logic [ 2:0]                misc_priority_pipeline [NUMPIPELINE];   

   logic [PIPELINE_WIDTH-1:0]  data_sink_pipeline [NUMPIPELINE];
   logic [DESC_WIDTH-1:0]      data_sink_pipeline_desc [NUMPIPELINE];
   logic                       data_sink_pipeline_desc_valid [NUMPIPELINE];
   logic [PARSERSTAGE-1:0]     data_sink_sop_pipe;
   logic [PARSERSTAGE-1:0]     data_sink_sop_pipe_d1;
   logic [NUMPIPELINE-1:0]     data_snk_val_rdy_pipe;
   logic [NUMPIPELINE-1:0]     data_snk_sop_flag_pipe;
   logic                       data_sink_ts_wr      /* synthesis preserve_syn_only dont_merge */;
   logic                       data_sink_ts_wr_dup  /* synthesis preserve_syn_only dont_merge */;
   logic                       data_sink_ts_wr_nxt  /* synthesis dont_merge */;

   logic                       data_src_ready;
   logic                       data_snk_ready;
   logic                       data_snk_rdy_lc;
   logic                       data_snk_val_rdy     /* synthesis dont_merge */;
   logic                       data_snk_val_rdy_sop /* synthesis dont_merge */;
   logic [LREADY_LATENCY:0]    data_snk_ready_ff;
   logic [LREADY_LATENCY:0]    data_src_ready_ff;
   logic                       data_src_rdy_lc;
   logic [LREADY_LATENCY:0]    ext_src_ready_ff;

   logic [1:0]                 mac_type_ecpri_nxt;
   logic [1:0]                 mac_type_vlan_nxt;
   logic [1:0]                 mac_type_svlan_nxt;
   logic [1:0]                 mac_type_svlan_vlan_nxt;
   logic [1:0]                 mac_type_ipv4_novlan_nxt;
   logic [1:0]                 mac_type_ipv4_vlan_nxt;
   logic [1:0]                 mac_type_ipv4_svlan_nxt;
   logic [1:0]                 mac_type_ipv4_nxt;
   logic [1:0]                 mac_type_ipv6_novlan_nxt;
   logic [1:0]                 mac_type_ipv6_vlan_nxt;
   logic [1:0]                 mac_type_ipv6_svlan_nxt;
   logic [1:0]                 mac_type_ipv6_nxt;
   logic [1:0]                 mac_type_ptp_nxt;
   logic [1:0]                 mac_type_da_msb_nxt;
   logic [1:0]                 mac_type_da_lsb_nxt;
   logic [1:0]                 mac_type_ip4v_ihl_nxt;
   logic [1:0]                 mac_type_udp_da_nxt;
   logic [1:0]                 mac_type_proto_nxt;

   logic [5:0]                 mac_destaddr_match_d1;
   logic                       mac_destaddr_match;
   logic                       ipv4_ecpri_match;
   logic                       vlan_id_match;
   logic [1:0]                 mac_type_ecpri_d1;
   logic [1:0]                 mac_type_vlan_d1;
   logic [1:0]                 mac_type_svlan_d1;
   logic [1:0]                 mac_type_svlan_vlan_d1;
   logic [1:0]                 mac_type_ipv4_novlan_d1;
   logic [1:0]                 mac_type_ipv4_svlan_d1;
   logic [1:0]                 mac_type_ipv4_vlan_d1;
   logic [1:0]                 mac_type_ipv6_novlan_d1;
   logic [1:0]                 mac_type_ipv6_svlan_d1;
   logic [1:0]                 mac_type_ipv6_vlan_d1;
   logic [1:0]                 mac_type_ptp_d1;
   logic [1:0]                 mac_type_da_msb_d1;
   logic [1:0]                 mac_type_da_lsb_d1;
   logic [1:0]                 mac_type_ip4v_ihl_d1;
   logic [1:0]                 mac_type_udp_da_d1;
   logic [1:0]                 mac_type_proto_d1;

   logic                       mac_type_ipv4_novlan;
   logic                       mac_type_ipv4_svlan;
   logic                       mac_type_ipv4_vlan;
   logic                       mac_type_ipv6_novlan;
   logic                       mac_type_ipv6_svlan;
   logic                       mac_type_ipv6_vlan;

   logic                       mac_type_ecpri;
   logic                       mac_type_ipv4;
   logic                       mac_type_ipv6;
   logic                       mac_type_ptp;

   logic                       mac_type_novlan_ipv4;
   logic                       mac_type_novlan_ipv4_nodf;
   logic                       mac_type_vlan_ipv4;
   logic                       mac_type_svlan_ipv4;
   logic                       mac_type_svlan_ipv4_nodf;

   logic                       mac_type_novlan_ipv6;
   logic                       mac_type_vlan_ipv6;
   logic                       mac_type_svlan_ipv6;

   logic [3:0]                 mac_ptp_mestype_nxt;
   logic [3:0]                 mac_ptp_mestype;
   logic [3:0]                 ptp_message_type_nxt;

   logic                       mac_ptp_two_step_flag_nxt;
   logic                       mac_ptp_two_step_flag;
   logic                       ptp_two_step_flag_nxt;

   logic                       ip_ver_4_df_nxt;
   logic                       ip_ver_4_df;

   logic                       ip_ver_4_nxt;
   logic                       ip_ver_6_nxt;
   logic [3:0]                 ip_ver4_opl_nxt;     // option length = internet hearder length - 5
   logic                       ip_ver4_opl_eq5_nxt; // option length == 5

   logic                       ip_ver_4;
   logic                       ip_ver_6;
   logic [3:0]                 ip_ver4_opl;     // option length = internet hearder length - 5
   logic                       ip_ver4_opl_eq5; // option length == 5

//TODO: IPv4, IPv6, UDP source address matching for eCPRI packet
   // logic [3:0]              ip_v4_addr_match_d1;
   // logic [15:0]             ip_v6_addr_match_d1;

   // logic [1:0]              ptp_port_match_d1;
   // logic [1:0]              ptp_port_match;

   // logic [1:0]              ecpri_port_match_d1;
   // logic [1:0]              ecpri_port_match;

   logic                       ecpri_nxt;
   logic                       ptp_nxt;
   logic                       option_len_nxt;

   logic                       vlan_o_r;
   logic                       svlan_o_r;
   logic                       ecpri_o_r;
   logic                       ext_ecpri_o_r;
   logic                       ptp_o_r;
   logic                       ipv4_o_r;
   logic                       ipv6_o_r;
   logic                       udp_o_r;
   logic                       option_len_o_r;
   logic [3:0]                 ptp_message_type_o_r;
   logic                       ptp_two_step_flag_o_r;

   //PCP
   logic [2:0]                 vlan_pcp;
   logic [2:0]                 vlan_pcp_nxt;

   logic                       ecpri_o_nxt;
   logic                       ext_ecpri_o_nxt;
   logic                       vlan_o_nxt;
   logic                       svlan_o_nxt;
   logic                       ipv4_o_nxt;
   logic                       ipv6_o_nxt;
   logic                       ptp_o_nxt;
   logic                       udp_o_nxt;
   logic [3:0]                 ptp_message_type_o_nxt;
   logic                       ptp_two_step_flag_o_nxt;
   logic [95:0]                rx_ingress_timestamp_96b_data_o_nxt;
   logic [95:0]                ext_tx_ingress_timestamp_96b_data_nxt;

   logic                       data_src_sop;
   logic                       data_src_eop;
   logic                       data_src_valid;
   logic [(DATA_WIDTH)-1:0]    data_src_data;
   logic [EMPTY_BITWIDTH:0]    data_src_empty;
   logic [(ERROR_WIDTH)-1:0]   data_src_error;

   logic                       ext_fifo_empty;
   logic                       ext_fifo_wrreq;
   logic                       ext_fifo_rdreq;
   logic [PIPELINE_WIDTH-1:0]  ext_fifo_dout;
   logic [DESC_WIDTH-1:0]      ext_fifo_dout_desc;
   logic                       ext_fifo_dout_desc_valid;
   logic [FIFO_ADDRW-1:0]      ext_fifo_usedw;
   logic                       ext_fifo_almost_full;

   logic                       ext_ctrl_fifo_empty;
   logic                       ext_ctrl_fifo_wrreq;
   logic                       ext_ctrl_fifo_rdreq;
   logic [FIFO_CTRL_WIDTH-1:0] ext_ctrl_fifo_din;
   logic [FIFO_CTRL_WIDTH-1:0] ext_ctrl_fifo_dout;
   logic [FIFO_CTRL_ADDRW-1:0] ext_ctrl_fifo_usedw;
   logic                       ext_ctrl_fifo_almost_full;
   logic                       ext_src_ready; // for external DC FIFO at RX path

   logic [3:0]                 ext_fifo_data_cnt;
   logic                       ext_fifo_cnt_wrreq;

   logic [95:0]                rx_ingress_timestamp_96b_data_r /* synthesis preserve_syn_only */;
   logic [95:0]                rx_ingress_timestamp_96b_data_r2 /* synthesis preserve_syn_only */;

   logic [95:0]                ext_tx_ingress_timestamp_96b_data_r /* synthesis preserve_syn_only */;
   logic [95:0]                ext_tx_ingress_timestamp_96b_data_r2 /* synthesis preserve_syn_only */;

   logic                       internal_rst_n_sink_clk;
   logic [2:0]                 internal_rst_n_sink_clk_r;
   logic                       internal_rst_n_src_clk;

   logic [2:0]                 ext_source_pkt_type_comb;
   logic [2:0]                 ext_source_pkt_type_r;

   //----------------------------------------------------------------------------------------------------------
   // Assignment
   //----------------------------------------------------------------------------------------------------------
   assign data_src_rdy_lc      = data_src_ready_ff[LREADY_LAT_USE];
   assign data_snk_rdy_lc      = data_snk_ready_ff[LREADY_LATENCY];

   // redirect to sink path
   assign ext_sink_ready       = data_snk_ready;

   // qualify valid with ready
   assign data_snk_val_rdy     = data_snk_rdy_lc & ext_sink_valid;
   // qualify eop with valid and ready
   assign data_snk_val_rdy_sop = ext_sink_sop & ext_sink_valid & data_snk_rdy_lc;

   // assign back the data src
   assign {data_src_sop, data_src_eop, data_src_empty, data_src_error, data_src_data}                                                      = ext_fifo_dout;
   assign data_src_valid                                                                                                                   = !ext_ctrl_fifo_empty & !ext_fifo_empty & data_src_rdy_lc;

   assign ext_fifo_rdreq                                                                                                                   = !ext_ctrl_fifo_empty & !ext_fifo_empty & data_src_rdy_lc;
   assign ext_fifo_wrreq                                                                                                                   = data_snk_val_rdy_pipe[NUMPIPELINE-1] & data_snk_sop_flag_pipe[NUMPIPELINE-1];
   assign ext_ctrl_fifo_wrreq                                                                                                              = ext_fifo_cnt_wrreq;
   assign ext_ctrl_fifo_rdreq                                                                                                              = ext_fifo_dout[PIPELINE_WIDTH-2] & !ext_fifo_empty & !ext_ctrl_fifo_empty & data_src_rdy_lc;
   //----------------------------------------------------------------------------------------------------------
   // Code start here
   //----------------------------------------------------------------------------------------------------------a
   always_ff @(posedge data_sink_clk) begin
      internal_rst_n_sink_clk_r[0] <= rst_n_sink_clk;
      internal_rst_n_sink_clk_r[1] <= internal_rst_n_sink_clk_r[0];
      internal_rst_n_sink_clk_r[2] <= internal_rst_n_sink_clk_r[1];
   end
   // Additional 3 cycles needed to clear X on reset paths
   assign internal_rst_n_sink_clk = internal_rst_n_sink_clk_r[2];

   always_ff @(posedge data_source_clk) begin
      internal_rst_n_src_clk <= rst_n_src_clk;
   end

   generate
   if (DATA_PATH == "RX") begin: rx_timestamp_pipeline
      always_ff @(posedge data_sink_clk) begin
         if (ext_sink_sop & ext_sink_valid) begin
            rx_ingress_timestamp_96b_data_r <= rx_ingress_timestamp_96b_data;
         end
         if (data_sink_ts_wr) begin
            rx_ingress_timestamp_96b_data_r2 <= rx_ingress_timestamp_96b_data_r;
         end
      end

      assign ext_tx_ingress_timestamp_96b_data_r  = 96'b0;
      assign ext_tx_ingress_timestamp_96b_data_r2 = 96'b0;
   end else begin: tx_timestamp_pipeline
      always_ff @(posedge data_sink_clk) begin
         if (ext_sink_sop & ext_sink_valid) begin
            ext_tx_ingress_timestamp_96b_data_r <= ext_tx_ingress_timestamp_96b_data;
         end
         if (data_sink_ts_wr) begin
            ext_tx_ingress_timestamp_96b_data_r2 <= ext_tx_ingress_timestamp_96b_data_r;
         end
      end

      assign rx_ingress_timestamp_96b_data_r  = 96'b0;
      assign rx_ingress_timestamp_96b_data_r2 = 96'b0;
   end
   endgenerate

   // pipeline the data sink
   always @(posedge data_sink_clk) begin
      if (~internal_rst_n_sink_clk) begin
         data_snk_val_rdy_pipe         <= {NUMPIPELINE{1'b0}};
         data_snk_sop_flag_pipe        <= {NUMPIPELINE{1'b0}};
         for (int i = 0; i < NUMPIPELINE; i++) begin
            //ext_sink_priority_pipeline[i][2:0]    <= 3'b0;
            ptp_priority_pipeline[0][2:0]  <= 3'b0;
            misc_priority_pipeline[0][2:0] <= 3'b0;
            data_sink_pipeline[i][(PIPELINE_WIDTH-1)-:2] <= 2'b0; //{PIPELINE_WIDTH{1'b0}};
         end
      end else begin
         data_snk_val_rdy_pipe[0]      <= data_snk_val_rdy;
            
         if (data_snk_val_rdy_sop) begin
             data_snk_sop_flag_pipe[0] <= 1'b1;
             //ext_sink_priority_pipeline[0][2:0] <= ext_sink_priority;
             ptp_priority_pipeline[0][2:0]  <= ptp_priority;
             misc_priority_pipeline[0][2:0] <= misc_priority;
         end else if (data_sink_pipeline[0][PIPELINE_WIDTH-2]) begin
             data_snk_sop_flag_pipe[0] <= 1'b0;
         end

         if ( data_snk_val_rdy ) begin
            data_sink_pipeline[0][(PIPELINE_WIDTH-1)-:2] <= {ext_sink_sop, ext_sink_eop};
         end

         for (int i = 1; i < NUMPIPELINE; i++) begin
            data_snk_val_rdy_pipe[i]  <= data_snk_val_rdy_pipe[i-1];
            data_snk_sop_flag_pipe[i] <= data_snk_sop_flag_pipe[i-1];
         end

         for (int i = 1; i < NUMPIPELINE; i++) begin
            if ( data_snk_val_rdy_pipe[i-1] ) begin
               //ext_sink_priority_pipeline[i][2:0] <= ext_sink_priority_pipeline[i-1][2:0];
               ptp_priority_pipeline[i][2:0]  <= ptp_priority_pipeline[i-1][2:0];
               misc_priority_pipeline[i][2:0] <= misc_priority_pipeline[i-1][2:0];
               data_sink_pipeline[i][(PIPELINE_WIDTH-1)-:2] <= data_sink_pipeline[i-1][(PIPELINE_WIDTH-1)-:2];
            end
         end
      end
   end

   always @(posedge data_sink_clk) begin
       if ( data_snk_val_rdy ) begin
          data_sink_pipeline[0][PIPELINE_WIDTH-1-2:0] <= {ext_sink_empty, ext_sink_error, ext_sink_data};
          data_sink_pipeline_desc[0][DESC_WIDTH-1:0]  <= ext_sink_desc;
          data_sink_pipeline_desc_valid[0]            <= ext_sink_desc_valid;
       end

       for (int i = 1; i < NUMPIPELINE; i++) begin
          if ( data_snk_val_rdy_pipe[i-1] ) begin
             data_sink_pipeline[i][PIPELINE_WIDTH-1-2:0] <= data_sink_pipeline[i-1][PIPELINE_WIDTH-1-2:0] ;
             data_sink_pipeline_desc[i][DESC_WIDTH-1:0]  <= data_sink_pipeline_desc[i-1][DESC_WIDTH-1:0]  ;
             data_sink_pipeline_desc_valid[i]            <= data_sink_pipeline_desc_valid[i-1]  ;             
          end
       end
   end
   //----------------------------------------------------------------------------------------------------------
   // Data FIFO for temporary storage
   //----------------------------------------------------------------------------------------------------------
   alt_ecpri_fifo #(
       .ALMOST_FULL_VAL ( READY_USEDW_DET                              ),
       .DEVICE_FAMILY   ( DEVICE_FAMILY                                ),
       .DEPTH           ( FIFO_NBOFELEMENTS                            ),
       .WIDTH           ( PIPELINE_WIDTH + DESC_WIDTH + 1              ),//+1 for desc_valid
       .ADDR_WIDTH      ( FIFO_ADDRW                                   ),
       .DUAL_CLOCK      ( 1                                            ),
       .SKID_BUFFER     ( 1                                            ),
       .QUAL_PKT_SIG    ( 1                                            )
   ) ext_scfifo (
       .aclr            ( ~rst_n                                       ),
       .sclr            ( ~internal_rst_n_src_clk                      ),
       .wrclk           ( data_sink_clk                                ),
       .data            ({data_sink_pipeline[NUMPIPELINE-1]             ,
                          data_sink_pipeline_desc[NUMPIPELINE-1]        ,
                          data_sink_pipeline_desc_valid[NUMPIPELINE-1]}),
       .wrreq           ( ext_fifo_wrreq                               ),
       .wrusedw         ( ext_fifo_usedw                               ),
       .rdclk           ( data_source_clk                              ),
       .q               ({ext_fifo_dout                                 , 
                          ext_fifo_dout_desc                            ,           
                          ext_fifo_dout_desc_valid                     }),
       .rdreq           ( ext_fifo_rdreq                               ),
       .rdempty         ( ext_fifo_empty                               ),
       // unused
       .rdusedw         (                                              ),
       .wrfull          (                                              ),

       .clock           (                                              ),
       .empty           (                                              ),
       .usedw           (                                              ),
       .almost_full     (                                              )
   );

   always_ff @(posedge data_sink_clk) begin
      if (~internal_rst_n_sink_clk) begin
         ext_fifo_almost_full <= 1'b0;
      end else begin
         ext_fifo_almost_full <= (ext_fifo_usedw >= READY_USEDW_DET);
      end
   end
   //----------------------------------------------------------------------------------------------------------
   // Ctrl FIFO for temporary storage
   //----------------------------------------------------------------------------------------------------------
   generate
   if (DATA_PATH == "RX") begin: enable_ext_ctrl_din_rx
      assign ext_ctrl_fifo_din                                                                                                                                                   = {rx_ingress_timestamp_96b_data_r2,ptp_two_step_flag_o_r, udp_o_r, ecpri_o_r, ext_ecpri_o_r, ptp_o_r, ipv6_o_r, ipv4_o_r, svlan_o_r, vlan_o_r};
      assign {rx_ingress_timestamp_96b_data_o_nxt, ptp_two_step_flag_o_nxt, udp_o_nxt, ecpri_o_nxt, ext_ecpri_o_nxt, ptp_o_nxt, ipv6_o_nxt, ipv4_o_nxt, svlan_o_nxt, vlan_o_nxt} = ext_ctrl_fifo_dout;
      assign ext_tx_ingress_timestamp_96b_data_nxt                                                                                                                               = 96'h0;
      assign ptp_message_type_o_nxt                                                                                                                                              = 4'h0;
   end else begin: enable_ext_ctrl_din_tx
      assign ext_ctrl_fifo_din                                                                                                                       = {ext_tx_ingress_timestamp_96b_data_r2, ptp_message_type_o_r, ptp_o_r, ipv6_o_r, ipv4_o_r, svlan_o_r, vlan_o_r, vlan_pcp};
      assign {ext_tx_ingress_timestamp_96b_data_nxt, ptp_message_type_o_nxt, ptp_o_nxt, ipv6_o_nxt, ipv4_o_nxt, svlan_o_nxt, vlan_o_nxt, vlan_pcp_nxt}                                      = ext_ctrl_fifo_dout;
      assign rx_ingress_timestamp_96b_data_o_nxt                                                                                                                                 = 96'h0;
      assign udp_o_nxt                                                                                                                                                           = 1'b0;
      assign ecpri_o_nxt                                                                                                                                                         = 1'b0;
      assign ext_ecpri_o_nxt                                                                                                                                                     = 1'b0;
      assign ptp_two_step_flag_o_nxt                                                                                                                                             = 1'b0;
   end
   endgenerate

   alt_ecpri_fifo #(
       .ALMOST_FULL_VAL ( FIFO_CTRL_NBOFELEMENTS-2 ),
       .DEVICE_FAMILY   ( DEVICE_FAMILY            ),
       .DEPTH           ( FIFO_CTRL_NBOFELEMENTS   ),
       .WIDTH           ( FIFO_CTRL_WIDTH          ),
       .ADDR_WIDTH      ( FIFO_CTRL_ADDRW          ),
       .DUAL_CLOCK      ( 1                        ),
       .SKID_BUFFER     ( 1                        )
   ) ext_scfifo_ctrl    (
       .aclr            ( ~rst_n                   ),
       .sclr            ( ~internal_rst_n_src_clk  ),
       .wrclk           ( data_sink_clk            ),
       .data            ( ext_ctrl_fifo_din        ),
       .wrreq           ( ext_ctrl_fifo_wrreq      ),
       .wrusedw         ( ext_ctrl_fifo_usedw      ),
       .rdclk           ( data_source_clk          ),
       .q               ( ext_ctrl_fifo_dout       ),
       .rdreq           ( ext_ctrl_fifo_rdreq      ),
       .rdempty         ( ext_ctrl_fifo_empty      ),
       // unused
       .rdusedw         (                          ),
       .wrfull          (                          ),

       .clock           (                          ),
       .empty           (                          ),
       .usedw           (                          ),
       .almost_full     (                          )
   );

   always_ff @(posedge data_sink_clk) begin
      if (~internal_rst_n_sink_clk) begin
         ext_ctrl_fifo_almost_full <= 1'b0;
      end else begin
         ext_ctrl_fifo_almost_full <= (ext_ctrl_fifo_usedw >= (FIFO_CTRL_NBOFELEMENTS-2));
      end
   end

   // calculate the sink ready
   always_ff @(posedge data_sink_clk) begin
      if (~internal_rst_n_sink_clk) begin
         data_snk_ready <= 1'b0;
      end else begin
         data_snk_ready <= ~(ext_fifo_almost_full | ext_ctrl_fifo_almost_full);
      end
   end

   // beat counter
   always_ff @(posedge data_sink_clk) begin
      if (~internal_rst_n_sink_clk) begin
         ext_fifo_data_cnt     <= {4{1'b0}};
      end else begin
         if (data_sink_pipeline[NUMPIPELINE-2][PIPELINE_WIDTH-1]) begin
            ext_fifo_data_cnt  <= 4'b1;
         end else if (data_sink_pipeline[NUMPIPELINE-2][PIPELINE_WIDTH-2]) begin
            ext_fifo_data_cnt  <= 4'b0;
         end else if (data_snk_val_rdy_pipe[NUMPIPELINE-2] & data_snk_sop_flag_pipe[NUMPIPELINE-2] & (ext_fifo_data_cnt < CNT_THRESHOLD)) begin
            ext_fifo_data_cnt  <= ext_fifo_data_cnt + 1'b1;
         end
      end
   end

   // generate the ctrl wrreq
   always_ff @(posedge data_sink_clk) begin
      if (~internal_rst_n_sink_clk) begin
         ext_fifo_cnt_wrreq    <= 1'b0;
      end else begin
         ext_fifo_cnt_wrreq    <= 1'b0;
         if (data_snk_val_rdy_pipe[NUMPIPELINE-2] & data_snk_sop_flag_pipe[NUMPIPELINE-2] & (ext_fifo_data_cnt < CNT_THRESHOLD) & (~ext_fifo_cnt_wrreq)) begin
            ext_fifo_cnt_wrreq <= (data_sink_pipeline[NUMPIPELINE-2][PIPELINE_WIDTH-2] & (ext_fifo_data_cnt < CNT_THRESHOLD_SET)) || ((ext_fifo_data_cnt == CNT_THRESHOLD_SET));
         end
      end
   end

   // pipeline sop that to be used for classifying the packet type, the actual SOP output will be coming from data_sink_pipeline
   always_ff @(posedge data_sink_clk) begin
      if (~internal_rst_n_sink_clk) begin
         data_sink_sop_pipe    <= {PARSERSTAGE{1'b0}};
         data_sink_sop_pipe_d1 <= {PARSERSTAGE{1'b0}};
      end else begin
         if ( data_snk_val_rdy ) begin
            data_sink_sop_pipe <= {data_sink_sop_pipe[PARSERSTAGE-2:0], ext_sink_sop};
         end
         data_sink_sop_pipe_d1 <= data_sink_sop_pipe;
      end
   end

   // duplicated another set of wr may relax the timing
   assign data_sink_ts_wr_nxt = data_sink_pipeline[0][PIPELINE_WIDTH-1] & data_snk_val_rdy_pipe[0] & ~data_sink_ts_wr_dup;
   always_ff @(posedge data_sink_clk) begin
      if (~internal_rst_n_sink_clk) begin
         data_sink_ts_wr     <= 1'b0;
         data_sink_ts_wr_dup <= 1'b0;
      end else begin
         data_sink_ts_wr     <= data_sink_ts_wr_nxt;
         data_sink_ts_wr_dup <= data_sink_ts_wr_nxt;
      end
   end

   // pipeline data src/sink ready
   generate
      if (READY_LATENCY > 0) begin: gen_data_src_snk_ready_lat
        always_ff @(posedge data_sink_clk) begin
            if (internal_rst_n_sink_clk == 1'b0) begin
               data_snk_ready_ff <= {READY_LATENCY{1'b0}};
            end else begin
               data_snk_ready_ff <= {data_snk_ready_ff[READY_LATENCY-2:0], data_snk_ready};
            end
        end

        always_ff @(posedge data_source_clk) begin
           if (internal_rst_n_src_clk == 1'b0) begin
              data_src_ready_ff <= {READY_LATENCY{1'b0}};
           end else begin
              data_src_ready_ff <= {data_src_ready_ff[READY_LATENCY-2:0], data_src_ready};
           end
        end
     end else begin: gen_data_src_snk_ready_lat_0
        assign data_src_ready_ff = data_src_ready;
        assign data_snk_ready_ff = data_snk_ready;
     end
   endgenerate

   // check the address matching
   always_ff @(posedge data_sink_clk) begin
      if (internal_rst_n_sink_clk == 1'b0) begin
         mac_destaddr_match_d1          <= 3'b0;
         mac_destaddr_match             <= 1'b0;
      end else begin
         if (data_snk_val_rdy_sop) begin
            for (int i = 0; i < 6; i++) begin
               mac_destaddr_match_d1[i] <= (ext_sink_data[(16+(i*8)) +: 8] == mac_frame_srcaddr[(i*8) +: 8]);
            end
         end
         mac_destaddr_match             <= &mac_destaddr_match_d1;
      end
   end


   always_ff @(posedge data_sink_clk) begin
      if (internal_rst_n_sink_clk == 1'b0) begin
         vlan_id_match <= 1'b0;
      end else if (data_snk_val_rdy_sop) begin
         vlan_id_match <= 1'b0;
      end else if (data_sink_sop_pipe_d1[2] & (&mac_type_svlan_vlan_d1)) begin
         vlan_id_match <= (data_sink_pipeline[1][32 +: 12] == vid_addr);
      end else if (data_sink_sop_pipe_d1[1] & (&mac_type_vlan_d1)) begin
         vlan_id_match <= (data_sink_pipeline[1][ 0 +: 12] == vid_addr);
      end
   end

   generate if (TX_ARBITRATION_SCHEME == "L2COS") begin : L2COS_PRIORITY_PCP_CHECK
      // PCP check
      always_ff @(posedge data_sink_clk) begin
         if (internal_rst_n_sink_clk == 1'b0) begin
            vlan_pcp <= 3'h0;
   //      end else if (data_snk_val_rdy_sop) begin
   //         vlan_pcp <= 3'h0;
         end else if (data_sink_sop_pipe_d1[2] & (&mac_type_svlan_vlan_d1)) begin
            vlan_pcp <= data_sink_pipeline[1][45 +: 3];
         end else if (data_sink_sop_pipe_d1[1] & (&mac_type_vlan_d1)) begin
            vlan_pcp <= data_sink_pipeline[1][ 13 +: 3];
         end else if (data_sink_sop_pipe_d1[1] & (!(&mac_type_vlan_d1)) & (!(&mac_type_svlan_d1)) ) begin
             //change the default to csr value input 
            vlan_pcp <= (&mac_type_ptp_d1) ? ptp_priority_pipeline[1][2:0] : misc_priority_pipeline[1][2:0]; 
         end
      end
   end : L2COS_PRIORITY_PCP_CHECK
   else begin : FIXED_PRIORITY_PCP_CHECK
      always_ff @(posedge data_sink_clk) begin
         if (internal_rst_n_sink_clk == 1'b0) begin
            vlan_pcp <= 3'h0;
         end else begin
            vlan_pcp <= (&mac_type_ptp_d1) ? ptp_priority_pipeline[1][2:0] : misc_priority_pipeline[1][2:0]; 
         end
      end
   end : FIXED_PRIORITY_PCP_CHECK
   endgenerate

   always_comb begin
      mac_type_ecpri_nxt       = mac_type_ecpri_d1;
      mac_type_vlan_nxt        = mac_type_vlan_d1;
      mac_type_svlan_nxt       = mac_type_svlan_d1;
      mac_type_svlan_vlan_nxt  = mac_type_svlan_vlan_d1;
      mac_type_ipv4_novlan_nxt = mac_type_ipv4_novlan_d1;
      mac_type_ipv4_vlan_nxt   = mac_type_ipv4_vlan_d1;
      mac_type_ipv4_svlan_nxt  = mac_type_ipv4_svlan_d1;
      mac_type_ipv6_novlan_nxt = mac_type_ipv6_novlan_d1;
      mac_type_ipv6_vlan_nxt   = mac_type_ipv6_vlan_d1;
      mac_type_ipv6_svlan_nxt  = mac_type_ipv6_svlan_d1;
      mac_type_ptp_nxt         = mac_type_ptp_d1;
      mac_type_da_msb_nxt      = mac_type_da_msb_d1;
      mac_type_da_lsb_nxt      = mac_type_da_lsb_d1;
      mac_type_ip4v_ihl_nxt    = mac_type_ip4v_ihl_d1;
      mac_type_udp_da_nxt      = mac_type_udp_da_d1;
      mac_type_proto_nxt       = mac_type_proto_d1;

      for (int i = 0; i < 2; i++) begin
         if (data_sink_sop_pipe[2] & (&mac_type_svlan_d1)) begin
            mac_type_ecpri_nxt       [i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == ECPRI_LENGTH_TYPE[(i*8) +: 8]);
            mac_type_svlan_vlan_nxt  [i] = (data_sink_pipeline[0][(48+(i*8)) +: 8] == VLAN_LENGTH_TYPE [(i*8) +: 8]);
            mac_type_ipv4_svlan_nxt  [i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == IPV4_LENGTH_TYPE [(i*8) +: 8]);
            mac_type_ipv4_vlan_nxt   [i] = 1'b0;
            mac_type_ipv4_novlan_nxt [i] = 1'b0;
            mac_type_ipv6_svlan_nxt  [i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == IPV6_LENGTH_TYPE [(i*8) +: 8]);
            mac_type_ipv6_vlan_nxt   [i] = 1'b0;
            mac_type_ipv6_novlan_nxt [i] = 1'b0;
            mac_type_ptp_nxt         [i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == PTP_LENGTH_TYPE  [(i*8) +: 8]);
         end else if (data_sink_sop_pipe[2] & (&mac_type_vlan_d1)) begin
            mac_type_ecpri_nxt       [i] = (data_sink_pipeline[0][(48+(i*8)) +: 8] == ECPRI_LENGTH_TYPE[(i*8) +: 8]);
            mac_type_svlan_vlan_nxt  [i] = 1'b0;
            mac_type_ipv4_svlan_nxt  [i] = 1'b0;
            mac_type_ipv4_vlan_nxt   [i] = (data_sink_pipeline[0][(48+(i*8)) +: 8] == IPV4_LENGTH_TYPE [(i*8) +: 8]);
            mac_type_ipv4_novlan_nxt [i] = 1'b0;
            mac_type_ipv6_svlan_nxt  [i] = 1'b0;
            mac_type_ipv6_vlan_nxt   [i] = (data_sink_pipeline[0][(48+(i*8)) +: 8] == IPV6_LENGTH_TYPE [(i*8) +: 8]);
            mac_type_ipv6_novlan_nxt [i] = 1'b0;
            mac_type_ptp_nxt         [i] = (data_sink_pipeline[0][(48+(i*8)) +: 8] == PTP_LENGTH_TYPE  [(i*8) +: 8]);
         end else if (data_sink_sop_pipe[1]) begin
            mac_type_ecpri_nxt       [i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == ECPRI_LENGTH_TYPE       [(i*8) +: 8]);
            mac_type_vlan_nxt        [i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == VLAN_LENGTH_TYPE        [(i*8) +: 8]);
            mac_type_svlan_nxt       [i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == STACKED_VLAN_LENGTH_TYPE[(i*8) +: 8]);
            mac_type_svlan_vlan_nxt  [i] = 1'b0;
            mac_type_ipv4_svlan_nxt  [i] = 1'b0;
            mac_type_ipv4_vlan_nxt   [i] = 1'b0;
            mac_type_ipv4_novlan_nxt [i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == IPV4_LENGTH_TYPE        [(i*8) +: 8]);
            mac_type_ipv6_svlan_nxt  [i] = 1'b0;
            mac_type_ipv6_vlan_nxt   [i] = 1'b0;
            mac_type_ipv6_novlan_nxt [i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == IPV6_LENGTH_TYPE        [(i*8) +: 8]);
            mac_type_ptp_nxt         [i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == PTP_LENGTH_TYPE         [(i*8) +: 8]);
            mac_type_da_msb_nxt      [i] = '0;
            mac_type_da_lsb_nxt      [i] = '0;
            mac_type_ip4v_ihl_nxt    [i] = '0;
            mac_type_udp_da_nxt      [i] = '0;
            mac_type_proto_nxt       [i] = '0;
         end

         // Begin IPv4 detection ( Check happen on RX only )
         if (DATA_PATH == "RX") begin : IP4V_FRAME_DETECTION
            if (data_sink_sop_pipe[1]) begin
               mac_type_ip4v_ihl_nxt[i] = (data_sink_pipeline[0][(((i+2)*4)) +: 4] == IPV4_IHL[(i*4) +: 4]);
            end
            if (data_sink_sop_pipe[2] & (&mac_type_vlan_d1)) begin
               mac_type_ip4v_ihl_nxt[i] = (data_sink_pipeline[0][(((i+10)*4)) +: 4] == IPV4_IHL[(i*4) +: 4]);
            end
            if (data_sink_sop_pipe[2] & (&mac_type_svlan_d1)) begin
               mac_type_ip4v_ihl_nxt[i] = (data_sink_pipeline[0][(((i+2)*4)) +: 4] == IPV4_IHL[(i*4) +: 4]);
            end

            if (data_sink_sop_pipe[2] & (&mac_type_ipv4_novlan_d1)) begin
               mac_type_proto_nxt[i] = (data_sink_pipeline[0][((i*4)) +: 4] == IPV4_UDP_PROTOCOL[((i*4)) +: 4]);
            end
            if (data_sink_sop_pipe[3] & (&mac_type_ipv4_vlan_d1)) begin
               mac_type_proto_nxt[i] = (data_sink_pipeline[0][(((i+8)*4)) +: 4] == IPV4_UDP_PROTOCOL[((i*4)) +: 4]);
            end
            if (data_sink_sop_pipe[3] & (&mac_type_ipv4_svlan_d1)) begin
               mac_type_proto_nxt[i] = (data_sink_pipeline[0][((i*4)) +: 4] == IPV4_UDP_PROTOCOL[((i*4)) +: 4]);
            end

            if (data_sink_sop_pipe[3] & mac_type_ipv4_novlan) begin
               mac_type_da_msb_nxt[i] = (data_sink_pipeline[0][( 0+(i*8)) +: 8] == ipv4_src_addr[(16+(i*8)) +: 8]);
            end
            if (data_sink_sop_pipe[4] & mac_type_ipv4_novlan) begin
               mac_type_da_lsb_nxt[i] = (data_sink_pipeline[0][(48+(i*8)) +: 8] == ipv4_src_addr[( 0+(i*8)) +: 8]);
               mac_type_udp_da_nxt[i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == udp_src0_port[( 0+(i*8)) +: 8]);
            end

            if (data_sink_sop_pipe[4] & mac_type_ipv4_vlan) begin
               mac_type_da_msb_nxt[i] = (data_sink_pipeline[0][(32+(i*8)) +: 8] == ipv4_src_addr[(16+(i*8)) +: 8]);
               mac_type_da_lsb_nxt[i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == ipv4_src_addr[( 0+(i*8)) +: 8]);
            end
            if (data_sink_sop_pipe[5] & mac_type_ipv4_vlan) begin
               mac_type_udp_da_nxt[i] = (data_sink_pipeline[0][(48+(i*8)) +: 8] == udp_src0_port[( 0+(i*8)) +: 8]);
            end

            if (data_sink_sop_pipe[4] & mac_type_ipv4_svlan) begin
               mac_type_da_msb_nxt[i] = (data_sink_pipeline[0][( 0+(i*8)) +: 8] == ipv4_src_addr[(16+(i*8)) +: 8]);
            end
            if (data_sink_sop_pipe[5] & mac_type_ipv4_svlan) begin
               mac_type_da_lsb_nxt[i] = (data_sink_pipeline[0][(48+(i*8)) +: 8] == ipv4_src_addr[( 0+(i*8)) +: 8]);
               mac_type_udp_da_nxt[i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == udp_src0_port[( 0+(i*8)) +: 8]);
            end
         end
         // End   IPv4 detection

         //IPv4
         if (data_sink_sop_pipe[4] & mac_type_ipv4_novlan) begin
            mac_type_ptp_nxt   [i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == UDP_PORT_PTP_EVENT  [(i*8) +: 8]) || (data_sink_pipeline[0][(16+(i*8)) +: 8] == UDP_PORT_PTP_MISC  [(i*8) +: 8]);
         end

         if (data_sink_sop_pipe[5] & mac_type_ipv4_vlan) begin
            mac_type_ptp_nxt   [i] = (data_sink_pipeline[0][(48+(i*8)) +: 8] == UDP_PORT_PTP_EVENT  [(i*8) +: 8]) || (data_sink_pipeline[0][(48+(i*8)) +: 8] == UDP_PORT_PTP_MISC  [(i*8) +: 8]);
         end

         if (data_sink_sop_pipe[5] & mac_type_ipv4_svlan) begin
            mac_type_ptp_nxt   [i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == UDP_PORT_PTP_EVENT  [(i*8) +: 8]) || (data_sink_pipeline[0][(16+(i*8)) +: 8] == UDP_PORT_PTP_MISC  [(i*8) +: 8]);
         end

         //IPv6
         if (data_sink_sop_pipe[7] & mac_type_ipv6_novlan) begin
            mac_type_ptp_nxt   [i] = (data_sink_pipeline[0][(48+(i*8)) +: 8] == UDP_PORT_PTP_EVENT  [(i*8) +: 8]) || (data_sink_pipeline[0][(48+(i*8)) +: 8] == UDP_PORT_PTP_MISC  [(i*8) +: 8]);
         end

         if (data_sink_sop_pipe[7] & mac_type_ipv6_vlan) begin
            mac_type_ptp_nxt   [i] = (data_sink_pipeline[0][(16+(i*8)) +: 8] == UDP_PORT_PTP_EVENT  [(i*8) +: 8]) || (data_sink_pipeline[0][(16+(i*8)) +: 8] == UDP_PORT_PTP_MISC  [(i*8) +: 8]);
         end

         if (data_sink_sop_pipe[8] & mac_type_ipv6_svlan) begin
            mac_type_ptp_nxt   [i] = (data_sink_pipeline[0][(48+(i*8)) +: 8] == UDP_PORT_PTP_EVENT  [(i*8) +: 8]) || (data_sink_pipeline[0][(48+(i*8)) +: 8] == UDP_PORT_PTP_MISC  [(i*8) +: 8]);
         end

      end
   end

   always_ff @(posedge data_sink_clk) begin
      if (internal_rst_n_sink_clk == 1'b0) begin
         mac_type_ecpri_d1       <= 2'b0;
         mac_type_vlan_d1        <= 2'b0;
         mac_type_svlan_d1       <= 2'b0;
         mac_type_svlan_vlan_d1  <= 2'b0;
         mac_type_ipv4_novlan_d1 <= 2'b0;
         mac_type_ipv4_vlan_d1   <= 2'b0;
         mac_type_ipv4_svlan_d1  <= 2'b0;
         mac_type_ipv6_novlan_d1 <= 2'b0;
         mac_type_ipv6_vlan_d1   <= 2'b0;
         mac_type_ipv6_svlan_d1  <= 2'b0;
         mac_type_ptp_d1         <= 2'b0;
         mac_type_da_msb_d1      <= 2'b0;
         mac_type_da_lsb_d1      <= 2'b0;
         mac_type_ip4v_ihl_d1    <= 2'b0;
         mac_type_udp_da_d1      <= 2'b0;
         mac_type_proto_d1       <= 2'b0;
      end else begin
         mac_type_ecpri_d1       <= mac_type_ecpri_nxt;
         mac_type_vlan_d1        <= mac_type_vlan_nxt;
         mac_type_svlan_d1       <= mac_type_svlan_nxt;
         mac_type_svlan_vlan_d1  <= mac_type_svlan_vlan_nxt;
         mac_type_ipv4_novlan_d1 <= mac_type_ipv4_novlan_nxt;
         mac_type_ipv4_vlan_d1   <= mac_type_ipv4_vlan_nxt;
         mac_type_ipv4_svlan_d1  <= mac_type_ipv4_svlan_nxt;
         mac_type_ipv6_novlan_d1 <= mac_type_ipv6_novlan_nxt;
         mac_type_ipv6_vlan_d1   <= mac_type_ipv6_vlan_nxt;
         mac_type_ipv6_svlan_d1  <= mac_type_ipv6_svlan_nxt;
         mac_type_ptp_d1         <= mac_type_ptp_nxt;
         mac_type_da_msb_d1      <= mac_type_da_msb_nxt;
         mac_type_da_lsb_d1      <= mac_type_da_lsb_nxt;
         mac_type_ip4v_ihl_d1    <= mac_type_ip4v_ihl_nxt;
         mac_type_udp_da_d1      <= mac_type_udp_da_nxt;
         mac_type_proto_d1       <= mac_type_proto_nxt;
      end
   end

   always_ff @(posedge data_sink_clk) begin
      if (internal_rst_n_sink_clk == 1'b0) begin
         mac_type_ecpri <= 1'b0;
         mac_type_ipv4  <= 1'b0;
         mac_type_ipv6  <= 1'b0;
         mac_type_ptp   <= 1'b0;
      end else begin
         mac_type_ecpri <= &mac_type_ecpri_d1;
         mac_type_ipv4  <= (&mac_type_ipv4_novlan_d1) | (&mac_type_ipv4_vlan_d1) | (&mac_type_ipv4_svlan_d1);
         mac_type_ipv6  <= (&mac_type_ipv6_novlan_d1) | (&mac_type_ipv6_vlan_d1) | (&mac_type_ipv6_svlan_d1);
         mac_type_ptp   <= &mac_type_ptp_d1;
      end
   end

   //IPv4, IPv6 Data
   //TODO: need to verify with IPv4 and IPv6 packets later
   always_comb begin
      ip_ver4_opl_nxt          = ip_ver4_opl;
      ip_ver4_opl_eq5_nxt      = ip_ver4_opl_eq5;
      ip_ver_4_nxt             = ip_ver_4;
      ip_ver_4_df_nxt          = ip_ver_4_df;
      ip_ver_6_nxt             = ip_ver_6;

      if (data_sink_sop_pipe[3] & (&mac_type_ipv4_svlan_d1) & ip_ver_4) begin
         ip_ver_4_df_nxt = data_sink_pipeline[0][30];
      end else if (data_sink_sop_pipe[3] & (&mac_type_ipv4_vlan_d1) & ip_ver_4) begin
         ip_ver_4_df_nxt = data_sink_pipeline[0][62];
      end else if (data_sink_sop_pipe[2] & (&mac_type_ipv4_novlan_d1) & ip_ver_4) begin
         ip_ver_4_df_nxt = data_sink_pipeline[0][30];
      end

      if (data_sink_sop_pipe[2] & (&mac_type_svlan_d1)) begin
         ip_ver4_opl_nxt     = data_sink_pipeline [0][11 -: 4] - 4'h5;
         ip_ver4_opl_eq5_nxt = (data_sink_pipeline[0][11 -: 4] == 4'h5);
         ip_ver_4_nxt        = (data_sink_pipeline[0][15 -: 4] == 4'h4);
      end else if ((data_sink_sop_pipe[2] & (&mac_type_vlan_d1))) begin
         ip_ver4_opl_nxt     = data_sink_pipeline [0][43 -: 4] - 4'h5;
         ip_ver4_opl_eq5_nxt = (data_sink_pipeline[0][43 -: 4] == 4'h5);
         ip_ver_4_nxt        = (data_sink_pipeline[0][47 -: 4] == 4'h4);
      end else if (data_sink_sop_pipe[1]) begin
         ip_ver4_opl_nxt     = data_sink_pipeline [0][11 -: 4] - 4'h5;
         ip_ver4_opl_eq5_nxt = (data_sink_pipeline[0][11 -: 4] == 4'h5);
         ip_ver_4_nxt        = (data_sink_pipeline[0][15 -: 4] == 4'h4);
      end
   end

   always_ff @(posedge data_sink_clk) begin
      if (internal_rst_n_sink_clk == 1'b0) begin
         ip_ver4_opl     <= 4'b0;
         ip_ver4_opl_eq5 <= 1'b0;
         ip_ver_4        <= 1'b0;
         ip_ver_4_df     <= 1'b0;
         ip_ver_6        <= 1'b0;
      end else begin
         ip_ver4_opl     <= ip_ver4_opl_nxt;
         ip_ver4_opl_eq5 <= ip_ver4_opl_eq5_nxt;
         ip_ver_4        <= ip_ver_4_nxt;
         ip_ver_4_df     <= ip_ver_4_df_nxt;
         ip_ver_6        <= ip_ver_6_nxt;
      end
   end

   always_ff @(posedge data_sink_clk) begin
      if (internal_rst_n_sink_clk == 1'b0) begin
         mac_type_ipv4_novlan <= 1'b0;
         mac_type_ipv4_vlan   <= 1'b0;
         mac_type_ipv4_svlan  <= 1'b0;
         mac_type_ipv6_novlan <= 1'b0;
         mac_type_ipv6_vlan   <= 1'b0;
         mac_type_ipv6_svlan  <= 1'b0;
      end else begin
         mac_type_ipv4_novlan <= &mac_type_ipv4_novlan_d1;
         mac_type_ipv4_vlan   <= &mac_type_ipv4_vlan_d1;
         mac_type_ipv4_svlan  <= &mac_type_ipv4_svlan_d1;
         mac_type_ipv6_novlan <= &mac_type_ipv6_novlan_d1;
         mac_type_ipv6_vlan   <= &mac_type_ipv6_vlan_d1;
         mac_type_ipv6_svlan  <= &mac_type_ipv6_svlan_d1;
      end
   end

   always_ff @(posedge data_sink_clk) begin
      if (internal_rst_n_sink_clk == 1'b0) begin
         mac_type_novlan_ipv4      <= 1'b0;
         mac_type_vlan_ipv4        <= 1'b0;
         mac_type_svlan_ipv4       <= 1'b0;

         mac_type_novlan_ipv4_nodf <= 1'b0;
         mac_type_svlan_ipv4_nodf  <= 1'b0;

         mac_type_novlan_ipv6      <= 1'b0;
         mac_type_vlan_ipv6        <= 1'b0;
         mac_type_svlan_ipv6       <= 1'b0;
      end else begin
         mac_type_novlan_ipv4      <= ip_ver_4 & ip_ver4_opl_eq5 & (&mac_type_ipv4_novlan_d1);
         mac_type_vlan_ipv4        <= ip_ver_4 & ip_ver4_opl_eq5 & (&mac_type_ipv4_vlan_d1);
         mac_type_svlan_ipv4       <= ip_ver_4 & ip_ver4_opl_eq5 & (&mac_type_ipv4_svlan_d1);

         mac_type_novlan_ipv4_nodf <= ip_ver_4 & (&mac_type_ipv4_novlan_d1);
         mac_type_svlan_ipv4_nodf  <= ip_ver_4 & (&mac_type_ipv4_svlan_d1);

         mac_type_novlan_ipv6      <= ip_ver_6 & (&mac_type_ipv6_novlan_d1);
         mac_type_vlan_ipv6        <= ip_ver_6 & (&mac_type_ipv6_vlan_d1);
         mac_type_svlan_ipv6       <= ip_ver_6 & (&mac_type_ipv6_svlan_d1);
      end
   end

   // PTP related data
   always_comb begin
      mac_ptp_mestype_nxt       = mac_ptp_mestype;
      ptp_message_type_nxt      = ptp_message_type_o_r;
      mac_ptp_two_step_flag_nxt = mac_ptp_two_step_flag;
      ptp_two_step_flag_nxt     = ptp_two_step_flag_o_r;
      ecpri_nxt                 = mac_type_ecpri;
      ptp_nxt                   = mac_type_ptp;
      option_len_nxt            = 1'b0;
      // PTP message type
      if (data_sink_sop_pipe[2] & (&mac_type_svlan_d1)) begin
         mac_ptp_mestype_nxt = data_sink_pipeline[0][11 -: 4];
      end else if (data_sink_sop_pipe[2] & (&mac_type_vlan_d1)) begin
         mac_ptp_mestype_nxt = data_sink_pipeline[0][43 -: 4];
      end else if (data_sink_sop_pipe[1]) begin
         mac_ptp_mestype_nxt = data_sink_pipeline[0][11 -: 4];
      end else if (data_sink_sop_pipe[6] & mac_type_svlan_ipv4) begin
         mac_ptp_mestype_nxt = data_sink_pipeline[0][43 -: 4];
      end else if (data_sink_sop_pipe[5] & mac_type_vlan_ipv4) begin
         mac_ptp_mestype_nxt = data_sink_pipeline[0][11 -: 4];
      end else if (data_sink_sop_pipe[5] & mac_type_novlan_ipv4) begin
         mac_ptp_mestype_nxt = data_sink_pipeline[0][43 -: 4];
      end else if (data_sink_sop_pipe[8] & mac_type_svlan_ipv6) begin
         mac_ptp_mestype_nxt = data_sink_pipeline[0][11 -: 4];
      end else if (data_sink_sop_pipe[8] & mac_type_vlan_ipv6) begin
         mac_ptp_mestype_nxt = data_sink_pipeline[0][43 -: 4];
      end else if (data_sink_sop_pipe[7] & mac_type_novlan_ipv6) begin
         mac_ptp_mestype_nxt = data_sink_pipeline[0][11 -: 4];
      end

      // PTP flag field, only require bit 1 for twoStep flag
      if (data_sink_sop_pipe[3] & svlan_o_r) begin
         mac_ptp_two_step_flag_nxt = data_sink_pipeline[0][17];
      end else if (data_sink_sop_pipe[3] & vlan_o_r) begin
         mac_ptp_two_step_flag_nxt = data_sink_pipeline[0][49];
      end else if (data_sink_sop_pipe[2]) begin
         mac_ptp_two_step_flag_nxt = data_sink_pipeline[0][17];
      end else if (data_sink_sop_pipe[7] & mac_type_svlan_ipv4) begin
         mac_ptp_two_step_flag_nxt = data_sink_pipeline[0][49];
      end else if (data_sink_sop_pipe[7] & mac_type_vlan_ipv4) begin
         mac_ptp_two_step_flag_nxt = data_sink_pipeline[0][17];
      end else if (data_sink_sop_pipe[6] & mac_type_novlan_ipv4) begin
         mac_ptp_two_step_flag_nxt = data_sink_pipeline[0][49];
      end else if (data_sink_sop_pipe[9] & mac_type_svlan_ipv6) begin
         mac_ptp_two_step_flag_nxt = data_sink_pipeline[0][17];
      end else if (data_sink_sop_pipe[9] & mac_type_vlan_ipv6) begin
         mac_ptp_two_step_flag_nxt = data_sink_pipeline[0][49];
      end else if (data_sink_sop_pipe[8] & mac_type_novlan_ipv6) begin
         mac_ptp_two_step_flag_nxt = data_sink_pipeline[0][17];
      end

      if (&mac_type_ptp_d1) begin
          ptp_message_type_nxt  = mac_ptp_mestype;
          ptp_two_step_flag_nxt = mac_ptp_two_step_flag;
      end

   end

   always_ff @(posedge data_sink_clk) begin
      if (internal_rst_n_sink_clk == 1'b0) begin
          mac_ptp_mestype       <= 4'h0;
          ptp_message_type_o_r  <= 4'h0;
          mac_ptp_two_step_flag <= 1'b0;
          ptp_two_step_flag_o_r <= 1'b0;
      end else begin
          mac_ptp_mestype       <= mac_ptp_mestype_nxt;
          ptp_message_type_o_r  <= ptp_message_type_nxt;
          mac_ptp_two_step_flag <= mac_ptp_two_step_flag_nxt;
          ptp_two_step_flag_o_r <= ptp_two_step_flag_nxt;
      end
   end

   assign ipv4_ecpri_match = ((&mac_type_udp_da_d1) & (&mac_type_ip4v_ihl_d1) & (&mac_type_da_lsb_d1) & (&mac_type_da_msb_d1) & (&mac_type_proto_d1));
   always_ff @(posedge data_sink_clk) begin
      if (internal_rst_n_sink_clk == 1'b0) begin
         vlan_o_r       <= 1'b0;
         svlan_o_r      <= 1'b0;
         ecpri_o_r      <= 1'b0;
         ext_ecpri_o_r  <= 1'b0;
         ptp_o_r        <= 1'b0;
         ipv4_o_r       <= 1'b0;
         ipv6_o_r       <= 1'b0;
         udp_o_r        <= 1'b0;
         option_len_o_r <= 1'b0;
      end else begin
         vlan_o_r       <= &mac_type_vlan_d1;
         svlan_o_r      <= &mac_type_svlan_d1;
         ecpri_o_r      <= ((&mac_type_ecpri_d1)|ipv4_ecpri_match) & ((~macaddr_vlanid & mac_destaddr_match) | (macaddr_vlanid & vlan_id_match)); //no.6-8 pp
         ext_ecpri_o_r  <= &mac_type_ecpri_d1;
         ptp_o_r        <= &mac_type_ptp_d1;
         // vlan may have not enough clock cycle to flop it
         ipv4_o_r       <= mac_type_novlan_ipv4_nodf | (ip_ver_4 & (&mac_type_ipv4_vlan_d1)) | mac_type_svlan_ipv4_nodf;
         ipv6_o_r       <= mac_type_novlan_ipv6 | (ip_ver_6 & (&mac_type_ipv6_vlan_d1)) | mac_type_svlan_ipv6;
         udp_o_r        <= &mac_type_proto_d1; // only support IPV4_UDP
         option_len_o_r <= option_len_nxt;
     end
   end

   always_comb begin
      case ({ptp_o_nxt,ext_ecpri_o_nxt})
         2'b01 : ext_source_pkt_type_comb = 3'b000;
         2'b10 : ext_source_pkt_type_comb = 3'b001;
         2'b11 : ext_source_pkt_type_comb = 3'b001;
       default : ext_source_pkt_type_comb = 3'b010;
      endcase
   end

   logic data_src_sop_out_nxt;
   logic data_src_eop_out_nxt;

   assign data_src_sop_out_nxt = data_src_sop & !ext_fifo_empty & data_src_rdy_lc & !ext_ctrl_fifo_empty;
   assign data_src_eop_out_nxt = data_src_eop & !ext_fifo_empty & data_src_rdy_lc;

   logic                     ext_source_sop_r;
   logic                     ext_source_eop_r;
   logic                     ext_source_valid_r;
   logic [(DATA_WIDTH)-1:0]  ext_source_data_r;
   logic [EMPTY_BITWIDTH:0]  ext_source_empty_r;
   logic [(ERROR_WIDTH)-1:0] ext_source_error_r;

   always_ff @(posedge data_source_clk) begin
      if (internal_rst_n_src_clk == 1'b0) begin
         data_source_sop       <= 1'b0;
         data_source_eop       <= 1'b0;
         data_source_valid     <= 1'b0;
         data_source_empty     <= {EMPTY_WIDTH{1'b0}};
         data_source_error     <= {ERROR_WIDTH{1'b0}};
      end else begin
         //data_source_sop   <= (ptp_o_nxt && DATA_PATH == "TX")  || (ecpri_o_nxt && DATA_PATH == "RX")  ? data_src_sop_out_nxt : 1'b0;
         //data_source_eop   <= (ptp_o_nxt && DATA_PATH == "TX")  || (ecpri_o_nxt && DATA_PATH == "RX")  ? data_src_eop_out_nxt : 1'b0;
         //data_source_valid <= (ptp_o_nxt && DATA_PATH == "TX")  || (ecpri_o_nxt && DATA_PATH == "RX")  ? data_src_valid       : 1'b0;
         //data_source_empty <= (ptp_o_nxt && DATA_PATH == "TX")  || (ecpri_o_nxt && DATA_PATH == "RX")  ? data_src_empty       : {EMPTY_WIDTH{1'b0}};
         //data_source_error <= (ptp_o_nxt && DATA_PATH == "TX")  || (ecpri_o_nxt && DATA_PATH == "RX")  ? data_src_error       : {ERROR_WIDTH{1'b0}};

         data_source_sop   <= (DATA_PATH == "TX") || (ecpri_o_nxt && DATA_PATH == "RX")  ? data_src_sop_out_nxt : 1'b0;
         data_source_eop   <= (DATA_PATH == "TX") || (ecpri_o_nxt && DATA_PATH == "RX")  ? data_src_eop_out_nxt : 1'b0;
         data_source_valid <= (DATA_PATH == "TX") || (ecpri_o_nxt && DATA_PATH == "RX")  ? data_src_valid       : 1'b0;
         data_source_empty <= (DATA_PATH == "TX") || (ecpri_o_nxt && DATA_PATH == "RX")  ? data_src_empty       : {EMPTY_WIDTH{1'b0}};
         data_source_error <= (DATA_PATH == "TX") || (ecpri_o_nxt && DATA_PATH == "RX")  ? data_src_error       : {ERROR_WIDTH{1'b0}};
      end
   end

   always_ff @(posedge data_source_clk) begin
      if (internal_rst_n_src_clk == 1'b0) begin
         data_source_vlan_pcp  <= 3'b0;
         ext_source_vlan_pcp   <= 3'b0;
      end else begin
         data_source_vlan_pcp  <= (DATA_PATH == "TX") ? vlan_pcp_nxt : 3'b000;
         ext_source_vlan_pcp   <= (DATA_PATH == "TX") ? vlan_pcp_nxt : 3'b000;
      end
    end

   always_ff @(posedge data_source_clk) begin
      //data_source_data  <= (ptp_o_nxt && DATA_PATH == "TX")  || (ecpri_o_nxt && DATA_PATH == "RX")  ? data_src_data        : {DATA_WIDTH{1'b0}};
      //data_source_desc  <= (ptp_o_nxt && DATA_PATH == "TX")                                         ? ext_fifo_dout_desc   : {DATA_WIDTH{1'b0}};
      data_source_data       <= (DATA_PATH == "TX")  || (ecpri_o_nxt && DATA_PATH == "RX")  ? data_src_data              : {DATA_WIDTH{1'b0}};
      data_source_desc       <= (DATA_PATH == "TX")                                         ? ext_fifo_dout_desc         : {DESC_WIDTH{1'b0}};
      data_source_desc_valid <= (DATA_PATH == "TX")                                         ? ext_fifo_dout_desc_valid   : 1'b0;
   end

   always_ff @(posedge data_source_clk) begin
      if (internal_rst_n_src_clk == 1'b0) begin
         ext_source_sop_r       <= 1'b0;
         ext_source_eop_r       <= 1'b0;
         ext_source_valid_r     <= 1'b0;
         ext_source_empty_r     <= {EMPTY_WIDTH{1'b0}};
         ext_source_error_r     <= {ERROR_WIDTH{1'b0}};
         ext_source_pkt_type_r  <= 3'd0;
      end else begin
         //ext_source_sop_r      <= (~ptp_o_nxt && DATA_PATH == "TX") || (~ecpri_o_nxt && DATA_PATH == "RX") ? data_src_sop_out_nxt     : 1'b0;
         //ext_source_eop_r      <= (~ptp_o_nxt && DATA_PATH == "TX") || (~ecpri_o_nxt && DATA_PATH == "RX") ? data_src_eop_out_nxt     : 1'b0;
         //ext_source_valid_r    <= (~ptp_o_nxt && DATA_PATH == "TX") || (~ecpri_o_nxt && DATA_PATH == "RX") ? data_src_valid           : 1'b0;
         //ext_source_empty_r    <= (~ptp_o_nxt && DATA_PATH == "TX") || (~ecpri_o_nxt && DATA_PATH == "RX") ? data_src_empty           : {EMPTY_WIDTH{1'b0}};
         //ext_source_error_r    <= (~ptp_o_nxt && DATA_PATH == "TX") || (~ecpri_o_nxt && DATA_PATH == "RX") ? data_src_error           : {ERROR_WIDTH{1'b0}};
         //ext_source_pkt_type_r <= (~ptp_o_nxt && DATA_PATH == "TX") || (~ecpri_o_nxt && DATA_PATH == "RX") ? ext_source_pkt_type_comb : 3'd0;
         ext_source_sop_r      <= (~ecpri_o_nxt && DATA_PATH == "RX") ? data_src_sop_out_nxt     : 1'b0;
         ext_source_eop_r      <= (~ecpri_o_nxt && DATA_PATH == "RX") ? data_src_eop_out_nxt     : 1'b0;
         ext_source_valid_r    <= (~ecpri_o_nxt && DATA_PATH == "RX") ? data_src_valid           : 1'b0;
         ext_source_empty_r    <= (~ecpri_o_nxt && DATA_PATH == "RX") ? data_src_empty           : {EMPTY_WIDTH{1'b0}};
         ext_source_error_r    <= (~ecpri_o_nxt && DATA_PATH == "RX") ? data_src_error           : {ERROR_WIDTH{1'b0}};
         ext_source_pkt_type_r <= (~ecpri_o_nxt && DATA_PATH == "RX") ? ext_source_pkt_type_comb : 3'd0;
      end
   end

   always_ff @(posedge data_source_clk) begin
      //ext_source_data_r  <= (~ptp_o_nxt && DATA_PATH == "TX") || (~ecpri_o_nxt && DATA_PATH == "RX") ? data_src_data        : {DATA_WIDTH{1'b0}};
      ext_source_data_r  <= (~ecpri_o_nxt && DATA_PATH == "RX") ? data_src_data        : {DATA_WIDTH{1'b0}};
   end

   generate
   if (DATA_PATH == "RX") begin: enable_ext_rx_sync
       logic                      rx_sync_fifo_rdreq;
       logic                      rx_sync_fifo_read_empty;
       logic                      rx_sync_fifo_wrreq;
       logic [EXT_FIFO_ADDRW-1:0] rx_sync_fifo_wr_pfull_out;
       logic [EXT_FIFO_WIDTH-1:0] rx_sync_fifo_dout;
       logic [95:0]               rx_ingress_timestamp_96b_data_int /* synthesis preserve_syn_only */;
       logic                      sync_reset_n_pre;
       logic                      sync_reset_n     /* synthesis preserve_syn_only maxfan = 30 */;

       alt_ecpri_std_synchronizer_nocut #(.depth(2), .rst_value(0)) parser_reset_sync (.clk(ext_source_clk),  .reset_n(rst_n),  .din(1'b1), .dout(sync_reset_n_pre));

       always_ff @(posedge ext_source_clk) begin
          sync_reset_n <= sync_reset_n_pre;
       end

       always_ff @(posedge data_source_clk) begin
           rx_ingress_timestamp_96b_data_int <= ext_ctrl_fifo_dout[(FIFO_CTRL_WIDTH-1)-:96];
       end

       alt_ecpri_fifo #(
           .DEVICE_FAMILY ( DEVICE_FAMILY                                                                                                                                             ),
           .DEPTH         ( EXT_SOURCE_FIFO_DEPTH   ),

           .WIDTH         ( EXT_FIFO_WIDTH                                                                                                                                            ),
           .ADDR_WIDTH    ( EXT_FIFO_ADDRW                                                                                                                                            ),
           .SKID_BUFFER_D2( 1                                                                                                                                                         ),
           .DUAL_CLOCK    ( 1                                                                                                                                                         )
       ) ext_dcfifo       (
           .aclr          ( ~rst_n                                                                                                                                                    ),
           .sclr          ( ~sync_reset_n                                                                                                                                             ),
           .wrclk         ( data_source_clk                                                                                                                                           ),
           .data          ( {ext_source_pkt_type_r, rx_ingress_timestamp_96b_data_int, ext_source_sop_r, ext_source_eop_r, ext_source_empty_r, ext_source_error_r, ext_source_data_r} ),
           .wrreq         ( rx_sync_fifo_wrreq                                                                                                                                        ),
           .wrfull        (                                                                                                                                                           ),
           .wrusedw       ( rx_sync_fifo_wr_pfull_out                                                                                                                                 ),
           .rdclk         ( ext_source_clk                                                                                                                                            ),
           .q             ( rx_sync_fifo_dout                                                                                                                                         ),
           .rdreq         ( rx_sync_fifo_rdreq                                                                                                                                        ),
           .rdempty       ( rx_sync_fifo_read_empty                                                                                                                                   ),
           .rdusedw       (                                                                                                                                                           ),

           .clock         (                                                                                                                                                           ),
           .empty         (                                                                                                                                                           ),
           .usedw         (                                                                                                                                                           ),
           .almost_full   (                                                                                                                                                           )
       );

        assign rx_sync_fifo_rdreq = ~rx_sync_fifo_read_empty & ext_src_ready_ff[LREADY_LATENCY];
        assign rx_sync_fifo_wrreq = ext_source_valid_r;

        if (READY_LATENCY > 0) begin: gen_ext_src_ready_lat
           always_ff @(posedge ext_source_clk) begin
              if (sync_reset_n == 1'b0) begin
                 ext_src_ready_ff <= {READY_LATENCY{1'b0}};
              end else begin
                 ext_src_ready_ff <= {ext_src_ready_ff[READY_LATENCY-2:0], ext_source_ready};
              end
           end
        end else begin: gen_ext_src_ready_lat_0
           assign ext_src_ready_ff  = ext_source_ready;
        end

        always_ff @(posedge ext_source_clk) begin
           if (sync_reset_n == 1'b0) begin
              ext_source_sop                      <= 1'b0;
              ext_source_eop                      <= 1'b0;
              ext_source_valid                    <= 1'b0;
              ext_source_empty                    <= {EMPTY_WIDTH{1'b0}};
              ext_source_error                    <= {ERROR_WIDTH{1'b0}};
           end else begin
              ext_source_valid                    <= rx_sync_fifo_rdreq;
              ext_source_sop                      <= rx_sync_fifo_dout[DATA_WIDTH+ERROR_WIDTH+EMPTY_WIDTH+1] & rx_sync_fifo_rdreq;
              ext_source_eop                      <= rx_sync_fifo_dout[DATA_WIDTH+ERROR_WIDTH+EMPTY_WIDTH]   & rx_sync_fifo_rdreq;
              ext_source_empty                    <= rx_sync_fifo_dout[(DATA_WIDTH+ERROR_WIDTH)+:EMPTY_WIDTH];
              ext_source_error                    <= rx_sync_fifo_dout[DATA_WIDTH+:ERROR_WIDTH];
            end
        end

        always_ff @(posedge ext_source_clk) begin
           ext_rx_ingress_timestamp_96b_data_o <= rx_sync_fifo_dout[(DATA_WIDTH+ERROR_WIDTH+EMPTY_WIDTH+2)+:96];
           ext_source_data                     <= rx_sync_fifo_dout[(DATA_WIDTH-1):0];
           ext_source_pkt_type                 <= rx_sync_fifo_dout[(DATA_WIDTH+ERROR_WIDTH+EMPTY_WIDTH+2+96)+:3];
        end

        always_ff @(posedge data_source_clk) begin
           if (internal_rst_n_src_clk == 1'b0) begin
              ext_src_ready    <= 1'b0;
           end else begin
              ext_src_ready    <= (rx_sync_fifo_wr_pfull_out < EXT_FIFO_AFULL[EXT_FIFO_ADDRW-1:0]);
           end
        end

       assign data_src_ready   = data_source_ready & ext_src_ready; // backpressure generated internally with usedw from DCFIFO

   end else begin: disable_ext_rx_sync

       assign ext_src_ready                       = 1'b1;

       assign data_src_ready                      = data_source_ready & ext_source_ready;

       assign ext_source_sop                      = ext_source_sop_r;
       assign ext_source_eop                      = ext_source_eop_r;
       assign ext_source_valid                    = ext_source_valid_r;
       assign ext_source_empty                    = ext_source_empty_r;
       assign ext_source_error                    = ext_source_error_r;
       assign ext_source_data                     = ext_source_data_r;
       assign ext_source_pkt_type                 = ext_source_pkt_type_r;

       assign ext_rx_ingress_timestamp_96b_data_o = 96'h0;
       assign ext_src_ready_ff                    = {READY_LATENCY{1'b1}};
   end
   endgenerate

   always_ff @(posedge data_source_clk) begin
      if (internal_rst_n_src_clk== 1'b0) begin
         ipv6_o              <= 1'b0;
         ipv4_o              <= 1'b0;
         svlan_o             <= 1'b0;
         vlan_o              <= 1'b0;
      end else begin
         ipv6_o              <= (ptp_o_nxt && DATA_PATH == "TX") || (ecpri_o_nxt && DATA_PATH == "RX") ? ipv6_o_nxt  : 1'b0;
         ipv4_o              <= (ptp_o_nxt && DATA_PATH == "TX") || (ecpri_o_nxt && DATA_PATH == "RX") ? ipv4_o_nxt  : 1'b0;
         svlan_o             <= (ptp_o_nxt && DATA_PATH == "TX") || (ecpri_o_nxt && DATA_PATH == "RX") ? svlan_o_nxt : 1'b0;
         vlan_o              <= (ptp_o_nxt && DATA_PATH == "TX") || (ecpri_o_nxt && DATA_PATH == "RX") ? vlan_o_nxt  : 1'b0;
      end
   end

   generate
   if (DATA_PATH == "RX") begin: enable_rx_ingress_ts_en
      always_ff @(posedge data_source_clk) begin
         if (internal_rst_n_src_clk == 1'b0) begin
            ptp_two_step_flag_o <= 1'b0;
            udp_o               <= 1'b0;
            ecpri_o             <= 1'b0;
         end else begin
            ptp_two_step_flag_o <= ecpri_o_nxt ? ptp_two_step_flag_o_nxt : 1'b0;
            udp_o               <= ecpri_o_nxt ? udp_o_nxt               : 1'b0;
            ecpri_o             <= ecpri_o_nxt ? ecpri_o_nxt             : 1'b0;
         end
      end

      always_ff @(posedge data_source_clk) begin
         if (internal_rst_n_src_clk == 1'b0) begin
            rx_ingress_timestamp_96b_valid_o  <= 1'b0;
         end else begin
            rx_ingress_timestamp_96b_valid_o  <= ecpri_o_nxt ? data_src_sop_out_nxt : 1'b0;
         end
      end

      always_ff @(posedge data_source_clk) begin
         rx_ingress_timestamp_96b_data_o <= rx_ingress_timestamp_96b_data_o_nxt;
      end

      assign ptp_message_type_o                = 4'b0000;
      assign ptp_o                             = 1'b0;
      assign ptp_tx_ingress_timestamp_96b_data = 96'h0;
   end else begin: enable_rx_ingress_ts_dis
      always_ff @(posedge data_source_clk) begin
         if (internal_rst_n_src_clk == 1'b0) begin
            ptp_message_type_o  <= 4'b0000;
            ptp_o               <= 1'b0;
         end else begin
            ptp_message_type_o  <= ptp_o_nxt ? ptp_message_type_o_nxt : 4'b0;
            ptp_o               <= ptp_o_nxt ? ptp_o_nxt              : 1'b0;
         end
      end

      always_ff @(posedge data_source_clk) begin
         ptp_tx_ingress_timestamp_96b_data <= ext_tx_ingress_timestamp_96b_data_nxt;
      end

      assign ptp_two_step_flag_o              = 1'b0;
      assign rx_ingress_timestamp_96b_data_o  = 96'h0;
      assign rx_ingress_timestamp_96b_valid_o = 1'b0;
      assign udp_o                            = 1'b0;
      assign ecpri_o                          = 1'b0;
   end
   endgenerate

endmodule
