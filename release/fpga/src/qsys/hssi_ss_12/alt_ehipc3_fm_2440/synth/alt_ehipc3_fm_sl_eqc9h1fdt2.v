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
// 9 bit val == const(1fd) equality comparator.  Latency 2.

module alt_ehipc3_fm_sl_eqc9h1fdt2 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [8:0] din,
    output dout
);

wire [1:0] leaf;

alt_ehipc3_fm_sl_eqc5h1dt1 cmp0 (
    .clk(clk),
    .din(din[4:0]),
    .dout(leaf[0])
);
defparam cmp0 .SIM_EMULATE = SIM_EMULATE;

alt_ehipc3_fm_sl_eqc4hft1 cmp1 (
    .clk(clk),
    .din(din[8:5]),
    .dout(leaf[1])
);
defparam cmp1 .SIM_EMULATE = SIM_EMULATE;

alt_ehipc3_fm_sl_and2t1 c2 (
    .clk(clk),
    .din(leaf),
    .dout(dout)
);
defparam c2 .SIM_EMULATE = SIM_EMULATE;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B2WoRbFpsg8sxLe6rXO1uDIQKuxCnxcmq8tiYKYSynu6Kag4F1BalFZOB+yulCmqmUCFgGGLON5cG0KCfyLkGBhfHtSTfZHxOx6ls59tkfK9Eu7s5NJ9ItxGBIcVE41sfoAN+jFjqLnVTIfTdf4q2xNq3NBYotJpHFbCxKDKS6aLCWfyNiauOozSAdTI1HqURecYN0DmwmbJVDKoGN7gMcUw+H3LARUcTwEL6UdDka4Y2piFS67+Xs34nAP8GZakeOp1gImHA5FyqRrBCgtLCSaA01hOCkeb7ABSdC0lDKz/Ai1Sf/ZHMRjrCBKowt0WXFLNX4SDIZziZBoV5QrmgS/7LQgjvLNMYVsetly9MB7pglvhBz/jraK8kxlGzU1wZeSZOCTYJaJmUruHwlFOJ4pg/8wsO6Gkdp5dnHR0AXxRXGBojbOXPptqFEvnfMW1FeMeKEowGecxzrUX1KqBcF/wXlwREH+oV38+LJA46LAgug4dxuSzX48yx1DBc8BGqCxHoTfsETLlXSDj1SZC7rkU6cezdlZGy5b7/za7VloVge4SjT21+VXj7lqhLjzJCKPXIbSdvIZMcIx2vUYtTzEq2xEoEfs92QIALUVK9pzqzOWF0hhQug3MH5wROfEw/V5YT4Fz3HsxTNOPICl+snptH8iKXiLuc9tHWAgYwt3TQF1O7jaIVfzHZLftvyoCdLW6q+aeTB5JT03+FAHNc3tjbc5IrSo2nAN7l7bRp3fTdXlXv+hvRNGFDbhQsO181wxufOBAHIviiYkpkdTiKpI"
`endif