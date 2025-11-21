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
// Equality compare of two 9 bit words.  Latency 1.

module alt_ehipc3_fm_sl_eq9t1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [8:0] dina,
    input [8:0] dinb,
    output dout
);

wire [2:0] leaf;

alt_ehipc3_fm_sl_eq3t1 eq0 (
    .clk(clk),
    .dina(dina[2:0]),
    .dinb(dinb[2:0]),
    .dout(leaf[0])
);

defparam eq0 .SIM_EMULATE = SIM_EMULATE;

alt_ehipc3_fm_sl_eq3t1 eq1 (
    .clk(clk),
    .dina(dina[5:3]),
    .dinb(dinb[5:3]),
    .dout(leaf[1])
);

defparam eq1 .SIM_EMULATE = SIM_EMULATE;

alt_ehipc3_fm_sl_eq3t1 eq2 (
    .clk(clk),
    .dina(dina[8:6]),
    .dinb(dinb[8:6]),
    .dout(leaf[2])
);

defparam eq2 .SIM_EMULATE = SIM_EMULATE;

alt_ehipc3_fm_sl_and3t0 c3 (
    .din(leaf),
    .dout(dout)
);
defparam c3 .SIM_EMULATE = SIM_EMULATE;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B2pqMO/Zn4ocLIG1I/m/J7QhCxhDcrKNQwzd2kkHDAvOE0MgJ7RnMbRSsMY4f8+pn6oB6eG6IQidMQX8NBj/RBBYCUNdvo7m9CJoLheg/fhfFtGxrfvUOBMURPYk0UDgWb+rSMgPcb3G+a9zhQw2kbmMiF91UWndgmjcKraQFUjpSpFo/V38GeAU+xwEMj1LEbGmhFp1+wl8waTffiXq9cchS74WBDAtIZuKtpxvcmgM507TdZIyXb881jkfOcMXhe7CaB/W9Q9qNI1pb4tJ8NKY81qzvBtmhp7MUnyAhV8Zgi9CB4Cf5+vNcObOsxuSFXkHrvGOjScksaYmBue/6ap4fEM9Vexoshv1022C2uHLrhfqRKs/e80HuNWnJM4Yx2pms2M9g5uXPnsScyG+7R3+97jhNgyZK3AS7E1yWu0y5juVVKfJ7gO98XWwMJPnJ8T91XuCRXKd/1f7Cf517XeFrddhuHkgTm99Vi8ZH3McNRbiMy42FQLjafQNLFLoZqP/QTy+A9j1aTP856TNVwjCZV2qXDNK4c0Qb5u3uyJfQmDVBMIDspCcHToBKbLLXDoHHaiPSb45/05ZW/mSZsHb+ko65JIIcjP4nPhYBA0s3tA2h+umAWBON1Yb7hW8D1+L3yt0THp848DOQ1Yv0WQvx+qPLF3eh4Rxtk7JeKuD3pH1M8bHe114jOiQWabebniXMnXhzbiHDGSAfvZw8witUmbYClZTiH+SiAE+eZC4ze4i0RFOwKSoMgg+vDUuHz2gLrQlZ8HTfr005vVvSje"
`endif