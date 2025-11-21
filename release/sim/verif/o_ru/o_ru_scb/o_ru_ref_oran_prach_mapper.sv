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

`ifndef O_RU_REF_ORAN_PRACH_MAPPER_SV 
`define O_RU_REF_ORAN_PRACH_MAPPER_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_oran_prach_mapper
//------------------------------------------------------------------------------ 


class o_ru_ref_oran_prach_mapper extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_oran_prach_mapper) 
  int pkt_cnt ; 
  int c_pkt_cnt ; 
  o_ru_ref_avsts_item ref_item; 
  o_ru_ref_avsts_item m_item;
  avsts_item m_item_inp; 
  bit[7:0] swap_array[8][];   
  int out_trig_counter, axc_count=0;
  int local_pkt_counter;
  int counter;
  bit[3:0] subframe_id ;
  bit[6:0] slot_id ;
  bit[5:0] symbol_id ;
  bit[5:0] symbol_prach ;

  shortint pc_id_cnt=0,seq_id_cnt=0;
  shortint pc_id_cnt_prach=8,seq_id_cnt_prach=0;
  bit[3:0] sf_cnt_prach=0 ;
   //------------------------------------------------------------------------------ 
   // Constructor 
   //------------------------------------------------------------------------------ 
   function new (string name, uvm_component parent); 
      super.new(name, parent);
   endfunction : new 

extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);
extern virtual task          run_phase(uvm_phase phase);
extern virtual task          oran_header_add_prach(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);

