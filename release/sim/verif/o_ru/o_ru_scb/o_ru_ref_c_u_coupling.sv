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

`ifndef O_RU_REF_C_U_COUPLING_SV 
`define O_RU_REF_C_U_COUPLING_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_c_u_coupling
//------------------------------------------------------------------------------ 


class o_ru_ref_c_u_coupling extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_c_u_coupling) 
 
  o_ru_ref_avsts_item ref_item; 
  o_ru_ref_avsts_item m_item;
  avsts_item m_item_inp; 

  int sym_count,out_trig_counter;
  bit [2:0] axc_count[4] ;
  int pkt_cnt=2147483648,sf_pr_cnt = 1     ; 
  bit[7:0] swap_array[8][];   
  int symbol_array [14] ;
  int tot_sym ;
  int c_pkt_cnt,local_cnt ;
  bit[5:0] symbol_id ;
  int local_id     ;
  int local_pc_id  ;
  int tot_prb [16] ;
   //------------------------------------------------------------------------------ 
   // Constructor 
   //------------------------------------------------------------------------------ 
   function new (string name, uvm_component parent); 
      super.new(name, parent);
   endfunction : new 

extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);
extern virtual task          run_phase(uvm_phase phase);
extern virtual task          c_u_coupling(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_cfg,int num); 
extern virtual task          c_u_coupling_ul_inj(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_cfg,int num); 
endclass: o_ru_ref_c_u_coupling

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_c_u_coupling::build_phase(uvm_phase phase);
     super.build_phase(phase);
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_c_u_coupling::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_c_u_coupling::run_phase(uvm_phase phase);
     axc_count[0]    = 0  ; 
     axc_count[1]    = 1  ; 
     axc_count[2]    = 0  ; 
     axc_count[3]    = 1  ;
     for(int i=0 ;i<4;i++) begin
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
                ref_item.buf_packet_out = new[m_item.buf_packet_out.size] (m_item.buf_packet_out) ;
                ref_item.symbol_number  = m_item.symbol_number ;
                symbol_id = ref_item.symbol_number ;
                ref_item.t2a_max_up = m_item.t2a_max_up;
                ref_item.t2a_min_up = m_item.t2a_min_up;
                ref_item.pkt_time = m_item.pkt_time;
                ref_item.time_cnt = m_item.time_cnt;
                ref_item.pc_id = m_item.pc_id;
                ref_item.seq_id = m_item.seq_id;
                ref_item.port_id = m_item.port_id;
                ref_item.msg_type = m_item.msg_type;
                ref_item.protocol_rev = m_item.protocol_rev;
                ref_item.reserved = m_item.reserved;
                ref_item.conc = m_item.conc;
                ref_item.destination_addr = m_item.destination_addr;
                ref_item.source_addr = m_item.source_addr;
                ref_item.vlan_tag = m_item.vlan_tag;
                ref_item.eth_type = m_item.eth_type;
                ref_item.payload_size = m_item.payload_size;
                ref_item.data_direction = m_item.data_direction;
                ref_item.payload_version = m_item.payload_version;
                ref_item.filter_index = m_item.filter_index;
                ref_item.frame_id = m_item.frame_id;
                ref_item.subframe_id = m_item.subframe_id;
                ref_item.slot_id = m_item.slot_id;
                ref_item.symbol_id = m_item.symbol_id;

                ref_item.section_id = m_item.section_id;
                ref_item.rb = m_item.rb;
                ref_item.syminc = m_item.syminc;
                ref_item.startprb_u = m_item.startprb_u;
                ref_item.numprb_u = m_item.numprb_u;

                ref_item.c_dataDirection = m_item.c_dataDirection;
                ref_item.c_payloadVersion = m_item.c_payloadVersion;
                ref_item.c_filterIndex = m_item.c_filterIndex;
                ref_item.c_frameId = m_item.c_frameId;
                ref_item.c_subframeId = m_item.c_subframeId;
                ref_item.c_slotID = m_item.c_slotID;
                ref_item.c_startSymbolid = m_item.c_startSymbolid;
                ref_item.c_numberOfSections = m_item.c_numberOfSections;
                ref_item.c_sectionType = m_item.c_sectionType;
                ref_item.c_udCompHdr = m_item.c_udCompHdr;
                ref_item.c_reserved = m_item.c_reserved ;
                ref_item.c_sectionId = m_item.c_sectionId;
                ref_item.c_rb = m_item.c_rb;
                ref_item.c_symInc = m_item.c_symInc;
                ref_item.c_startprb_c = m_item.c_startprb_c;
                ref_item.c_numprb_c = m_item.c_numprb_c;
                ref_item.c_reMask = m_item.c_reMask;
                ref_item.c_numSymbol = m_item.c_numSymbol;
                ref_item.c_ef = m_item.c_ef;
                ref_item.c_beamId = m_item.c_beamId;

                ref_item.ext_typ = m_item.ext_typ;
                ref_item.ext_len = m_item.ext_len;
                ref_item.ucomp_hdr = m_item.ucomp_hdr;

                ref_item.mtu_size = m_item.mtu_size;
                ref_item.comp_width = m_item.comp_width;
                `ifndef ECPRI_ORAN_SS
                  if(`UL_INJ == 0)
                    c_u_coupling(ref_item,m_config,scb_num);
                  else
                    c_u_coupling_ul_inj(ref_item,m_config,scb_num);
                `else
                  c_u_coupling_ul_inj(ref_item,m_config,scb_num);
                `endif
             end	
          end  // Fork
       join_none
     end
