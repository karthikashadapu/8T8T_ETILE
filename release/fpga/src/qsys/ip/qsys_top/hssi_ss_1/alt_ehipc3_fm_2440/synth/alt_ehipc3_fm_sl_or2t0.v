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
// 2 input OR gate.  Latency 0.

module alt_ehipc3_fm_sl_or2t0 #(
    parameter SIM_EMULATE = 1'b0
) (
    input [1:0] din,
    output dout
);

alt_ehipc3_fm_sl_lut6 t0 (.din({1'b0,1'b0,1'b0,1'b0,din}),.dout(dout));
defparam t0 .SIM_EMULATE = SIM_EMULATE;
defparam t0 .MASK = 64'hfffffffffffffffe;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B1ruawL+lahlP03sByw9jYnjcwSUXWZzA+0rpbrPnpdx3+uJCkr5DLjNqQlIC95zvbzDzq8f9opGLrI8NYW84++3n7wwys4aZaqbsxhjR7OCbkCgmtsBi7qONrJfnQ6DoQn3QLjy7fWoWNF2vlX8d9bykBgQysBhvVdXHxGrEMdbBziM5dhBNLXaPHhvmx9/DTUjCHmhaBBe1XEbAbYuQn2WHCcLf9HPtsDB+rMx8Wq3lcOKgDTrKd0+qMLxT96b7qGhh6gVdhHV9B9LuQ8uNL6W995cHATef5HKaolX42O/jc8AEGH7PPRklk03pcALqcJXWbp9LIcIFyhugSIzg6/ZOzpuFMuJQMZ+IS+IOTQAslNkVKd1k70krwTCTuAfor+oHmTswpSh6C9HpINr6UA2UDayGlxUOWYtIO2D0yjljiu+WeTOkSiI2jNbTqcjmfuVHDo7xkuLHIP+NwkfMhwoySKDfzfFN1Es2FF9QO2Br6Kr3IPZqQL5TM+K3NQsl/1EgyZJO43U8HE9qbxZJyccV886V4etS7rRzFb/S4/XtXKn3RVvN7Rl4dRNNVaVuX6DyUWcaX3sfIlKgCPOZ1b0MIyh/r7o6RF/oY5IzsBVUu+oCO8njk7S30BZEMnL17fUUc35bSjoKXbNUOREyBh6aXCO50G0wUSPxSdzHnkd8D2gGd1jp6yZpSZpY+1rfRVZAV33WHROqnJNbsSZ0UxToid1eynmsy24XkYiQkZa+NrNx1rR3K38UAz1bRp70I1wnlP3HO4e6d+QbJ+uqdK"
`endif