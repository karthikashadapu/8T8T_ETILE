/* ******************************************************************************************************************
 INTEL CONFIDENTIAL
 Copyright 2023 Intel Corporation All Rights Reserved.
 The source code contained or described herein and all documents related to the
 source code ("Material") are owned by Intel Corporation or its suppliers or
 licensors. Title to the Material remains with Intel Corporation or its
 suppliers and licensors. The Material may contain trade secrets and proprietary
 and confidential information of Intel Corporation and its suppliers and
 licensors, and is protected by worldwide copyright and trade secret laws and
 treaty provisions. No part of the Material may be used, copied, reproduced,
 modified, published, uploaded, posted, transmitted, distributed, or disclosed
 in any way without Intels prior express written permission.
 No license under any patent, copyright, trade secret or other intellectual
 property right is granted to or conferred upon you by disclosure or delivery
 of the Materials, either expressly, by implication, inducement, estoppel or
 otherwise. Any license under such intellectual property rights must be
 express and approved by Intel in writing.
 Unless otherwise agreed by Intel in writing, you may not remove or alter this
 notice or any other notice embedded in Materials by Intel or Intels suppliers
 or licensors in any way.
****************************************************************************************************************** */

`default_nettype none
`timescale 1ns/100ps
   
module o_ru_vif( 
// VIF PINLIST
   wire        clk_csr,                                                                                        
   wire        clk_dsp, 
   wire        clk_mac, 
   wire        clk_eth, 
   wire        ecpri_valid_in        ,
   wire        ecpri_sink_ready      ,
   wire [63:0] ecpri_data_in  ,                                                                                        
   wire        ecpri_sop_in          ,                                                                                         
   wire        ecpri_eop_in          ,
   wire [2:0]  ecpri_empty_in  ,                                                                                       
   wire [2:0]  ecpri_channel_in,                                                                                       
   wire        ul_ecpri_valid        ,                                                              
   wire [63:0] ul_ecpri_data         ,                                                               
   wire        ul_ecpri_endofpacket  ,                                                        
   wire        ul_ecpri_startofpacket,                                                      
   wire [2:0]  ul_ecpri_empty        ,
   wire        ul_ecpri_ready, 
   wire        frame_status_counter_reset,                                               
   wire [31:0] sf_cnt_coupling ,                      
   wire [31:0] sf_cnt_coupling_pu ,                      
   wire        h2flw_bridge_waitrequest ,
   wire        h2flw_bridge_readdatavalid,
   wire [31:0] h2flw_bridge_readdata,
   wire        pb_h2flw_bridge_waitrequest,
   wire        pb_h2flw_bridge_readdatavalid, 
   wire [31:0] write_data ,                                                                              
   wire [31:0] write_address ,
   wire        write ,
   wire        read ,

   wire [31:0] top_mem_write_data,
   wire [16:0] top_mem_address,
   wire        top_mem_write,
   wire        top_mem_read,
   wire [31:0] pwr_mtr_h2f_bridge_s0_readdata,
   wire        pwr_mtr_h2f_bridge_s0_readdatavalid,

   wire [95:0] tod_cnt,
   wire        coupling_sink_startofpacket_l1,    
   wire [31:0] coupling_sink_data_l1     ,     
   wire        coupling_sink_valid_l1   ,      
   wire [15:0] coupling_sink_channel_l1   ,    
   wire        coupling_sink_endofpacket_l1   ,
   wire        coupling_sink_startofpacket_l2, 
   wire [31:0] coupling_sink_data_l2     ,     
   wire        coupling_sink_valid_l2   ,      
   wire [15:0] coupling_sink_channel_l2 ,      
   wire        coupling_sink_endofpacket_l2   ,
   wire        coupling_prach_sink_startofpacket_l1,    
   wire [31:0] coupling_prach_sink_data_l1     ,     
   wire        coupling_prach_sink_valid_l1   ,      
   wire [15:0] coupling_prach_sink_channel_l1   ,    
   wire        coupling_prach_sink_endofpacket_l1   ,
   wire        coupling_prach_sink_startofpacket_l2, 
   wire [31:0] coupling_prach_sink_data_l2     ,     
   wire        coupling_prach_sink_valid_l2   ,      
   wire [15:0] coupling_prach_sink_channel_l2 ,      
   wire        coupling_prach_sink_endofpacket_l2   ,
   wire        decimator_sink_sop,    
   wire [255:0]decimator_sink_data     ,     
   wire        decimator_sink_valid   ,      
   wire [15:0] decimator_sink_channel   ,    
   wire        decimator_sink_eop   ,
   wire        rst_eth_n,
   wire [7:0]  bw_cfg_cc1 ,
   wire [7:0]  bw_cfg_cc2

);

// VIF PINLIST 
   wire       clk_dly; 
 
   import uvm_pkg::*;
   import avsts_pkg::*;
   import avmm_pkg::*;
   import o_ru_config_pkg::*;
   import o_ru_test_pkg::*;
   import o_ru_scb_pkg::*;
   `include "uvm_macros.svh"
   
   logic [47:0] sec_cnt_t;
   logic [31:0] nsec_cnt_t;
   logic [15:0] frac_nsec_cnt_t ;
   logic [3:0] sym_num_14;
   logic [3:0] sym_cnt;

   logic [11:0] sym_num_tb;
   logic [7:0] sf_num_tb;
   logic [7:0] frame_num_tb;
   logic       clr_irq;

   real nsec_reg,sec_reg,nsec_insec,tod_insec,bound_sec,mod_2p56s,frame_time,sf_time;
 
   int intrlvr1_symbol_cnt,intrlvr2_symbol_cnt;
   int duc1_symbol_cnt,duc2_symbol_cnt;
   int mixer1_dl_symbol_cnt,mixer2_dl_symbol_cnt;
   int summer_symbol_cnt;
   int interpolator_symbol_cnt;
   int decimator_symbol_cnt;
   int mixer1_ul_symbol_cnt,mixer2_ul_symbol_cnt;
   int ddc1_symbol_cnt,ddc2_symbol_cnt;

   int intrlvr1_axc_cnt,intrlvr2_axc_cnt;
   int duc1_axc_cnt,duc2_axc_cnt;
   int mixer1_dl_axc_cnt,mixer2_dl_axc_cnt;
   int summer_axc_cnt;
   int interpolator_axc_cnt;
   int decimator_axc_cnt;
   int mixer1_ul_axc_cnt,mixer2_ul_axc_cnt; 
   int ddc1_axc_cnt,ddc2_axc_cnt;   

   int intrlvr1_sample_cnt,intrlvr2_sample_cnt;
   int duc1_sample_cnt,duc2_sample_cnt;
   int mixer1_dl_sample_cnt,mixer2_dl_sample_cnt;
   int summer_sample_cnt;
   int interpolator_sample_cnt;
   int decimator_sample_cnt;
   int mixer1_ul_sample_cnt,mixer2_ul_sample_cnt;
   int ddc1_sample_cnt,ddc2_sample_cnt;
   
   int intrlvr1_sample_limit,intrlvr2_sample_limit;
   int duc1_sample_limit,duc2_sample_limit;
   int mixer1_dl_sample_limit,mixer2_dl_sample_limit;
   int summer_sample_limit;
   int interpolator_sample_limit;
   int decimator_sample_limit;
   int mixer1_ul_sample_limit,mixer2_ul_sample_limit;
   int ddc1_sample_limit,ddc2_sample_limit;
   int sf_cnt ; 
   int sf_cnt_pu ;
   bit [7:0] bw_config_cc1 , bw_config_cc2 ;
   int roll_ovr_cnt ;
   int even_axc , odd_axc ; 
   bit source_ready ; 
   bit        coupling_sink_startofpacket_l1_d ;    
   bit [31:0] coupling_sink_data_l1_d     ;     
   bit        coupling_sink_valid_l1_d   ;     
   bit [15:0] coupling_sink_channel_l1_d   ;    
   bit        coupling_sink_endofpacket_l1_d   ;
   bit        coupling_sink_startofpacket_l2_d ; 
   bit [31:0] coupling_sink_data_l2_d     ;     
   bit        coupling_sink_valid_l2_d   ;      
   bit [15:0] coupling_sink_channel_l2_d ;      
   bit        coupling_sink_endofpacket_l2_d   ;

   int        err_cnt = 0;
   int        thresh_base_addr_ifft1, thresh_base_addr_ifft2, thresh_base_addr_fft1, thresh_base_addr_fft2;
   int        hist_base_addr_ifft1, hist_base_addr_ifft2, hist_base_addr_fft1, hist_base_addr_fft2;
   int        stat_base_addr_ifft1, stat_base_addr_ifft2, stat_base_addr_fft1, stat_base_addr_fft2;
   int        start_loop[4] = {0,0,0,0}, start_loop_stat[4] = {0,0,0,0};
   int        cnt[4] = {0,0,0,0}, cnt_stat[4] = {0,0,0,0};
   int        hist_read_data_arr_ifft[2][3584], hist_read_data_arr_fft[2][3584];
   int        stat_read_data_arr_ifft[2][512], stat_read_data_arr_fft[2][512];
   bit        mem_write      ;
   bit        mem_read       ;
   bit [16:0] mem_address    ;
   bit [31:0] mem_write_data ;
   int stat_cntr[4] = {0,0,0,0}; 

   event ifft1_event_done;
   event ifft2_event_done;
   event fft1_event_done;


   assign top_mem_write      = mem_write      ;
   assign top_mem_read       = mem_read       ;
   assign top_mem_address    = mem_address    ;
   assign top_mem_write_data = mem_write_data ;

   wire [31:0] mem_read_data = pwr_mtr_h2f_bridge_s0_readdata;
   wire mem_readdata_valid   = pwr_mtr_h2f_bridge_s0_readdatavalid;

   `include "o_ru_defines.sv"
   o_ru_config_pkg::o_ru_config m_config;
   o_ru_config_pkg::o_ru_ip_config m_ip_config;
   o_ru_scb_pkg::o_ru_cmp m_cmp ;
 
   localparam real p_clk_period_cnt [4] = {`MAC_CLK_PERIOD,`DSP_CLK_PERIOD,`ETH_CLK_PERIOD,`CSR_CLK_PERIOD};
   
   generate
     for(genvar n=0; n<4; n++) begin : inst_clk_if_gen
        o_ru_clk_if#(.TIME_PERIOD(p_clk_period_cnt[n]), .RESET_ACTIVE_LOW(1'b1)) inst_clk_if ();     // MAC CLK
     end
   endgenerate

// Assign clk incase of multiple clk instance generated
   assign clk_dly   = inst_clk_if_gen[0].inst_clk_if.clk;
   assign clk_mac   = inst_clk_if_gen[0].inst_clk_if.clk;
   assign clk_dsp   = inst_clk_if_gen[1].inst_clk_if.clk;
   assign clk_eth   = inst_clk_if_gen[2].inst_clk_if.clk;
   assign clk_csr   = inst_clk_if_gen[3].inst_clk_if.clk;
  
   assign rst_eth_n = inst_clk_if_gen[1].inst_clk_if.rst ;
 
   assign ul_ecpri_ready = source_ready ;
 
  //// Back Pressure /////
   initial begin
     source_ready <= 1'b1;
     forever begin
       source_ready <= 1;
       repeat(100)@(posedge clk_mac);
       source_ready <= 0  ;
       repeat ($urandom_range(5,3))@(posedge clk_mac);
       source_ready <= 1 ;
     end
   end



