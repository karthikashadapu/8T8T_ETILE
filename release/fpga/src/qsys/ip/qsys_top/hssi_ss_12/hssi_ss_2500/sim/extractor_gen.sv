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

//!in_axis_TVALID situation is not supported inside packet

module extractor_gen #(
    parameter  int LOG2_DATA_WIDTH          = 9
   ,parameter  int EXTRACTS_NUMBER          = 16
   ,parameter  int TUSER_WIDTH              = 1
   ,parameter  int OFFSET_WIDTH             = 8
   ,parameter  int LOG2_EXTRACT_FIELD_WIDTH = 4
   ,parameter  int FAR_EXT_OFFSET           = 40
   ,localparam int EXTRACTS_NUMBER_WIDTH    = parser_pkg::get_width(EXTRACTS_NUMBER)
   ,localparam int EXTRACT_FIELD_WIDTH      = 2**LOG2_EXTRACT_FIELD_WIDTH
) (
    input  logic                                  clk
   ,input  logic                                  rst_n
   //AXIs sink/input
   ,output logic                                  in_axis_TREADY
   ,input  logic                                  in_axis_TVALID
   ,input  logic                                  in_axis_TLAST
   ,input  logic [2**LOG2_DATA_WIDTH - 1:0]       in_axis_TDATA
   ,input  logic [2**(LOG2_DATA_WIDTH - 3) - 1:0] in_axis_TKEEP
   ,input  logic [TUSER_WIDTH - 1:0]              in_axis_TUSER
   //AXIs source/output
   ,input  logic                                  out_axis_TREADY
   ,output logic                                  out_axis_TVALID
   ,output logic                                  out_axis_TLAST
   ,output logic [2**LOG2_DATA_WIDTH - 1:0]       out_axis_TDATA
   ,output logic [2**(LOG2_DATA_WIDTH - 3) - 1:0] out_axis_TKEEP
   ,output logic [TUSER_WIDTH - 1:0]              out_axis_TUSER
   //extract commands
   ,input  logic                                                         in_ext_valid
   ,input  logic [EXTRACTS_NUMBER - 1:0][OFFSET_WIDTH - 1:0]             in_ext_offset
   ,input  logic [EXTRACTS_NUMBER - 1:0][LOG2_EXTRACT_FIELD_WIDTH - 1:0] in_ext_length

   ,output logic                                                         out_ext_valid
   ,output logic [EXTRACTS_NUMBER - 1:0][EXTRACT_FIELD_WIDTH - 1:0][7:0] out_ext_data
   ,output logic [EXTRACTS_NUMBER - 1:0][LOG2_EXTRACT_FIELD_WIDTH - 1:0] out_ext_length
);

   localparam int ST_DATA_WIDTH = 2**LOG2_DATA_WIDTH;
   localparam int ST_DATA_BYTE_SIZE = ST_DATA_WIDTH / 8;
   localparam int MODULE_LATENCY = 6 + (FAR_EXT_OFFSET / ST_DATA_BYTE_SIZE);//better formula?
   localparam int FIFO_ADDR_WIDTH = 3;//should be derived from MODULE_LATENCY
   localparam int ST_LOG2_DATA_BYTE_WIDTH = LOG2_DATA_WIDTH - 3;
   localparam int ST_BUF_SIZE = MODULE_LATENCY;
   localparam int DATA_TAIL_WIDTH = EXTRACT_FIELD_WIDTH - 1;
   localparam int EXTRACT_BUFFER_WIDTH = ST_DATA_BYTE_SIZE + DATA_TAIL_WIDTH;
   localparam int AVST_BUF_DATA_SIZE = ST_BUF_SIZE * ST_DATA_BYTE_SIZE;
   localparam int CONST_OFFSET = 2;
   localparam int TAIL_BYTE_WIDTH = 3;

   typedef struct packed {
      logic                                  sop;
      logic                                  tvalid;
      logic                                  tlast;
      logic [2**(LOG2_DATA_WIDTH - 3) - 1:0] tkeep;
      logic [TUSER_WIDTH - 1:0]              tuser;

      logic                                                         ext_valid;
      logic [EXTRACTS_NUMBER - 1:0][OFFSET_WIDTH - 1:0]             ext_offset;
      logic [EXTRACTS_NUMBER - 1:0][LOG2_EXTRACT_FIELD_WIDTH - 1:0] ext_length;
   } aggregated_signals_t;

   logic                                                         ready, sop, ext_pkt, fifo_rd_en;
   logic [EXTRACTS_NUMBER - 1:0][OFFSET_WIDTH - 1:0]             ext_offset_reg;
   logic [EXTRACTS_NUMBER - 1:0][LOG2_EXTRACT_FIELD_WIDTH - 1:0] ext_length_reg;
   logic [EXTRACT_BUFFER_WIDTH - 1:0][7:0]                       lite_extended_in_data;
   logic [OFFSET_WIDTH - 1:0]                                    word_cntr;
   logic [AVST_BUF_DATA_SIZE - 1:0][7:0]                         st_buf_data;
   logic [DATA_TAIL_WIDTH - 1:0][7:0]                            data_tail;
   aggregated_signals_t                                          signals;
   aggregated_signals_t [ST_BUF_SIZE - 1:0]                      buf_signals;

   logic [EXTRACTS_NUMBER - 1:0]                                 ext_valid_reg[2];
   logic [EXTRACTS_NUMBER - 1:0][TAIL_BYTE_WIDTH - 1:0][7:0]     ext_tail_data;
   logic [EXTRACTS_NUMBER - 1:0][EXTRACT_FIELD_WIDTH - 1:0][7:0] ext_data, lite_ext_data;

   always_comb ready = out_axis_TREADY;
   always_comb in_axis_TREADY = ready;

   //SOP detecting
   always_ff@(posedge clk) begin
      if(!rst_n) begin
         sop <= '1;
      end else begin
         if(ready) begin
            if(!in_axis_TVALID) begin
               sop <= '1;
            end else if(in_axis_TLAST) begin
               sop <= '1;
            end else begin
               sop <= '0;
            end
         end
      end
   end

   //bus word cntr
   always_ff@(posedge clk) begin
      if(!rst_n) begin
         word_cntr <= '0;
      end else begin
         if(ready) begin
            if(sop && in_axis_TVALID) begin
               word_cntr <= '0;
            end else if(in_axis_TVALID) begin
               if(!(&(word_cntr[OFFSET_WIDTH - 1:ST_LOG2_DATA_BYTE_WIDTH]))) begin
                  word_cntr <= OFFSET_WIDTH'(word_cntr + ST_DATA_BYTE_SIZE);
               end
            end
         end
      end
   end

   //pack input signals
   always_comb begin
      if(sop) begin
         signals = {sop & in_axis_TVALID, in_axis_TVALID, in_axis_TLAST, in_axis_TKEEP, in_axis_TUSER, in_ext_valid, in_ext_offset, in_ext_length};
      end else begin
         signals = {1'b0, in_axis_TVALID, in_axis_TLAST, in_axis_TKEEP, in_axis_TUSER, in_ext_valid, ext_offset_reg, ext_length_reg};
      end
   end

   //buffering input stream ctrl sigs
   always_ff@(posedge clk) begin
      if(!rst_n) begin
         buf_signals <= '0;
      end else begin
         if(ready) begin
            if(sop) begin
               ext_offset_reg <= in_ext_offset;
               ext_length_reg <= in_ext_length;
            end
            buf_signals <= {buf_signals[ST_BUF_SIZE - 2:0], signals};
         end
      end
   end

   //buffering input stream data bus
   always_ff@(posedge clk) begin
      if(ready) begin
         st_buf_data <= {st_buf_data[((ST_BUF_SIZE - 1) * ST_DATA_BYTE_SIZE) - 1:0], in_axis_TDATA};
      end
   end

   //create output valid function
   function automatic logic extract_valid(
      input logic [OFFSET_WIDTH - 1:0] word_offset,
      input logic                      valid,
      input logic [OFFSET_WIDTH - 1:0] offset
   );
      if(valid && word_offset[OFFSET_WIDTH - 1:ST_LOG2_DATA_BYTE_WIDTH] == offset[OFFSET_WIDTH - 1:ST_LOG2_DATA_BYTE_WIDTH]) begin
         return '1;
      end
      return '0;
   endfunction

   //stage 1 full data extract with minimum step = 3
   function automatic logic [EXTRACT_FIELD_WIDTH - 1:0][7:0] extract_field(
      input logic [OFFSET_WIDTH - 1:0]              word_offset,
      input logic [OFFSET_WIDTH - 1:0]              offset,
      input logic [EXTRACT_BUFFER_WIDTH - 1:0][7:0] data
   );
      logic [ST_LOG2_DATA_BYTE_WIDTH - 1:0] byte_offset;
      if(word_offset[OFFSET_WIDTH - 1:ST_LOG2_DATA_BYTE_WIDTH] == offset[OFFSET_WIDTH - 1:ST_LOG2_DATA_BYTE_WIDTH]) begin
         byte_offset = offset[ST_LOG2_DATA_BYTE_WIDTH - 1:0];
         byte_offset[CONST_OFFSET - 1:0] = '1;
         return data[byte_offset+:EXTRACT_FIELD_WIDTH];
      end
      return '0;
   endfunction

   //stage 1 extract only 3 bytes for next stage
   function automatic logic [TAIL_BYTE_WIDTH - 1:0][7:0] extract_tail_field(
      input logic [OFFSET_WIDTH - 1:0]              word_offset,
      input logic [OFFSET_WIDTH - 1:0]              offset,
      input logic [EXTRACT_BUFFER_WIDTH - 1:0][7:0] data
   );
      logic [ST_LOG2_DATA_BYTE_WIDTH - 1:0] byte_offset;
      if(word_offset[OFFSET_WIDTH - 1:ST_LOG2_DATA_BYTE_WIDTH] == offset[OFFSET_WIDTH - 1:ST_LOG2_DATA_BYTE_WIDTH]) begin
         byte_offset = offset[ST_LOG2_DATA_BYTE_WIDTH - 1:0];
         return data[byte_offset+:TAIL_BYTE_WIDTH];
      end
      return '0;
   endfunction

   //stage 2 concatenate tail and data from stage 1
   function automatic logic [EXTRACT_FIELD_WIDTH - 1:0][7:0] concatenate_field(
      input logic [OFFSET_WIDTH - 1:0]             offset,
      input logic [EXTRACT_FIELD_WIDTH - 1:0][7:0] data,
      input logic [TAIL_BYTE_WIDTH - 1:0][7:0]     tail
   );
      logic [EXTRACT_FIELD_WIDTH - 1:0][7:0] con_data;
      logic [TAIL_BYTE_WIDTH - 1:0][7:0]     masked_tail;
      logic [CONST_OFFSET - 1:0]             byte_offset;
      logic [CONST_OFFSET - 1:0]             tail_byte_offset;
      byte_offset = offset[CONST_OFFSET - 1:0];
      tail_byte_offset = TAIL_BYTE_WIDTH - byte_offset;
      con_data = data << (tail_byte_offset * 8);
      masked_tail = tail << (byte_offset * 8);
      masked_tail >>= byte_offset * 8;
      con_data[TAIL_BYTE_WIDTH - 1:0] |= masked_tail;
      return con_data;
   endfunction

   //reg for latching valid exteraction packet signal
   always_ff@(posedge clk) begin
      if(!rst_n) begin
         ext_pkt <= '0;
      end else begin
         if(ready) begin
            if(!in_axis_TVALID) begin
               ext_pkt <= '0;
            end else if(sop && in_ext_valid) begin
               ext_pkt <= '1;
            end else if(sop) begin
               ext_pkt <= '0;
            end
         end
      end
   end

   //extract ctrl sigs
   always_ff@(posedge clk) begin
      if(!rst_n) begin
         ext_valid_reg[0] <= '0;
         ext_valid_reg[1] <= '0;
      end else begin
         if(ready) begin
            for(int i = 0; i < EXTRACTS_NUMBER; i++) begin
               ext_valid_reg[0][i] <= extract_valid(word_cntr, buf_signals[0].ext_valid || ext_pkt, buf_signals[0].ext_offset[i]);
               ext_valid_reg[1][i] <= ext_valid_reg[0][i];
            end
         end
      end
   end

   //extract data from bus
   always_comb data_tail = in_axis_TDATA >> ((ST_DATA_BYTE_SIZE - DATA_TAIL_WIDTH) * 8);
   always_comb lite_extended_in_data = {<<8{st_buf_data[ST_DATA_BYTE_SIZE - 1:0], data_tail}};
   always_ff@(posedge clk) begin
      if(ready) begin
         for(int i = 0; i < EXTRACTS_NUMBER; i++) begin
            ext_data[i] <= extract_field(word_cntr, buf_signals[0].ext_offset[i], lite_extended_in_data);
            ext_tail_data[i] <= extract_tail_field(word_cntr, buf_signals[0].ext_offset[i], lite_extended_in_data);
            lite_ext_data[i] <= concatenate_field(buf_signals[1].ext_offset[i], ext_data[i], ext_tail_data[i]);
         end
      end
   end

   //extracted data fifo
   always_comb fifo_rd_en = ready && buf_signals[ST_BUF_SIZE-1].ext_valid;
   for(genvar i = 0; i < EXTRACTS_NUMBER; i++) begin : fifo
      logic fifo_wr_en;
      always_comb fifo_wr_en = ready && ext_valid_reg[1][i];
      parameter_scfifo #(
          .ADDR_WIDTH        (FIFO_ADDR_WIDTH)
         ,.DATA_WIDTH        (EXTRACT_FIELD_WIDTH * 8)
         ,.ALMOST_FULL_VALUE ()
         ,.RAM_BLOCK_TYPE    ("MLAB")
      ) ext_data_fifo (
          .clock       (clk)
         ,.aclr        (~rst_n)
         ,.wrreq       (fifo_wr_en)
         ,.rdreq       (fifo_rd_en)
         ,.data        ({<<8{lite_ext_data[i]}})
         ,.almost_full ()
         ,.empty       ()
         ,.full        ()
         ,.q           (out_ext_data[i])
         ,.usedw       ()
      );
   end

   //drive aligned output if
   always_comb begin
      out_axis_TVALID = buf_signals[ST_BUF_SIZE-1].tvalid;
      out_axis_TLAST  = buf_signals[ST_BUF_SIZE-1].tlast;
      out_axis_TDATA  = st_buf_data[(ST_BUF_SIZE - 1) * ST_DATA_BYTE_SIZE+:ST_DATA_BYTE_SIZE];
      out_axis_TKEEP  = buf_signals[ST_BUF_SIZE-1].tkeep;
      out_axis_TUSER  = buf_signals[ST_BUF_SIZE-1].tuser;
      out_ext_length  = buf_signals[ST_BUF_SIZE-1].ext_length;
      out_ext_valid   = buf_signals[ST_BUF_SIZE-1].ext_valid;
   end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRgmaSLSM2GZ3+9KrmeC8PAUD+Ft6Xu2e2tzeIf/xmhON3dr4Nb6kJMP7tA6HebIVvH8i+zWF3rV1jDAAyiPSn4KA6mp1dcP6HMeg2412/32OvEY1Oth84mPQrh+FP/JTV+TlAgSzeeiUCj0oUzXmEFS+WYLzCNlnktNsgnJTJkSmFB9zli9296sgr4JmoJJEsqDYLOri6/J3ZVXbPPqt2m91wINa7gbkbiE1hSrKVzaoAocveSU6oPK3jwIdYMAGW3pYLLiT9OjF8PQPtoK2gIhoA/dgQB2UosRtqW/CnhyEpP8LCzo6e+f6JlLUuPWa8J4rG2SO4h5Z76t2kTx0FL7y3HJwSl9l3oIjzavuvo+8SWJmYnGyYdTOZYqOdLfi7IIN1NHdSPym+ZPmIGU71nHykl/uS/UTllUs9NJZj8Ay8kHNltfraRoa8n6vMZ0iu34DkefIYMBK3u8xGKHx6LgBoCx6TYdwqrWGP6nj+JMgHvRT/zoJf5SwD7Cujk6+6rXa9CoR3VT7YBkI18SeTjcmBvmqHQu6I61hcabKwk6m11t11PJeXgPh8YIZq4mFFqZrJyZ2GV8v7TE95tImtKP50IDKH8lYe4CqA9zrWKPbnMTTh06oH+NAc27kJfDoB2EjkCGo0FlfiybK4M8AD9PYhJGyx3lx2IIiw0eW7cdnTVe7vM2ftSaJmjtcI167plL8poPSM0/V3XITNp/7tzFsnAPVnhQapzQHwu7m2eX4uJlHaAdEgC/Xgr1cET/tUwuWhGL/HZH3GvrdJZfnjbB"
`endif