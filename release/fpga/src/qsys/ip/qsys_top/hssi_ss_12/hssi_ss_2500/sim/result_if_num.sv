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


// Copyright 2022-2022 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials, and
// your use of them is governed by the express license under which they were
// provided to you ("License"). Unless the License provides otherwise, you may
// not use, modify, copy, publish, distribute, disclose or transmit this
// software or the related documents without Intel's prior written permission.
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.

module result_if_num #(
    parameter  int RESULT_IF_NUM    = 2
   ,parameter  int DRV_IFS_NUM      = 2
   ,parameter  int NUM_OF_SEG       = 2
   ,parameter  int NUM_OF_SEG_WIDTH = 2
)(
    input  logic                                             clk
   ,input  logic                                             rst
   //in if cmd
   ,input  logic                                             i_cmd_ready
   ,input  logic [DRV_IFS_NUM - 1:0]                         i_cmd_valid
   ,input  logic [DRV_IFS_NUM - 1:0][NUM_OF_SEG_WIDTH - 1:0] i_cmd_seg
   //out if num
   ,output logic [RESULT_IF_NUM - 1:0]                       o_if_valid
   ,output logic [RESULT_IF_NUM - 1:0][DRV_IFS_NUM - 1:0]    o_if_num
);

   localparam int CMD_VALID_DELAY = 2;
   localparam int DRV_IFS_NUM_WIDTH = parser_pkg::get_width(DRV_IFS_NUM);
   localparam int MID_SEG = NUM_OF_SEG / 2;

   //logic [DRV_IFS_NUM_WIDTH - 1:0]                  prev_if;
   logic [CMD_VALID_DELAY - 1:0][DRV_IFS_NUM - 1:0] cmd_valid_r;
   logic [CMD_VALID_DELAY - 1:0][DRV_IFS_NUM - 1:0][NUM_OF_SEG_WIDTH - 1:0] cmd_seg_r;

   always_ff@(posedge clk) begin
      if(rst) begin
         cmd_valid_r <= '0;
      end else if(i_cmd_ready) begin
         cmd_valid_r[0] <= i_cmd_valid;
         cmd_seg_r[0] <= i_cmd_seg;
         for(int i = 0; i < CMD_VALID_DELAY-1; i++) begin
            cmd_valid_r[i+1] <= cmd_valid_r[i];
            cmd_seg_r[i+1] <= cmd_seg_r[i];
         end
      end
   end

   //always_ff@(posedge clk) begin
   //   if(rst) begin
   //      prev_if <= '0;
   //   end else if(i_cmd_ready) begin
   //      for(int i = 0; i < DRV_IFS_NUM; i++) begin
   //         if(cmd_valid_r[CMD_VALID_DELAY-1][i]) begin
   //            prev_if <= i;
   //         end
   //      end
   //   end
   //end

   //int res_num;
   //always_ff@(posedge clk) begin
   //   res_num = 0;
   //   if(i_cmd_ready) begin
   //      o_if_valid <= '0;
   //      for(int i = prev_if; i < DRV_IFS_NUM; i++) begin
   //         if(cmd_valid_r[CMD_VALID_DELAY-1][i]) begin
   //            o_if_valid[res_num] <= '1;
   //            o_if_num[res_num] <= i;
   //            ++res_num;
   //         end
   //      end

   //      for(int i = 0; i < prev_if; i++) begin
   //         if(cmd_valid_r[CMD_VALID_DELAY-1][i]) begin
   //            o_if_valid[res_num] <= '1;
   //            o_if_num[res_num] <= i;
   //            ++res_num;
   //         end
   //      end
   //   end
   //end

   always_ff@(posedge clk) begin
      if(i_cmd_ready) begin
         o_if_valid <= '0;
         for(int i = 0; i < DRV_IFS_NUM; i++) begin
            if(cmd_valid_r[CMD_VALID_DELAY-1][i]) begin
               if(RESULT_IF_NUM == 1) begin
                  o_if_valid[0] <= '1;
                  o_if_num[0] <= i;
               end else if(cmd_seg_r[CMD_VALID_DELAY-1][i] < MID_SEG) begin
                  o_if_valid[0] <= '1;
                  o_if_num[0] <= i;
               end else begin
                  o_if_valid[1] <= '1;
                  o_if_num[1] <= i;
               end
            end
         end
      end
   end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRjGqiEHW1Cg/geXJXdMRH8SHcj++6TwDKTJn8Oac4qCtCCyu72DqO1K05kcFZeAB7L0A0DCbjFfdPutlxk1JkfP4CKb3nL4SOYh5MppRV2M4yc2FzYjSpJHr+5BoxHdFPxLPzGreHcDfgDVSND/3e/qMs+SzbXQADiGoL/cl06T1BfeF0Nt9O6XjsbMQWxl96KDtORXvG2T6/959FwTE9UEMiINOOJQXo9QzMey2b1xWkyzA7G9+0O+LtXs84D+fxbIJBRqmEcQaeLxAzTgvm6belg4GMCUsYWi7hTyu2MKk3MkbshSpdzJbls4uBOMO44szfijpOmTCFnEBl+ukRI5e+Av/9dolVZ6K6iRZIlmtRuO3zFVmnWV8bbForT10JKrBn/2Kdyu/cbcPPSJmng87Pc3zi6MqSF3lKjIwyWRMbbVXfuaxqrqMGmta7uJNO8K08bcl2hKhjCPbBlkfqdvbTI0i24YoGWleA8AHalkbmlE07NWKqBrOlHvY+Y95AosUXbb4ebxjKLx3nNKUegv05WB9AqWntySUq8AtLd6dHyQUp4VQzU4qThLUJoOxZA3WSsVz8TE8yF9pz7MlpXSqksjtI/9Opo3APXDXiblACx3/o2QjPyfTI8iup3DwdSyWf4qzf4gFisy7ih2wvw581Ru34YKeL3oXH9JLuaH7DcCsWlXrOlkhcLgF66nVeq/UlthLzA2bwo4BVpeNDr0W4I6GLrvp/vnnXDZe6mNTBE0FCwv9UZnRyjjXxC/Ios/BBoVK+/6LBKG70BCOAH2"
`endif