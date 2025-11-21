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

module eth_f_100g_adapter_wptr_addgen (
    input   logic               i_reset,
    input   logic               i_clk,
    input   logic               i_valid,
    output  logic   [0:1][4:0]  lane_ptrs,
    output  logic   [0:3][7:0]  mem_ptrs
);

    logic   [0:1][5:0]  phase;

    assign lane_ptrs[0] = phase[0][5:1];
    assign lane_ptrs[1] = phase[1][5:1];

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            phase[0]        <= 6'd1;
            phase[1]        <= 6'd0;
            mem_ptrs[0]    <= 8'd0;
            mem_ptrs[1]    <= 8'd1;
            mem_ptrs[2]    <= 8'd2;
            mem_ptrs[3]    <= 8'd3;
        end else begin
            if (i_valid) begin
                phase[0]        <= phase[0] + 1'b1;
                phase[1]        <= phase[1] + 1'b1;
                mem_ptrs[0]    <= mem_ptrs[0] + 8'd4;
                mem_ptrs[1]    <= mem_ptrs[1] + 8'd4;
                mem_ptrs[2]    <= mem_ptrs[2] + 8'd4;
                mem_ptrs[3]    <= mem_ptrs[3] + 8'd4;
            end else begin
                phase[0]        <= phase[0];
                phase[1]        <= phase[1];
                mem_ptrs[0]    <= mem_ptrs[0];
                mem_ptrs[1]    <= mem_ptrs[1];
                mem_ptrs[2]    <= mem_ptrs[2];
                mem_ptrs[3]    <= mem_ptrs[3];
            end
        end
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XZzF0ZQ3rYA6maqFYGiArhAF9KTvAwTjXN2pkY6zZJ9XVRmGKKtPRYEo0f7dU5AyKe4pibaJJ0wgo13TkrDxklxWJvw7UtyTo+LjFSKtBJy/DeGZPGP4Ywt01kiILSU/6zEb+RqHkd0lOANiE22naIPEGhRDbHhlJceOsn98882gbsuGTq0hq8KYpoP0cXbIfEFbJCEUZSEkSVz/k1VAhPLFAXWRznZOr30dZAWuJnVZ7GIavwzCYfoAUkqgA+e+LUjpcmKdgnktEMcqMgEwHH5LK6M3RQjgYSI8r7wtTBB/XyGlwhHJPxarmaLItnWjK1TgIZFsFOK6eTWbxjjHeOKl3GgGk2jIPgz2MsnOlBD9YeJAa/4zXuKogq1Tk4EO2FMs4fbIdx2xh6vYtT0mZsqbol7hwYSHkjAZbWEgwAsXxm+hnHsHnlp8EwZg2wcyfTCmJ8yNDI6gYGzvtHptD7CbxxP6a3PXgRErFR9tBtEqY/fNP/wJT3wUH4P2GGW7PZTM7i4sJxW49A94+sKWpWpQhNOb2VQYOfJt5gujDFn+YG224Vgo2m/3MhK7Dhe9I/ZIOdOElGq3fNKhTRVt5nkqcx9JQ5Dr9fE4TokO71OOfAOQNRT+tCymgb/iZgOHlEGVDNFqtqkCvVAq+y+DAD5/CXl9Tutmt7sSAMISPWsbt25d9qozCwVGjLZV88qZzpqlSom+hb3SAQwsmD6YVgMp9iXZSTch4+4aNvQTkCtw75+mFxKxsYbOSUq+c73GvWcJ1GyI7Of1tqHR1Aja4HU"
`endif