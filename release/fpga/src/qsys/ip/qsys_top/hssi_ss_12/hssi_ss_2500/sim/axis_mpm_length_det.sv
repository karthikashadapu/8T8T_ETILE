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

module axis_mpm_length_det #(
    parameter  int LOG2_DATA_WIDTH  = 9
   ,parameter  int NUM_OF_SEG       = 2
   ,parameter  int DRV_IFS_NUM      = 2
   ,parameter  int MIN_PKT_BYTE_LEN = 58
   ,localparam int NUM_OF_SEG_WIDTH = NUM_OF_SEG == 2 ? 1 : parser_pkg::get_width(NUM_OF_SEG)
   ,localparam int TKEEP_WIDTH      = 2**(LOG2_DATA_WIDTH - 3)
)(
    input  logic                                               clk
   ,input  logic                                               rst
   //AXIs sink/input
   ,output logic                                               in_axis_mpm_TREADY
   ,input  logic                                               in_axis_mpm_TVALID
   ,input  logic                                               in_axis_mpm_TLAST
   ,input  logic [2**LOG2_DATA_WIDTH - 1:0]                    in_axis_mpm_TDATA
   ,input  logic [TKEEP_WIDTH - 1:0]                           in_axis_mpm_TKEEP
   ,input  logic [NUM_OF_SEG - 1:0]                            in_axis_mpm_TUSER_last_segment
   //AXIs source/output
   ,input  logic                                               out_axis_mpm_TREADY
   ,output logic                                               out_axis_mpm_TVALID
   ,output logic                                               out_axis_mpm_TLAST
   ,output logic [2**LOG2_DATA_WIDTH - 1:0]                    out_axis_mpm_TDATA
   ,output logic [TKEEP_WIDTH - 1:0]                           out_axis_mpm_TKEEP
   ,output logic [NUM_OF_SEG - 1:0]                            out_axis_mpm_TUSER_last_segment
   //out ifs cmds
   ,output logic [DRV_IFS_NUM - 1:0]                           out_cmd_valid
   ,output logic [DRV_IFS_NUM - 1:0][NUM_OF_SEG_WIDTH - 1:0]   out_cmd_seg
);

   localparam int MODULE_LATENCY = 5;
   localparam int DATA_BYTE_WIDTH = 2**LOG2_DATA_WIDTH / 8;
   localparam int SEG_BYTE_SIZE = DATA_BYTE_WIDTH / NUM_OF_SEG;
   localparam int DRV_IFS_NUM_WIDTH = parser_pkg::get_width(DRV_IFS_NUM);

   localparam int MIN_PKT_SEG_LEN = MIN_PKT_BYTE_LEN % SEG_BYTE_SIZE ?
      (MIN_PKT_BYTE_LEN / SEG_BYTE_SIZE) + 1
   :
      MIN_PKT_BYTE_LEN / SEG_BYTE_SIZE;

   localparam int DET_SEG_NUM = NUM_OF_SEG + MIN_PKT_SEG_LEN - 1;

   typedef struct packed {
      logic                            tlast;
      logic [2**LOG2_DATA_WIDTH - 1:0] tdata;
      logic [TKEEP_WIDTH - 1:0]        tkeep;
      logic [NUM_OF_SEG - 1:0]         tuser_last_segment;
   } axis_aggregated_signals_t;

   axis_aggregated_signals_t                          ag_sigs_in, ag_sigs_r[MODULE_LATENCY];
   logic                                              last_seg_eop, last_seg_eop_r, ready;
   logic [MODULE_LATENCY - 1:0]                       tvalid_r;
   logic [DET_SEG_NUM - 1:0]                          lite_det_lseg, lite_det_seg_valid;
   logic [DET_SEG_NUM - 1:0][SEG_BYTE_SIZE - 1:0]     lite_det_tkeep;
   logic [NUM_OF_SEG - 1:0]                           lite_det_sop, lite_lseg, lite_seg_valid, lite_ext_valid, tuser_last_segment_cast;
   logic [NUM_OF_SEG - 1:0][NUM_OF_SEG_WIDTH:0]       pkt_seg_len_arr;
   logic [NUM_OF_SEG - 1:0][SEG_BYTE_SIZE - 1:0]      lite_tkeep;
   logic [DRV_IFS_NUM_WIDTH - 1:0]                    prev_if, valid_if_num;
   logic [DRV_IFS_NUM - 1:0][NUM_OF_SEG_WIDTH - 1:0]  lite_ext_seg;
   logic [DRV_IFS_NUM - 1:0]                          lite_ext_seg_valid;
   logic [TKEEP_WIDTH - 1:0]                          tkeep_cast;

   always_comb begin
      ready = out_axis_mpm_TREADY;
      in_axis_mpm_TREADY = ready;

      ag_sigs_in = {in_axis_mpm_TLAST, in_axis_mpm_TDATA, in_axis_mpm_TKEEP, in_axis_mpm_TUSER_last_segment};

      out_axis_mpm_TVALID = tvalid_r[MODULE_LATENCY-1];
      {out_axis_mpm_TLAST, out_axis_mpm_TDATA, out_axis_mpm_TKEEP, out_axis_mpm_TUSER_last_segment} = ag_sigs_r[MODULE_LATENCY-1];

      lite_lseg = {<<{in_axis_mpm_TUSER_last_segment}};
      tuser_last_segment_cast = {<<{ag_sigs_r[0].tuser_last_segment}};
      lite_det_lseg = DET_SEG_NUM'({lite_lseg, tuser_last_segment_cast});
      lite_tkeep = {<<{in_axis_mpm_TKEEP}};
      tkeep_cast = {<<{ag_sigs_r[0].tkeep}};
      lite_det_tkeep = (SEG_BYTE_SIZE*DET_SEG_NUM)'({lite_tkeep, tkeep_cast});

      for(int i = 0; i < DET_SEG_NUM; i++) begin
         lite_det_seg_valid[i] = |lite_det_tkeep[i];
      end

      for(int i = 0; i < NUM_OF_SEG; i++) begin
         lite_seg_valid[i] = |lite_tkeep[i];
      end
   end

   always_ff@(posedge clk) begin
      if(rst) begin
         tvalid_r <= '0;
      end else if(ready) begin
         tvalid_r[0] <= in_axis_mpm_TVALID;
         for(int i = 0; i < MODULE_LATENCY - 1; i++) begin
            tvalid_r[i+1] <= tvalid_r[i];
         end
      end
   end

   always_ff@(posedge clk) begin
      if(ready) begin
         ag_sigs_r[0] <= ag_sigs_in;
         for(int i = 0; i < MODULE_LATENCY - 1; i++) begin
            ag_sigs_r[i+1] <= ag_sigs_r[i];
         end
      end
   end

   always_ff@(posedge clk) begin
      if(ready) begin
         last_seg_eop_r <= last_seg_eop;;
         last_seg_eop <= '0;
         if(in_axis_mpm_TVALID && in_axis_mpm_TLAST) begin
            for(int i = NUM_OF_SEG - 1; i >= 0; i--) begin
               if(lite_lseg[i] && lite_seg_valid[i]) begin
                  last_seg_eop <= '1;
               end else if(!lite_seg_valid[i]) begin
                  last_seg_eop <= '1;
               end else if(lite_seg_valid[i]) begin
                  break;
               end
            end
         end else if(!in_axis_mpm_TVALID) begin
            last_seg_eop <= '1;
         end
      end

      if(rst) begin
         last_seg_eop <= '1;
      end
   end

   always_ff@(posedge clk) begin
      if(ready) begin
         lite_det_sop <= '0;

         if(last_seg_eop_r) begin
            for(int i = 0; i < NUM_OF_SEG; i++) begin
               if(lite_det_seg_valid[i]) begin
                  lite_det_sop[i] <= '1;
                  break;
               end
            end
         end

         for(int i = 1; i < NUM_OF_SEG; i++) begin
            if((lite_det_lseg[i-1] || !lite_det_seg_valid[i-1]) && lite_det_seg_valid[i]) begin
               lite_det_sop[i] <= '1;
            end
         end
      end
   end

   always_ff@(posedge clk) begin
      if(ready) begin
         if(tvalid_r[0]) begin
            pkt_seg_len_arr <= '0;
            for(int i = 0; i < NUM_OF_SEG; i++) begin
               if(lite_det_seg_valid[i]) begin
                  for(int n = i; n < DET_SEG_NUM; n++) begin
                     if(lite_det_lseg[n]) begin
                        //$display("len check %d %d %d", i, n, n-i+1);
                        pkt_seg_len_arr[i] <= n - i + 1;
                        break;
                     end
                     if(n + 1 == DET_SEG_NUM) begin
                        pkt_seg_len_arr[i] <= '1;
                     end
                  end
               end
            end
         end
      end
   end

   always_ff@(posedge clk) begin
      if(rst) begin
         lite_ext_valid <= '0;
      end else if(ready) begin
         lite_ext_valid <= '0;
         if(tvalid_r[1]) begin
            for(int n = 0; n < NUM_OF_SEG; n++) begin
               if(lite_det_sop[n] && pkt_seg_len_arr[n] >= MIN_PKT_SEG_LEN) begin
                  lite_ext_valid[n] <= '1;
               end
            end
         end
      end
   end

   logic [DRV_IFS_NUM_WIDTH - 1:0] vif_num;
   always_ff@(posedge clk) begin
      if(ready) begin
         vif_num = 0;
         lite_ext_seg_valid <= '0;
         for(int n = 0; n < NUM_OF_SEG; n++) begin
            if(lite_ext_valid[n]) begin
               lite_ext_seg_valid[vif_num] <= '1;
               lite_ext_seg[vif_num] <= n;
               ++vif_num;
            end
         end
         valid_if_num <= vif_num;
      end

      if(rst) begin
         lite_ext_seg_valid <= '0;
         valid_if_num <= '0;
      end
   end

   always_ff@(posedge clk) begin
      if(rst) begin
         prev_if <= '0;
      end else if(ready) begin
         if(prev_if + valid_if_num >= DRV_IFS_NUM) begin
            prev_if <= DRV_IFS_NUM_WIDTH'(prev_if + valid_if_num - DRV_IFS_NUM);
         end else begin
            prev_if <= DRV_IFS_NUM_WIDTH'(prev_if + valid_if_num);
         end
      end
   end

   int k;
   always_ff@(posedge clk) begin
      if(ready) begin
         k = prev_if;
         out_cmd_valid <= '0;
         for(int n = 0; n < DRV_IFS_NUM; n++) begin
            if(lite_ext_seg_valid[n]) begin
               out_cmd_valid[k] <= '1;
               out_cmd_seg[k] <= lite_ext_seg[n];
               if(++k == DRV_IFS_NUM) begin
                  k = 0;
               end
            end
         end
      end

      if(rst) begin
         out_cmd_valid <= '0;
      end
   end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRhUFPA9MtY9HOoaA+t8tOzpnISdQxIq1MK4pcDL8mz6xS2VzSD+4zeYT3Bbe60NpzIiP/tSQyOA2I+91aCxbecsKnaZ39rmvcBbKECK03R8tlBxLCIvUsFPutwpxo3OR1Kp7K7bHVJvE50BFHaA8vonEK5RvGv0cIendbDll0WVhOabHYq0mc09sYkNdurqrpJLfyIbM6FWLZSWO4KoO9xSNPypL1HeyTxx7tfFvT4uqSw9le/Qb1frPyneShByFn+mGh7pbMQOFSsckl41ooJhbClTqk/KSZ+mdxX+OrVOq9wZtP26mJc3ewQnBrKQleFazg6WtpI5VJjAzWIB2d2Rmpr777wpW8qc9V0eoOaThOD0ciAqjT7DHJtYnb6vt/QXdmxU3tgPSbzhRxarBOfq0No1kmih1UQB7T54igomX8fN6lJfbSpRUvS2Jnw+j+uqXjVtiTMqESTnN4ozsA/EyXdwd1/bwZ/Ne4FIqmBbhof909fIaHkW07MkmqrZAzlSkmdqvVNZhSGnhqH/2g2+kTXj0+3we2EbmZ+pLIO/ZJ8vQ8XntX3djOHIPgULHRt2abal9uqAA/aEmQ1SVt9IYy57K2bQw93jvQMDFEgTlp5SM0pgj31CsHDa6RqynaSL3b7JkRpSP7ncMimEkfhJCP7H5oOFVvAANTJqlGIXFBWXfp3kOGQnjp7zUbbK5/MCS32hCF9RgDVVgn5bCRos5AiPzsVGxe+iPPVFMbVyLXeQIxofYTc2eNo5ypeXiK5wHTZXJjp3nzyH2sexod3/"
`endif