// INTEL CONFIDENTIAL
//
// Copyright 2018-2022 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials, and
// your use of them is governed by the express license under which they were
// provided to you ("License"). Unless the License provides otherwise, you may
// not use, modify, copy, publish, distribute, disclose or transmit this
// software or the related documents without Intel's prior written permission.
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.

module clock_bus #(
   parameter int NUM_PORTS = 8
) (
    input  logic [NUM_PORTS-1:0] i_clk_bus
   ,input  logic [NUM_PORTS-1:0] i_rst_bus

   ,output logic                 o_clk_0
   ,output logic                 o_clk_1
   ,output logic                 o_clk_2
   ,output logic                 o_clk_3
   ,output logic                 o_clk_4
   ,output logic                 o_clk_5
   ,output logic                 o_clk_6
   ,output logic                 o_clk_7

   ,output logic                 o_rst_0
   ,output logic                 o_rst_1
   ,output logic                 o_rst_2
   ,output logic                 o_rst_3
   ,output logic                 o_rst_4
   ,output logic                 o_rst_5
   ,output logic                 o_rst_6
   ,output logic                 o_rst_7
);

   always_comb begin
      o_clk_0 = i_clk_bus[0];
      o_clk_1 = i_clk_bus[1];
      o_clk_2 = i_clk_bus[2];
      o_clk_3 = i_clk_bus[3];
      o_clk_4 = i_clk_bus[4];
      o_clk_5 = i_clk_bus[5];
      o_clk_6 = i_clk_bus[6];
      o_clk_7 = i_clk_bus[7];
   end

   always_comb begin
      o_rst_0 = i_rst_bus[0];
      o_rst_1 = i_rst_bus[1];
      o_rst_2 = i_rst_bus[2];
      o_rst_3 = i_rst_bus[3];
      o_rst_4 = i_rst_bus[4];
      o_rst_5 = i_rst_bus[5];
      o_rst_6 = i_rst_bus[6];
      o_rst_7 = i_rst_bus[7];
   end

endmodule
