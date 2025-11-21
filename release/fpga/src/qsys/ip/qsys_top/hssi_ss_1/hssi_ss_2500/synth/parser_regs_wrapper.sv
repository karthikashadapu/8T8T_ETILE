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

//parallel read and write cmds are not supported
//pipelined read and write cmds are not supported

(* altera_attribute = {"\
   -name SDC_STATEMENT \"set_false_path -to   [get_registers *regs_enabled.parser_regs*_sync*]\";\
   -name SDC_STATEMENT \"set_false_path -from [get_registers *regs_enabled.parser_regs*rdata_r*] -to [get_registers *regs_enabled.parser_regs*axi_sl_rdata*]\"\
"} *)

module parser_regs_wrapper #(
    parameter  int DETECTING_CHAINS_NUMBER = 0
   ,parameter  int CNT_WIDTH               = 48
   ,parameter  int BASE_OFFSET             = 16'h100
   ,parameter  int MEM_BASED_STATS_EN      = 1
   ,localparam int RESULT_PKTS_NUM_WIDTH   = parser_pkg::get_width(DETECTING_CHAINS_NUMBER)
   ,localparam int ADDITIONAL_REGS_NUM     = 2
   ,localparam int REGISTERS_NUM           = DETECTING_CHAINS_NUMBER + ADDITIONAL_REGS_NUM
   ,localparam int AXI_SL_ADDR_WIDTH       = parser_pkg::get_width(BASE_OFFSET + (REGISTERS_NUM * 2 * 4))
   ,localparam int AXI_SL_DATA_WIDTH       = 32
   ,localparam int AXI_SL_RESP_WIDTH       = 2
   ,localparam int AXI_SL_STRB_WIDTH       = AXI_SL_DATA_WIDTH / 8
) (
    input  logic                               clk
   ,input  logic                               rst_n
   ,input  logic                               axi_sl_clk
   ,input  logic                               axi_sl_rst_n
   //low rate AXI slave Write Address Channel
   ,output logic                               axi_sl_awready
   ,input  logic                               axi_sl_awvalid
   ,input  logic [AXI_SL_ADDR_WIDTH - 1:0]     axi_sl_awaddr
   //low rate AXI slave Write Data Channel
   ,output logic                               axi_sl_wready
   ,input  logic                               axi_sl_wvalid
   ,input  logic [AXI_SL_STRB_WIDTH - 1:0]     axi_sl_wstrb
   ,input  logic [AXI_SL_DATA_WIDTH - 1:0]     axi_sl_wdata
   //low rate AXI slave Write Response Channel
   ,input  logic                               axi_sl_bready
   ,output logic                               axi_sl_bvalid
   ,output logic [AXI_SL_RESP_WIDTH - 1:0]     axi_sl_bresp
   //low rate AXI slave Read Address Channel
   ,output logic                               axi_sl_arready
   ,input  logic                               axi_sl_arvalid
   ,input  logic [AXI_SL_ADDR_WIDTH - 1:0]     axi_sl_araddr
   //low rate AXI slave Read Data Channel
   ,input  logic                               axi_sl_rready
   ,output logic                               axi_sl_rvalid
   ,output logic [AXI_SL_RESP_WIDTH - 1:0]     axi_sl_rresp
   ,output logic [AXI_SL_DATA_WIDTH - 1:0]     axi_sl_rdata
   //parser result
   ,input  logic                               i_parser_result_valid
   ,input  logic                               i_parser_result_pkt_recognized
   ,input  logic [RESULT_PKTS_NUM_WIDTH - 1:0] i_parser_result_pkt_num
);

   localparam int CMD_DELAY_CNTR_WIDTH = 7;
   localparam int OPT_CNT_WIDTH = 32;
   localparam int MEM_LATENCY = 2;
   localparam int CNTR_UPDATE_LATENCY = 5;
   localparam int CNTR_INCR_WIDTH = parser_pkg::get_width(CNTR_UPDATE_LATENCY);
   localparam int BASE_OFFSET_WIDTH = parser_pkg::get_width(BASE_OFFSET);
   localparam int CFG_REGISTERS_NUM = MEM_BASED_STATS_EN ? 2 : REGISTERS_NUM;
   localparam logic [AXI_SL_RESP_WIDTH - 1:0] RESP_OK = '0;
   localparam logic [AXI_SL_RESP_WIDTH - 1:0] RESP_DECERR = 'b11;

   logic [CMD_DELAY_CNTR_WIDTH - 1:0]  cmd_delay_cntr;
   logic [1:0][OPT_CNT_WIDTH - 1:0]    cntr[CFG_REGISTERS_NUM];
   logic [AXI_SL_ADDR_WIDTH - 1:0]     addr_sync, wr_reg_num;
   logic                               cnt_en[DETECTING_CHAINS_NUMBER];
   logic [REGISTERS_NUM - 1:0]         clr_en_sync, clr_en;
   logic [AXI_SL_ADDR_WIDTH - 1:0]     araddr_r, araddr_s;
   logic                               araddr_m;
   logic                               arvalid_r, rd_valid, rd_valid_sync, rd_valid_sync_d;
   logic [AXI_SL_DATA_WIDTH - 1:0]     rdata_r;

   logic [RESULT_PKTS_NUM_WIDTH - 1:0] m_parser_result_pkt_num;
   logic [MEM_LATENCY - 1:0]           mem_read_valid_r;
   logic [CNTR_INCR_WIDTH - 1:0]       m_incr;
   logic [MEM_LATENCY - 1:0][CNTR_INCR_WIDTH - 1:0] incr_r;
   logic [CNT_WIDTH - 1:0]             memb_rd_d, memb_wr_d;
   logic [1:0][OPT_CNT_WIDTH - 1:0]    mema_rd_d;
   logic [CNTR_UPDATE_LATENCY - 1:0][RESULT_PKTS_NUM_WIDTH - 1:0] memb_wr_addr_r;
   logic [RESULT_PKTS_NUM_WIDTH - 1:0] mema_rd_addr_sync, mema_wr_addr, mema_wr_addr_sync, mem_addr;
   logic                               m_valid, memb_wr_valid, mema_sel, mema_wr, mema_wr_sync, cor_wr_req, cor_rd_req, cor_rd_addr, cor_rd_addr_sync, cor_wr_addr;

   //counter for TA holding for synchronization
   always_ff@(posedge axi_sl_clk) begin
      if(!axi_sl_rst_n) begin
         cmd_delay_cntr <= '0;
      end else begin
         if(axi_sl_arvalid || axi_sl_awvalid || cmd_delay_cntr) begin
            cmd_delay_cntr <= cmd_delay_cntr + 1'b1;
         end
      end
   end

   function automatic logic cntr_almost_overflow(
      input logic [CMD_DELAY_CNTR_WIDTH - 1:0] cntr
   );
      return (&cntr[CMD_DELAY_CNTR_WIDTH - 1:1]) & ~cntr[0];
   endfunction

   //drive axi sl bp signals
   always_ff@(posedge axi_sl_clk) begin
      if(!axi_sl_rst_n) begin
         axi_sl_awready <= '0;
         axi_sl_wready  <= '0;
         axi_sl_arready <= '0;
      end else begin
         axi_sl_awready <= '0;
         axi_sl_wready  <= '0;
         axi_sl_arready <= '0;
         if(cntr_almost_overflow(cmd_delay_cntr)) begin
            if(axi_sl_awvalid) begin
               axi_sl_awready <= '1;
               axi_sl_wready  <= '1;
            end else if(axi_sl_arvalid)begin
               axi_sl_arready <= '1;
            end
         end
      end
   end

   //drive axi sl output valids
   always_ff@(posedge axi_sl_clk) begin
      if(!axi_sl_rst_n) begin
         axi_sl_rvalid <= '0;
         axi_sl_bvalid <= '0;
      end else begin
         if(axi_sl_rready) begin
            axi_sl_rvalid <= '0;
         end
         if(axi_sl_bready) begin
            axi_sl_bvalid <= '0;
         end
         if(&cmd_delay_cntr) begin
            if(axi_sl_awvalid) begin
               axi_sl_bvalid <= '1;
               if(cor_wr_req) begin
                  axi_sl_bresp <= RESP_OK;
               end else begin
                  axi_sl_bresp <= RESP_DECERR;
               end
            end else if(axi_sl_arvalid) begin
               axi_sl_rvalid <= '1;
               if(cor_rd_req) begin
                  axi_sl_rresp <= RESP_OK;
               end else begin
                  axi_sl_rresp <= RESP_DECERR;
               end
            end
         end
      end
   end

   //control siganls on axi clk
   always_comb wr_reg_num = (AXI_SL_ADDR_WIDTH'(axi_sl_awaddr - BASE_OFFSET)) >> 3;
   always_comb araddr_s = AXI_SL_ADDR_WIDTH'(axi_sl_araddr - BASE_OFFSET);
   always_ff@(posedge axi_sl_clk) begin
      araddr_m <= |axi_sl_araddr[AXI_SL_ADDR_WIDTH - 1:BASE_OFFSET_WIDTH];
      araddr_r <= '0;
      if(araddr_m) begin
         araddr_r <= araddr_s;
      end

      cor_wr_addr <= axi_sl_awvalid & (&axi_sl_wdata) & ~axi_sl_awaddr[2] & (&axi_sl_wstrb) & ~(|axi_sl_awaddr[1:0]) & wr_reg_num < REGISTERS_NUM;
      cor_wr_req <= axi_sl_awvalid & (axi_sl_awaddr < (BASE_OFFSET + (REGISTERS_NUM * 2 * 4)));

      cor_rd_addr <= axi_sl_arvalid & ((araddr_s >> 2) < REGISTERS_NUM * 2) & ~(|axi_sl_araddr[1:0]);
      cor_rd_req <= axi_sl_arvalid & (axi_sl_araddr < (BASE_OFFSET + (REGISTERS_NUM * 2 * 4)));

      clr_en <= '0;
      clr_en[wr_reg_num] <= cor_wr_addr;
   end

   //axi to core clk sync
   always_ff@(posedge clk) begin
      clr_en_sync <= clr_en;
      addr_sync <= araddr_r >> 2;
      cor_rd_addr_sync <= cor_rd_addr;
   end

   //arvalid toggle detector
   always_ff@(posedge axi_sl_clk) begin
      if(!axi_sl_rst_n) begin
         arvalid_r <= '0;
         rd_valid <= '0;
      end else begin
         arvalid_r <= axi_sl_arvalid;
         rd_valid <= !arvalid_r && axi_sl_arvalid;
      end
   end

   toggle_synchronizer tg_sync(
       .clk_in  (axi_sl_clk)
      ,.rst_in  (!axi_sl_rst_n)
      ,.clk_out (clk)
      ,.sig_in  (rd_valid)
      ,.sig_out (rd_valid_sync)
   );

   //get current cntr state for sync
   always_ff@(posedge clk) begin
      rd_valid_sync_d <= rd_valid_sync;
      if(rd_valid_sync_d) begin
         rdata_r <= '0;
         if(cor_rd_addr_sync) begin
            if(MEM_BASED_STATS_EN == 0) begin
               rdata_r <= cntr[addr_sync >> 1][addr_sync[0]];
            end else begin
               if(mema_sel) begin
                  rdata_r <= mema_rd_d[addr_sync[0]];
               end else begin
                  rdata_r <= cntr[addr_sync >> 1][addr_sync[0]];
               end
            end
         end
      end
   end

   //core to axi clk sync
   always_ff@(posedge axi_sl_clk) begin
      axi_sl_rdata <= rdata_r;
   end

   //init of unused cntr bits
   for(genvar i = 0; i < CFG_REGISTERS_NUM; i++) begin : unused_bits_init
      always_comb cntr[i][1][31:16] = '0;
   end

   perf_cntr #(
       .CNT_WIDTH(CNT_WIDTH)
   ) recognized_pkts_cntr (
       .clk      (clk)
      ,.rst      (~rst_n)
      ,.i_clr    (clr_en_sync[0])
      ,.i_cnt_en (i_parser_result_valid && i_parser_result_pkt_recognized)
      ,.o_cntr   ({cntr[0][1][15:0], cntr[0][0]})
   );

   perf_cntr #(
       .CNT_WIDTH(CNT_WIDTH)
   ) non_recognized_pkts_cntr (
       .clk      (clk)
      ,.rst      (~rst_n)
      ,.i_clr    (clr_en_sync[1])
      ,.i_cnt_en (i_parser_result_valid && ~i_parser_result_pkt_recognized)
      ,.o_cntr   ({cntr[1][1][15:0], cntr[1][0]})
   );

   if(MEM_BASED_STATS_EN == 0) begin : mem_stats_dis
      for(genvar i = 0; i < DETECTING_CHAINS_NUMBER; i++) begin : ptype_reg
         always_comb cnt_en[i] = i_parser_result_pkt_num == i;
         perf_cntr #(
             .CNT_WIDTH(CNT_WIDTH)
         ) recognized_pkts_by_type_cntr (
             .clk      (clk)
            ,.rst      (~rst_n)
            ,.i_clr    (clr_en_sync[i + ADDITIONAL_REGS_NUM])
            ,.i_cnt_en (i_parser_result_valid && i_parser_result_pkt_recognized && cnt_en[i])
            ,.o_cntr   ({cntr[i + ADDITIONAL_REGS_NUM][1][15:0], cntr[i + ADDITIONAL_REGS_NUM][0]})
         );
      end
   end else begin : mem_stats_en
      //control siganls on axi clk
      always_ff@(posedge axi_sl_clk) begin
         mem_addr <= '0;
         if(araddr_m) begin
            mem_addr <= RESULT_PKTS_NUM_WIDTH'((araddr_s >> 3) - 2);
         end

         mema_wr <= '0;
         if(wr_reg_num >> 1) begin //reg num > 1
            mema_wr <= cor_wr_addr;
         end
         mema_wr_addr <= RESULT_PKTS_NUM_WIDTH'(wr_reg_num - 2);
      end

      //axi to core clk sync
      always_ff@(posedge clk) begin
         mema_rd_addr_sync <= mem_addr;
         mema_wr_sync <= mema_wr;
         mema_wr_addr_sync <= mema_wr_addr;
      end

      //read from memory control
      always_ff@(posedge clk) begin
         mema_sel <= '0;
         if(addr_sync >> 2) begin //addr > 1
            mema_sel <= '1;
         end
      end

      //pipelined signals for mem stats
      always_ff@(posedge clk) begin
         mem_read_valid_r[0] <= m_valid;
         incr_r[0] <= m_incr;
         for(int i = 0; i < MEM_LATENCY - 1; i++) begin
            mem_read_valid_r[i+1] <= mem_read_valid_r[i];
            incr_r[i+1] <= incr_r[i];
         end

         memb_wr_addr_r[0] <= m_parser_result_pkt_num;
         for(int i = 0; i < CNTR_UPDATE_LATENCY - 2; i++) begin
            memb_wr_addr_r[i+1] <= memb_wr_addr_r[i];
         end
      end

      stat_reqs_merge #(
          .MERGE_NUM  (CNTR_UPDATE_LATENCY)
         ,.ID_WIDTH   (RESULT_PKTS_NUM_WIDTH)
         ,.INCR_WIDTH (CNTR_INCR_WIDTH)
      ) stat_reqs_merge (
          .clk     (clk)
         ,.rst     (~rst_n)
         ,.i_valid (i_parser_result_valid & i_parser_result_pkt_recognized)
         ,.i_id    (i_parser_result_pkt_num)
         ,.o_valid (m_valid)
         ,.o_id    (m_parser_result_pkt_num)
         ,.o_incr  (m_incr)
      );

      always_comb mema_rd_d[1][31:16] = '0;
      mem4ports_param #(
          .ADDR_WIDTH (RESULT_PKTS_NUM_WIDTH)
         ,.DATA_WIDTH (CNT_WIDTH)
      ) stats_mem (
          .clock           (clk)
         //port A
         ,.wren_a          (mema_wr_sync)
         ,.write_address_a (mema_wr_addr_sync)
         ,.read_address_a  (mema_rd_addr_sync)
         ,.data_a          ('0)
         ,.q_a             ({mema_rd_d[1][15:0], mema_rd_d[0]})
         //port B
         ,.wren_b          (memb_wr_valid)
         ,.write_address_b (memb_wr_addr_r[CNTR_UPDATE_LATENCY - 2])
         ,.read_address_b  (m_parser_result_pkt_num)
         ,.data_b          (memb_wr_d)
         ,.q_b             (memb_rd_d)
      );

      perf_cntr_v2 #(
          .CNT_WIDTH  (CNT_WIDTH)
         ,.INCR_WIDTH (CNTR_INCR_WIDTH)
      ) stats_mem_cntr (
          .clk     (clk)
         ,.rst     (~rst_n)
         ,.i_valid (mem_read_valid_r[MEM_LATENCY - 1])
         ,.i_incr  (incr_r[MEM_LATENCY - 1])
         ,.i_cntr  (memb_rd_d)
         ,.o_valid (memb_wr_valid)
         ,.o_cntr  (memb_wr_d)
      );
   end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRg5bNqgr0APZqkHGHVngb+jkkAQYS5q157DqJ+0aIiHfrAzvuobAnIgAkDiyyDShGVXSgtHgW++zd7f9x5l+zAVgxq+QVF372XdJwz0Gfhru9NedIChGfIvm3K0QCXFklmKcU2l1vKW3HIgxZC3/mU0ZjGtRbY2gWpJuXSKBU/m5TRJObWiQI4zTUUI2O/GvD5Ffj5EJ70v4K4dN2m3q5Y9LfsMGDvfYhmLJNZpnE+l6QNAWzLZmO50EhZcUvuwnfhJG18S6SIUM8S3z2xjgiJWlIJki+FVM7myhYSU7GYSAtk56ECG0rBwv+7e7zzQbsbDMk27njrpbQ3VsCHr6TC8ussWF8uvNhOX8sx0r6Y69MrjxD3+KaFBZFPrZUuXDS30zX2so1myEIyOIN50cMqUdwAMOaHLugWbG2N30lphuDPdWd+nBxXKhNGfFKpIcF5GXs13vghxGS5cI7vY1a35lifrPurlBmDttq0UMp+vNMsPHl1MD069c0Tpch3jGEperR0IR7lIw4FV57+BwblQY0uEtHbGr1GcPAgY0zZNSTnFa8xMhc/fjp/ycUIxfqlGGodshrlTozfGszAi9iLVmbm0mCwtjX3IM/9nqktIWdSehMnitCOWqNAoLqriireBdu1eiSca+J0FRRvO5/aW0M94xTgA1n3gINuXR1+KClnz3WyrwT4iU6yiu+SvhGxPx3WzeXDxdIZiGs0VTPHFALYppJR2a2russq0D5i2x2uZ6fHLVZacYLsXVTrUaE7nPH3C42apdLrDOZbUGycG"
`endif