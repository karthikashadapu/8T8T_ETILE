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

module ptp_result #(
    parameter  int LOG2_EXTRACT_FIELD_BYTE_WIDTH = 2
   ,parameter  int TID_WIDTH                     = 1
   ,parameter  int NUM_OF_SEG                    = 16
   ,parameter  int PPMETADATA_WIDTH              = 1
   ,parameter  int USER_METADATA_WIDTH           = 1
   ,parameter  int HSSI_TX_TUSER_CLIENT_WIDTH    = 1
   ,parameter  int MPM_DEBUG                     = 0
   ,localparam int RESULT_LENGTH                 = 16
   ,localparam int DETECTING_CHAINS_NUMBER       = ptp_tx_adp_packet_parser_auto_pkg::DETECTING_CHAINS_NUMBER
   ,localparam int RESULT_NUM                    = ptp_tx_adp_packet_parser_auto_pkg::RESULT_NUM
   ,localparam int EXTRACT_CMD_NUM               = ptp_tx_adp_packet_parser_auto_pkg::EXTRACT_CMD_NUM
   ,localparam int RESULT_PKTS_NUM_WIDTH         = parser_pkg::get_width(DETECTING_CHAINS_NUMBER)
   ,localparam int EXTRACT_FIELD_WIDTH           = 2**LOG2_EXTRACT_FIELD_BYTE_WIDTH
   ,localparam int HSSI_TX_TUSER_PTP_WIDTH       = $bits(ptp_tx_adp_parser_pkg::tuser_ptp_t)
   ,localparam int HSSI_TX_TUSER_PTP_EXT_WIDTH   = $bits(ptp_tx_adp_parser_pkg::tuser_ptp_extended_t)
   ,localparam int AXI_SL_DATA_WIDTH             = 32
) (
    input  logic                                                        clk
   ,input  logic                                                        rst
   //sink/input
   ,input  logic                                                        in_ready
   ,input  logic [TID_WIDTH - 1:0]                                      in_axis_tid
   ,input  logic [NUM_OF_SEG - 1:0]                                     in_axis_tuser_last_segment
   ,input  logic [PPMETADATA_WIDTH - 1:0]                               in_axis_tuser_ppmetadata
   ,input  logic [USER_METADATA_WIDTH - 1:0]                            in_axis_tuser_usermetadata
   ,input  logic [HSSI_TX_TUSER_PTP_WIDTH - 1:0]                        in_axis_tx_tuser_ptp
   ,input  logic [1:0]                                                  in_axis_tx_tuser_ptp_na
   ,input  logic [HSSI_TX_TUSER_PTP_EXT_WIDTH - 1:0]                    in_axis_tx_tuser_ptp_extended
   ,input  logic [HSSI_TX_TUSER_CLIENT_WIDTH - 1:0]                     in_axis_tx_tuser_client
   ,input  logic [AXI_SL_DATA_WIDTH - 1:0]                              in_ptp_data
   //parser's result
   ,input logic                                                         in_pars_valid
   ,input logic                                                         in_pars_pkt_recognized
   ,input logic [RESULT_NUM - 1:0][RESULT_LENGTH - 1:0]                 in_pars_data
   ,input logic [EXTRACT_CMD_NUM - 1:0][EXTRACT_FIELD_WIDTH - 1:0][7:0] in_pars_ext_data
   //source/output
   ,output logic [TID_WIDTH - 1:0]                                      out_axis_tid
   ,output logic [NUM_OF_SEG - 1:0]                                     out_axis_tuser_last_segment
   ,output logic [PPMETADATA_WIDTH - 1:0]                               out_axis_tuser_ppmetadata
   ,output logic [USER_METADATA_WIDTH - 1:0]                            out_axis_tuser_usermetadata
   ,output logic [HSSI_TX_TUSER_PTP_WIDTH - 1:0]                        out_axis_tx_tuser_ptp
   ,output logic [1:0]                                                  out_axis_tx_tuser_ptp_na
   ,output logic [HSSI_TX_TUSER_PTP_EXT_WIDTH - 1:0]                    out_axis_tx_tuser_ptp_extended
   ,output logic [HSSI_TX_TUSER_CLIENT_WIDTH - 1:0]                     out_axis_tx_tuser_client
);

   localparam logic [1:0] OC = 2'b00;
   localparam logic [1:0] BC = 2'b01;
   localparam logic [1:0] E2E_TC = 2'b10;
   localparam logic [1:0] P2P_TC = 2'b11;

   localparam int PTP_MES_TYPE_LEN = 4;
   localparam logic [PTP_MES_TYPE_LEN - 1:0] SYNC             = 4'h0;
   localparam logic [PTP_MES_TYPE_LEN - 1:0] DELAY_REQ        = 4'h1;
   localparam logic [PTP_MES_TYPE_LEN - 1:0] PATH_DELAY_REQ   = 4'h2;
   localparam logic [PTP_MES_TYPE_LEN - 1:0] PATH_DELAY_RESP  = 4'h3;

   typedef struct packed {
      logic [TID_WIDTH - 1:0]                     tid;
      logic [NUM_OF_SEG - 1:0]                    last_segment;
      logic [PPMETADATA_WIDTH - 1:0]              ppmetadata;
      logic [USER_METADATA_WIDTH - 1:0]           usermetadata;
      ptp_tx_adp_parser_pkg::tuser_ptp_t          ptp;
      logic [1:0]                                 ptp_na;
      ptp_tx_adp_parser_pkg::tuser_ptp_extended_t ptp_extended;
      logic [HSSI_TX_TUSER_CLIENT_WIDTH - 1:0]    client;
   } tuser_sigs_t;

   logic [RESULT_LENGTH - 1:0]        ptp_header_offset, ptp_message_len;
   logic [PTP_MES_TYPE_LEN - 1:0]     ptp_mes_type;
   logic                              ins_cf, ipv4_type, ipv6_type, one_step_port, two_step_flag, p2p, asym;
   logic [1:0]                        clock_type;
   tuser_sigs_t                       tuser_in, tuser_out;

   //get/drive required signals
   always_comb begin
      tuser_in = {in_axis_tid, in_axis_tuser_last_segment, in_axis_tuser_ppmetadata, in_axis_tuser_usermetadata, in_axis_tx_tuser_ptp, in_axis_tx_tuser_ptp_na, in_axis_tx_tuser_ptp_extended, in_axis_tx_tuser_client};

      ptp_header_offset      = in_pars_data[0];
      {ipv6_type, ipv4_type} = in_pars_data[1][1:0];
      ptp_message_len        = in_pars_ext_data[0][1:0];
      ptp_mes_type           = in_pars_ext_data[0][3][3:0];
      two_step_flag          = in_pars_ext_data[1][1][1];

      clock_type = tuser_in.ptp.clock_type;

      one_step_port = '0;
      if(clock_type == OC || clock_type == BC) begin
         one_step_port = ~two_step_flag;
      end else if(clock_type == E2E_TC || clock_type == P2P_TC) begin
         one_step_port = '1;
      end

      tuser_in.ptp.ins_ets = in_pars_pkt_recognized && one_step_port && (clock_type == OC || clock_type == BC) && ptp_mes_type == SYNC;
   end

   //create ins_cf
   always_comb begin
      ins_cf = '0;
      if(one_step_port && !tuser_in.ptp.ts_req) begin
         if(clock_type == OC || clock_type == BC) begin
            ins_cf = ptp_mes_type == PATH_DELAY_RESP;
         end else if(clock_type == E2E_TC) begin
            ins_cf = ptp_mes_type == SYNC || ptp_mes_type == DELAY_REQ || ptp_mes_type == PATH_DELAY_REQ || ptp_mes_type == PATH_DELAY_RESP;
         end else if(clock_type == P2P_TC) begin
            ins_cf = ptp_mes_type == SYNC || ptp_mes_type == PATH_DELAY_RESP;
         end
      end
   end

   //extra ptp sigs
   always_comb begin
      p2p  = tuser_in.ptp.p2p && one_step_port && clock_type == P2P_TC && ptp_mes_type == SYNC;
      asym = tuser_in.ptp.asym && one_step_port && ((clock_type == E2E_TC && (ptp_mes_type == SYNC || ptp_mes_type == DELAY_REQ)) || (clock_type == P2P_TC && ptp_mes_type == SYNC));
   end

   //align/create result
   always_ff@(posedge clk) begin
      if(rst) begin
         tuser_out.ptp <= '0;
         tuser_out.ptp_extended <= '0;
      end else begin
         tuser_out.ptp_extended.ts_format <= '0;
         if(in_ready) begin
            tuser_out <= tuser_in;
            if(in_pars_pkt_recognized) begin
               tuser_out.ptp_extended.ts_offset   <= ptp_tx_adp_parser_pkg::OFFSET_WIDTH'(ptp_header_offset + 'd34);
               tuser_out.ptp_extended.cf_offset   <= ptp_tx_adp_parser_pkg::OFFSET_WIDTH'(ptp_header_offset + 'd8);
               tuser_out.ptp_extended.csum_offset <= ptp_tx_adp_parser_pkg::OFFSET_WIDTH'(ptp_header_offset - 'd2);
               tuser_out.ptp_extended.eb_offset   <= ptp_tx_adp_parser_pkg::OFFSET_WIDTH'(ptp_header_offset + ptp_message_len);
               tuser_out.ptp_extended.zero_csum   <= ipv4_type && (tuser_in.ptp.ins_ets || ins_cf || p2p || asym);
               tuser_out.ptp_extended.update_eb   <= ipv6_type && (tuser_in.ptp.ins_ets || ins_cf || p2p || asym);
               tuser_out.ptp_extended.tx_its      <= tuser_in.ptp_extended.tx_its;
               tuser_out.ptp_extended.ins_cf      <= ins_cf;

               tuser_out.ptp.p2p       <= p2p;
               tuser_out.ptp.asym      <= asym;
               tuser_out.ptp.asym_sign <= ptp_mes_type == DELAY_REQ;
               if(ptp_mes_type == DELAY_REQ) begin
                  tuser_out.ptp.asym_p2p_idx <= in_ptp_data[6:0];
               end
            end
            if(MPM_DEBUG) begin
               tuser_out.ptp_extended <= in_pars_ext_data;
            end
         end
      end
   end

   //drive output if
   always_comb begin
      out_axis_tid                   = tuser_out.tid;
      out_axis_tuser_last_segment    = tuser_out.last_segment;
      out_axis_tuser_ppmetadata      = tuser_out.ppmetadata;
      out_axis_tuser_usermetadata    = tuser_out.usermetadata;
      out_axis_tx_tuser_ptp          = tuser_out.ptp;
      out_axis_tx_tuser_ptp_na       = tuser_out.ptp_na;
      out_axis_tx_tuser_ptp_extended = tuser_out.ptp_extended;
      out_axis_tx_tuser_client       = tuser_out.client;
   end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRhP/KgL06sk501X2UiyNtU5ophkKXEZwJr5bd9rerLeWMQrKkBw1oU7QmyLkvP0tr6hpkzktrImHM9rb2QqKBpEuqibZpmMcPHH5K7VZrYLGotAOdpF9/LRFyBfhJ8RPwgO4nk2BNvui+28lSdAzdC1YczrHRx7ZtLH5JGSucNID//GCwWog2Y5KinEvJvSLgrIXuKwBuOghn+aZQe6kAM4dkltb5/6mjxdsWHuK1UCekQpnWuDHMaqTDwNbkEju1Ofe8wuL1BraS4lf1mAD3ivXQh6hOPrYlpf7MEg3a0q0umEKhQxeuTSHp2aQRY7vKKPLytwi0FZZmA3wlUDALy88MJxK5qVZcsvJzNeTMF1XJ41hTK9uFGIWp7K1XF7H9q8YWFlKJ/gMv3a0+oIj7orEo9xj+22Z2xB2Ql7vUcZ9YlO+y76uJCo3EVc0PeT6d8JF0Xw/eSThC4PVwA5KLlezq5dH5SW+NCq04dsVu6ETr5cG0tIda5cCnhSAABLxS+FAZftn45XAq4NZq1yezSpeH0eqEd28g3zwtx2KTi61MsPeKc/gKO75yeMag0WSmcPly/W9K0OSESMDBFEJc4ECUxTuUs61W7Z9coi+U3Vgez7kQYaNpyitV7wB3DLRhS40fY5DCIErzU1wea6n4dKQqujRBriVsSnFYiT3yMZ6TsVPkTqfsQbg1w1MmvvsLqQJE/NjCVF3cAnGoa1s4kqwW1QRF44LDtfI52W26lDg7zyYP1q6xiO5YJHYNlX818A/3W0RC7iWfSqfr1HSWHB"
`endif