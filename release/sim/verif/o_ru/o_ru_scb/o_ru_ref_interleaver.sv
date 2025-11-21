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

`ifndef O_RU_REF_INTERLEAVER_SV 
`define O_RU_REF_INTERLEAVER_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_interleaver
//------------------------------------------------------------------------------ 


class o_ru_ref_interleaver extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_interleaver) 

  bit[31:0] interleaver_write_arr[8][4448];   
  int axc_count,sym_count[2],symbol_cnt,out_trig_counter;
  int pkt_cnt[2]     ; 
  int file[2];
  int counter;

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
extern virtual task          interleaver_file(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config,int num);
extern virtual task          interleaver_write(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config,int num);
extern virtual task          interleaver_read_mix(input bit[31:0] queue[8][4448], ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          interleaver_read_even_axc(input bit[31:0] queue[8][4448], ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          interleaver_read_odd_axc(input bit[31:0] queue[8][4448], ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          conversion_32_to_8bit(input int arr[],ref o_ru_ref_avsts_item pkt);
endclass: o_ru_ref_interleaver

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_interleaver::build_phase(uvm_phase phase);
     super.build_phase(phase);
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_interleaver::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_interleaver::run_phase(uvm_phase phase);
     for(int i=0 ;i<2;i++) begin
       fork
          int scb_num = i ;
          begin 
             forever 
             begin
                m_item_inp  = new();
                m_item      = new();
                ref_item    = new();
                m_fifo[scb_num].get(m_item_inp);
                $cast(m_item,m_item_inp);
                if(counter == 0 ) begin
                   if(m_config.mixed_mode == 2'd1) begin
                      file[0] = $fopen(`INTLVR_OUT_LINEUP1_MIXED_100_60_EXP, "r");                  // Interleaver Lineup1 Mixed 100+60 output expected file read
                      file[1] = $fopen(`INTLVR_OUT_LINEUP2_MIXED_100_60_EXP, "r");                  // Interleaver Lineup2 Mixed 100+60 output expected file read
                   end else if(m_config.mixed_mode == 2'd2) begin
                      file[0] = $fopen(`INTLVR_OUT_LINEUP1_MIXED_60_100_EXP, "r");                  // Interleaver Lineup1 Mixed 60+100 output expected file read
                      file[1] = $fopen(`INTLVR_OUT_LINEUP2_MIXED_60_100_EXP, "r");                  // Interleaver Lineup2 Mixed 60+100 output expected file read
                   end else begin
                      if(m_config.cc1_bw == 7'ha)begin
		        if(m_config.phase_comp_en1 == 1'b1)				   
		          file[0] = $fopen(`INTLVR_OUT_LINEUP1_PHASECOMP_60_EXP, "r");              // Interleaver Lineup1 Phase Compensation output expected file read
                        else if (m_config.blanking == 2'd1) 
                          file[0] = $fopen(`INTLVR_OUT_LINEUP1_PRB_BLANK_60_EXP, "r");              // Interleaver Lineup1 60MHz PRB Blanking output expected file read
                        else 
                          file[0] = $fopen(`INTLVR_OUT_LINEUP1_60_EXP, "r");                        // Interleaver Lineup1 60MHz output expected file read
                      end
                      else begin
		        if(m_config.phase_comp_en1 == 1'b1)				   
		          file[0] = $fopen(`INTLVR_OUT_LINEUP1_PHASECOMP_EXP, "r");                 // Interleaver Lineup1 Phase Compensation output expected file read 
                        else if (m_config.delay_testing == 1'b1)
                          file[0] = $fopen(`INTLVR_OUT_LINEUP1_DELAY_EXP,"r");
                        else if (m_config.blanking == 1)
                          file[0] = $fopen(`INTLVR_OUT_LINEUP1_PRB_BLANK_EXP, "r");                 // Interleaver Lineup1 100MHz PRB Blanking output expected file read
                        else if (m_config.blanking == 2)
                          file[0] = $fopen(`INTLVR_OUT_LINEUP1_1_AXC_BLANK_EXP, "r");               // Interleaver Lineup1 100MHz 1 AXC Blanking output expected file read
                        else if (m_config.blanking == 3)
                          file[0] = $fopen(`INTLVR_OUT_LINEUP1_SYM_BLANK_EXP, "r");                 // Interleaver Lineup1 100MHz 1 SYM Blanking output expected file read
                        else if (m_config.blanking == 4)
                          file[0] = $fopen(`INTLVR_OUT_LINEUP1_SYM_AXC_BLANK_EXP, "r");             // Interleaver Lineup1 100MHz 1 SYM AXC Blanking output expected file read
                        else if (m_config.blanking == 6)
                          file[0] = $fopen(`INTLVR_OUT_LINEUP1_SYM_AXC_PRB_BLANK_EXP, "r");             // Interleaver Lineup1 100MHz 1 SYM AXC PRB Blanking output expected file read
		        else if (m_config.multi_sec == 1)
                          file[0] = $fopen(`INTLVR_OUT_LINEUP1_MULTI_SEC_EXP, "r");                 // Interleaver Lineup1 100MHz Multi Section output expected file read
                        else if (m_config.cc2_dis == 1)
                          file[0] = $fopen(`INTLVR_OUT_LINEUP1_CC2_DIS_EXP, "r");                   // Interleaver Lineup1 100MHz CC2 Disable output expected file read 
                        else
		          file[0] = $fopen(`INTLVR_OUT_LINEUP1_EXP, "r");                           // Interleaver Lineup1 output expected file read 
	              end
	              if(m_config.cc2_bw == 7'ha) begin
		        if(m_config.phase_comp_en2 == 1'b1)					    
		          file[1] = $fopen(`INTLVR_OUT_LINEUP2_PHASECOMP_60_EXP, "r");              // Interleaver Lineup2 Phase Compensation output expected file read 
                        else if (m_config.blanking == 2'd1) 
                          file[1] = $fopen(`INTLVR_OUT_LINEUP2_PRB_BLANK_60_EXP, "r");              // Interleaver Lineup2 60MHz PRB Blanking output expected file read
                        else
	                  file[1] = $fopen(`INTLVR_OUT_LINEUP2_60_EXP, "r");                        // Interleaver Lineup2 60MHz output expected file read
                      end
		      else begin
		        if(m_config.phase_comp_en2 == 1'b1)					    
		          file[1] = $fopen(`INTLVR_OUT_LINEUP2_PHASECOMP_EXP, "r");                 // Interleaver Lineup2 Phase Compensation output expected file read 
                        else if (m_config.delay_testing == 1'b1)
                          file[1] = $fopen(`INTLVR_OUT_LINEUP2_DELAY_EXP,"r"); 
                        else if (m_config.blanking == 2'd1)
                          file[1] = $fopen(`INTLVR_OUT_LINEUP2_PRB_BLANK_EXP, "r");                 // Interleaver Lineup2 100MHz PRB Blanking output expected file read
                        else if (m_config.blanking == 2'd2)
                          file[1] = $fopen(`INTLVR_OUT_LINEUP2_1_AXC_BLANK_EXP, "r");               // Interleaver Lineup2 100MHz 1 AXC Blanking output expected file read
		        else
		          file[1] = $fopen(`INTLVR_OUT_LINEUP2_EXP, "r");                           // Interleaver Lineup2 output expected file read 
                      end
                   end
		end
                counter = counter + 1;
                ref_item.buf_packet_out = new[m_item.buf_packet_out.size] (m_item.buf_packet_out) ;

                `uvm_info("INTERLEAVER_DEMAP", $psprintf("INTERLEAVER BUFFER ENTRY"), UVM_DEBUG);
                
                if(`FILE_BASED == 0)
                  interleaver_write(ref_item,m_config,scb_num);
                else 
                  interleaver_file(ref_item,m_config,scb_num);
                `uvm_info("INTERLEAVER_DEMAP", $psprintf("INTERLEAVER BUFFER EXIT"), UVM_DEBUG); 
                $cast(m_item_inp,ref_item);
             end	
          end                                                         // Fork
       join_none
     end
  endtask : run_phase

/////// Write all the AXC's Memory ////// 

task o_ru_ref_interleaver::interleaver_write(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config,int num);
   int counter,len,arr_cnt ;
   byte unsigned cp_arr[];
   byte unsigned prb_arr[];

   if(symbol_cnt == 14 ) symbol_cnt = 0;
   if(symbol_cnt == 0) begin
     len = 352 ;
     cp_arr = new[len * 4];
   end else begin
     len = 288 ;
     cp_arr = new[len * 4];
   end

   for(int j=0;j<cp_arr.size;j++) begin
     cp_arr[j] = pkt.buf_packet_out[(pkt.buf_packet_out.size) - (cp_arr.size - j)]; 
   end
   
   prb_arr = new[pkt.buf_packet_out.size + cp_arr.size];

   foreach(cp_arr[i]) begin
    prb_arr[arr_cnt] = cp_arr[i] ;
    arr_cnt = arr_cnt + 1;
   end
   foreach(pkt.buf_packet_out[i]) begin
    prb_arr[arr_cnt] = pkt.buf_packet_out[i] ;
    arr_cnt = arr_cnt + 1;
   end
   arr_cnt = 0;
   for(int i=0 ; i < prb_arr.size ;) begin
     interleaver_write_arr[axc_count][counter] = {prb_arr[i],prb_arr[i+1],prb_arr[i+2],prb_arr[i+3]};
     counter = counter + 1 ;
     i = i + 4 ;
   end
   counter = 0;
   out_trig_counter = out_trig_counter + 1;  
   if(out_trig_counter == 8)begin
     out_trig_counter = 0;
     `uvm_info("INTERLEAVER_DEMAP", $psprintf("INTERLEAVER BUFFER WRITE TASK CALL READ ENTRY AXC NO : %0d",axc_count), UVM_DEBUG);
     interleaver_read_mix(interleaver_write_arr,pkt,m_config) ;                                // Call the read task here
     foreach(interleaver_write_arr[i,j]) begin
        interleaver_write_arr[i][j] = 0;
     end
   end
   if(axc_count == 7) begin 
     axc_count = 0 ;
     symbol_cnt = symbol_cnt + 1 ; 
   end
   else if(axc_count == 6) begin 
     axc_count = 1 ; 
   end
   else begin 
     axc_count = axc_count + 2 ; 
   end
endtask


task o_ru_ref_interleaver::interleaver_read_mix(input bit[31:0] queue[pkt.AXC][4448], ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);
    fork
      interleaver_read_even_axc(queue,pkt,m_config);
      interleaver_read_odd_axc(queue,pkt,m_config);
    join
endtask

////// Read Even AXC's //////

task o_ru_ref_interleaver::interleaver_read_even_axc(input bit[31:0] queue[pkt.AXC][4448], ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);
   int array[];
   int counter = 0; 
   o_ru_ref_avsts_item pkt_tmp;
   pkt_tmp = new() ; 
   `uvm_info("INTERLEAVER_DEMAP", $psprintf("INTERLEAVER BUFFER READ TASK ENTRY"), UVM_DEBUG);
     
 
   for(int j=0 ; j < 4 ; j++) begin
     if(symbol_cnt == 0) begin
       array = new[4448];
     end else begin
       array = new[4384];
     end
     for(int i = 0; i < array.size ;) begin
        array[i] = {{queue[0][counter]}};
        array[i+1] = {{queue[2][counter]}};
        array[i+2] = {{queue[4][counter]}};
        array[i+3] = {{queue[6][counter]}};
        counter = counter + 1;
        i = i + 4;
     end
     `uvm_info("INTERLEAVER_DEMAP", $sformatf("Interleaved Even Array data: %0h", array[0]), UVM_DEBUG);          // Displaying first 8 bytes (64 bits) of INTERLEAVER demapper output
     conversion_32_to_8bit(array, pkt_tmp);          //Calling 32 bit to 8 bit conversion function
     $cast(m_item, pkt_tmp);
     `uvm_info("INTERLEAVER_DEMAP", $sformatf("INTERLEAVER dmpr Even exp_output(1st 8bytes) : %0h", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7]}), UVM_HIGH);          // Displaying first 8 bytes (64 bits) of INTERLEAVER demapper output
     m_output[0].write(m_item);                     // Writing to scoreboard
     m_item = new() ; 
     pkt_tmp = new() ;
     array = new[4448];
   end
endtask


///// Read Odd AXC's ///////////

task o_ru_ref_interleaver::interleaver_read_odd_axc(input bit[31:0] queue[pkt.AXC][4448], ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);
   int array[];
   int counter = 0; 
   o_ru_ref_avsts_item pkt_tmp;
   pkt_tmp = new() ; 
   `uvm_info("INTERLEAVER_DEMAP", $psprintf("INTERLEAVER BUFFER READ TASK ENTRY"), UVM_DEBUG);
   for(int j=0 ; j < 4 ; j++) begin
     if(symbol_cnt == 0) begin
       array = new[4448];
     end else begin
       array = new[4384];
     end
     for(int i = 0; i < array.size ;) begin
        array[i] = {{queue[1][counter]}};
        array[i+1] = {{queue[3][counter]}};
        array[i+2] = {{queue[5][counter]}};
        array[i+3] = {{queue[7][counter]}};
        counter = counter + 1;
        i = i + 4;
     end
     `uvm_info("INTERLEAVER_DEMAP", $sformatf("Interleaved ODD Array data: %0h", array[0]), UVM_DEBUG);          // Displaying first 8 bytes (64 bits) of INTERLEAVER demapper output
     conversion_32_to_8bit(array, pkt_tmp);          //Calling 32 bit to 8 bit conversion function
     $cast(m_item, pkt_tmp);
     `uvm_info("INTERLEAVER_DEMAP", $sformatf("INTERLEAVER dmpr Odd exp_output(1st 8bytes) : %0h", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7]}), UVM_HIGH);          // Displaying first 8 bytes (64 bits) of INTERLEAVER demapper output
     m_output[1].write(m_item);                     // Writing to scoreboard
     m_item = new() ; 
     pkt_tmp = new() ;
     array = new[4448];
   end  
endtask


task o_ru_ref_interleaver::conversion_32_to_8bit(input int arr[],ref o_ru_ref_avsts_item pkt);
   byte unsigned buf8bytes[];
   {>>{buf8bytes}}    = arr;                // 32 bit to 8 bit conversion
   `uvm_info("INTERLEAVER_DEMAP", $sformatf("Read Array: %0h  Converted Bytes %0h", arr[0],{buf8bytes[0],buf8bytes[1],buf8bytes[2],buf8bytes[3],buf8bytes[4],buf8bytes[5],buf8bytes[6],buf8bytes[7]}), UVM_DEBUG);           // Displaying first 8 bytes (64 bits) of INTERLEAVER demapper output
   pkt.buf_packet_out = buf8bytes;
endtask : conversion_32_to_8bit


task o_ru_ref_interleaver::interleaver_file(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config,int num);

   int j,data_len ;
   longint size ;
   longint lines;
   o_ru_ref_avsts_item pkt_tmp;
   pkt_tmp = new() ;

   if(sym_count[num] == 14 ) sym_count[num] = 0;
   j = num ;
   if(sym_count[num]==0) begin
     data_len = 17792;         /// 4096 + 352 samples
   end else begin
     data_len = 17536;         /// 4096 + 288 samples
   end 
   lines = data_len / 4 ;
   size = data_len ;
   file_read(file[j],size,lines,pkt.buf_packet_out);
   pkt_tmp.buf_packet_out = pkt.buf_packet_out ;
   $cast(m_item, pkt_tmp);
   if((j == 0 && m_config.cc1_dis == 1) || (j == 1 && m_config.cc2_dis == 1))
     pkt_tmp.buf_packet_out = new[pkt.buf_packet_out.size];
   `uvm_info("Interleaver", $sformatf("INTERLEAVER exp_output(1st 8bytes) : %0h", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7]}), UVM_HIGH);                  // Displaying first 8 bytes (64 bits) of FDV demapper output
   m_output[j].write(m_item);                                                                          // Writing to scoreboard
   pkt_cnt[num] = pkt_cnt[num] + 1 ;
   if(pkt_cnt[num] % 4 == 0) 
     sym_count[num] = sym_count[num] + 1 ;
   else   
     sym_count[num] = sym_count[num] ;
endtask : interleaver_file
`endif 