// Power meter Memory write and read

   `ifndef ECPRI_ORAN_SS
   
      // Threshold Memory Read and Write

      initial begin
   
         wait(rst_eth_n == 1);
      
         mem_write = 1'b0;
         mem_read  = 1'b0;
         mem_address  = 17'd0;
         mem_write_data = 32'd0;
         repeat(50) @(posedge clk_csr);
      
         for (int j = 0; j < 2; j=j+1) begin
            for (int i = 0; i < 33; i=i+1) begin 
               repeat(1) @(posedge clk_csr);
               mem_write = 1'b1;
               mem_read  = 1'b0;
   
               if (j == 0) begin // IFFT
                  thresh_base_addr_ifft1 = 32'h8000;
                  mem_address = thresh_base_addr_ifft1 + (i*4);
                  mem_write_data = m_config.o_ru_cfg.thresh_data[i];
   
                  `ifdef NUM_CC_TWO 
                     thresh_base_addr_ifft2 = 32'h9000;
                     mem_address = thresh_base_addr_ifft2 + (i*4);
                     mem_write_data = m_config.o_ru_cfg.thresh_data[i];
                  `endif 
               end else begin // FFT
                  thresh_base_addr_fft1 = 32'hA000;
                  mem_address = thresh_base_addr_fft1 + (i*4);
                  mem_write_data = m_config.o_ru_cfg.thresh_data[i];
   
                  `ifdef NUM_CC_TWO 
                     thresh_base_addr_fft2 = 32'hB000;
                     mem_address = thresh_base_addr_fft2 + (i*4);
                     mem_write_data = m_config.o_ru_cfg.thresh_data[i];
                  `endif 
   
               end
      
               repeat(1) @(posedge clk_csr);
               mem_write = 1'b0;
               repeat(1) @(posedge clk_csr);
               mem_read  = 1'b1;
               mem_write = 1'b0;
               repeat(1) @(posedge clk_csr);
               mem_read  = 1'b0;
               repeat(3) @(posedge clk_csr);
            end
         end
      end
   
   
      // Histogram Memory Read
   
      initial begin

         int hist_num_cc; 
         int stat_num_cc; 
         wait(rst_eth_n == 1);
   
         mem_address = 17'd0;
         mem_read    = 1'b0;
         repeat(100)@(posedge clk_csr) ;
   
         forever begin
   
            fork
 
              // IFFT loop
               begin 

                 fork

                    // IFFT Lineup1
                    begin
                       wait(top.phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_ifft_if_l1.u_power_meter_top_ss.u0_power_meter_ss.hist_done == 1);
                       repeat(10)@(posedge clk_csr) ;
                       m_config.o_ru_cfg.ifft_hist_done[0] = 1;
                       repeat(15)@(posedge clk_csr) ;
   
                       if (m_config.o_ru_cfg.data_status == 1) begin  /// Check Ping or Pong
                          start_loop[0] = 0;                          
                          start_loop_stat[0] = 0;                      
                          cnt[0] = 0 ;
                          cnt_stat[0] = 0 ;
                          stat_cntr[0] = 0;
                       end else begin
                          start_loop[0] = start_loop[0] + cnt[0] ;   /// Pong Memory Starts from Previous Address
                          start_loop_stat[0] = start_loop_stat[0] + cnt_stat[0] ;
                          cnt[0] = 0 ;
                          cnt_stat[0] = 0 ;
                          if (start_loop[0] == 4096) begin           /// 2048 Address for Ping and Pong
                             start_loop[0] = 0 ;
                          end
                          if (start_loop_stat[0] == 1024) begin      /// 512 Address for Ping and Pong
                             start_loop_stat[0] = 0 ;
                          end

                          if(m_config.o_ru_cfg.mode == 1) begin      
                            stat_cntr[0] = 0 ;
                          end else begin
                            stat_cntr[0] = stat_cntr[0] + 1;
                          end
                          if (stat_cntr[0] == 2) begin
                             stat_cntr[0] = 0;
                          end
                       end
   
                       for (int i = start_loop[0]; i < 2048 + start_loop[0]; i = i + 1) begin
                           hist_base_addr_ifft1 = 32'h0000;
                           mem_address = hist_base_addr_ifft1 + (i*4);
                           mem_read = 1'b1;
                           repeat(1)@(posedge clk_csr) ;
                           mem_read = 1'b0;
                           repeat(1)@(posedge clk_csr) ;
                           @(posedge pwr_mtr_h2f_bridge_s0_readdatavalid);
                           hist_read_data_arr_ifft[0][cnt[0]] = pwr_mtr_h2f_bridge_s0_readdata;
                           repeat(1)@(posedge clk_csr) ;
                           hist_num_cc = 1; 
   
                           cnt[0] = cnt[0] + 1 ;
                       end

                       for (int i = start_loop_stat[0]; i < 512 + start_loop_stat[0]; i = i + 1) begin
                           stat_base_addr_ifft1 = 32'h16000;
                           mem_address = stat_base_addr_ifft1 + (i*4);
                           mem_read = 1'b1;
                           repeat(1)@(posedge clk_csr) ;
                           mem_read = 1'b0;
                           repeat(1)@(posedge clk_csr) ;
                           @(posedge pwr_mtr_h2f_bridge_s0_readdatavalid);
                           stat_read_data_arr_ifft[0][cnt_stat[0]] = pwr_mtr_h2f_bridge_s0_readdata;
                           repeat(1)@(posedge clk_csr) ;
                           stat_num_cc = 1; 
   
                           cnt_stat[0] = cnt_stat[0] + 1 ;
                       end
                       hist_pwr_mtr_ifft_comparator(m_config, hist_read_data_arr_ifft, stat_read_data_arr_ifft, hist_num_cc);

                       ->ifft1_event_done;
                    end
            
                 // IFFT Lineup2 
                 `ifdef NUM_CC_TWO 
                    begin
                       wait(top.phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_ifft_if_l2.u_power_meter_top_ss.u0_power_meter_ss.hist_done == 1);
                       @(ifft1_event_done);
                       repeat(10)@(posedge clk_csr) ;
                       m_config.o_ru_cfg.ifft_hist_done[1] = 1;
                       repeat(15)@(posedge clk_csr) ;

                       if (m_config.o_ru_cfg.data_status == 1) begin
                          start_loop[1] = 0;
                          start_loop_stat[1] = 0;
                          cnt[1] = 0 ;
                          cnt_stat[1] = 0 ;
                          stat_cntr[1] = 0;
                       end else begin
                          start_loop[1] = start_loop[1] + cnt[1] ;
                          start_loop_stat[1] = start_loop_stat[1] + cnt_stat[1] ;
                          cnt[1] = 0 ;
                          cnt_stat[1] = 0 ;
                          if (start_loop[1] == 4096) begin
                             start_loop[1] = 0 ;
                          end
                          if (start_loop_stat[1] == 1024) begin
                             start_loop_stat[1] = 0 ;
                          end

                          if(m_config.o_ru_cfg.mode == 1) begin
                            stat_cntr[1] = 0 ;
                          end else begin
                            stat_cntr[1] = stat_cntr[1] + 1;
                          end

                          if (stat_cntr[1] == 2) begin
                             stat_cntr[1] = 0;
                          end
                       end
   
                       for (int i = start_loop[1]; i < 2048 + start_loop[1]; i = i + 1) begin
                           hist_base_addr_ifft2 = 32'h4000;
                           mem_address = hist_base_addr_ifft2 + (i*4);
                           mem_read = 1'b1;
                           repeat(1)@(posedge clk_csr) ;
                           mem_read = 1'b0;
                           repeat(1)@(posedge clk_csr) ;
                           @(posedge pwr_mtr_h2f_bridge_s0_readdatavalid);
                           hist_read_data_arr_ifft[1][cnt[1]] = pwr_mtr_h2f_bridge_s0_readdatavalid;
                           repeat(1)@(posedge clk_csr) ;
                           hist_num_cc = 2;
 
                           cnt[1] = cnt[1] + 1 ;
                       end

                       for (int i = start_loop_stat[1]; i < 512 + start_loop_stat[1]; i = i + 1) begin
                           stat_base_addr_ifft2 = 32'h17000;
                           mem_address = stat_base_addr_ifft2 + (i*4);
                           mem_read = 1'b1;
                           repeat(1)@(posedge clk_csr) ;
                           mem_read = 1'b0;
                           repeat(1)@(posedge clk_csr) ;
                           @(posedge pwr_mtr_h2f_bridge_s0_readdatavalid);
                           stat_read_data_arr_ifft[1][cnt_stat[1]] = pwr_mtr_h2f_bridge_s0_readdatavalid;
                           repeat(1)@(posedge clk_csr) ;
                           stat_num_cc = 2;
 
                           cnt_stat[1] = cnt_stat[1] + 1 ;
                       end
                       hist_pwr_mtr_ifft_comparator(m_config, hist_read_data_arr_ifft, stat_read_data_arr_ifft ,hist_num_cc);

                       ->ifft2_event_done;
                    end
                 `endif

                 join

               end


               // FFT
               begin

                  fork

                     //FFT Lineup1
                     begin 
                        wait(top.phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l1.u_power_meter_top_ss_ul.u0_power_meter_ss.hist_done == 1);

                        `ifdef NUM_CC_TWO
                           @(ifft2_event_done);
                        `else
                           @(ifft1_event_done);
                        `endif
                       
                        repeat(10)@(posedge clk_csr) ;
                        m_config.o_ru_cfg.fft_hist_done[0] = 1;
                        repeat(15)@(posedge clk_csr) ;
                                                                                                                                                                                  
                        if (m_config.o_ru_cfg.data_status == 1) begin
                           start_loop[2] = 0;
                           start_loop_stat[2] = 0;
                           cnt[2] = 0 ;
                           cnt_stat[2] = 0 ;
                           stat_cntr[2] = 0;
                        end else begin
                           start_loop[2] = start_loop[2] + cnt[2] ;
                           start_loop_stat[2] = start_loop_stat[2] + cnt_stat[2] ;
                           cnt[2] = 0 ;
                           cnt_stat[2] = 0 ;
                           if (start_loop[2] == 4096) begin
                              start_loop[2] = 0 ;
                           end
                           if (start_loop_stat[2] == 1024) begin
                              start_loop_stat[2] = 0 ;
                           end

                           if(m_config.o_ru_cfg.mode == 1) begin
                             stat_cntr[2] = 0 ;
                           end else begin
                             stat_cntr[2] = stat_cntr[2] + 1;
                           end

                           if (stat_cntr[2] == 2) begin
                              stat_cntr[2] = 0;
                           end
                        end
                                                                                                                                                                                  
                        for (int i = start_loop[2]; i < 2048 + start_loop[2]; i = i + 1) begin
                            hist_base_addr_fft1 = 32'hC000;
                            mem_address = hist_base_addr_fft1 + (i*4);
                            mem_read = 1'b1;
                            repeat(1)@(posedge clk_csr) ;
                            mem_read = 1'b0;
                            repeat(1)@(posedge clk_csr) ;
                            @(posedge pwr_mtr_h2f_bridge_s0_readdatavalid);
                            hist_read_data_arr_fft[0][cnt[2]] = pwr_mtr_h2f_bridge_s0_readdata;
                            repeat(1)@(posedge clk_csr) ;
                            hist_num_cc = 1; 
                                                                                                                                                                             
                            cnt[2] = cnt[2] + 1 ;
                        end

                        for (int i = start_loop_stat[2]; i < 512 + start_loop_stat[2]; i = i + 1) begin
                            stat_base_addr_fft1 = 32'h18000;
                            mem_address = stat_base_addr_fft1 + (i*4);
                            mem_read = 1'b1;
                            repeat(1)@(posedge clk_csr) ;
                            mem_read = 1'b0;
                            repeat(1)@(posedge clk_csr) ;
                            @(posedge pwr_mtr_h2f_bridge_s0_readdatavalid);
                            stat_read_data_arr_fft[0][cnt_stat[2]] = pwr_mtr_h2f_bridge_s0_readdata;
                            repeat(1)@(posedge clk_csr) ;
                            stat_num_cc = 1; 
                                                                                                                                                                             
                            cnt_stat[2] = cnt_stat[2] + 1 ;
                        end
                        hist_pwr_mtr_fft_comparator(m_config, hist_read_data_arr_fft, stat_read_data_arr_fft, hist_num_cc);

                        ->fft1_event_done;
                     end

                     // FFT Lineup2
                     `ifdef NUM_CC_TWO 
                        begin 
                           wait(top.phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l2.u_power_meter_top_ss_ul.u0_power_meter_ss.hist_done == 1);
                           @(fft1_event_done);
                           repeat(10)@(posedge clk_csr) ;
                           m_config.o_ru_cfg.fft_hist_done[1] = 1;
                           repeat(15)@(posedge clk_csr) ;
                                                                                                                                                                                     
                           if (m_config.o_ru_cfg.data_status == 1) begin
                              start_loop[3] = 0;
                              start_loop_stat[3] = 0;
                              cnt[3] = 0 ;
                              cnt_stat[3] = 0 ;
                              stat_cntr[3] = 0;
                           end else begin
                              start_loop[3] = start_loop[3] + cnt[3] ;
                              start_loop_stat[3] = start_loop_stat[3] + cnt_stat[3] ;
                              cnt[3] = 0 ;
                              cnt_stat[3] = 0 ;
                              if (start_loop[3] == 4096) begin
                                 start_loop[3] = 0 ;
                              end
                              if (start_loop_stat[3] == 1024) begin
                                 start_loop_stat[3] = 0 ;
                              end

                              if(m_config.o_ru_cfg.mode == 1) begin
                                stat_cntr[3] = 0 ;
                              end else begin
                                stat_cntr[3] = stat_cntr[3] + 1;
                              end

                              if (stat_cntr[3] == 2) begin
                                 stat_cntr[3] = 0;
                              end
                           end
                                                                                                                                                                                     
                           for (int i = start_loop[3]; i < 2048 + start_loop[3]; i = i + 1) begin
                               if (m_config.o_ru_cfg.cc2_dis == 0) begin
                                  hist_base_addr_fft2 = 32'h10000;
                                  mem_address = hist_base_addr_fft2 + (i*4);
                                  mem_read = 1'b1;
                                  repeat(1)@(posedge clk_csr) ;
                                  mem_read = 1'b0;
                                  repeat(1)@(posedge clk_csr) ;
                                  @(posedge pwr_mtr_h2f_bridge_s0_readdatavalid);
                                  hist_read_data_arr_fft[1][cnt[3]] = pwr_mtr_h2f_bridge_s0_readdatavalid;
                                  repeat(1)@(posedge clk_csr) ;
                                  hist_num_cc = 2; 
                               end
                                                                                                                                                                                
                               cnt[3] = cnt[3] + 1 ;
                           end

                           for (int i = start_loop_stat[3]; i < 512 + start_loop_stat[3]; i = i + 1) begin
                               if (m_config.o_ru_cfg.cc2_dis == 0) begin
                                  stat_base_addr_fft2 = 32'h19000;
                                  mem_address = stat_base_addr_fft2 + (i*4);
                                  mem_read = 1'b1;
                                  repeat(1)@(posedge clk_csr) ;
                                  mem_read = 1'b0;
                                  repeat(1)@(posedge clk_csr) ;
                                  @(posedge pwr_mtr_h2f_bridge_s0_readdatavalid);
                                  stat_read_data_arr_fft[1][cnt_stat[3]] = pwr_mtr_h2f_bridge_s0_readdatavalid;
                                  repeat(1)@(posedge clk_csr) ;
                                  stat_num_cc = 2; 
                               end
                                                                                                                                                                                
                               cnt_stat[3] = cnt_stat[3] + 1 ;
                           end
                           hist_pwr_mtr_fft_comparator(m_config, hist_read_data_arr_fft, stat_read_data_arr_fft, hist_num_cc);

                        end
                     `endif

                  join
               end

            join
 
         end
      end
   
   
   `endif


   task hist_pwr_mtr_ifft_comparator(input o_ru_config_pkg::o_ru_config m_config, input int hist_read_data_arr_ifft[2][3584], input int stat_read_data_arr_ifft[2][512] , input int hist_num_cc);

      int mismatch;
      int ref_count, obs_count;

      for (int cc_num = 0; cc_num < hist_num_cc; cc_num=cc_num+1) begin
        for (int axc = 0; axc < (`AXC_NUM/2); axc=axc+1) begin
           for (int sym = 0; sym < 14; sym=sym+1) begin
              for (int bin = 0; bin < 32; bin=bin+1) begin
                 ref_count = m_config.o_ru_cfg.histogram_dut_ref[cc_num][sym][axc][bin]; 
                 obs_count = hist_read_data_arr_ifft[cc_num][((sym + (axc * 14)) * 32) + bin];
                 if (ref_count == obs_count) begin
                    `uvm_info("VIF", $psprintf("IFFT %0d HIST MATCH at SYM=%0d AXC=%0d BIN=%0d : REF = %0d, DUT = %0d",hist_num_cc, sym, axc, bin, ref_count, obs_count), UVM_HIGH);
                 end else begin
                    `uvm_info("VIF", $psprintf("IFFT %0d HIST MISMATCH at SYM=%0d AXC=%0d BIN=%0d : REF = %0d, DUT = %0d",hist_num_cc, sym, axc, bin, ref_count, obs_count), UVM_LOW);
                    mismatch = mismatch+1;
                 end
              end
           end
        end
      end

      if (mismatch == 0) begin
	 `uvm_info("VIF", $psprintf("IFFT %0d HIST COMPARISON PASSED",hist_num_cc), UVM_LOW);
      end else begin
	 `uvm_error("VIF", $sformatf("IFFT %0d HIST COMPARISON FAILED MISMATCHES = %0d",hist_num_cc,mismatch));
         err_cnt += mismatch;
      end

      foreach (m_config.o_ru_cfg.histogram_dut_ref[i]) begin
         foreach (m_config.o_ru_cfg.histogram_dut_ref[i][j]) begin
            foreach (m_config.o_ru_cfg.histogram_dut_ref[i][j][k]) begin
               foreach (m_config.o_ru_cfg.histogram_dut_ref[i][j][k][l]) begin
                  m_config.o_ru_cfg.histogram_dut_ref[i][j][k][l] = 0;
               end
            end
         end
      end

      stat_pwr_mtr_ifft_comparator(m_config, stat_read_data_arr_ifft, hist_num_cc);
   endtask


   task hist_pwr_mtr_fft_comparator(input o_ru_config_pkg::o_ru_config m_config, input int hist_read_data_arr_fft[2][3584], input int stat_read_data_arr_ifft[2][512], input int hist_num_cc);

      int mismatch;
      int ref_count, obs_count;

      for (int cc_num = 0; cc_num < hist_num_cc; cc_num=cc_num+1) begin
         for (int axc = 0; axc < (`AXC_NUM/2); axc=axc+1) begin
            for (int sym = 0; sym < 14; sym=sym+1) begin
               for (int bin = 0; bin < 32; bin=bin+1) begin
                  ref_count = m_config.o_ru_cfg.histogram_fft_dut_ref[cc_num][sym][axc][bin];
                  obs_count = hist_read_data_arr_fft[cc_num][((sym + (axc * 14)) * 32) + bin];
                  if (ref_count == obs_count) begin
                     `uvm_info("VIF", $psprintf("FFT %0d HIST MATCH at SYM=%0d AXC=%0d BIN=%0d : REF = %0d, DUT = %0d",hist_num_cc, sym, axc, bin, ref_count, obs_count), UVM_HIGH);
                  end else begin
                     `uvm_info("VIF", $psprintf("FFT %0d HIST MISMATCH at SYM=%0d AXC=%0d BIN=%0d : REF = %0d, DUT = %0d",hist_num_cc, sym, axc, bin, ref_count, obs_count), UVM_LOW);
                     mismatch = mismatch+1;
                  end
               end
            end
         end
      end

      if (mismatch == 0) begin
	 `uvm_info("VIF", $psprintf("FFT %0d HIST COMPARISON PASSED",hist_num_cc), UVM_LOW);
      end else begin
	 `uvm_error("VIF", $sformatf("FFT %0d HIST COMPARISON FAILED MISMATCHES = %0d",hist_num_cc,mismatch));
         err_cnt += mismatch;
      end

      foreach (m_config.o_ru_cfg.histogram_fft_dut_ref[i]) begin
         foreach (m_config.o_ru_cfg.histogram_fft_dut_ref[i][j]) begin
            foreach (m_config.o_ru_cfg.histogram_fft_dut_ref[i][j][k]) begin
               foreach (m_config.o_ru_cfg.histogram_fft_dut_ref[i][j][k][l]) begin
                  m_config.o_ru_cfg.histogram_fft_dut_ref[i][j][k][l] = 0;
               end
            end
         end
      end
      stat_pwr_mtr_fft_comparator(m_config, stat_read_data_arr_fft, hist_num_cc);
   endtask


   task stat_pwr_mtr_ifft_comparator(input o_ru_config_pkg::o_ru_config m_config, input int stat_read_data_arr_ifft[2][512], input int stat_num_cc);

      int mismatch;
      int ref_count, obs_count;
      int diff_val, max_diff_val;
      shortint ref_data[] , obs_data[] ;
      int length;
      real nmse_db ;
      shortint statistic_ifft_ref_min[14][`AXC_NUM][1];
      shortint statistic_ifft_ref_max[14][`AXC_NUM][1];
      shortint statistic_ifft_ref_sum[14][`AXC_NUM][2];
      shortint statistic_ifft_ref_peak[14][`AXC_NUM][1];
      shortint statistic_ifft_obs_min[14][`AXC_NUM][1];
      shortint statistic_ifft_obs_max[14][`AXC_NUM][1];
      shortint statistic_ifft_obs_sum[14][`AXC_NUM][2];
      shortint statistic_ifft_obs_peak[14][`AXC_NUM][1];
 
      for (int cc_num = 0; cc_num < stat_num_cc; cc_num=cc_num+1) begin
        for (int axc = 0; axc < (`AXC_NUM/2); axc=axc+1) begin
           for (int sym = 0; sym < 14; sym=sym+1) begin

              statistic_ifft_ref_min[sym][axc][0]  = shortint'(m_config.o_ru_cfg.statistic_ifft_dut_ref[cc_num][stat_cntr[(stat_num_cc -1)]][sym][axc][0]) ;
              statistic_ifft_ref_max[sym][axc][0]  = shortint'(m_config.o_ru_cfg.statistic_ifft_dut_ref[cc_num][stat_cntr[(stat_num_cc -1)]][sym][axc][1]) ;
              statistic_ifft_ref_sum[sym][axc][0]  = shortint'(m_config.o_ru_cfg.statistic_ifft_dut_ref[cc_num][stat_cntr[(stat_num_cc -1)]][sym][axc][2]) ;
              statistic_ifft_ref_sum[sym][axc][1]  = shortint'(m_config.o_ru_cfg.statistic_ifft_dut_ref[cc_num][stat_cntr[(stat_num_cc -1)]][sym][axc][3]) ;
              statistic_ifft_ref_peak[sym][axc][0] = shortint'(m_config.o_ru_cfg.statistic_ifft_dut_ref[cc_num][stat_cntr[(stat_num_cc -1)]][sym][axc][6]) ;
              statistic_ifft_obs_min[sym][axc][0]  = shortint'(stat_read_data_arr_ifft[cc_num][(((sym + (axc * 14)) * 8) + 0)]) ;
              statistic_ifft_obs_max[sym][axc][0]  = shortint'(stat_read_data_arr_ifft[cc_num][(((sym + (axc * 14)) * 8) + 1)]) ;
              statistic_ifft_obs_sum[sym][axc][0]  = shortint'(stat_read_data_arr_ifft[cc_num][(((sym + (axc * 14)) * 8) + 2)]) ;
              statistic_ifft_obs_sum[sym][axc][1]  = shortint'(stat_read_data_arr_ifft[cc_num][(((sym + (axc * 14)) * 8) + 3)]) ;
              statistic_ifft_obs_peak[sym][axc][0] = shortint'(stat_read_data_arr_ifft[cc_num][(((sym + (axc * 14)) * 8) + 6)]) ;

              for (int bin = 0; bin < 8; bin=bin+1) begin
                 ref_count = m_config.o_ru_cfg.statistic_ifft_dut_ref[cc_num][stat_cntr[(stat_num_cc -1)]][sym][axc][bin]; 
                 obs_count = stat_read_data_arr_ifft[cc_num][((sym + (axc * 14)) * 8) + bin];

                 if(ref_count > obs_count)begin
                     diff_val = ref_count - obs_count;
                 end else begin
                     diff_val = obs_count - ref_count;
                 end

                 if (diff_val <= 20) begin
                    `uvm_info("VIF", $psprintf("IFFT %0d STAT MATCH at SYM=%0d AXC=%0d BIN=%0d : REF = %0d, DUT = %0d",stat_num_cc, sym, axc, bin, ref_count, obs_count), UVM_HIGH);
                 end else begin
                    `uvm_info("VIF", $psprintf("IFFT %0d STAT MISMATCH at SYM=%0d AXC=%0d BIN=%0d : REF = %0d, DUT = %0d",stat_num_cc, sym, axc, bin, ref_count, obs_count), UVM_LOW);
                    mismatch = mismatch+1;
                 end

                 if(diff_val > max_diff_val) max_diff_val = diff_val ;
                 else max_diff_val = max_diff_val ;
              end
           end
        end
      end

      if (mismatch == 0) begin
	 `uvm_info("VIF", $psprintf("IFFT %0d STAT COMPARISON PASSED MAX DIFF VALUE : %0d",stat_num_cc,max_diff_val), UVM_LOW);
      end else begin
	 `uvm_error("VIF", $sformatf("IFFT %0d STAT COMPARISON FAILED MISMATCHES = %0d MAX DIFF VALUE : %0d",stat_num_cc,mismatch,max_diff_val));
         err_cnt += mismatch;
      end

      ref_data = {>>{statistic_ifft_ref_min}} ;
      obs_data = {>>{statistic_ifft_obs_min}} ;
      length   = ref_data.size ;
      nmse_db = m_cmp.CalcNMSE(length, ref_data, obs_data);
      `uvm_info("NMSE IFFT STAT", $sformatf("MIN NMSE (dB): %0f Length %0d",nmse_db,length), UVM_LOW);
      ref_data = new[length] ;
      obs_data = new[length] ;

      ref_data = {>>{statistic_ifft_ref_max}} ;
      obs_data = {>>{statistic_ifft_obs_max}} ;
      length   = ref_data.size ;
      nmse_db = m_cmp.CalcNMSE(length, ref_data, obs_data);
      `uvm_info("NMSE IFFT STAT", $sformatf("MAX NMSE (dB): %0f Length %0d",nmse_db,length), UVM_LOW);
      ref_data = new[length] ;
      obs_data = new[length] ;

      ref_data = {>>{statistic_ifft_ref_sum}} ;
      obs_data = {>>{statistic_ifft_obs_sum}} ;
      length   = ref_data.size ;
      nmse_db = m_cmp.CalcNMSE(length, ref_data, obs_data);
      `uvm_info("NMSE IFFT STAT", $sformatf("SUM NMSE (dB): %0f Length %0d",nmse_db,length), UVM_LOW);
      ref_data = new[length] ;
      obs_data = new[length] ;

      ref_data = {>>{statistic_ifft_ref_peak}} ;
      obs_data = {>>{statistic_ifft_obs_peak}} ;
      length   = ref_data.size ;
      nmse_db = m_cmp.CalcNMSE(length, ref_data, obs_data);
      `uvm_info("NMSE IFFT STAT", $sformatf("PEAK POWER NMSE (dB): %0f Length %0d",nmse_db,length), UVM_LOW);
      ref_data = new[length] ;
      obs_data = new[length] ;


   endtask


   task stat_pwr_mtr_fft_comparator(input o_ru_config_pkg::o_ru_config m_config, input int stat_read_data_arr_fft[2][512], input int stat_num_cc);

      int mismatch;
      int ref_count, obs_count;
      int diff_val, max_diff_val;
      shortint ref_data[] , obs_data[] ;
      int length;
      real nmse_db ; 
      shortint statistic_fft_ref_min[14][`AXC_NUM][1];
      shortint statistic_fft_ref_max[14][`AXC_NUM][1];
      shortint statistic_fft_ref_sum[14][`AXC_NUM][2];
      shortint statistic_fft_ref_peak[14][`AXC_NUM][1];
      shortint statistic_fft_obs_min[14][`AXC_NUM][1];
      shortint statistic_fft_obs_max[14][`AXC_NUM][1];
      shortint statistic_fft_obs_sum[14][`AXC_NUM][2];
      shortint statistic_fft_obs_peak[14][`AXC_NUM][1];

      for (int cc_num = 0; cc_num < stat_num_cc; cc_num=cc_num+1) begin
         for (int axc = 0; axc < (`AXC_NUM/2); axc=axc+1) begin
            for (int sym = 0; sym < 14; sym=sym+1) begin

               statistic_fft_ref_min[sym][axc][0]  = shortint'(m_config.o_ru_cfg.statistic_fft_dut_ref[cc_num][stat_cntr[(stat_num_cc -1)]][sym][axc][0]) ;
               statistic_fft_ref_max[sym][axc][0]  = shortint'(m_config.o_ru_cfg.statistic_fft_dut_ref[cc_num][stat_cntr[(stat_num_cc -1)]][sym][axc][1]) ;
               statistic_fft_ref_sum[sym][axc][0]  = shortint'(m_config.o_ru_cfg.statistic_fft_dut_ref[cc_num][stat_cntr[(stat_num_cc -1)]][sym][axc][2]) ;
               statistic_fft_ref_sum[sym][axc][1]  = shortint'(m_config.o_ru_cfg.statistic_fft_dut_ref[cc_num][stat_cntr[(stat_num_cc -1)]][sym][axc][3]) ;
               statistic_fft_ref_peak[sym][axc][0] = shortint'(m_config.o_ru_cfg.statistic_fft_dut_ref[cc_num][stat_cntr[(stat_num_cc -1)]][sym][axc][6]) ;
               statistic_fft_obs_min[sym][axc][0]  = shortint'(stat_read_data_arr_fft[cc_num][(((sym + (axc * 14)) * 8) + 0)]) ;
               statistic_fft_obs_max[sym][axc][0]  = shortint'(stat_read_data_arr_fft[cc_num][(((sym + (axc * 14)) * 8) + 1)]) ;
               statistic_fft_obs_sum[sym][axc][0]  = shortint'(stat_read_data_arr_fft[cc_num][(((sym + (axc * 14)) * 8) + 2)]) ;
               statistic_fft_obs_sum[sym][axc][1]  = shortint'(stat_read_data_arr_fft[cc_num][(((sym + (axc * 14)) * 8) + 3)]) ;
               statistic_fft_obs_peak[sym][axc][0] = shortint'(stat_read_data_arr_fft[cc_num][(((sym + (axc * 14)) * 8) + 6)]) ;

               for (int bin = 0; bin < 8; bin=bin+1) begin
                  ref_count = m_config.o_ru_cfg.statistic_fft_dut_ref[cc_num][stat_cntr[(stat_num_cc + 1)]][sym][axc][bin];
                  obs_count = stat_read_data_arr_fft[cc_num][((sym + (axc * 14)) * 8) + bin];

                  if(ref_count > obs_count)begin
                      diff_val = ref_count - obs_count;
                  end else begin
                      diff_val = obs_count - ref_count;
                  end

                  if (diff_val <= 20) begin
                     `uvm_info("VIF", $psprintf("FFT %0d STAT MATCH at SYM=%0d AXC=%0d BIN=%0d : REF = %0d, DUT = %0d",stat_num_cc, sym, axc, bin, ref_count, obs_count), UVM_HIGH);
                  end else begin
                     `uvm_info("VIF", $psprintf("FFT %0d STAT MISMATCH at SYM=%0d AXC=%0d BIN=%0d : REF = %0d, DUT = %0d",stat_num_cc, sym, axc, bin, ref_count, obs_count), UVM_LOW);
                     mismatch = mismatch+1;
                  end
                  
                  if(diff_val > max_diff_val) max_diff_val = diff_val ;
                  else max_diff_val = max_diff_val ;

               end
            end
         end
      end

      if (mismatch == 0) begin
	 `uvm_info("VIF", $psprintf("FFT %0d STAT COMPARISON PASSED MAX DIFF VALUE : %0d",stat_num_cc,max_diff_val), UVM_LOW);
      end else begin
	 `uvm_error("VIF", $sformatf("FFT %0d STAT COMPARISON FAILED MISMATCHES = %0d MAX DIFF VALUE : %0d",stat_num_cc,mismatch,max_diff_val));
         err_cnt += mismatch;
      end

      ref_data = {>>{statistic_fft_ref_min}} ;
      obs_data = {>>{statistic_fft_obs_min}} ;
      length   = ref_data.size ;
      nmse_db = m_cmp.CalcNMSE(length, ref_data, obs_data);
      `uvm_info("NMSE FFT STAT", $sformatf("MIN NMSE (dB): %0f Length %0d",nmse_db,length), UVM_LOW);
      ref_data = new[length] ;
      obs_data = new[length] ;

      ref_data = {>>{statistic_fft_ref_max}} ;
      obs_data = {>>{statistic_fft_obs_max}} ;
      length   = ref_data.size ;
      nmse_db = m_cmp.CalcNMSE(length, ref_data, obs_data);
      `uvm_info("NMSE FFT STAT", $sformatf("MAX NMSE (dB): %0f Length %0d",nmse_db,length), UVM_LOW);
      ref_data = new[length] ;
      obs_data = new[length] ;

      ref_data = {>>{statistic_fft_ref_sum}} ;
      obs_data = {>>{statistic_fft_obs_sum}} ;
      length   = ref_data.size ;
      nmse_db = m_cmp.CalcNMSE(length, ref_data, obs_data);
      `uvm_info("NMSE FFT STAT", $sformatf("SUM NMSE (dB): %0f Length %0d",nmse_db,length), UVM_LOW);
      ref_data = new[length] ;
      obs_data = new[length] ;

      ref_data = {>>{statistic_fft_ref_peak}} ;
      obs_data = {>>{statistic_fft_obs_peak}} ;
      length   = ref_data.size ;
      nmse_db = m_cmp.CalcNMSE(length, ref_data, obs_data);
      `uvm_info("NMSE FFT STAT", $sformatf("PEAK POWER NMSE (dB): %0f Length %0d",nmse_db,length), UVM_LOW);
      ref_data = new[length] ;
      obs_data = new[length] ;

   endtask





// Counter increment for Window

always @ (posedge clk_eth) begin
    if (~rst_eth_n) begin
     m_config.o_ru_cfg.frac_nsec_cnt  = 16'd0;
     m_config.o_ru_cfg.nsec_cnt       = 32'd359720000;        
     m_config.o_ru_cfg.sec_cnt        = 48'd15;         
    end else begin
     wait(rst_eth_n==1);
     roll_ovr_cnt = m_config.o_ru_cfg.frac_nsec_cnt + 36700 ;
     if ((roll_ovr_cnt) > 65536) begin
        m_config.o_ru_cfg.nsec_cnt = m_config.o_ru_cfg.nsec_cnt + 3;
     end else begin
        m_config.o_ru_cfg.nsec_cnt = m_config.o_ru_cfg.nsec_cnt + 2;
     end
     if(m_config.o_ru_cfg.nsec_cnt > 999999999) begin
       m_config.o_ru_cfg.nsec_cnt = 0 ;
       m_config.o_ru_cfg.sec_cnt  = m_config.o_ru_cfg.sec_cnt + 1 ;
     end
     m_config.o_ru_cfg.frac_nsec_cnt = m_config.o_ru_cfg.frac_nsec_cnt + 36700;
     sec_cnt_t       = m_config.o_ru_cfg.sec_cnt;
     nsec_cnt_t      = m_config.o_ru_cfg.nsec_cnt;
     frac_nsec_cnt_t = m_config.o_ru_cfg.frac_nsec_cnt;
    end
 end


assign nsec_reg = nsec_cnt_t;
assign sec_reg = sec_cnt_t;
assign nsec_insec = nsec_reg/1000000000;
assign tod_insec = sec_reg + nsec_insec;

assign bound_sec = 2.56;
assign sym_cnt = 14;
assign mod_2p56s = tod_insec - bound_sec * $floor(tod_insec/bound_sec);
assign frame_time = mod_2p56s * 100;
assign frame_num_tb = $floor(frame_time);

assign sf_time = (frame_time - frame_num_tb)*10;
assign sf_num_tb = $floor(sf_time);

assign sym_num_tb = (sf_time - sf_num_tb)*1000;
assign sym_num_14 = sym_num_tb - sym_cnt * $floor(sym_num_tb/sym_cnt);
 
   assign write         = inst_avstmm_if.pwrite ;
   assign write_data    = inst_avstmm_if.pwdata ;
   assign write_address = inst_avstmm_if.paddr  ;
   assign read          = inst_avstmm_if.pread  ;
   assign inst_avstmm_if.pwait_request  = h2flw_bridge_waitrequest    ;
   assign inst_avstmm_if.prdata_valid   = h2flw_bridge_readdatavalid  ;
   assign inst_avstmm_if.prdata         = h2flw_bridge_readdata ;

   avsts_if #(.DATA_WIDTH(64), 
                .DRIVER (1) 
   ) inst_avsts_drv_ecpri_dl_if (.clk(inst_clk_if_gen[0].inst_clk_if.clk), .rst_n(inst_clk_if_gen[0].inst_clk_if.rst));          //// eCPRI Injection
   
   avsts_if #(.DATA_WIDTH(32), 
                .DRIVER (1), 
               .SOP_EOP_DIS (0)
   ) inst_avsts_drv_coupling_pusch1_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));   //// Link 1 Coupling Injection
   
   avsts_if #(.DATA_WIDTH(32), 
                .DRIVER (1), 
               .SOP_EOP_DIS (0)
   ) inst_avsts_drv_coupling_pusch2_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));   //// Link 2 Coupling Injection

   avsts_if #(.DATA_WIDTH(32), 
                .DRIVER (1), 
               .SOP_EOP_DIS (0)
   ) inst_avsts_drv_coupling_prach1_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));   //// Link 1 Coupling PRACH Injection
   
   avsts_if #(.DATA_WIDTH(32), 
                .DRIVER (1), 
               .SOP_EOP_DIS (0)
   ) inst_avsts_drv_coupling_prach2_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));   //// Link 2 Coupling PRACH Injection

   avsts_if #(.DATA_WIDTH(256),
                .DRIVER (1),
               .SOP_EOP_DIS (0)
   ) inst_avsts_drv_decimator_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));         //// Decimator Injection

   avsts_if #(.DATA_WIDTH(64), 
               .DRIVER    (0)
       ) inst_avsts_mon_ecpri_dl_if (.clk(inst_clk_if_gen[2].inst_clk_if.clk), .rst_n(inst_clk_if_gen[2].inst_clk_if.rst));      //// eCPRI Demapper Monitor 
   
   avsts_if #(.DATA_WIDTH(128), 
               .DRIVER    (0)
       ) inst_avsts_mon_oran_dl_if (.clk(inst_clk_if_gen[2].inst_clk_if.clk), .rst_n(inst_clk_if_gen[2].inst_clk_if.rst));       //// oRAN Demapper Monitor

   avsts_if #(.DATA_WIDTH(32), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_fdv1_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));          //// FDV Demapper Link 1 Monitor

   avsts_if #(.DATA_WIDTH(64), 
               .DRIVER    (0),
               .SOP_EOP_DIS (0)
       ) inst_avsts_mon_oran_ul_if (.clk(inst_clk_if_gen[2].inst_clk_if.clk), .rst_n(inst_clk_if_gen[2].inst_clk_if.rst));       //// oRAN Mapper Monitor

   avsts_if #(.DATA_WIDTH(64), 
               .DRIVER    (0),
               .SOP_EOP_DIS (0)
       ) inst_avsts_mon_ecpri_ul_if (.clk(inst_clk_if_gen[0].inst_clk_if.clk), .rst_n(inst_clk_if_gen[0].inst_clk_if.rst));      //// eCPRI Mapper Monitor

   avsts_if #(.DATA_WIDTH(128), 
               .DRIVER    (0),
               .SOP_EOP_DIS (0)
       ) inst_avsts_mon_coupling_if (.clk(inst_clk_if_gen[2].inst_clk_if.clk), .rst_n(inst_clk_if_gen[2].inst_clk_if.rst));      //// CU_Coupling Monitor

   avsts_if #(.DATA_WIDTH(32), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_fdv2_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));          //// FDV Demapper Link 2 Monitor

   avsts_if #(.DATA_WIDTH(32), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_ifft1_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));         //// IFFT Lineup 1 Monitor

   avsts_if #(.DATA_WIDTH(32), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_ifft2_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));         //// IFFT Lineup 2 Monitor

   avsts_if #(.DATA_WIDTH(32), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_intrlvr1_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));      //// INTLVR Lineup 1 Monitor

   avsts_if #(.DATA_WIDTH(32), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_intrlvr2_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));      //// INTLVR Lineup 2 Monitor

   avsts_if #(.DATA_WIDTH(128), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_duc1_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));          //// DUC Lineup 1 Monitor

   avsts_if #(.DATA_WIDTH(128), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_duc2_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));          //// DUC Lineup 2 Monitor

   avsts_if #(.DATA_WIDTH(128), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_mixer_dl1_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));     //// MIXER DL Lineup 1 Monitor

   avsts_if #(.DATA_WIDTH(128), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_mixer_dl2_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));     //// MIXER DL Lineup 2 Monitor

   avsts_if #(.DATA_WIDTH(128), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_summer_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));        //// SUMMER Monitor

   avsts_if #(.DATA_WIDTH(256), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_interpolator_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));  //// INTERPOLATOR Monitor

   avsts_if #(.DATA_WIDTH(128), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_decimator_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));     //// DECIMATOR Monitor

   avsts_if #(.DATA_WIDTH(128), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_mixer_ul1_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));     //// MIXER UL LINEUP 1 Monitor

   avsts_if #(.DATA_WIDTH(128), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_mixer_ul2_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));     //// MIXER UL LINEUP 2 Monitor

   avsts_if #(.DATA_WIDTH(32), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_ddc1_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));          //// DDC LINEUP 1 Monitor

   avsts_if #(.DATA_WIDTH(32), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_ddc2_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));          //// DDC LINEUP 2 Monitor

   avsts_if #(.DATA_WIDTH(32), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_deintrlvr1_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));    //// DEINTLVR LINEUP 1 Monitor

   avsts_if #(.DATA_WIDTH(32), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_deintrlvr2_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));    //// DEINTLVR LINEUP 2 Monitor

   avsts_if #(.DATA_WIDTH(32), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_fft1_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));          //// FFT LINEUP 1 Monitor

   avsts_if #(.DATA_WIDTH(32), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_fft2_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));          //// FFT LINEUP 2 Monitor

   avsts_if #(.DATA_WIDTH(32), 
               .DRIVER    (0),
               .SOP_EOP_DIS (1)
       ) inst_avsts_mon_prach1_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));        //// PRACH LINEUP 1 Monitor

       avsts_if #(.DATA_WIDTH(32), 
               .DRIVER    (0),
    	          .SOP_EOP_DIS (1)
       ) inst_avsts_mon_prach2_if (.clk(inst_clk_if_gen[1].inst_clk_if.clk), .rst_n(inst_clk_if_gen[1].inst_clk_if.rst));        //// PRACH LINEUP 2 Monitor
       
      avsts_if #(.DATA_WIDTH(128), 
              .DRIVER    (0)
       ) inst_avsts_mon_coupling_prach_if (.clk(inst_clk_if_gen[2].inst_clk_if.clk), .rst_n(inst_clk_if_gen[2].inst_clk_if.rst)); //// COUPLING PRACH Monitor

   avsts_if #(.DATA_WIDTH(64), 
               .DRIVER    (0),
               .SOP_EOP_DIS (0)
       ) inst_avsts_mon_oran_prach_if (.clk(inst_clk_if_gen[2].inst_clk_if.clk), .rst_n(inst_clk_if_gen[2].inst_clk_if.rst));    //// oRAN PRACH Mapper Monitor

   avsts_if #(.DATA_WIDTH(64), 
               .DRIVER    (0),
               .SOP_EOP_DIS (0)
       ) inst_avsts_mon_ecpri_prach_if (.clk(inst_clk_if_gen[0].inst_clk_if.clk), .rst_n(inst_clk_if_gen[0].inst_clk_if.rst));   //// eCPRI PRACH Mapper Monitor

   avmm_if inst_avstmm_if  (.clk(inst_clk_if_gen[3].inst_clk_if.clk), .rst_n(inst_clk_if_gen[3].inst_clk_if.rst));


    assign ecpri_valid_in  = inst_avsts_drv_ecpri_dl_if.avsts_tx_valid  ;
    assign ecpri_data_in   = inst_avsts_drv_ecpri_dl_if.avsts_tx_data   ;
    assign ecpri_eop_in    = inst_avsts_drv_ecpri_dl_if.avsts_tx_eop    ;
    assign ecpri_sop_in    = inst_avsts_drv_ecpri_dl_if.avsts_tx_sop    ;
    assign ecpri_empty_in  = inst_avsts_drv_ecpri_dl_if.avsts_tx_empty  ;
    assign inst_avsts_drv_ecpri_dl_if.avsts_tx_ready = 1 ;
    assign inst_avsts_drv_coupling_pusch1_if.avsts_tx_ready = 1 ;
    assign inst_avsts_drv_coupling_pusch2_if.avsts_tx_ready = 1 ;
    assign inst_avsts_drv_coupling_prach1_if.avsts_tx_ready = 1 ;
    assign inst_avsts_drv_coupling_prach2_if.avsts_tx_ready = 1 ;
    assign inst_avsts_drv_decimator_if.avsts_tx_ready       = 1 ;
  
    ///// In case of UL Injection
    assign coupling_sink_startofpacket_l1 = coupling_sink_startofpacket_l1_d ;
    assign coupling_sink_data_l1          = coupling_sink_data_l1_d          ;
    assign coupling_sink_valid_l1         = coupling_sink_valid_l1_d         ;
    assign coupling_sink_channel_l1       = coupling_sink_channel_l1_d       ;
    assign coupling_sink_endofpacket_l1   = coupling_sink_endofpacket_l1_d   ;
    assign coupling_sink_startofpacket_l2 = coupling_sink_startofpacket_l2_d ;
    assign coupling_sink_data_l2          = coupling_sink_data_l2_d          ;
    assign coupling_sink_valid_l2         = coupling_sink_valid_l2_d         ;
    assign coupling_sink_channel_l2       = coupling_sink_channel_l2_d       ;
    assign coupling_sink_endofpacket_l2   = coupling_sink_endofpacket_l2_d   ;

    assign coupling_prach_sink_startofpacket_l1 = inst_avsts_drv_coupling_prach1_if.avsts_tx_sop    ;
    assign coupling_prach_sink_data_l1          = inst_avsts_drv_coupling_prach1_if.avsts_tx_data   ;
    assign coupling_prach_sink_valid_l1         = inst_avsts_drv_coupling_prach1_if.avsts_tx_valid  ;
    assign coupling_prach_sink_channel_l1       = inst_avsts_drv_coupling_prach1_if.avsts_tx_channel;
    assign coupling_prach_sink_endofpacket_l1   = inst_avsts_drv_coupling_prach1_if.avsts_tx_eop    ;
    assign coupling_prach_sink_startofpacket_l2 = inst_avsts_drv_coupling_prach2_if.avsts_tx_sop    ;
    assign coupling_prach_sink_data_l2          = inst_avsts_drv_coupling_prach2_if.avsts_tx_data   ;
    assign coupling_prach_sink_valid_l2         = inst_avsts_drv_coupling_prach2_if.avsts_tx_valid  ;
    assign coupling_prach_sink_channel_l2       = inst_avsts_drv_coupling_prach2_if.avsts_tx_channel;
    assign coupling_prach_sink_endofpacket_l2   = inst_avsts_drv_coupling_prach2_if.avsts_tx_eop    ;

    assign decimator_sink_sop       = inst_avsts_drv_decimator_if.avsts_tx_sop    ;
    assign decimator_sink_data      = inst_avsts_drv_decimator_if.avsts_tx_data   ;
    assign decimator_sink_valid     = inst_avsts_drv_decimator_if.avsts_tx_valid  ;
    assign decimator_sink_channel   = inst_avsts_drv_decimator_if.avsts_tx_channel;
    assign decimator_sink_eop       = inst_avsts_drv_decimator_if.avsts_tx_eop    ;

    ////// Initializing Interfaces and Environment   //////////////
    initial begin
      string inst_name;
      $sformat(inst_name,"*m_env.m_avsts_drv0_data_env*");
      uvm_config_db #(virtual avsts_if#(64,1))::set(null,inst_name,"avsts_if",inst_avsts_drv_ecpri_dl_if);
      $sformat(inst_name,"*m_env.m_avsts_drv1_data_env*");
      uvm_config_db #(virtual avsts_if#(32,1,0))::set(null,inst_name,"avsts_if",inst_avsts_drv_coupling_pusch1_if);
      $sformat(inst_name,"*m_env.m_avsts_drv2_data_env*");
      uvm_config_db #(virtual avsts_if#(32,1,0))::set(null,inst_name,"avsts_if",inst_avsts_drv_coupling_pusch2_if);
      $sformat(inst_name,"*m_env.m_avsts_drv3_data_env*");
      uvm_config_db #(virtual avsts_if#(32,1,0))::set(null,inst_name,"avsts_if",inst_avsts_drv_coupling_prach1_if);
      $sformat(inst_name,"*m_env.m_avsts_drv4_data_env*");
      uvm_config_db #(virtual avsts_if#(32,1,0))::set(null,inst_name,"avsts_if",inst_avsts_drv_coupling_prach2_if);
      $sformat(inst_name,"*m_env.m_avsts_drv5_data_env*");
      uvm_config_db #(virtual avsts_if#(256,1,0))::set(null,inst_name,"avsts_if",inst_avsts_drv_decimator_if);


      $sformat(inst_name,"*m_env.m_avsts_mon0_data_env*");
      uvm_config_db #(virtual avsts_if#(64,0))::set(null,inst_name,"avsts_if",inst_avsts_mon_ecpri_dl_if);
      $sformat(inst_name,"*m_env.m_avsts_mon1_data_env*");
      uvm_config_db #(virtual avsts_if#(128,0))::set(null,inst_name,"avsts_if",inst_avsts_mon_oran_dl_if);
      
      $sformat(inst_name,"*m_env.m_avsts_mon2_data_env*");
      uvm_config_db #(virtual avsts_if#(32,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_fdv1_if);
      $sformat(inst_name,"*m_env.m_avsts_mon3_data_env*");
      uvm_config_db #(virtual avsts_if#(64,0,0))::set(null,inst_name,"avsts_if",inst_avsts_mon_oran_ul_if);

      $sformat(inst_name,"*m_env.m_avsts_mon4_data_env*");
      uvm_config_db #(virtual avsts_if#(64,0,0))::set(null,inst_name,"avsts_if",inst_avsts_mon_ecpri_ul_if);
      
      $sformat(inst_name,"*m_env.m_avsts_mon5_data_env*");
      uvm_config_db #(virtual avsts_if#(128,0,0))::set(null,inst_name,"avsts_if",inst_avsts_mon_coupling_if);

      $sformat(inst_name,"*m_env.m_avsts_mon6_data_env*");
      uvm_config_db #(virtual avsts_if#(32,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_fdv2_if);

      $sformat(inst_name,"*m_env.m_avsts_mon7_data_env*");
      uvm_config_db #(virtual avsts_if#(32,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_ifft1_if);
      
      $sformat(inst_name,"*m_env.m_avsts_mon8_data_env*");
      uvm_config_db #(virtual avsts_if#(32,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_ifft2_if);

      $sformat(inst_name,"*m_env.m_avsts_mon9_data_env*");
      uvm_config_db #(virtual avsts_if#(32,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_intrlvr1_if);
      
      $sformat(inst_name,"*m_env.m_avsts_mon10_data_env*");
      uvm_config_db #(virtual avsts_if#(32,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_intrlvr2_if);

      $sformat(inst_name,"*m_env.m_avsts_mon11_data_env*");
      uvm_config_db #(virtual avsts_if#(128,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_duc1_if);

      $sformat(inst_name,"*m_env.m_avsts_mon12_data_env*");
      uvm_config_db #(virtual avsts_if#(128,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_duc2_if);

      $sformat(inst_name,"*m_env.m_avsts_mon13_data_env*");
      uvm_config_db #(virtual avsts_if#(128,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_mixer_dl1_if);

      $sformat(inst_name,"*m_env.m_avsts_mon14_data_env*");
      uvm_config_db #(virtual avsts_if#(128,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_mixer_dl2_if);

      $sformat(inst_name,"*m_env.m_avsts_mon15_data_env*");
      uvm_config_db #(virtual avsts_if#(128,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_summer_if);

      $sformat(inst_name,"*m_env.m_avsts_mon16_data_env*");
      uvm_config_db #(virtual avsts_if#(256,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_interpolator_if);

      $sformat(inst_name,"*m_env.m_avsts_mon17_data_env*");
      uvm_config_db #(virtual avsts_if#(128,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_decimator_if);

      $sformat(inst_name,"*m_env.m_avsts_mon18_data_env*");
      uvm_config_db #(virtual avsts_if#(128,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_mixer_ul1_if);

      $sformat(inst_name,"*m_env.m_avsts_mon19_data_env*");
      uvm_config_db #(virtual avsts_if#(128,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_mixer_ul2_if);

      $sformat(inst_name,"*m_env.m_avsts_mon20_data_env*");
      uvm_config_db #(virtual avsts_if#(32,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_ddc1_if);

      $sformat(inst_name,"*m_env.m_avsts_mon21_data_env*");
      uvm_config_db #(virtual avsts_if#(32,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_ddc2_if);

      $sformat(inst_name,"*m_env.m_avsts_mon22_data_env*");
      uvm_config_db #(virtual avsts_if#(32,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_deintrlvr1_if);

      $sformat(inst_name,"*m_env.m_avsts_mon23_data_env*");
      uvm_config_db #(virtual avsts_if#(32,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_deintrlvr2_if);

      $sformat(inst_name,"*m_env.m_avsts_mon24_data_env*");
      uvm_config_db #(virtual avsts_if#(32,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_fft1_if);

      $sformat(inst_name,"*m_env.m_avsts_mon25_data_env*");
      uvm_config_db #(virtual avsts_if#(32,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_fft2_if);
      
      $sformat(inst_name,"*m_env.m_avsts_mon26_data_env*");
      uvm_config_db #(virtual avsts_if#(32,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_prach1_if);
	  
	  $sformat(inst_name,"*m_env.m_avsts_mon27_data_env*");
      uvm_config_db #(virtual avsts_if#(32,0,1))::set(null,inst_name,"avsts_if",inst_avsts_mon_prach2_if);
	  
      $sformat(inst_name,"*m_env.m_avsts_mon28_data_env*");
      uvm_config_db #(virtual avsts_if#(128,0))::set(null,inst_name,"avsts_if",inst_avsts_mon_coupling_prach_if);
      
      $sformat(inst_name,"*m_env.m_avsts_mon29_data_env*");
      uvm_config_db #(virtual avsts_if#(64,0,0))::set(null,inst_name,"avsts_if",inst_avsts_mon_oran_prach_if);

      $sformat(inst_name,"*m_env.m_avsts_mon30_data_env*");
      uvm_config_db #(virtual avsts_if#(64,0,0))::set(null,inst_name,"avsts_if",inst_avsts_mon_ecpri_prach_if);
    end

    /// Time Counter to schedule based on PCAP time /////
    always @(posedge clk_mac) begin
      m_config.avsts_drv_cfg[0].time_cnt = m_config.avsts_drv_cfg[0].time_cnt + 0.0024824;
      even_axc                           = m_config.o_ru_cfg.cc1_bw ;
      odd_axc                            = m_config.o_ru_cfg.cc2_bw  ;
    end 

    always @(posedge clk_dsp) begin
      bw_config_cc1 = {m_config.o_ru_cfg.cc1_dis,m_config.o_ru_cfg.cc1_bw};
      bw_config_cc2 = {m_config.o_ru_cfg.cc2_dis,m_config.o_ru_cfg.cc2_bw};
    end 
    
    always @(posedge clk_dsp) begin
      if(m_config.o_ru_cfg.force_dut == 1) begin
        `ifndef ECPRI_ORAN_SS
          force phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_ul_ant_scheduler.avst_sink_valid_l1 = 1 ; 
          force phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_ul_ant_scheduler.avst_sink_channel_l1 = 0 ; 
          force phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_ul_ant_scheduler.avst_sink_valid_l2 = 1 ; 
          force phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_ul_ant_scheduler.avst_sink_channel_l2 = 0 ; 
          force phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l1.avst_sink_valid = 0 ; 
          `ifdef NUM_CC_TWO 
            force phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l2.avst_sink_valid = 0 ; 
          `endif
        `endif
      end
      sf_cnt    = m_config.avsts_drv_cfg[3].sf    ;
      `ifdef ECPRI_ORAN_SS
        if(ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.rst_dsp_n == 1)
          force ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.ul_start = 1 ; 
        else
          force ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.ul_start = 0 ; 
      `else
        if(phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.rst_dsp_n == 1)
          force phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.ul_start = 1 ;
        else 
          force phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.ul_start = 0 ; 
      `endif
    end

    always @(posedge clk_dsp) begin
      sf_cnt_pu = m_config.avsts_drv_cfg[1].sf_pu ;
      coupling_sink_startofpacket_l1_d = inst_avsts_drv_coupling_pusch1_if.avsts_tx_sop    ;
      coupling_sink_data_l1_d          = inst_avsts_drv_coupling_pusch1_if.avsts_tx_data   ;
      coupling_sink_valid_l1_d         = inst_avsts_drv_coupling_pusch1_if.avsts_tx_valid  ;
      coupling_sink_channel_l1_d       = inst_avsts_drv_coupling_pusch1_if.avsts_tx_channel;
      coupling_sink_endofpacket_l1_d   = inst_avsts_drv_coupling_pusch1_if.avsts_tx_eop    ;
      coupling_sink_startofpacket_l2_d = inst_avsts_drv_coupling_pusch2_if.avsts_tx_sop    ;
      coupling_sink_data_l2_d          = inst_avsts_drv_coupling_pusch2_if.avsts_tx_data   ;
      coupling_sink_valid_l2_d         = inst_avsts_drv_coupling_pusch2_if.avsts_tx_valid  ;
      coupling_sink_channel_l2_d       = inst_avsts_drv_coupling_pusch2_if.avsts_tx_channel;
      coupling_sink_endofpacket_l2_d   = inst_avsts_drv_coupling_pusch2_if.avsts_tx_eop    ;
    end

    assign tod_cnt = {sec_cnt_t, nsec_cnt_t, frac_nsec_cnt_t};
    assign sf_cnt_coupling    = sf_cnt    ;
    assign sf_cnt_coupling_pu = sf_cnt_pu    ;
    assign bw_cfg_cc1         = bw_config_cc1 ;
    assign bw_cfg_cc2         = bw_config_cc2 ;
  
   // eCPRI demapper checker
   if (`ECPRI_DMPR_EN == 1) begin
           
      `ifndef ECPRI_ORAN_SS
        assign inst_avsts_mon_ecpri_dl_if.avsts_rx_data     = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.ecpri_ip_inst.avst_source_data   ;
        assign inst_avsts_mon_ecpri_dl_if.avsts_rx_valid    = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.ecpri_ip_inst.avst_source_valid  ;
        assign inst_avsts_mon_ecpri_dl_if.avsts_rx_eop      = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.ecpri_ip_inst.avst_source_eop    ;
        assign inst_avsts_mon_ecpri_dl_if.avsts_rx_sop      = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.ecpri_ip_inst.avst_source_sop    ;
        assign inst_avsts_mon_ecpri_dl_if.avsts_rx_empty    = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.ecpri_ip_inst.avst_source_empty  ;
      `else
        assign inst_avsts_mon_ecpri_dl_if.avsts_rx_data     = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.ecpri_ip_inst.avst_source_data   ;
        assign inst_avsts_mon_ecpri_dl_if.avsts_rx_valid    = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.ecpri_ip_inst.avst_source_valid  ;
        assign inst_avsts_mon_ecpri_dl_if.avsts_rx_eop      = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.ecpri_ip_inst.avst_source_eop    ;
        assign inst_avsts_mon_ecpri_dl_if.avsts_rx_sop      = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.ecpri_ip_inst.avst_source_sop    ;
        assign inst_avsts_mon_ecpri_dl_if.avsts_rx_empty    = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.ecpri_ip_inst.avst_source_empty  ;
      `endif
   end
  
   // ORAN demapper checker
   if (`ORAN_DMPR_EN == 1) begin
      `ifndef ECPRI_ORAN_SS
        assign inst_avsts_mon_oran_dl_if.avsts_rx_data     = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_u_data           ;
        assign inst_avsts_mon_oran_dl_if.avsts_rx_valid    = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_u_valid          ;
        assign inst_avsts_mon_oran_dl_if.avsts_rx_eop      = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_u_endofpacket    ;
        assign inst_avsts_mon_oran_dl_if.avsts_rx_sop      = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_u_startofpacket  ;
        assign inst_avsts_mon_oran_dl_if.avsts_rx_empty    = 0                                                                                                     ;
      `else
        assign inst_avsts_mon_oran_dl_if.avsts_rx_data     = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_u_data           ;
        assign inst_avsts_mon_oran_dl_if.avsts_rx_valid    = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_u_valid          ;
        assign inst_avsts_mon_oran_dl_if.avsts_rx_eop      = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_u_endofpacket    ;
        assign inst_avsts_mon_oran_dl_if.avsts_rx_sop      = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_u_startofpacket  ;
        assign inst_avsts_mon_oran_dl_if.avsts_rx_empty    = 0                                                                                              ;
      `endif
   end
   `ifndef ECPRI_ORAN_SS

   // FDV demapper Checker
   if (`FDV_DMPR_EN == 1) begin
      assign inst_avsts_mon_fdv1_if.avsts_rx_data     = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_dl_blanking_l1.avst_src_data   ;
      assign inst_avsts_mon_fdv1_if.avsts_rx_valid    = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_dl_blanking_l1.avst_src_valid ;
      assign inst_avsts_mon_fdv1_if.avsts_rx_empty    = 0                                                                                                 ;
      assign inst_avsts_mon_fdv1_if.DATA_STOP_SIZE    = (even_axc == 32'ha) ? 7776 : 13104                                                                ; 
      `ifdef NUM_CC_TWO 
        assign inst_avsts_mon_fdv2_if.avsts_rx_data     = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_dl_blanking_l2.avst_src_data  ;
        assign inst_avsts_mon_fdv2_if.avsts_rx_valid    = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_dl_blanking_l2.avst_src_valid ;
        assign inst_avsts_mon_fdv2_if.avsts_rx_empty    = 0                                                                                                 ;
        assign inst_avsts_mon_fdv2_if.DATA_STOP_SIZE    = (odd_axc == 32'ha) ? 7776 : 13104                                                                 ; 
      `endif 
   end
   // IFFT Checker
   if (`IFFT_EN == 1) begin
      assign inst_avsts_mon_ifft1_if.avsts_rx_data     = {phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_ifft_if_l1.u_ifft_blocktostream_DUT.thelow_phy_dl_cunroll_x.theiFFT_B2S_cunroll_x.theIFFT_cunroll_x.out_3_imag_dout1_tpl , phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_ifft_if_l1.u_ifft_blocktostream_DUT.thelow_phy_dl_cunroll_x.theiFFT_B2S_cunroll_x.theIFFT_cunroll_x.out_3_real_dout1_tpl};
      assign inst_avsts_mon_ifft1_if.avsts_rx_valid    = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_ifft_if_l1.u_ifft_blocktostream_DUT.thelow_phy_dl_cunroll_x.theiFFT_B2S_cunroll_x.theIFFT_cunroll_x.out_1_vout1_tpl;
      assign inst_avsts_mon_ifft1_if.avsts_rx_empty    = 0      ;
      assign inst_avsts_mon_ifft1_if.DATA_STOP_SIZE    = 16384  ;

      `ifdef NUM_CC_TWO 
        assign inst_avsts_mon_ifft2_if.avsts_rx_data     = {phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_ifft_if_l2.u_ifft_blocktostream_DUT.thelow_phy_dl_cunroll_x.theiFFT_B2S_cunroll_x.theIFFT_cunroll_x.out_3_imag_dout1_tpl , phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_ifft_if_l2.u_ifft_blocktostream_DUT.thelow_phy_dl_cunroll_x.theiFFT_B2S_cunroll_x.theIFFT_cunroll_x.out_3_real_dout1_tpl};
        assign inst_avsts_mon_ifft2_if.avsts_rx_valid    = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_ifft_if_l2.u_ifft_blocktostream_DUT.thelow_phy_dl_cunroll_x.theiFFT_B2S_cunroll_x.theIFFT_cunroll_x.out_1_vout1_tpl;
        assign inst_avsts_mon_ifft2_if.avsts_rx_empty    = 0      ;
        assign inst_avsts_mon_ifft2_if.DATA_STOP_SIZE    = 16384  ; 
      `endif 
   end

   // INTERLEAVER Checker
   if (`INTRLVR_EN == 1) begin
      assign inst_avsts_mon_intrlvr1_if.avsts_rx_data     = {phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_ifft_if_l1.u_ifft_blocktostream_DUT.thelow_phy_dl_cunroll_x.theiFFT_B2S_cunroll_x.theB2S_cunroll_x.theB2S_Inst_cunroll_x.out_3_imag_q_tpl , phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_ifft_if_l1.u_ifft_blocktostream_DUT.thelow_phy_dl_cunroll_x.theiFFT_B2S_cunroll_x.theB2S_cunroll_x.theB2S_Inst_cunroll_x.out_3_real_q_tpl};
      assign inst_avsts_mon_intrlvr1_if.avsts_rx_valid    = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_ifft_if_l1.u_ifft_blocktostream_DUT.thelow_phy_dl_cunroll_x.theiFFT_B2S_cunroll_x.theB2S_cunroll_x.theB2S_Inst_cunroll_x.out_1_vout_tpl;
      assign inst_avsts_mon_intrlvr1_if.avsts_rx_empty    = 0 ;
      assign inst_avsts_mon_intrlvr1_if.DATA_STOP_SIZE    = (intrlvr1_sample_limit + 1) * 4 ;

      `ifdef NUM_CC_TWO 
        assign inst_avsts_mon_intrlvr2_if.avsts_rx_data     = {phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_ifft_if_l2.u_ifft_blocktostream_DUT.thelow_phy_dl_cunroll_x.theiFFT_B2S_cunroll_x.theB2S_cunroll_x.theB2S_Inst_cunroll_x.out_3_imag_q_tpl , phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_ifft_if_l2.u_ifft_blocktostream_DUT.thelow_phy_dl_cunroll_x.theiFFT_B2S_cunroll_x.theB2S_cunroll_x.theB2S_Inst_cunroll_x.out_3_real_q_tpl};
        assign inst_avsts_mon_intrlvr2_if.avsts_rx_valid    = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_dl_lphy_ss.u_ifft_if_l2.u_ifft_blocktostream_DUT.thelow_phy_dl_cunroll_x.theiFFT_B2S_cunroll_x.theB2S_cunroll_x.theB2S_Inst_cunroll_x.out_1_vout_tpl;
        assign inst_avsts_mon_intrlvr2_if.avsts_rx_empty    = 0 ;
        assign inst_avsts_mon_intrlvr2_if.DATA_STOP_SIZE    = (intrlvr2_sample_limit + 1) * 4 ;
      `endif
            
        assign intrlvr1_sample_limit = (intrlvr1_symbol_cnt == 0) ? 4447 : 4383;
        assign intrlvr2_sample_limit = (intrlvr2_symbol_cnt == 0) ? 4447 : 4383;
        
     always @ (posedge clk_dsp)
     begin : INTRLVR1_SAMP_COUNTER
       if (intrlvr1_sample_cnt == intrlvr1_sample_limit) begin
         intrlvr1_sample_cnt = 0 ;
         intrlvr1_axc_cnt = intrlvr1_axc_cnt + 1;
       end
       else if(intrlvr1_axc_cnt == 4) begin
         intrlvr1_symbol_cnt = intrlvr1_symbol_cnt + 1;
         intrlvr1_axc_cnt  = 0 ;
       end
       else if (intrlvr1_symbol_cnt == 14) begin
         intrlvr1_symbol_cnt = 0;
       end
       else if (inst_avsts_mon_intrlvr1_if.avsts_rx_valid) begin
         intrlvr1_sample_cnt = intrlvr1_sample_cnt + 1;
       end
       else begin
          intrlvr1_sample_cnt = intrlvr1_sample_cnt;
          intrlvr1_symbol_cnt = intrlvr1_symbol_cnt;
       end
     end 
	 
     always @ (posedge clk_dsp)
     begin : INTRLVR2_SAMP_COUNTER
       if (intrlvr2_sample_cnt == intrlvr2_sample_limit) begin
         intrlvr2_sample_cnt = 0 ;
         intrlvr2_axc_cnt = intrlvr2_axc_cnt + 1;
       end
       else if(intrlvr2_axc_cnt == 4) begin
         intrlvr2_symbol_cnt = intrlvr2_symbol_cnt + 1;
         intrlvr2_axc_cnt  = 0 ;
       end
       else if (intrlvr2_symbol_cnt == 14) begin
         intrlvr2_symbol_cnt = 0;
       end
       else if (inst_avsts_mon_intrlvr2_if.avsts_rx_valid) begin
         intrlvr2_sample_cnt = intrlvr2_sample_cnt + 1;
       end
       else begin
          intrlvr2_sample_cnt = intrlvr2_sample_cnt;
          intrlvr2_symbol_cnt = intrlvr2_symbol_cnt;
       end
     end 
   end
   `endif   
    
   `ifndef ECPRI_ORAN_SS
   `ifndef IFFT_FFT_LOOPBACK 
   // DUC Checker
   if (`DUC_EN == 1) begin
      assign inst_avsts_mon_duc1_if.avsts_rx_data     = {phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l1_dout_0im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l1_dout_0re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l1_dout_1im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l1_dout_1re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l1_dout_2im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l1_dout_2re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l1_dout_3im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l1_dout_3re};
      assign inst_avsts_mon_duc1_if.avsts_rx_valid    = phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l1_vout_s;
      assign inst_avsts_mon_duc1_if.avsts_rx_empty    = 0 ;
      assign inst_avsts_mon_duc1_if.DATA_STOP_SIZE    = (duc1_sample_limit + 1) * 4 * 4 ;

      `ifdef NUM_CC_TWO 
        assign inst_avsts_mon_duc2_if.avsts_rx_data     = {phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l2_dout_0im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l2_dout_0re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l2_dout_1im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l2_dout_1re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l2_dout_2im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l2_dout_2re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l2_dout_3im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l2_dout_3re};
        assign inst_avsts_mon_duc2_if.avsts_rx_valid    = phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.duc_l2_vout_s;
        assign inst_avsts_mon_duc2_if.avsts_rx_empty    = 0 ;
        assign inst_avsts_mon_duc2_if.DATA_STOP_SIZE    = (duc2_sample_limit + 1) * 4 * 4 ;
      `endif
    
    assign duc1_sample_limit = (duc1_symbol_cnt == 0 && duc1_axc_cnt == 0) ? 4783 :((duc1_symbol_cnt == 0) || (duc1_symbol_cnt % 14 == 0)) ? 4447 : 4383;
    assign duc2_sample_limit = (duc2_symbol_cnt == 0 && duc2_axc_cnt == 0) ? 4783 :((duc2_symbol_cnt == 0) || (duc2_symbol_cnt % 14 == 0)) ? 4447 : 4383;
	
    always @ (posedge clk_dsp)
    begin : DUC1_SAMP_COUNTER
      if((duc1_axc_cnt == 3) && (duc1_sample_cnt == duc1_sample_limit)) begin
        duc1_symbol_cnt = duc1_symbol_cnt + 1;
        duc1_axc_cnt  = 0 ;	
        duc1_sample_cnt = 0 ;
      end      
      else if (duc1_sample_cnt == duc1_sample_limit) begin
        duc1_sample_cnt = 0 ;
        duc1_axc_cnt = duc1_axc_cnt + 1;
      end
      else if (inst_avsts_mon_duc1_if.avsts_rx_valid) begin
        duc1_sample_cnt = duc1_sample_cnt + 1;
      end
      else begin
         duc1_sample_cnt = duc1_sample_cnt;
         duc1_symbol_cnt = duc1_symbol_cnt;
         duc1_axc_cnt    = duc1_axc_cnt   ;
      end
    end 
           
    always @ (posedge clk_dsp)
    begin : DUC2_SAMP_COUNTER
      if((duc2_axc_cnt == 3) && (duc2_sample_cnt == duc2_sample_limit)) begin
          duc2_symbol_cnt = duc2_symbol_cnt + 1;
          duc2_axc_cnt  = 0 ;
          duc2_sample_cnt = 0 ;
      end
      else if (duc2_sample_cnt == duc2_sample_limit) begin
        duc2_sample_cnt = 0 ;
        duc2_axc_cnt = duc2_axc_cnt + 1;
      end
      else if (inst_avsts_mon_duc2_if.avsts_rx_valid) begin
        duc2_sample_cnt = duc2_sample_cnt + 1;
      end
      else begin
         duc2_sample_cnt = duc2_sample_cnt;
         duc2_symbol_cnt = duc2_symbol_cnt;
        duc2_axc_cnt     = duc2_axc_cnt   ;
      end
    end 
  end
   
   
   // MIXER DL Checker
   if (`MIXER_DL_EN == 1) begin
      assign inst_avsts_mon_mixer_dl1_if.avsts_rx_data     = {phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l1.DUC_Data_Out_0im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l1.DUC_Data_Out_0re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l1.DUC_Data_Out_1im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l1.DUC_Data_Out_1re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l1.DUC_Data_Out_2im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l1.DUC_Data_Out_2re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l1.DUC_Data_Out_3im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l1.DUC_Data_Out_3re};
      assign inst_avsts_mon_mixer_dl1_if.avsts_rx_valid    = phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l1.DUC_Valid_Out_s;
      assign inst_avsts_mon_mixer_dl1_if.avsts_rx_empty    = 0 ;
      assign inst_avsts_mon_mixer_dl1_if.DATA_STOP_SIZE    = (mixer1_dl_sample_limit + 1) * 4 * 4 ;

      `ifdef NUM_CC_TWO 
        assign inst_avsts_mon_mixer_dl2_if.avsts_rx_data     = {phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l2.DUC_Data_Out_0im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l2.DUC_Data_Out_0re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l2.DUC_Data_Out_1im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l2.DUC_Data_Out_1re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l2.DUC_Data_Out_2im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l2.DUC_Data_Out_2re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l2.DUC_Data_Out_3im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l2.DUC_Data_Out_3re};
        assign inst_avsts_mon_mixer_dl2_if.avsts_rx_valid    = phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.dut_duc_l2.DUC_Valid_Out_s;
        assign inst_avsts_mon_mixer_dl2_if.avsts_rx_empty    = 0 ;
        assign inst_avsts_mon_mixer_dl2_if.DATA_STOP_SIZE    = (mixer2_dl_sample_limit + 1) * 4 * 4 ;
      `endif
 
      assign mixer1_dl_sample_limit = (mixer1_dl_symbol_cnt == 0 && mixer1_dl_axc_cnt == 0) ? 4783 :((mixer1_dl_symbol_cnt == 0 || mixer1_dl_symbol_cnt % 14 == 0) ? 4447 : 4383);
      assign mixer2_dl_sample_limit = (mixer2_dl_symbol_cnt == 0 && mixer2_dl_axc_cnt == 0) ? 4783 :((mixer2_dl_symbol_cnt == 0 || mixer2_dl_symbol_cnt % 14 == 0) ? 4447 : 4383);
        
      always @ (posedge clk_dsp)
      begin : MIXER1_SAMP_COUNTER
        if((mixer1_dl_axc_cnt == 3) && (mixer1_dl_sample_cnt == mixer1_dl_sample_limit)) begin
          mixer1_dl_symbol_cnt = mixer1_dl_symbol_cnt + 1;
          mixer1_dl_axc_cnt  = 0 ;
          mixer1_dl_sample_cnt = 0 ;
        end
        else if (mixer1_dl_sample_cnt == mixer1_dl_sample_limit) begin
          mixer1_dl_sample_cnt = 0 ;
          mixer1_dl_axc_cnt = mixer1_dl_axc_cnt + 1;
        end
        else if (inst_avsts_mon_mixer_dl1_if.avsts_rx_valid) begin
          mixer1_dl_sample_cnt = mixer1_dl_sample_cnt + 1;
        end
        else begin
           mixer1_dl_sample_cnt = mixer1_dl_sample_cnt;
           mixer1_dl_symbol_cnt = mixer1_dl_symbol_cnt;
           mixer1_dl_axc_cnt    = mixer1_dl_axc_cnt   ;
        end
      end 
	 
      always @ (posedge clk_dsp)
      begin : MIXER2_SAMP_COUNTER
        if((mixer2_dl_axc_cnt == 3) && (mixer2_dl_sample_cnt == mixer2_dl_sample_limit)) begin
          mixer2_dl_symbol_cnt = mixer2_dl_symbol_cnt + 1;
          mixer2_dl_axc_cnt  = 0 ;
          mixer2_dl_sample_cnt = 0;
        end
        else if (mixer2_dl_sample_cnt == mixer2_dl_sample_limit) begin
          mixer2_dl_sample_cnt = 0 ;
          mixer2_dl_axc_cnt = mixer2_dl_axc_cnt + 1;
        end 
        else if (inst_avsts_mon_mixer_dl2_if.avsts_rx_valid) begin
          mixer2_dl_sample_cnt = mixer2_dl_sample_cnt + 1;
        end
        else begin
           mixer2_dl_sample_cnt = mixer2_dl_sample_cnt;
           mixer2_dl_symbol_cnt = mixer2_dl_symbol_cnt;
           mixer2_dl_axc_cnt    = mixer2_dl_axc_cnt  ;
        end
      end 
   end

   // SUMMER Checker
   if (`SUMMER_EN == 1) begin

      assign inst_avsts_mon_summer_if.avsts_rx_data     = {phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.summer_dout_0im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.summer_dout_0re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.summer_dout_1im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.summer_dout_1re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.summer_dout_2im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.summer_dout_2re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.summer_dout_3im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.summer_dout_3re};
      assign inst_avsts_mon_summer_if.avsts_rx_valid    = phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.summer_vout_s;
      assign inst_avsts_mon_summer_if.avsts_rx_empty    = 0 ;
      assign inst_avsts_mon_summer_if.DATA_STOP_SIZE    = (summer_sample_limit + 1) * 4 * 4 ;
	  
      assign summer_sample_limit = (summer_symbol_cnt == 0 && summer_axc_cnt == 0) ? 4783 :((summer_symbol_cnt == 0 || summer_symbol_cnt % 14 == 0) ? 4447 : 4383);

        
      always @ (posedge clk_dsp)
      begin : SUMMER_SAMP_COUNTER
        if((summer_axc_cnt == 3) && (summer_sample_cnt == summer_sample_limit))begin
          summer_symbol_cnt = summer_symbol_cnt + 1;
          summer_axc_cnt  = 0 ;
          summer_sample_cnt = 0;
        end
        else if (summer_sample_cnt == summer_sample_limit) begin
          summer_sample_cnt = 0 ;
          summer_axc_cnt = summer_axc_cnt + 1;
        end
        else if (inst_avsts_mon_summer_if.avsts_rx_valid) begin
          summer_sample_cnt = summer_sample_cnt + 1;
        end
        else begin
           summer_sample_cnt = summer_sample_cnt;
           summer_symbol_cnt = summer_symbol_cnt;
           summer_axc_cnt = summer_axc_cnt ;
        end
      end 
   end

   // INTERPOLATOR Checker
   if (`INTERPOLATOR_EN == 1) begin
      assign inst_avsts_mon_interpolator_if.avsts_rx_data     = {phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_0im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_0re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_1im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_1re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_2im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_2re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_3im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_3re ,phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_4im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_4re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_5im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_5re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_6im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_6re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_7im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Ant_Data_Out_7re };
      assign inst_avsts_mon_interpolator_if.avsts_rx_valid    = phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.duc_inst.DUC_Valid_Out_s;
      assign inst_avsts_mon_interpolator_if.avsts_rx_empty    = 0 ;
      assign inst_avsts_mon_interpolator_if.DATA_STOP_SIZE    = (interpolator_sample_limit + 1) * 4 * 4 * 2 ;
 
      assign interpolator_sample_limit = (interpolator_symbol_cnt == 0 && interpolator_axc_cnt == 0) ? 4803 :((interpolator_symbol_cnt == 0 || interpolator_symbol_cnt % 14 == 0) ? 4447 : 4383);
   
      always @ (posedge clk_dsp)
      begin : INTERPOLATOR_SAMP_COUNTER
        if((interpolator_axc_cnt == 3) && (interpolator_sample_cnt == interpolator_sample_limit)) begin
          interpolator_symbol_cnt = interpolator_symbol_cnt + 1;
          interpolator_axc_cnt    = 0;
          interpolator_sample_cnt = 0;
        end
        else if (interpolator_sample_cnt == interpolator_sample_limit) begin
          interpolator_sample_cnt = 0 ;
          interpolator_axc_cnt    = interpolator_axc_cnt + 1;
        end
        else if (inst_avsts_mon_interpolator_if.avsts_rx_valid) begin
          interpolator_sample_cnt = interpolator_sample_cnt + 1;
        end
        else begin
           interpolator_sample_cnt = interpolator_sample_cnt;
           interpolator_symbol_cnt = interpolator_symbol_cnt;
           interpolator_axc_cnt    = interpolator_axc_cnt;
        end
      end 
   end

   // DECIMATOR Checker
   if (`DECIMATOR_EN == 1) begin

      assign inst_avsts_mon_decimator_if.avsts_rx_data     = {phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.dut_dec_dly_comp.theDUT_vunroll_cunroll_x.thePolyphase_Decimator_vunroll_cunroll_x.out_1_0_imag_q_tpl , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.dut_dec_dly_comp.theDUT_vunroll_cunroll_x.thePolyphase_Decimator_vunroll_cunroll_x.out_1_0_real_q_tpl , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.dut_dec_dly_comp.theDUT_vunroll_cunroll_x.thePolyphase_Decimator_vunroll_cunroll_x.out_1_1_imag_q_tpl , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.dut_dec_dly_comp.theDUT_vunroll_cunroll_x.thePolyphase_Decimator_vunroll_cunroll_x.out_1_1_real_q_tpl , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.dut_dec_dly_comp.theDUT_vunroll_cunroll_x.thePolyphase_Decimator_vunroll_cunroll_x.out_1_2_imag_q_tpl , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.dut_dec_dly_comp.theDUT_vunroll_cunroll_x.thePolyphase_Decimator_vunroll_cunroll_x.out_1_2_real_q_tpl , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.dut_dec_dly_comp.theDUT_vunroll_cunroll_x.thePolyphase_Decimator_vunroll_cunroll_x.out_1_3_imag_q_tpl , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.dut_dec_dly_comp.theDUT_vunroll_cunroll_x.thePolyphase_Decimator_vunroll_cunroll_x.out_1_3_real_q_tpl};
      assign inst_avsts_mon_decimator_if.avsts_rx_valid    = phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.dut_dec_dly_comp.theDUT_vunroll_cunroll_x.thePolyphase_Decimator_vunroll_cunroll_x.out_2_qv_tpl;
      assign inst_avsts_mon_decimator_if.avsts_rx_empty    = 0 ;
      assign inst_avsts_mon_decimator_if.DATA_STOP_SIZE    = (decimator_sample_limit + 1) * 4 * 4 ;
	  
      assign decimator_sample_limit = (decimator_symbol_cnt == 0 && decimator_axc_cnt == 0) ? 4823 :((decimator_symbol_cnt == 0 || decimator_symbol_cnt % 14 == 0) ? 4447 : 4383);
        
      always @ (posedge clk_dsp)
      begin : DECIMATOR_SAMP_COUNTER
        if((decimator_axc_cnt == 3) && (decimator_sample_cnt == decimator_sample_limit))begin
          decimator_symbol_cnt = decimator_symbol_cnt + 1;
          decimator_axc_cnt    = 0 ;
          decimator_sample_cnt = 0;
        end
        else if (decimator_sample_cnt == decimator_sample_limit) begin
          decimator_sample_cnt = 0 ;
          decimator_axc_cnt    = decimator_axc_cnt + 1;
        end
        else if (inst_avsts_mon_decimator_if.avsts_rx_valid) begin
          decimator_sample_cnt = decimator_sample_cnt + 1;
        end
        else begin
           decimator_sample_cnt = decimator_sample_cnt;
           decimator_symbol_cnt = decimator_symbol_cnt;
           decimator_axc_cnt    = decimator_axc_cnt   ; 
        end
      end 
   end

   // MIXER UL Checker
   if (`MIXER_UL_EN == 1) begin

      assign inst_avsts_mon_mixer_ul1_if.avsts_rx_data     = {phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l1_dout_0im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l1_dout_0re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l1_dout_1im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l1_dout_1re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l1_dout_2im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l1_dout_2re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l1_dout_3im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l1_dout_3re};
      assign inst_avsts_mon_mixer_ul1_if.avsts_rx_valid    = phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l1_vout_s;
      assign inst_avsts_mon_mixer_ul1_if.avsts_rx_empty    = 0 ;
      assign inst_avsts_mon_mixer_ul1_if.DATA_STOP_SIZE    = (mixer1_ul_sample_limit + 1) * 4 * 4;

      `ifdef NUM_CC_TWO 
        assign inst_avsts_mon_mixer_ul2_if.avsts_rx_data     = {phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l2_dout_0im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l2_dout_0re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l2_dout_1im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l2_dout_1re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l2_dout_2im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l2_dout_2re , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l2_dout_3im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l2_dout_3re};
        assign inst_avsts_mon_mixer_ul2_if.avsts_rx_valid    = phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.mixer_l2_vout_s;
        assign inst_avsts_mon_mixer_ul2_if.avsts_rx_empty    = 0 ;
        assign inst_avsts_mon_mixer_ul2_if.DATA_STOP_SIZE    = (mixer2_ul_sample_limit + 1) * 4 * 4;
      `endif 
	  
	assign mixer1_ul_sample_limit = (mixer1_ul_symbol_cnt == 0 && mixer1_ul_axc_cnt == 0) ? 4823 :((mixer1_ul_symbol_cnt == 0) || (mixer1_ul_symbol_cnt % 14 == 0)) ? 4447 : 4383;
        assign mixer2_ul_sample_limit = (mixer2_ul_symbol_cnt == 0 && mixer2_ul_axc_cnt == 0) ? 4823 :((mixer2_ul_symbol_cnt == 0) || (mixer2_ul_symbol_cnt % 14 == 0)) ? 4447 : 4383;
	
        
     always @ (posedge clk_dsp)
     begin : MIXER1_UL_SAMP_COUNTER
       if((mixer1_ul_axc_cnt == 3) && (mixer1_ul_sample_cnt == mixer1_ul_sample_limit)) begin
         mixer1_ul_symbol_cnt = mixer1_ul_symbol_cnt + 1;
         mixer1_ul_axc_cnt    = 0;
         mixer1_ul_sample_cnt = 0;
       end      
       else if (mixer1_ul_sample_cnt == mixer1_ul_sample_limit) begin
         mixer1_ul_sample_cnt = 0 ;
         mixer1_ul_axc_cnt    = mixer1_ul_axc_cnt + 1;
       end
       else if (inst_avsts_mon_mixer_ul1_if.avsts_rx_valid) begin
         mixer1_ul_sample_cnt = mixer1_ul_sample_cnt + 1;
       end
       else begin
          mixer1_ul_sample_cnt = mixer1_ul_sample_cnt;
          mixer1_ul_symbol_cnt = mixer1_ul_symbol_cnt;
          mixer1_ul_axc_cnt    = mixer1_ul_axc_cnt   ;
       end
     end 
	 
     always @ (posedge clk_dsp)
     begin : MIXER2_UL_SAMP_COUNTER
       if((mixer2_ul_axc_cnt == 3) && (mixer2_ul_sample_cnt == mixer2_ul_sample_limit)) begin
         mixer2_ul_symbol_cnt = mixer2_ul_symbol_cnt + 1;
         mixer2_ul_axc_cnt    = 0 ;
         mixer2_ul_sample_cnt = 0;
       end      
       else if (mixer2_ul_sample_cnt == mixer2_ul_sample_limit) begin
         mixer2_ul_sample_cnt = 0 ;
         mixer2_ul_axc_cnt    = mixer2_ul_axc_cnt + 1;
       end
       else if (inst_avsts_mon_mixer_ul2_if.avsts_rx_valid) begin
         mixer2_ul_sample_cnt = mixer2_ul_sample_cnt + 1;
       end
       else begin
          mixer2_ul_sample_cnt = mixer2_ul_sample_cnt;
          mixer2_ul_symbol_cnt = mixer2_ul_symbol_cnt;
          mixer2_ul_axc_cnt    = mixer2_ul_axc_cnt;
       end
     end 
   end

   // DDC Checker
   if (`DDC_EN == 1) begin

      assign inst_avsts_mon_ddc1_if.avsts_rx_data     = {phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.ddc_l1_dout_im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.ddc_l1_dout_re};
      assign inst_avsts_mon_ddc1_if.avsts_rx_valid    = phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.ddc_l1_vout_s;
      assign inst_avsts_mon_ddc1_if.avsts_rx_empty    = 0 ;
      assign inst_avsts_mon_ddc1_if.DATA_STOP_SIZE    = (ddc1_sample_limit + 1) * 4;

      `ifdef NUM_CC_TWO 
        assign inst_avsts_mon_ddc2_if.avsts_rx_data     = {phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.ddc_l2_dout_im , phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.ddc_l2_dout_re};
        assign inst_avsts_mon_ddc2_if.avsts_rx_valid    = phipps_peak_inst.dxc_ss_top_0.dxc_ss_0.dxc_ss_0.ddc_inst.ddc_l2_vout_s;
        assign inst_avsts_mon_ddc2_if.avsts_rx_empty    = 0 ;
        assign inst_avsts_mon_ddc2_if.DATA_STOP_SIZE    = (ddc2_sample_limit + 1) * 4;
      `endif
	  
      assign ddc1_sample_limit = (ddc1_symbol_cnt == 0 && ddc1_axc_cnt == 0) ? 5523 :((ddc1_symbol_cnt == 0) || (ddc1_symbol_cnt % 14 == 0)) ? 4447 : 4383;
      assign ddc2_sample_limit = (ddc2_symbol_cnt == 0 && ddc2_axc_cnt == 0) ? 5523 :((ddc2_symbol_cnt == 0) || (ddc2_symbol_cnt % 14 == 0)) ? 4447 : 4383;
	
	 
     always @ (posedge clk_dsp)
     begin : DDC1_SAMP_COUNTER
       if((ddc1_axc_cnt == 3) && (ddc1_sample_cnt == ddc1_sample_limit))begin
         ddc1_symbol_cnt = ddc1_symbol_cnt + 1;
         ddc1_axc_cnt    = 0 ;
         ddc1_sample_cnt = 0 ;
       end
       else if (ddc1_sample_cnt == ddc1_sample_limit) begin
         ddc1_sample_cnt = 0 ;
         ddc1_axc_cnt    = ddc1_axc_cnt + 1;
       end
       else if (inst_avsts_mon_ddc1_if.avsts_rx_valid) begin
         ddc1_sample_cnt = ddc1_sample_cnt + 1;
       end
       else begin
          ddc1_sample_cnt = ddc1_sample_cnt;
          ddc1_symbol_cnt = ddc1_symbol_cnt;
          ddc1_axc_cnt    = ddc1_axc_cnt   ;
       end
     end 
	 
     always @ (posedge clk_dsp)
     begin : DDC2_SAMP_COUNTER
       if((ddc2_axc_cnt == 3) && (ddc2_sample_cnt == ddc2_sample_limit))begin
         ddc2_symbol_cnt = ddc2_symbol_cnt + 1;
         ddc2_axc_cnt    = 0 ;
         ddc2_sample_cnt = 0;
       end
       else if (ddc2_sample_cnt == ddc2_sample_limit) begin
         ddc2_sample_cnt = 0 ;
         ddc2_axc_cnt    = ddc2_axc_cnt + 1;
       end
       else if (inst_avsts_mon_ddc2_if.avsts_rx_valid) begin
         ddc2_sample_cnt = ddc2_sample_cnt + 1;
       end
       else begin
          ddc2_sample_cnt = ddc2_sample_cnt;
          ddc2_symbol_cnt = ddc2_symbol_cnt;
          ddc2_axc_cnt = ddc2_axc_cnt      ;
       end
     end 
   end

   `endif
   `endif
   `ifndef ECPRI_ORAN_SS

   // Deinterleaver Checker
   if (`DEINTRLVR_EN == 1) begin

      assign inst_avsts_mon_deintrlvr1_if.avsts_rx_data     = {phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l1.u_streamtoblock_fft_DUT.theS2B_FFT_PC_cunroll_x.theFFT_S2B_cunroll_x.theCPRemoval_cunroll_x.out_3_imag_dout_tpl , phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l1.u_streamtoblock_fft_DUT.theS2B_FFT_PC_cunroll_x.theFFT_S2B_cunroll_x.theCPRemoval_cunroll_x.out_3_real_dout_tpl};
      assign inst_avsts_mon_deintrlvr1_if.avsts_rx_valid    = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l1.u_streamtoblock_fft_DUT.theS2B_FFT_PC_cunroll_x.theFFT_S2B_cunroll_x.theCPRemoval_cunroll_x.out_1_vout_x_tpl;
      assign inst_avsts_mon_deintrlvr1_if.avsts_rx_empty    = 0     ;
      assign inst_avsts_mon_deintrlvr1_if.DATA_STOP_SIZE    = 16384 ;
      
      `ifdef NUM_CC_TWO 
        assign inst_avsts_mon_deintrlvr2_if.avsts_rx_data     = {phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l2.u_streamtoblock_fft_DUT.theS2B_FFT_PC_cunroll_x.theFFT_S2B_cunroll_x.theCPRemoval_cunroll_x.out_3_imag_dout_tpl , phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l2.u_streamtoblock_fft_DUT.theS2B_FFT_PC_cunroll_x.theFFT_S2B_cunroll_x.theCPRemoval_cunroll_x.out_3_real_dout_tpl};
        assign inst_avsts_mon_deintrlvr2_if.avsts_rx_valid    = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l2.u_streamtoblock_fft_DUT.theS2B_FFT_PC_cunroll_x.theFFT_S2B_cunroll_x.theCPRemoval_cunroll_x.out_1_vout_x_tpl;
        assign inst_avsts_mon_deintrlvr2_if.avsts_rx_empty    = 0     ;
        assign inst_avsts_mon_deintrlvr2_if.DATA_STOP_SIZE    = 16384 ;
      `endif

   end

   // FFT Checker
   if (`FFT_EN == 1) begin

      assign inst_avsts_mon_fft1_if.avsts_rx_data     = {phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l1.u_streamtoblock_fft_DUT.theS2B_FFT_PC_cunroll_x.thePhaseCompensation_lite_cunroll_x.out_1_imag_dout1_tpl , phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l1.u_streamtoblock_fft_DUT.theS2B_FFT_PC_cunroll_x.thePhaseCompensation_lite_cunroll_x.out_1_real_dout1_tpl};
      assign inst_avsts_mon_fft1_if.avsts_rx_valid    = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l1.u_streamtoblock_fft_DUT.theS2B_FFT_PC_cunroll_x.thePhaseCompensation_lite_cunroll_x.out_2_vout_tpl;
      assign inst_avsts_mon_fft1_if.avsts_rx_empty    = 0                                  ;
      assign inst_avsts_mon_fft1_if.DATA_STOP_SIZE    = (even_axc == 32'ha) ? 7776 : 13104 ;

      `ifdef NUM_CC_TWO 
        assign inst_avsts_mon_fft2_if.avsts_rx_data     = {phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l2.u_streamtoblock_fft_DUT.theS2B_FFT_PC_cunroll_x.thePhaseCompensation_lite_cunroll_x.out_1_imag_dout1_tpl , phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l2.u_streamtoblock_fft_DUT.theS2B_FFT_PC_cunroll_x.thePhaseCompensation_lite_cunroll_x.out_1_real_dout1_tpl};
        assign inst_avsts_mon_fft2_if.avsts_rx_valid    = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_ul_lphy_ss.u_fft_if_l2.u_streamtoblock_fft_DUT.theS2B_FFT_PC_cunroll_x.thePhaseCompensation_lite_cunroll_x.out_2_vout_tpl;
        assign inst_avsts_mon_fft2_if.avsts_rx_empty    = 0                                  ;
        assign inst_avsts_mon_fft2_if.DATA_STOP_SIZE    = (odd_axc == 32'ha) ? 7776 : 13104  ;
      `endif
   end
   `endif

   if (`PRACH_EN == 1) begin
      `ifndef ECPRI_ORAN_SS
        `ifdef SHORT_PRACH_FORMAT
          assign inst_avsts_mon_prach1_if.avsts_rx_data     = {phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_prach_top.u_prach_if.PRACH_SLICE[0].u_prach_shortFormat_fftShift_prach.fftShift_d_im, phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_prach_top.u_prach_if.PRACH_SLICE[0].u_prach_shortFormat_fftShift_prach.fftShift_d_re}           ;
          assign inst_avsts_mon_prach1_if.avsts_rx_valid    = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_prach_top.u_prach_if.PRACH_SLICE[0].u_prach_shortFormat_fftShift_prach.fftShift_v_s          ;
          assign inst_avsts_mon_prach1_if.avsts_rx_empty    = 0   ;
          assign inst_avsts_mon_prach1_if.DATA_STOP_SIZE    = 576 ;

          `ifdef NUM_CC_TWO 
            assign inst_avsts_mon_prach2_if.avsts_rx_data     = {phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_prach_top.u_prach_if.PRACH_SLICE[1].u_prach_shortFormat_fftShift_prach.fftShift_d_im, phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_prach_top.u_prach_if.PRACH_SLICE[1].u_prach_shortFormat_fftShift_prach.fftShift_d_re}           ;
            assign inst_avsts_mon_prach2_if.avsts_rx_valid    = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_prach_top.u_prach_if.PRACH_SLICE[1].u_prach_shortFormat_fftShift_prach.fftShift_v_s          ;
            assign inst_avsts_mon_prach2_if.avsts_rx_empty    = 0   ;
            assign inst_avsts_mon_prach2_if.DATA_STOP_SIZE    = 576 ;
          `endif
        `else
          assign inst_avsts_mon_prach1_if.avsts_rx_data     = {phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_prach_top.u_prach_if.PRACH_SLICE[0].u_LongPRACH_sim_prach_wrap.dout_im, phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_prach_top.u_prach_if.PRACH_SLICE[0].u_LongPRACH_sim_prach_wrap.dout_re}           ;
          assign inst_avsts_mon_prach1_if.avsts_rx_valid    = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_prach_top.u_prach_if.PRACH_SLICE[0].u_LongPRACH_sim_prach_wrap.vout_s          ;
          assign inst_avsts_mon_prach1_if.avsts_rx_empty    = 0    ;
          assign inst_avsts_mon_prach1_if.DATA_STOP_SIZE    = 3456 ;

          `ifdef NUM_CC_TWO 
            assign inst_avsts_mon_prach2_if.avsts_rx_data     = {phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_prach_top.u_prach_if.PRACH_SLICE[1].u_LongPRACH_sim_prach_wrap.dout_im, phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_prach_top.u_prach_if.PRACH_SLICE[1].u_LongPRACH_sim_prach_wrap.dout_re}           ;
            assign inst_avsts_mon_prach2_if.avsts_rx_valid    = phipps_peak_inst.lphy_ss_top_0.lphy_ss_top.lphy_ss_lphy_ss_top.u_prach_top.u_prach_if.PRACH_SLICE[1].u_LongPRACH_sim_prach_wrap.vout_s          ;
            assign inst_avsts_mon_prach2_if.avsts_rx_empty    = 0    ;
            assign inst_avsts_mon_prach2_if.DATA_STOP_SIZE    = 3456 ;
          `endif	
        `endif	
      `endif	

      `ifndef ECPRI_ORAN_SS
       //// Coupling PRACH ////
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_data     = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.prach_avst_source_data          ;
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_valid    = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.prach_avst_source_valid         ;
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_eop      = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.prach_avst_source_endofpacket   ;
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_sop      = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.prach_avst_source_startofpacket ;
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_sop      = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.prach_avst_source_startofpacket ;
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_channel  = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.prach_avst_source_channel       ;
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_ready    = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.prach_avst_source_ready         ;
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_empty    = 0                                                                                                        ; 
       // ORAN PRACH mapper checker
       assign inst_avsts_mon_oran_prach_if.avsts_rx_data     = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_data           ;
       assign inst_avsts_mon_oran_prach_if.avsts_rx_valid    = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_valid          ;
       assign inst_avsts_mon_oran_prach_if.avsts_rx_eop      = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_endofpacket    ;
       assign inst_avsts_mon_oran_prach_if.avsts_rx_sop      = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_startofpacket  ;
       assign inst_avsts_mon_oran_prach_if.avsts_rx_empty    = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_empty          ;
 
      `else

       assign inst_avsts_mon_coupling_prach_if.avsts_rx_data     = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.prach_avst_source_data          ;
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_valid    = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.prach_avst_source_valid         ;
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_eop      = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.prach_avst_source_endofpacket   ;
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_sop      = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.prach_avst_source_startofpacket ;
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_sop      = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.prach_avst_source_startofpacket ;
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_channel  = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.prach_avst_source_channel       ;
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_ready    = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.prach_avst_source_ready         ;
       assign inst_avsts_mon_coupling_prach_if.avsts_rx_empty    = 0                                                                                                        ; 
       // ORAN PRACH mapper checker
       assign inst_avsts_mon_oran_prach_if.avsts_rx_data     = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_data           ;
       assign inst_avsts_mon_oran_prach_if.avsts_rx_valid    = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_valid          ;
       assign inst_avsts_mon_oran_prach_if.avsts_rx_eop      = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_endofpacket    ;
       assign inst_avsts_mon_oran_prach_if.avsts_rx_sop      = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_startofpacket  ;
       assign inst_avsts_mon_oran_prach_if.avsts_rx_empty    = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_empty          ;
 
      `endif

      // eCPRI PRACH Mapper Checker
      assign inst_avsts_mon_ecpri_prach_if.avsts_rx_data     = ul_ecpri_data          ;
      assign inst_avsts_mon_ecpri_prach_if.avsts_rx_valid    = ul_ecpri_valid         ;
      assign inst_avsts_mon_ecpri_prach_if.avsts_rx_eop      = ul_ecpri_endofpacket   ;
      assign inst_avsts_mon_ecpri_prach_if.avsts_rx_sop      = ul_ecpri_startofpacket ;
      assign inst_avsts_mon_ecpri_prach_if.avsts_rx_empty    = ul_ecpri_empty         ;
      assign inst_avsts_mon_ecpri_prach_if.avsts_rx_ready    = ul_ecpri_ready         ;
   end


   // CU_COUPLING checker
   if (`C_U_COUPLING_EN == 1) begin
      `ifndef ECPRI_ORAN_SS
        assign inst_avsts_mon_coupling_if.avsts_rx_data     = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.pusch_avst_source_data           ;
        assign inst_avsts_mon_coupling_if.avsts_rx_valid    = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.pusch_avst_source_valid          ;
        assign inst_avsts_mon_coupling_if.avsts_rx_eop      = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.pusch_avst_source_endofpacket    ;
        assign inst_avsts_mon_coupling_if.avsts_rx_sop      = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.pusch_avst_source_startofpacket  ;
        assign inst_avsts_mon_coupling_if.avsts_rx_sop      = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.pusch_avst_source_startofpacket  ;
        assign inst_avsts_mon_coupling_if.avsts_rx_channel  = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.pusch_avst_source_channel        ;
        assign inst_avsts_mon_coupling_if.avsts_rx_ready    = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.pusch_avst_source_ready          ;
        assign inst_avsts_mon_coupling_if.avsts_rx_empty    = 0                                                                                                         ;
      `else
        assign inst_avsts_mon_coupling_if.avsts_rx_data     = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.pusch_avst_source_data           ;
        assign inst_avsts_mon_coupling_if.avsts_rx_valid    = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.pusch_avst_source_valid          ;
        assign inst_avsts_mon_coupling_if.avsts_rx_eop      = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.pusch_avst_source_endofpacket    ;
        assign inst_avsts_mon_coupling_if.avsts_rx_sop      = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.pusch_avst_source_startofpacket  ;
        assign inst_avsts_mon_coupling_if.avsts_rx_sop      = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.pusch_avst_source_startofpacket  ;
        assign inst_avsts_mon_coupling_if.avsts_rx_channel  = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.pusch_avst_source_channel        ;
        assign inst_avsts_mon_coupling_if.avsts_rx_ready    = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.pusch_avst_source_ready          ;
        assign inst_avsts_mon_coupling_if.avsts_rx_empty    = 0                                                                                                         ;
      `endif 
   end

   property coupling_pusch_fifo_full;
    `ifndef ECPRI_ORAN_SS
      @(posedge clk_eth) disable iff (!rst_eth_n) phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.status_register_1[11] == 1'b0;
    `else
      @(posedge clk_eth) disable iff (!rst_eth_n) ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.status_register_1[11] == 1'b0;
    `endif
   endproperty

   assert property (coupling_pusch_fifo_full) else $error("Error: Coupling PUSCH FIFO FULL");

   property coupling_prach_fifo_full;
    `ifndef ECPRI_ORAN_SS
      @(posedge clk_eth) disable iff (!rst_eth_n) phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.status_register_2[13] == 1'b0;
    `else
      @(posedge clk_eth) disable iff (!rst_eth_n) ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_cu_plane_coupling.status_register_2[13] == 1'b0;
    `endif
   endproperty

   assert property (coupling_prach_fifo_full) else $error("Error: Coupling PRACH FIFO FULL");


   // ORAN mapper checker
   if (`ORAN_MPR_EN == 1) begin
      `ifndef ECPRI_ORAN_SS
        assign inst_avsts_mon_oran_ul_if.avsts_rx_data     = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_data           ;
        assign inst_avsts_mon_oran_ul_if.avsts_rx_valid    = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_valid          ;
        assign inst_avsts_mon_oran_ul_if.avsts_rx_eop      = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_endofpacket    ;
        assign inst_avsts_mon_oran_ul_if.avsts_rx_sop      = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_startofpacket  ;
        assign inst_avsts_mon_oran_ul_if.avsts_rx_empty    = phipps_peak_inst.ecpri_oran_top_0.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_empty          ;
      `else
        assign inst_avsts_mon_oran_ul_if.avsts_rx_data     = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_data           ;
        assign inst_avsts_mon_oran_ul_if.avsts_rx_valid    = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_valid          ;
        assign inst_avsts_mon_oran_ul_if.avsts_rx_eop      = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_endofpacket    ;
        assign inst_avsts_mon_oran_ul_if.avsts_rx_sop      = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_startofpacket  ;
        assign inst_avsts_mon_oran_ul_if.avsts_rx_empty    = ecpri_oran_top_inst.ecpri_oran_0.ecpri_oran_0.u_oran_wrapper.avst_source_empty          ;
      `endif
   end

   // eCPRI mapper checker
   if (`ECPRI_MPR_EN == 1) begin
      assign inst_avsts_mon_ecpri_ul_if.avsts_rx_data     = ul_ecpri_data          ;
      assign inst_avsts_mon_ecpri_ul_if.avsts_rx_valid    = ul_ecpri_valid         ;
      assign inst_avsts_mon_ecpri_ul_if.avsts_rx_eop      = ul_ecpri_endofpacket   ;
      assign inst_avsts_mon_ecpri_ul_if.avsts_rx_sop      = ul_ecpri_startofpacket ;
      assign inst_avsts_mon_ecpri_ul_if.avsts_rx_empty    = ul_ecpri_empty         ;
      assign inst_avsts_mon_ecpri_ul_if.avsts_rx_ready    = ul_ecpri_ready         ;
   end
  
 
   initial begin
      uvm_config_db #(virtual avmm_if)::set(null,"*m_env.m_avstmm_env[0]*","avmm_if",inst_avstmm_if);
   end

   // Register IF to UVM Factory

   initial begin 

     //Instantiate o_ru_CONFIG object

     m_config = new(.name("m_config"), .parent(null));
     m_ip_config = new(.name("m_ip_config"));
     m_cmp       = new(.name("m_cmp"),.parent(null));
     sec_cnt_t                  = 0 ;             
     nsec_cnt_t                 = 0 ;
     frac_nsec_cnt_t            = 0 ;
     even_axc                   = 0 ;
     odd_axc                    = 0 ;

     m_config.o_ru_clk_vif[0]      = inst_clk_if_gen[0].inst_clk_if;
     m_config.o_ru_clk0_vif        = inst_clk_if_gen[0].inst_clk_if;
     m_config.o_ru_clk1_vif        = inst_clk_if_gen[1].inst_clk_if;
     m_config.o_ru_clk2_vif        = inst_clk_if_gen[2].inst_clk_if;
     m_config.o_ru_clk3_vif        = inst_clk_if_gen[3].inst_clk_if;
     void'(uvm_config_db #(o_ru_config)::set(uvm_root::get(),"*", "o_ru_config", m_config));
 
     // Run the all phases
     run_test();
   end

endmodule     
