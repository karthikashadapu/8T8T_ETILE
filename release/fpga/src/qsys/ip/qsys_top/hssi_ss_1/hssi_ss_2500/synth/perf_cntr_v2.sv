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

module perf_cntr_v2 #(
    parameter int CNT_WIDTH  = 64
   ,parameter int INCR_WIDTH = 4
)(
    input  logic                    clk
   ,input  logic                    rst
   ,input  logic                    i_valid
   ,input  logic [INCR_WIDTH - 1:0] i_incr
   ,input  logic [CNT_WIDTH - 1:0]  i_cntr
   ,output logic                    o_valid
   ,output logic [CNT_WIDTH - 1:0]  o_cntr
);

   localparam int LOW_CNT_WIDTH = 32;
   localparam int HIGH_CNT_WIDTH = CNT_WIDTH - LOW_CNT_WIDTH;
   localparam int MODULE_LATENCY = 2;

   logic [LOW_CNT_WIDTH - 1:0]  low_cntr, low_cntr_r;
   logic [HIGH_CNT_WIDTH - 1:0] high_cntr_r, high_cntr;
   logic                        carry, cnt_almst_full;
   logic [MODULE_LATENCY - 1:0] valid_r;

   always_ff@(posedge clk) begin
      if(rst) begin
         valid_r <= '0;
      end else begin
         valid_r[0] <= i_valid;
         for(int i = 0; i < MODULE_LATENCY - 1; i++) begin
            valid_r[i+1] <= valid_r[i];
         end
      end
   end

   always_ff@(posedge clk) begin
      cnt_almst_full <= '0;
      if(&i_cntr[CNT_WIDTH - 1 : LOW_CNT_WIDTH]) begin
         cnt_almst_full <= '1;
      end
   end

   always_ff@(posedge clk) begin
      high_cntr <= i_cntr[CNT_WIDTH - 1 : LOW_CNT_WIDTH];
      {carry, low_cntr} <= i_cntr[LOW_CNT_WIDTH - 1:0] + i_incr;
      if(cnt_almst_full && carry) begin
         high_cntr_r <= '1;
         low_cntr_r <= '1;
      end else begin
         high_cntr_r <= HIGH_CNT_WIDTH'(high_cntr + carry);
         low_cntr_r <= low_cntr;
      end
   end

   always_comb o_valid = valid_r[MODULE_LATENCY - 1];
   always_comb o_cntr = CNT_WIDTH'({high_cntr_r, low_cntr_r});

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRiWrH3keicraDLeG/rh6TU8+mg1u4LJMtr9YVV13snI5OzCZ6ujqa3yXL0OxS3Lvd0FU9D0hqnnVq++JaNLnfItcTm1jUtJgUA6EYA/39tdZ4gqsFahfn7SLy8tLoltQP4dRYHl7Ra6GuVdFDsW6/h31Urkbq7esIr2fnF71/sLCdSPyP2TbYKLuRj1MApvJ6lnWuwlunPJCLiN3qyORLzsWf5bWbwAJc58rTFkSHwcykNuCIS2QGjpZENOO9+uWSkq8yaRgXlW50qXOEDKvz6WrtEs4XS0n8UcH6k/Kh01uO6p+geckLeK73ci2IQREDVvnbGtWsDUniOH//ejaKkjMq7pOWFurvAgnXaYGtnaZvvkmLqL7/xqIiAnjeLzl0C8KXDopsJqMQnn7j2pOVarbsAy1y01hTVxk14I+7lehmDTkZcxlYaLc0Akbenw+HLiqtrGx+7+SjhTXrwUNrIZVZ2tn+/BxUQ6Kpu7NUcdsQzhnzuSQ/ypbjq+H4uuw9rZkgcL5fEp/zDoL1eDAuwVuXZnHWO0xvYu+x2yhXuEFHg9jsLWf7/KOqNo/FawbpGJjQ6aVhbMOyRM05BCDT2E2/fMJs70rvpAtgww5uoFAnzRVIill3OmSnQ4RtwcUE2gTv3wfqu/JWrwZnSGHebs9Z/wLQBvuU2gLrCT4YgrjMmjDldQuIsBC8ALoIlS4dz/IBWMNQ2TdMhWwEsUuWc+c5Kivi5peXEQTjH5oV0snSmOIDnUsDhNRK/w2qkEeugQJnZngoIDW4CQc2Y6IPYJ"
`endif