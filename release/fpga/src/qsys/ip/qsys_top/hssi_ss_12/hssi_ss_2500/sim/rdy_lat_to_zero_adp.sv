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


// Copyright 2021-2022 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials, and
// your use of them is governed by the express license under which they were
// provided to you ("License"). Unless the License provides otherwise, you may
// not use, modify, copy, publish, distribute, disclose or transmit this
// software or the related documents without Intel's prior written permission.
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.

module rdy_lat_to_zero_adp #(
    parameter bit [3:0] READY_LATENCY = 4
   ,parameter int       DATA_WIDTH    = 10
) (
    input  logic                    clk
   ,input  logic                    rst
   //sink/input
   ,output logic                    in_ready
   ,input  logic                    in_valid
   ,input  logic [DATA_WIDTH - 1:0] in_data
   //source/output
   ,input  logic                    out_ready
   ,output logic                    out_valid
   ,output logic [DATA_WIDTH - 1:0] out_data
);

   function automatic int get_width(int value);
      return (value >= 2) ? $clog2(value) : 1;
   endfunction

   localparam int FIFO_ADDR_WIDTH  = READY_LATENCY <= 4 ? 4 : get_width(READY_LATENCY * 2);
   localparam int FIFO_AFULL_VALUE = READY_LATENCY;

   if(READY_LATENCY > 1) begin : lat_n
      logic [READY_LATENCY - 1:0] rdy_lat_r;
      logic                       fafull, ffull, fempty, fwr_en, frd_en, frd_en_r;
      logic [DATA_WIDTH - 1:0]    fdata;

      always_comb begin
         fwr_en = rdy_lat_r[READY_LATENCY - 1] & in_valid;
         frd_en = ~fempty & (out_ready || !out_valid);
         in_ready = !fafull | frd_en_r;
      end

      always_ff@(posedge clk) begin
         if(rst) begin
            frd_en_r <= '0;
         end else begin
            frd_en_r <= frd_en;
         end
      end

      always_ff@(posedge clk) begin
         if(rst) begin
            rdy_lat_r <= '0;
         end else begin
            rdy_lat_r <= {rdy_lat_r[READY_LATENCY - 2:0], in_ready};
         end
      end

      always_ff@(posedge clk) begin
         if(rst) begin
            out_valid <= '0;
         end else begin
            if(out_ready || !out_valid) begin
               out_valid <= ~fempty;
               out_data <= fdata;
            end
         end
      end

      parameter_scfifo #(
          .ADDR_WIDTH        (FIFO_ADDR_WIDTH)
         ,.DATA_WIDTH        (DATA_WIDTH)
         ,.ALMOST_FULL_VALUE (FIFO_AFULL_VALUE)
         ,.RAM_BLOCK_TYPE    ("MLAB")
      ) fifo (
          .clock       (clk)
         ,.aclr        (rst)
         ,.wrreq       (fwr_en)
         ,.rdreq       (frd_en)
         ,.data        (in_data)
         ,.almost_full (fafull)
         ,.empty       (fempty)
         ,.full        (ffull)
         ,.q           (fdata)
         ,.usedw       ()
      );

// synthesis translate_off
      logic deb_error;
      always_ff@(posedge clk) begin
         deb_error <= '0;
         if(ffull && fwr_en) begin
            deb_error <= '1;
         end
      end
// synthesis translate_on

   end else if(READY_LATENCY == 1) begin : lat_1
      logic                    valid_r, ready_r;
      logic [DATA_WIDTH - 1:0] data_r;

      always_comb begin
         in_ready = out_ready;
      end

      always_ff@(posedge clk) begin
         if(rst) begin
            valid_r <= '0;
            out_valid <= '0;
            ready_r <= '0;
         end else begin
            ready_r <= out_ready;

            if(out_ready) begin
               valid_r <= '0;
            end else if(!out_ready && ready_r && in_valid) begin
               valid_r <= '1;
               data_r  <= in_data;
            end

            if(out_ready) begin
               if(valid_r) begin
                  out_valid <= '1;
                  out_data  <= data_r;
               end else if(!ready_r) begin
                  out_valid <= '0;
               end else begin
                  out_valid <= in_valid;
                  out_data  <= in_data;
               end
            end
         end
      end
   end else begin : lat_0
      always_comb begin
         in_ready  = out_ready;
         out_valid = in_valid;
         out_data  = in_data;
      end
   end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRhrY9A3c155YTxk2VVgkyuw4K6TcU46yJWRy+d73r7MeIQrND4VwuJiJjE+l//mSd775vxz8I/dC1GGP6+tJ97XpHp9hv61FVHoBRFogW6//Z86Z8ZYK26fF2MER3sgT64qBPpwkWLoNS9Eig/XgbQoGodxdwD+Gd028unZkAS1lg3BZWth1FUsCqGpPjofPpb+0yF7IOpgAfEm+1gXiSF4Vkua+kl/8Z61oWA1KiDdPygKUGJrhwYc6TSYF3+TsFHiYXk3MqefLNxboTMmvTnQIoqkiFgktz6n9SkrSjf0G/626yI3NA3+C8JnoONOD9AoBaz77DGvosOQCdtPJJ5nBt80pOe1h1wVsiFppqjIa0OPvXGsK6yknjqe5cQO1JhXg64Zjil7skHSF+hxc8QKyeBdPHq6mids+N85AhuVDkFLqeJ+yVXfLj821uvCLbOmoe+4+Ye5K/OC83kkI/XJbkURt7y2jZe+GXmwsqmwXJt2AhqTK/o/kXUh9phNuttytYYzuMh3PNlSL+NGCssTWuyV7tTGLFKrgntcM629+9QRKzmSm8wDaA1B2dkzSKMKDKYhpS1E278yp0JnBlF6oeoppV4pNRqKvh3vtNvq2AGFsM3A8qsPeA/P4sJ69KXMBSy8zs8AmSMBAdC8wNRVYhFWEoTWmEFyxSWpJLOArzoe10h9zY/ocyXHMRgwL6WCZoy3VEq99Z7nafhDr/PibvO8aIGsa0xhnieqd+KT+NGAyUx+Ri9x8y6tQbLVngqehJ3kel2/9rClFZ1UVZNG"
`endif