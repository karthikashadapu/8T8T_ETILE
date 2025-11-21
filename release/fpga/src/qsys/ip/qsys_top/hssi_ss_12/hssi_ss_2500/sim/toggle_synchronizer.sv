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


// INTEL CONFIDENTIAL
//
// Copyright 2021-2021 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials, and
// your use of them is governed by the express license under which they were
// provided to you ("License"). Unless the License provides otherwise, you may
// not use, modify, copy, publish, distribute, disclose or transmit this
// software or the related documents without Intel's prior written permission.
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.

module toggle_synchronizer (
    input  logic clk_in
   ,input  logic rst_in
   ,input  logic clk_out
   ,input  logic sig_in
   ,output logic sig_out
);

   logic       reg_in;
   logic [2:0] reg_out;

   always_ff@(posedge clk_in) begin
      if (rst_in) begin
         reg_in <= '0;
      end else if (sig_in) begin
         reg_in <= ~reg_in;
      end
   end

   always_ff@(posedge clk_out) begin
      reg_out[0] <= reg_in;
      reg_out[2:1] <= reg_out[1:0];
   end

   always_comb sig_out = reg_out[1] ^ reg_out[2];
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRi0NXxGXwNflZBV79PnFlio8iaeIwCWspqkxb7EJvi3T4tLJTKYjtq1pTJKEmUBJjCRncv59gs7eNJH0xOMQlcVs/dNKYO8X6k9FZUNptUQiuR8aoZaF2VsRURdX4faL+MwC0EcZzKSUl6id2cfIhWz+7vC+rmS+LYh3jddkis621YjoSOp5Z/y/E5ukSCRECMXVjCL27kLT2SdA677MVDKbMI+bFxq7+ngyOrKgnsiRr8IxgWdfx02vPHn4EKwOJgbxvWXziSKa48xzUfoajeOfQ25OALTODHoCrqO9QfYyZe/h3Qq+mZXCXEh1J0hGRNAxwiJL8U/0hhzBIM513wJDB9Xmem87TnsasS/2XHQsfu2yelBNTUwBVsToQ9GHgVqcegK9vYJYkCOi8VEv0YSRGIezvn/+/4cI+14VuKXI2IeQWsUTVzOU/48m29/Kpio1DQ5rO3/yehDQjuuKp3GEpVvwE/87SWNjhiH1dNj1dyWW+MzFKduDsNcI9altfUc3uYP8gPDzEmx1rMf7k/vGtlbPgQAK9ZD0g6DUGfoXVg51mpagixFftgN5aF+gExYdBgSX+TcC4fmEFUR4iAm8xq6N0wyrTt+r0plYnWR+VSk+c7UONN2hQDFb/6Cmvb9G8+fqMCZXgDF8sUwV/sLrERmq2hzsZnGl26qqjUiHBDp3koDcGxsd2C6iQJr5PytsoxAPyJ+rqiNBJl9qkV7VwPLTHw4LR4SGttiPEWVW+HBdVj7jybPwsVELbbXLMnmW8Wvd9QOxbrGJ9g2XS8B"
`endif