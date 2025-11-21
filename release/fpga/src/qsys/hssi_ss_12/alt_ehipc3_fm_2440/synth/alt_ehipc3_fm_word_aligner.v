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

module alt_ehipc3_fm_word_aligner #(
    parameter WIDTH = 8
) (
    input                   i_clk,
    input                   i_reset,
    input                   i_valid,
    input   [2*WIDTH-1:0]   i_data,
    input   [1:0]           i_inframe,
    output                  o_valid,
    output  [2*WIDTH-1:0]   o_data,
    output  [1:0]           o_inframe
);

    reg                 i_valid_last;
    reg [2*WIDTH-1:0]   i_data_last;
    reg [1:0]           inframe_last;
    reg                 shift;

    always @(posedge i_clk) begin
        if (i_reset) begin
            shift <= 1'b0;
        end else begin
            if (i_valid) begin
                shift <= shift;
                casez ({inframe_last[0], i_inframe})
                    3'b?01 : shift <= 1'b1; // un-aligned start
                    3'b01? : shift <= 1'b0; // aligned start
                endcase
            end else begin
                shift <= shift;
            end
        end
    end

    always @(posedge i_clk) begin
        i_valid_last <= i_valid;
        i_data_last  <= i_data;
        inframe_last <= i_inframe;
    end

    alt_ehipc3_fm_word_shifter #(
        .WIDTH  (WIDTH+1)
    ) w0 (
        .clk        (i_clk),
        .din_valid  (i_valid_last),
        .din        ({inframe_last[1], i_data_last[2*WIDTH-1:WIDTH], inframe_last[0], i_data_last[WIDTH-1:0]}),
        .shift      (shift),
        .dout_valid (o_valid),
        .dout       ({o_inframe[1], o_data[2*WIDTH-1:WIDTH], o_inframe[0], o_data[WIDTH-1:0]})
    );
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh20H6zoBuIVy636TbJ/G8+3doo9C/P02mFt1SRnwBVKRvHDpSVuTVx2Nmkd+9JPV/y5IIg/JweLKt+wlzBAcBwi7Bn2PbtWy08xnBEVg5UP1pTvhhPvNh3PsKuaeE6MSCWEEiEPdiU7/Uto4Yq8vaJIftJSZMR8OcFjqam4OedpSgSCjXUXeX9+yrgDR/Doi2iqVJX0txkk9i6rY6J3VgINQuJK8mHfMiXVC/HiNez0Pnznvx8gsfvivY3N+WKohlx84+uFYkOWMNQHncR6W4/5EKPKiHI7YymxIsSmiEwASFPWw83vW6QV07Q4TaGDUFa7Ad7KHZPt2yCMNEcyFh3IoAB9+fS4Defbg2Jq6TIHaXx+YlAO+m44c9kHqUzx90lJR5Gz74jftgx3HR43jsHHH5Egwu/xcU9d+xnGwx8J1307b5hgWGJtnBRKknaZOBNttJUEWJOtsW5cIlrXzeyPaI2kWsgFYzkXECCjW5VCly21iCT1c7T1LRTEjvEPi9X3fGriDEgThb/zVUw+X2HNKrpN4NIJYqymcIqmoPFvIiZ1SGBwuAJ7scbhpriq7xeKHqW1IFboSAinKPU+vTX5dbq5wa6S5wN+mLOSmjHgGJ8bdf+oFMG+kzBcCL601RzOpZa6V/ocB3gH59gI6tFpDM2GDtRsO0M+XuSkjNAYoNQPwm2vkw+M3rEDzqZ2cHiJ7fZbRjvW3WQ60UQePLJavpU3qikPrOC6IR6zPR6YVDBPToRJ7atF95YLDV0FOLhQ/V0yA92y0sW9dYoA+YMI"
`endif