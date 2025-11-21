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
// 1 input XOR gate.  Latency 1.

module alt_ehipc3_fm_sl_xor1t1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [0:0] din,
    output dout
);

wire dout_w;
alt_ehipc3_fm_sl_xor1t0 c0 (
    .din(din),
    .dout(dout_w)
);
defparam c0 .SIM_EMULATE = SIM_EMULATE;

reg dout_r = 1'b0;
always @(posedge clk) dout_r <= dout_w;
assign dout = dout_r;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B0NQYEe0tfxlZ46+4Sr1HhUpP1ceniVqnlh0SNCHaZwAbYhyHCZKtb3pz+eYk9LusTE5o/2JhIEWtmulvW7Qy58RJUx8ZJaNe7TDVEnO92K1dF3Y7MJCYxt8XnTNZWVzdhCiURXBH+qwjLUXz/r3N3jPQkdCrtDLCWnITEdxlcpDkecXhUrMjvBn1DlKiCVP5Tj1mKXbtEcMAgLQGXrVKwgWQ+WMXr1pqEMMdeMbRMxr9wA2f9i2QjU7Tl/cmKaztPkIniZsy/g1Kr6tvVX6rxMedoiupUSwNhgjEFwnWKhwIhkEB/OD5PW5i0iSFDfDKfgUJKRRAP5Yj4Fm6srTuzQ5ZRxU8/JCvTlLzZT9OcOJF1NErwGdA9VvutBGes5Gx0V4F8A8+aBQUcCO8QbbcQkpkE/xGaOvwCAfcBt1vQmNPmtcAd19N1lhgKeYyyJ+I1MoQelzobnk9rDtNvPpynXYoFCoJ87ykEVNRYxcwhBCrm6Dl9rVHOW+i70W8qagZmT91985T28vAAqcbmyCrg3QmwjN31Yy68LJ3BUa3qzSDaDgrvX3QqbBAm5IlvEz2mKuMCH4N//IFmOLS/PqJexhM3jT2NM5tFkrKDoW9lqaI+ZnHVaxJ0bBi6jygVoWhdASzcQlAQh7sTwcwGizsKLE8t/nDX2sC3sqZlES+W9+PmXkQMLSDX5W2L8DtH2ua0CYedkh3EVmF7wYhGCUNgH8PheIACo8WN6Xt6a6RqE2kL63Gfvm2I8wWlU0R5bddpdemIxjjoiqCv8mjQhG5Kn"
`endif