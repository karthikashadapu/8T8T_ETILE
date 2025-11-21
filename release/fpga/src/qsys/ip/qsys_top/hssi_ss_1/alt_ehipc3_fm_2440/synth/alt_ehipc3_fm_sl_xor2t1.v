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
// 2 input XOR gate.  Latency 1.

module alt_ehipc3_fm_sl_xor2t1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [1:0] din,
    output dout
);

wire dout_w;
alt_ehipc3_fm_sl_xor2t0 c0 (
    .din(din),
    .dout(dout_w)
);
defparam c0 .SIM_EMULATE = SIM_EMULATE;

reg dout_r = 1'b0;
always @(posedge clk) dout_r <= dout_w;
assign dout = dout_r;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B0J6KHiLctGxUrsgEcCWjbX0RhgAnKVA+A6YnUOsUG8s/gNUHB4OqqnFdh5L+BbiI8Zsk6jEZ/cEUcFao3LduzhfP4aa7wTV3xoddK2Eor54E0n0ONqf1lCmZRaF6UoX0Bb6E2gRLSztJMlCk/obvV9DIgwaiMqmyKGi/Xw8sgVbYWtICCliveAYx1OgevlG2EEySXhkmR79fjQ1WYyy0QUw74jNigzR104y51hIOz8ns32n8FXq0eewkNrXAl+dbGSD3g4OKpXmcyVdPgJxxYqTbQcMefKyMrd0HsZm/D9YeJYgP9YUJVY6rcqAeHSRbCsHTrjkHL10czzvJfal7Y0RouIXm2pDQQKJTU4K3U6ZG5a1vUiElmGDlCazic1c8KhXK+F9jDtmlvk9jt8L6Pt2pebpSLJo85B7erg70jtntw8oVuHOZuI1diN33W4UydK7auS6qdoZigFm6Yry3Esib19FUAXhqgK12zmkbf9UidHzlYvLfK68J89HmBEN5BWm/FZjL5uwWanqdEOD9BnN46tU8QzFyYku4ek+U73Mx+t3UlEfulGV1hZTfvny8+qru2J/Uy8jRAUeKMP+dbar7o1bB7J3aK+Knv/F7PVK8yzwnYLW8KSgcmk/mnJC2b2SKS1AyJPMyfBtk13Zj+frOMYgOOPjaCSxp4JRx7H8/iEzaYmwecDNt4CyalrRKj4RdBJ732tCaUBLea8eQ2N5vZhui/j7T2HOWd1ylP6l0ddB9wLMY5xZmJEqHCkzpt4qzW0QbVtENaMimzlFpi9"
`endif