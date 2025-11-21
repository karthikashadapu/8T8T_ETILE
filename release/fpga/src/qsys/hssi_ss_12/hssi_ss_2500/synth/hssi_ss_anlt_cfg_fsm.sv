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


// ==========================================================================
// Project           : HSSI Subsystem 
// Module            : hssi_ss_ip_top.sv
// Description       : 
// Author            : Sibajit Patnaik
// Created           : 04-Aug-2020
// Description       : This file is the top level wrapper for all the ports with in the subsystem
//                   : this is wrapper of IP core and the datapath bridges
// ==========================================================================
// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module hssi_ss_anlt_cfg_fsm #(
  parameter NUM_CHANNELS      = 1, //Number of ethernet channels of QHIP
  parameter ANLT_REG_WRITE_EN = 0  //enable when to disable optimized serdes settings in 0xD0 
//  parameter ANLT_ENABLED      = 0, //ANLT enabled in the QHIP
//  parameter VSR_CONFIG_EN     = 0  //set when pma load recipe is enabled with VSR 
  ) (
    input  [NUM_CHANNELS-1:0]       rst_n, //csr rst from reset sequencer
    input                           clk,
    input  [NUM_CHANNELS-1:0]       i_tx_pll_locked,
    input  [NUM_CHANNELS-1:0]       i_cfg_fsm_disable, //from CSR to disable the FSM, per port

    input  [NUM_CHANNELS-1:0][11:0] i_axi_reconfig_address,
    input  [NUM_CHANNELS-1:0]       i_axi_reconfig_write,
    input  [NUM_CHANNELS-1:0][31:0] i_axi_reconfig_writedata,
    input  [NUM_CHANNELS-1:0]       i_axi_reconfig_read,
    output [NUM_CHANNELS-1:0][31:0] o_axi_reconfig_readdata,
    output [NUM_CHANNELS-1:0]       o_axi_reconfig_readdatavalid,
    output [NUM_CHANNELS-1:0]       o_axi_reconfig_waitrequest,

    output [NUM_CHANNELS-1:0][11:0] o_ehip_reconfig_address,
    output [NUM_CHANNELS-1:0]       o_ehip_reconfig_write,
    output [NUM_CHANNELS-1:0][31:0] o_ehip_reconfig_writedata,
    output [NUM_CHANNELS-1:0]       o_ehip_reconfig_read,
    input  [NUM_CHANNELS-1:0]       i_ehip_reconfig_readdatavalid,
    input  [NUM_CHANNELS-1:0][31:0] i_ehip_reconfig_readdata,
    input  [NUM_CHANNELS-1:0]       i_ehip_reconfig_waitrequest,

    output                          o_anlt_cfg_busy
  );

  //*******************************************************************************************
  reg  [NUM_CHANNELS-1:0] fsm_wr_enable;
  reg  [NUM_CHANNELS-1:0] fsm_wr_complete;
  reg  [NUM_CHANNELS-1:0] anlt_reg_wr_en;
  reg  [NUM_CHANNELS-1:0] soft_csr_rst;

  //*******************************************************************************************
  //if reset asserted in middle of fsm, then write will be aborted 
  //no need to check for current access completion from AXI lite as anlt written only after reset, so till fsm_wr_enable waitrequest to axi is stopped and kept any axi lite req on hold
  //check with CY -- that from reset to pll locked ehip access is blocked (till 0xd0 write)

  generate
  genvar i;
  for (i=0; i<NUM_CHANNELS; i=i+1)
  begin : ANLT_FSM


    always @(posedge clk or negedge rst_n[i])
    begin
      if(~rst_n[i])
      begin
        fsm_wr_enable[i]   <= 1'b0;
        fsm_wr_complete[i] <= 1'b0;
      end
      else if(i_cfg_fsm_disable[i]) //this is from CSR and default value is ANLT_REG_WRITE_EN
      begin
        fsm_wr_enable[i]   <= 1'b0;
        fsm_wr_complete[i] <= 1'b1;
      end
      else if(~i_ehip_reconfig_waitrequest[i] && anlt_reg_wr_en[i]) //write into ehip completed
      begin
        fsm_wr_enable[i]   <= 1'b0;
        fsm_wr_complete[i] <= 1'b1;
      end
      else if((ANLT_REG_WRITE_EN == 1) && ~fsm_wr_complete[i])
      //else if((ANLT_ENABLED == 1) && (VSR_CONFIG_EN == 1) && (ANLT_REG_WRITE_EN == 1) && ~fsm_wr_complete[i])
      begin
        fsm_wr_enable[i]   <= 1'b1;
        fsm_wr_complete[i] <= fsm_wr_complete[i]; 
      end
      //else if(soft_csr_rst_negedge_dly[i] && (ANLT_ENABLED == 1) && (VSR_CONFIG_EN == 1) && (ANLT_REG_WRITE_EN == 1))
      //begin
      //  fsm_wr_enable[i]   <= 1'b1;
      //  fsm_wr_complete[i] <= 1'b0;
      //end
      else //when completed/disabled
      begin
        fsm_wr_enable[i]   <= 1'b0;
        fsm_wr_complete[i] <= 1'b1;
      end
    end

    always @(posedge clk or negedge rst_n[i])
    begin
      if(~rst_n[i])
        anlt_reg_wr_en[i] <= 1'b0;
      else if(fsm_wr_enable[i] && i_tx_pll_locked[i])
      begin
        if(~i_ehip_reconfig_waitrequest[i] && anlt_reg_wr_en[i]) //waitrequest for the anlt reg
          anlt_reg_wr_en[i] <= 1'b0;
        else
          anlt_reg_wr_en[i] <= 1'b1;
      end
      else
        anlt_reg_wr_en[i] <= 1'b0;
    end

    assign o_ehip_reconfig_address[i]      = fsm_wr_enable[i] ? 12'hD0            : i_axi_reconfig_address[i];
    assign o_ehip_reconfig_write[i]        = fsm_wr_enable[i] ? anlt_reg_wr_en[i] : i_axi_reconfig_write[i];
    assign o_ehip_reconfig_writedata[i]    = fsm_wr_enable[i] ? 32'h000E_4A81     : i_axi_reconfig_writedata[i]; //TBD read-modify-write
    assign o_ehip_reconfig_read[i]         = fsm_wr_enable[i] ? 1'b0              : i_axi_reconfig_read[i];
    assign o_axi_reconfig_readdatavalid[i] = fsm_wr_enable[i] ? 1'h0              : i_ehip_reconfig_readdatavalid[i];
    assign o_axi_reconfig_readdata[i]      = fsm_wr_enable[i] ? 32'h0             : i_ehip_reconfig_readdata[i];
    assign o_axi_reconfig_waitrequest[i]   = fsm_wr_enable[i] ? 1'b1              : i_ehip_reconfig_waitrequest[i];

    always @(posedge clk or negedge rst_n[i])
    begin
      if(~rst_n[i])
        soft_csr_rst[i] <= 1'b0;
      else if(i_axi_reconfig_write[i] && (i_axi_reconfig_address[i] == 12'h310))
        soft_csr_rst[i] <= i_axi_reconfig_writedata[i][0];
    end

  end
  endgenerate

    assign o_anlt_cfg_busy = |fsm_wr_enable;


endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6ytcxdL6xe2kQiqxXSbkGzAdVAPpNzQgx/i1zdYQJ3MLmgheCpWeUPPRw/uJmYnfYrQlevYoW0gj7o4j2jhbKFlCiQuXCIALY/AzWYGWBAQjY1HmbQeCcEklsmdztldvkQ7/a9Y3o9zLkP5CNHpCdd0PMV1jS9NVn6hCdlh4HAyWaep6tfUGL08dpKE6zzUKc8JBOte5cv4DaY2yzVAMO2cxhag9eVh33yXO5HS/EUfkd00o6BjQABsIfPc7JxMX7XUjdA58jr4K40LvTMOX8YF5/0+lkR6rzl5W/zNPm+dq0EgVu5C3nPg1Q1vk6xDltwh1J6pIkzKVB6s8T1AvXNEPgXorpyt+/E9k99cScME9VZ6+k/hnEXzebegLetV+Uojx5pIuSH/T1yijkcEhSR6iDFZhd4O9yVoEPufzr1RcncVrGKZH8b6PzwiwoGxWuGRc2uVQpjraueKIhcT5NP9M+mH4HrucjMPSKeJsnnKPfWonbBvhRfT3U8Hz8y+ZmyzE7t/5NytVg7NF38GowmlFYJchJanegwOFKI0eKvSx8hqg9qjeFw9uy2WXn9XF/a/4rlLlZUy8Q0+BmQe/aQEA78brpB7SQ4wPxS6mmbMrOfKqV95bqlfQJWuqoJwwRIV8GdWJJ3+FmcGlyy1qarjaOtoxeZOCVrm8BL/NlBMJViSuAz11Gd8Dds7RogJqc8+eSfl9Tv/m3CiVng91fTVtRLpM/HhMDYktATiUkTagIBsCJ6qMH7oOqmSJUE9rMDs+wDRBji/0XuzQFGKYqjC8"
`endif