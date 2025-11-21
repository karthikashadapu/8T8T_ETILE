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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module eth_f_preamble_filter2 (
    input   logic           i_clk,
    input   logic           i_reset,
    input   logic           i_valid,
    input   logic   [0:1]   i_inframe,
    output  logic           o_valid,
    output  logic   [0:1]   o_inframe
);

    logic if_last;

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            if_last <= 1'b0;
        end else begin
            if_last <= i_valid ? i_inframe[1] : if_last;
        end
    end

    always_ff @(posedge i_clk) begin
        o_valid         <= i_valid;
        o_inframe[0]    <= if_last      & i_inframe[0];
        o_inframe[1]    <= i_inframe[0] & i_inframe[1];
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onqo0cG/JUW4ZslVWxgHGOwC77FNb8vjj1DQ85r8AIUxu7sN9z/LijdlfJRY5LRC/9vjIHPwMUo1zULuU8omnTsIC12p9fkCCTJxYlmCrK+Bx+tEDSiUNVa6pUZ8A50zCWMP0XuUGbT3ys4yym+sihnrlNMobwDf8R6bmaeFx3lrLmlkKOnpqZ7vx82tadceCQWpXod6niQm4/yysnOPwVrluLTLQkMf/UhUpclq9HCGJHlFph6VMTZCa/X6+uInX97JpusQ06yldJFgC4NZUSFO70q4Rz5PLq2ByojyeWY3mf7MzFJLYryFQyObQ0w63BZTv48CJHmLBkS+UYzjjvywaYDn136DT4opbeLXE5uwsYKv3FMvWzH29rHUEgRASfUm0QMxevXNDMM92Rig2LEB+hInsXVaSyNNoWmLl+fKFXBFasgi6mpgXrSuTBpM9161QfqG9kwwfMu1Qzm7rTNiq1XLVMDcNAqDbBwAF8hjaSiv6wKXUTbAUKXbGgkVGrQAF9mU4BAmH98XYowyttk3e5beJbmHMbClcOSNB35amhBw6HchNc7ZPcRwEG/6jk+eVwpdAkgJR+CmMG9iGX/887rhHoUW3cR5AdhQCwynFPs3ACveGFU/Hbucmg8heGef5gLlni1aa3L6Yzf7BMQoJrnHd4Fw9AUVTapvsPsN2PZ01KBq7qnTzhHt92cSJbVEuMIRpTrAmw4ZW5/6nHjx7HXUgl50D3614zIIm1hBBI+YIdIzwSrakwYNMa1UPpaeBLpqqW1WdcU0mAgfer0g"
`endif