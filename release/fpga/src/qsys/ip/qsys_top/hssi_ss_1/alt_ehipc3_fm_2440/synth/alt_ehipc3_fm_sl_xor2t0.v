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
// 2 input XOR gate.  Latency 0.

module alt_ehipc3_fm_sl_xor2t0 #(
    parameter SIM_EMULATE = 1'b0
) (
    input [1:0] din,
    output dout
);

alt_ehipc3_fm_sl_lut6 t0 (.din({1'b0,1'b0,1'b0,1'b0,din}),.dout(dout));
defparam t0 .SIM_EMULATE = SIM_EMULATE;
defparam t0 .MASK = 64'h6996966996696996;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B3rf/2KoBWAwS29sXxzLnjfM8Rp+qhQWMck7JKZ2NaqD9V9UKU7bl4jkuGVsDU6z7XO3x7BxuWBbYZLOIyvSnxvl4q5a2UD4cgrCHgUAP/ZkI6Zm/Pq/FgcPpxwx1eQLC12Fa4ckuH+9Du2HPggWSP6RwHUIqh1oksIgzx++SxhxjTWuV197zpym2imWlhzRYQ7x7dWXewEbG0t59jO5Hk71pqs0na3eUwTSvIVo59jzPu8N3jybScSt3RNcU2RW4PI/8oK2MNCOGIW7LLvN4qQHW/9aMGAat34l37DNiw5reiAULkPonqn88iRSZryDBMeTupICZA1XkzPmve5mi+/Oom67TEwFYVxZHvaB7VPySazQUrQoNouZ3jYILvSCFNOXLihm6RIDNSOWTdNWKyjonkTdiMrciAcvZGYJ5dSs6mI4dfgSktKjZiV8+CS3W2uAHHQyOTYEkPGlUusRJnPNX+ZLzbUl+TIKEOffCCjm0eYxdRcYcqnyCuE6LO4XuQL/xznwTgdFbWhP2q0l7gMbwvp/NfS1kKsqtKYQfGmwVYahg6Cw0udwEvwc1HJG8qeck1zLJ3SSU8D1tSH+IhjB70QBTd8TP1CqmXtrlXUtlo3rFrzyG3djdLSiNSoGDAG9lL/5ayS1nIHWAxcnndjIg0K0uUOc7wBaE98XIIqkRJTsAdooKDL7x91c51Te9eylFq4jiCytMxHGn0SyuEpu7Hfsje86I06PXoKhr3AzgQKLEmhfoaZbm5SYc6r663KrHan3slMcMUNhaczK65O"
`endif