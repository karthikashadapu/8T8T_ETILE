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


// (C) 2001-2020 Intel Corporation. All rights reserved.
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

module pciess_rx_if
#(
  parameter device_family                 = "Stratix 10",
  parameter TILE                          = "P-TILE",
  parameter FUNC_MODE                     = "POWER_USER",
  parameter pcie_link_width               = "x16",
  parameter Header_Packing_scheme         = "Simple",
  parameter axi_st_support_mode           = "Single Stream",
  parameter channel_width                 = 8,
  parameter user_width                    = 64,
  parameter error_width                   = 1,
  parameter empty_byte_width              = 6,
  parameter payload_width                 = 512,
  parameter hdr_width                     = 256,
  parameter pfx_width                     = 64,
  parameter double_width                  = 2,
  parameter empty_width                   = 6,
  parameter DWIDTH                        = 512,
  parameter SS_DWIDTH                     = 512,
  parameter SS_PWIDTH                     = 32,
  parameter SS_SLOT_WD                    = 5,
  parameter SS_PF_WD                      = 3,
  parameter SS_VF_WD                      = 11,
  parameter SS_EMPTY_WD                   = $clog2(SS_DWIDTH/32),
  parameter generic_converter             = 0,
  parameter AVST_REVERSE_DATA_ORDERING    = 0,
  parameter SEGMENT_SIZE                  = 16,
  parameter ST_readyLatency               = 0,
  parameter avst_fifo_awidth              = (TILE == "P-TILE") ? 6 : 3,
  parameter axi_fifo_awidth               = (TILE == "P-TILE") ? 4 : 3,

  parameter empty_w                       = (generic_converter == 0) ? empty_width : empty_byte_width,
  parameter tuser_w                       = (generic_converter == 0) ? 8 : (error_width+user_width)
)(
  //clock and reset
  input                                   coreclkout_hip,
  input                                   axi_st_clk,
  input                                   axi_lite_clk,
  input                                   warm_rst_n,
  input                                   axi_st_areset_n,
  input                                   axi_lite_areset_n,
  input                                   subsystem_rst_req,
  output                                  rx_rst_rdy,

  //AVST RX from QHIP
  input [double_width-1:0]                rx_st_sop_i,
  input [double_width-1:0]                rx_st_eop_i,
  input [double_width-1:0]                rx_st_valid_i,
  input [empty_w-1:0]                     rx_st_empty_i,
  input [double_width-1:0]                rx_st_vf_active_i,
  input [(3*double_width)-1:0]            rx_st_func_num_i,
  input [(11*double_width)-1:0]           rx_st_vf_num_i,
  input [(3*double_width)-1:0]            rx_st_bar_range_i,
  input [channel_width-1:0]               rx_st_channel_i,
  input [user_width-1:0]                  rx_st_user_i,
  input [error_width-1:0]                 rx_st_error_i,
  input [pfx_width-1:0]                   rx_st_tlp_prfx_i,
  input [pfx_width/8-1:0]                 rx_st_tlp_prfx_par_i,
  input [hdr_width-1:0]                   rx_st_hdr_i,
  input [hdr_width/8-1:0]                 rx_st_hdr_par_i,
  input [payload_width-1:0]               rx_st_data_i,
  input [payload_width/8-1:0]             rx_st_data_par_i,
  input [SS_SLOT_WD-1:0]                  rx_st_slot_num_i,
  output                                  rx_st_ready_o,

  //AVST RX to DM
  input                                   ss_rx_st_ready,
  output                                  ss_rx_st_valid,
  output                                  ss_rx_st_sop,
  output                                  ss_rx_st_eop,
  output [SS_DWIDTH-1:0]                  ss_rx_st_data,
  output [127:0]                          ss_rx_st_hdr,
  output [SS_PWIDTH-1:0]                  ss_rx_st_prefix,
  output                                  ss_rx_st_pvalid,
  output [2:0]                            ss_rx_st_bar_number,
  output [SS_SLOT_WD-1:0]                 ss_rx_st_slot_num,
  output [SS_PF_WD-1:0]                   ss_rx_st_pf_num,
  output [SS_VF_WD-1:0]                   ss_rx_st_vf_num,
  output                                  ss_rx_st_vf_active,
  output [SS_EMPTY_WD-1:0]                ss_rx_st_empty,
  output                                  ss_rx_passthrough,
  output                                  ss_rx_broadcast,

  //AXI ST RX to APP
  input                                   app_ss_st_rx_tready,
  output                                  ss_app_st_rx_tvalid,
  output                                  ss_app_st_rx_tlast,
  output [DWIDTH/8-1:0]                   ss_app_st_rx_par_chk,
  output [DWIDTH/8-1:0]                   ss_app_st_rx_tkeep,
  output [DWIDTH-1:0]                     ss_app_st_rx_tdata,
  output [channel_width-1:0]              ss_app_st_rx_tid,
  output [tuser_w-1:0]                    ss_app_st_rx_tuser,
  output [1:0]                            ss_app_st_rx_tuser_vendor,

  // Back Pressure cycle
  output                                  we_HIA_RX_BP_CYCLES_count,
  output [30:0]                           HIA_RX_BP_CYCLES_count_i,
  input                                   HIA_RX_BP_CYCLES_count_clear,
  output                                  HIA_RX_BP_CYCLES_overflow,
  input                                   HIA_RX_BP_CYCLES_overflow_clear,

  output                                  we_DM_RX_BP_CYCLES_count,
  output [30:0]                           DM_RX_BP_CYCLES_count_i,
  input                                   DM_RX_BP_CYCLES_count_clear,
  output                                  DM_RX_BP_CYCLES_overflow,
  input                                   DM_RX_BP_CYCLES_overflow_clear,

  // Performance monitoring
  input                                   PERFMON_CTRL_global_enable,
  input                                   PERFMON_CTRL_clear_counters,

  output                                  we_RX_MRD_TLP_num,
  output [31:0]                           RX_MRD_TLP_num_i,
  input                                   RX_MRD_TLP_num_clear,

  output                                  we_RX_MWR_TLP_num,
  output [31:0]                           RX_MWR_TLP_num_i,
  input                                   RX_MWR_TLP_num_clear,

  output                                  we_RX_MSG_TLP_num,
  output [31:0]                           RX_MSG_TLP_num_i,
  input                                   RX_MSG_TLP_num_clear,

  output                                  we_RX_CFGWR_TLP_num,
  output [31:0]                           RX_CFGWR_TLP_num_i,
  input                                   RX_CFGWR_TLP_num_clear,

  output                                  we_RX_CFGRD_TLP_num,
  output [31:0]                           RX_CFGRD_TLP_num_i,
  input                                   RX_CFGRD_TLP_num_clear,

  output                                  we_RX_MEM_DATA_byte,
  output [31:0]                           RX_MEM_DATA_byte_i,
  input                                   RX_MEM_DATA_byte_clear,

  output                                  we_RX_CPL_DATA_byte,
  output [31:0]                           RX_CPL_DATA_byte_i,
  input                                   RX_CPL_DATA_byte_clear
);
  generate
    if(generic_converter == 0) begin
      if((FUNC_MODE == "POWER_USER") || (FUNC_MODE == "POWER_SEP")) begin
        pciess_rx_adaptor
        #(.device_family		( device_family			),
          .TILE				( TILE				),
          .pcie_link_width		( pcie_link_width		),
          .Header_Packing_scheme	( Header_Packing_scheme		),
          .axi_st_support_mode		( axi_st_support_mode		),
          .payload_width		( payload_width			),
          .hdr_width			( hdr_width			),
          .pfx_width			( pfx_width			),
          .double_width			( double_width			),
          .empty_width			( empty_width			),
          .DWIDTH			( DWIDTH			),
          .SS_SLOT_WD			( SS_SLOT_WD			),
          .SEGMENT_SIZE			( SEGMENT_SIZE			),
          .avst_fifo_awidth		( avst_fifo_awidth		),
          .axi_fifo_awidth		( axi_fifo_awidth		)
        ) u_pciess_rx_adaptor (
          .coreclkout_hip		( coreclkout_hip		),
          .axi_st_clk			( axi_st_clk			),
          .axi_lite_clk			( axi_lite_clk			),
          .warm_rst_n			( warm_rst_n			),
          .axi_st_areset_n		( axi_st_areset_n		),
          .axi_lite_areset_n		( axi_lite_areset_n		),
          .subsystem_rst_req		( subsystem_rst_req		),
          .rx_rst_rdy			( rx_rst_rdy			),
          .rx_st_sop_i			( rx_st_sop_i			),
          .rx_st_eop_i			( rx_st_eop_i			),
          .rx_st_valid_i		( rx_st_valid_i			),
          .rx_st_empty_i		( rx_st_empty_i			),
          .rx_st_vf_active_i		( rx_st_vf_active_i		),
          .rx_st_func_num_i		( rx_st_func_num_i		),
          .rx_st_vf_num_i		( rx_st_vf_num_i		),
          .rx_st_bar_range_i		( rx_st_bar_range_i		),
          .rx_st_tlp_prfx_i		( rx_st_tlp_prfx_i		),
          .rx_st_tlp_prfx_par_i		( rx_st_tlp_prfx_par_i		),
          .rx_st_hdr_i			( rx_st_hdr_i			),
          .rx_st_hdr_par_i		( rx_st_hdr_par_i		),
          .rx_st_data_i			( rx_st_data_i			),
          .rx_st_data_par_i		( rx_st_data_par_i		),
          .rx_st_slot_num_i		( rx_st_slot_num_i		),
          .rx_st_ready_o		( rx_st_ready_o			),
          .app_ss_st_rx_tready		( app_ss_st_rx_tready		),
          .ss_app_st_rx_tvalid		( ss_app_st_rx_tvalid		),
          .ss_app_st_rx_tlast		( ss_app_st_rx_tlast		),
          .ss_app_st_rx_par_chk		( ss_app_st_rx_par_chk		),
          .ss_app_st_rx_tkeep		( ss_app_st_rx_tkeep		),
          .ss_app_st_rx_tdata		( ss_app_st_rx_tdata		),
          .ss_app_st_rx_tuser		( ss_app_st_rx_tuser		),
          .ss_app_st_rx_tuser_vendor	( ss_app_st_rx_tuser_vendor	),
          .we_HIA_RX_BP_CYCLES_count	( we_HIA_RX_BP_CYCLES_count	),
          .HIA_RX_BP_CYCLES_count	( HIA_RX_BP_CYCLES_count_i	),
          .HIA_RX_BP_CYCLES_count_clear ( HIA_RX_BP_CYCLES_count_clear	),
          .HIA_RX_BP_CYCLES_overflow	( HIA_RX_BP_CYCLES_overflow	),
          .HIA_RX_BP_CYCLES_overflow_clear(HIA_RX_BP_CYCLES_overflow_clear),
          .we_DM_RX_BP_CYCLES_count	( we_DM_RX_BP_CYCLES_count	),
          .DM_RX_BP_CYCLES_count	( DM_RX_BP_CYCLES_count_i	),
          .DM_RX_BP_CYCLES_count_clear	( DM_RX_BP_CYCLES_count_clear	),
          .DM_RX_BP_CYCLES_overflow	( DM_RX_BP_CYCLES_overflow	),
          .DM_RX_BP_CYCLES_overflow_clear(DM_RX_BP_CYCLES_overflow_clear),
          .PERFMON_CTRL_global_enable	( PERFMON_CTRL_global_enable	),
          .PERFMON_CTRL_clear_counters	( PERFMON_CTRL_clear_counters	),
          .we_RX_MRD_TLP_num		( we_RX_MRD_TLP_num		),
          .RX_MRD_TLP_num		( RX_MRD_TLP_num_i		),
          .RX_MRD_TLP_num_clear		( RX_MRD_TLP_num_clear		),
          .we_RX_MWR_TLP_num		( we_RX_MWR_TLP_num		),
          .RX_MWR_TLP_num		( RX_MWR_TLP_num_i		),
          .RX_MWR_TLP_num_clear		( RX_MWR_TLP_num_clear		),
          .we_RX_MSG_TLP_num		( we_RX_MSG_TLP_num		),
          .RX_MSG_TLP_num		( RX_MSG_TLP_num_i		),
          .RX_MSG_TLP_num_clear		( RX_MSG_TLP_num_clear		),
          .we_RX_CFGWR_TLP_num		( we_RX_CFGWR_TLP_num		),
          .RX_CFGWR_TLP_num		( RX_CFGWR_TLP_num_i		),
          .RX_CFGWR_TLP_num_clear	( RX_CFGWR_TLP_num_clear	),
          .we_RX_CFGRD_TLP_num		( we_RX_CFGRD_TLP_num		),
          .RX_CFGRD_TLP_num		( RX_CFGRD_TLP_num_i		),
          .RX_CFGRD_TLP_num_clear	( RX_CFGRD_TLP_num_clear	),
          .we_RX_MEM_DATA_byte		( we_RX_MEM_DATA_byte		),
          .RX_MEM_DATA_byte		( RX_MEM_DATA_byte_i		),
          .RX_MEM_DATA_byte_clear	( RX_MEM_DATA_byte_clear	),
          .we_RX_CPL_DATA_byte		( we_RX_CPL_DATA_byte		),
          .RX_CPL_DATA_byte		( RX_CPL_DATA_byte_i		),
          .RX_CPL_DATA_byte_clear	( RX_CPL_DATA_byte_clear	)
        );
        assign ss_app_st_rx_tid           = 'b0;
        assign ss_rx_st_valid             = 'b0;
        assign ss_rx_st_sop               = 'b0;
        assign ss_rx_st_eop               = 'b0;
        assign ss_rx_st_data              = 'b0;
        assign ss_rx_st_hdr               = 'b0;
        assign ss_rx_st_prefix            = 'b0;
        assign ss_rx_st_pvalid            = 'b0;
        assign ss_rx_st_bar_number        = 'b0;
        assign ss_rx_st_slot_num          = 'b0;
        assign ss_rx_st_pf_num            = 'b0;
        assign ss_rx_st_vf_num            = 'b0;
        assign ss_rx_st_vf_active         = 'b0;
        assign ss_rx_st_empty             = 'b0;
        assign ss_rx_passthrough          = 'b0;
        assign ss_rx_broadcast            = 'b0;
      end // if((FUNC_MODE == "POWER_USER") || (FUNC_MODE == "POWER_SEP"))
      else begin
        pciess_rx_alignment
        #(.device_family		( device_family			),
          .TILE				( TILE				),
          .pcie_link_width		( pcie_link_width		),
          .payload_width		( payload_width			),
          .hdr_width			( hdr_width			),
          .pfx_width			( pfx_width			),
          .double_width			( double_width			),
          .empty_width			( empty_width			),
          .SS_DWIDTH			( SS_DWIDTH			),
          .SS_PWIDTH			( SS_PWIDTH			),
          .SS_SLOT_WD			( SS_SLOT_WD			),
          .SS_PF_WD			( SS_PF_WD			),
          .SS_VF_WD			( SS_VF_WD			),
          .SS_EMPTY_WD			( SS_EMPTY_WD			),
          .avst_fifo_awidth		( avst_fifo_awidth		),
          .axi_fifo_awidth		( axi_fifo_awidth		)
        ) u_pciess_rx_alignment (
          .coreclkout_hip		( coreclkout_hip		),
          .axi_st_clk			( axi_st_clk			),
          .axi_lite_clk			( axi_lite_clk			),
          .warm_rst_n			( warm_rst_n			),
          .axi_st_areset_n		( axi_st_areset_n		),
          .axi_lite_areset_n		( axi_lite_areset_n		),
          .subsystem_rst_req		( subsystem_rst_req		),
          .rx_rst_rdy			( rx_rst_rdy			),
          .rx_st_sop_i			( rx_st_sop_i			),
          .rx_st_eop_i			( rx_st_eop_i			),
          .rx_st_valid_i		( rx_st_valid_i			),
          .rx_st_empty_i		( rx_st_empty_i			),
          .rx_st_vf_active_i		( rx_st_vf_active_i		),
          .rx_st_func_num_i		( rx_st_func_num_i		),
          .rx_st_vf_num_i		( rx_st_vf_num_i		),
          .rx_st_bar_range_i		( rx_st_bar_range_i		),
          .rx_st_tlp_prfx_i		( rx_st_tlp_prfx_i		),
          .rx_st_hdr_i			( rx_st_hdr_i			),
          .rx_st_data_i			( rx_st_data_i			),
          .rx_st_slot_num_i		( rx_st_slot_num_i		),
          .rx_st_ready_o		( rx_st_ready_o			),
          .ss_rx_st_ready		( ss_rx_st_ready		),
          .ss_rx_st_valid		( ss_rx_st_valid		),
          .ss_rx_st_sop			( ss_rx_st_sop			),
          .ss_rx_st_eop			( ss_rx_st_eop			),
          .ss_rx_st_data		( ss_rx_st_data			),
          .ss_rx_st_hdr			( ss_rx_st_hdr			),
          .ss_rx_st_prfx		( ss_rx_st_prefix		),
          .ss_rx_st_pvalid		( ss_rx_st_pvalid		),
          .ss_rx_st_bar_num		( ss_rx_st_bar_number		),
          .ss_rx_st_slot_num		( ss_rx_st_slot_num		),
          .ss_rx_st_pf_num		( ss_rx_st_pf_num		),
          .ss_rx_st_vf_num		( ss_rx_st_vf_num		),
          .ss_rx_st_vf_active		( ss_rx_st_vf_active		),
          .ss_rx_st_empty		( ss_rx_st_empty		),
          .we_HIA_RX_BP_CYCLES_count	( we_HIA_RX_BP_CYCLES_count	),
          .HIA_RX_BP_CYCLES_count	( HIA_RX_BP_CYCLES_count_i	),
          .HIA_RX_BP_CYCLES_count_clear ( HIA_RX_BP_CYCLES_count_clear	),
          .HIA_RX_BP_CYCLES_overflow	( HIA_RX_BP_CYCLES_overflow	),
          .HIA_RX_BP_CYCLES_overflow_clear(HIA_RX_BP_CYCLES_overflow_clear),
          .we_DM_RX_BP_CYCLES_count	( we_DM_RX_BP_CYCLES_count	),
          .DM_RX_BP_CYCLES_count	( DM_RX_BP_CYCLES_count_i	),
          .DM_RX_BP_CYCLES_count_clear	( DM_RX_BP_CYCLES_count_clear	),
          .DM_RX_BP_CYCLES_overflow	( DM_RX_BP_CYCLES_overflow	),
          .DM_RX_BP_CYCLES_overflow_clear(DM_RX_BP_CYCLES_overflow_clear),
          .PERFMON_CTRL_global_enable	( PERFMON_CTRL_global_enable	),
          .PERFMON_CTRL_clear_counters	( PERFMON_CTRL_clear_counters	),
          .we_RX_MRD_TLP_num		( we_RX_MRD_TLP_num		),
          .RX_MRD_TLP_num		( RX_MRD_TLP_num_i		),
          .RX_MRD_TLP_num_clear		( RX_MRD_TLP_num_clear		),
          .we_RX_MWR_TLP_num		( we_RX_MWR_TLP_num		),
          .RX_MWR_TLP_num		( RX_MWR_TLP_num_i		),
          .RX_MWR_TLP_num_clear		( RX_MWR_TLP_num_clear		),
          .we_RX_MSG_TLP_num		( we_RX_MSG_TLP_num		),
          .RX_MSG_TLP_num		( RX_MSG_TLP_num_i		),
          .RX_MSG_TLP_num_clear		( RX_MSG_TLP_num_clear		),
          .we_RX_CFGWR_TLP_num		( we_RX_CFGWR_TLP_num		),
          .RX_CFGWR_TLP_num		( RX_CFGWR_TLP_num_i		),
          .RX_CFGWR_TLP_num_clear	( RX_CFGWR_TLP_num_clear	),
          .we_RX_CFGRD_TLP_num		( we_RX_CFGRD_TLP_num		),
          .RX_CFGRD_TLP_num		( RX_CFGRD_TLP_num_i		),
          .RX_CFGRD_TLP_num_clear	( RX_CFGRD_TLP_num_clear	),
          .we_RX_MEM_DATA_byte		( we_RX_MEM_DATA_byte		),
          .RX_MEM_DATA_byte		( RX_MEM_DATA_byte_i		),
          .RX_MEM_DATA_byte_clear	( RX_MEM_DATA_byte_clear	),
          .we_RX_CPL_DATA_byte		( we_RX_CPL_DATA_byte		),
          .RX_CPL_DATA_byte		( RX_CPL_DATA_byte_i		),
          .RX_CPL_DATA_byte_clear	( RX_CPL_DATA_byte_clear	)
        );
        assign ss_app_st_rx_tid           = 'b0;
        assign ss_app_st_rx_tvalid        = 'b0;
        assign ss_app_st_rx_tlast         = 'b0;
        assign ss_app_st_rx_par_chk       = 'b0;
        assign ss_app_st_rx_tkeep         = 'b0;
        assign ss_app_st_rx_tdata         = 'b0;
        assign ss_app_st_rx_tuser         = 'b0;
        assign ss_app_st_rx_tuser_vendor  = 'b0;
        assign ss_rx_passthrough          = 'b0;
        assign ss_rx_broadcast            = 'b0;
      end
    end // if(generic_converter == 0)
    else begin
      pciess_rx_converter
      #(.channel_width                  ( channel_width			),
        .user_width			( user_width			),
        .error_width			( error_width			),
        .empty_byte_width		( empty_byte_width		),
        .payload_width			( payload_width			),
        .fifo_awidth			( axi_fifo_awidth		),
        .AVST_REVERSE_DATA_ORDERING	( AVST_REVERSE_DATA_ORDERING	)
      ) u_pciess_rx_converter (
        .avst_clk			( coreclkout_hip		),
        .axi_st_clk			( axi_st_clk			),
        .axi_st_areset_n		( axi_st_areset_n		),
        .avst_sop_i			( rx_st_sop_i			),
        .avst_eop_i			( rx_st_eop_i			),
        .avst_valid_i			( rx_st_valid_i			),
        .avst_channel_i                 ( rx_st_channel_i		),
        .avst_user_i			( rx_st_user_i			),
        .avst_error_i			( rx_st_error_i			),
        .avst_empty_i			( rx_st_empty_i			),
        .avst_data_i			( rx_st_data_i			),
        .avst_ready_o			( rx_st_ready_o			),
        .axi_st_tready_i		( app_ss_st_rx_tready		),
        .axi_st_tlast_o			( ss_app_st_rx_tlast		),
        .axi_st_tvalid_o		( ss_app_st_rx_tvalid		),
        .axi_st_tid_o                   ( ss_app_st_rx_tid              ),
        .axi_st_tuser_o                 ( ss_app_st_rx_tuser            ),
        .axi_st_tkeep_o			( ss_app_st_rx_tkeep		),
        .axi_st_tdata_o			( ss_app_st_rx_tdata		)
      );
      assign rx_rst_rdy                   = 'b0;
      assign ss_app_st_rx_par_chk         = 'b0;
      assign ss_app_st_rx_tuser_vendor    = 'b0;
      assign ss_rx_st_sop                 = 'b0;
      assign ss_rx_st_eop                 = 'b0;
      assign ss_rx_st_data                = 'b0;
      assign ss_rx_st_hdr                 = 'b0;
      assign ss_rx_st_prefix              = 'b0;
      assign ss_rx_st_pvalid              = 'b0;
      assign ss_rx_st_bar_number          = 'b0;
      assign ss_rx_st_slot_num            = 'b0;
      assign ss_rx_st_pf_num              = 'b0;
      assign ss_rx_st_vf_num              = 'b0;
      assign ss_rx_st_vf_active           = 'b0;
      assign ss_rx_st_empty               = 'b0;
      assign ss_rx_passthrough            = 'b0;
      assign ss_rx_broadcast              = 'b0;
      assign we_HIA_RX_BP_CYCLES_count    = 'b0;
      assign HIA_RX_BP_CYCLES_count       = 'b0;
      assign HIA_RX_BP_CYCLES_overflow    = 'b0;
      assign we_DM_RX_BP_CYCLES_count     = 'b0;
      assign DM_RX_BP_CYCLES_count        = 'b0;
      assign DM_RX_BP_CYCLES_overflow     = 'b0;
      assign we_RX_MRD_TLP_num            = 'b0;
      assign RX_MRD_TLP_num               = 'b0;
      assign we_RX_MWR_TLP_num            = 'b0;
      assign RX_MWR_TLP_num               = 'b0;
      assign we_RX_MSG_TLP_num            = 'b0;
      assign RX_MSG_TLP_num               = 'b0;
      assign we_RX_CFGWR_TLP_num          = 'b0;
      assign RX_CFGWR_TLP_num             = 'b0;
      assign we_RX_CFGRD_TLP_num          = 'b0;
      assign RX_CFGRD_TLP_num             = 'b0;
      assign we_RX_MEM_DATA_byte          = 'b0;
      assign RX_MEM_DATA_byte             = 'b0;
      assign we_RX_CPL_DATA_byte          = 'b0;
      assign RX_CPL_DATA_byte             = 'b0;
    end
  endgenerate
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6yub8t7Z5CdTCk25hPTauYL7zdkJK32g5L/ijVLFDZQESaNnklPq5UnO/qZnbrlbzvGt1OvkWq55nWxe+hO7vgim/XNr2wdGwp5WiBjUjVHQunu+NBuIfDm/RjHxBdPEz3fcboPVgU+4NoZ+aMHy4z8QsV+CZJtb2SKCmklEICfmWcrVPcrBDNAeWM3zNMJYzksXbBjLm9Y+j5vnvvm0X9Mgtj4+cqJNU4WAvSwIW6cp205+84YDikqESDUbbZig2LmOsAaHdQCr0nMFkq96j2YqselnuElvbBM2esrk7qJOlCbGKT3y8GtAHyQUVl0nAf8Czb6Oux2WSOKD2egkT+k186GshVnQ/RrD9b9pfnicbYtE4T/6AX42I3Zyi3/+UfCfZ1XnUBfB1Oq04kfAmKuzKGrQrgMC1nBNCLohQ2nVVMugKR4fZvA0ejS6O+Ocr9SNWG9cyZFohjPLb5AsMbxaaE+SAZJtf2nv874iu2p9pKBpX8U1ai1xKhgSWC9ygiOLWg4a1GTvBdpOeIfeDgGm5Ok3xWE5sPOe1l6lZ3N3HYSWjy/iPe1vdpj0vi8hBfgAtUd2TTRv9tIMx44PzZEr5RlOLF81QzCEq9vCgnEPPg0ixo99+nP+FpYBuew/CPAPmKfOUZxOyn3TfzBcZJ8zT0RU48nX2k191/ZYLUBnpQ5Ad0d2F9hlwfCx75aipYoFbA9F51pYE1pxh+3WnSwj6SFVz3vyQLImffd2L4YQFnZdYLCjkwkeGJbKm7LLO/vxj/vRDOK/OLWt4HhrjaOz"
`endif