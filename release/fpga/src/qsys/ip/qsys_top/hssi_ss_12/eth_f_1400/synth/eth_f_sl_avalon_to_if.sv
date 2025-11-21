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

module eth_f_sl_avalon_to_if #(
    parameter WORD_WIDTH  = 64,
    parameter EMPTY_BITS  = 3
) (
    input                     i_reset,
    input                     i_clk,

    input   [WORD_WIDTH-1:0]  i_data,
    input                     i_valid,
    input                     i_sop,
    input                     i_eop,
    input   [EMPTY_BITS-1:0]  i_empty,
    input                     i_error,
    input                     i_skip_crc,
    input                     i_ready,

    output  [WORD_WIDTH-1:0]  o_data,
    output                    o_valid,
    output                    o_inframe,
    output  [EMPTY_BITS-1:0]  o_empty,
    output                    o_error,
    //output                    o_numvalid,
    output                    o_skip_crc,
    output                    o_ready
);


    reg [EMPTY_BITS-1:0]   empty_reg;
    reg [WORD_WIDTH-1:0]   data_reg;
    reg                    valid_reg;
    reg                    error_reg;
    reg                    skip_crc_reg;
    reg                    o_skip_crc_reg;
    reg                    ready_reg;

    reg                    o_inframe_reg;
    //reg [clogb2(WORD_WIDTH/8)-1:0]  o_numvalid_reg;

    wire inframe = (i_valid & i_sop) ? 1'b1 : ((i_valid & i_eop) ? 1'b0 : o_inframe_reg);

    always @(posedge i_clk) begin
        if (i_reset) begin
          o_inframe_reg <= 0;
        end
        else begin
          o_inframe_reg <= inframe;
        end
    end

    always @(posedge i_clk) begin
        empty_reg       <= i_empty;
        data_reg        <= i_data;
        valid_reg       <= i_valid;
        error_reg       <= i_error;
        skip_crc_reg    <= i_skip_crc;
        o_skip_crc_reg  <= i_skip_crc;
        ready_reg       <= i_ready;
    end

    assign o_inframe    = o_inframe_reg;
    assign o_data       = data_reg;
    assign o_valid      = valid_reg;
    assign o_empty      = empty_reg;
    assign o_error      = error_reg;
    assign o_skip_crc   = o_skip_crc_reg;
    assign o_ready      = ready_reg;

   function integer clogb2;
      input integer input_num;
      begin
         for (clogb2=0; input_num>0; clogb2=clogb2+1)
           input_num = input_num >> 1;
         if(clogb2 == 0)
           clogb2 = 1;
      end
   endfunction

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onozHi78K+wsNKij1790I3gIsNQs2onkKe5aLrDRBAi84QeE2h47MHJN32A9Iiu+rSSPc72I32l3BbqrgaNI+LjowFKMmKpFdeZeWSJgQyNDLlJvMhUyCrIgDGLHTxkinULiOBUZ4Z3kU9HWcZR8fJZHW/1+2j9YKrUGq0ATFLBJX7lkRv9X36szW7Tkr36yeJwb1TY3T4stJVN1F0MdPQszSkvQSlfUprNN2wpKa/S1/jG5wI0xwpOVmA/aWmaD8fZYhMKWYqO+lmYQyCRJ2dqiWmQOard3DmpgyuNgiNBEEgd08hSuMY3LN7ctPMZpxUO3PR7hXcy/SM8gypIK1J0oiqj0sorM1Xo0/SH/39kv9DzAtSxAWTNan//NDqXzgrd5AMweldF7nRziftRSyW6O53YfxAmrUTdoL7ORrQnYVxrtIeLueivBxCXp5uEk+t7KpC5lV6PP2UGjp2uNUFE3iJ1TnlEDLQRVzMMlo93qqJHECGo+51azTShpm7B1XhIxdGeuPNnxTcL7+q70IwFSkycwbpnxFgXfFxZboPKcHTbry2NEcPUJPHqgaR3XktJe4n9jSPL61rXOZ5J7dINn2IT8d1SrhbKwEvtyYih1ZRCwzBEXBabSxNJLpetWcq7q0fOs794A+Ec6dCwnETBBAQx64IelwueV/D8/qj3q0a8t3FXl9z2LFRHM7CkAmnOUei/CqX2xL+Qbx/xbg9bXk49Y07Ifr0JxhCuhqGy35p+QOFwpgmKL7PsBSGlyMpZZptTf3ScPXsuw9UNUZxVf"
`endif