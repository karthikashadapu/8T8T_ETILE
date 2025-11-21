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
module  j204c_f_rx_tx_ip_intel_jesd204c_1_fifo_1927_ev3vpby  (
    aclr,
    data,
    rdclk,
    rdreq,
    wrclk,
    wrreq,
    eccstatus,
    q,
    rdempty,
    rdusedw,
    wrfull,
    wrusedw);

    input    aclr;
    input  [131:0]  data;
    input    rdclk;
    input    rdreq;
    input    wrclk;
    input    wrreq;
    output [1:0]  eccstatus;
    output [131:0]  q;
    output   rdempty;
    output [2:0]  rdusedw;
    output   wrfull;
    output [2:0]  wrusedw;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
    tri0     aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

    wire [1:0] sub_wire0;
    wire [131:0] sub_wire1;
    wire  sub_wire2;
    wire [2:0] sub_wire3;
    wire  sub_wire4;
    wire [2:0] sub_wire5;
    wire [1:0] eccstatus = sub_wire0[1:0];
    wire [131:0] q = sub_wire1[131:0];
    wire  rdempty = sub_wire2;
    wire [2:0] rdusedw = sub_wire3[2:0];
    wire  wrfull = sub_wire4;
    wire [2:0] wrusedw = sub_wire5[2:0];

    dcfifo  dcfifo_component (
                .aclr (aclr),
                .data (data),
                .rdclk (rdclk),
                .rdreq (rdreq),
                .wrclk (wrclk),
                .wrreq (wrreq),
                .eccstatus (sub_wire0),
                .q (sub_wire1),
                .rdempty (sub_wire2),
                .rdusedw (sub_wire3),
                .wrfull (sub_wire4),
                .wrusedw (sub_wire5),
                .rdfull (),
                .wrempty ());
    defparam
        dcfifo_component.enable_ecc  = "TRUE",
        dcfifo_component.intended_device_family  = "Agilex 7",
        dcfifo_component.lpm_hint  = "RAM_BLOCK_TYPE=M20K,MAXIMUM_DEPTH=128,DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE",
        dcfifo_component.lpm_numwords  = 8,
        dcfifo_component.lpm_showahead  = "OFF",
        dcfifo_component.lpm_type  = "dcfifo",
        dcfifo_component.lpm_width  = 132,
        dcfifo_component.lpm_widthu  = 3,
        dcfifo_component.overflow_checking  = "ON",
        dcfifo_component.rdsync_delaypipe  = 4,
        dcfifo_component.read_aclr_synch  = "ON",
        dcfifo_component.underflow_checking  = "ON",
        dcfifo_component.use_eab  = "ON",
        dcfifo_component.write_aclr_synch  = "ON",
        dcfifo_component.wrsync_delaypipe  = 4;


endmodule


