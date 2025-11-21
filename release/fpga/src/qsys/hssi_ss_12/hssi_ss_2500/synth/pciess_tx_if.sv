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


/* Author : Abu Bakar Ismail
 * Date   : 10 Sept 2020
 * Design objective: To translate AXI-S into AVST and supporting multiple packing scheme/format
 * Feature: Supports data width: 256, 512 or 1024
 *          Supports Data format: A10, S10 P Tile, S10 H Tile, R Tile
 */
module pciess_tx_if # (
        parameter DWIDTH          = 512,    // AXI-S dwidth
        parameter payload_width   = 512,    // default use 1x16 value - AVST
        parameter hdr_width       = 256,    //default use 1x16 value
        parameter pfx_width       = 32,     //default use 1x16 value
        parameter pcie_link_width = "x16",  // default 1x16 (other option 2x8 and 4x4)
        parameter double_width    = 2,      //default use 1x16 value
        parameter channel_width   = 8,
        parameter user_width      = 8,
        parameter empty_byte_width = 6, // 256 -5, 512 -6, 1024 - 7
        parameter error_width     = 2,
        parameter SS_DWIDTH       = 512,
        parameter SS_PWIDTH       = 32,
        parameter SS_SLOT_WD      = 5,
        parameter SS_PF_WD        = 3,
        parameter SS_VF_WD        = 11,
        parameter SEGMENT_SIZE    = 16, // 16 Bytes - 128 bit per segment, there will also be 32 B - 256 bits per segment
        parameter TILE            = "P-TILE",
        parameter FUNC_MODE       = "POWER_USER", // options: AXIST_DM, AXIMM_DM, POWER_SEP, DM_SEP, MM_SEP
        parameter axi_fifo_awidth = 3,  // 1024 - 2, 512 - 3, 256 -4 (fifo depth 2^awidth)
        parameter ST_readyLatency = 0,
        parameter Header_Packing_scheme = "Simple", // Simple, Variable, Compact
        parameter AVST_REVERSE_DATA_ORDERING = 0,
        parameter generic_converter = 0, // 0 - disable, 1 - enable
        parameter TX_TUSER_WIDTH    = (generic_converter == 0) ? 8 : (error_width+user_width)
       )
