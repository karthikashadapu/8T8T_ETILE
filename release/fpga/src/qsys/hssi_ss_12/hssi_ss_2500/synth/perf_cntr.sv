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


// Copyright 2021-2023 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials, and
// your use of them is governed by the express license under which they were
// provided to you ("License"). Unless the License provides otherwise, you may
// not use, modify, copy, publish, distribute, disclose or transmit this
// software or the related documents without Intel's prior written permission.
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.

module perf_cntr #(
   parameter int CNT_WIDTH = 64
)(
    input  logic                   clk
   ,input  logic                   rst
   ,input  logic                   i_clr
   ,input  logic                   i_cnt_en
   ,output logic [CNT_WIDTH - 1:0] o_cntr
);

   localparam int INTERNAL_CNT_WIDTH = 32;

   logic [INTERNAL_CNT_WIDTH - 1:0] low_cntr, high_cntr;
   logic                            carry, cnt_en_r, cnt_full, cnt_afull;

   function automatic logic cntr_almost_overflow(
      input logic [INTERNAL_CNT_WIDTH - 1:0] cntr
   );
      return (&cntr[INTERNAL_CNT_WIDTH - 1:1]) & ~cntr[0];
   endfunction

   always_comb cnt_full  = &((CNT_WIDTH - INTERNAL_CNT_WIDTH)'(high_cntr)) & (&low_cntr);
   always_comb cnt_afull = &((CNT_WIDTH - INTERNAL_CNT_WIDTH)'(high_cntr)) & (&low_cntr[INTERNAL_CNT_WIDTH - 1:1]);
   always_ff@(posedge clk) begin
      cnt_en_r <= '0;
      if(i_cnt_en && cnt_afull && cnt_en_r) begin
         cnt_en_r <= '0;
      end else if(i_cnt_en && !cnt_full) begin
         cnt_en_r <= '1;
      end
   end

   always_ff@(posedge clk) begin
      if(rst || i_clr) begin
         low_cntr  <= '0;
         high_cntr <= '0;
         carry     <= '0;
      end else begin
         if(cnt_en_r) begin
            carry     <= cntr_almost_overflow(low_cntr);
            low_cntr  <= INTERNAL_CNT_WIDTH'(low_cntr + 1'b1);
            high_cntr <= INTERNAL_CNT_WIDTH'(high_cntr + carry);
         end
      end
   end

   always_comb o_cntr = CNT_WIDTH'({high_cntr, low_cntr});

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRiCrO2zZ4aqirSiZQGkrBTpfiuNlIicb2Ge1n09qhdaK1cRtxKQJz0Itg/oaxVeEFlDiFwnsui8thVU3/Y49rgVOUjecB8jNcTV2tyW/07M+sTSpU5ccPR2WlMW0y0KsIsACgtGU+nUP7a2bF2PKlszAoRzFeyXgfiy3P9Y+/wf7imSBDsgSVK23CBCSdObptDfON+EXyzTU2LIHtiMw5pVPERdfwfc8kCqFodI/RK+ZRn4kPENGsZJJA707CsNGmbO2wPto6gxSmfHW7Y/rBOwS9U72QZVT5gNdJa3Yb60KVZHiQ5Nt4rtHJgwhUkxsGDyVCm4KrUI8yENtQXfiML9CDMU7ZMpGhnpL5U/0pF1X8rZZw8xW8bXPUdmNeKYDMcwjVVj/equiKVyYjGp36ZSu3OVgM9W8wqL2CeZ9sWbwfEQuzaMSPn+mRIGVb90Jg6bFpY5/mZ92sP7emHsL08XiwzCIdoAwBhRftqm9oUWHiN2xT2UCFYYa/RVagIpQFqtkIWmP2cBBi5YSwWGRg+DVb/Giaa+/dBwTiFOeXlMAhXtBPyqKJYLyVtpjeKr4199ZLo1/4ekmcVBMQ/NdQIbQPQJZmob8dSUMcMWBXZS/CtSb2S4D+qQJDyti7/WNkvZihPA+ErSGQ2DkJd0NxPIzboFauqi8yVqcHSrzZwFHvboBED8600pSdPoITOvqUoFBRE5CeM1yUBfqCNg58DFg6DmyXQU9ZbG0kYiCkbp5zjGVBZs1lUDD1lO8e/8m9j7khmbyt9GaptY1YI7D1ml"
`endif