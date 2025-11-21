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

`ifndef O_RU_REF_ORAN_DEMAPPER_SV 
`define O_RU_REF_ORAN_DEMAPPER_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_oran_demapper
//------------------------------------------------------------------------------ 

import "DPI-C" context function void decompression(inout trans_struct struct_1,shortint fprb[6552],byte unsigned cprb[9500]);
import "DPI-C" context function void cplane_decompression(inout trans_struct struct_1,shortint fprb[6552],byte unsigned cprb_c[9500]);
class o_ru_ref_oran_demapper extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_oran_demapper) 

  localparam int PRB_CNT = 273;
  localparam int COMP_WIDTH = 9;
  localparam int RE = 12;
  int pkt_cnt[26] ;
  int counter = 0;
  int scb_num;
  int cnt_pkt ;
  int temp_prb_cnt=0 ;
  int c_pkt_cnt_pr ;
  bit [7:0] channel_re_pusch = 0;
  bit [7:0] channel_re_prach = 0;
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
extern virtual task          oran_reference_demapper(ref byte unsigned rx_data_que[$],ref o_ru_ref_avsts_item m_item,ref o_ru_config_pkg::o_ru_ip_config m_config) ;
extern virtual task          oran_header_rem_u_plane(ref byte unsigned rx_data_que[$],ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          oran_header_rem_c_plane(ref byte unsigned rx_data_que[$],ref o_ru_ref_avsts_item pkt_c, ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          axc_id_change(ref int axc_no, ref o_ru_config_pkg::o_ru_ip_config m_config);

endclass: o_ru_ref_oran_demapper

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_oran_demapper::build_phase(uvm_phase phase);
     super.build_phase(phase);

  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_oran_demapper::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_oran_demapper::run_phase(uvm_phase phase);
     fork
        begin 
           forever 
           begin
              m_item_inp = new();
              m_item     = new();
              ref_item   = new();
              m_fifo[0].get(m_item_inp);
              $cast(m_item,m_item_inp);
              ref_item.buf_packet_out = new[m_item.buf_packet_out.size] (m_item.buf_packet_out) ;
 
              ref_item.pc_id           = m_config.pc_id;
              ref_item.msg_type        = m_config.msg_type;
              ref_item.payload_size    = m_config.payload_size;
              ref_item.rx_data_q = ref_item.buf_packet_out;
              `uvm_info("ORAN_DEMAP", $psprintf("ORAN HEADER REMOVAL ENTRY"), UVM_DEBUG);
              oran_reference_demapper(ref_item.rx_data_q,ref_item,m_config);
              $cast(m_item_inp,ref_item);

              `uvm_info("ORAN_DEMAP", $psprintf("ORAN HEADER REMOVAL EXIT"), UVM_DEBUG);
              `uvm_info("ORAN_DEMAP", $sformatf("ORAN dmpr exp_output(1st 8bytes) : %0h", {ref_item.buf_packet_out[0],ref_item.buf_packet_out[1],ref_item.buf_packet_out[2],ref_item.buf_packet_out[3],ref_item.buf_packet_out[4],ref_item.buf_packet_out[5],ref_item.buf_packet_out[6],ref_item.buf_packet_out[7]}), UVM_HIGH);           // Displaying first 8 bytes (64 bits) of ORAN demapper output
              if(m_config.msg_type != 2) begin                                                                           // Check for U plane 
                 m_output[0].write(m_item_inp);
              end else begin
                 `uvm_info("ORAN_DEMAP", $sformatf("C Plane Packet Dropped %0d, ORAN HEADER REMOVAL EXIT", pkt_cnt[scb_num]), UVM_DEBUG);
                 pkt_cnt[scb_num] = pkt_cnt [scb_num] + 1 ;
              end
	   end	
        end                      // Fork
     join_none
  endtask : run_phase

task o_ru_ref_oran_demapper::oran_reference_demapper(ref byte unsigned rx_data_que[$], ref o_ru_ref_avsts_item m_item,ref o_ru_config_pkg::o_ru_ip_config m_config);		 

   if(m_config.msg_type == 2)
      oran_header_rem_c_plane(rx_data_que,m_item,m_config);
   else
      oran_header_rem_u_plane(rx_data_que,m_item,m_config);
endtask

// ------------------------------------
// ORAN Header removal for U-plane data
// ------------------------------------

// ---------------------------------------
// |   ORAN header    |     IQ data      |
// ---------------------------------------


task o_ru_ref_oran_demapper::oran_header_rem_u_plane(ref byte unsigned rx_data_que[$],ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);
    int bytes_cnt , prb_count , j; 
    byte unsigned u_wts_arr []   ;                            // Weights array
    byte unsigned decomp_data []   ;                          // Weights array
    bit [11:0] section_id[PRB_CNT]   ;                        // Section Identifier (8 bits + 4 bits)
    bit rb[PRB_CNT]                  ;                        // Maximum PRB is 273
    bit syminc[PRB_CNT]              ;                        // Symbol number increment command (8 bits)
    bit [9:0] startprb_u[PRB_CNT]    ;                        // Starting PRB of data section description (2 bits + 8 bits)
    bit [7:0] numprb_u[PRB_CNT]      ;                        // Number of contiguous PRBs per data section description (8 bits)
    int arr_size,temp ;
    int pow_val, sqr_val         ;
    bit [23:0] FS_24bit_data     ;
    if(m_config.ud_comp_width[7:4] == 0) 
     struct_1.c_width = 16 ;                                  // 9 bit compression
    else
     struct_1.c_width = m_config.ud_comp_width[7:4] ;         // 9 bit compression
    bytes_cnt = ((RE * 2 * struct_1.c_width ) / 8) ;          // No. of bytes for 1 prb (Resource elements = 12, IQ data = 2 (1I(16 bits) + 1Q(16 bits)))
    if(m_config.ud_comp_width[7:4] == 0) 
      u_wts_arr = new[ PRB_CNT * (bytes_cnt) ]   ;            // Weights array (prb * (bytes_cnt + udcomp)), udcomp is 1byte
    else
      u_wts_arr = new[ PRB_CNT * (bytes_cnt + 1) ]   ;        // Weights array (prb * (bytes_cnt + udcomp)), udcomp is 1byte

    // Common header fields for U-plane

    m_config.data_direction [cnt_pkt] = 1; 
    m_config.payload_version[cnt_pkt] = rx_data_que[0][6:4] ; 
    m_config.filter_index   [cnt_pkt] = rx_data_que[0][3:0] ;
    m_config.frame_id       [cnt_pkt] = rx_data_que[1]      ;
    m_config.subframe_id    [cnt_pkt] = rx_data_que[2][7:4] ;
    m_config.slot_id        [cnt_pkt] = {rx_data_que[2][3:0] ,rx_data_que[3][7:6]} ;
    m_config.symbol_id      [cnt_pkt] = rx_data_que[3][5:0] ;
    for(int i=0; i<4; i++) begin
       rx_data_que.delete(0);                                  // Remove common header fields
    end
 

    m_config.payload_size = m_config.payload_size - 4;         // 4 common header fields removed so subtract 4 from payload size

    while(m_config.payload_size != 0) begin
      
      // Section fields for U-plane

      section_id[pkt.section_count]     = {rx_data_que[0],rx_data_que[1][7:4]}  ;
      rb        [pkt.section_count]     = rx_data_que[1][3] ;                           // Resource block indicator
      syminc    [pkt.section_count]     = rx_data_que[1][2] ;                           // Symbol number increment command
      startprb_u[pkt.section_count]     = {rx_data_que[1][1:0] ,rx_data_que[2]} ;       // Starting PRB of data section description 
      numprb_u  [pkt.section_count]     = rx_data_que[3] ;                              // Number of contiguous PRBs per data section description`
      struct_1.n_prb      = rx_data_que[3] ;
      if (struct_1.n_prb == 0) begin 
         prb_count = PRB_CNT ;
      end
      else 
         prb_count = struct_1.n_prb ;
      temp_prb_cnt = temp_prb_cnt + prb_count ; 

      for(int i=0; i<4; i++) begin
         rx_data_que.delete(0);                            // Remove section fields
      end
      m_config.payload_size = m_config.payload_size - 4;   // 4 section fields removed so subtract 4 from payload size
      if(m_config.ud_comp_width[7:4] == 0) begin
        for(int i = 0 ; i< ((bytes_cnt) * prb_count) ; i++) begin
           u_wts_arr [j] = rx_data_que[0];
           rx_data_que.delete(0);                          // Remove the elements of Weights array 
           j = j + 1 ;
        end                                                
        m_config.payload_size = m_config.payload_size - ((bytes_cnt) * prb_count);
      end else begin
        for(int i = 0 ; i< ((bytes_cnt + 1 ) * prb_count) ; i++) begin
           u_wts_arr [j] = rx_data_que[0];
           rx_data_que.delete(0);                          // Remove the elements of Weights array 
           j = j + 1 ;
        end                                                
        m_config.payload_size = m_config.payload_size - ((bytes_cnt + 1) * prb_count);
      end 
      pkt.section_count = pkt.section_count + 1 ;
      if(m_config.payload_size == 0) begin
         break ;
      end   
    end

    foreach(m_config.section_id[i]) begin 
      m_config.section_id[i]  = new[pkt.section_count](section_id) ;  
      m_config.rb        [i]  = new[pkt.section_count](rb        ) ;
      m_config.syminc    [i]  = new[pkt.section_count](syminc    ) ;
      m_config.startprb_u[i]  = new[pkt.section_count](startprb_u) ;
      m_config.numprb_u  [i]  = new[pkt.section_count](numprb_u  ) ;
    end
    if(m_config.ud_comp_width[7:4] == 0)
      decomp_data=new[temp_prb_cnt * (bytes_cnt)](u_wts_arr) ; 
    else
      decomp_data=new[temp_prb_cnt * (bytes_cnt + 1)](u_wts_arr) ;
     
    pkt.buf_packet_out=new[decomp_data.size](decomp_data);
    foreach(pkt.buf_packet_out[i]) begin
       pkt.buf8[i] = pkt.buf_packet_out[i] ;
    end
    if(m_config.ud_comp_width[7:4] != 0) begin
      struct_1.n_prb  = temp_prb_cnt ;
      struct_1.fs_off = m_config.fs_offset;
      decompression(struct_1,pkt.fprb,pkt.buf8);             // Decompression of data (fprb - decompressed output, buf8 - input)
      pkt.buf_packet_out=new[temp_prb_cnt * 48];
      for(int i = 0 ; i < pkt.buf_packet_out.size / 2 ; i = i +1) begin
         pkt.buf_packet_out[temp] = pkt.fprb[i][15:8] ;
         pkt.buf_packet_out[temp+1] = pkt.fprb[i][7:0] ;
         temp = temp + 2 ;
      end
    end
    m_config.section_count[cnt_pkt] = pkt.section_count ;
    cnt_pkt = cnt_pkt + 1;
    temp_prb_cnt = 0;
endtask


task o_ru_ref_oran_demapper::oran_header_rem_c_plane(ref byte unsigned rx_data_que[$],ref o_ru_ref_avsts_item pkt_c, ref o_ru_config_pkg::o_ru_ip_config m_config);
    bit [7:0] num_sec;                                    // Number of sections
    int j;
    int wt_arr_size ;
    byte unsigned wts_arr [] ;                            // Weights array 
    int axc_num , inc_val ;
    byte sec_type ;
    num_sec   = rx_data_que [4] ;
    m_config.ucomp_hdr = rx_data_que[18] ;
    struct_1.c_width   = m_config.ucomp_hdr[7:4];
    struct_1.n_prb     = rx_data_que[11];
    axc_num = m_config.pc_id ;
    axc_id_change(axc_num,m_config);
    if(axc_num == 0)
      m_config.pc_id_arr[axc_num] = 16;
    else
      m_config.pc_id_arr[axc_num] = axc_num ;

    if(m_config.pc_id_arr[axc_num] < m_config.min_pc_id_arr) begin
      m_config.min_pc_id_arr = m_config.pc_id_arr[axc_num] ;
    end
    
    sec_type = rx_data_que[5] ;
    // Common header fields for C-plane
    if(sec_type == 1) begin
      if(rx_data_que[0][7] == 0 && channel_re_pusch[axc_num]) begin
         m_config.c_pkt_cnt = m_config.c_pkt_cnt + 1;
  
         if(m_config.cc2_dis == 1) inc_val = 2;
         else inc_val = 1;
        
         for(int i= 0 ; i < 8 ; i = i + inc_val) begin
           if(channel_re_pusch[i] == 1) counter = counter + 1; 
           else counter = counter ;
         end 
         m_config.pc_id_size = counter ;
         channel_re_pusch = 8'b00000000; 
         counter = 0; 
      end
      if(rx_data_que[0][7] == 0) begin
        m_config.c_dataDirection   [axc_num][m_config.c_pkt_cnt] = rx_data_que[0][7]   ;   
        m_config.c_payloadVersion  [axc_num][m_config.c_pkt_cnt] = rx_data_que[0][6:4] ; 
        m_config.c_filterIndex     [axc_num][m_config.c_pkt_cnt] = rx_data_que[0][3:0] ;
        m_config.c_frameId         [axc_num][m_config.c_pkt_cnt] = rx_data_que[1]      ;
        m_config.c_subframeId      [axc_num][m_config.c_pkt_cnt] = rx_data_que[2][7:4] ;
        m_config.c_slotID          [axc_num][m_config.c_pkt_cnt] = {rx_data_que[2][3:0] ,rx_data_que[3][7:6]} ;
        m_config.c_startSymbolid   [axc_num][m_config.c_pkt_cnt] = rx_data_que[3][5:0] ;
        m_config.c_numberOfSections[axc_num][m_config.c_pkt_cnt] = rx_data_que[4]      ; 
        m_config.c_sectionType     [axc_num][m_config.c_pkt_cnt] = rx_data_que[5]      ;
        m_config.c_udCompHdr       [axc_num][m_config.c_pkt_cnt] = rx_data_que[6]      ;      // User data compression header 
        m_config.c_reserved        [axc_num][m_config.c_pkt_cnt] = rx_data_que[7]      ;      // Reserved for future use
        channel_re_pusch[axc_num] = 1'b1;
        for(int i=0; i<8; i++) begin                                                          // Remove common header fields
           rx_data_que.delete(0);
        end
      end
    end else begin
      if(channel_re_prach[axc_num-8]) begin
         c_pkt_cnt_pr = c_pkt_cnt_pr + 1;
         channel_re_prach = 8'b00000000;
      end
      m_config.c_dataDirection   [axc_num][c_pkt_cnt_pr] = rx_data_que[0][7]   ;   
      m_config.c_payloadVersion  [axc_num][c_pkt_cnt_pr] = rx_data_que[0][6:4] ; 
      m_config.c_filterIndex     [axc_num][c_pkt_cnt_pr] = rx_data_que[0][3:0] ;
      m_config.c_frameId         [axc_num][c_pkt_cnt_pr] = rx_data_que[1]      ;
      m_config.c_subframeId      [axc_num][c_pkt_cnt_pr] = rx_data_que[2][7:4] ;
      m_config.c_slotID          [axc_num][c_pkt_cnt_pr] = {rx_data_que[2][3:0] ,rx_data_que[3][7:6]} ;
      m_config.c_startSymbolid   [axc_num][c_pkt_cnt_pr] = rx_data_que[3][5:0] ;
      m_config.c_numberOfSections[axc_num][c_pkt_cnt_pr] = rx_data_que[4]      ; 
      m_config.c_sectionType     [axc_num][c_pkt_cnt_pr] = rx_data_que[5]      ;
      m_config.c_time_offset     [axc_num][c_pkt_cnt_pr] = {rx_data_que[6],rx_data_que[7]}; 
      m_config.c_frame_struct    [axc_num][c_pkt_cnt_pr] = rx_data_que[8] ;
      m_config.c_cp_length       [axc_num][c_pkt_cnt_pr] = {rx_data_que[9],rx_data_que[10]} ;
      m_config.c_udCompHdr       [axc_num][c_pkt_cnt_pr] = rx_data_que[11]      ;      // User data compression header 
      channel_re_prach[axc_num - 8] = 1'b1;
      for(int i=0; i<12; i++) begin                                                          // Remove common header fields
         rx_data_que.delete(0);
      end
    end
 
    for(int i=0; i<num_sec; i++) begin
    // Section fields for C-plane

     if(sec_type == 1) begin
        if(rx_data_que[0][7] == 0) begin 
          m_config.c_sectionId [axc_num][m_config.c_pkt_cnt][i] = {rx_data_que[0],rx_data_que[1][7:4]}  ;     
          m_config.c_rb        [axc_num][m_config.c_pkt_cnt][i] = rx_data_que[1][3] ;                      
          m_config.c_symInc    [axc_num][m_config.c_pkt_cnt][i] = rx_data_que[1][2] ;                      
          m_config.c_startprb_c[axc_num][m_config.c_pkt_cnt][i] = {rx_data_que[1][1:0] ,rx_data_que[2]} ;  
          m_config.c_numprb_c  [axc_num][m_config.c_pkt_cnt][i] = rx_data_que[3] ;
          m_config.c_reMask    [axc_num][m_config.c_pkt_cnt][i] = {rx_data_que[4],rx_data_que[5][7:4]} ;               // Resource elememt mask (8 bits + 4 bits)
          m_config.c_numSymbol [axc_num][m_config.c_pkt_cnt][i] = rx_data_que[5][3:0] ;                                // Number of symbols (4 bits)
          m_config.c_ef        [axc_num][m_config.c_pkt_cnt][i] = rx_data_que[6][7] ;                                  // Extension flag (1 bit)
          m_config.c_beamId    [axc_num][m_config.c_pkt_cnt][i] = {rx_data_que[6][6:0],rx_data_que[7] };               // Beam identifier (15 bits)
          for(int i=0; i<8; i++) begin
             rx_data_que.delete(0);                          // Remove section fields   
          end
        end
     end else begin
        m_config.c_sectionId    [axc_num][c_pkt_cnt_pr][i] = {rx_data_que[0],rx_data_que[1][7:4]}  ;     
        m_config.c_rb           [axc_num][c_pkt_cnt_pr][i] = rx_data_que[1][3] ;                      
        m_config.c_symInc       [axc_num][c_pkt_cnt_pr][i] = rx_data_que[1][2] ;                      
        m_config.c_startprb_c   [axc_num][c_pkt_cnt_pr][i] = {rx_data_que[1][1:0] ,rx_data_que[2]} ;  
        m_config.c_numprb_c     [axc_num][c_pkt_cnt_pr][i] = rx_data_que[3] ;
        m_config.c_reMask       [axc_num][c_pkt_cnt_pr][i] = {rx_data_que[4],rx_data_que[5][7:4]} ;               // Resource elememt mask (8 bits + 4 bits)
        m_config.c_numSymbol    [axc_num][c_pkt_cnt_pr][i] = rx_data_que[5][3:0] ;                                // Number of symbols (4 bits)
        m_config.c_ef           [axc_num][c_pkt_cnt_pr][i] = rx_data_que[6][7] ;                                  // Extension flag (1 bit)
        m_config.c_beamId       [axc_num][c_pkt_cnt_pr][i] = {rx_data_que[6][6:0],rx_data_que[7] };               // Beam identifier (15 bits)
        m_config.c_freq_off     [axc_num][c_pkt_cnt_pr][i]  = {rx_data_que[8],rx_data_que[9],rx_data_que[10]} ;
        m_config.c_reserved_typ3[axc_num][c_pkt_cnt_pr][i]  = {rx_data_que[11]};
        for(int i=0; i<12; i++) begin
           rx_data_que.delete(0);                          // Remove section fields   
        end
     end
    end
    
    if(sec_type == 1) begin
      if(m_config.c_dataDirection[axc_num][m_config.c_pkt_cnt] == 0 && channel_re_pusch == 8'b11111111) begin 
        m_config.c_pkt_cnt = m_config.c_pkt_cnt + 1; 
   
        if(m_config.cc2_dis == 1) inc_val = 2;
        else inc_val = 1;
  
        for(int i= 0 ; i < 8 ; i = i + inc_val) begin
          if(channel_re_pusch[i] == 1) counter = counter + 1; 
          else counter = counter ;
        end 
        m_config.pc_id_size = counter ;
        channel_re_pusch = 8'b00000000;   
    
        counter = 0; 
      end                                                
    end else begin                                      
      if(m_config.blanking == 2 && axc_num == 9) begin
        ->m_config.prach_c_event_done;
      end
      if(channel_re_prach == 8'b11111111) begin 
        c_pkt_cnt_pr = c_pkt_cnt_pr + 1; 
        channel_re_prach = 8'b00000000;   
        if(m_config.frame_config[1] == 1) ->m_config.prach_c_event_done; 
      end
    end
    
endtask
 
///eAXC ID Mapping /////
task o_ru_ref_oran_demapper::axc_id_change(ref int axc_no, ref o_ru_config_pkg::o_ru_ip_config m_config);
   foreach(m_config.ul_mac_axc[i]) begin
      if (m_config.ul_mac_axc[i] == axc_no) begin
         axc_no = i ;
         break;
      end
   end

endtask

`endif 