(
  input                           axi_st_clk,
  input                           coreclkout_hip,
  input                           axi_st_areset_n,
  input                           subsystem_warm_rst_n,
  input                           axi_lite_clk,
  input                           axi_lite_areset_n,
  // subsystem reset
  input                           subsystem_rst_req,
  output                          subsystem_rst_rdy,
  // AXI-S signals - input
  input                           app_ss_st_tx_tvalid,
  input   [DWIDTH - 1:0]          app_ss_st_tx_tdata,
  input   [DWIDTH/8 - 1:0]        app_ss_st_tx_tkeep,
  input                           app_ss_st_tx_tlast,
  input   [1:0]                   app_ss_st_tx_tuser_vendor,  // [1:0]: pu/dm modes
  input   [TX_TUSER_WIDTH - 1:0]  app_ss_st_tx_tuser,  // tlast segment
  input   [channel_width - 1:0]   app_ss_st_tx_tid,
  output                          app_ss_st_tx_tready,
  // DM signals 
  input   [SS_DWIDTH - 1:0]       ss_tx_st_data,
  input   [127:0]                 ss_tx_st_hdr, // AVST TLP header
  input                           ss_tx_st_valid,
  input                           ss_tx_st_sop,
  input                           ss_tx_st_eop,
  output                          ss_tx_st_ready,
  input   [SS_PWIDTH - 1:0]       ss_tx_st_prefix,
  input                           ss_tx_st_pvalid,
  //input   [4*double_width - 1:0]  ss_tx_st_bar_num,
  input   [SS_SLOT_WD - 1:0]      ss_tx_st_slot_num,
  input   [SS_PF_WD - 1:0]        ss_tx_st_pf_num,
  input   [SS_VF_WD - 1:0]        ss_tx_st_vf_num,
  input                           ss_tx_st_vf_active,
  // AVST signals
  input                           tx_st_ready,
  output  [double_width-1:0]      tx_st_valid,
  output  [double_width-1:0]      tx_st_sop,
  output  [double_width-1:0]      tx_st_eop,
  output  [empty_byte_width - 1:0] tx_st_empty,
  output  [channel_width - 1:0]   tx_st_channel,
  output  [user_width - 1:0]      tx_st_user,
  output  [error_width - 1:0]     tx_st_error,
  output  [payload_width - 1:0]   tx_st_data,
  output  [payload_width/8 - 1:0] tx_st_data_par,
  output  [hdr_width-1:0]         tx_st_hdr,   
  output  [hdr_width/8 -1:0]      tx_st_hdr_par,   
  output  [pfx_width-1:0]         tx_st_tlp_prfx,  
  output  [pfx_width/8 -1:0]      tx_st_tlp_prfx_par,
  output  [double_width*4-1:0]    tx_prfx_type_out,
  output                          tx_prfx_present_out,
  output  [SS_PF_WD-1:0]          tx_pf_number_out,
  output  [SS_VF_WD-1:0]          tx_vf_number_out,
  output                          tx_vf_active_out,
  output  [double_width*4-1:0]    tx_bar_number_out,
  output  [SS_SLOT_WD-1:0]        tx_slot_number_out,
  output                          tx_mm_mode,
// Performance Monitor
  input                           PERFMON_CTRL_global_enable,
  input                           PERFMON_CTRL_clear_counters,
  output                          we_TX_MRD_TLP_num,
  output [31:0]                   TX_MRD_TLP_num_i,
  input                           TX_MRD_TLP_num_clear,
  output                          we_TX_MWR_TLP_num,
  output [31:0]                   TX_MWR_TLP_num_i,
  input                           TX_MWR_TLP_num_clear,
  output                          we_TX_MSG_TLP_num,
  output [31:0]                   TX_MSG_TLP_num_i,
  input                           TX_MSG_TLP_num_clear,
  output                          we_TX_CFGWR_TLP_num,
  output [31:0]                   TX_CFGWR_TLP_num_i,
  input                           TX_CFGWR_TLP_num_clear,
  output                          we_TX_CFGRD_TLP_num,
  output [31:0]                   TX_CFGRD_TLP_num_i,
  input                           TX_CFGRD_TLP_num_clear,
  output                          we_TX_MEM_DATA_byte,
  output [31:0]                   TX_MEM_DATA_byte_i,
  input                           TX_MEM_DATA_byte_clear,
  output                          we_TX_CPL_DATA_byte,
  output [31:0]                   TX_CPL_DATA_byte_i,
  input                           TX_CPL_DATA_byte_clear,
  // Back Pressure cycle
  output                          we_HIA_TX_BP_CYCLES_count,
  input                           HIA_TX_BP_CYCLES_count_clear,
  output [30:0]                   HIA_TX_BP_CYCLES_count_i,
  input                           HIA_TX_BP_CYCLES_overflow_clear,
  output                          HIA_TX_BP_CYCLES_overflow,
  output                          we_DM_TX_BP_CYCLES_count,
  input                           DM_TX_BP_CYCLES_count_clear,
  output [30:0]                   DM_TX_BP_CYCLES_count_i,
  input                           DM_TX_BP_CYCLES_overflow_clear,
  output                          DM_TX_BP_CYCLES_overflow
);