endclass: o_ru_ref_oran_prach_mapper 

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_oran_prach_mapper::build_phase(uvm_phase phase);
     super.build_phase(phase);
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_oran_prach_mapper::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_oran_prach_mapper::run_phase(uvm_phase phase);
     fork
        begin 
           forever 
           begin
              m_item_inp  = new();
              m_item      = new();
              ref_item    = new() ;
              m_fifo[0].get(m_item_inp);
              $cast(m_item,m_item_inp);
              ref_item.buf_packet_out = new[m_item.buf_packet_out.size] (m_item.buf_packet_out) ;
              ref_item.rx_data_q = ref_item.buf_packet_out;
              ref_item.prach_pkt = m_item.prach_pkt ;
              `uvm_info("ORAN hdr mpr", $psprintf("ORAN HEADER ADDITION ENTRY PRACH : %0d",ref_item.prach_pkt), UVM_HIGH);
              oran_header_add_prach(ref_item,m_config); 
	   end	
        end  // Fork
     join_none
  endtask : run_phase

// -----------------------------------------------------------------------------------
// HEADER INSERTION
// -----------------------------------------------------------------------------------

// ----------------------------
// Oran Header insertion
// ----------------------------

// ---------------------------------------
// |   ORAN header    |     IQ data      |
// ---------------------------------------

task o_ru_ref_oran_prach_mapper::oran_header_add_prach(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);
    byte unsigned array[];
    byte unsigned frag_array[];
    int arr_size,n,sec_cnt,payload_size,pkt_prb,prb_start = 0,bal_prb,bytes_cnt,prb_count,count=0,tot_bytes_cnt;
    bit [127:0] swap_arr [] ;
    bit [127:0] swap_arr_swap [] ;
  
    {>>{swap_arr}}    = pkt.buf_packet_out;                // 8 bit to 128 bit conversion
    swap_arr_swap  =new[swap_arr.size] ;

    foreach(swap_arr[i]) begin
      swap_arr_swap[i] = {swap_arr[i][15:0],swap_arr[i][31:16],swap_arr[i][47:32],swap_arr[i][63:48],swap_arr[i][79:64],swap_arr[i][95:80],swap_arr[i][111:96],swap_arr[i][127:112]};
    end
    {>>{pkt.buf_packet_out}}    = swap_arr_swap;          // 128 bit to 8 bit conversion
   if(m_config.blanking == 2 && pkt_cnt == 0) begin
     pc_id_cnt_prach[7:0] = 9 ;
   end
   
    `ifdef SHORT_PRACH_FORMAT
       pkt_prb = 12; 
    `else 
       pkt_prb = 72;
    `endif
    array   = new[(pkt_prb * 48)+ 8];

    if(m_config.ud_comp_width[7:4] == 0) 
     struct_1.c_width = 16 ;                              // No compression
    else
     struct_1.c_width = m_config.ud_comp_width[7:4] ;     // 9 bit compression
     struct_1.n_prb = pkt_prb;

    
    if(m_config.ud_comp_width[7:4] != 0) begin
      for(int i=0 ;i<(pkt.buf_packet_out.size); i =i+2) begin
         pkt.fprb[n] = {pkt.buf_packet_out[i] ,pkt.buf_packet_out[i+1]};
         n = n + 1 ;
      end
      struct_1.fs_off = m_config.fs_offset;
      compression(struct_1,pkt.fprb,pkt.buf8);  
      arr_size = (pkt_prb * 27) + pkt_prb ;
      pkt.buf_packet_out =new[arr_size] (pkt.buf8);
    end
      
    bytes_cnt = ((12 * 2 * struct_1.c_width ) / 8) ;
    payload_size = pkt.buf_packet_out.size;
    frag_array    = new[pkt.buf_packet_out.size](pkt.buf_packet_out) ;
    while(payload_size > 0) begin

       array[0][7]   = 0  ;                              //adding main header of oran
       array[0][6:4] = m_config.c_payloadVersion[pc_id_cnt_prach][c_pkt_cnt] ;
       array[0][3:0] = m_config.c_filterIndex   [pc_id_cnt_prach][c_pkt_cnt]    ;
       array[1]      = m_config.c_frameId       [pc_id_cnt_prach][c_pkt_cnt]        ; 
       array[2][7:4] = m_config.c_subframeId    [pc_id_cnt_prach][c_pkt_cnt]     ;
       array[2][3:0] = m_config.c_slotID        [pc_id_cnt_prach][c_pkt_cnt][6:2]    ;
       array[3][7:6] = m_config.c_slotID        [pc_id_cnt_prach][c_pkt_cnt][1:0]    ;
       `ifdef SHORT_PRACH_FORMAT
         array[3][5:0] = symbol_prach ;
       `else 
         array[3][5:0] = m_config.c_startSymbolid[pc_id_cnt_prach][c_pkt_cnt] ;
       `endif
       count = count+4;
       array[count]        = m_config.c_sectionId[pc_id_cnt_prach][c_pkt_cnt][sec_cnt][11:4] ;  //adding section header of oran
       array[count+1][7:4] = m_config.c_sectionId[pc_id_cnt_prach][c_pkt_cnt][sec_cnt][3:0] ;
       array[count+1][3]   = m_config.c_rb       [pc_id_cnt_prach][c_pkt_cnt][sec_cnt] ;
       array[count+1][2]   = m_config.c_symInc   [pc_id_cnt_prach][c_pkt_cnt][sec_cnt];
       array[count+1][1:0] = prb_start[9:8];
       array[count+2]      = prb_start[7:0] ;
       if(m_config.mtu_size == 1500)
         array[count+3]      = 52 ;
       else if(m_config.mtu_size == 9000)
         array[count+3]      = 186 ;
       else begin
         array[count+3]      = m_config.c_numprb_c[pc_id_cnt_prach][c_pkt_cnt][sec_cnt];
       end  
       count=count+4;
       struct_1.n_prb = array[7] ;
       prb_count = struct_1.n_prb ;
       if(m_config.ud_comp_width[7:4] != 0)
         tot_bytes_cnt = bytes_cnt + 1 ;
       else
         tot_bytes_cnt = bytes_cnt     ;
       for(int i = ((tot_bytes_cnt) * prb_start) ; i< (((tot_bytes_cnt) * prb_count) + ((tot_bytes_cnt) * prb_start)) ; i++) begin
          array[count] =  frag_array[i];
          count =count+1;
       end
     
       payload_size = payload_size - ((tot_bytes_cnt) * prb_count);
       sec_cnt = sec_cnt + 1 ;
       if(pkt_prb != 0) begin 
         bal_prb = pkt_prb - (prb_count * (sec_cnt-1)) ;
         if((pkt_prb - (prb_count*sec_cnt)) >= 0) begin
           count = count ;
         end else begin
           if(m_config.ud_comp_width[7:4] != 0) begin
             count = 8 + ((bal_prb * bytes_cnt) + bal_prb);
           end else
             count = 8 + (bal_prb * bytes_cnt) ;
           array[7] = bal_prb ; 
         end
       end else begin
         bal_prb = 273 - (prb_count * (sec_cnt-1)) ; 
         if((273 - (prb_count*sec_cnt)) >= 0) begin
           count = count ;
         end else begin
           if(m_config.ud_comp_width[7:4] != 0)
             count = 8 + ((bal_prb * bytes_cnt) + bal_prb); 
           else
             count = 8 + (bal_prb * bytes_cnt) ; 
           array[7] = bal_prb ; 
         end 
       end
       pkt.seq_id[15:8] = seq_id_cnt_prach ;
       pkt.pc_id[7:0]   = pc_id_cnt_prach  ;
       array = new[count](array);
       pkt.buf_packet_out = new[count](array);
       pkt.prach_pkt = 1 ;
       $cast(m_item_inp,pkt);
       `uvm_info("ORAN_MAPPER PRACH", $sformatf("ORAN mpr prach exp_output(1st 8bytes) : %0h Size %0d", {pkt.buf_packet_out[0],pkt.buf_packet_out[1],pkt.buf_packet_out[2],pkt.buf_packet_out[3],pkt.buf_packet_out[4],pkt.buf_packet_out[5],pkt.buf_packet_out[6],pkt.buf_packet_out[7],pkt.buf_packet_out[8],pkt.buf_packet_out[9],pkt.buf_packet_out[10],pkt.buf_packet_out[11],pkt.buf_packet_out[12],pkt.buf_packet_out[13],pkt.buf_packet_out[14],pkt.buf_packet_out[15],pkt.buf_packet_out[16],pkt.buf_packet_out[17],pkt.buf_packet_out[18],pkt.buf_packet_out[19],pkt.buf_packet_out[20],pkt.buf_packet_out[21],pkt.buf_packet_out[22],pkt.buf_packet_out[23]},pkt.buf_packet_out.size), UVM_HIGH);           // Displaying first 8 bytes (64 bits) of ORAN demapper output
       m_output[0].write(m_item_inp);
       count=0;
       m_item_inp  = new();
       m_item      = new();
       ref_item    = new();
       pkt         = new() ;
       prb_start   = prb_count + prb_start ;
       if(m_config.mtu_size != 0) seq_id_cnt_prach = seq_id_cnt_prach + 1; 
       if(payload_size == 0) begin
          break ;
       end
    end
    sec_cnt = 0; 
    counter = counter + 1;
    if(m_config.cc2_dis == 1) begin
       pc_id_cnt_prach  = pc_id_cnt_prach + 2 ;
       pkt_cnt = pkt_cnt + 2;
    end else begin
       pc_id_cnt_prach  = pc_id_cnt_prach + 1 ;
       pkt_cnt = pkt_cnt + 1;
    end

    if(pc_id_cnt_prach == 16) begin
      if(m_config.blanking == 2)  
        pc_id_cnt_prach = 9; 
      else
        pc_id_cnt_prach = 8; 
      if(m_config.mtu_size == 0) seq_id_cnt_prach = seq_id_cnt_prach + 1;
      else seq_id_cnt_prach = seq_id_cnt_prach ;
      symbol_prach = symbol_prach + 1 ;
    end

    if(m_config.mtu_size != 0) seq_id_cnt_prach = 0 ;

    if(pkt_cnt % (m_config.c_numSymbol[pc_id_cnt_prach][c_pkt_cnt][sec_cnt]*8) == 0) begin
       c_pkt_cnt  = c_pkt_cnt + 1 ; 
       `ifdef SHORT_PRACH_FORMAT
         symbol_prach = 0 ;
       `else
         symbol_prach = symbol_prach ;
       `endif 
    end
    else c_pkt_cnt = c_pkt_cnt ;
endtask

`endif 
