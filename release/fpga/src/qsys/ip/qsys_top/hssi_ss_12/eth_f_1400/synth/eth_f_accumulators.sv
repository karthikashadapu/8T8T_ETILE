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

module eth_f_accumulator_16b_1c (
    input   logic           clear,
    input   logic           clk,
    input   logic   [15:0]  din,
    input   logic           cin,
    output  logic   [15:0]  dout,
    output  logic           cout
);

    always_ff @(posedge clk) begin
        if (clear) begin
            {cout, dout} <= 17'(din + cin);
        end else begin
            {cout, dout} <= 17'(dout + din + cin);
        end
    end
endmodule

module eth_f_accumulator_32b_2c (
    input   logic           clear,
    input   logic           clk,
    input   logic   [31:0]  din,
    input   logic           cin,
    output  logic   [31:0]  dout,
    output  logic           cout
);

    logic           clear_reg;
    logic   [15:0]  din_reg;
    logic           cin_int;
    logic   [31:0]  dout_int;
    logic   [15:0]  dout_reg;

    always_ff @(posedge clk) begin
        clear_reg   <= clear;
        din_reg     <= din[31:16];
        dout_reg    <= dout_int[15:0];
    end

    eth_f_accumulator_16b_1c acc0 (
        .clear  (clear),
        .clk    (clk),
        .din    (din[15:0]),
        .cin    (cin),
        .dout   (dout_int[15:0]),
        .cout   (cin_int)
    );

    eth_f_accumulator_16b_1c acc1 (
        .clear  (clear_reg),
        .clk    (clk),
        .din    (din_reg),
        .cin    (cin_int),
        .dout   (dout_int[31:16]),
        .cout   (cout)
    );

    assign dout = {dout_int[31:16], dout_reg};
endmodule

module eth_f_accumulator_64b_4c (
    input   logic           clear,
    input   logic           clk,
    input   logic   [63:0]  din,
    input   logic           cin,
    output  logic   [63:0]  dout,
    output  logic           cout
);

    logic   [0:1]           clear_reg;
    logic   [0:1]   [31:0]  din_reg;
    logic                   cin_int;

    logic   [63:0]          dout_int;
    logic   [0:1]   [31:0]  dout_reg;

    always_ff @(posedge clk) begin
        clear_reg[0]    <= clear;
        din_reg[0]      <= din[63:32];

        clear_reg[1]    <= clear_reg[0];
        din_reg[1]      <= din_reg[0];
    end

    eth_f_accumulator_32b_2c acc0 (
        .clear  (clear),
        .clk    (clk),
        .din    (din[31:0]),
        .cin    (cin),
        .dout   (dout_int[31:0]),
        .cout   (cin_int)
    );

    eth_f_accumulator_32b_2c acc1 (
        .clear  (clear_reg[1]),
        .clk    (clk),
        .din    (din_reg[1]),
        .cin    (cin_int),
        .dout   (dout_int[63:32]),
        .cout   (cout)
    );

    always_ff @(posedge clk) begin
        dout_reg[0]     <= dout_int[31:0];
        dout_reg[1]     <= dout_reg[0];
    end

    assign dout = {dout_int[63:32], dout_reg[1]};
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XZGCZHsHmpdVCZCCUGF5EXmLEAlkLioFlKpuoZxgStlMKDhK9JLFm93Y1Ui739r183K+LrQN2DjOc+rWBqOCN9r3+ShCyHkZl7EsHbXgx+m4ZDMb+3+s6jlQSMdJpfy4SErwGQEnV97aDcx6UFFlRH4+4emli80K0J/WxLQhOQIsDbQUr37Ocx+1OirLhnjF8CZSbG3RhHj5nI6g5GLEbYTNiL3JKNzmLhprK5Wk4ViIKZUvDKVYhse5R/tQht/G2DxFyP/3VTXsOHx00ByASkW+6ezF2G4WRyij0DI4JzpY8cj6I4PYxe0spgNPFnJkGU69xG5jzcPDYbGz503T21Reyf1yspgadSDVCYg/j/MomII901sVVRKpfVcQSo4iGT1EcuFgZk7uDkjCRzgaxm2BhnQ/sSlv7EGaIMYAU0ROjVx7CBHIGc6+100xmHUO7wGIo9Aneq2JnZMhXb0R9O5OVgxPKRPtW7lQ2AiCYO4jZXRl4kOj5xmf9zAnVI4A2HzeQfvak22H7+CVFkuchfNVdsvhkPuB1Je+hvgQ4BNFfqGTMDbaBV78ppbTtfeWBTyA+ntIvGHWbHFdsJpaW/7bPGtIH6SGi7fRzmaG+Csu22mZrTBMLcwiBTVR5Wtt3tGTgXHgwpNY4kVOvSwOKgS1K+L4gk/wXruLsniHt5FY+B+Csjmd1Jsw6cLxjfB3uEbVtSvxsGBrno7wSxMOOPleNBCMTVfgiKBKpGeGe2GEICb0aFr4a7YXj6Vk/kgYUmg/oYmxzknOY5BxeinTpb5"
`endif