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

module eth_f_stats_txpp50s (
    input   logic               i_reset,
    input   logic               i_clk,
    input   logic               i_valid_in,
    input   logic               i_valid_out,
    input   logic               i_sop,
    input   logic               i_eop,
    input   logic   [0:1]       i_inframe,
    output  logic   [31:0]      o_starts_in,
    output  logic   [31:0]      o_starts_out,
    output  logic   [31:0]      o_ends_in,
    output  logic   [31:0]      o_ends_out
);

    genvar i;

    logic           start_in;
    logic           end_in;
    logic           starts_out;
    logic           ends_out;
    logic           if_last;

    logic   [0:1]   sop;
    logic   [0:1]   eop;

    assign sop = i_inframe & ~{if_last, i_inframe[0]};
    assign eop = {if_last, i_inframe[0]} & ~i_inframe;

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            o_starts_out    <= 32'd0;
            o_ends_out      <= 32'd0;
            o_starts_in     <= 32'd0;
            o_ends_in       <= 32'd0;
        end else begin
            o_starts_out    <= 32'(o_starts_out + starts_out);
            o_ends_out      <= 32'(o_ends_out   + ends_out);
            o_starts_in     <= 32'(o_starts_in  + start_in);
            o_ends_in       <= 32'(o_ends_in    + end_in);
        end
    end

    always_ff @(posedge i_clk) begin
        if (i_valid_out) begin
            case (eop)
                2'b01   : ends_out <= 1'd1;
                2'b10   : ends_out <= 1'd1;
                default : ends_out <= 1'd0;
            endcase
        end else begin
            ends_out <= 1'd0;
        end
    end

    always_ff @(posedge i_clk) begin
        if (i_valid_out) begin
            case (sop)
                2'b01   : starts_out <= 1'd1;
                2'b10   : starts_out <= 1'd1;
                default : starts_out <= 1'd0;
            endcase
        end else begin
            starts_out <= 1'd0;
        end
    end

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            if_last <= 1'b0;
        end else begin
            if (i_valid_out) begin
                if_last <= i_inframe[1];
            end else begin
                if_last <= if_last;
            end
        end
    end

    always_ff @(posedge i_clk) begin
        start_in  <= i_sop && i_valid_in;
        end_in  <= i_eop && i_valid_in;
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onps61rkoLlRv0LmkzshzCFvF6oG7Hx9pk9cXUJhoRqYJHd8XchJR0iIdX1dtW1eyfLSz3AvSCKfpwxn1YDEoT/KliDATXA256Tt0S84DvglfWjZqf6Rp+/IpEab5SKObht4+SwC1cVQGy9QM638AgmjFTEZuts1u/CC3a8s8KQRLgZA4wUSrASzdFI9f4KQIxmFrPG/aai9KfbbUwB+PQ48P9WkStpc8SSAj8YyMVrZxjVTLhtMnmWdjjM9FZVpJMd4TvUvvxZr7cTpqZVzklhH+94HSV/lGTruh2dYPLMk6ZREmFuAGzprSuonzXsdmcQwTKMgiRDQJj0/06bUUE/PbSzf06AfGrrABjV4Vd3ksBh8FxYZl9kNxQNi9bd5Pxu521o/XO6ylHSaDL4jH3Sg2fxdbi8j6LxE746UTrhnP348/bsN1hgtr/GjOeDQV7sXdzhfOCbTdRjldDGBG00XLK4l0SOMXNaTLIhj2g4SGIcP5YanI3JmvVNHTKrt+wnZ1cNJOBaF4QBb2rcUxArbjGENiBb9f8Hr6WuiCtINGQT/+2dtH0rDRCLpR5OzacpC4ys5PdE7pLhw6TmcCrMIoOQWFxu/eqEkiL7SBn0XFW6s9h/zJVfK/QFr6kbOvYxdiVkAuIk7xh6mXTlwandswjV0RllPzetKKXLp4jFtEk5JCX684kLbnO/+PwAC4Dnq2JFPmbhsOu541874WnBCEI9qgdlIE2TnIg7K6nkwkRRVLsuW4kH8n9W9oeLOWJdAVQN7hI43o9i/X1wYGhVA"
`endif