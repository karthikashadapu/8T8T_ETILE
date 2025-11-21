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
// 4 input OR gate.  Latency 0.

module alt_ehipc3_fm_sl_or4t0 #(
    parameter SIM_EMULATE = 1'b0
) (
    input [3:0] din,
    output dout
);

alt_ehipc3_fm_sl_lut6 t0 (.din({1'b0,1'b0,din}),.dout(dout));
defparam t0 .SIM_EMULATE = SIM_EMULATE;
defparam t0 .MASK = 64'hfffffffffffffffe;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B1KG/c996wbQu2sRH+kt2xf5FKmA7uqPhyeotAL1D1DKSTSMmCfOZmd1r8BL2WrZAJE3MvSNF0Of4fXvyB/aoTwWET4Oex2N4nU2tTYGD9CS896kJUgQy/rKAWnTji2WYPQoz2hCRV1Kmr0fF719uD81ENkB39p3z8eHYlHGYgmAmWXT6E5KMa7iEi/J4M2GheNK1ksbWYpQZ2KbK0kNTdNXWeI+JOgmywW1DevLW9R79UvRYGhx6Mx2BywvWj/kAOnf/xWQlNZ8LegmZFSRztSc7NlP7lXE6I5b2ZtQ098l4M72A9copBySDgJ6nxIldnVI78Bt4UCaBA/0mOw92bcQGIO0Xp5qrOSPg/Yffo1XKXHuxKWdTHz9xBVJ+6ig5AOps2owcI86qHma2OwyH+jp2LRd6eZxaiO7G8dOl4EqDfe2UtMvlNU9xS70A/2XMCpT2EJ3tHjgAJDQgaV/QaQx3r16Z+oMVdkLWlOxRQqEyRcrOMrVqZ4CtWoVULhLZiuOVka8DntFay5PdIC7tZAfQJwzmqBE1tt4wqHatorrZnWWS6ds8rJBBr6xJ+iziW5sjobPaSvhIZWnUv5gDcFBjW87GucVPZAXoNEBnqKuDKi/xxKAe+aegepiumyXAdzDhI7l4L2NUOascjFuWz3K01/M9kIggTvjfwybAvCk47xl0690zej2rCcqXqFKHtezXsOjJ79gdVqz4GGKCH66KrtwPmsOm3IV+MZVou3tiM5LCOOKXeDUYMwydUNPTKFTgv32a49ROg2Orwiadye"
`endif