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
// 3 input XOR gate.  Latency 0.

module alt_ehipc3_fm_sl_xor3t0 #(
    parameter SIM_EMULATE = 1'b0
) (
    input [2:0] din,
    output dout
);

alt_ehipc3_fm_sl_lut6 t0 (.din({1'b0,1'b0,1'b0,din}),.dout(dout));
defparam t0 .SIM_EMULATE = SIM_EMULATE;
defparam t0 .MASK = 64'h6996966996696996;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B0yuHRtA7AFKVcwvoUNt2uJZLqqv4/DemFL1ptlcEyjQYKxF9cAGvlwuc4vMmgvU5XsE5kCwGBVZFfzqEqMjNe526tHvbDOML4A7fs69nJ1LD9sMMT357NKf4oUb+yoo43ZXKqBMxxKBcVFLNGIdI6RaO8q1I9AU9iVb9dF4cnoyPW5KHOYezmtjK20VFmpV8WHR0E0rWDFh20/UTbsqDcFg+iPD/iciI1GBqDuub82lTeU4/8HQ+89TaRZQySmN1rhSIlQOPtlA0yTpUo5d3JIaJel3ivA9eMNV/szAK9cp9eY9cOWAPU2gknr8q85gW2/FQSifmgunR2lVnUv7P0+Q8Gm9tGd8WX/KhclilFIBmHE4HpnqHaKkMHp+GFU8lK2g+BM226atTdbMRFt/y5Ti6xEJ0etxBGcAkCisiRpQaOXSMrjQ6mkGbhPjEp4AUVlZ5VqVF9baJ5JjZCNYgoNmOfs7pudb62a/ls9qS8FTRJ7rxy3jxEKfXvWYxTaMoPWLI0u5K43PnUOWo8D9ppzO4yWHGzGEBpPn73JtoVZedgtX8oUwPLGtFTilfmyqILorh3clEH9/Tr1ThokkOR5L9WSFq/fnPheL5DOE1B4BmfgpdojpWryolkLnNwGdX0oHAel3+hCutZZG6GN6IoFD6uPApUi5/lfjYsaH0TueHZEfxEUVjET0GsBSd6Uh64jwLUcLTLA5Otvnw/t+yqMBwxoCv/+CbNc/zyRT3WtF+41zQWmbg4Q1l41dq/Pd2otOc+pWTcebCEx//XHES9w"
`endif