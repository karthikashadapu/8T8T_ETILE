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
// Equality compare of two 3 bit words.  Latency 1.

module alt_ehipc3_fm_sl_eq3t1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [2:0] dina,
    input [2:0] dinb,
    output dout
);

wire dout_w;
alt_ehipc3_fm_sl_eq3t0 eq0 (
    .dina(dina),
    .dinb(dinb),
    .dout(dout_w)
);

defparam eq0 .SIM_EMULATE = SIM_EMULATE;

reg dout_r = 1'b0;
always @(posedge clk) dout_r <= dout_w;
assign dout = dout_r;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B00eo0oEcYHkoYi3BOj9Q2Xi7Z4U2niViGzhuL0GlaV38HhG/gNqShmcadaZ1O4ud8L505+RvRPuin31Hv3mwiXSW3IDXp38csRAL86hU7uesinWoVQlR9GlSFGhj/vvxpjdD0FwYMT+S2f32Iv2XrjXODrWJdZaFQxjMc5HIb/KsC+mxiZZYiU2EeYKw4v7RLxVyrYl5RqST1VNImkrIgsRAG2yA8vtHBV/TF3jZjI9CuKUvRmvyIaLOYbTwTteWVkI6cjY+qB+Dxl7Z2iAWmGBCT45RrdXK6zGyadr40sPJKjLiSGezlvrUWHbqQDeMKRtXdb7NMaqchZHJtUQKm99MZiNm6KANp5m4WQL0H5cUCUvOIBqYZm7dYZ7Lnk3Qz7NcvQ632wMNftJPH8LHyKUB2U8d7gYoZFPxOPYRIIs2WDMDIO2qSfgMHIvBm1nTXQ84DtYYraLf1wE5tnfmql/uxNemhp3cHNq7lOTYn0keWmGY3/+8WRHamtBhi7KkLhohN8PQ/8HrpuuUoy/ZVUnyk1OxLoQcRZlYJyzrxByzodOm5elbvROP1HfIYewXThAtrZRXqlkJ6PKytBmimWWSFjmak0aiuEgP+UB0e/L0oaY8lbKlH2qYMC0gHLb8yeYxMQQnZFooqHdPffBZCFJO9p4L75QDUfWnBpMXlTxXjquENgqU+mxzJd9NzaQNEDWbiTCuh6/MZ1dUCGkENjxW9azqzArYqyKAyp10FwrXNkwgzvii9+s5qLAA+FnDaDlzUdwnbubxm/EnkTIRWH"
`endif