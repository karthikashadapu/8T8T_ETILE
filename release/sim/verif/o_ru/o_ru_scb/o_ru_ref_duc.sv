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


`ifndef O_RU_REF_DUC_SV 
`define O_RU_REF_DUC_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_duc
//------------------------------------------------------------------------------ 


class o_ru_ref_duc extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_duc) 
  
  int file[2];
  longint counter;
  int sym_count[2];
  int pkt_cnt[2] ; 

  o_ru_ref_avsts_item ref_item; 
  o_ru_ref_avsts_item m_item; 
  avsts_item m_item_inp;
  
   //------------------------------------------------------------------------------ 
   // Constructor 
   //------------------------------------------------------------------------------ 
   function new (string name, uvm_component parent); 
      super.new(name, parent);
   endfunction : new 

   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task          run_phase(uvm_phase phase);
   extern virtual task          duc_read(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config,int num);

endclass: o_ru_ref_duc
   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_duc::build_phase(uvm_phase phase);
     super.build_phase(phase);
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_duc::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_duc::run_phase(uvm_phase phase);
    for(int i=0 ;i<2;i++) begin
       fork
       int scb_num = i ;
       begin 
          forever 
          begin
             m_item_inp = new();
             m_item     = new();
             ref_item   = new();
             m_fifo[scb_num].get(m_item_inp);
             if (counter == 0 ) begin
                if (m_config.mixed_mode == 2'd1) begin
                  file[0] = $fopen(`DUC_OUT_LINEUP1_MIXED_100_60_EXP, "r");                            // DUC Lineup1 Mixed 100+60 output expected file read    
                  file[1] = $fopen(`DUC_OUT_LINEUP2_MIXED_100_60_EXP, "r");                            // DUC Lineup2 Mixed 100+60 output expected file read
                end else begin
                   if(m_config.cc1_bw == 7'ha)
                      file[0] = $fopen(`DUC_OUT_LINEUP1_60_EXP, "r");                                  //DUC Lineup1 output expected file read
                   else
                   begin
                      if (m_config.delay_testing == 1'd1)
                         file[0] = $fopen(`DUC_OUT_LINEUP1_DELAY_EXP, "r"); 
                      else if (m_config.cc2_dis == 1)
                         file[0] = $fopen(`DUC_OUT_LINEUP1_CC2_DIS_EXP, "r");                          // DUC Lineup1 100MHz CC2 Disable output expected file read 
                      else
                         file[0] = $fopen(`DUC_OUT_LINEUP1_EXP, "r");                                  // DUC Lineup1 output expected file read 
                   end
 
                   if(m_config.cc2_bw == 7'ha)
                     file[1] = $fopen(`DUC_OUT_LINEUP2_60_EXP, "r");                                   // DUC Lineup2 output expected file read
                   else
                   begin
                      if (m_config.delay_testing == 1'd1)
                         file[1] = $fopen(`DUC_OUT_LINEUP2_DELAY_EXP, "r");      
                      else 
                         file[1] = $fopen(`DUC_OUT_LINEUP2_EXP, "r");                                  // DUC Lineup2 output expected file read
                   end
                end
             end 
             counter = counter + 1;
             $cast(m_item,m_item_inp);
             ref_item.buf_packet_out = new[m_item.buf_packet_out.size] (m_item.buf_packet_out) ;
             duc_read(ref_item,m_config,scb_num); 
          end	
       end                                          // Fork
       join_none
     end
  endtask : run_phase



  task o_ru_ref_duc::duc_read(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config,int num);
     int j,data_len ;
     longint size ;
     longint lines;
     o_ru_ref_avsts_item pkt_tmp;
     pkt_tmp = new() ;

     j = num ;
     if((sym_count[num] == 0) && pkt_cnt[num] == 0) begin
       data_len = 19136;
     end else if((sym_count[num] == 0) || (sym_count[num] % 14 == 0)) begin
       data_len = 17792;
     end else begin
       data_len = 17536;
     end 
     lines = data_len ;
     size = data_len * 4;
     file_read(file[j],size,lines,pkt.buf_packet_out);
     pkt_tmp.buf_packet_out = pkt.buf_packet_out ;
     $cast(m_item, pkt_tmp);
     `uvm_info("DUC", $sformatf("DUC exp_output(1st 8bytes) : %0h", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7]}), UVM_HIGH);                  // Displaying first 8 bytes (64 bits) of DUC output
     m_output[j].write(m_item);                                                          // Writing to scoreboard
     pkt_cnt[num] = pkt_cnt[num] + 1 ;
     if(pkt_cnt[num] % 4 == 0) 
       sym_count[num] = sym_count[num] + 1 ;
     else   
       sym_count[num] = sym_count[num] ;
 
  endtask


`endif 
