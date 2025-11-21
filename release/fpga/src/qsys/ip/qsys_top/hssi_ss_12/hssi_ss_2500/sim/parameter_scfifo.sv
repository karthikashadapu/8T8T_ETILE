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
// Copyright 2020-2021 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials, and
// your use of them is governed by the express license under which they were
// provided to you ("License"). Unless the License provides otherwise, you may
// not use, modify, copy, publish, distribute, disclose or transmit this
// software or the related documents without Intel's prior written permission.
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.

module parameter_scfifo #(
    parameter int ADDR_WIDTH        = 4
   ,parameter int DATA_WIDTH        = 64
   ,parameter int ALMOST_FULL_VALUE = 3
   ,parameter     RAM_BLOCK_TYPE    = "MLAB" //MLAB or M20K
   ,parameter int NUMBER_WORDS      = 0
) (
    input  logic                    clock
   ,input  logic                    aclr
   ,input  logic                    wrreq
   ,input  logic                    rdreq
   ,input  logic [DATA_WIDTH - 1:0] data
   ,output logic                    almost_full
   ,output logic                    empty
   ,output logic                    full
   ,output logic [DATA_WIDTH - 1:0] q
   ,output logic [ADDR_WIDTH - 1:0] usedw
);
   localparam int NUMBER_WORDS_FINAL = (NUMBER_WORDS & RAM_BLOCK_TYPE == "MLAB") ? NUMBER_WORDS : 2**ADDR_WIDTH;
   localparam int ADDR_WIDTH_FINAL = $clog2(NUMBER_WORDS_FINAL);
   localparam int ALMOST_FULL = NUMBER_WORDS_FINAL - 1 - ALMOST_FULL_VALUE;
   localparam     RAM_BLOCK_TYPE_STRING = {"RAM_BLOCK_TYPE=", RAM_BLOCK_TYPE};

   scfifo scfifo_component (
       .clock         (clock      )
      ,.data          (data       )
      ,.rdreq         (rdreq      )
      ,.wrreq         (wrreq      )
      ,.almost_full   (almost_full)
      ,.empty         (empty      )
      ,.full          (full       )
      ,.q             (q          )
      ,.aclr          (aclr       )
      ,.almost_empty  (           )
      ,.eccstatus     (           )
      ,.sclr          (1'b0       )
      ,.usedw         (usedw      )
   );
   defparam
      scfifo_component.add_ram_output_register  = "ON",
      scfifo_component.almost_full_value  = ALMOST_FULL,
      scfifo_component.enable_ecc  = "FALSE",
      scfifo_component.intended_device_family  = "Arria 10",
      scfifo_component.lpm_hint  = RAM_BLOCK_TYPE_STRING,
      scfifo_component.lpm_numwords  = NUMBER_WORDS_FINAL,
      scfifo_component.lpm_showahead  = "ON",
      scfifo_component.lpm_type  = "scfifo",
      scfifo_component.lpm_width  = DATA_WIDTH,
      scfifo_component.lpm_widthu  = ADDR_WIDTH_FINAL,
      scfifo_component.overflow_checking  = "ON",
      scfifo_component.underflow_checking  = "ON",
      scfifo_component.use_eab  = "ON";
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRgjTNwhzZ4WcvXC/zi/fsLnL5wf9j+nWpty+gRhUKSngvgRgIu35IPE9TidxVss7opG29MvI7XMvmaWoiA37cZfE9YGhfIMLdM56YMUOntU1XfuCTsyyKWGrk5D26C78q7g3i85Wa1c0n0b0TonVlTfzXLSBuPCxo5e88SX8I4BBI8g1Xi0QAbS7MdxsOq9D68GEs/KynQA5jKXrAuT8BZsX+7DQSIspfqmTPKv2jgpQyiwAO69WXSJxEiST2LVHBcw5Z1M48ThY37Ro/Wy5WsI7nuyBFWMpyui/qI5h/O5iC+zy7ceEAXDYUXE17wWFlu2xtqfBhvBYc40toSFIeueDOG+MN/IYd3MOQ2pqR1rEfKxn7IRTu7KD9mTALk1uWkrgNdlv4Z7c4Xtz8krvY02/KSeZ9V39s+ImGaTumWJ5SSG+UftLcjsB2JcTqDD792V+LEmcugC27uPXbvGQ8b4jj566SFtZNYFtr2G/hLMKBfcd6wWxMkwAS3PjcgG2YyTCP6az8yKikF1bptxBh4dVlhra7QUhK0H7bp0vnwt3yxqR6JZemrwpD9tNueGxz3u9fYqrnnQlbkIKDxEHSZTIx+IBzPWnShrqN0i3n0lHqhAG46AQYmZTMuVhzhhdxbvbqTcTw1nSiJ88IJXxRdFTnnjpJR0V80nv5ClxzkP2XVg25T/BBxoY7pMp4nPONDcjnk73FhbyLz/eXp9qZEPD0cjzQzauTLPFS4dBBfawfOIpxGQa7QyyzRhjA220UOeZ+halbo+rw7Wsv+MmZtf"
`endif