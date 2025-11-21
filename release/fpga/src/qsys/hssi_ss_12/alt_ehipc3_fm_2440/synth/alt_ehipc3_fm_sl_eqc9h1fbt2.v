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
// 9 bit val == const(1fb) equality comparator.  Latency 2.

module alt_ehipc3_fm_sl_eqc9h1fbt2 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [8:0] din,
    output dout
);

wire [1:0] leaf;

alt_ehipc3_fm_sl_eqc5h1bt1 cmp0 (
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
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B1ZjFZu+1zf5iO+7s11Dm84d8WnsXMvcZZn7SI7lnq7bvxS8hlUJeDPAeKcvi5ZFx8Cfk7FqEHfWZtXAv/M/eGEmSgDIDFSqeyQV2jJnma9yPVlixs11A/azX+FCgEhSHXdGIKOUf2rgSgi7B6Zetjlj7qRmro+ZmQdhM7/FDtbeeuh2NQi+o5bvf7KePPfeQzahRQyEyHHCXnxOruZPXS8Kb87/ALZPcPPt7fmWnFs9/jEKWtI67IadTTdsQOgVd+RlwHfvK9kHHpkGv82B/h8t49HaDAgfABbn+d0YoDarHSAVo8VVqwtC8546SVuJZwsZmCKvuO34M9H+FXqeTYHKoL6ZkXODw+WyidVrZFiZm2VUSisy/Kib+gNKp1GGVbzCwmV0RoiTXTjqDKdhad6/KyQ5qXZBMNh1NlljfKjt0/suYpoO01TPPWCQ4N7wYv5Z8guQW6tuW6EUZ398lti3UFRQXm6NfWmPxGi90e2Q7VfiGyPLhylznQlgMd4OcTp8ceSLBUH2aU6LdeYpYEIJ9rDtRXwi+G2vOdihbllJ6p9ZYB8tIhlC158RpeO5+PrtpslufjN/gKYqiyw+2piUQUMAG3rJRAE5Ztc/7pJJka/Yflrok9IWf3QvDEny1aP3qQ1BBEV9ilgFjo8S0ng29dOcb7aH8gShY5qirBR2xFAE4hmJBGoZE5RtXMk3e73jkrjyIHKvocd2cgyGATmMxT0zwTF2Sr+mv+F8Fq1OoFYYyC5NjxxDP5w06MS+eNWkF/f+C0UfoV/eIFegAIY"
`endif