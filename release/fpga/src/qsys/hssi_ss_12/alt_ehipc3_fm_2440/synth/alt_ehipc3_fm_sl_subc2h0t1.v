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
// 2 bit val - const(0).  Latency 1.

module alt_ehipc3_fm_sl_subc2h0t1 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [1:0] din,
    output [1:0] dout
);

alt_ehipc3_fm_sl_addc2h0t1 adc0 (
    .clk(clk),
    .din(din),
    .dout(dout)
);
defparam adc0 .SIM_EMULATE = SIM_EMULATE;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B3Ti84mnosE+fWFWrdqkEIIbOUbrPXg95QdflUAXO6XrRc68F7Udmu3cnN01zxwz4ncUOh2R3hSEI2RfxolW9Eo4LHRTijOQG/jHvh6mLdS8zwh919zMk4+Up8ydIJEevlgYJqjOGFO8mziKpEwU1crh365AxDX70HQvW+quFOBp2jvNpHi/GhB04mPXdoNQX8gy8ron9GqbThPOuhRn0UxSqW6dek81Mi58Yq/CIMRBf16Lge4wNQK9lhjmpwfEQRIOkNdrRkQqI1Qt5vmWlDetXVQyNWCFGBRNaavj15o9QbJXRkErLvXDE0TQO3Ud45jsZ/Pi1xqlezdiwUpUc7x8s30BGSVBJE7B+OVvTF4/D2Kr+qKcP/W+ETj0m1J4bHPHyhZJopvSiyK08Yf+H8izpmookvZ1sKN6TEKSVMd8PRkVfEg+OBbLgB2QigVB3ZPUcBzQE/l3u87oJyyXf/8TmzsWmDEsnIYZiMrgEJbHITZI01fATsoy/Bc6XyWIfxomG5QvOcBioCHrk/4cIvcDYP1Br61svhsYD9K9BD+umocV04uRG+xVjUDr615+b/OrKX3AMMm9MzNQbL2EivMz3fczPZWQeU1jNfi8iE3LdCPUBHxGvTLbDewHNENiy2/HHDbwVd0+Q0f6akljBllKskFHCA3AQgqJe1UdvekN7uEK1soVXloQTQ3xgMIxn64zXKDIp/BdZVLjNJhHbclCOfzUnvGWBjGHlYJU+tfSXYjkqdNgrcwxT6ZpbhBMtd8wiq7FBivGFD/F3Ce6hKN"
`endif