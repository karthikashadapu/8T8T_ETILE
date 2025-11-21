/* ******************************************************************************************************************
 INTEL CONFIDENTIAL
 Copyright 2023 Intel Corporation All Rights Reserved.
 The source code contained or described herein and all documents related to the
 source code ("Material") are owned by Intel Corporation or its suppliers or
 licensors. Title to the Material remains with Intel Corporation or its
 suppliers and licensors. The Material may contain trade secrets and proprietary
 and confidential information of Intel Corporation and its suppliers and
 licensors, and is protected by worldwide copyright and trade secret laws and
 treaty provisions. No part of the Material may be used, copied, reprodeinterleavered,
 modified, published, uploaded, posted, transmitted, distributed, or disclosed
 in any way without Intels prior express written permission.
 No license under any patent, copyright, trade secret or other intellectual
 property right is granted to or conferred upon you by disclosure or delivery
 of the Materials, either expressly, by implication, indeinterleaverement, estoppel or
 otherwise. Any license under such intellectual property rights must be
 express and approved by Intel in writing.
 Unless otherwise agreed by Intel in writing, you may not remove or alter this
 notice or any other notice embedded in Materials by Intel or Intels suppliers
 or licensors in any way.
****************************************************************************************************************** */


`ifndef O_RU_REF_DEINTERLEAVER_SV 
`define O_RU_REF_DEINTERLEAVER_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_deinterleaver
//------------------------------------------------------------------------------ 


class o_ru_ref_deinterleaver extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_deinterleaver) 
  
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
   extern virtual task          deinterleaver_file(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config,int num);
   extern virtual task          deinterleaver_write(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config,int num);

