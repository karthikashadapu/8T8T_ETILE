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


// Copyright 2019-2022 Intel Corporation.
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

module mpkt_parser #(
    parameter  int LOG2_DATA_WIDTH          = 9
   ,parameter  int TUSER_WIDTH              = 1
   ,parameter  int IN_OFFSET_BYTE_WIDTH     = 8
   ,parameter  int RESULT_NUM               = 1
   ,parameter  int EXTRACT_CMD_NUM          = 1
   ,parameter  int DETECTING_CHAINS_NUMBER  = 1
   ,parameter  int FAR_PATTERN_BYTE_OFFSET  = 1
   ,parameter  int HEADER_ATTRIBUTES_NUMBER = 1
   ,parameter  int HEADER_ATTRIBUTES_SIZE   = 1
   ,parameter  int CONST_PARSER_LATENCY     = 0 //0-parser has constant latency, 1-source can rise valid when !in_axis_TREADY
   ,localparam int RESULT_LENGTH            = 16
   ,localparam int RESULT_PKTS_NUM_WIDTH    = parser_pkg::get_width(DETECTING_CHAINS_NUMBER)
) (
    input  logic                                              clk
   ,input  logic                                              rst_n

   ,input  logic [IN_OFFSET_BYTE_WIDTH - 1:0]                 in_prev_offset
   ,input  logic [HEADER_ATTRIBUTES_SIZE - 1:0]               in_header_attributes
   ,input  logic [HEADER_ATTRIBUTES_NUMBER - 1:0]             in_pkt_type_classifiers[DETECTING_CHAINS_NUMBER]
   ,input  logic [RESULT_PKTS_NUM_WIDTH - 1:0]                in_result_pkts_num[DETECTING_CHAINS_NUMBER]
   ,input  logic [RESULT_NUM - 1:0][DETECTING_CHAINS_NUMBER - 1:0][RESULT_LENGTH - 1:0] in_result
   ,input  logic [EXTRACT_CMD_NUM - 1:0][DETECTING_CHAINS_NUMBER - 1:0][RESULT_LENGTH - 1:0] in_extract_cmd
   //AXIs sink/input
   ,output logic                                              in_axis_TREADY
   ,input  logic                                              in_axis_TVALID
   ,input  logic                                              in_axis_TLAST
   ,input  logic [2**LOG2_DATA_WIDTH - 1:0]                   in_axis_TDATA
   ,input  logic [2**(LOG2_DATA_WIDTH - 3) - 1:0]             in_axis_TKEEP
   ,input  logic [TUSER_WIDTH - 1:0]                          in_axis_TUSER
   //AXIs source/output
   ,input  logic                                              out_axis_TREADY
   ,output logic                                              out_axis_TVALID
   ,output logic                                              out_axis_TLAST
   ,output logic [2**LOG2_DATA_WIDTH - 1:0]                   out_axis_TDATA
   ,output logic [2**(LOG2_DATA_WIDTH - 3) - 1:0]             out_axis_TKEEP
   ,output logic [TUSER_WIDTH - 1:0]                          out_axis_TUSER
   //result
   ,output logic                                              o_parser_result_valid
   ,output logic                                              o_parser_result_pkt_recognized
   ,output logic [RESULT_PKTS_NUM_WIDTH - 1:0]                o_parser_result_pkt_num
   ,output logic [RESULT_NUM - 1:0][RESULT_LENGTH - 1:0]      o_parser_result_data
   ,output logic [EXTRACT_CMD_NUM - 1:0][RESULT_LENGTH - 1:0] o_parser_result_extract_cmd
);

   localparam int AXIS_DATA_WIDTH = 2**LOG2_DATA_WIDTH;
   localparam int AXIS_DATA_BYTE_SIZE = AXIS_DATA_WIDTH / 8;
   localparam int FIFO_LATENCY = 4;

   localparam int AXIS_BUF_SIZE = FAR_PATTERN_BYTE_OFFSET < AXIS_DATA_BYTE_SIZE ?
      2 + FIFO_LATENCY
   :
      1 + (FAR_PATTERN_BYTE_OFFSET / AXIS_DATA_BYTE_SIZE) + FIFO_LATENCY;
   localparam int AXIS_LOG2_DATA_BYTE_WIDTH = LOG2_DATA_WIDTH - 3;
   localparam int AXIS_BUF_DATA_SIZE = AXIS_BUF_SIZE * AXIS_DATA_BYTE_SIZE;
   localparam int AXIS_CURR_BUF_DATA_SIZE = (AXIS_BUF_SIZE + 1) * AXIS_DATA_BYTE_SIZE;
   localparam int HEADER_OFFSET_SIZE = parser_pkg::get_width(FAR_PATTERN_BYTE_OFFSET) + 1;
   localparam int RES_FIFO_ADDR_WIDTH = 3;//should be derived from MODULE_LATENCY

   typedef struct packed {
      logic sop;
      logic tvalid;
      logic tlast;
   } st_aggregated_signals_t;

   typedef struct packed {
      logic [2**LOG2_DATA_WIDTH - 1:0]       tdata;
      logic [2**(LOG2_DATA_WIDTH - 3) - 1:0] tkeep;
      logic [TUSER_WIDTH - 1:0]              tuser;
      logic [IN_OFFSET_BYTE_WIDTH - 1:0]     prev_offset;
   } st_data_aggregated_signals_t;

   typedef struct packed {
      logic [HEADER_OFFSET_SIZE - 1:0] offset;
      logic [1:0]                      size; //0 - first nibble of the byte,  1 - 1byte, 2 - 2bytes
      logic [1:0][7:0]                 data; //max.footprint
   } header_attributes_t;

   typedef struct packed {
      logic                                              pkt_recognized;
      logic [RESULT_PKTS_NUM_WIDTH - 1:0]                pkt_num;
      logic [RESULT_NUM - 1:0][RESULT_LENGTH - 1:0]      result;
      logic [EXTRACT_CMD_NUM - 1:0][RESULT_LENGTH - 1:0] extract_cmd;
   } p_result_t;

   logic                                                sop, ready_in, valid_in, prev_valid_in;
   logic                                                res_fifo_wr_en[2], res_fifo_rd_en, res_fifo_wr_done;
   logic                                                dat_fifo_wr_en, dat_fifo_rd_en;
   st_aggregated_signals_t                              st_ag_in_signals;
   st_aggregated_signals_t [AXIS_BUF_SIZE - 1:0]        st_buf_signals;
   st_data_aggregated_signals_t                         st_dat_ag_signals_in, st_dat_ag_signals_out;
   logic [AXIS_DATA_BYTE_SIZE - 1:0][7:0]               lite_tx_data;

   logic                                                ready; //adjusted for reqested ready latency
   logic [HEADER_OFFSET_SIZE - 1:0]                     word_cntr;

   header_attributes_t [HEADER_ATTRIBUTES_NUMBER - 1:0] header_attributes;
   logic [HEADER_ATTRIBUTES_NUMBER - 1:0]               header_valid;
   logic [DETECTING_CHAINS_NUMBER-1:0]                  pkt_type;
   p_result_t                                           p_result[2];

   always_comb header_attributes = in_header_attributes;
   always_comb ready = out_axis_TREADY;
   always_comb in_axis_TREADY = ready && ready_in;

   //if input AXIs raises valid when !out_axis_TREADY
   //then pipeline is not ready for 1 cycle for input when out_axis_TREADY
   always_comb valid_in = ready_in && in_axis_TVALID;
   if(CONST_PARSER_LATENCY) begin : const_par_lat
      always_comb ready_in = '1;
   end else begin
      always_ff@(posedge clk) begin
         if(!rst_n) begin
            ready_in <= '1;
         end else begin
            prev_valid_in <= in_axis_TVALID;
            if(!ready) begin
               if(!prev_valid_in && in_axis_TVALID) begin
                  ready_in <= '0;
               end
            end else begin
               ready_in <= '1;
            end
         end
      end
   end

   //SOP detecting
   always_ff@(posedge clk) begin
      if(!rst_n) begin
         sop <= '1;
      end else begin
         if(ready) begin
            if(!valid_in) begin
               sop <= '1;
            end else if(in_axis_TLAST) begin
               sop <= '1;
            end else begin
               sop <= '0;
            end
         end
      end
   end

   //AvST bus word cntr
   always_ff@(posedge clk) begin
      if(!rst_n) begin
         word_cntr <= '0;
      end else begin
         if(ready) begin
            if(in_axis_TLAST && valid_in) begin
               word_cntr <= '0;
            end else if(valid_in) begin
               if(!(&(word_cntr[HEADER_OFFSET_SIZE - 1:AXIS_LOG2_DATA_BYTE_WIDTH]))) begin
                  word_cntr <= HEADER_OFFSET_SIZE'(word_cntr + AXIS_DATA_BYTE_SIZE);
               end
            end
         end
      end
   end

   //AvST control sigs shift register for the output
   always_comb st_ag_in_signals = {sop && valid_in, valid_in, in_axis_TLAST};
   always_ff@(posedge clk) begin
      if(!rst_n) begin
         st_buf_signals <= '0;
      end else begin
         if(ready) begin
            st_buf_signals <= {st_buf_signals[AXIS_BUF_SIZE - 2:0], st_ag_in_signals};
         end
      end
   end

   //data fifo drive signals
   always_comb begin
      dat_fifo_wr_en = ready & valid_in;
      dat_fifo_rd_en = ready & st_buf_signals[AXIS_BUF_SIZE - 1].tvalid;
      st_dat_ag_signals_in = {in_axis_TDATA, in_axis_TKEEP, in_axis_TUSER, in_prev_offset};
   end

   //data fifo
   parameter_scfifo #(
       .NUMBER_WORDS      (AXIS_BUF_SIZE+1)
      ,.DATA_WIDTH        ($bits(st_data_aggregated_signals_t))
      ,.ALMOST_FULL_VALUE ()
      ,.RAM_BLOCK_TYPE    ("MLAB")
   ) data_fifo (
       .clock       (clk)
      ,.aclr        (~rst_n)
      ,.wrreq       (dat_fifo_wr_en)
      ,.rdreq       (dat_fifo_rd_en)
      ,.data        (st_dat_ag_signals_in)
      ,.almost_full ()
      ,.empty       ()
      ,.full        ()
      ,.q           (st_dat_ag_signals_out)
      ,.usedw       ()
   );

   //detect required header on given offset in data stream
   function automatic logic detect_header(
       logic [HEADER_OFFSET_SIZE - 1:0]       word_offset
      ,header_attributes_t                    header
      ,logic [AXIS_DATA_BYTE_SIZE - 1:0][7:0] data
      ,logic [IN_OFFSET_BYTE_WIDTH - 1:0]     prev_offset
   );
      logic [HEADER_OFFSET_SIZE - 1:0]                             offset;
      logic [HEADER_OFFSET_SIZE - AXIS_LOG2_DATA_BYTE_WIDTH - 1:0] hw_offset;
      logic [AXIS_LOG2_DATA_BYTE_WIDTH - 1:0]                      hb_offset;

      offset = header.offset + prev_offset;
      hw_offset = offset[HEADER_OFFSET_SIZE - 1:AXIS_LOG2_DATA_BYTE_WIDTH];
      hb_offset = offset[AXIS_LOG2_DATA_BYTE_WIDTH - 1:0];
      if(word_offset[HEADER_OFFSET_SIZE - 1:AXIS_LOG2_DATA_BYTE_WIDTH] == hw_offset) begin
         if(header.size == 2'h0) begin
            if(data[hb_offset][3:0] == header.data[0][3:0]) begin
               return '1;
            end
         end else if(header.size == 2'h1) begin
            if(data[hb_offset] == header.data[0]) begin
               return '1;
            end
         end else begin
            if(data[hb_offset] == header.data[1] &&
               data[hb_offset+1] == header.data[0]) begin
               return '1;
            end
         end
      end
      return '0;
   endfunction

   //detect all headers
   always_comb lite_tx_data = {<<8{in_axis_TDATA}};
   always_ff@(posedge clk) begin
      if(ready) begin
         for(int i = 0; i < HEADER_ATTRIBUTES_NUMBER; i++) begin
            if(valid_in && sop) begin
               header_valid[i] <= detect_header(word_cntr, header_attributes[i], lite_tx_data, in_prev_offset);
            end else if(valid_in) begin
               header_valid[i] <= header_valid[i] | detect_header(word_cntr, header_attributes[i], lite_tx_data, in_prev_offset);
            end
         end
      end
   end

   //detect one type of packet from given by classifier array
   function logic [DETECTING_CHAINS_NUMBER-1:0] detect_packet(
      logic [HEADER_ATTRIBUTES_NUMBER - 1:0] h_valid,
      logic [HEADER_ATTRIBUTES_NUMBER - 1:0] classifier_array[DETECTING_CHAINS_NUMBER]
   );
      logic [HEADER_ATTRIBUTES_NUMBER - 1:0] cleaned_result1[DETECTING_CHAINS_NUMBER];
      logic [DETECTING_CHAINS_NUMBER-1:0] cleaned_result2;
      for(int i = 0; i < DETECTING_CHAINS_NUMBER; i++) begin
         cleaned_result1[i] = h_valid & classifier_array[i]; //cleanup all incorrect matches outside pattern
         cleaned_result1[i] ^= classifier_array[i]; //put 1 if no match inside pattern
         cleaned_result2[i] = |cleaned_result1[i]; //"or" all matches
      end
      return ~cleaned_result2; //packet detected if after "xor" result has all "0"
   endfunction

   //detect all possible packets and assign result pipeline
   always_comb pkt_type = detect_packet(header_valid, in_pkt_type_classifiers);
   always_ff@(posedge clk) begin
      p_result[0].pkt_recognized <= |pkt_type;
      for(int i = 0; i < DETECTING_CHAINS_NUMBER; i++) begin
         if(pkt_type[i]) begin
            p_result[0].pkt_num <= in_result_pkts_num[i];
            for(int n = 0; n < RESULT_NUM; n++) begin
               p_result[0].result[n] <= in_result[n][i];
            end
            for(int k = 0; k < EXTRACT_CMD_NUM; k++) begin
               p_result[0].extract_cmd[k] <= in_extract_cmd[k][i];
            end
         end
      end
   end

   //register for detecting situation when packet is shorter than module latency
   always_ff@(posedge clk) begin
      if(!rst_n) begin
         res_fifo_wr_done <= '0;
      end else begin
         if(ready) begin
            if(sop && valid_in) begin
               res_fifo_wr_done <= '0;
            end else if(word_cntr[HEADER_OFFSET_SIZE - 1:AXIS_LOG2_DATA_BYTE_WIDTH] == AXIS_BUF_SIZE - FIFO_LATENCY - 1) begin
               res_fifo_wr_done <= '1;
            end
         end
      end
   end

   //result fifo write control
   always_ff@(posedge clk) begin
      if(!rst_n) begin
         res_fifo_wr_en[0] <= '0;
         res_fifo_wr_en[1] <= '0;
      end else begin
         res_fifo_wr_en[1] <= '0;
         if(ready) begin
            res_fifo_wr_en[0] <= '0;
            res_fifo_wr_en[1] <= res_fifo_wr_en[0];
            if(st_buf_signals[0].sop && st_buf_signals[0].tlast) begin
               res_fifo_wr_en[1] <= '1;
            end else if(!sop && !res_fifo_wr_done && word_cntr[HEADER_OFFSET_SIZE - 1:AXIS_LOG2_DATA_BYTE_WIDTH] == AXIS_BUF_SIZE - FIFO_LATENCY - 1) begin
               res_fifo_wr_en[0] <= '1;
            end else if(in_axis_TLAST && valid_in && !res_fifo_wr_done) begin
               res_fifo_wr_en[0] <= '1;
            end
         end
      end
   end

   always_comb res_fifo_rd_en = ready && st_buf_signals[AXIS_BUF_SIZE - 1].sop;
   parameter_scfifo #(
       .ADDR_WIDTH        (RES_FIFO_ADDR_WIDTH)
      ,.DATA_WIDTH        ($bits(p_result_t))
      ,.ALMOST_FULL_VALUE ()
      ,.RAM_BLOCK_TYPE    ("MLAB")
   ) result_fifo (
       .clock       (clk)
      ,.aclr        (~rst_n)
      ,.wrreq       (res_fifo_wr_en[1])
      ,.rdreq       (res_fifo_rd_en)
      ,.data        (p_result[0])
      ,.almost_full ()
      ,.empty       ()
      ,.full        ()
      ,.q           (p_result[1])
      ,.usedw       ()
   );

   //assign result from fifo to output if
   always_comb begin
      o_parser_result_pkt_recognized = p_result[1].pkt_recognized;
      o_parser_result_pkt_num        = p_result[1].pkt_num;
      o_parser_result_data           = p_result[1].result;
      for(int i = 0; i < EXTRACT_CMD_NUM; i++) begin
         o_parser_result_extract_cmd[i] = p_result[1].extract_cmd[i] + st_dat_ag_signals_out.prev_offset;
      end
   end

   //assign internal buf to output if
   always_comb begin
      o_parser_result_valid = st_buf_signals[AXIS_BUF_SIZE - 1].sop;
      out_axis_TVALID       = st_buf_signals[AXIS_BUF_SIZE - 1].tvalid;
      out_axis_TLAST        = st_buf_signals[AXIS_BUF_SIZE - 1].tlast;
      out_axis_TDATA        = st_dat_ag_signals_out.tdata;
      out_axis_TKEEP        = st_dat_ag_signals_out.tkeep;
      out_axis_TUSER        = st_dat_ag_signals_out.tuser;
   end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRjWCtLu+1SFcCL0ig/NTxCdI8gVg7HGbZbzEKShDKc30jeYpdxMpMPVZiSKrVY2po7/GqEE2wDRUXtIIo/JRFRyFOF8jsS0dm6z9JgAAqRRjGItQJd2CEecCgQpucGzYTaqVSBIYZVkmOPDw3WCDTZWqxD+t0343pgiCq6CCTE3YbBUXqq4wEXk18XU1rmCHZRohXbC/c/7os4drF/buybHmcVSRHlK0w/FqqeEgYJz67301R/4UkVZ6IxIJW6Ddt8E88jeG899FiFmo8lLNmPPh67o3Cu3ikZRCa6mh4uC5Ov5XNtomxd54HFjcFDhyd2VXRiOQhpkcAbtggZLBIJai+DU9rCUAa0RZQmLt7LwN0Z5Iu8xqVHNHn93cV4iEkd0lnXkUU1V7tIaEGlSkW7i1vN/gsTiqAnswaGv5iIPhZVT/cIjAdACEvV/By3mR4hcXRrSTb6GF2giXivfoWPUBbNllayJ594AONOaZHq24cAJI1ECQ7ljqeKbidG3/0Hgckpbic61kmRjfxPIQomg0jrinZagBpZi7nX0HT0VRn+4dr1Jj1QdSTLvh1sbV5LGUkA0TTWzvKgQX4a0AzgZqu34P5EJX+Gz5v/y1R6H2LESFX57KZQ34NH6DpZAIXUIRcCFQL1+NPQUhAf/L6F/BvPeMuNzYDKv+FOtofryYtkAbd6dC2KQWyASwPX4XyVMJjoZ2fYtdGj6HyUsP6iVggDV7WD+lla9V+A5xfWKecrWITgQztvbAmBLQ5BbhgF7+9SOOfaym/3GkeFPXkbI"
`endif