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

`ifndef O_RU_REF_FDV_DEMAPPER_SV 
`define O_RU_REF_FDV_DEMAPPER_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_fdv_demapper
//------------------------------------------------------------------------------ 


class o_ru_ref_fdv_demapper extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_fdv_demapper) 

  bit[31:0] fdv_write_arr[8][3276];   
  int count_arr[8]                ;  
  localparam int AXC_NUM = 7      ; 
  localparam int RE = 12          ;
  localparam int PRB_CNT = 273    ;
  localparam int DCOMP_WIDTH = 16 ;
  int samp_num_tmp;
  int axc_num = 7;
  int pass_array ; 
  int sec_cnt = 1 ; 
  int pkt_cnt,sym_cnt[2],local_cnt,u_pkt    ; 
  int counter[8]  ;
  int even_stop_size;
  int odd_stop_size;
  bit even_pass_enb;
  bit odd_pass_enb;
  o_ru_ref_avsts_item ref_item; 
  o_ru_ref_avsts_item m_item;
  avsts_item m_item_inp; 
  int even_clear_samp ;
  int odd_clear_samp ;
  int symbol_array [14] ,c_pkt_cnt,curr_c_pkt_cnt=10000;
  int local_id     ;
  int tot_sym , tot_prb[8] ;
  shortint min_pc_id;
   //------------------------------------------------------------------------------ 
   // Constructor 
   //------------------------------------------------------------------------------ 
   function new (string name, uvm_component parent); 
      super.new(name, parent);
   endfunction : new 

extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);
extern virtual task          conversion_32_to_8bit(input int arr[],ref o_ru_ref_avsts_item pkt);
extern virtual task          run_phase(uvm_phase phase);
extern virtual task          fdv_reference_demapper(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          axc_id_change(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          pass_array_enb(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          fdv_write(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          fdv_read_even_axc(input bit[31:0] queue[8][3276], ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          fdv_read_odd_axc(input bit[31:0] queue[8][3276], ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);
endclass: o_ru_ref_fdv_demapper

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_fdv_demapper::build_phase(uvm_phase phase);
     super.build_phase(phase);
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_fdv_demapper::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_fdv_demapper::run_phase(uvm_phase phase);
     fork
        begin 
           forever 
           begin
              m_item_inp  = new();
              m_item      = new();
              ref_item    = new();
              m_fifo[0].get(m_item_inp);
              $cast(m_item,m_item_inp);
              ref_item.buf_packet_out = new[m_item.buf_packet_out.size] (m_item.buf_packet_out) ;

              ref_item.pc_id           = m_item.pc_id;
              ref_item.msg_type        = m_config.msg_type;
              ref_item.startprb_u      = m_config.startprb_u;
              ref_item.numprb_u        = m_config.numprb_u;
 

              ref_item.rx_data_q = ref_item.buf_packet_out;
              `uvm_info("FDV_DEMAP", $psprintf("FDV BUFFER ENTRY Size is %0d",ref_item.buf_packet_out.size), UVM_HIGH);
              axc_id_change(ref_item,m_config);
              fdv_reference_demapper(ref_item,m_config);
              `uvm_info("FDV_DEMAP", $psprintf("FDV BUFFER EXIT"), UVM_DEBUG); 
              $cast(m_item_inp,ref_item);
	   end	
        end                                                         // Fork
     join_none
  endtask : run_phase


task o_ru_ref_fdv_demapper::fdv_reference_demapper(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);
   fdv_write(pkt,m_config);
endtask

///eAXC ID Mapping /////
task o_ru_ref_fdv_demapper::axc_id_change(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);
   foreach(m_config.dl_mac_axc[i]) begin
      if (m_config.dl_mac_axc[i] == pkt.pc_id) begin
         pkt.pc_id = i ;
         break;
      end
   end

endtask

///// Check Whether All the AXC's Memory are filled ////
task o_ru_ref_fdv_demapper::pass_array_enb(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);
     int bal_prb;
      
     if(m_config.cc2_bw == 7'he) begin
       odd_stop_size = 3276*4;
       bal_prb = 273 - tot_prb[pkt.pc_id] ;
     end
     else begin 
       odd_stop_size = 1944*4; 
       bal_prb = 162 - tot_prb[pkt.pc_id] ;
     end
     if(m_config.cc1_bw == 7'he) begin
       even_stop_size = 3276*4;
       bal_prb = 273 - tot_prb[pkt.pc_id] ;
     end
     else begin 
       even_stop_size = 1944*4;
       bal_prb = 162 - tot_prb[pkt.pc_id] ;
     end

     if(m_config.blanking == 1 || m_config.blanking == 5 || m_config.blanking == 6) begin     //// Check for PRB Blanking cases
       counter[pkt.pc_id] = (counter[pkt.pc_id] + pkt.buf_packet_out.size()) + (bal_prb * 48);
     end else begin 
       counter[pkt.pc_id] = counter[pkt.pc_id] + pkt.buf_packet_out.size() ;
     end
  
     for(int i = 0 ; i < 8 ; i = i + 1) begin    /// Check All AXC are there if not fill the AXC's with 0's
       if(i == 0) begin
         if(m_config.pc_id_arr[i] != 16) begin
           counter[0] = ((273 * 48));
         end
       end
       else begin
         if(m_config.pc_id_arr[i] != i) begin
           counter[i] = ((273 * 48));
         end
       end
     end
 
     if (counter[0] >= even_stop_size && counter[2] >= even_stop_size && counter[4] >= even_stop_size && counter[6] >= even_stop_size ) begin
         even_pass_enb = 1;
     end
     if (counter[1] >= odd_stop_size && counter[3] >= odd_stop_size && counter[5] >= odd_stop_size && counter[7] >= odd_stop_size ) begin
         odd_pass_enb = 1;
     end

endtask

/////// Write all the AXC's Memory ////// 
task o_ru_ref_fdv_demapper::fdv_write(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);
   int bytes_cnt,prb_cnt,prb_start;
   o_ru_ref_avsts_item pkt_tmp;
   pkt_tmp = new() ; 

   axc_num = pkt.pc_id ;
   struct_1.c_width = DCOMP_WIDTH;
   bytes_cnt = ((RE * 2 * struct_1.c_width ) / 8) ;       ///// To find how many bytes for 1 PRB /////
   `uvm_info("FDV_DEMAP", $psprintf("FDV BUFFER WRITE TASK ENTRY AXC NO : %0d Pass Array %0d AXC NUM %0d",axc_num,pass_array,AXC_NUM), UVM_HIGH);

   if(c_pkt_cnt != curr_c_pkt_cnt) begin   /// Symbol Array formed for every new C-Plane packets
     tot_sym = 0 ;
     min_pc_id = m_config.min_pc_id_arr ;
     foreach(symbol_array[i]) symbol_array[i] = 0 ;
     for(int j = 0; j < m_config.c_numberOfSections[min_pc_id][c_pkt_cnt] ; j= j + 1)begin
       for(int i = m_config.c_startSymbolid[min_pc_id][c_pkt_cnt] ; i < m_config.c_numSymbol[min_pc_id][c_pkt_cnt][j] + m_config.c_startSymbolid[min_pc_id][c_pkt_cnt]; i = i + 1) begin
          if(i == 0) symbol_array[i] = 16 ;
          else symbol_array[i] = i ;
       end
       tot_sym = m_config.c_numSymbol[min_pc_id][c_pkt_cnt][0]  ;
     end
     curr_c_pkt_cnt = c_pkt_cnt ;
   end
   
   tot_prb[axc_num] = 0;
   
   if(sym_cnt[0] == 0) begin
     for(int k = sym_cnt[0] ; k < 14 ;) begin   /// Loop for 14 Symbols
      if(sym_cnt[0] == 0) local_id = 16;
      else local_id = sym_cnt[0] ;

      if(symbol_array [sym_cnt[0]] == local_id) begin  // Check Next Symbol is there in Symbol Array
        k = 15;
        sym_cnt[0] = sym_cnt[0] ;
        break;
      end 
      else begin
        for (int i = 0; i< 4;i= i + 1) begin   // Loop for all 4 AXC's if Symbol is not there
     
           pkt_tmp.buf_packet_out = new[273 * 48];
           $cast(m_item, pkt_tmp);
           m_output[0].write(m_item);    
           `uvm_info("FDV_DEMAP", $sformatf("FDV dmpr exp_output(1st 8bytes) : %0h Blanked SYM : %0d PKT : %0d C PKT %0d", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7]},sym_cnt[0],pkt_cnt,c_pkt_cnt), UVM_HIGH);             // Displaying first 8 bytes (64 bits) of FDV demapper output
           m_item = new() ; 
           pkt_tmp = new() ;
           //pkt_cnt = pkt_cnt + 1 ; 
        end                 // Writing to scoreboard
        k = k + 1 ;
        sym_cnt[0] = sym_cnt[0] + 1;
      end  
     end 
   end 

   
   for(int j=0;j < m_config.c_numberOfSections[axc_num][c_pkt_cnt] ;j = j + 1) begin                      //// Looping through Section count if in case it is a multiple sections packet to collect all PRB's of that AXC
      prb_cnt = pkt.numprb_u[u_pkt][j] ;
      if(prb_cnt == 0) begin 
        prb_cnt   = PRB_CNT;
      end else begin
        prb_cnt   = prb_cnt                   ; 
      end

      for(int i = (pkt.startprb_u[u_pkt][j] * bytes_cnt) / 4; i < ((prb_cnt + pkt.startprb_u[u_pkt][j]) * bytes_cnt ) / 4; i = i + 1) begin
         samp_num_tmp= i;
         fdv_write_arr[axc_num][samp_num_tmp] = {pkt.buf_packet_out[count_arr[axc_num]],pkt.buf_packet_out[count_arr[axc_num]+1],pkt.buf_packet_out[count_arr[axc_num]+2],pkt.buf_packet_out[count_arr[axc_num]+3]};  
         `uvm_info(" FDV_DEMAP", $sformatf("Queue:%0d Samp_num:%0d Data:%0h",axc_num,samp_num_tmp,fdv_write_arr[axc_num][samp_num_tmp]), UVM_HIGH);          // Displaying first 8 bytes (64 bits) of FDV demapper output
         count_arr[axc_num] = count_arr[axc_num] + 4 ; 
      end
      tot_prb[axc_num] =  m_config.c_numprb_c[axc_num][c_pkt_cnt][j] + tot_prb[axc_num];    
   end   
   if(tot_prb[axc_num] == 0) tot_prb[axc_num] = 273;
   count_arr[axc_num] = 0 ; 
   pass_array_enb(pkt,m_config);
   
   if(even_pass_enb == 1) begin
     even_pass_enb = 0 ;
     sym_cnt[0] = sym_cnt[0] + 1 ;
     fdv_read_even_axc(fdv_write_arr,pkt,m_config);
     `uvm_info("FDV_DEMAP", $psprintf("FDV BUFFER WRITE TASK CALL EVEN READ ENTRY AXC NO : %0d",axc_num), UVM_HIGH);
     for(int i=0;i<7;i=i+2) begin
       counter[i] = 0 ; 
       for(int j=0;j<even_clear_samp;j=j+1)begin
          fdv_write_arr[i][j] = 0;
       end
       count_arr[i] = 0;
     end
   end
   if(m_config.cc2_dis == 0) begin
     if(odd_pass_enb == 1) begin
       odd_pass_enb  = 0 ;
       sym_cnt[1] = sym_cnt[1] + 1 ;
       fdv_read_odd_axc(fdv_write_arr,pkt,m_config);
       `uvm_info("FDV_DEMAP", $psprintf("FDV BUFFER WRITE TASK CALL ODD READ ENTRY AXC NO : %0d",axc_num), UVM_HIGH);
       for(int i=1;i<8;i=i+2) begin
         counter[i] = 0 ; 
         for(int j=0;j<odd_clear_samp;j=j+1)begin
            fdv_write_arr[i][j] = 0;
         end
         count_arr[i] = 0;
       end
     end
   end
endtask

////// Read Even AXC's //////
task o_ru_ref_fdv_demapper::fdv_read_even_axc(input bit[31:0] queue[pkt.AXC][pkt.SAMPLES], ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);
   
   int array[],no_of_samples, tot_axc;
   o_ru_ref_avsts_item pkt_tmp;
   pkt_tmp = new() ; 
   `uvm_info("FDV_DEMAP", $psprintf("FDV BUFFER EVEN READ TASK ENTRY"), UVM_HIGH);
    
   if(m_config.cc1_bw == 7'ha) no_of_samples = pkt.SAMPLES_60 ;
   else no_of_samples = pkt.SAMPLES ;
  
   even_clear_samp = no_of_samples ; 
   for(int j = 0; j < 7; j=j+2) begin
     array = new[no_of_samples];
     for(int i = 0; i < no_of_samples ; i++) begin
        array[i] = {{queue[j][i][15:0], queue[j][i][31:16]}};
     end
     conversion_32_to_8bit(array, pkt_tmp);          //Calling 32 bit to 8 bit conversion function
     $cast(m_item, pkt_tmp);
     `uvm_info("FDV_DEMAP", $sformatf("FDV dmpr exp_output(1st 8bytes) : %0h AXC %0d PKT : %0d C PKT %0d TOT SYM %0d", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7]},j,pkt_cnt,c_pkt_cnt,tot_sym), UVM_HIGH);             // Displaying first 8 bytes (64 bits) of FDV demapper output
     m_output[0].write(m_item);                     // Writing to scoreboard
     m_item = new() ; 
     pkt_tmp = new() ;
     pkt_cnt = pkt_cnt + 1 ; 
     u_pkt   = u_pkt + 1 ; 

     if(m_config.cc1_dis == 1 || m_config.cc2_dis == 1) begin
       tot_axc = 4 ;
     end else begin
       tot_axc = 8 ;
     end
     if(pkt_cnt == ((tot_sym * tot_axc))) begin  // Next C-Plane packet formed for Total Symbols 
       c_pkt_cnt = c_pkt_cnt + 1;
       pkt_cnt = 0 ;
     end else begin
       c_pkt_cnt = c_pkt_cnt ;
       pkt_cnt = pkt_cnt ;
     end
   end

   for(int k = sym_cnt[0] ; k < 14 ;) begin   /// Loop for 14 Symbols
    if(sym_cnt[0] == 0) local_id = 16;
    else local_id = sym_cnt[0] ;

    if(symbol_array [sym_cnt[0]] == local_id) begin  // Check Next Symbol is there in Symbol Array
      k = 15;
      sym_cnt[0] = sym_cnt[0] ;
      break;
    end 
    else begin
      for (int i = 0; i< 4;i= i + 1) begin   // Loop for all 4 AXC's if Symbol is not there
         m_item.buf_packet_out = new[even_clear_samp * 4];
         m_output[0].write(m_item);    
         `uvm_info("FDV_DEMAP", $sformatf("FDV dmpr exp_output(1st 8bytes) : %0h Blanked SYM : %0d PKT : %0d C PKT %0d", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7]},sym_cnt[0],pkt_cnt,c_pkt_cnt), UVM_HIGH);             // Displaying first 8 bytes (64 bits) of FDV demapper output
         //pkt_cnt = pkt_cnt + 1 ; 
      end                 // Writing to scoreboard
      k = k + 1 ;
      sym_cnt[0] = sym_cnt[0] + 1;
    end  
    tot_sym = 0;
    foreach(symbol_array[i]) symbol_array[i] = 0 ;
    for(int j = 0; j < m_config.c_numberOfSections[min_pc_id][c_pkt_cnt] ; j= j + 1)begin
      for(int i = m_config.c_startSymbolid[min_pc_id][c_pkt_cnt] ; i < m_config.c_numSymbol[min_pc_id][c_pkt_cnt][j] + m_config.c_startSymbolid[min_pc_id][c_pkt_cnt]; i = i + 1) begin
         if(i == 0) symbol_array[i] = 16 ;
         else symbol_array[i] = i ;
      end
      tot_sym = m_config.c_numSymbol[min_pc_id][c_pkt_cnt][0] ;
    end
   end

   if(sym_cnt[0] == 14) sym_cnt[0] = 0;

endtask

///// Read Odd AXC's ///////////
task o_ru_ref_fdv_demapper::fdv_read_odd_axc(input bit[31:0] queue[pkt.AXC][pkt.SAMPLES], ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);
   
   int array[],no_of_samples;
   o_ru_ref_avsts_item pkt_tmp;
   pkt_tmp = new() ; 
   `uvm_info("FDV_DEMAP", $psprintf("FDV BUFFER ODD READ TASK ENTRY"), UVM_HIGH);

   if(m_config.cc2_bw == 7'ha) no_of_samples = pkt.SAMPLES_60 ;
   else no_of_samples = pkt.SAMPLES ;
   
   odd_clear_samp = no_of_samples ; 
   for(int j = 1; j < 8; j=j+2) begin
     array = new[no_of_samples];
     for(int i = 0; i < no_of_samples ; i++) begin
        array[i] = {{queue[j][i][15:0], queue[j][i][31:16]}};
     end
     conversion_32_to_8bit(array, pkt_tmp);          //Calling 32 bit to 8 bit conversion function
     $cast(m_item, pkt_tmp);
     `uvm_info("FDV_DEMAP", $sformatf("FDV dmpr exp_output(1st 8bytes) : %0h AXC %0d", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7]},j), UVM_HIGH);             // Displaying first 8 bytes (64 bits) of FDV demapper output 
     m_output[1].write(m_item);                     // Writing to scoreboard
     u_pkt   = u_pkt + 1 ; 
     m_item = new() ; 
     pkt_tmp = new() ;
   end
   for(int k = sym_cnt[1] ; k < 14 ;) begin
    
    if(sym_cnt[1] == 0) local_id = 16;
    else local_id = sym_cnt[1] ;

    if(symbol_array [sym_cnt[1]] == local_id) begin
      k = 15;
      sym_cnt[1] = sym_cnt[1] ;
      break;
    end 
    else begin
      for (int i = 0; i< 4;i= i + 1) begin
        m_item.buf_packet_out = new[m_item.buf_packet_out.size];
        m_output[1].write(m_item);                     // Writing to scoreboard
        `uvm_info("FDV_DEMAP", $sformatf("FDV dmpr exp_output(1st 8bytes) : %0h Blanked SYM : %0d", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7]},sym_cnt[0]), UVM_HIGH);             // Displaying first 8 bytes (64 bits) of FDV demapper output
      end
      k = k + 1 ;
      sym_cnt[1] = sym_cnt[1] + 1;
    end  
   end
   if(sym_cnt[1] == 14) sym_cnt[1] = 0;
     
endtask

task o_ru_ref_fdv_demapper::conversion_32_to_8bit(input int arr[],ref o_ru_ref_avsts_item pkt);
   byte unsigned buf8bytes[];
   {>>{buf8bytes}}    = arr;                // 32 bit to 8 bit conversion
   `uvm_info("FDV_DEMAP", $sformatf("Read Array: %0h  Converted Bytes %0h", arr[0],{buf8bytes[0],buf8bytes[1],buf8bytes[2],buf8bytes[3],buf8bytes[4],buf8bytes[5],buf8bytes[6],buf8bytes[7]}), UVM_DEBUG);           // Displaying first 8 bytes (64 bits) of FDV demapper output
   pkt.buf_packet_out = buf8bytes;
endtask : conversion_32_to_8bit

`endif 
