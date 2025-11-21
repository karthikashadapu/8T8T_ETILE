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

`ifndef O_RU_REF_FFT_SV 
`define O_RU_REF_FFT_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_fft
//------------------------------------------------------------------------------ 

class o_ru_ref_fft extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_fft) 
 
  o_ru_ref_avsts_item ref_item; 
  o_ru_ref_avsts_item m_item;
  avsts_item m_item_inp; 

  int file[2],sym_count[2],pkt_cnt[2];
  int counter;
   //------------------------------------------------------------------------------ 
   // Constructor 
   //------------------------------------------------------------------------------ 
   function new (string name, uvm_component parent); 
      super.new(name, parent);
   endfunction : new 

extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);
extern virtual task          run_phase(uvm_phase phase);
extern virtual task          fft_file(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_cfg,int num); 
extern virtual task          fft_c(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_cfg,int num); 
endclass: o_ru_ref_fft

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_fft::build_phase(uvm_phase phase);
     super.build_phase(phase);
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_fft::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_fft::run_phase(uvm_phase phase);
    for(int i=0 ;i<2;i++) begin 
	 fork
	    int scb_num = i ;
        begin 
           forever 
           begin
              m_item_inp  = new();
              m_item      = new();
              ref_item    = new() ;
              m_fifo[scb_num].get(m_item_inp);
              $cast(m_item,m_item_inp);
              if (counter == 0 ) begin
                if (m_config.mixed_mode == 2'd1) begin
                   file[0] = $fopen(`FFT_OUT_LINEUP1_MIXED_100_60_EXP, "r");                          // FFT Lineup1 Mixed 100+60 output expected file read
                   file[1] = $fopen(`FFT_OUT_LINEUP2_MIXED_100_60_EXP, "r");                          // FFT Lineup2 Mixed 100+60 output expected file read
                end else if (m_config.mixed_mode == 2'd2) begin
                   file[0] = $fopen(`FFT_OUT_LINEUP1_MIXED_60_100_EXP, "r");                          // FFT Lineup1 Mixed 60+100 output expected file read
                   file[1] = $fopen(`FFT_OUT_LINEUP2_MIXED_60_100_EXP, "r");                          // FFT Lineup2 Mixed 60+100 output expected file read
                end else begin 
                   if(`IFFT_FFT_LPBK_EN == 1) begin
                     if(m_config.cc1_bw == 7'ha) begin
                        if (m_config.blanking == 2'd1)
                           file[0] = $fopen(`FFT_OUT_LINEUP1_PRB_BLANK_60_EXP, "r");                  // FFT Lineup1 60MHz PRB Blanking output expected file read
                        else 
                     	   file[0] = $fopen(`IFFT_FFT_LPBK_FFT_OUT_LINEUP1_60_EXP, "r");              // IFFT-FFT Loopback FFT Lineup1 60MHz output expected file read
                     end else begin
                        if (m_config.blanking == 1)
                           file[0] = $fopen(`FFT_OUT_LINEUP1_PRB_BLANK_EXP, "r");                     // FFT Lineup1 100MHz PRB Blanking output expected file read 
                        else if (m_config.blanking == 2)
                           file[0] = $fopen(`FFT_OUT_LINEUP1_1_AXC_BLANK_EXP, "r");                   // FFT Lineup1 100MHz 1 AXC Blanking output expected file read 
                        else if (m_config.blanking == 3)
                           file[0] = $fopen(`FFT_OUT_LINEUP1_SYM_BLANK_EXP, "r");                     // FFT Lineup1 100MHz SYM Blanking output expected file read 
                        else if (m_config.blanking == 4)
                           file[0] = $fopen(`FFT_OUT_LINEUP1_SYM_AXC_BLANK_EXP, "r");                 // FFT Lineup1 100MHz SYM AXC Blanking output expected file read 
                        else if (m_config.blanking == 6)
                           file[0] = $fopen(`FFT_OUT_LINEUP1_SYM_AXC_PRB_BLANK_EXP, "r");                 // FFT Lineup1 100MHz SYM AXC PRB Blanking output expected file read 
		        else if (m_config.multi_sec == 1)
                           file[0] = $fopen(`FFT_OUT_LINEUP1_MULTI_SEC_EXP, "r");                     // FFT Lineup1 100MHz Multi Section output expected file read
                        else
                     	   file[0] = $fopen(`IFFT_FFT_LPBK_FFT_OUT_LINEUP1_EXP, "r");                 // IFFT-FFT Loopback FFT Lineup1 100MHz output expected file read
                     end 
                     if(m_config.cc2_bw == 7'ha) begin
                        if (m_config.blanking == 2'd1)
                           file[1] = $fopen(`FFT_OUT_LINEUP2_PRB_BLANK_60_EXP, "r");                  // FFT Lineup2 60MHz PRB Blanking output expected file read 
                        else
                           file[1] = $fopen(`IFFT_FFT_LPBK_FFT_OUT_LINEUP2_60_EXP, "r");              // IFFT-FFT Loopback FFT Lineup2 60MHz output expected file read
                     end else begin
                        if (m_config.blanking == 2'd1)
                           file[1] = $fopen(`FFT_OUT_LINEUP2_PRB_BLANK_EXP, "r");                     // FFT Lineup2 100MHz PRB Blanking output expected file read 
                        else if (m_config.blanking == 2'd2)
                           file[1] = $fopen(`FFT_OUT_LINEUP2_1_AXC_BLANK_EXP, "r");                   // FFT Lineup2 100MHz 1 AXC Blanking output expected file read 
                        else
                           file[1] = $fopen(`IFFT_FFT_LPBK_FFT_OUT_LINEUP2_EXP, "r");                 // IFFT-FFT Loopback FFT Lineup2 100MHz output expected file read 
                     end
                  end else begin
                     if(m_config.cc1_bw == 7'ha) begin
                        if (m_config.cc2_dis == 1)
                           file[0] = $fopen(`FFT_OUT_LINEUP1_CC2_DIS_60_EXP, "r");                    // FFT Lineup1 60MHz CC2 Disable output expected file read 
                        else
                           file[0] = $fopen(`FFT_OUT_LINEUP1_60_EXP, "r");                            // FFT Lineup1 60MHz output expected file read 
                     end else begin
                        if (m_config.delay_testing == 1'd1)
                           file[0] = $fopen(`FFT_OUT_LINEUP1_DELAY_EXP, "r");
                        else if (m_config.cc2_dis == 1)
                           file[0] = $fopen(`FFT_OUT_LINEUP1_CC2_DIS_EXP, "r");                       // FFT Lineup1 100MHz CC2 Disable output expected file read 
                        else
                           file[0] = $fopen(`FFT_OUT_LINEUP1_EXP, "r");                               // FFT Lineup1 100MHz output expected file read 
                     end
                     if(m_config.cc2_bw == 7'ha) begin
                        file[1] = $fopen(`FFT_OUT_LINEUP2_60_EXP, "r");                               // FFT Lineup2 60MHz output expected file read
                     end else begin
                        if (m_config.delay_testing == 1'd1)
                           file[1] = $fopen(`FFT_OUT_LINEUP2_DELAY_EXP, "r");
                        else
                           file[1] = $fopen(`FFT_OUT_LINEUP2_EXP, "r");                               // FFT Lineup2 100MHz output expected file read 
                     end
                  end
                end
              end             
              counter = counter + 1;
              ref_item.buf_packet_out = new[m_item.buf_packet_out.size] (m_item.buf_packet_out) ;
              if(`FILE_BASED == 0)
                fft_c(ref_item,m_config,scb_num);
              else 
                fft_file(ref_item,m_config,scb_num);
           end	
        end  // Fork
     join_none
   end
endtask : run_phase

task o_ru_ref_fft::fft_c(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_cfg,int num);
   int j;
   int pkt_prb ;
   int exp_lines,data_len ;
   byte unsigned prb_arr[] ;
   byte unsigned buf8[] ;
   shortint buf16[];
   o_ru_ref_avsts_item pkt_tmp;
   pkt_tmp = new() ;

   j = num ;

     if(m_cfg.cc1_bw == 7'ha && num == 0) begin 
       pkt_prb = 162  ;
     end
     else if(m_cfg.cc2_bw == 7'ha && num == 1) begin 
       pkt_prb = 162  ;
     end
     else begin 
       pkt_prb = 273  ;
     end

   if(sym_count[num] == 14 ) sym_count[num] = 0;
   data_param_arr_ifft[0] = sym_count[num];   /// Symbol Count 
   data_param_arr_ifft[1] = 4096;             /// Samples
   data_param_arr_ifft[2] = pkt_prb;          /// PRB
   data_param_arr_ifft[3] = 1;                /// MU
   data_param_arr_ifft[4] = 0;                /// CP Enable / Disable
   data_param_arr_phase_comp[0] = pkt_prb;   /// PRB for Phase Comp
   data_param_arr_phase_comp[1] = 1  ;    /// 0- RX 1 - TX
   prb_arr = new[pkt_prb * 48] ;
   fft(data_param_arr_ifft,pkt.buf_packet_out,prb_arr);
   buf8 = new[pkt_prb * 48];
   phase_compensation_fft(data_param_arr_phase_comp,prb_arr,buf8);
   buf8 = new[pkt_prb * 48](buf8);
   pkt.buf_packet_out = new[buf8.size] (buf8) ;
   buf16 = {>>{pkt.buf_packet_out}};
   foreach(buf16[i]) begin
     buf16[i] = buf16[i] / 2 ;
   end
   {>> 8 {pkt.buf_packet_out}} = buf16 ;
   pkt_tmp.buf_packet_out = pkt.buf_packet_out ;
   $cast(m_item, pkt_tmp);
   if((j == 0 && m_config.cc1_dis == 1) || (j == 1 && m_config.cc2_dis == 1))
     pkt_tmp.buf_packet_out = new[pkt.buf_packet_out.size];
   `uvm_info("FFT", $sformatf("FFT exp_output(1st 8bytes) : %0h AXC %0d", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7],m_item.buf_packet_out[8],m_item.buf_packet_out[9],m_item.buf_packet_out[10],m_item.buf_packet_out[11],m_item.buf_packet_out[12],m_item.buf_packet_out[13],m_item.buf_packet_out[14],m_item.buf_packet_out[15]},num), UVM_HIGH);                      // Displaying first 8 bytes (64 bits) of FFT output
   m_output[j].write(m_item);                                                         // Writing to scoreboard
   pkt_cnt[num] = pkt_cnt[num] + 1 ;
   if(pkt_cnt[num] % 4 == 0) 
     sym_count[num] = sym_count[num] + 1 ;
   else   
     sym_count[num] = sym_count[num] ;
  
endtask : fft_c

task o_ru_ref_fft::fft_file(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_cfg,int num);
   int j;
   int pkt_prb ;
   int exp_lines,data_len ;
   longint size ;
   longint lines;
   o_ru_ref_avsts_item pkt_tmp;
   pkt_tmp = new() ;

   j = num ;

     if(m_cfg.cc1_bw == 7'ha && num == 0) begin 
       pkt_prb = 162  ;
     end
     else if(m_cfg.cc2_bw == 7'ha && num == 1) begin 
       pkt_prb = 162  ;
     end
     else begin 
       pkt_prb = 273  ;
     end

   data_len = (pkt_prb * 48)/4;
   lines = data_len ;
   size = data_len * 4;
   file_read(file[j],size,lines,pkt.buf_packet_out);
   pkt_tmp.buf_packet_out = pkt.buf_packet_out ;
   if(sym_count[num] == 14 ) sym_count[num] = 0;
   pkt_tmp.symbol_number = sym_count[num];
   $cast(m_item, pkt_tmp);
   if((j == 0 && m_config.cc1_dis == 1) || (j == 1 && m_config.cc2_dis == 1))
     pkt_tmp.buf_packet_out = new[pkt.buf_packet_out.size];
   `uvm_info("FFT", $sformatf("FFT exp_output(1st 8bytes) : %0h", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7],m_item.buf_packet_out[8],m_item.buf_packet_out[9],m_item.buf_packet_out[10],m_item.buf_packet_out[11],m_item.buf_packet_out[12],m_item.buf_packet_out[13],m_item.buf_packet_out[14],m_item.buf_packet_out[15]}), UVM_HIGH);                      // Displaying first 8 bytes (64 bits) of FFT output
   m_output[j].write(m_item);                                                         // Writing to scoreboard
   pkt_cnt[num] = pkt_cnt[num] + 1 ;
   if(pkt_cnt[num] % 4 == 0) 
     sym_count[num] = sym_count[num] + 1 ;
   else   
     sym_count[num] = sym_count[num] ;
  
endtask : fft_file
`endif 