endtask : run_phase

task o_ru_ref_c_u_coupling::c_u_coupling(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_cfg,int num);
   byte unsigned pkt_arr[] ;
   int pkt_prb,start_loop ;
   byte unsigned prb_arr[] ;
   bit [127:0] swap_arr [] ;
   bit [127:0] swap_arr_swap [] ;
   int sec_cnt , arr_count=0;
   {>>{swap_arr}}    = pkt.buf_packet_out;                     // 8 bit to 128 bit conversion
   swap_arr_swap  =new[swap_arr.size] ;
   foreach(swap_arr[i]) begin
     swap_arr_swap[i] = {swap_arr[i][31:0],swap_arr[i][63:32],swap_arr[i][95:64],swap_arr[i][127:96]};
   end
   {>>{pkt.buf_packet_out}}    = swap_arr_swap;                // 128 bit to 8 bit conversion
   pkt.symbol_number = symbol_id ;
   if(symbol_id == 0) local_id = 16;
   else local_id = symbol_id ;
   $cast(m_item_inp,pkt);
   if(num == 2 || num == 3) begin
       if((m_cfg.pc_id_arr[axc_count[num] + 8] == (axc_count[num] + 8))) begin
          m_output[1].write(m_item_inp);
       end
      `uvm_info("CU_COUPLING", $sformatf("Coupling PRACH exp_output(1st 8bytes) : %0h AXC %0d", {pkt.buf_packet_out[0],pkt.buf_packet_out[1],pkt.buf_packet_out[2],pkt.buf_packet_out[3],pkt.buf_packet_out[4],pkt.buf_packet_out[5],pkt.buf_packet_out[6],pkt.buf_packet_out[7],pkt.buf_packet_out[8],pkt.buf_packet_out[9],pkt.buf_packet_out[10],pkt.buf_packet_out[11],pkt.buf_packet_out[12],pkt.buf_packet_out[13],pkt.buf_packet_out[14],pkt.buf_packet_out[15],pkt.buf_packet_out[16],pkt.buf_packet_out[17],pkt.buf_packet_out[18],pkt.buf_packet_out[19],pkt.buf_packet_out[20],pkt.buf_packet_out[21],pkt.buf_packet_out[22],pkt.buf_packet_out[23],pkt.buf_packet_out[24]},num), UVM_HIGH);           // Displaying first 8 bytes (64 bits) of ORAN demapper output
   end else begin
      tot_prb[axc_count[num]] = 0;
      tot_sym = 0 ;
      for(int j = 0; j < m_config.c_numberOfSections[axc_count[num]][c_pkt_cnt] ; j= j + 1)begin
        tot_prb[axc_count[num]] =  m_config.c_numprb_c[axc_count[num]][c_pkt_cnt][j] + tot_prb[axc_count[num]];    
        for(int i = m_config.c_startSymbolid[axc_count[num]][c_pkt_cnt] ; i < m_config.c_numSymbol[axc_count[num]][c_pkt_cnt][j] + m_config.c_startSymbolid[axc_count[num]][c_pkt_cnt]; i = i + 1) begin
           if(i == 0) symbol_array[i] = 16 ;
           else symbol_array[i] = i ;
        end
      end
      tot_sym = m_config.c_numSymbol[m_config.min_pc_id_arr][c_pkt_cnt][0] + tot_sym ;

      if(tot_prb[axc_count[num]] == 0) tot_prb[axc_count[num]] = 273 ;

      if(pkt.buf_packet_out.size == tot_prb[axc_count[num]] * 48) begin 
        swap_array[axc_count[num]] = new[pkt.buf_packet_out.size()](pkt.buf_packet_out);
      end else begin
        swap_array[axc_count[num]] = new[tot_prb[axc_count[num]] * 48];
        for(int j = 0; j < m_config.c_numberOfSections[axc_count[num]][c_pkt_cnt] ; j= j + 1)begin
          for(int i = (m_config.c_startprb_c[axc_count[num]][c_pkt_cnt][j] * 48); i < ((m_config.c_numprb_c[axc_count[num]][c_pkt_cnt][j] + m_config.c_startprb_c[axc_count[num]][c_pkt_cnt][j]) * 48 ); i = i + 1) begin
            swap_array[axc_count[num]][arr_count] = pkt.buf_packet_out[i] ;
            arr_count = arr_count + 1;
          end
        end
      end
      out_trig_counter = out_trig_counter + 1;
      if((m_config.cc1_dis == 1 || m_config.cc2_dis == 1)) begin
         if(out_trig_counter == 4)begin
            out_trig_counter = 0;
            if(m_config.cc1_dis == 1) start_loop = 1 ;
            else start_loop = 0 ;
            for(int i = start_loop;i<8;i=i+2)begin
               pkt.buf_packet_out = new[swap_array[i].size()](swap_array[i]);
               pkt.pc_id[7:0]   = i;
               pkt.symbol_number = symbol_id ;
               $cast(m_item_inp,pkt);

               if(i == 0) local_pc_id = 16;
               else local_pc_id = i;

               if((symbol_array[symbol_id] == local_id) && (m_cfg.pc_id_arr[i] == local_pc_id)) begin
                  m_output[0].write(m_item_inp);
                  if(pkt_cnt < 0) pkt_cnt = 0;
                  pkt_cnt = pkt_cnt + 1 ; 
                  `uvm_info("CU_COUPLING", $sformatf("Coupling PUSCH exp_output(1st 8bytes) : %0h AXC %0d PC_ID ARR %0d SYM : %0d C PKT %0d U PKT %0d", {pkt.buf_packet_out[0],pkt.buf_packet_out[1],pkt.buf_packet_out[2],pkt.buf_packet_out[3],pkt.buf_packet_out[4],pkt.buf_packet_out[5],pkt.buf_packet_out[6],pkt.buf_packet_out[7],pkt.buf_packet_out[8],pkt.buf_packet_out[9],pkt.buf_packet_out[10],pkt.buf_packet_out[11],pkt.buf_packet_out[12],pkt.buf_packet_out[13],pkt.buf_packet_out[14],pkt.buf_packet_out[15],pkt.buf_packet_out[16],pkt.buf_packet_out[17],pkt.buf_packet_out[18],pkt.buf_packet_out[19],pkt.buf_packet_out[20],pkt.buf_packet_out[21],pkt.buf_packet_out[22],pkt.buf_packet_out[23],pkt.buf_packet_out[24],pkt.buf_packet_out[25],pkt.buf_packet_out[26],pkt.buf_packet_out[27],pkt.buf_packet_out[28],pkt.buf_packet_out[29],pkt.buf_packet_out[30],pkt.buf_packet_out[31],pkt.buf_packet_out[32],pkt.buf_packet_out[33],pkt.buf_packet_out[34],pkt.buf_packet_out[35],pkt.buf_packet_out[36],pkt.buf_packet_out[37],pkt.buf_packet_out[38],pkt.buf_packet_out[39],pkt.buf_packet_out[40],pkt.buf_packet_out[41],pkt.buf_packet_out[42],pkt.buf_packet_out[43],pkt.buf_packet_out[44],pkt.buf_packet_out[45],pkt.buf_packet_out[46],pkt.buf_packet_out[47]},i,m_cfg.pc_id_arr[i],symbol_id,c_pkt_cnt,pkt_cnt), UVM_HIGH);           // Displaying first 8 bytes (64 bits) of ORAN demapper output
               end
               m_item_inp = new() ; 
               pkt = new() ;
            end
         end
      end
      else begin
         if(out_trig_counter == 8)begin
            out_trig_counter = 0;
            start_loop = 0 ;
            for(int i = start_loop;i<8;i++)begin
               pkt.buf_packet_out = new[swap_array[i].size()](swap_array[i]);
               pkt.symbol_number = symbol_id ;
               pkt.pc_id[7:0]   = i;
               $cast(m_item_inp,pkt);

               if(i == 0) local_pc_id = 16;
               else local_pc_id = i;
               
               if((symbol_array[symbol_id] == local_id) && (m_cfg.pc_id_arr[i] == local_pc_id)) begin
                 if(pkt_cnt < 0) pkt_cnt = 0;
                 pkt_cnt = pkt_cnt + 1 ; 
                 m_output[0].write(m_item_inp);
                 `uvm_info("CU_COUPLING", $sformatf("Coupling PUSCH exp_output(1st 8bytes) : %0h AXC %0d", {pkt.buf_packet_out[0],pkt.buf_packet_out[1],pkt.buf_packet_out[2],pkt.buf_packet_out[3],pkt.buf_packet_out[4],pkt.buf_packet_out[5],pkt.buf_packet_out[6],pkt.buf_packet_out[7],pkt.buf_packet_out[8],pkt.buf_packet_out[9],pkt.buf_packet_out[10],pkt.buf_packet_out[11],pkt.buf_packet_out[12],pkt.buf_packet_out[13],pkt.buf_packet_out[14],pkt.buf_packet_out[15],pkt.buf_packet_out[16],pkt.buf_packet_out[17],pkt.buf_packet_out[18],pkt.buf_packet_out[19],pkt.buf_packet_out[20],pkt.buf_packet_out[21],pkt.buf_packet_out[22],pkt.buf_packet_out[23],pkt.buf_packet_out[24],pkt.buf_packet_out[25],pkt.buf_packet_out[26],pkt.buf_packet_out[27],pkt.buf_packet_out[28],pkt.buf_packet_out[29],pkt.buf_packet_out[30],pkt.buf_packet_out[31],pkt.buf_packet_out[32],pkt.buf_packet_out[33],pkt.buf_packet_out[34],pkt.buf_packet_out[35],pkt.buf_packet_out[36],pkt.buf_packet_out[37],pkt.buf_packet_out[38],pkt.buf_packet_out[39],pkt.buf_packet_out[40],pkt.buf_packet_out[41],pkt.buf_packet_out[42],pkt.buf_packet_out[43],pkt.buf_packet_out[44],pkt.buf_packet_out[45],pkt.buf_packet_out[46],pkt.buf_packet_out[47]},i), UVM_HIGH);           // Displaying first 8 bytes (64 bits) of ORAN demapper output
               end
               m_item_inp = new() ; 
               pkt = new() ;
            end
         end
      end

      if((pkt_cnt == ((local_cnt + (m_config.c_numSymbol[m_config.min_pc_id_arr][c_pkt_cnt][sec_cnt] * (m_config.pc_id_size)))))) begin 
         c_pkt_cnt = c_pkt_cnt + 1;
         local_cnt = pkt_cnt ;
         foreach(symbol_array[i]) symbol_array[i] = 0 ;
      end
      else begin
         c_pkt_cnt = c_pkt_cnt ;
         local_cnt = local_cnt ; 
      end
      
      if(pkt_cnt < 0) begin
        pkt_cnt = 0;
      end

      if(pkt_cnt == (tot_sym *(m_config.pc_id_size))) begin 
        pkt_cnt = 2147483648 ;
        local_cnt = 0 ;
      end
      else begin 
        pkt_cnt = pkt_cnt ;
        local_cnt = local_cnt ; 
      end
   end
   axc_count [num] = axc_count[num] + 2 ;
endtask : c_u_coupling

task o_ru_ref_c_u_coupling::c_u_coupling_ul_inj(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_cfg,int num);
   byte unsigned pkt_arr[] ;
   int pkt_prb,start_loop ;
   byte unsigned prb_arr[] ;
   bit [127:0] swap_arr [] ;
   bit [127:0] swap_arr_swap [] ;  
   int sec_cnt ,arr_count=0;
   if(sym_count == 14 ) sym_count = 0;
   {>>{swap_arr}}    = pkt.buf_packet_out;                     // 8 bit to 128 bit conversion
   swap_arr_swap  =new[swap_arr.size] ;
   foreach(swap_arr[i]) begin
     swap_arr_swap[i] = {swap_arr[i][31:0],swap_arr[i][63:32],swap_arr[i][95:64],swap_arr[i][127:96]};
   end
   {>>{pkt.buf_packet_out}}    = swap_arr_swap;                // 128 bit to 8 bit conversion
   pkt.symbol_number           = sym_count ;
   pkt.pc_id[7:0]              = axc_count[num];

   if(sym_count == 0) local_id = 16;
   else local_id = sym_count ;

   $cast(m_item_inp,pkt);
   if(num == 2 || num == 3) begin
      `uvm_info("CU_COUPLING", $sformatf("Coupling PRACH exp_output(1st 8bytes) : %0h AXC %0d PC ID ARR %0d", {pkt.buf_packet_out[0],pkt.buf_packet_out[1],pkt.buf_packet_out[2],pkt.buf_packet_out[3],pkt.buf_packet_out[4],pkt.buf_packet_out[5],pkt.buf_packet_out[6],pkt.buf_packet_out[7],pkt.buf_packet_out[8],pkt.buf_packet_out[9],pkt.buf_packet_out[10],pkt.buf_packet_out[11],pkt.buf_packet_out[12],pkt.buf_packet_out[13],pkt.buf_packet_out[14],pkt.buf_packet_out[15],pkt.buf_packet_out[16],pkt.buf_packet_out[17],pkt.buf_packet_out[18],pkt.buf_packet_out[19],pkt.buf_packet_out[20],pkt.buf_packet_out[21],pkt.buf_packet_out[22],pkt.buf_packet_out[23],pkt.buf_packet_out[24]},num,m_cfg.pc_id_arr[axc_count[num] + 8]), UVM_HIGH);           // Displaying first 8 bytes (64 bits) of ORAN demapper output
      if((m_cfg.pc_id_arr[axc_count[num] + 8] == (axc_count[num] + 8))) begin
        m_output[1].write(m_item_inp);
      end
      m_item_inp = new() ; 
      pkt = new() ;
   end else begin
      tot_prb[axc_count[num]] = 0;
      tot_sym = 0 ;
      for(int j = 0; j < m_config.c_numberOfSections[axc_count[num]][c_pkt_cnt] ; j= j + 1)begin
        tot_prb[axc_count[num]] =  m_config.c_numprb_c[axc_count[num]][c_pkt_cnt][j] + tot_prb[axc_count[num]];    
        for(int i = m_config.c_startSymbolid[axc_count[num]][c_pkt_cnt] ; i < m_config.c_numSymbol[axc_count[num]][c_pkt_cnt][j] + m_config.c_startSymbolid[axc_count[num]][c_pkt_cnt]; i = i + 1) begin
           if(i == 0) symbol_array[i] = 16 ;
           else symbol_array[i] = i ;
        end
      end
      tot_sym = m_config.c_numSymbol[m_config.min_pc_id_arr][c_pkt_cnt][0] + tot_sym ;
     
      
      if(tot_prb[axc_count[num]] == 0) tot_prb[axc_count[num]] = 273 ;

      if(pkt.buf_packet_out.size != tot_prb[axc_count[num]] * 48) begin 
        prb_arr = new[tot_prb[axc_count[num]] * 48];
        for(int j = 0; j < m_config.c_numberOfSections[axc_count[num]][c_pkt_cnt] ; j= j + 1)begin
          for(int i = (m_config.c_startprb_c[axc_count[num]][c_pkt_cnt][j] * 48); i < ((m_config.c_numprb_c[axc_count[num]][c_pkt_cnt][j] + m_config.c_startprb_c[axc_count[num]][c_pkt_cnt][j]) * 48 ); i = i + 1) begin
            prb_arr[arr_count] = pkt.buf_packet_out[i] ;
            arr_count = arr_count + 1 ;
          end
        end
        m_item_inp.buf_packet_out = new[prb_arr.size()](prb_arr) ;
      end

      if(axc_count[0] == 0) local_pc_id = 16;
      else local_pc_id = axc_count[0] ;

      if((symbol_array[sym_count] == local_id) && (m_cfg.pc_id_arr[axc_count[num]] == local_pc_id)) begin
        if(pkt_cnt < 0) pkt_cnt = 0;
        pkt_cnt = pkt_cnt + 1 ; 
        m_output[0].write(m_item_inp);
      `uvm_info("CU_COUPLING", $sformatf("Coupling PUSCH exp_output(1st 8bytes) : %0h AXC %0d SYM : %0d", {pkt.buf_packet_out[0],pkt.buf_packet_out[1],pkt.buf_packet_out[2],pkt.buf_packet_out[3],pkt.buf_packet_out[4],pkt.buf_packet_out[5],pkt.buf_packet_out[6],pkt.buf_packet_out[7],pkt.buf_packet_out[8],pkt.buf_packet_out[9],pkt.buf_packet_out[10],pkt.buf_packet_out[11],pkt.buf_packet_out[12],pkt.buf_packet_out[13],pkt.buf_packet_out[14],pkt.buf_packet_out[15],pkt.buf_packet_out[16],pkt.buf_packet_out[17],pkt.buf_packet_out[18],pkt.buf_packet_out[19],pkt.buf_packet_out[20],pkt.buf_packet_out[21],pkt.buf_packet_out[22],pkt.buf_packet_out[23],pkt.buf_packet_out[24],pkt.buf_packet_out[25],pkt.buf_packet_out[26],pkt.buf_packet_out[27],pkt.buf_packet_out[28],pkt.buf_packet_out[29],pkt.buf_packet_out[30],pkt.buf_packet_out[31],pkt.buf_packet_out[32],pkt.buf_packet_out[33],pkt.buf_packet_out[34],pkt.buf_packet_out[35],pkt.buf_packet_out[36],pkt.buf_packet_out[37],pkt.buf_packet_out[38],pkt.buf_packet_out[39],pkt.buf_packet_out[40],pkt.buf_packet_out[41],pkt.buf_packet_out[42],pkt.buf_packet_out[43],pkt.buf_packet_out[44],pkt.buf_packet_out[45],pkt.buf_packet_out[46],pkt.buf_packet_out[47]},axc_count[num],sym_count), UVM_HIGH);           // Displaying first 8 bytes (64 bits) of ORAN demapper output
      end
      m_item_inp = new() ; 
      pkt = new() ;
   
      
      if((pkt_cnt == ((local_cnt + (m_config.c_numSymbol[m_config.min_pc_id_arr][c_pkt_cnt][sec_cnt] * (m_config.pc_id_size)))))) begin 
         c_pkt_cnt = c_pkt_cnt + 1;
         local_cnt = pkt_cnt ;
         foreach(symbol_array[i]) symbol_array[i] = 0 ;
      end
      else begin
         c_pkt_cnt = c_pkt_cnt ;
         local_cnt = local_cnt ; 
      end
      

      if(pkt_cnt == (tot_sym *(m_config.pc_id_size))) begin 
        pkt_cnt = 2147483648 ;
        local_cnt = 0 ;
      end
      else begin 
        pkt_cnt = pkt_cnt ;
        local_cnt = local_cnt ; 
      end
                    
      if(pkt_cnt < 0) pkt_cnt = 0;
      
      if(axc_count[num] == 7) begin 
        sym_count = sym_count + 1 ;  
      end else if(axc_count[num] == 6) begin
        if(m_config.cc2_dis == 1) begin
           sym_count = sym_count + 1 ;  
        end else begin
           sym_count = sym_count ;
        end
      end
   end
   axc_count[num] = axc_count[num] + 2 ; 
endtask : c_u_coupling_ul_inj
`endif 
