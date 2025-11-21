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




`timescale 1ps/1ps

// DESCRIPTION
// 4 bit val == const(f) equality comparator.  Latency 1.

module alt_ehipc3_fm_sl_eqc4hft1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [3:0] din,
    output dout
);

wire dout_w;

alt_ehipc3_fm_sl_lut6 t0 (.din(6'h0 | din),.dout(dout_w));
defparam t0 .MASK = 64'h0000000000008000;
defparam t0 .SIM_EMULATE = SIM_EMULATE;

reg dout_r0 = 1'b0;
always @(posedge clk) dout_r0 <= dout_w;

assign dout = dout_r0;
endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B0x44J23RmIV8HjjXpkugpxTHMBGB/kBovtvCNCURVXdhyHj2dl31evxdERjajiWROb4TJ3ATUqvPxqXM1sojW6ohdPoH5oeJeXKNQkXJ/0ZJPl/438DNrgEp95X1UpngoCtzsNLd+ao5jdfKSYVI0s7rcDb1Se7Suz4Sc6WXygGnHaKRWvTxZ9YTEQbfQWPRNeTFoI1Ig9w/j5vJYBVKuIC8dLJmvNIjJz/dfczEJ7OznXca8mndkvJ20/gA17UTKvU02o1RicbVGFGt4rS7mDmMhSGLf9z1Mw6JAzW4wlUBfVII4gy5L6gqTZNhvgjllsyAdgO1BE0ajM51lZgtKPr1Jlgx7YwEWD/iANq1LSKbE1Ldm6abBaY5j2WUaF11hxOAYRq53awBRQRMnP5jx6qVEcXvaO4t29h9E2GyEdhOaXN6c4wGDC/aW/p9UhDhm+5FnrzR6Vn/x7DbpShiqhHXoFJ9zw7fZKPu4Fq2dvvX5w4S1ht6TJoAXE/4pi54JXwb10Nh2GTNZga0IiyW4Za1wCsvbBagq+ytLgUtzhosp4QmX1X1h4Ky8jX50JeEjkcmnC3QD3/Zbab9zJKn4evxC7hpWEghqTbxBH2hTkfEDDMwG00PoD9Bk5MHq1oRPinTiy1Pdnk6SOIDQKcxrDHRe2sezrNUA2qzScsum08ivA3ioHM8+8w69FDuNmhG1QYyHABEhw8F/fi0AOinjerHAJywzecdP9m3eIOOQQU/EkUMDwBFXuS3IVnokbBmvm58YsOBFkgnFMX1zCUTrC"
`endif