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

module stat_reqs_merge #(
    parameter int MERGE_NUM  = 4
   ,parameter int ID_WIDTH   = 4
   ,parameter int INCR_WIDTH = 4
)(
    input  logic                    clk
   ,input  logic                    rst
   ,input  logic                    i_valid
   ,input  logic [ID_WIDTH - 1:0]   i_id
   ,output logic                    o_valid
   ,output logic [ID_WIDTH - 1:0]   o_id
   ,output logic [INCR_WIDTH - 1:0] o_incr
);

   logic [MERGE_NUM - 1:0]                   valid_r;
   logic [MERGE_NUM - 1:0][ID_WIDTH - 1:0]   id_r;
   logic [MERGE_NUM - 1:0][INCR_WIDTH - 1:0] incr_r;

   always_ff@(posedge clk) begin
      id_r[0] <= i_id;
      for(int i = 0; i < MERGE_NUM - 1; i++) begin
         id_r[i+1] <= id_r[i];
      end
   end

   always_ff@(posedge clk) begin
      if(rst) begin
         valid_r <= '0;
      end else begin
         incr_r[0] <= i_valid;
         valid_r[0] <= i_valid;
         for(int i = 0; i < MERGE_NUM - 1; i++) begin
            valid_r[i+1] <= valid_r[i];
            if(i_valid && valid_r[i] && i_id == id_r[i]) begin
               incr_r[i+1] <= incr_r[i] + 1'b1;
               valid_r[0] <= '0;
            end else begin
               incr_r[i+1] <= incr_r[i];
            end
         end
      end
   end

   always_comb begin
      o_valid = valid_r[MERGE_NUM - 1];
      o_id = id_r[MERGE_NUM - 1];
      o_incr = incr_r[MERGE_NUM - 1];
   end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRjHVQ3TgazXK6mQinRSTprXOugMvjJQD9yf3BJCfOhD1lsobyKsm4xxcjIvCoreT9ZD5S6GkBNDzU7Jjx/AXWukPmwuJylPKAVi/Gu9Vt7C/CpcOwXqeibdnY3N8fmFU2uw79zFvpSUcftgSTltVGxJIwWWnujmBRRp5fyrG+jGknidzBzx2+cqguZGqBgqpi//9aaWJjMpcYyeCtSaJMELZNhz21g1gahZVEmXkcBA42+CcmXL2G90XVmuEGVTmAK7IllBB3utn4GrJ/81dit5aaLCadw06wRQnh3TCey0vV2v0o2rhsw57wLcgb07cFsNOEAsowH3rqzAhY7U9PQix3MaCbV9jyWo4ioVa3z2XiOBt8ILBjVLP3cl85i1ABb1U1GXhDy5iPD7sGy20apS/NkW0rtpyRrmlqgfdiePPP7d29m/BzV4WP7Vnu9F2hbnppGYS6MO0cw+YcptLuqIigIjF4tj1t/vcUqm9oVYYhIo0ZFxMGldq/vBocK3KDeaInXnaz7eUmC3shdBlhtPeMKn+L6onp3hgQPCpIj+Yymkbifvc69WCxJqQeny8o7RO6vDuqGLaROKIqXsW9SVFzuYF4tKQzhq/T4g3ZoQ7OMTDE8y8tQJ8izUAlWBKgxTjj/u1pEvvubjasbufmrYEmVmH54gDqNU1ySnIBIF3uHLaCjGLD3UUwzGjxH7IyR1yV0uS8N5sl8QentnstuGP/6QZCDK8xfdw9zVGCTxgH5LDbfMgu+GPandlswpcPGiIw0IkTP0WQBAgq1EXlMq"
`endif