endclass: o_ru_ref_deinterleaver
   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_deinterleaver::build_phase(uvm_phase phase);
     super.build_phase(phase);
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_deinterleaver::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 
 task o_ru_ref_deinterleaver::run_phase(uvm_phase phase);
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
                  if(m_config.mixed_mode == 2'd1) begin
                    file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_MIXED_100_60_EXP, "r");                                  // DEINTERLEAVER Lineup1 Mixed 100+60 output expected file read
                    file[1] = $fopen(`DEINTERLEAVER_OUT_LINEUP2_MIXED_100_60_EXP, "r");                                  // DEINTERLEAVER Lineup2 Mixed 100+60 output expected file read
                  end else if(m_config.mixed_mode == 2'd2) begin
                    file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_MIXED_60_100_EXP, "r");                                  // DEINTERLEAVER Lineup1 Mixed 60+100 output expected file read
                    file[1] = $fopen(`DEINTERLEAVER_OUT_LINEUP2_MIXED_60_100_EXP, "r");                                  // DEINTERLEAVER Lineup2 Mixed 60+100 output expected file read
                  end else begin
                     if(`IFFT_FFT_LPBK_EN == 1 ) begin
                        if(m_config.cc1_bw == 7'ha) begin 
                           if (m_config.fft1_Enable_reg1 == 1'b1)
                              file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_PHASECOMP_60_EXP, "r");                        // DEINTERLEAVER Lineup1 60MHz Phase Compensation output expected file read
                           else if (m_config.blanking == 2'd1)
                              file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_PRB_BLANK_60_EXP, "r");                        // DEINTERLEAVER Lineup1 60MHz PRB Blanking output expected file read
                           else
                              file[0] = $fopen(`IFFT_FFT_LPBK_DEINTERLEAVER_OUT_LINEUP1_60_EXP, "r");                    // DEINTERLEAVER Lineup1 60MHz output expected file read 
                        end else begin
                           if (m_config.fft1_Enable_reg1 == 1'b1)
                              file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_PHASECOMP_EXP, "r");                           // DEINTERLEAVER Lineup1 100MHz Phase Compensation output expected file read
                           else if (m_config.blanking == 1)
                              file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_PRB_BLANK_EXP, "r");                           // DEINTERLEAVER Lineup1 100MHz PRB Blanking output expected file read
                           else if (m_config.blanking == 2)
                              file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_1_AXC_BLANK_EXP, "r");                         // DEINTERLEAVER Lineup1 100MHz 1 AXC Blanking output expected file read
                           else if (m_config.blanking == 3)
                              file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_SYM_BLANK_EXP, "r");                           // DEINTERLEAVER Lineup1 100MHz SYM Blanking output expected file read
                           else if (m_config.blanking == 4)
                              file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_SYM_AXC_BLANK_EXP, "r");                       // DEINTERLEAVER Lineup1 100MHz SYM AXC Blanking output expected file read
                           else if (m_config.blanking == 6)
                              file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_SYM_AXC_PRB_BLANK_EXP, "r");                       // DEINTERLEAVER Lineup1 100MHz SYM AXC PRB Blanking output expected file read
		           else if (m_config.multi_sec == 1)
                              file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_MULTI_SEC_EXP, "r");                           // DEINTERLEAVER Lineup1 100MHz Multi Section output expected file read
                           else 
                              file[0] = $fopen(`IFFT_FFT_LPBK_DEINTERLEAVER_OUT_LINEUP1_EXP, "r");                       // DEINTERLEAVER Lineup1 100MHz output expected file read  
                        end
                        if(m_config.cc2_bw == 7'ha) begin
                           if(m_config.fft2_Enable_reg1 == 1'b1)
                              file[1] = $fopen(`DEINTERLEAVER_OUT_LINEUP2_PHASECOMP_60_EXP, "r");                        // DEINTERLEAVER Lineup2 Phase Compensation output expected file read
                           else if (m_config.blanking == 2'd1)
                              file[1] = $fopen(`DEINTERLEAVER_OUT_LINEUP2_PRB_BLANK_60_EXP, "r");                        // DEINTERLEAVER Lineup2 60MHz PRB Blanking output expected file read
                           else
                              file[1] = $fopen(`IFFT_FFT_LPBK_DEINTERLEAVER_OUT_LINEUP2_60_EXP, "r");                    // DEINTERLEAVER Lineup2 60MHz output expected file read
                        end else begin
                           if(m_config.fft2_Enable_reg1 == 1'b1)
                              file[1] = $fopen(`DEINTERLEAVER_OUT_LINEUP2_PHASECOMP_EXP, "r");                           // DEINTERLEAVER Lineup2 Phase Compensation output expected file read
                           else if (m_config.blanking == 2'd1)
                              file[1] = $fopen(`DEINTERLEAVER_OUT_LINEUP2_PRB_BLANK_EXP, "r");                           // DEINTERLEAVER Lineup2 100MHz PRB Blanking output expected file read
                           else if (m_config.blanking == 2'd2)
                              file[1] = $fopen(`DEINTERLEAVER_OUT_LINEUP2_1_AXC_BLANK_EXP, "r");                         // DEINTERLEAVER Lineup2 100MHz 1 AXC Blanking output expected file read
                           else
                              file[1] = $fopen(`IFFT_FFT_LPBK_DEINTERLEAVER_OUT_LINEUP2_EXP, "r");                       // DEINTERLEAVER Lineup2 100MHz output expected file read
                        end
                     end else begin
                        if(m_config.cc1_bw == 7'ha) begin
                           if (m_config.cc2_dis == 1)
                              file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_CC2_DIS_60_EXP, "r");                          // DEINTERLEAVER Lineup1 60MHz CC2 Disable output expected file read  
                           else 
                              file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_60_EXP, "r");                                  // DEINTERLEAVER Lineup1 60MHz output expected file read 
                        end else begin
                           if(m_config.delay_testing == 1'd1)
                              file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_DELAY_EXP, "r");
                           else if (m_config.cc2_dis == 1)
                              file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_CC2_DIS_EXP, "r");                             // DEINTERLEAVER Lineup1 100MHz CC2 Disable output expected file read  
                           else 
                              file[0] = $fopen(`DEINTERLEAVER_OUT_LINEUP1_EXP, "r");                                     // DEINTERLEAVER Lineup1 100MHz output expected file read  
                        end
                        if(m_config.cc2_bw == 7'ha)
                          file[1] = $fopen(`DEINTERLEAVER_OUT_LINEUP2_60_EXP, "r");                                      // DEINTERLEAVER Lineup2 60MHz output expected file read
                        else begin
                          if(m_config.delay_testing == 1'd1)
                             file[1] = $fopen(`DEINTERLEAVER_OUT_LINEUP2_DELAY_EXP, "r");
                          else
                             file[1] = $fopen(`DEINTERLEAVER_OUT_LINEUP2_EXP, "r");                                      // DEINTERLEAVER Lineup2 100MHz output expected file read
                        end
                     end
                  end               
               end
               counter = counter + 1;
               ref_item.buf_packet_out = new[m_item.buf_packet_out.size] (m_item.buf_packet_out) ;
                if(`FILE_BASED == 0)
                  deinterleaver_write(ref_item,m_config,scb_num);
                else
                  deinterleaver_file(ref_item,m_config,scb_num);
                
             end	
          end  // Fork
       join_none
     end
endtask : run_phase

task o_ru_ref_deinterleaver::deinterleaver_write(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config,int num);
  
   o_ru_ref_avsts_item pkt_tmp;
   pkt_tmp = new() ; 
   pkt_tmp.buf_packet_out = pkt.buf_packet_out ;
   $cast(m_item, pkt_tmp);
   `uvm_info("DEINTERLEAVER", $sformatf("DEINTERLEAVER exp_output(1st 8bytes) : %0h AXC_COUNT %0d", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7]},num), UVM_HIGH);                  // Displaying first 8 bytes (64 bits) of Deinterleaver output
   m_output[num].write(m_item);                                                            // Writing to scoreboard

endtask
task o_ru_ref_deinterleaver::deinterleaver_file(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config,int num);
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
   $cast(m_item, pkt_tmp);
   if((j == 0 && m_config.cc1_dis == 1) || (j == 1 && m_config.cc2_dis == 1))
     pkt_tmp.buf_packet_out = new[pkt.buf_packet_out.size];
   `uvm_info("DEINTERLEAVER", $sformatf("DEINTERLEAVER exp_output(1st 8bytes) : %0h AXC_COUNT %0d", {m_item.buf_packet_out[0],m_item.buf_packet_out[1],m_item.buf_packet_out[2],m_item.buf_packet_out[3],m_item.buf_packet_out[4],m_item.buf_packet_out[5],m_item.buf_packet_out[6],m_item.buf_packet_out[7]},num), UVM_HIGH);                  // Displaying first 8 bytes (64 bits) of Deinterleaver output
   m_output[j].write(m_item);                                                            // Writing to scoreboard
endtask : deinterleaver_file

`endif 
