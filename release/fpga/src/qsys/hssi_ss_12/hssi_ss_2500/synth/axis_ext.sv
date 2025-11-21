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

module axis_ext #(
    parameter  int LOG2_DATA_WIDTH  = 9
   ,parameter  int NUM_OF_SEG       = 2
   ,localparam int NUM_OF_SEG_WIDTH = NUM_OF_SEG == 2 ? 1 : parser_pkg::get_width(NUM_OF_SEG)
)(
    input  logic                                   clk
   ,input  logic                                   rst
   //AXIs sink/input
   ,output logic                                   in_axis_mpm_TREADY
   ,input  logic                                   in_axis_mpm_TVALID
   ,input  logic                                   in_axis_mpm_TLAST
   ,input  logic [2**LOG2_DATA_WIDTH - 1:0]        in_axis_mpm_TDATA
   ,input  logic [2**(LOG2_DATA_WIDTH - 3) - 1:0]  in_axis_mpm_TKEEP
   ,input  logic [NUM_OF_SEG - 1:0]                in_axis_mpm_TUSER_last_segment
   //in if cmd
   ,input  logic                                   in_cmd_valid
   ,input  logic [NUM_OF_SEG_WIDTH - 1:0]          in_cmd_seg
   //AXIs source/output
   ,input  logic                                   out_axis_TREADY
   ,output logic                                   out_axis_TVALID
   ,output logic                                   out_axis_TLAST
   ,output logic [2**LOG2_DATA_WIDTH - 1:0]        out_axis_TDATA
   ,output logic [2**(LOG2_DATA_WIDTH - 3) - 1:0]  out_axis_TKEEP
);

   localparam int PIPELINE_WIDTH = 3;
   localparam int DATA_BYTE_WIDTH = 2**LOG2_DATA_WIDTH / 8;
   localparam int SEG_BYTE_SIZE = DATA_BYTE_WIDTH / NUM_OF_SEG;

   logic [NUM_OF_SEG - 1:0][SEG_BYTE_SIZE - 1:0][7:0]                         lite_in_dat;
   logic [PIPELINE_WIDTH - 1:0][NUM_OF_SEG - 1:0][SEG_BYTE_SIZE - 1:0][7:0]   lite_dat_r;
   logic [(NUM_OF_SEG * 2) - 1:0][SEG_BYTE_SIZE - 1:0][7:0]                   lite_dat_l;
   logic [2**LOG2_DATA_WIDTH - 1:0]                                           lite_out_dat;
   logic                                                                      cmd_valid_r, ready, pkt_in_progress, tlast_r, tlast;
   logic [1:0]                                                                eop_r;
   logic [NUM_OF_SEG_WIDTH - 1:0]                                             cmd_seg_r;
   logic [NUM_OF_SEG_WIDTH:0]                                                 sop_valid_seg_num, eop_valid_seg_num;
   logic [NUM_OF_SEG - 1:0][SEG_BYTE_SIZE - 1:0]                              lite_in_tkeep;
   logic [PIPELINE_WIDTH - 2:0][NUM_OF_SEG - 1:0][SEG_BYTE_SIZE - 1:0]        lite_tkeep_r;
   logic [NUM_OF_SEG - 1:0][SEG_BYTE_SIZE - 1:0]                              lite_tkeep;
   logic [(NUM_OF_SEG * 2) - 1:0][SEG_BYTE_SIZE - 1:0]                        lite_in_tkeep_l, lite_tkeep_mask, lite_tkeep_mask_r;
   logic [2**(LOG2_DATA_WIDTH - 3) - 1:0]                                     lite_out_tkeep;
   logic [NUM_OF_SEG - 1:0]                                                   lite_last_seg;
   logic [NUM_OF_SEG_WIDTH - 1:0]                                             last_valid_seg;

   always_comb begin
      ready = out_axis_TREADY;
      in_axis_mpm_TREADY = out_axis_TREADY;
      tlast = in_axis_mpm_TVALID == 1'b1 && in_axis_mpm_TLAST == 1'b1;

      lite_in_dat = {<<8{in_axis_mpm_TDATA}};
      lite_dat_l = {lite_in_dat, lite_dat_r[0]};
      lite_out_dat = lite_dat_r[2];
      out_axis_TDATA = {<<8{lite_out_dat}};

      lite_in_tkeep = {<<{in_axis_mpm_TKEEP}};
      lite_in_tkeep_l = {lite_in_tkeep, lite_tkeep_r[0]};
      lite_tkeep = lite_in_tkeep_l[cmd_seg_r+:NUM_OF_SEG];

      lite_last_seg = {<<{in_axis_mpm_TUSER_last_segment}};

      out_axis_TKEEP = {<<{lite_out_tkeep}};

      lite_tkeep_mask = '1;
      lite_tkeep_mask[(last_valid_seg+1)+:NUM_OF_SEG] = '0;

      eop_valid_seg_num = '0;
      for(int i = 0; i < NUM_OF_SEG; i++) begin
         if(lite_last_seg[i]) begin
            eop_valid_seg_num = i + 1;
            break;
         end
      end
   end

   always_ff@(posedge clk) begin
      if(ready) begin
         if(in_cmd_valid) begin
            sop_valid_seg_num <= NUM_OF_SEG - in_cmd_seg;
            cmd_seg_r <= in_cmd_seg;
         end

         last_valid_seg <= NUM_OF_SEG - 1;
         if(in_cmd_valid) begin
            for(int i = 0; i < NUM_OF_SEG; i++) begin
               if(i >= in_cmd_seg && lite_last_seg[i]) begin
                  last_valid_seg <= NUM_OF_SEG_WIDTH'(i - in_cmd_seg);
                  break;
               end
            end
         end else begin
            if(tlast) begin
               last_valid_seg <= NUM_OF_SEG_WIDTH'(sop_valid_seg_num + eop_valid_seg_num - 1);
            end else begin
               last_valid_seg <= NUM_OF_SEG - 1;
            end
         end

         lite_tkeep_r[0] <= lite_in_tkeep;
         lite_tkeep_r[1] <= lite_tkeep;

         lite_tkeep_mask_r <= lite_tkeep_mask;
         if(eop_r[0]) begin
            lite_out_tkeep <= lite_tkeep_r[1] & lite_tkeep_mask[NUM_OF_SEG - 1:0];
         end else begin
            lite_out_tkeep <= lite_tkeep_r[1] & lite_tkeep_mask_r[NUM_OF_SEG - 1:0];
         end

         lite_dat_r[0] <= lite_in_dat;
         lite_dat_r[1] <= lite_dat_l[cmd_seg_r+:NUM_OF_SEG];
         lite_dat_r[2] <= lite_dat_r[1];
      end
   end

   always_ff@(posedge clk) begin
      if(rst) begin
         tlast_r <= '0;
      end else begin
         if(ready) begin
            tlast_r <= tlast;
            if(in_cmd_valid) begin
               tlast_r <= '0;
               for(int i = 0; i < NUM_OF_SEG; i++) begin
                  if(i >= in_cmd_seg && lite_last_seg[i]) begin
                     tlast_r <= '1;
                  end
               end
            end
         end
      end
   end

   always_ff@(posedge clk) begin
      if(rst) begin
         eop_r <= '0;
      end else begin
         if(ready) begin
            eop_r[0] <= '0;
            if(tlast) begin
               eop_r[0] <= !in_cmd_valid && !tlast_r && sop_valid_seg_num + eop_valid_seg_num <= NUM_OF_SEG;
            end
            eop_r[1] <= tlast_r || eop_r[0];
         end
      end
   end

   always_ff@(posedge clk) begin
      if(rst) begin
         pkt_in_progress <= '0;
         cmd_valid_r <= '0;
      end else if(ready) begin
         cmd_valid_r <= in_cmd_valid;
         if(cmd_valid_r) begin
            pkt_in_progress <= '1;
         end else if(eop_r) begin
            pkt_in_progress <= '0;
         end
      end
   end

   always_ff@(posedge clk) begin
      if(rst) begin
         out_axis_TVALID <= '0;
      end else if(ready) begin
         out_axis_TVALID <= '0;
         if(pkt_in_progress) begin
            out_axis_TVALID <= '1;
         end
      end
   end

   always_ff@(posedge clk) begin
      if(ready) begin
         out_axis_TLAST <= '0;
         if(eop_r) begin
            out_axis_TLAST <= '1;
         end
      end
   end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRgsRiJ3wfMeDa+6t4TvF6FKtvhm4n4jllrZH6Ia2AHrcs2D0aC/4pp00ZYtiumTX/ymjyoa4zAUsoiKTd+PhOeZnNf+0ehzbw0X2QYnU9WXCmLHDzDQMifhfUQewVJAh9JcqflZF+PVKYkOGUFGPx6OqxE1NGg++mYPzuuu7L3z9dND/Y+nPF8XWAyfvheRFIiTTD/IE9pGlVRZvyRaVGBoTibnXL6HUfME91dpTmB8dHf69JX5m4MlK8wkXG1wp/IKaQpxO1+1lmwsxIKJ4dOsvhzEu2F/BI/dGYuOYUJuOhzSvMqf/mcc8yzpwfdRH7+IFKU8FjZl0HQGbaoMQhhPLg27SZQGUGEB/Kc6BDPuMbj2yDLAlADCvZRJyqnztVR760ErdDdL5T3bQ+Flff7FjmZeleVG1RqzTWju1s/ygPzs0piwhZ0kEnt1ABVjXOOlk5jpToV+ezwqmyZIpA7DhM+f5ngM/5+W8Im4QMRtsWjKHt7dv3GOm2J5+KtilCZgQkPsSQLDyKIQLiC7gGN69bEJ0OpmjE4L0rmdg8ee+hUrP/Eq+SQEpvKr1SjmYa2VHbnbY4xFdmxsD4IYxcjwIkCE+tSgeu9ddm9oW7HmCLq2vklgI2KVMYFdIgfl5htRMS9nmdS5U/UzNhZAneDkSUelFtiHP3z9o/fmuGdNKBJ5LkbISQmZrD7vzAoDhN9QI/RT94XAWnCCWFtSHpz7FE7pq/WWgcZMLYuQuwf98EXYhoPcJ1rsVd1VFxWL/XeIe80mwUXBGpNFEgR4FwO3"
`endif