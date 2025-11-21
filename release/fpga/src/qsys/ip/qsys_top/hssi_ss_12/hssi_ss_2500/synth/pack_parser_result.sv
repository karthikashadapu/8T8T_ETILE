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

module pack_parser_result #(
    parameter int RESULT_IF_NUM       = 2
   ,parameter int DRV_IFS_NUM         = 2
   ,parameter int RESULT_NUM          = 1
   ,parameter int RESULT_LENGTH       = 1
   ,parameter int EXTRACT_CMD_NUM     = 1
   ,parameter int EXTRACT_FIELD_WIDTH = 1
)(
    input  logic                                                                              clk
   ,input  logic                                                                              rst
   //in if cmd
   ,input  logic                                                                              i_ready
   ,input  logic [RESULT_IF_NUM - 1:0]                                                        i_if_num_valid
   ,input  logic [RESULT_IF_NUM - 1:0][DRV_IFS_NUM - 1:0]                                     i_if_num
   //parsers result in
   ,input  logic [DRV_IFS_NUM - 1:0]                                                          i_parser_result_valid
   ,input  logic [DRV_IFS_NUM - 1:0]                                                          i_parser_result_pkt_recognized
   ,input  logic [DRV_IFS_NUM - 1:0][RESULT_NUM - 1:0][RESULT_LENGTH - 1:0]                   i_parser_result_data
   ,input  logic [DRV_IFS_NUM - 1:0][EXTRACT_CMD_NUM - 1:0][EXTRACT_FIELD_WIDTH - 1:0][7:0]   i_parser_result_ext_data
   //packed parsers result out
   ,output logic [RESULT_IF_NUM - 1:0]                                                        o_parser_result_valid
   ,output logic [RESULT_IF_NUM - 1:0]                                                        o_parser_result_pkt_recognized
   ,output logic [RESULT_IF_NUM - 1:0][RESULT_NUM - 1:0][RESULT_LENGTH - 1:0]                 o_parser_result_data
   ,output logic [RESULT_IF_NUM - 1:0][EXTRACT_CMD_NUM - 1:0][EXTRACT_FIELD_WIDTH - 1:0][7:0] o_parser_result_ext_data
);

   always_ff@(posedge clk) begin
      if(i_ready) begin
         o_parser_result_valid <= '0;
         o_parser_result_pkt_recognized <= '0;
         o_parser_result_ext_data <= '0;
         for(int i = 0; i < RESULT_IF_NUM; i++) begin
            if(i_if_num_valid[i]) begin
               o_parser_result_valid[i]          <= i_parser_result_valid[i_if_num[i]];
               o_parser_result_pkt_recognized[i] <= i_parser_result_pkt_recognized[i_if_num[i]];
               o_parser_result_data[i]           <= i_parser_result_data[i_if_num[i]];
               o_parser_result_ext_data[i]       <= i_parser_result_ext_data[i_if_num[i]];
            end
         end
      end
   end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRhplZ6nzSXjJyQcK0lStKRo9THnFVL5452cEVaC2Dy96xfzdQ+V8QJsh3JwMkai56s4gg7XAL82SU0OWQG/mBH3CJCQ9nEn7MhQn1Nyb3kYI3SiT6kuLBapUJBl58zY7g5GU+PDc9Kp9zNBoqJDiGg+NB3QrgY9Mmc1vXOH76aP8adkT++VTnCVa54z4kSwCuQkW3/uYc+1KXtHuhqJWKMiHzMKIbsxsstX9GbrkXhc0nSkbqI6aIy6PSD5raMocwcsV6H4Mps5EXCRNTmgpxV6cNHQ/SCJXmd9hccZ5IrU1p37jSQs2qssze0R0P2DmMaCxIergxJwKku1R/NOJwyMKCsZe0WwL+m/nhlI++bw0NirrMm4+22Jwb/BOldVsveunp0+6nigtKztumKyQqrmAvQmnxMQmY0SyHA3h8u+eON1mKhLT6wGrz/a6xyuOYxXAa9IvMAe9GB9VLqOgVHDvmR2x3DOg0WjEfbObvCJ0tuckHdCabmz5RLG0WcJ0TtzlHCM4O7NmctoHi6+hfy8iKJgepbqzhgIMUWOCXzAfz2oGmLHjIhrEv27EoAmSpMGEq/TTDKWsEUovMfXJiqrqPzoIuCL1vRP0/tCey+Jpzhicq6l0vgmSCJCyjrkLCObyHrhH5nu56WUWC4lVa6osGoPO5ts29RE5V2sFrNhexcdnlh7MBBZGcMLMuoYjRvMUA/VNDXZBDDg4znMtkrNdnUxzZHO8e3qSCcoYtPfS89p9Qv6OQP3fh3r90F93LkxF1S0xSXbhzUNuZcfLXtL"
`endif