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


// Copyright 2022-2022 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials, and
// your use of them is governed by the express license under which they were
// provided to you ("License"). Unless the License provides otherwise, you may
// not use, modify, copy, publish, distribute, disclose or transmit this
// software or the related documents without Intel's prior written permission.
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.

module ptp_tx_adp_mpm_parser_custom_wrapper #(
    parameter  int PREAMBLE_EN                 = 0
   ,parameter  int DST_ST_LATENCY              = 0
   ,parameter  int DATA_WIDTH                  = 1024
   ,parameter  int TID_WIDTH                   = 1
   ,parameter  int NUM_OF_SEG                  = 16
   ,parameter  int NUM_OF_SOP                  = 4
   ,parameter  int PPMETADATA_WIDTH            = 1
   ,parameter  int USER_METADATA_WIDTH         = 1
   ,parameter  int HSSI_TX_TUSER_CLIENT_WIDTH  = 1
   ,parameter  int ENABLE_STATS_CNTRS          = 1
   ,parameter  int BASE_OFFSET                 = 16'h100
   ,parameter  int AXIS_DATA_LIT_ENDIAN_EN     = 1
   ,parameter  int MEM_BASED_STATS_EN          = 1
   ,parameter  int MPM_DEBUG                   = 0
   ,localparam int DRV_IFS_NUM                 = NUM_OF_SEG == 1 ? 1 : DATA_WIDTH == 1024 ? 3 : 2
   ,localparam int RESULT_IF_NUM               = (NUM_OF_SEG == 1 || DATA_WIDTH != 1024) ? 1 : 2
   ,localparam int HSSI_TX_TUSER_PTP_WIDTH     = (RESULT_IF_NUM * $bits(ptp_tx_adp_parser_pkg::tuser_ptp_t)) + 2
   ,localparam int HSSI_TX_TUSER_PTP_EXT_WIDTH = $bits(ptp_tx_adp_parser_pkg::tuser_ptp_extended_t)
   ,localparam int ADDITIONAL_REGS_NUM         = 2
   ,localparam int DETECTING_CHAINS_NUMBER     = ptp_tx_adp_packet_parser_auto_pkg::DETECTING_CHAINS_NUMBER
   ,localparam int REGISTERS_NUM               = DETECTING_CHAINS_NUMBER + ADDITIONAL_REGS_NUM
   ,localparam int AXI_SL_NUM                  = DRV_IFS_NUM + 1
   ,localparam int AXI_SL_PARSER_ADDR_WIDTH    = parser_pkg::get_width(BASE_OFFSET + (REGISTERS_NUM * 2 * 4))
   ,localparam int AXI_SL_ADDR_WIDTH           = AXI_SL_PARSER_ADDR_WIDTH + parser_pkg::get_width(AXI_SL_NUM)
   ,localparam int AXI_SL_DATA_WIDTH           = 32
   ,localparam int AXI_SL_RESP_WIDTH           = 2
   ,localparam int AXI_SL_STRB_WIDTH           = AXI_SL_DATA_WIDTH / 8
) (
    input  logic                                     clk
   ,input  logic                                     rst_n
   ,input  logic                                     axi_sl_clk
   ,input  logic                                     axi_sl_rst_n
   //AXIs sink/input
   ,output logic                                     app_pp_TREADY
   ,input  logic                                     app_pp_TVALID
   ,input  logic                                     app_pp_TLAST
   ,input  logic [DATA_WIDTH - 1:0]                  app_pp_TDATA
   ,input  logic [DATA_WIDTH / 8 - 1:0]              app_pp_TKEEP
   ,input  logic [TID_WIDTH - 1:0]                   app_pp_tid
   ,input  logic [NUM_OF_SEG - 1:0]                  app_pp_tuser_last_segment
   ,input  logic [NUM_OF_SOP - 1:0][PPMETADATA_WIDTH - 1:0]    app_pp_tuser_ppmetadata
   ,input  logic [NUM_OF_SOP - 1:0][USER_METADATA_WIDTH - 1:0] app_pp_tuser_usermetadata
   ,input  logic [HSSI_TX_TUSER_PTP_WIDTH - 1:0]     app_pp_tx_tuser_ptp
   ,input  logic [RESULT_IF_NUM - 1:0][HSSI_TX_TUSER_PTP_EXT_WIDTH - 1:0] app_pp_tx_tuser_ptp_extended
   ,input  logic [HSSI_TX_TUSER_CLIENT_WIDTH - 1:0]  app_pp_tx_tuser_client
   //AXIs source/output
   ,input  logic                                     pp_app_TREADY
   ,output logic                                     pp_app_TVALID
   ,output logic                                     pp_app_TLAST
   ,output logic [DATA_WIDTH - 1:0]                  pp_app_TDATA
   ,output logic [DATA_WIDTH / 8 - 1:0]              pp_app_TKEEP
   ,output logic [TID_WIDTH - 1:0]                   pp_app_tid
   ,output logic [NUM_OF_SEG - 1:0]                  pp_app_tuser_last_segment
   ,output logic [NUM_OF_SOP - 1:0][PPMETADATA_WIDTH - 1:0]    pp_app_tuser_ppmetadata
   ,output logic [NUM_OF_SOP - 1:0][USER_METADATA_WIDTH - 1:0] pp_app_tuser_usermetadata
   ,output logic [HSSI_TX_TUSER_PTP_WIDTH - 1:0]     pp_app_tx_tuser_ptp
   ,output logic [RESULT_IF_NUM - 1:0][HSSI_TX_TUSER_PTP_EXT_WIDTH - 1:0] pp_app_tx_tuser_ptp_extended
   ,output logic [HSSI_TX_TUSER_CLIENT_WIDTH - 1:0]  pp_app_tx_tuser_client
   //AXI slave Write Address Channel
   ,output logic                                     app_pp_axi_sl_AWREADY
   ,input  logic                                     app_pp_axi_sl_AWVALID
   ,input  logic [AXI_SL_ADDR_WIDTH - 1:0]           app_pp_axi_sl_AWADDR
   //AXI slave Write Data Channel
   ,output logic                                     app_pp_axi_sl_WREADY
   ,input  logic                                     app_pp_axi_sl_WVALID
   ,input  logic [AXI_SL_STRB_WIDTH - 1:0]           app_pp_axi_sl_WSTRB
   ,input  logic [AXI_SL_DATA_WIDTH - 1:0]           app_pp_axi_sl_WDATA
   //AXI slave Write Response Channel
   ,input  logic                                     app_pp_axi_sl_BREADY
   ,output logic                                     app_pp_axi_sl_BVALID
   ,output logic [AXI_SL_RESP_WIDTH - 1:0]           app_pp_axi_sl_BRESP
   //AXI slave Read Address Channel
   ,output logic                                     app_pp_axi_sl_ARREADY
   ,input  logic                                     app_pp_axi_sl_ARVALID
   ,input  logic [AXI_SL_ADDR_WIDTH - 1:0]           app_pp_axi_sl_ARADDR
   //AXI slave Read Data Channel
   ,input  logic                                     app_pp_axi_sl_RREADY
   ,output logic                                     app_pp_axi_sl_RVALID
   ,output logic [AXI_SL_RESP_WIDTH - 1:0]           app_pp_axi_sl_RRESP
   ,output logic [AXI_SL_DATA_WIDTH - 1:0]           app_pp_axi_sl_RDATA
////////debug
   ,output logic                                     o_ptp_pkt_recognized

   ,output logic                                     out_axis_tvalid[DRV_IFS_NUM - 1:0]
   ,output logic                                     out_axis_tlast[DRV_IFS_NUM - 1:0]
   ,output logic [DATA_WIDTH - 1:0]                  out_axis_tdata[DRV_IFS_NUM - 1:0]
   ,output logic [DATA_WIDTH / 8 - 1:0]              out_axis_tkeep[DRV_IFS_NUM - 1:0]
);

   localparam int MIN_PKT_BYTE_LEN              = DATA_WIDTH == 128 ? 15 : DATA_WIDTH == 256 ? 31 : 58;
   localparam int CONST_PARSER_LATENCY          = NUM_OF_SEG == 1 ? 0 : 1;
   localparam int TUSER_WIDTH                   = USER_METADATA_WIDTH;
   localparam int MPM_MODULE_LATENCY            = DATA_WIDTH == 1024 ? 22 : DATA_WIDTH == 512 ? 23 : DATA_WIDTH == 256 ? 25 : DATA_WIDTH == 128 ? 30 : 0;
   localparam int LOG2_DATA_WIDTH               = parser_pkg::get_width(DATA_WIDTH);
   localparam int LOG2_EXTRACT_FIELD_BYTE_WIDTH = 2;
   localparam int RESULT_LENGTH                 = 16;
   localparam int RESULT_NUM                    = ptp_tx_adp_packet_parser_auto_pkg::RESULT_NUM;
   localparam int EXTRACT_CMD_NUM               = ptp_tx_adp_packet_parser_auto_pkg::EXTRACT_CMD_NUM;
   localparam int EXTRACT_FIELD_WIDTH           = 2**LOG2_EXTRACT_FIELD_BYTE_WIDTH;
   localparam int PREAMBLE_LENGTH               = 8;
   localparam int IN_OFFSET_BYTE_WIDTH          = 4;

   typedef struct packed {
      logic [TID_WIDTH - 1:0]                                           tid;
      logic [NUM_OF_SEG - 1:0]                                          last_segment;
      logic [NUM_OF_SOP - 1:0][PPMETADATA_WIDTH - 1:0]                  ppmetadata;
      logic [NUM_OF_SOP - 1:0][USER_METADATA_WIDTH - 1:0]               usermetadata;
      ptp_tx_adp_parser_pkg::tuser_ptp_t          [RESULT_IF_NUM - 1:0] ptp;
      logic [1:0]                                                       ptp_na;
      ptp_tx_adp_parser_pkg::tuser_ptp_extended_t [RESULT_IF_NUM - 1:0] ptp_extended;
      logic [HSSI_TX_TUSER_CLIENT_WIDTH - 1:0]                          client;
   } tuser_sigs_t;

   typedef struct packed {
      logic                                  tlast;
      logic [2**LOG2_DATA_WIDTH - 1:0]       tdata;
      logic [2**(LOG2_DATA_WIDTH - 3) - 1:0] tkeep;
      tuser_sigs_t                           tuser;
   } pipe_sigs_t;

   logic                                                                              ready_out, ready_lat_out, ready;
   logic                                                                              valid_lat_in, tvalid;

   pipe_sigs_t                                                                        pipe_sigs_in, pipe_sigs_lat_in, fifo_pipe_sigs, fifo_pipe_sigs_r;

   logic [IN_OFFSET_BYTE_WIDTH - 1:0]                                                 preamble_offset;

   logic [DRV_IFS_NUM - 1:0]                                                          axis_tready;
   logic [DRV_IFS_NUM - 1:0]                                                          axis_tvalid;
   logic [DRV_IFS_NUM - 1:0]                                                          axis_tlast;
   logic [DRV_IFS_NUM - 1:0][2**LOG2_DATA_WIDTH - 1:0]                                axis_tdata;
   logic [DRV_IFS_NUM - 1:0][2**(LOG2_DATA_WIDTH - 3) - 1:0]                          axis_tkeep;
   tuser_sigs_t [DRV_IFS_NUM - 1:0]                                                   axis_tuser;
   tuser_sigs_t [RESULT_IF_NUM - 1:0]                                                 axis_out_tuser;

   logic [DRV_IFS_NUM - 1:0]                                                          ptp_axis_tvalid;
   logic [DRV_IFS_NUM - 1:0]                                                          ptp_axis_tlast;
   logic [DRV_IFS_NUM - 1:0][2**LOG2_DATA_WIDTH - 1:0]                                ptp_axis_tdata;
   logic [DRV_IFS_NUM - 1:0][2**(LOG2_DATA_WIDTH - 3) - 1:0]                          ptp_axis_tkeep;
   tuser_sigs_t [DRV_IFS_NUM - 1:0]                                                   ptp_axis_tuser;
   tuser_sigs_t                                                                       ptp_axis_tuser_r;

   logic                                                                              ptp_axis_tvalid_r;
   logic                                                                              ptp_axis_tlast_r;
   logic [2**LOG2_DATA_WIDTH - 1:0]                                                   ptp_axis_tdata_r;
   logic [2**(LOG2_DATA_WIDTH - 3) - 1:0]                                             ptp_axis_tkeep_r;

   logic [DRV_IFS_NUM - 1:0]                                                          parser_result_valid;
   logic [DRV_IFS_NUM - 1:0]                                                          parser_result_pkt_recognized;
   logic [DRV_IFS_NUM - 1:0][RESULT_NUM - 1:0][RESULT_LENGTH - 1:0]                   parser_result_data;
   logic [DRV_IFS_NUM - 1:0][EXTRACT_CMD_NUM - 1:0][EXTRACT_FIELD_WIDTH - 1:0][7:0]   parser_result_ext_data;
   logic [DRV_IFS_NUM - 1:0][EXTRACT_CMD_NUM - 1:0][EXTRACT_FIELD_WIDTH - 1:0][7:0]   parser_result_ext_data_deb;

   logic [RESULT_IF_NUM - 1:0]                                                        packed_parser_result_valid;
   logic [RESULT_IF_NUM - 1:0]                                                        packed_parser_result_pkt_recognized;
   logic [RESULT_IF_NUM - 1:0][RESULT_NUM - 1:0][RESULT_LENGTH - 1:0]                 packed_parser_result_data;
   logic [RESULT_IF_NUM - 1:0][EXTRACT_CMD_NUM - 1:0][EXTRACT_FIELD_WIDTH - 1:0][7:0] packed_parser_result_ext_data;

   logic [DRV_IFS_NUM - 1:0]                                                           axi_parser_sl_AWREADY;
   logic [DRV_IFS_NUM - 1:0]                                                           axi_parser_sl_AWVALID;
   logic [DRV_IFS_NUM - 1:0][AXI_SL_PARSER_ADDR_WIDTH - 1:0]                           axi_parser_sl_AWADDR;
   logic [DRV_IFS_NUM - 1:0]                                                           axi_parser_sl_WREADY;
   logic [DRV_IFS_NUM - 1:0]                                                           axi_parser_sl_WVALID;
   logic [DRV_IFS_NUM - 1:0][AXI_SL_STRB_WIDTH - 1:0]                                  axi_parser_sl_WSTRB;
   logic [DRV_IFS_NUM - 1:0][AXI_SL_DATA_WIDTH - 1:0]                                  axi_parser_sl_WDATA;
   logic [DRV_IFS_NUM - 1:0]                                                           axi_parser_sl_BREADY;
   logic [DRV_IFS_NUM - 1:0]                                                           axi_parser_sl_BVALID;
   logic [DRV_IFS_NUM - 1:0][AXI_SL_RESP_WIDTH - 1:0]                                  axi_parser_sl_BRESP;
   logic [DRV_IFS_NUM - 1:0]                                                           axi_parser_sl_ARREADY;
   logic [DRV_IFS_NUM - 1:0]                                                           axi_parser_sl_ARVALID;
   logic [DRV_IFS_NUM - 1:0][AXI_SL_PARSER_ADDR_WIDTH - 1:0]                           axi_parser_sl_ARADDR;
   logic [DRV_IFS_NUM - 1:0]                                                           axi_parser_sl_RREADY;
   logic [DRV_IFS_NUM - 1:0]                                                           axi_parser_sl_RVALID;
   logic [DRV_IFS_NUM - 1:0][AXI_SL_RESP_WIDTH - 1:0]                                  axi_parser_sl_RRESP;
   logic [DRV_IFS_NUM - 1:0][AXI_SL_DATA_WIDTH - 1:0]                                  axi_parser_sl_RDATA;
   
   logic [1:0]                                                           axi_sl_AWREADY;
   logic [1:0]                                                           axi_sl_AWVALID;
   logic [1:0][AXI_SL_PARSER_ADDR_WIDTH - 1:0]                           axi_sl_AWADDR;
   logic [1:0]                                                           axi_sl_WREADY;
   logic [1:0]                                                           axi_sl_WVALID;
   logic [1:0][AXI_SL_STRB_WIDTH - 1:0]                                  axi_sl_WSTRB;
   logic [1:0][AXI_SL_DATA_WIDTH - 1:0]                                  axi_sl_WDATA;
   logic [1:0]                                                           axi_sl_BREADY;
   logic [1:0]                                                           axi_sl_BVALID;
   logic [1:0][AXI_SL_RESP_WIDTH - 1:0]                                  axi_sl_BRESP;
   logic [1:0]                                                           axi_sl_ARREADY;
   logic [1:0]                                                           axi_sl_ARVALID;
   logic [1:0][AXI_SL_PARSER_ADDR_WIDTH - 1:0]                           axi_sl_ARADDR;
   logic [1:0]                                                           axi_sl_RREADY;
   logic [1:0]                                                           axi_sl_RVALID;
   logic [1:0][AXI_SL_RESP_WIDTH - 1:0]                                  axi_sl_RRESP;
   logic [1:0][AXI_SL_DATA_WIDTH - 1:0]                                  axi_sl_RDATA;

   logic [RESULT_IF_NUM - 1:0][DRV_IFS_NUM - 1:0]                                     if_num, if_num_f;
   logic [RESULT_IF_NUM - 1:0]                                                        if_valid, if_valid_f;

   logic [AXI_SL_DATA_WIDTH - 1:0]                                                    axil_ptp_data;
   logic                                                                              preamble_en;
   logic                                                                              rst;

   always_comb begin
      if(!preamble_en) begin
         preamble_offset = '0;
      end else begin
         preamble_offset = PREAMBLE_LENGTH;
      end
   end

   always_comb app_pp_TREADY = ready_out & rst_n;
   always_comb ready = pp_app_TREADY;

   //pack input signals
   always_comb begin
      rst = ~rst_n;

      if(AXIS_DATA_LIT_ENDIAN_EN) begin
         pipe_sigs_in.tdata              = {<<8{app_pp_TDATA}};
         pipe_sigs_in.tkeep              = {<<{app_pp_TKEEP}};
         pipe_sigs_in.tuser.last_segment = {<<{app_pp_tuser_last_segment}};
      end else begin
         pipe_sigs_in.tdata              = app_pp_TDATA;
         pipe_sigs_in.tkeep              = app_pp_TKEEP;
         pipe_sigs_in.tuser.last_segment = app_pp_tuser_last_segment;
      end
      pipe_sigs_in.tlast              = app_pp_TLAST;
      pipe_sigs_in.tuser.tid          = app_pp_tid;
      pipe_sigs_in.tuser.ppmetadata   = app_pp_tuser_ppmetadata;
      pipe_sigs_in.tuser.usermetadata = app_pp_tuser_usermetadata;
      pipe_sigs_in.tuser.ptp          = app_pp_tx_tuser_ptp >> 2;
      pipe_sigs_in.tuser.ptp_na       = app_pp_tx_tuser_ptp[1:0];
      pipe_sigs_in.tuser.ptp_extended = app_pp_tx_tuser_ptp_extended;
      pipe_sigs_in.tuser.client       = app_pp_tx_tuser_client;
   end

   //suppress transfer with no valid data
   always_comb begin
      tvalid = '0;
      if(app_pp_TVALID == 1'b1) begin
         tvalid = |app_pp_TKEEP;
      end
   end

   rdy_lat_to_zero_adp #(
       .READY_LATENCY (DST_ST_LATENCY)
      ,.DATA_WIDTH    ($bits(pipe_sigs_t))
   ) dst_lat_to_zero_adp (
       .clk           (clk)
      ,.rst           (~rst_n)
      //sink/input
      ,.in_ready      (ready_out)
      ,.in_valid      (tvalid)
      ,.in_data       (pipe_sigs_in)
      //source/output
      ,.out_ready     (ready_lat_out)
      ,.out_valid     (valid_lat_in)
      ,.out_data      (pipe_sigs_lat_in)
   );

   axil_const_passthrough #(
       .AXI_SL_ADDR_WIDTH (AXI_SL_ADDR_WIDTH)
       ,.AXI_OUT_ADDR_WIDTH (AXI_SL_PARSER_ADDR_WIDTH)
       ,.PREAMBLE_EN (PREAMBLE_EN)
   ) axil_const_passthrough (
       .axi_clk          (axi_sl_clk)
      ,.clk              (clk)
      ,.axi_rst_n        (axi_sl_rst_n)
      
      ,.axi_awready      (app_pp_axi_sl_AWREADY)
      ,.axi_awvalid      (app_pp_axi_sl_AWVALID)
      ,.axi_awaddr       (app_pp_axi_sl_AWADDR)
      
      ,.axi_wready       (app_pp_axi_sl_WREADY)
      ,.axi_wvalid       (app_pp_axi_sl_WVALID)
      ,.axi_wstrb        (app_pp_axi_sl_WSTRB)
      ,.axi_wdata        (app_pp_axi_sl_WDATA)
      
      ,.axi_bready       (app_pp_axi_sl_BREADY)
      ,.axi_bvalid       (app_pp_axi_sl_BVALID)
      ,.axi_bresp        (app_pp_axi_sl_BRESP)
      
      ,.axi_arready      (app_pp_axi_sl_ARREADY)
      ,.axi_arvalid      (app_pp_axi_sl_ARVALID)
      ,.axi_araddr       (app_pp_axi_sl_ARADDR)
      
      ,.axi_rready       (app_pp_axi_sl_RREADY)
      ,.axi_rvalid       (app_pp_axi_sl_RVALID)
      ,.axi_rresp        (app_pp_axi_sl_RRESP)
      ,.axi_rdata        (app_pp_axi_sl_RDATA)
      
      ,.o_ptp_data       (axil_ptp_data)  
      ,.o_preamble_en    (preamble_en)
      
      ,.axi_pt_awready   (axi_sl_AWREADY[0])
      ,.axi_pt_awvalid   (axi_sl_AWVALID[0])
      ,.axi_pt_awaddr    (axi_sl_AWADDR[0])
      
      ,.axi_pt_wready    (axi_sl_WREADY[0])
      ,.axi_pt_wvalid    (axi_sl_WVALID[0])
      ,.axi_pt_wstrb     (axi_sl_WSTRB[0])
      ,.axi_pt_wdata     (axi_sl_WDATA[0])
      
      ,.axi_pt_bready    (axi_sl_BREADY[0])
      ,.axi_pt_bvalid    (axi_sl_BVALID[0])
      ,.axi_pt_bresp     (axi_sl_BRESP[0])
      
      ,.axi_pt_arready   (axi_sl_ARREADY[0])
      ,.axi_pt_arvalid   (axi_sl_ARVALID[0])
      ,.axi_pt_araddr    (axi_sl_ARADDR[0])
      
      ,.axi_pt_rready    (axi_sl_RREADY[0])
      ,.axi_pt_rvalid    (axi_sl_RVALID[0])
      ,.axi_pt_rresp     (axi_sl_RRESP[0])
      ,.axi_pt_rdata     (axi_sl_RDATA[0])
   );

   if(DRV_IFS_NUM > 1) begin   
      stats_aggregator #(
          .DATA_WIDTH (AXI_SL_DATA_WIDTH)
         ,.ADDR_WIDTH (AXI_SL_PARSER_ADDR_WIDTH)
         ,.RESP_WIDTH (AXI_SL_RESP_WIDTH)
         ,.NUM_PARSERS(DRV_IFS_NUM)
      ) stats_aggregator (
          .clk                           (axi_sl_clk)
         ,.rst                           (~axi_sl_rst_n)
      
         //Write Address Channel
         ,.m_awready  (axi_sl_AWREADY[0])
         ,.m_awvalid  (axi_sl_AWVALID[0])
         ,.m_awaddr   (axi_sl_AWADDR[0])
         //Write Data Channel
         ,.m_wready   (axi_sl_WREADY[0])
         ,.m_wvalid   (axi_sl_WVALID[0])
         ,.m_wstrb    (axi_sl_WSTRB[0])
         ,.m_wdata    (axi_sl_WDATA[0])
         //Write Response Channel
         ,.m_bready   (axi_sl_BREADY[0])
         ,.m_bvalid   (axi_sl_BVALID[0])
         ,.m_bresp    (axi_sl_BRESP[0])
         //Read Address Channel
         ,.m_arready  (axi_sl_ARREADY[0])
         ,.m_arvalid  (axi_sl_ARVALID[0])
         ,.m_araddr   (axi_sl_ARADDR[0])
         ,.m_arid     ('0)
         //Read Data Channel
         ,.m_rready   (axi_sl_RREADY[0])
         ,.m_rvalid   (axi_sl_RVALID[0])
         ,.m_rresp    (axi_sl_RRESP[0])
         ,.m_rdata    (axi_sl_RDATA[0])
         ,.m_rid      ()
      
         //Write Address Channel
         ,.mo_awready  (axi_parser_sl_AWREADY)
         ,.mo_awvalid  (axi_parser_sl_AWVALID)
         ,.mo_awaddr   (axi_parser_sl_AWADDR)
         //Write Data Channel
         ,.mo_wready   (axi_parser_sl_WREADY)
         ,.mo_wvalid   (axi_parser_sl_WVALID)
         ,.mo_wstrb    (axi_parser_sl_WSTRB)
         ,.mo_wdata    (axi_parser_sl_WDATA)
         //Write Response Channel
         ,.mo_bready   (axi_parser_sl_BREADY)
         ,.mo_bvalid   (axi_parser_sl_BVALID)
         ,.mo_bresp    (axi_parser_sl_BRESP)
         //Read Address Channel
         ,.mo_arready  (axi_parser_sl_ARREADY)
         ,.mo_arvalid  (axi_parser_sl_ARVALID)
         ,.mo_araddr   (axi_parser_sl_ARADDR)
         ,.mo_arid     ()
         //Read Data Channel
         ,.mo_rready   (axi_parser_sl_RREADY)
         ,.mo_rvalid   (axi_parser_sl_RVALID)
         ,.mo_rresp    (axi_parser_sl_RRESP)
         ,.mo_rdata    (axi_parser_sl_RDATA)
         ,.mo_rid      ('0)
      );
   end

   if(NUM_OF_SEG == 1) begin : one_seg
      always_comb begin
         ready_lat_out  = axis_tready[0];
         axis_tvalid[0] = valid_lat_in;
         axis_tlast[0]  = pipe_sigs_lat_in.tlast;
         axis_tdata[0]  = pipe_sigs_lat_in.tdata;
         axis_tkeep[0]  = pipe_sigs_lat_in.tkeep;
         axis_tuser[0]  = pipe_sigs_lat_in.tuser;

         if(AXIS_DATA_LIT_ENDIAN_EN) begin
            pp_app_tuser_last_segment = {<<{axis_out_tuser[0].last_segment}};
         end else begin
            pp_app_tuser_last_segment = axis_out_tuser[0].last_segment;
         end

         pp_app_tid                   = axis_out_tuser[0].tid;
         pp_app_tuser_ppmetadata      = axis_out_tuser[0].ppmetadata;
         pp_app_tuser_usermetadata    = axis_out_tuser[0].usermetadata;
         pp_app_tx_tuser_ptp          = axis_out_tuser[0].ptp << 2;
         pp_app_tx_tuser_ptp[1:0]     = axis_out_tuser[0].ptp_na;
         pp_app_tx_tuser_ptp_extended = axis_out_tuser[0].ptp_extended;
         pp_app_tx_tuser_client       = axis_out_tuser[0].client;

         if_valid_f[0] = '1;
         if_num_f = '0;
      end

      always_ff@(posedge clk) begin
         if(~rst_n) begin
            ptp_axis_tvalid_r <= '0;
            ptp_axis_tlast_r  <= '0;
            pp_app_TVALID <= '0;
            pp_app_TLAST  <= '0;
         end else begin
            if(ready) begin
               ptp_axis_tvalid_r <= ptp_axis_tvalid[0];
               ptp_axis_tlast_r  <= ptp_axis_tlast[0];

               pp_app_TVALID <= ptp_axis_tvalid_r;
               pp_app_TLAST  <= ptp_axis_tlast_r;
            end
         end
      end

      always_ff@(posedge clk) begin
         if(ready) begin
            ptp_axis_tdata_r  <= ptp_axis_tdata[0];
            ptp_axis_tkeep_r  <= ptp_axis_tkeep[0];

            if(AXIS_DATA_LIT_ENDIAN_EN) begin
               pp_app_TDATA  <= {<<8{ptp_axis_tdata_r}};
               pp_app_TKEEP  <= {<<{ptp_axis_tkeep_r}};
            end else begin
               pp_app_TDATA  <= ptp_axis_tdata_r;
               pp_app_TKEEP  <= ptp_axis_tkeep_r;
            end
         end
      end

      always_ff@(posedge clk) begin
         if(~rst_n) begin
            o_ptp_pkt_recognized <= '0;
         end else begin
            if(ready) begin
               o_ptp_pkt_recognized <= packed_parser_result_pkt_recognized[0];
               ptp_axis_tuser_r <= ptp_axis_tuser;
            end
         end
      end

   end else begin : mult_segs

      logic [MPM_MODULE_LATENCY - 1:0] mpm_valid;

      always_ff@(posedge clk) begin
         if(~rst_n) begin
            mpm_valid <= '0;
         end else if(ready) begin
            mpm_valid[0] <= valid_lat_in;
            for(int i = 0; i < MPM_MODULE_LATENCY - 1; i++) begin
               mpm_valid[i+1] <= mpm_valid[i];
            end
         end
      end

      parameter_scfifo #(
          .ADDR_WIDTH        (5)
         ,.DATA_WIDTH        ($bits(pipe_sigs_t))
         ,.ALMOST_FULL_VALUE ()
         ,.RAM_BLOCK_TYPE    ("MLAB")
         ,.NUMBER_WORDS      ()
      ) mpm_data_fifo (
          .clock       (clk)
         ,.aclr        (~rst_n)
         ,.wrreq       (ready && valid_lat_in)
         ,.rdreq       (ready && mpm_valid[MPM_MODULE_LATENCY-2])
         ,.data        (pipe_sigs_lat_in)
         ,.almost_full ()
         ,.empty       ()
         ,.full        ()
         ,.q           (fifo_pipe_sigs)
         ,.usedw       ()
      );

      always_ff@(posedge clk) begin
         if(ready) begin
            fifo_pipe_sigs_r <= fifo_pipe_sigs;
         end
      end

      always_comb begin
         o_ptp_pkt_recognized = '0;
         axis_tuser           = '0;
         ptp_axis_tuser_r     = fifo_pipe_sigs.tuser;

         pp_app_TVALID                = mpm_valid[MPM_MODULE_LATENCY-1];
         pp_app_TLAST                 = fifo_pipe_sigs_r.tlast;
         if(AXIS_DATA_LIT_ENDIAN_EN) begin
            pp_app_TDATA              = {<<8{fifo_pipe_sigs_r.tdata}};
            pp_app_TKEEP              = {<<{fifo_pipe_sigs_r.tkeep}};
            pp_app_tuser_last_segment = {<<{fifo_pipe_sigs_r.tuser.last_segment}};
         end else begin
            pp_app_TDATA              = fifo_pipe_sigs_r.tdata;
            pp_app_TKEEP              = fifo_pipe_sigs_r.tkeep;
            pp_app_tuser_last_segment = fifo_pipe_sigs_r.tuser.last_segment;
         end
         pp_app_tid                   = fifo_pipe_sigs_r.tuser.tid;
         pp_app_tuser_ppmetadata      = fifo_pipe_sigs_r.tuser.ppmetadata;
         pp_app_tuser_usermetadata    = fifo_pipe_sigs_r.tuser.usermetadata;
         pp_app_tx_tuser_ptp          = axis_out_tuser[0].ptp << 2;
         pp_app_tx_tuser_ptp[1:0]     = axis_out_tuser[0].ptp_na;
         pp_app_tx_tuser_ptp_extended = axis_out_tuser[0].ptp_extended;
         pp_app_tx_tuser_client       = fifo_pipe_sigs_r.tuser.client;
      end

      from_axi_mpm_tran #(
          .LOG2_DATA_WIDTH  (LOG2_DATA_WIDTH)
         ,.NUM_OF_SEG       (NUM_OF_SEG)
         ,.DRV_IFS_NUM      (DRV_IFS_NUM)
         ,.MIN_PKT_BYTE_LEN (MIN_PKT_BYTE_LEN)
         ,.RESULT_IF_NUM    (RESULT_IF_NUM)
      ) from_axi_mpm_tran (
          .clk                            (clk)
         ,.rst                            (~rst_n)
         //AXIs sink/input
         ,.in_axis_mpm_TREADY             (ready_lat_out)
         ,.in_axis_mpm_TVALID             (valid_lat_in)
         ,.in_axis_mpm_TLAST              (pipe_sigs_lat_in.tlast)
         ,.in_axis_mpm_TDATA              (pipe_sigs_lat_in.tdata)
         ,.in_axis_mpm_TKEEP              (pipe_sigs_lat_in.tkeep)
         ,.in_axis_mpm_TUSER_last_segment (pipe_sigs_lat_in.tuser.last_segment)
         //out result if num
         ,.o_if_valid                     (if_valid)
         ,.o_if_num                       (if_num)
         //AXIs source/output
         ,.out_axis_TREADY                (axis_tready)
         ,.out_axis_TVALID                (axis_tvalid)
         ,.out_axis_TLAST                 (axis_tlast)
         ,.out_axis_TDATA                 (axis_tdata)
         ,.out_axis_TKEEP                 (axis_tkeep)
      );

      parameter_scfifo #(
          .ADDR_WIDTH        ()
         ,.DATA_WIDTH        (RESULT_IF_NUM + (RESULT_IF_NUM * DRV_IFS_NUM))
         ,.ALMOST_FULL_VALUE ()
         ,.RAM_BLOCK_TYPE    ("MLAB")
         ,.NUMBER_WORDS      (MPM_MODULE_LATENCY)
      ) if_num_fifo (
          .clock       (clk)
         ,.aclr        (~rst_n)
         ,.wrreq       (ready && |if_valid)
         ,.rdreq       (ready && parser_result_valid)
         ,.data        ({if_valid, if_num})
         ,.almost_full ()
         ,.empty       ()
         ,.full        ()
         ,.q           ({if_valid_f, if_num_f})
         ,.usedw       ()
      );

      always_ff@(posedge clk) begin
         for(int i = 0; i < DRV_IFS_NUM; i++) begin
            out_axis_tvalid[i] <= '0;
            if(ready) begin
               out_axis_tvalid[i] <= ptp_axis_tvalid[i];
               out_axis_tlast[i]  <= ptp_axis_tlast[i];
               out_axis_tdata[i]  <= {<<8{ptp_axis_tdata[i]}};
               out_axis_tkeep[i]  <= {<<{ptp_axis_tkeep[i]}};
            end
         end
      end

   end : mult_segs
   
   if(DRV_IFS_NUM == 1) begin
      always_comb begin
         axi_sl_AWREADY[0] = axi_parser_sl_AWREADY;
         axi_sl_WREADY[0]  = axi_parser_sl_WREADY;
         axi_sl_BVALID[0]  = axi_parser_sl_BVALID;
         axi_sl_BRESP[0]   = axi_parser_sl_BRESP;
         axi_sl_ARREADY[0] = axi_parser_sl_ARREADY;
         axi_sl_RVALID[0]  = axi_parser_sl_RVALID;
         axi_sl_RRESP[0]   = axi_parser_sl_RRESP;
         axi_sl_RDATA[0]   = axi_parser_sl_RDATA;
         
         axi_parser_sl_AWVALID   = axi_sl_AWVALID[0];
         axi_parser_sl_AWADDR   = axi_sl_AWADDR[0];
         axi_parser_sl_WVALID   = axi_sl_WVALID[0];
         axi_parser_sl_WSTRB   = axi_sl_WSTRB[0];
         axi_parser_sl_WDATA   = axi_sl_WDATA[0];
         axi_parser_sl_BREADY   = axi_sl_BREADY[0];
         axi_parser_sl_ARVALID   = axi_sl_ARVALID[0];
         axi_parser_sl_ARADDR   = axi_sl_ARADDR[0];
         axi_parser_sl_RREADY   = axi_sl_RREADY[0];
      end
   end

   for(genvar i = 0; i < DRV_IFS_NUM ; i++) begin : parser
      ptp_tx_adp_parser_wrapper #(
          .LOG2_DATA_WIDTH                (LOG2_DATA_WIDTH)
         ,.LOG2_EXTRACT_FIELD_BYTE_WIDTH  (LOG2_EXTRACT_FIELD_BYTE_WIDTH)
         ,.TUSER_WIDTH                    ($bits(tuser_sigs_t))
         ,.ENABLE_STATS_CNTRS             (ENABLE_STATS_CNTRS)
         ,.BASE_OFFSET                    (BASE_OFFSET)
         ,.IN_OFFSET_BYTE_WIDTH           (IN_OFFSET_BYTE_WIDTH)
         ,.AXIS_DATA_LIT_ENDIAN_EN        (0)
         ,.MEM_BASED_STATS_EN             (MEM_BASED_STATS_EN)
         ,.CONST_PARSER_LATENCY           (CONST_PARSER_LATENCY)
   	 ) gen_parser (
       	 .clk                            (clk)
         ,.rst_n                          (rst_n)
         ,.axi_sl_clk                     (axi_sl_clk)
         ,.axi_sl_rst_n                   (axi_sl_rst_n)
         ,.in_prev_offset                 (preamble_offset)
         //AXIs sink/input
         ,.in_axis_TREADY                 (axis_tready[i])
         ,.in_axis_TVALID                 (axis_tvalid[i])
         ,.in_axis_TLAST                  (axis_tlast[i])
         ,.in_axis_TDATA                  (axis_tdata[i])
         ,.in_axis_TKEEP                  (axis_tkeep[i])
         ,.in_axis_TUSER                  (axis_tuser[i])
         //AXIs source/output
         ,.out_axis_TREADY                (ready)
         ,.out_axis_TVALID                (ptp_axis_tvalid[i])
         ,.out_axis_TLAST                 (ptp_axis_tlast[i])
         ,.out_axis_TDATA                 (ptp_axis_tdata[i])
         ,.out_axis_TKEEP                 (ptp_axis_tkeep[i])
         ,.out_axis_TUSER                 (ptp_axis_tuser[i])
         //AXI slave Write Address Channel
         ,.axi_sl_AWREADY                 (axi_parser_sl_AWREADY[i])
         ,.axi_sl_AWVALID                 (axi_parser_sl_AWVALID[i])
         ,.axi_sl_AWADDR                  (axi_parser_sl_AWADDR [i])
         //AXI slave Write Data Channel
         ,.axi_sl_WREADY                  (axi_parser_sl_WREADY [i])
         ,.axi_sl_WVALID                  (axi_parser_sl_WVALID [i])
         ,.axi_sl_WSTRB                   (axi_parser_sl_WSTRB  [i])
         ,.axi_sl_WDATA                   (axi_parser_sl_WDATA  [i])
         //AXI slave Write Response Channel
         ,.axi_sl_BREADY                  (axi_parser_sl_BREADY [i])
         ,.axi_sl_BVALID                  (axi_parser_sl_BVALID [i])
         ,.axi_sl_BRESP                   (axi_parser_sl_BRESP  [i])
         //AXI slave Read Address Channel
         ,.axi_sl_ARREADY                 (axi_parser_sl_ARREADY[i])
         ,.axi_sl_ARVALID                 (axi_parser_sl_ARVALID[i])
         ,.axi_sl_ARADDR                  (axi_parser_sl_ARADDR [i])
         //AXI slave Read Data Channel
         ,.axi_sl_RREADY                  (axi_parser_sl_RREADY [i])
         ,.axi_sl_RVALID                  (axi_parser_sl_RVALID [i])
         ,.axi_sl_RRESP                   (axi_parser_sl_RRESP  [i])
         ,.axi_sl_RDATA                   (axi_parser_sl_RDATA  [i])
         //result
         ,.o_parser_result_valid          (parser_result_valid[i])
         ,.o_parser_result_pkt_recognized (parser_result_pkt_recognized[i])
         ,.o_parser_result_data           (parser_result_data[i])
         ,.o_parser_result_ext_data       (parser_result_ext_data[i])
      );
   end 

   if(MPM_DEBUG) begin : mpm_deb_on
      int deb_id = 0, deb_id_incr, prev_if = 0;

      always_ff@(posedge clk) begin
         if(ready) begin
            for(int i = prev_if; i < DRV_IFS_NUM; i++) begin
               if(parser_result_valid[i]) begin
                  prev_if <= i;
               end
            end

            for(int i = 0; i < prev_if; i++) begin
               if(parser_result_valid[i]) begin
                  prev_if <= i;
               end
            end
            deb_id <= deb_id + deb_id_incr;
         end
      end

      always_comb begin
         parser_result_ext_data_deb = '0;
         deb_id_incr = 0;
         for(int i = prev_if; i < DRV_IFS_NUM ; i++) begin
            if(parser_result_valid[i]) begin
               parser_result_ext_data_deb[i] = deb_id + deb_id_incr;
               ++deb_id_incr;
            end
         end

         for(int i = 0; i < prev_if; i++) begin
            if(parser_result_valid[i]) begin
               parser_result_ext_data_deb[i] = deb_id + deb_id_incr;
               ++deb_id_incr;
            end
         end
      end
   end else begin : mpm_deb_off
      always_comb begin
         parser_result_ext_data_deb = parser_result_ext_data;
      end
   end

   pack_parser_result #(
       .RESULT_IF_NUM      (RESULT_IF_NUM)
      ,.DRV_IFS_NUM        (DRV_IFS_NUM)
      ,.RESULT_NUM         (RESULT_NUM)
      ,.RESULT_LENGTH      (RESULT_LENGTH)
      ,.EXTRACT_CMD_NUM    (EXTRACT_CMD_NUM)
      ,.EXTRACT_FIELD_WIDTH(EXTRACT_FIELD_WIDTH)
   ) pack_parser_result (
       .clk                            (clk)
      ,.rst                            (~rst_n)
      //in if cmd
      ,.i_ready                        (ready)
      ,.i_if_num_valid                 (if_valid_f)
      ,.i_if_num                       (if_num_f)
      //parsers result in
      ,.i_parser_result_valid          (parser_result_valid)
      ,.i_parser_result_pkt_recognized (parser_result_pkt_recognized)
      ,.i_parser_result_data           (parser_result_data)
      ,.i_parser_result_ext_data       (parser_result_ext_data_deb)
      //packed parsers result out
      ,.o_parser_result_valid          (packed_parser_result_valid)
      ,.o_parser_result_pkt_recognized (packed_parser_result_pkt_recognized)
      ,.o_parser_result_data           (packed_parser_result_data)
      ,.o_parser_result_ext_data       (packed_parser_result_ext_data)
   );

   for(genvar i = 0; i < RESULT_IF_NUM; i++) begin : ptp_results
      ptp_result #(
          .LOG2_EXTRACT_FIELD_BYTE_WIDTH (LOG2_EXTRACT_FIELD_BYTE_WIDTH)
         ,.TID_WIDTH                     (TID_WIDTH)
         ,.NUM_OF_SEG                    (NUM_OF_SEG)
         ,.PPMETADATA_WIDTH              (PPMETADATA_WIDTH * NUM_OF_SOP)
         ,.USER_METADATA_WIDTH           (USER_METADATA_WIDTH * NUM_OF_SOP)
         ,.HSSI_TX_TUSER_CLIENT_WIDTH    (HSSI_TX_TUSER_CLIENT_WIDTH)
         ,.MPM_DEBUG                     (MPM_DEBUG)
      ) ptp_result (
          .clk                           (clk)
         ,.rst                           (~rst_n)
         //sink/input
         ,.in_ready                      (ready)
         ,.in_axis_tid                   (ptp_axis_tuser_r.tid)
         ,.in_axis_tuser_last_segment    (ptp_axis_tuser_r.last_segment)
         ,.in_axis_tuser_ppmetadata      (ptp_axis_tuser_r.ppmetadata)
         ,.in_axis_tuser_usermetadata    (ptp_axis_tuser_r.usermetadata)
         ,.in_axis_tx_tuser_ptp          (ptp_axis_tuser_r.ptp[i])
         ,.in_axis_tx_tuser_ptp_na       (ptp_axis_tuser_r.ptp_na)
         ,.in_axis_tx_tuser_ptp_extended (ptp_axis_tuser_r.ptp_extended[i])
         ,.in_axis_tx_tuser_client       (ptp_axis_tuser_r.client)
         ,.in_ptp_data                   ({16'b0, axil_ptp_data[((i*16)+16)-1 : (i*16)]})
         //parser's result
         ,.in_pars_valid                 (packed_parser_result_valid[i])
         ,.in_pars_pkt_recognized        (packed_parser_result_pkt_recognized[i])
         ,.in_pars_data                  (packed_parser_result_data[i])
         ,.in_pars_ext_data              (packed_parser_result_ext_data[i])
         //source/output
         ,.out_axis_tid                  (axis_out_tuser[i].tid)
         ,.out_axis_tuser_last_segment   (axis_out_tuser[i].last_segment)
         ,.out_axis_tuser_ppmetadata     (axis_out_tuser[i].ppmetadata)
         ,.out_axis_tuser_usermetadata   (axis_out_tuser[i].usermetadata)
         ,.out_axis_tx_tuser_ptp         (axis_out_tuser[0].ptp[i])
         ,.out_axis_tx_tuser_ptp_na      (axis_out_tuser[i].ptp_na)
         ,.out_axis_tx_tuser_ptp_extended(axis_out_tuser[0].ptp_extended[i])
         ,.out_axis_tx_tuser_client      (axis_out_tuser[i].client)
      );
   end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRjE5nfX9QMR/v3Hm5KbNLdYi9gPu7mbVLfjW+YB7lKCjvepCddzzDU6vLQvB9uJsEm/8+9fkvJgDtbMXg0Xi0cjlqVnaFl+d/PToyScJVC0d5Y5ttO16RxJv1zG5PjHF53xdeJ/5u7eplXa5ejWBKLMYPGsStYAxVzMeVv5BjKCSo70iBAZ3FY3zlK/7RT4JEnAUk9IgiO2yVEXTzS+feQQsuSktYNmz8VCTYF9skphOZhmxg1KjVMZsBm3VSvlT7Qr5aedzTQ3egcs0P4vV6yHnQJaocymaSiDB/xTXA27CcFraTCHASnCp71gTq45qD3AMsSMcARZvvmlyY9PfiiL5glXW1g2tWuQlM16xbdp/5ai3t88TfQ1xdTs0llP1YH7SeCKcUbSDy5Tbb0q9YYgM945+0Ls4KIWGzv8uEFGV5kQGO/HEePHmsMISIhFr+cJ2L5+TmYb8izmqPqm54MgYDg8j/z4o725flPwol5VsWqyL+s9nLM8bAaJfL9yEHifDwuJISzSr1t/e8Tjs/JrfT/9/dbJsbD5phFWdei2nlueOZJ83DJC7IsAPW7Vp6IeJF7eiYAgm6CVfDTu84MoR2/rReKbitHVxSJaIj12RinP7E0UJ78Ci7zhmwC/1LlCNjOR3P4T/TT9yJprHe0h3cP/ef+kVIkDZKWi37jyoXOli/a0J3kXaUc7YDrtThJ/fo7oPg/7Dcy1E1MkDITijsc/xrOBbMV/cSCNtSo0LnLvHkTwHH41K9q8FuEJdzL0VtLpm/CgGY8yg4mi4c/J"
`endif