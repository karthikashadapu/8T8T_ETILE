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

module from_axi_mpm_tran #(
    parameter  int LOG2_DATA_WIDTH  = 9
   ,parameter  int NUM_OF_SEG       = 2
   ,parameter  int DRV_IFS_NUM      = 2
   ,parameter  int MIN_PKT_BYTE_LEN = 58
   ,parameter  int RESULT_IF_NUM    = 2
   ,localparam int NUM_OF_SEG_WIDTH = NUM_OF_SEG == 2 ? 1 : parser_pkg::get_width(NUM_OF_SEG)
)(
    input  logic                                                     clk
   ,input  logic                                                     rst
   //AXIs sink/input
   ,output logic                                                     in_axis_mpm_TREADY
   ,input  logic                                                     in_axis_mpm_TVALID
   ,input  logic                                                     in_axis_mpm_TLAST
   ,input  logic [2**LOG2_DATA_WIDTH - 1:0]                          in_axis_mpm_TDATA
   ,input  logic [2**(LOG2_DATA_WIDTH - 3) - 1:0]                    in_axis_mpm_TKEEP
   ,input  logic [NUM_OF_SEG - 1:0]                                  in_axis_mpm_TUSER_last_segment
   //out result if num
   ,output logic [RESULT_IF_NUM - 1:0]                               o_if_valid
   ,output logic [RESULT_IF_NUM - 1:0][DRV_IFS_NUM - 1:0]            o_if_num
   //AXIs source/output
   ,input  logic [DRV_IFS_NUM - 1:0]                                 out_axis_TREADY
   ,output logic [DRV_IFS_NUM - 1:0]                                 out_axis_TVALID
   ,output logic [DRV_IFS_NUM - 1:0]                                 out_axis_TLAST
   ,output logic [DRV_IFS_NUM - 1:0][2**LOG2_DATA_WIDTH - 1:0]       out_axis_TDATA
   ,output logic [DRV_IFS_NUM - 1:0][2**(LOG2_DATA_WIDTH - 3) - 1:0] out_axis_TKEEP
);

   logic [DRV_IFS_NUM - 1:0]                          axis_mpm_TREADY;
   logic                                              axis_mpm_TVALID;
   logic                                              axis_mpm_TLAST;
   logic [2**LOG2_DATA_WIDTH - 1:0]                   axis_mpm_TDATA;
   logic [2**(LOG2_DATA_WIDTH - 3) - 1:0]             axis_mpm_TKEEP;
   logic [NUM_OF_SEG - 1:0]                           axis_mpm_TUSER_last_segment;

   logic [DRV_IFS_NUM - 1:0]                          cmd_valid;
   logic [DRV_IFS_NUM - 1:0][NUM_OF_SEG_WIDTH - 1:0]  cmd_seg;

   axis_mpm_length_det #(
       .LOG2_DATA_WIDTH  (LOG2_DATA_WIDTH)
      ,.NUM_OF_SEG       (NUM_OF_SEG)
      ,.DRV_IFS_NUM      (DRV_IFS_NUM)
      ,.MIN_PKT_BYTE_LEN (MIN_PKT_BYTE_LEN)
   ) axis_mpm_length_det (
       .clk                             (clk)
      ,.rst                             (rst)
      //AXIs sink/input
      ,.in_axis_mpm_TREADY              (in_axis_mpm_TREADY)
      ,.in_axis_mpm_TVALID              (in_axis_mpm_TVALID)
      ,.in_axis_mpm_TLAST               (in_axis_mpm_TLAST)
      ,.in_axis_mpm_TDATA               (in_axis_mpm_TDATA)
      ,.in_axis_mpm_TKEEP               (in_axis_mpm_TKEEP)
      ,.in_axis_mpm_TUSER_last_segment  (in_axis_mpm_TUSER_last_segment)
      //AXIs source/output
      ,.out_axis_mpm_TREADY             (&axis_mpm_TREADY)
      ,.out_axis_mpm_TVALID             (axis_mpm_TVALID)
      ,.out_axis_mpm_TLAST              (axis_mpm_TLAST)
      ,.out_axis_mpm_TDATA              (axis_mpm_TDATA)
      ,.out_axis_mpm_TKEEP              (axis_mpm_TKEEP)
      ,.out_axis_mpm_TUSER_last_segment (axis_mpm_TUSER_last_segment)
      //out ifs cmds
      ,.out_cmd_valid                   (cmd_valid)
      ,.out_cmd_seg                     (cmd_seg)
   );

   result_if_num #(
       .RESULT_IF_NUM   (RESULT_IF_NUM)
      ,.DRV_IFS_NUM     (DRV_IFS_NUM)
      ,.NUM_OF_SEG      (NUM_OF_SEG)
      ,.NUM_OF_SEG_WIDTH(NUM_OF_SEG_WIDTH)
   ) result_if_num (
       .clk         (clk)
      ,.rst         (rst)
      //in if cmd
      ,.i_cmd_ready (&axis_mpm_TREADY)
      ,.i_cmd_valid (cmd_valid)
      ,.i_cmd_seg   (cmd_seg)
      //out if num
      ,.o_if_valid  (o_if_valid)
      ,.o_if_num    (o_if_num)
   );

   for(genvar i = 0; i < DRV_IFS_NUM ; i++) begin : extractors
      axis_ext #(
          .LOG2_DATA_WIDTH  (LOG2_DATA_WIDTH)
         ,.NUM_OF_SEG       (NUM_OF_SEG)
      ) axis_ext (
          .clk                            (clk)
         ,.rst                            (rst)
         //AXIs sink/input
         ,.in_axis_mpm_TREADY             (axis_mpm_TREADY[i])
         ,.in_axis_mpm_TVALID             (axis_mpm_TVALID)
         ,.in_axis_mpm_TLAST              (axis_mpm_TLAST)
         ,.in_axis_mpm_TDATA              (axis_mpm_TDATA)
         ,.in_axis_mpm_TKEEP              (axis_mpm_TKEEP)
         ,.in_axis_mpm_TUSER_last_segment (axis_mpm_TUSER_last_segment)
         //in if cmd
         ,.in_cmd_valid                   (cmd_valid[i])
         ,.in_cmd_seg                     (cmd_seg[i])
         //AXIs source/output
         ,.out_axis_TREADY                (out_axis_TREADY[i])
         ,.out_axis_TVALID                (out_axis_TVALID[i])
         ,.out_axis_TLAST                 (out_axis_TLAST[i])
         ,.out_axis_TDATA                 (out_axis_TDATA[i])
         ,.out_axis_TKEEP                 (out_axis_TKEEP[i])
      );
   end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRimo8noD9JH/ZeB04Skx+M2IY8V0wNhEuhJffaROCvBrULVhlmAtiTw4wrvuEKqwl5ouXNy8gtlYpT3EBcWqiPrjgJJNgSVFpnt1euaYGhqZtlM08OgsZrtJpwlImhJVv1quWh9zRr42qXZ6qmRHelXXiSfQ3f7fzIXzmT9Efeg5xOHLkcVXcXP44xQmmYkqj/46CdiBx6T4Y1JoMIlGAEKP5xwwTGK3ITcJRj2g7xzbsrPgP32CuNlr4+wM95/qqn76zI0WeF+g+bnP6CWRqMw+dPLvPLoU0eNtSIm8v330L+rvEhry7G5nYMqguq0fqX6K8GnfV5wv9nU7gXgKLL8Aq6vRwbirvzmI/DZ7m/GYQn1iU5EUg/pQ9yJl2uJvDfFV0iACKzvB2Zvt4QXkPhqumXLH/gj50Y6OVOdQnzG+cYFN9eqHS2B4B8UCJF6tGmaCl4fgGGMXMVjD1OTsgZV6NvlDuq58SKJ61V7GyenEdkxa162B4bx2jGKcn//FuythcZwgOp6vB6H4Q4CBR5lR+Y0CzZy0iyu6434G0WuilAi9WEM9xDVb5H0Jr2vq5mG2hJcHREP52JDQIn5xQeMUTWxKTuTE+Crai3acR+JtWYwz0cR8nhKjFTHGsGxm45InxAXXcTWTo80nmb/mdQW8CzZ9GAIkcEqCSksho2BITarQFZ/BoGdEF4N70HxVrsCnLXTcL+hdsLSJS5lTODT0q25DyGLFnWBEE1IAz9W276djKXiaJJO7Iig6Ww1BCqhe4dpJL7va5AHyYWyg9fT"
`endif