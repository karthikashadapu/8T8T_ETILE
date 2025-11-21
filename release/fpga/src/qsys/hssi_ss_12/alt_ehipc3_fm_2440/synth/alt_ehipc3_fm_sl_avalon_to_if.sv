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

module alt_ehipc3_fm_sl_avalon_to_if #(
    parameter WORD_WIDTH  = 64,
    parameter EMPTY_BITS  = 3,
    parameter PTP_WIDTH   = 1
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
    input   [PTP_WIDTH-1:0]   i_ptp,
    input                     i_ready,

    output  [WORD_WIDTH-1:0]  o_data,
    output                    o_valid,
    output                    o_inframe,
    output  [EMPTY_BITS-1:0]  o_empty,
    output                    o_error,
    //output                    o_numvalid,
    output                    o_skip_crc,
    output  [PTP_WIDTH-1:0]   o_ptp,
    output                    o_ready
);


    reg [EMPTY_BITS-1:0]   empty_reg;
    reg [WORD_WIDTH-1:0]   data_reg;
    reg                    valid_reg;
    reg                    error_reg;
    reg                    skip_crc_reg;
    reg                    o_skip_crc_reg;
    reg [PTP_WIDTH-1:0]    ptp_reg;
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
        ptp_reg         <= i_ptp;
        ready_reg       <= i_ready;
    end

    assign o_inframe    = o_inframe_reg;
    assign o_data       = data_reg;
    assign o_valid      = valid_reg;
    assign o_empty      = empty_reg;
    assign o_error      = error_reg;
    assign o_skip_crc   = o_skip_crc_reg;
    assign o_ptp        = ptp_reg;
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
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh2bUoO7NF4g23vukerO3BSjILUlwn7wlizwe22wbBr5zehw5C6Fg2EOhl3zeCDwDOvhaKH0aaTIUPKRNKRXFpt8SMFHjKDcX2AErVqzbG9MqSYM4p5kh8w1L4BgsKAC0AOmVybPongA60h2vBIwzFyLkqJIeonz4/+ATZVFgJi+thIDwcubTpQYb5tKfCz17jhJOzbEaCkGrKQUCL47QRtLoWo58nnqVKk0hRRImnfN74PIgHAnBWBv4aZ/V6Zyv7zN5OYZhPgnfR+QbIcx8wm8hcok6fpLvtrkICpWzMYLbUXgrHsphFeEXDqLcoWVsy+jSSVcy1r7st2gLRQs8fe0mkkCsBcnP9AeDa+nIriGpphLjr/dYpmw/KMnJOVWitUEOS35RDJKEn5pqwN09tT/DTsMY5j8hpxpIxXb2h4vT/8Pgl3ITFhi78KyvMyYWfyUWxT5vl5EGE+GrxmlYbTkXtezKRFXeE4Ov3A0drSWfq91XyVBFivAc4mSshLxsVNeGTEccKk7Uia++KCRraO98Pw6V79JR5XVk+bk8NbG71lNYqxtLq5pyKnidnKR1N1zsMOhdpobp9nvPcgB350XsKl8cFDOiEdI+whFuIunItKMcjYpnBsC8EMbkT74aF+WApQn98cp/9GU2oIXnt0BkoXYLMpHp68Qpab/S8wOVCHk1fFt3gBT+Zs62VzZVOjvvDSpJaJAkvCOO97QtBq5XbPz2yf8oSGXpw2Cb5+sUv3SvRhlchvx+ZLKADOonVaPNSOMHt0yIUebYGhE7y8t"
`endif