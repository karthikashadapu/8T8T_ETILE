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

module parser_el #(
    parameter  int LOG2_DATA_WIDTH               = 9
   ,parameter  int LOG2_EXTRACT_FIELD_BYTE_WIDTH = 2
   ,parameter  int TUSER_WIDTH                   = 1
   ,parameter  int RESULT_PKTS_NUM_WIDTH         = 8
   ,parameter  int RESULT_NUM                    = 1
   ,parameter  int EXTRACT_CMD_NUM               = 1
   ,parameter  int IN_OFFSET_BYTE_WIDTH          = 8
   ,parameter  int FAR_EXT_OFFSET                = 1
   ,parameter  int DETECTING_CHAINS_NUMBER       = 1
   ,parameter  int FAR_PATTERN_BYTE_OFFSET       = 1
   ,parameter  int HEADER_ATTRIBUTES_NUMBER      = 1
   ,parameter  int HEADER_ATTRIBUTES_SIZE        = 1
   ,parameter  int CONST_PARSER_LATENCY          = 0 //0-parser has constant latency, 1-source can rise valid when !in_axis_TREADY
   ,localparam int EXTRACT_FIELD_WIDTH           = 2**LOG2_EXTRACT_FIELD_BYTE_WIDTH
   ,localparam int RESULT_LENGTH                 = 16
)(
    input  logic                                                         clk
   ,input  logic                                                         rst

   ,input  logic [IN_OFFSET_BYTE_WIDTH - 1:0]                            in_prev_offset
   ,input  logic [HEADER_ATTRIBUTES_SIZE - 1:0]                          in_header_attributes
   ,input  logic [HEADER_ATTRIBUTES_NUMBER - 1:0]                        in_pkt_type_classifiers[DETECTING_CHAINS_NUMBER]
   ,input  logic [RESULT_PKTS_NUM_WIDTH - 1:0]                           in_result_pkts_num[DETECTING_CHAINS_NUMBER]
   ,input  logic [RESULT_NUM - 1:0][DETECTING_CHAINS_NUMBER - 1:0][RESULT_LENGTH - 1:0] in_result
   ,input  logic [EXTRACT_CMD_NUM - 1:0][DETECTING_CHAINS_NUMBER - 1:0][RESULT_LENGTH - 1:0] in_extract_cmd
   //AXIs sink/input
   ,output logic                                                         in_axis_TREADY
   ,input  logic                                                         in_axis_TVALID
   ,input  logic                                                         in_axis_TLAST
   ,input  logic [2**LOG2_DATA_WIDTH - 1:0]                              in_axis_TDATA
   ,input  logic [2**(LOG2_DATA_WIDTH - 3) - 1:0]                        in_axis_TKEEP
   ,input  logic [TUSER_WIDTH - 1:0]                                     in_axis_TUSER
   //AXIs source/output
   ,input  logic                                                         out_axis_TREADY
   ,output logic                                                         out_axis_TVALID
   ,output logic                                                         out_axis_TLAST
   ,output logic [2**LOG2_DATA_WIDTH - 1:0]                              out_axis_TDATA
   ,output logic [2**(LOG2_DATA_WIDTH - 3) - 1:0]                        out_axis_TKEEP
   ,output logic [TUSER_WIDTH - 1:0]                                     out_axis_TUSER
   //result
   ,output logic                                                         o_parser_result_valid
   ,output logic                                                         o_parser_result_pkt_recognized
   ,output logic [RESULT_PKTS_NUM_WIDTH - 1:0]                           o_parser_result_pkt_num
   ,output logic [RESULT_NUM - 1:0][RESULT_LENGTH - 1:0]                 o_parser_result_data
   ,output logic [EXTRACT_CMD_NUM - 1:0][EXTRACT_FIELD_WIDTH - 1:0][7:0] o_parser_result_ext_data
);

   typedef struct packed {
      logic                                         valid;
      logic                                         pkt_recognized;
      logic [RESULT_PKTS_NUM_WIDTH - 1:0]           pkt_num;
      logic [RESULT_NUM - 1:0][RESULT_LENGTH - 1:0] result;
   } p_result_t;

   logic                                              axis_TREADY;
   logic                                              axis_TVALID;
   logic                                              axis_TLAST;
   logic [2**LOG2_DATA_WIDTH - 1:0]                   axis_TDATA;
   logic [2**(LOG2_DATA_WIDTH - 3) - 1:0]             axis_TKEEP;
   logic [TUSER_WIDTH - 1:0]                          axis_TUSER;

   logic [EXTRACT_CMD_NUM - 1:0][RESULT_LENGTH - 1:0] p_result_extract_cmd;

   p_result_t                                         p_result, p_result_out;

   mpkt_parser #(
       .LOG2_DATA_WIDTH                (LOG2_DATA_WIDTH)
      ,.TUSER_WIDTH                    (TUSER_WIDTH)
      ,.IN_OFFSET_BYTE_WIDTH           (IN_OFFSET_BYTE_WIDTH)
      ,.RESULT_NUM                     (RESULT_NUM)
      ,.EXTRACT_CMD_NUM                (EXTRACT_CMD_NUM)
      ,.DETECTING_CHAINS_NUMBER        (DETECTING_CHAINS_NUMBER)
      ,.FAR_PATTERN_BYTE_OFFSET        (FAR_PATTERN_BYTE_OFFSET)
      ,.HEADER_ATTRIBUTES_NUMBER       (HEADER_ATTRIBUTES_NUMBER)
      ,.HEADER_ATTRIBUTES_SIZE         (HEADER_ATTRIBUTES_SIZE)
      ,.CONST_PARSER_LATENCY           (CONST_PARSER_LATENCY)
   ) parser (
       .clk                            (clk)
      ,.rst_n                          (~rst)
      ,.in_prev_offset                 (in_prev_offset)
      ,.in_header_attributes           (in_header_attributes)
      ,.in_pkt_type_classifiers        (in_pkt_type_classifiers)
      ,.in_result_pkts_num             (in_result_pkts_num)
      ,.in_result                      (in_result)
      ,.in_extract_cmd                 (in_extract_cmd)
      //AXIs sink/input
      ,.in_axis_TREADY                 (in_axis_TREADY)
      ,.in_axis_TVALID                 (in_axis_TVALID)
      ,.in_axis_TLAST                  (in_axis_TLAST)
      ,.in_axis_TDATA                  (in_axis_TDATA)
      ,.in_axis_TKEEP                  (in_axis_TKEEP)
      ,.in_axis_TUSER                  (in_axis_TUSER)
      //AXIs source/output
      ,.out_axis_TREADY                (axis_TREADY)
      ,.out_axis_TVALID                (axis_TVALID)
      ,.out_axis_TLAST                 (axis_TLAST)
      ,.out_axis_TDATA                 (axis_TDATA)
      ,.out_axis_TKEEP                 (axis_TKEEP)
      ,.out_axis_TUSER                 (axis_TUSER)
      //result
      ,.o_parser_result_valid          (p_result.valid)
      ,.o_parser_result_pkt_recognized (p_result.pkt_recognized)
      ,.o_parser_result_pkt_num        (p_result.pkt_num)
      ,.o_parser_result_data           (p_result.result)
      ,.o_parser_result_extract_cmd    (p_result_extract_cmd)
   );

   if(EXTRACT_CMD_NUM) begin : extractor_enabled
      extractor_gen #(
          .LOG2_DATA_WIDTH          (LOG2_DATA_WIDTH)
         ,.EXTRACTS_NUMBER          (EXTRACT_CMD_NUM)
         ,.TUSER_WIDTH              ($bits(p_result_t) + TUSER_WIDTH)
         ,.OFFSET_WIDTH             (RESULT_LENGTH)
         ,.LOG2_EXTRACT_FIELD_WIDTH (LOG2_EXTRACT_FIELD_BYTE_WIDTH)
         ,.FAR_EXT_OFFSET           (FAR_EXT_OFFSET)
      ) extractor (
          .clk               (clk)
         ,.rst_n             (~rst)
         //AXIs sink/input
         ,.in_axis_TREADY    (axis_TREADY)
         ,.in_axis_TVALID    (axis_TVALID)
         ,.in_axis_TLAST     (axis_TLAST)
         ,.in_axis_TDATA     (axis_TDATA)
         ,.in_axis_TKEEP     (axis_TKEEP)
         ,.in_axis_TUSER     ({p_result, axis_TUSER})
         //AXIs source/output
         ,.out_axis_TREADY   (out_axis_TREADY)
         ,.out_axis_TVALID   (out_axis_TVALID)
         ,.out_axis_TLAST    (out_axis_TLAST)
         ,.out_axis_TDATA    (out_axis_TDATA)
         ,.out_axis_TKEEP    (out_axis_TKEEP)
         ,.out_axis_TUSER    ({p_result_out, out_axis_TUSER})
         //extract commands
         ,.in_ext_valid      (p_result.valid && p_result.pkt_recognized)
         ,.in_ext_offset     (p_result_extract_cmd)
         ,.in_ext_length     ('0)

         ,.out_ext_valid     ()
         ,.out_ext_data      (o_parser_result_ext_data)
         ,.out_ext_length    ()
      );

      always_comb begin
         o_parser_result_valid          = p_result_out.valid;
         o_parser_result_pkt_recognized = p_result_out.pkt_recognized;
         o_parser_result_data           = p_result_out.result;
         o_parser_result_pkt_num        = p_result_out.pkt_num;
      end
   end else begin : extractor_disabled
      always_comb begin
         axis_TREADY     = out_axis_TREADY;
         out_axis_TVALID = axis_TVALID;
         out_axis_TLAST  = axis_TLAST;
         out_axis_TDATA  = axis_TDATA;
         out_axis_TKEEP  = axis_TKEEP;
         out_axis_TUSER  = axis_TUSER;

         o_parser_result_valid          = p_result.valid;
         o_parser_result_pkt_recognized = p_result.pkt_recognized;
         o_parser_result_pkt_num        = p_result.pkt_num;
         o_parser_result_data           = p_result.result;
         o_parser_result_ext_data       = '0;
      end
   end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRiZRFci+lpg7OmWZ514oRKe32tueTpUp/se7eVt69s4WdSA//nkzonpDuKRJ79FFpeP33pix+q4UiHilFEHJU3bKnnxPKtFkgRjau7DJUr6GzyIK3UhhRT0DiFWmQGM/ig+t0+4wUMj3mTS64flgY8uO/fQy8H6fPLpXZjzgsXJ7db3zcGupW5QTMyMO0CegGhUBCqpsnJMwBsghMLwgu6gAshUW3yAmHeUjG/xbbPJeSGJ5/d0LS5nS2SMZ67uQq3RC5wTbnjnEjZyNFLkM/UoXXJeOZwEnDkU+yw3TriyUnYgZsfjxcFPMENZ+MqFEZlQC9WHeR9EFpdHvXluRwkPXGoA+yR7DgGhjw//tN6Q78uIOTkfZacXeL0ZzCDjEVIi1aJfQrfBM7inUxvrUSvefZZkRPwfvQ5M9FoETaNaFL0PU6c/SxjNNELDy+gpRNXZRiRjSeBBrUUZGrDP0yMVeAe3YFkdbxvhl5qPO/FldTypMB1XmVr4ntw+gHhHjdSig6eUPkTF8n9/c1ocMg4jRicAw4ufutPDul/iT15+5S50LGEqNMajH2H5vo6P2ig7RGutfHQIXLm57FJCLD0v3KfUoT20S4/Nk5VwBD636PN5l0lykRd3PgFtCCr8eEjn3QAH7/S90aBz9NI6VCjkD89z/zLa6zq/nx0w1QL1aKH/AstTBZe19CG9jgl2MXt6ivF713TejfzXFD58qfPCRgF7AbRf57hsBJjcNPDnvGabMXWG9zlG1W+ZElkx6rT7EpcrYtOH3yD4PaUAIFqY"
`endif