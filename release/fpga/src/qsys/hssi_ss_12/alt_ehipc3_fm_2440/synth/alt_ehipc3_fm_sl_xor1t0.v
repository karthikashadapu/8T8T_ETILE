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
// 1 input XOR gate.  Latency 0.

module alt_ehipc3_fm_sl_xor1t0 #(
    parameter SIM_EMULATE = 1'b0
) (
    input [0:0] din,
    output dout
);

alt_ehipc3_fm_sl_lut6 t0 (.din({1'b0,1'b0,1'b0,1'b0,1'b0,din}),.dout(dout));
defparam t0 .SIM_EMULATE = SIM_EMULATE;
defparam t0 .MASK = 64'h6996966996696996;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B2TiEDFDqChzJalHM2BGsnDHDhmKpbtfCHtFX1TNPaWwRfe0MTZAltcXoogy+ONcBUMZ8GTuh3bBlMSQRxiyh9nB+haScKdIpNPPpCu09mSjXX9lqgcFnVMqUfDFkjeuqzBr+NLkGxXZyAuhwLJ14r35WDqEIUQ70w6zfcSqtfECEyQFOTy+glIHFXPMuWZYJeYq9D4rpcdhCgFPja+BspPc70SyDe7mkUK5OapjlVvJZimhmVyvPZcXqb1RUNYaU4YIux24RyGvndSmHcWtL+rM/jkFR8pgkymPAMFxGYSaNNZgf/Emqu+TM+f/rgtcjD29R9ptIHMQbC4FreqcKh6iXd5KCWsoml0nCGm4Gj6d1h0cwKVQkt00aGqpNEHdNAfv6I802wMEzGBl+CchlhZLfRQLcWLkDgjbZaaDXVtUHlUioS/CU4YGWgIuZgAkou/K45AOwSHBG2zgj/0namsG1KxNC9QYQJR2mzOHBlYc+iXmYINTtbO/at5eclC/chvANy3BJFhWv+urln2XeFF3FanZYw7tyt0a7qPNlL8Stjsq/Kt0clR4mJpMrHoQRABiqSnUf3knPU7r0JUl9fdhpxau87JWL6WkhRvR6207cRLKiz+mkMKeEZIEjUOSybxcViIOOxH3aNByXrJANxGdZreAVM8HJRwU5nJiSkBZUpwlVBKF0gMmiRhYf0NJzuCEeZgscV10v7MfsnFwV4rHnluFelKghB7JlN+/HY6Pp/d4S5Om/tded5MW5t7fyBXIEr4N+Yj4oq5e4w2DHZt"
`endif