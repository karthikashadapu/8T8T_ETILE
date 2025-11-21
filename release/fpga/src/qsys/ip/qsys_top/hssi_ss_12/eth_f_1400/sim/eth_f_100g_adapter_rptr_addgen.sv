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

module eth_f_100g_adapter_rptr_addgen (
    input   logic               clk,
    input   logic   [7:0]       i_ptr,
    output  logic   [0:7][4:0]  o_ptr
);

    genvar i;
    generate
    for (i = 0; i < 8; i++) begin : lane_loop
            always_ff @(posedge clk) o_ptr[i]   <= (i_ptr[2:0] <= i[2:0]) ? i_ptr[7:3] : i_ptr[7:3] + 1'b1;
        end
    endgenerate
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XZ8cRvSezkht/ykAF+1fJGdagjVJWVppde0lU40qpjrVr+fcfxE3aF8h7NN1LEyxkdVF/cCfhEkfhNtrhmV2EysyBB5C/kKlz/zH9+O5rZDSdvmbBpb8/Mgfk1zOashfD+uQV0IXA7xn+kqCAf4y+A01gzq8/Z6Z8K+DPiaU0O0uPcEe+rYE0t/rbT06OIyRxLORlElD9mDvUwLdUzL1fXWpR6vQ0uqHR8sAtaQl3NSGhGvELcRNc6PW6neIYrX6ypWg25x3nmi6dyOoXdVlgCJ6kAsZzvgWIhthzXGLXs+F47d45UQ6RUIo+WxVz1orrvpPyt2Jin9bZQkdq4V2tpwYVPsBC/QpDUD+Wtme6E+enb1BlSQ0nQIEKHZcD4mdol+Wa18O2Ogaba9CMWK8EU1lBQodO9EpCl/sdR9IV2C1dq3u+8+o38TK7EKkvsYdelT5HuV/iF47V2FulF0ZWntMJFuVsje7k5yFILmrzhQPDG9fSXqxcb1dTaZryiFdLp2FcqfsSkE/wHwGT7xgZ3/JxdmuCQS7sIGd41b+a0U6rMDRjLBQ2s57pz4UpLfxv3D7REaVB+4bd2YZWu54+e4tR1Dvc1SKJ1jfj9pqu3IpllRRVfBzD/4o/NP1gCbd8lct8kleCkZWWZgc22ydD4fyATTHUHV1OSsKxVuuQAQpH+tbplTCY/DcxaBBfH/t1YarBqG3hDL6zP20QvVLgCRsdNAvx41FmcUHN1XYsNRLEotq9q/+JVA4/OieFfoyKKrLclP8fyXTo/GxGiYs2em"
`endif