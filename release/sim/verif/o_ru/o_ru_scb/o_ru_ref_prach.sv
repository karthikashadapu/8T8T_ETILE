/* ******************************************************************************************************************
 INTEL CONFIDENTIAL
 Copyright 2023 Intel Corporation All Rights Reserved.
 The source code contained or described herein and all documents related to the
 source code ("Material") are owned by Intel Corporation or its suppliers or
 licensors. Title to the Material remains with Intel Corporation or its
 suppliers and licensors. The Material may contain trade secrets and proprietary
 and confidential information of Intel Corporation and its suppliers and
 licensors, and is protected by worldwide copyright and trade secret laws and
 treaty provisions. No part of the Material may be used, copied, reproprached,
 modified, published, uploaded, posted, transmitted, distributed, or disclosed
 in any way without Intels prior express written permission.
 No license under any patent, copyright, trade secret or other intellectual
 property right is granted to or conferred upon you by disclosure or delivery
 of the Materials, either expressly, by implication, inprachement, estoppel or
 otherwise. Any license under such intellectual property rights must be
 express and approved by Intel in writing.
 Unless otherwise agreed by Intel in writing, you may not remove or alter this
 notice or any other notice embedded in Materials by Intel or Intels suppliers
 or licensors in any way.
****************************************************************************************************************** */


`ifndef O_RU_REF_PRACH_SV 
`define O_RU_REF_PRACH_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_prach
//------------------------------------------------------------------------------ 


class o_ru_ref_prach extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_prach) 
  
  int file[2];
  int len_counter,counter;
  int pkt_cnt;
  int axc_count,sym_cnt;

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
   extern virtual task          prach_read(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config,int num);

endclass: o_ru_ref_prach
   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_prach::build_phase(uvm_phase phase);
     super.build_phase(phase);
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_prach::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_prach::run_phase(uvm_phase phase);
      fork
	 begin 
         forever 
         begin
            m_item_inp = new();
            m_item     = new();
            ref_item   = new();
            m_fifo[0].get(m_item_inp);
	    $cast(m_item,m_item_inp);
	    if (counter == 0 ) begin
              `ifdef SHORT_PRACH_FORMAT
                 file[0] = $fopen(`PRACH_OUT_SHORT_LINEUP1_EXP, "r");                               // PRACH Lineup1 shortformat output expected file read  
                 file[1] = $fopen(`PRACH_OUT_SHORT_LINEUP2_EXP, "r");                               // PRACH Lineup1 shortformat output expected file read                                          
	      `else 
                 file[0] = $fopen(`PRACH_OUT_LINEUP1_EXP, "r");                                       // PRACH Lineup1 output expected file read  
                 file[1] = $fopen(`PRACH_OUT_LINEUP2_EXP, "r");                                       // PRACH Lineup1 output expected file read  
              `endif
            end
            counter = counter + 1;
            ref_item.buf_packet_out = new[m_item.buf_packet_out.size] (m_item.buf_packet_out) ;
            for(int i =0 ; i<2 ;i++) begin
              prach_read(ref_item,m_config,i); 
            end
         end	
       end                                          // Fork
      join_none
  endtask : run_phase



  task o_ru_ref_prach::prach_read(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config,int num);
     int j;
     int exp_lines,data_len ;
     longint size ;
     longint lines;
     o_ru_ref_avsts_item pkt_tmp;
     pkt_tmp = new() ;
     
     j = num ;
     pkt_cnt = pkt_cnt + 1 ;
     `ifdef SHORT_PRACH_FORMAT
       data_len = 576;
       if(pkt_cnt % 96 == 0) counter = 0;  
     `else
       data_len = 3456;
       if(pkt_cnt % 8 == 0) counter = 0;  
     `endif
     lines = data_len / 4 ;
     size = data_len ;
     file_read(file[j],size,lines,pkt.buf_packet_out);
     pkt_tmp.buf_packet_out = pkt.buf_packet_out ;
     $cast(m_item, pkt_tmp);
     if((j == 0 && m_config.cc1_dis == 0) || (j == 1 && m_config.cc2_dis == 0)) begin
       `uvm_info("PRACH", $sformatf("PRACH exp_output(1st 8bytes) : %0h AXC %0d", {pkt.buf_packet_out[0],pkt.buf_packet_out[1],pkt.buf_packet_out[2],pkt.buf_packet_out[3],pkt.buf_packet_out[4],pkt.buf_packet_out[5],pkt.buf_packet_out[6],pkt.buf_packet_out[7],pkt.buf_packet_out[8],pkt.buf_packet_out[9],pkt.buf_packet_out[10],pkt.buf_packet_out[11],pkt.buf_packet_out[12],pkt.buf_packet_out[13],pkt.buf_packet_out[14],pkt.buf_packet_out[15],pkt.buf_packet_out[16],pkt.buf_packet_out[17],pkt.buf_packet_out[18],pkt.buf_packet_out[19],pkt.buf_packet_out[20],pkt.buf_packet_out[21],pkt.buf_packet_out[22],pkt.buf_packet_out[23],pkt.buf_packet_out[24]},num), UVM_HIGH);           // Displaying first 8 bytes (64 bits) of ORAN demapper output
        m_output[j].write(m_item);                                                              // Writing to scoreboard
     end
  endtask : prach_read

 `endif 
