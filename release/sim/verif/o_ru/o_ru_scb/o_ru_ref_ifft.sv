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

`ifndef O_RU_REF_IFFT_SV 
`define O_RU_REF_IFFT_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_ifft
//------------------------------------------------------------------------------ 


class o_ru_ref_ifft extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_ifft) 
 
  o_ru_ref_avsts_item ref_item; 
  o_ru_ref_avsts_item m_item;
  avsts_item m_item_inp; 

  int axc_count,sym_count[2],out_trig_counter,pkt_cnt[2] ; 
  int file[2];
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
extern virtual task          ifft_c(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_cfg,int num);
extern virtual task          ifft_file(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_cfg,int num); 
endclass: o_ru_ref_ifft

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_ifft::build_phase(uvm_phase phase);
     super.build_phase(phase);
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_ifft::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_ifft::run_phase(uvm_phase phase);
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
               if(counter == 0 ) begin
                  if (m_config.mixed_mode == 2'd1) begin
                     file[0] = $fopen(`IFFT_OUT_LINEUP1_MIXED_100_60_EXP, "r");                    // IFFT Lineup1 Mixed 100+60 output expected file read
                     file[1] = $fopen(`IFFT_OUT_LINEUP2_MIXED_100_60_EXP, "r");                    // IFFT Lineup2 Mixed 100+60 output expected file read
                  end else if (m_config.mixed_mode == 2'd2) begin
                     file[0] = $fopen(`IFFT_OUT_LINEUP1_MIXED_60_100_EXP, "r");                    // IFFT Lineup1 Mixed 60+100 output expected file read
                     file[1] = $fopen(`IFFT_OUT_LINEUP2_MIXED_60_100_EXP, "r");                    // IFFT Lineup2 Mixed 60+100 output expected file read
                  end else begin 
                     if(m_config.cc1_bw == 7'ha) begin
                        if (m_config.phase_comp_en1 == 1'b1)
	                  file[0] = $fopen(`IFFT_OUT_LINEUP1_PHASECOMP_60_EXP, "r");               // IFFT Lineup1 Phase Compensation output expected file read
                        else if (m_config.blanking == 2'd1)
                          file[0] = $fopen(`IFFT_OUT_LINEUP1_PRB_BLANK_60_EXP, "r");               // IFFT Lineup1 60MHz PRB blanking output expected file read
                        else 
                          file[0] = $fopen(`IFFT_OUT_LINEUP1_60_EXP, "r");                         // IFFT Lineup1 60MHz output expected file read
                     end else begin
                        if (m_config.phase_comp_en1 == 1'b1)
	                  file[0] = $fopen(`IFFT_OUT_LINEUP1_PHASECOMP_EXP, "r");                  // IFFT Lineup1 Phase Compensation output expected file read
                        else if (m_config.delay_testing == 1'b1)
                          file[0] = $fopen(`IFFT_OUT_LINEUP1_DELAY_EXP,"r");
		        else if (m_config.blanking == 1)
                          file[0] = $fopen(`IFFT_OUT_LINEUP1_PRB_BLANK_EXP, "r");                  // IFFT Lineup1 100MHz PRB blanking output expected file read
		        else if (m_config.blanking == 2)
                          file[0] = $fopen(`IFFT_OUT_LINEUP1_1_AXC_BLANK_EXP, "r");                // IFFT Lineup1 100MHz 1 AXC blanking output expected file read
		        else if (m_config.blanking == 3)
                          file[0] = $fopen(`IFFT_OUT_LINEUP1_SYM_BLANK_EXP, "r");                  // IFFT Lineup1 100MHz SYM blanking output expected file read
		        else if (m_config.blanking == 4)
                          file[0] = $fopen(`IFFT_OUT_LINEUP1_SYM_AXC_BLANK_EXP, "r");              // IFFT Lineup1 100MHz SYM AXC blanking output expected file read
		        else if (m_config.blanking == 6)
                          file[0] = $fopen(`IFFT_OUT_LINEUP1_SYM_AXC_PRB_BLANK_EXP, "r");          // IFFT Lineup1 100MHz SYM AXC PRB blanking output expected file read
		        else if (m_config.multi_sec == 1)
                          file[0] = $fopen(`IFFT_OUT_LINEUP1_MULTI_SEC_EXP, "r");                  // IFFT Lineup1 100MHz Multi Section output expected file read
                        else if (m_config.cc2_dis == 1)
                          file[0] = $fopen(`IFFT_OUT_LINEUP1_CC2_DIS_EXP, "r");                    // IFFT Lineup1 100MHz CC2 Disable output expected file read 
		        else
                          file[0] = $fopen(`IFFT_OUT_LINEUP1_EXP, "r");                            // IFFT Lineup1 output expected file read
                     end
                     if(m_config.cc2_bw == 7'ha) begin
		        if(m_config.phase_comp_en2 == 1'b1)				  
		          file[1] = $fopen(`IFFT_OUT_LINEUP2_PHASECOMP_60_EXP, "r");               // IFFT Lineup2 Phase Compensation output expected file read 
                        else if (m_config.blanking == 2'd1)
                          file[1] = $fopen(`IFFT_OUT_LINEUP2_PRB_BLANK_60_EXP, "r");               // IFFT Lineup2 60MHz PRB blanking output expected file read
                        else
                          file[1] = $fopen(`IFFT_OUT_LINEUP2_60_EXP, "r");                         // IFFT Lineup2 60MHz output expected file read
                     end else begin
		        if (m_config.phase_comp_en2 == 1'b1)				  
		          file[1] = $fopen(`IFFT_OUT_LINEUP2_PHASECOMP_EXP, "r");                  // IFFT Lineup2 Phase Compensation output expected file read 
                        else if (m_config.delay_testing == 1'b1)
                          file[1] = $fopen(`IFFT_OUT_LINEUP2_DELAY_EXP,"r");
                        else if (m_config.blanking == 2'd1)
                          file[1] = $fopen(`IFFT_OUT_LINEUP2_PRB_BLANK_EXP, "r");                  // IFFT Lineup2 100MHz PRB blanking output expected file read
                        else if (m_config.blanking == 2'd2)
                          file[1] = $fopen(`IFFT_OUT_LINEUP2_1_AXC_BLANK_EXP, "r");                // IFFT Lineup2 100MHz 1 AXC blanking output expected file read
		        else
                          file[1] = $fopen(`IFFT_OUT_LINEUP2_EXP, "r");                            // IFFT Lineup2 output expected file read 
                     end
                  end
               end
               counter = counter + 1;
               ref_item.buf_packet_out = new[m_item.buf_packet_out.size] (m_item.buf_packet_out) ;
               if(`FILE_BASED == 0 && m_config.phase_comp_en2 != 1 && m_config.phase_comp_en1 != 1) 
                ifft_c(ref_item,m_config,scb_num);
               else
                ifft_file(ref_item,m_config,scb_num);
             end	
          end  // Fork
       join_none
     end
endtask : run_phase

task o_ru_ref_ifft::ifft_c(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_cfg,int num);

   byte unsigned pkt_arr[] ;
   int pkt_prb ;
   byte unsigned prb_arr[] ;
   int cnt ;
   int num_sym ;
   bit[15:0] buf16[] ;
   bit [127:0] swap_arr [] ;
   bit [127:0] swap_arr_swap [] ;
   byte unsigned buf8[] ;
   o_ru_ref_avsts_item pkt_tmp;
   pkt_tmp = new() ;

   if(m_cfg.cc1_bw == 7'ha || m_cfg.cc2_bw == 7'ha) begin
     if(m_cfg.cc1_bw == 7'ha && num == 0) begin 
       pkt_prb = 162  ;
     end
     else if(m_cfg.cc2_bw == 7'ha && num == 1) begin 
       pkt_prb = 162  ;
     end
     else begin 
       pkt_prb = 273  ;
     end
   end else begin
     pkt_prb = 273  ;
   end
   
   if(sym_count[num] == 14 ) sym_count[num] = 0;

   data_param_arr_ifft[0] = sym_count[num];   /// Symbol Count 
   data_param_arr_ifft[1] = 4096;             /// Samples
   data_param_arr_ifft[2] = pkt_prb;          /// PRB
   data_param_arr_ifft[3] = 1;                /// MU
   data_param_arr_ifft[4] = 0;                /// CP Enable / Disable
   data_param_arr_phase_comp[0] = pkt_prb;   /// PRB for Phase Comp
   data_param_arr_phase_comp[1] = 0  ;    /// 0 - RX 1 - TX

   prb_arr = new[13104] (pkt.buf_packet_out);
   pkt_arr = new[16384];         /// 4096 Samples
   buf8 = new[pkt.buf_packet_out.size] ;
   phase_compensation(data_param_arr_phase_comp,prb_arr,buf8);
   ifft(data_param_arr_ifft,buf8,pkt_arr);
   pkt.buf_packet_out = new[pkt_arr.size](pkt_arr) ;
   pkt_tmp.buf_packet_out = pkt.buf_packet_out ;
   if((num == 0 && m_config.cc1_dis == 1) || (num == 1 && m_config.cc2_dis == 1))
     pkt_tmp.buf_packet_out = new[pkt.buf_packet_out.size];
   $cast(m_item, pkt_tmp);
   `uvm_info("IFFT", $sformatf("IFFT exp_output(1st 8bytes) : %0h AXC_COUNT %0d", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7]},num), UVM_HIGH);                  // Displaying first 8 bytes (64 bits) of FDV demapper output
   m_output[num].write(m_item);                                                            // Writing to scoreboard
   pkt_cnt[num] = pkt_cnt[num] + 1 ;
   if(pkt_cnt[num] % 4 == 0) 
     sym_count[num] = sym_count[num] + 1 ;
   else   
     sym_count[num] = sym_count[num] ;
endtask : ifft_c

task o_ru_ref_ifft::ifft_file(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_cfg,int num);
   int j;
   int exp_lines,data_len ;
   longint size ;
   longint lines;
   o_ru_ref_avsts_item pkt_tmp;
   pkt_tmp = new() ;

   j = num ;
   data_len = 16384;
   lines = data_len / 4 ;
   size = data_len ;
   file_read(file[j],size,lines,pkt.buf_packet_out);
   pkt_tmp.buf_packet_out = pkt.buf_packet_out ;
   if((j == 0 && m_config.cc1_dis == 0) || (j == 1 && m_config.cc2_dis == 0)) begin
     //pkt_tmp.buf_packet_out = new[pkt.buf_packet_out.size];
     $cast(m_item, pkt_tmp);
     `uvm_info("IFFT", $sformatf("IFFT exp_output(1st 8bytes) : %0h AXC_COUNT %0d", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7]},num), UVM_HIGH);                  // Displaying first 8 bytes (64 bits) of FDV demapper output
     m_output[j].write(m_item);                                                            // Writing to scoreboard
   end
endtask : ifft_file
`endif 
