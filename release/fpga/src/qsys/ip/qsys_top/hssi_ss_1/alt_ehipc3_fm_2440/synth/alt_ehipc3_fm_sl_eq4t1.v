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
// Equality compare of two 4 bit words.  Latency 1.

module alt_ehipc3_fm_sl_eq4t1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [3:0] dina,
    input [3:0] dinb,
    output dout,
    output dout_l,
    output dout_h
);

wire [1:0] leaf;

alt_ehipc3_fm_sl_eq2t1 eq0 (
    .clk(clk),
    .dina(dina[1:0]),
    .dinb(dinb[1:0]),
    .dout(leaf[0])
);

defparam eq0 .SIM_EMULATE = SIM_EMULATE;

alt_ehipc3_fm_sl_eq2t1 eq1 (
    .clk(clk),
    .dina(dina[3:2]),
    .dinb(dinb[3:2]),
    .dout(leaf[1])
);

defparam eq1 .SIM_EMULATE = SIM_EMULATE;

alt_ehipc3_fm_sl_and2t0 c2 (
    .din(leaf),
    .dout(dout)
);
defparam c2 .SIM_EMULATE = SIM_EMULATE;

assign dout_l = leaf[0];
assign dout_h = leaf[1];

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B1RI6sYi2TCYTT/KTQg04wnEzPbCWpBXq3aoIkg7TaPy0WQmrJt3piPYNkZJQILFh7ACuu3TIOE7CHC/vTtdVLsRhSEO8E8wULbPfCeW+B+VJkQDUfFsSDVDiaMCFUsW+YOCOg7AtsVdYZ3wTI4qhH9k68yl92rOinMpNlFjrT9/A7dqNCcIU962TjUO1LbDNr9Qs1chKLNwm0RQYWD9K/1flExEbiA8sIuqrzemT9QFRnvm45ctL8lys4wVP+Wo4BuBDaKqzKY9Qq/cIBfxe7m4fWFqkt3xHSiJBoyRI9ox/WOlGRcTMm7bhcVL1Y4z+6udKurNpSbWpy0agcHY9KpdGq9wiRR5UqWk5FA1zL/QJX06DUCK8ckAMJ8dIdTDPfextQ540Kx3SUcEYhBGyFf8KeaXpM9BQl+KAwXqj7sxAnOSx1RCf4pmdrKXTtECimf0TvRToTKyIp/ZhQ5Li/wCYaMo5rFv8C+m1KyE1rlZOjtVXSBHsSUTLHBtNjGygxFjft4NJGXwM21KauWv5mnZHDLEGHj4p7iKWxfdIRHX7nC4dzYSGS1vVg5s/4hp4YmSzFwryjYF1ZDE9v2FQ6fEHzPD1Kz5slqks9NpvtANGXXolE4fkQZEXS59I/65VbDZ8P0DWMbaD7SRZz6lDDtmylrojJD0wDn/tlzuL4E6WDJk9DRNz+Vl8xAIjElibuFz1vCQ4+ewHswFnxZ9SlSyicdEk2r7hfgXV7M0p5Ebh7mUFKRPhRh35Stf5gAXxpBTFXEqtmu+koRzT8nrLqN"
`endif