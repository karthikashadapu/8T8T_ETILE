// INTEL CONFIDENTIAL
//
// Copyright 2023-2023 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials, and
// your use of them is governed by the express license under which they were
// provided to you ("License"). Unless the License provides otherwise, you may
// not use, modify, copy, publish, distribute, disclose or transmit this
// software or the related documents without Intel's prior written permission.
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.

module dc_fifo_param #(
    parameter int ADDR_WIDTH     = 4
   ,parameter int DATA_WIDTH     = 64
   ,parameter     RAM_BLOCK_TYPE = "MLAB" //MLAB or M20K
   ,parameter int NUMBER_WORDS   = 0
) (
   //wr clk domain
    input  logic                  wrclk
   ,input  logic                  wrreq
   ,output logic                  wrfull
   ,input  logic [DATA_WIDTH-1:0] data
   //rd clk domain
   ,input  logic                  rdclk
   ,input  logic                  aclr
   ,input  logic                  rdreq
   ,output logic [DATA_WIDTH-1:0] q
   ,output logic                  rdempty
);

   localparam int NUMBER_WORDS_FINAL = (NUMBER_WORDS & RAM_BLOCK_TYPE == "MLAB") ? NUMBER_WORDS : 2**ADDR_WIDTH;
   localparam     RAM_BLOCK_TYPE_STRING = {"RAM_BLOCK_TYPE=", RAM_BLOCK_TYPE, ",DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE"};

   dcfifo dcfifo_component (
       .data       (data)
      ,.rdclk      (rdclk)
      ,.rdreq      (rdreq)
      ,.wrclk      (wrclk)
      ,.wrreq      (wrreq)
      ,.q          (q)
      ,.rdempty    (rdempty)
      ,.wrfull     (wrfull)
      ,.aclr       (aclr)
      ,.eccstatus  ()
      ,.rdfull     ()
      ,.rdusedw    ()
      ,.wrempty    ()
      ,.wrusedw    ()
   );
   defparam
      dcfifo_component.enable_ecc  = "FALSE",
      dcfifo_component.intended_device_family  = "Agilex",
      dcfifo_component.lpm_hint  = RAM_BLOCK_TYPE_STRING,
      dcfifo_component.lpm_numwords  = NUMBER_WORDS_FINAL,
      dcfifo_component.lpm_showahead  = "ON",
      dcfifo_component.lpm_type  = "dcfifo",
      dcfifo_component.lpm_width  = DATA_WIDTH,
      dcfifo_component.lpm_widthu  = $clog2(NUMBER_WORDS_FINAL),
      dcfifo_component.overflow_checking  = "OFF",
      dcfifo_component.rdsync_delaypipe  = 4,
      dcfifo_component.read_aclr_synch  = "OFF",
      dcfifo_component.underflow_checking  = "OFF",
      dcfifo_component.use_eab  = "ON",
      dcfifo_component.write_aclr_synch  = "ON",
      dcfifo_component.wrsync_delaypipe  = 4;

endmodule
