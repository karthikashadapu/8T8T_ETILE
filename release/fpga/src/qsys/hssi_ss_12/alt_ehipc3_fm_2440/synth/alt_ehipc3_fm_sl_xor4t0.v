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
// 4 input XOR gate.  Latency 0.

module alt_ehipc3_fm_sl_xor4t0 #(
    parameter SIM_EMULATE = 1'b0
) (
    input [3:0] din,
    output dout
);

alt_ehipc3_fm_sl_lut6 t0 (.din({1'b0,1'b0,din}),.dout(dout));
defparam t0 .SIM_EMULATE = SIM_EMULATE;
defparam t0 .MASK = 64'h6996966996696996;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B3PP6oaAuYaZUmzb3Z8HZHGVMa/69CXJxOqXogbtjjUzAn6ZUcRNYdI6Q9+XHvonRdBnD75EA4TSKClmL/AyZiwVFHoY5bkrpmcj0N1y66ZTkAIAabnUcvHXSYY+BTYckcD5Pp9+ReT65Nedqy4rYNrIWT/kcypJS5lNkxB48H8tm1yYMP6PggARJaMc4CbzH+uamr6Q1dBKcJH3fOubiUAN1f9tkZ54lSt/siMGnlzGainHsFeNuUoC7c7i7B78pCbOZMtvKDCGuXJ9PlkffZwyowpu5KT+qvio76EQJGL1kAzI+5MYpwgZm6CfD805bXE62XwQ2yIo9hdTxFWzLrOM9Syw4Cb4ed9Oonys2ek2iQAqkY5GcrELUB6HVBLTmOJFxMyfnm5FNHMto+l8DMsT168NUm9aj2yghbSsZjm9z/2tFTEzj2DFCxUPjO3nin3JWP2lSCRP9VVhNoeWCCHRDpFsxQ63qcwSimB5cq/hCOYHbWV6uH5RQK82r6p0FD/MlW5gRjolKJH20wnTZ5Z7Wlo4LV585tRqVO1oH+Hp4wo0lylNjgD4W+LIzhQonxmsyrACHnh5vzlBhsSzepOJkt6O7ffoXdp349zo8c+cMMsMuaEg4NU+L4si02kdZU/IDy6L7Y5xJ1AlcXNSr45LFC4mbytGM8BoL5Kp3Ug+/j9ymaUe4qrzuMRT5ZRG++TZscUFT6juHtWbtAkvL7tzZRx2WHnul67NWpe8j+hV76aJOTk/2NyJHGryQ1Tkj3A4tzyccb3YYyAGuu/LE/S"
`endif