generate
  if (generic_converter == 1)
  begin: generic_tx
    axis_avst_tx_adaptor #(
        .payload_width    ( payload_width ), 
        .channel_width    ( channel_width ),
        .user_width       ( user_width ),
        .empty_byte_width ( empty_byte_width ),
        .error_width      ( error_width ),
        .ST_readyLatency ( ST_readyLatency ),
        .AVST_REVERSE_DATA_ORDERING ( AVST_REVERSE_DATA_ORDERING ),
        .axi_fifo_awidth  ( axi_fifo_awidth )
    ) axis_avst_tx_adaptor_inst (
        .axi_st_clk ( axi_st_clk ),
        .coreclkout_hip ( coreclkout_hip ),
        .warm_rst_n ( subsystem_warm_rst_n ),
        .axi_st_areset_n ( axi_st_areset_n ),
        // AXI-S signals - input
        .app_ss_st_tx_tvalid ( app_ss_st_tx_tvalid ),
        .app_ss_st_tx_tdata ( app_ss_st_tx_tdata ),
        .app_ss_st_tx_tkeep ( app_ss_st_tx_tkeep ),
        .app_ss_st_tx_tlast ( app_ss_st_tx_tlast ),
        .app_ss_st_tx_tid ( app_ss_st_tx_tid ),
        .app_ss_st_tx_tuser ( app_ss_st_tx_tuser ),
        .app_ss_st_tx_tready ( app_ss_st_tx_tready ),
        // AVST signals - output
        .tx_st_ready ( tx_st_ready ),
        .tx_st_valid ( tx_st_valid ),
        .tx_st_sop ( tx_st_sop[0] ),
        .tx_st_eop ( tx_st_eop[0] ),
        .tx_st_empty ( tx_st_empty ),
        .tx_st_error ( tx_st_error ),
        .tx_st_channel ( tx_st_channel ),
        .tx_st_user ( tx_st_user ),
        .tx_st_data ( tx_st_data )
    );

    assign  tx_st_data_par = 0;
    assign  tx_st_hdr = 0;   
    assign  tx_st_hdr_par = 0;   
    assign  tx_st_tlp_prfx = 0;  
    assign  tx_st_tlp_prfx_par = 0;
    assign  tx_prfx_type_out = 0;
    assign  tx_prfx_present_out = 1'b0;
    assign  tx_pf_number_out = 0;
    assign  tx_vf_number_out = 0;
    assign  tx_vf_active_out = 1'b0;
    assign  tx_bar_number_out = 0;
    assign  tx_slot_number_out = 0;
    assign  tx_mm_mode = 1'b0;
    assign  subsystem_rst_rdy =1'b0;
  end
  else if (FUNC_MODE == "POWER_USER" || FUNC_MODE == "POWER_SEP")
  begin : pciess_tx_adaptor
    tx_adaptor #(
        .DWIDTH          ( DWIDTH          ),
        .payload_width   ( payload_width   ),
        .user_width      ( TX_TUSER_WIDTH  ),
        .hdr_width       ( hdr_width       ),
        .pfx_width       ( pfx_width       ),
        .pcie_link_width ( pcie_link_width ),
        .axi_fifo_awidth ( axi_fifo_awidth ),
        .ST_readyLatency ( ST_readyLatency ),
        .double_width    ( double_width    ),
        .SS_PWIDTH       ( SS_PWIDTH       ),
        .SS_SLOT_WD      ( SS_SLOT_WD      ),
        .SS_PF_WD        ( SS_PF_WD        ),
        .SS_VF_WD        ( SS_VF_WD        ),
        .SEGMENT_SIZE    ( SEGMENT_SIZE    ),
        .Header_Packing_scheme( Header_Packing_scheme),
        .TILE            ( TILE            )
    ) tx_adaptor_inst (
        .axi_st_clk ( axi_st_clk ),
        .coreclkout_hip ( coreclkout_hip ),
        .warm_rst_n ( subsystem_warm_rst_n ),
        .axi_st_areset_n ( axi_st_areset_n ),
        .axi_lite_clk ( axi_lite_clk ),
        .axi_lite_areset_n ( axi_lite_areset_n),
        .subsystem_rst_req ( subsystem_rst_req ),
        .subsystem_rst_rdy ( subsystem_rst_rdy ),
        // AXI-S signals - input
        .app_ss_st_tx_tvalid ( app_ss_st_tx_tvalid ),
        .app_ss_st_tx_tdata ( app_ss_st_tx_tdata ),
        .app_ss_st_tx_tkeep ( app_ss_st_tx_tkeep ),
        .app_ss_st_tx_tlast ( app_ss_st_tx_tlast ),
        .app_ss_st_tx_tuser_vendor ( app_ss_st_tx_tuser_vendor ), 
        .app_ss_st_tx_tuser ( app_ss_st_tx_tuser ), 
        .app_ss_st_tx_tready ( app_ss_st_tx_tready ),
        // AVST signals - output
        .tx_st_ready ( tx_st_ready ),
        .tx_st_valid ( tx_st_valid ),
        .tx_st_sop ( tx_st_sop ),
        .tx_st_eop ( tx_st_eop ),
        //.tx_st_empty ( tx_st_empty ),
        .tx_st_data ( tx_st_data ),
        .tx_st_data_par ( tx_st_data_par ),
        .tx_st_hdr ( tx_st_hdr ),
        .tx_st_hdr_par ( tx_st_hdr_par ),
        .tx_st_tlp_prfx ( tx_st_tlp_prfx ),
        .tx_st_tlp_prfx_par ( tx_st_tlp_prfx_par ),
        .tx_prfx_type_out ( tx_prfx_type_out ),
        .tx_prfx_present_out ( tx_prfx_present_out ),
        .tx_pf_number_out ( tx_pf_number_out ),
        .tx_vf_number_out ( tx_vf_number_out ),
        .tx_vf_active_out ( tx_vf_active_out ),
        .tx_bar_number_out ( tx_bar_number_out ),
        .tx_slot_number_out ( tx_slot_number_out ),
        .tx_mm_mode ( tx_mm_mode ),
        // Performance Monitor
        .PERFMON_CTRL_global_enable (PERFMON_CTRL_global_enable),
        .PERFMON_CTRL_clear_counters (PERFMON_CTRL_clear_counters),
        .we_TX_MRD_TLP_num (we_TX_MRD_TLP_num),
        .TX_MRD_TLP_num_i (TX_MRD_TLP_num_i),
        .TX_MRD_TLP_num_clear (TX_MRD_TLP_num_clear),
        .we_TX_MWR_TLP_num (we_TX_MWR_TLP_num),
        .TX_MWR_TLP_num_i (TX_MWR_TLP_num_i),
        .TX_MWR_TLP_num_clear (TX_MWR_TLP_num_clear),
        .we_TX_MSG_TLP_num (we_TX_MSG_TLP_num),
        .TX_MSG_TLP_num_i (TX_MSG_TLP_num_i),
        .TX_MSG_TLP_num_clear (TX_MSG_TLP_num_clear),
        .we_TX_CFGWR_TLP_num (we_TX_CFGWR_TLP_num),
        .TX_CFGWR_TLP_num_i (TX_CFGWR_TLP_num_i),
        .TX_CFGWR_TLP_num_clear (TX_CFGWR_TLP_num_clear),
        .we_TX_CFGRD_TLP_num (we_TX_CFGRD_TLP_num),
        .TX_CFGRD_TLP_num_i (TX_CFGRD_TLP_num_i),
        .TX_CFGRD_TLP_num_clear (TX_CFGRD_TLP_num_clear),
        .we_TX_MEM_DATA_byte (we_TX_MEM_DATA_byte),
        .TX_MEM_DATA_byte_i (TX_MEM_DATA_byte_i),
        .TX_MEM_DATA_byte_clear (TX_MEM_DATA_byte_clear),
        .we_TX_CPL_DATA_byte (we_TX_CPL_DATA_byte),
        .TX_CPL_DATA_byte_i (TX_CPL_DATA_byte_i),
        .TX_CPL_DATA_byte_clear (TX_CPL_DATA_byte_clear),
        // Back Pressure cycle
        .we_HIA_TX_BP_CYCLES_count (we_HIA_TX_BP_CYCLES_count),
        .HIA_TX_BP_CYCLES_count_clear (HIA_TX_BP_CYCLES_count_clear),
        .HIA_TX_BP_CYCLES_count_i (HIA_TX_BP_CYCLES_count_i),
        .HIA_TX_BP_CYCLES_overflow_clear (HIA_TX_BP_CYCLES_overflow_clear),
        .HIA_TX_BP_CYCLES_overflow (HIA_TX_BP_CYCLES_overflow),
        .we_DM_TX_BP_CYCLES_count (we_DM_TX_BP_CYCLES_count),
        .DM_TX_BP_CYCLES_count_clear (DM_TX_BP_CYCLES_count_clear),
        .DM_TX_BP_CYCLES_count_i (DM_TX_BP_CYCLES_count_i),
        .DM_TX_BP_CYCLES_overflow_clear (DM_TX_BP_CYCLES_overflow_clear),
        .DM_TX_BP_CYCLES_overflow (DM_TX_BP_CYCLES_overflow)
    );

    // Not used in this mode
    assign tx_st_empty = 0;
    assign tx_st_channel = 0;
    assign tx_st_user = 0;
    assign tx_st_error = 0;
    assign ss_tx_st_ready = 0;
  end
  else begin : pciess_tx_alignment
    wire  [4*double_width - 1:0] ss_tx_st_bar_num;  // AB??
    assign ss_tx_st_bar_num = 0;
    tx_alignment #(
        .payload_width  ( payload_width ), 
        .hdr_width      ( hdr_width     ),
        .double_width   ( double_width  ),
        .pfx_width      ( pfx_width     ),
        .pcie_link_width( pcie_link_width ),
        .SS_DWIDTH      ( SS_DWIDTH     ),
        .SS_PWIDTH      ( SS_PWIDTH     ),
        .SS_SLOT_WD     ( SS_SLOT_WD    ),
        .SS_PF_WD       ( SS_PF_WD      ),
        .SS_VF_WD       ( SS_VF_WD      ),
        .TILE           ( TILE          ) 
    ) tx_alignment_inst (
        .axi_st_clk     ( axi_st_clk      ),
        .coreclkout_hip ( coreclkout_hip  ),
        .warm_rst_n     ( subsystem_warm_rst_n ),
        .axi_st_areset_n ( axi_st_areset_n ),
        .axi_lite_clk       ( axi_lite_clk ),
        .axi_lite_areset_n  ( axi_lite_areset_n ),
        .subsystem_rst_req ( subsystem_rst_req ),
        .subsystem_rst_rdy ( subsystem_rst_rdy ),
        .ss_tx_st_data  ( ss_tx_st_data   ),
        .ss_tx_st_hdr   ( ss_tx_st_hdr    ),
        .ss_tx_st_valid ( ss_tx_st_valid  ),
        .ss_tx_st_sop   ( ss_tx_st_sop    ),
        .ss_tx_st_eop   ( ss_tx_st_eop    ),
        .ss_tx_st_ready ( ss_tx_st_ready  ),
        .ss_tx_st_prefix ( ss_tx_st_prefix ),
        .ss_tx_st_pvalid ( ss_tx_st_pvalid ),
        .ss_tx_st_bar_num ( ss_tx_st_bar_num ),
        .ss_tx_st_slot_num ( ss_tx_st_slot_num ),
        .ss_tx_st_pf_num ( ss_tx_st_pf_num ),
        .ss_tx_st_vf_num ( ss_tx_st_vf_num ),
        .ss_tx_st_vf_active ( ss_tx_st_vf_active ),
        .tx_st_ready    ( tx_st_ready     ),
        .tx_st_valid    ( tx_st_valid     ),
        .tx_st_data     ( tx_st_data      ),
        .tx_st_data_par ( tx_st_data_par  ),
        .tx_st_hdr      ( tx_st_hdr       ),
        .tx_st_hdr_par  ( tx_st_hdr_par   ),
        .tx_st_tlp_prfx ( tx_st_tlp_prfx  ),
        .tx_st_tlp_prfx_par ( tx_st_tlp_prfx_par ),
        .tx_st_tlp_pf_num   ( tx_pf_number_out ),
        .tx_st_tlp_vf_num  ( tx_vf_number_out ),
        .tx_st_tlp_vf_active ( tx_vf_active_out ),
        .tx_st_tlp_bar_num ( tx_bar_number_out ),
        .tx_st_tlp_slot_num ( tx_slot_number_out ),
        .tx_st_sop      ( tx_st_sop       ),
        .tx_st_eop      ( tx_st_eop       ),
        .mm_mode        ( tx_mm_mode     ), 
        // Performance Monitor
        .PERFMON_CTRL_global_enable (PERFMON_CTRL_global_enable),
        .PERFMON_CTRL_clear_counters (PERFMON_CTRL_clear_counters),
        .we_TX_MRD_TLP_num (we_TX_MRD_TLP_num),
        .TX_MRD_TLP_num_i (TX_MRD_TLP_num_i),
        .TX_MRD_TLP_num_clear (TX_MRD_TLP_num_clear),
        .we_TX_MWR_TLP_num (we_TX_MWR_TLP_num),
        .TX_MWR_TLP_num_i (TX_MWR_TLP_num_i),
        .TX_MWR_TLP_num_clear (TX_MWR_TLP_num_clear),
        .we_TX_MSG_TLP_num (we_TX_MSG_TLP_num),
        .TX_MSG_TLP_num_i (TX_MSG_TLP_num_i),
        .TX_MSG_TLP_num_clear (TX_MSG_TLP_num_clear),
        .we_TX_CFGWR_TLP_num (we_TX_CFGWR_TLP_num),
        .TX_CFGWR_TLP_num_i (TX_CFGWR_TLP_num_i),
        .TX_CFGWR_TLP_num_clear (TX_CFGWR_TLP_num_clear),
        .we_TX_CFGRD_TLP_num (we_TX_CFGRD_TLP_num),
        .TX_CFGRD_TLP_num_i (TX_CFGRD_TLP_num_i),
        .TX_CFGRD_TLP_num_clear (TX_CFGRD_TLP_num_clear),
        .we_TX_MEM_DATA_byte (we_TX_MEM_DATA_byte),
        .TX_MEM_DATA_byte_i (TX_MEM_DATA_byte_i),
        .TX_MEM_DATA_byte_clear (TX_MEM_DATA_byte_clear),
        .we_TX_CPL_DATA_byte (we_TX_CPL_DATA_byte),
        .TX_CPL_DATA_byte_i (TX_CPL_DATA_byte_i),
        .TX_CPL_DATA_byte_clear (TX_CPL_DATA_byte_clear),
        // Back Pressure cycle
        .we_HIA_TX_BP_CYCLES_count (we_HIA_TX_BP_CYCLES_count),
        .HIA_TX_BP_CYCLES_count_clear (HIA_TX_BP_CYCLES_count_clear),
        .HIA_TX_BP_CYCLES_count_i (HIA_TX_BP_CYCLES_count_i),
        .HIA_TX_BP_CYCLES_overflow_clear (HIA_TX_BP_CYCLES_overflow_clear),
        .HIA_TX_BP_CYCLES_overflow (HIA_TX_BP_CYCLES_overflow),
        .we_DM_TX_BP_CYCLES_count (we_DM_TX_BP_CYCLES_count),
        .DM_TX_BP_CYCLES_count_clear (DM_TX_BP_CYCLES_count_clear),
        .DM_TX_BP_CYCLES_count_i (DM_TX_BP_CYCLES_count_i),
        .DM_TX_BP_CYCLES_overflow_clear (DM_TX_BP_CYCLES_overflow_clear),
        .DM_TX_BP_CYCLES_overflow (DM_TX_BP_CYCLES_overflow)
    );

    // Not used in this mode
    //assign tx_mm_mode = 0;
    assign tx_st_empty = 0;
    assign tx_st_channel = 0;
    assign tx_st_user = 0;
    assign tx_st_error = 0;
    assign tx_prfx_type_out = 0;
    assign tx_prfx_present_out = 0;
    //assign tx_pf_number_out = 0;
    //assign tx_vf_number_out = 0;
    //assign tx_vf_active_out = 0;
    //assign tx_bar_number_out = 0;
    //assign tx_slot_number_out = 0;
    assign app_ss_st_tx_tready = 0;
  end
endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6yssdn5Aw4i9CIiMM81mLaCstsMYiMoBzC4r8DSohvysexu+1k+pAqQ8LSsNjRyI6nwh6lP/F8hzl4N5SXoZgEVPXc6YWYzajRIUu/GU104APPhnEHb9Yl1XDJClkgkZlAcA2q3PpS8xlT0sGCyWG72XwJnO4+x/lD5azIRYNrbhSxKM+HgyolR7j7QeT0DHLLxRsWb0hOrG2lHQr1TcLPQJZFwAHvLIGHQkeIiydg7xwKSQ3AbTWo8VK6yaIlKbLFeCmWG8o2fq5EGAO7gN6CiOELZU7w9V5tnHd8xcJV8a6VILJAoScHWdOScqi5Vijtxce0FKCgjAsCt781MwfmlAMTjq90qA1WAb5uZpnjHGp3c49SZJklx1sumgtH7ChUkkwErjudTJSPlofiFkYE/fZOazFgNt6ISaEsqBv+6OuuNOH95BTIWVMEvzW+JrbUUVbsYGpA3nfDyGazDm1ZLGiWmURB4cLbPsCeJDEmlyNbUOprlSLqmStgezrnLjGE7JwtttzCqlancUcSgPWSIyysS8GO2MI7THrSc6Qn8Y+BIsNgnkHab2e6jTDG6J5lciyHO0dtcBYXZ96l9ImVBveX96iGhv93o9vNVIl8HWBbuC0GIDWLMZjnmVyIxBzYEysQ/iuXxJmxz5j5mcptmCB4oAK1bvZTb6mmA9f6znlMlX1Fts2fXl3ZvkYCgtIZHNcYi3ag0dKIUc2ugOlokblAK1llmBxvJzuIFWFklZ9kem8Q3NyV2aEPEoAlhqe1DMX1DIhnPtRrtp9SQ7YvGo"
`endif