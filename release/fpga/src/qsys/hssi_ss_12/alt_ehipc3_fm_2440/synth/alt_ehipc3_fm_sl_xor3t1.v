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
// 3 input XOR gate.  Latency 1.

module alt_ehipc3_fm_sl_xor3t1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [2:0] din,
    output dout
);

wire dout_w;
alt_ehipc3_fm_sl_xor3t0 c0 (
    .din(din),
    .dout(dout_w)
);
defparam c0 .SIM_EMULATE = SIM_EMULATE;

reg dout_r = 1'b0;
always @(posedge clk) dout_r <= dout_w;
assign dout = dout_r;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B3pM3sS6ewbjXvmXSgd8Re23Nb34jm7GMwTcGQiDcUsQt0Sj9LUAxpkz7yyKRKqvnguvPzYNlZhmRROEBorPlCFXK1s01M9hJnbyUWr9Q4B8UxAaKpuA11BtMIw10cDWk4MXaCTi/IIo6B/CFUIrIxnzajTc+/gGpthbX7tZInPeRU6/1pEckWSOSadr+YmcuOqk74yCFmVj3saEC2LxVDY0e0ywcGZ1FHwasIup6z9ckzSoQl8dodMsfcgM+oLCaeidMaYwWq6jSmtVa59y8qbqM81ES4O33lHMz2r3h5J7yX2o6BVGqk0To3yufYAj2o55yKtoregnWraKO9bht9GOSQTqgNeuIUKLBsY/dPGtmdTuW41/UVxIkH4yhvzJ0t0h2hTzStoh2/LBGLfVD7rZF5HnFcBcfvkH2k9Q8rR72nbB1b7x2VwcQIeB2DtWVINK7iMUYjP/MnzSRGQuN90VQvnkoowMCiVtOffIzBt8rcA92q5OSRFfJvGXRPuRmIZr5FREpwnPBD2d2I2EDhfb7kakOMHdYwld34Mx0MB3m3m6JqREnhoM3lzfpNxiZN4472FWHNem1ABj0L1/XHfIWpOK/IRE/Yq7ZlMh1OI5cCOpMoIKEI+yo9aHzTi2f9PF0lxyGX5ItkqdnkBQixA0R+1075NIkUb16Rb1UNk9yaN+4ColtC/H2b2N51Z/eHBxPR7DKeq/5wvIcFmWrFhRBmbV3Mgt9LT/WLw/SVFlPPYP1s9pupixtqmnkE4zLEa4AIywqyzR86vaAmJaexd"
`endif