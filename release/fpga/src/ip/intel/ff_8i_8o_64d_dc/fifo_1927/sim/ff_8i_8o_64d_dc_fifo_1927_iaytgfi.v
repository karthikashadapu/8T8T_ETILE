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



// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module  ff_8i_8o_64d_dc_fifo_1927_iaytgfi  (
    data,
    rdclk,
    rdreq,
    wrclk,
    wrreq,
    q,
    rdempty,
    wrfull,
    wrusedw);

    input  [7:0]  data;
    input    rdclk;
    input    rdreq;
    input    wrclk;
    input    wrreq;
    output [7:0]  q;
    output   rdempty;
    output   wrfull;
    output [5:0]  wrusedw;

    wire [7:0] sub_wire0;
    wire  sub_wire1;
    wire  sub_wire2;
    wire [5:0] sub_wire3;
    wire [7:0] q = sub_wire0[7:0];
    wire  rdempty = sub_wire1;
    wire  wrfull = sub_wire2;
    wire [5:0] wrusedw = sub_wire3[5:0];

    dcfifo_mixed_widths  dcfifo_mixed_widths_component (
                .data (data),
                .rdclk (rdclk),
                .rdreq (rdreq),
                .wrclk (wrclk),
                .wrreq (wrreq),
                .q (sub_wire0),
                .rdempty (sub_wire1),
                .wrfull (sub_wire2),
                .wrusedw (sub_wire3),
                .aclr (1'b0),
                .eccstatus (),
                .rdfull (),
                .rdusedw (),
                .wrempty ());
    defparam
        dcfifo_mixed_widths_component.enable_ecc  = "FALSE",
        dcfifo_mixed_widths_component.intended_device_family  = "Agilex 7",
        dcfifo_mixed_widths_component.lpm_hint  = "DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE",
        dcfifo_mixed_widths_component.lpm_numwords  = 64,
        dcfifo_mixed_widths_component.lpm_showahead  = "ON",
        dcfifo_mixed_widths_component.lpm_type  = "dcfifo_mixed_widths",
        dcfifo_mixed_widths_component.lpm_width  = 8,
        dcfifo_mixed_widths_component.lpm_widthu  = 6,
        dcfifo_mixed_widths_component.lpm_widthu_r  = 6,
        dcfifo_mixed_widths_component.lpm_width_r  = 8,
        dcfifo_mixed_widths_component.overflow_checking  = "ON",
        dcfifo_mixed_widths_component.rdsync_delaypipe  = 5,
        dcfifo_mixed_widths_component.underflow_checking  = "ON",
        dcfifo_mixed_widths_component.use_eab  = "ON",
        dcfifo_mixed_widths_component.wrsync_delaypipe  = 5;


endmodule


