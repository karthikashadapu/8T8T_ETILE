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

`ifndef O_RU_CMP_SV 
`define O_RU_CMP_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_cmp
//------------------------------------------------------------------------------ 


class o_ru_cmp extends o_ru_base_cmp;
  `uvm_component_utils(o_ru_cmp)

  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
  
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual task          run_phase(uvm_phase phase);
  extern virtual function void report_phase(uvm_phase phase);
  extern virtual task          load_ref_pkt(int scb_num);
  extern virtual task          cmp_dut_pkt(int scb_num);
  extern virtual function bit compare_dut_item(ref int scb_num, ref avsts_item dut_item, ref avsts_item ref_item); 
  extern virtual function automatic real CalcNMSE(int L,shortint complex_data_ref_obs[], shortint complex_data_ULPath[] );
 
  avsts_item dut_item[];
  avsts_item ref_item[];
  avsts_item ref_item_mem[][$];
  int m_data_if_max_cnt;
  int pkt_cnt[31] ;
  string scb_name[31]; 
  int filename[31]  ;
endclass : o_ru_cmp

function void o_ru_cmp::build_phase(uvm_phase phase);
   super.build_phase(phase);
   foreach(o_ru_config_pkg::c_avsts_mon_data_cnt[index]) begin
      m_data_if_max_cnt += c_avsts_mon_data_cnt[index];
   end 
   dut_item = new[m_data_if_max_cnt];
   ref_item = new[m_data_if_max_cnt];
   ref_item_mem = new[m_data_if_max_cnt];
   if (`FILE_WRITE_EN == 1) begin      
      filename[0]  = $fopen("eCPRI_demapper_obs.csv","w");   
      filename[1]  = $fopen("ORAN_demapper_obs.csv","w");  
      filename[2]  = $fopen("FDV_demapper_obs_1.csv","w");  
      filename[3]  = $fopen("ORAN_mapper_obs.csv","w");
      filename[4]  = $fopen("eCPRI_mapper_obs.csv","w");
      filename[5]  = $fopen("c_u_coupling_obs.csv","w");
      filename[6]  = $fopen("FDV_demapper_obs_2.csv","w");    
      filename[7]  = $fopen("IFFT_obs_1.csv","w");    
      filename[8]  = $fopen("IFFT_obs_2.csv","w");   
      filename[9]  = $fopen("Interleaver_obs_1.csv","w");  
      filename[10] = $fopen("Interleaver_obs_2.csv","w");  
      filename[11] = $fopen("DUC_obs_1.csv","w");  
      filename[12] = $fopen("DUC_obs_2.csv","w");  
      filename[13] = $fopen("Mixer_DL_obs_1.csv","w");  
      filename[14] = $fopen("Mixer_DL_obs_2.csv","w");  
      filename[15] = $fopen("Summer_obs.csv","w");  
      filename[16] = $fopen("Interpolator_obs.csv","w");
      filename[17] = $fopen("Decimator_obs.csv","w");  
      filename[18] = $fopen("Mixer_UL_obs_1.csv","w");  
      filename[19] = $fopen("Mixer_UL_obs_2.csv","w");  
      filename[20] = $fopen("DDC_obs_1.csv","w");
      filename[21] = $fopen("DDC_obs_2.csv","w");
      filename[22] = $fopen("Deinterleaver_obs_1.csv","w");
      filename[23] = $fopen("Deinterleaver_obs_2.csv","w");
      filename[24] = $fopen("FFT_obs_1.csv","w");
      filename[25] = $fopen("FFT_obs_2.csv","w");
      filename[26] = $fopen("PRACH_obs_1.csv","w");
      filename[27] = $fopen("PRACH_obs_2.csv","w");
      filename[28] = $fopen("Coupling_PRACH_obs.csv","w"); 
      filename[29] = $fopen("ORAN_PRACH_Mapper_obs.csv","w"); 
      filename[30] = $fopen("eCPRI_PRACH_Mapper_obs.csv","w"); 
   end 
     
endfunction : build_phase  

function void o_ru_cmp::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
endfunction: connect_phase

task o_ru_cmp::load_ref_pkt(int scb_num);
   m_fifo_ref[scb_num].get(ref_item[scb_num]); 
   ref_item_mem[scb_num].push_back(ref_item[scb_num]);
   if(scb_num==2)
   `uvm_info("Compare", $psprintf("SCB_NUM:%0d, Reference Packet received item Data=%0h\n", scb_num,ref_item[scb_num].buf_packet_out[0]), UVM_HIGH)
   this.vect_cnt++;
endtask : load_ref_pkt

task o_ru_cmp::cmp_dut_pkt(int scb_num);
   int max_packet,enable_check=1 ;
   shortint pc_id ;
   avsts_item packet;
   packet = new();
   m_fifo_dut[scb_num].get(dut_item[scb_num]);
   scb_name = {"ECPRI_DEMAPPER", "ORAN_DEMAPPER", "FDV_DEMAPPER_LINK_1", "ORAN_MAPPER", "ECPRI_MAPPER" ,"COUPLING_PUSCH","FDV_DEMAPPER_LINK_2","IFFT_LINEUP_1","IFFT_LINEUP_2","INTERLEAVER_LINEUP_1","INTERLEAVER_LINEUP_2","DUC_LINEUP_1","DUC_LINEUP_2","MIXER_DL_LINEUP_1","MIXER_DL_LINEUP_2","SUMMER","INTERPOLATOR","DECIMATOR","MIXER_UL_LINEUP_1","MIXER_UL_LINEUP_2","DDC_LINEUP_1","DDC_LINEUP_2","DEINTERLEAVER_LINEUP_1","DEINTERLEAVER_LINEUP_2","FFT_LINEUP_1","FFT_LINEUP_2","PRACH_OUT_1","PRACH_OUT_2","COUPLING_PRACH","ORAN_PRACH_MAPPER","ECPRI_PRACH_MAPPER"};
      `uvm_info("O_RU_CMP", $sformatf(" SCB Num =%0d, ref_item_mem Size=%0d",scb_num,ref_item_mem[scb_num].size()), UVM_DEBUG);
      if((scb_num >= 6 && scb_num <= 25) || scb_num == 2) begin
        max_packet = (((`SYM_NUM - 1) * `SF_NUM) * `AXC_NUM) / 2 ;  /// Blocks After FDV
      end
      else if(scb_num != 0 && scb_num != 1) begin
        if(scb_num == 26 || scb_num == 27) begin 
          max_packet = ((12 * `SF_NUM) * `AXC_NUM) / 2;     /// PRACH DSPBA
        end else if(scb_num >= 28) begin 
          max_packet = ((12 * `SF_NUM) * `AXC_NUM) ;       /// PRACH ANT MUX, oRAN PRACH and eCPRI PRACH 
        end else if(scb_num == 3 || scb_num == 4) begin
          if(m_o_ru_config.o_ru_cfg.mtu_size == 1500) begin
            max_packet = (((`SYM_NUM - 1) * `SF_NUM) * `AXC_NUM) * 6 ; /// oRAN PUSCH and eCPRI PUSCH /// 31 Fragment Case
          end else if(m_o_ru_config.o_ru_cfg.mtu_size == 9000) begin 
            max_packet = (((`SYM_NUM - 1) * `SF_NUM) * `AXC_NUM) * 2 ; /// oRAN PUSCH and eCPRI PUSCH /// 91 Fragment Case
          end else if(m_o_ru_config.o_ru_cfg.multi_sec == 1) begin
            max_packet = (((`SYM_NUM - 1) * `SF_NUM) * `AXC_NUM) * 8 ; /// oRAN PUSCH and eCPRI PUSCH /// Max 8 Sections
          end else begin
            max_packet = (((`SYM_NUM - 1) * `SF_NUM) * `AXC_NUM)     ; /// oRAN PUSCH and eCPRI PUSCH // 273 PRB's
          end

          if(m_o_ru_config.o_ru_cfg.cc1_dis == 1 || m_o_ru_config.o_ru_cfg.cc2_dis == 1) begin
            max_packet = max_packet / 2 ;
          end else begin
            max_packet = max_packet ;
          end
        end else begin 
          if(m_o_ru_config.o_ru_cfg.cc1_dis == 1 || m_o_ru_config.o_ru_cfg.cc2_dis == 1) begin
            max_packet = (((`SYM_NUM - 1) * `SF_NUM) * (`AXC_NUM / 2)) ; /// Coupling 
          end else begin
            max_packet = (((`SYM_NUM - 1) * `SF_NUM) * `AXC_NUM) ; /// Coupling 
          end
        end
      end
      if(scb_num != 0 && scb_num != 1) begin
        if(pkt_cnt[scb_num] <= max_packet - 1) begin   /// Check only till Packets Sent as FDV Buffer will always be giving output.
          if((scb_num == 3 || scb_num == 4 || scb_num == 29 || scb_num == 30)) begin
            if(scb_num == 3) begin
              if(dut_item[scb_num].buf_packet_out[0][3:0] == 0)   //// Check for PUSCH Packets oRAN Mapper Filter Index 
                enable_check = 1 ;
              else
                enable_check = 0 ;
            end else if(scb_num == 4) begin
              pc_id = {dut_item[scb_num].buf_packet_out[18],dut_item[scb_num].buf_packet_out[19]}; //// Check for PUSCH Packets eCPRI Mapper Channel
              if(dut_item[scb_num].buf_packet_out[22][3:0] == 0)
                enable_check = 1 ;
              else
                enable_check = 0 ;
            end else if(scb_num == 29) begin
              if(dut_item[scb_num].buf_packet_out[0][3:0] >= 1)  //// Check for PRACH Packets oRAN Mapper Filter Index
                enable_check = 1 ;
              else
                enable_check = 0 ;
            end else begin
              pc_id = {dut_item[scb_num].buf_packet_out[18],dut_item[scb_num].buf_packet_out[19]};  //// Check for PRACH Packets eCPRI Mapper Channel
              if(dut_item[scb_num].buf_packet_out[22][3:0] >= 1)
                enable_check = 1 ;
              else
                enable_check = 0 ;
            end
            if(enable_check == 1) begin
              if (ref_item_mem[scb_num].size() > 0) begin 
                 packet =  ref_item_mem[scb_num].pop_front();
              end else begin
                  `uvm_error("O_RU_CMP", $sformatf("Scoreboard_name: %s, Scoreboard_num: %0d ,Reference Mem Empty  PKT_CNT=%0d",scb_name[scb_num],scb_num,pkt_cnt[scb_num]));
              end
              if(compare_dut_item(scb_num,dut_item[scb_num],packet)) begin
                 this.error_cnt++;
                 `uvm_error("O_RU_CMP", $sformatf("Scoreboard_name: %s, FAILED AT PKT_CNT=%0d",scb_name[scb_num],pkt_cnt[scb_num]));
              end else begin
                 this.pass_cnt++;
                 `uvm_info("O_RU_CMP", $sformatf("Scoreboard_name: %s, PASSED PKT_CNT=%0d",scb_name[scb_num], pkt_cnt[scb_num]), UVM_LOW);
              end
            end
          end else begin
            if(enable_check == 1) begin
              if (ref_item_mem[scb_num].size() > 0) begin 
                 packet =  ref_item_mem[scb_num].pop_front();
              end else begin
                  `uvm_error("O_RU_CMP", $sformatf("Scoreboard_name: %s, Scoreboard_num: %0d ,Reference Mem Empty  PKT_CNT=%0d",scb_name[scb_num],scb_num,pkt_cnt[scb_num]));
              end
              if(compare_dut_item(scb_num,dut_item[scb_num],packet)) begin
                 this.error_cnt++;
                 `uvm_error("O_RU_CMP", $sformatf("Scoreboard_name: %s, FAILED AT PKT_CNT=%0d",scb_name[scb_num],pkt_cnt[scb_num]));
              end else begin
                 this.pass_cnt++;
                 `uvm_info("O_RU_CMP", $sformatf("Scoreboard_name: %s, PASSED PKT_CNT=%0d",scb_name[scb_num], pkt_cnt[scb_num]), UVM_LOW);
              end
            end
          end
        end
      end else begin
        if (ref_item_mem[scb_num].size() > 0) begin 
           packet =  ref_item_mem[scb_num].pop_front();
        end else begin
            `uvm_error("O_RU_CMP", $sformatf("Scoreboard_name: %s, Scoreboard_num: %0d ,Reference Mem Empty  PKT_CNT=%0d",scb_name[scb_num],scb_num,pkt_cnt[scb_num]));
        end
        if(compare_dut_item(scb_num,dut_item[scb_num],packet)) begin
           this.error_cnt++;
           `uvm_error("O_RU_CMP", $sformatf("Scoreboard_name: %s, FAILED AT PKT_CNT=%0d",scb_name[scb_num],pkt_cnt[scb_num]));
        end else begin
           this.pass_cnt++;
           `uvm_info("O_RU_CMP", $sformatf("Scoreboard_name: %s, PASSED PKT_CNT=%0d",scb_name[scb_num], pkt_cnt[scb_num]), UVM_LOW);
        end
      end
endtask : cmp_dut_pkt


task o_ru_cmp::run_phase(uvm_phase phase);
   int num_act_if;
   `uvm_info(get_type_name(), "Run phase called", UVM_FULL)
   foreach(m_fifo_ref[i]) begin
      fork   
         int scb_num = i;
         begin
            forever begin
               cmp_dut_pkt(scb_num);
               if(this.vect_cnt>0) this.vect_cnt--;
            end
         end
      join_none
   end // foreach


  foreach(m_fifo_ref[i]) begin
     fork   
        int scb_num = i;
        begin
           forever begin load_ref_pkt(scb_num); end
        end
     join_none
  end // foreach
endtask : run_phase


function void o_ru_cmp::report_phase(uvm_phase phase);
   bit failed = 0;
   `uvm_info(get_type_name(), "CMP Report phase called", UVM_FULL)
 
   // Check size of drv fifo's
   foreach(ref_item_mem[i]) begin
      if (`FILE_WRITE_EN == 1) begin
         $fclose(filename[i]) ;
      end
      if(ref_item_mem[i].size() > 0) begin
         `uvm_info("O_RU_CMP", $sformatf("Reference FIFO not Empty"), UVM_HIGH);
      end
   end
   // Check error cnt 
   if(this.error_cnt != 0) begin
      `uvm_error("Scorboard: ", "error_cnt greater than 0")
      failed = failed | 1;
   end
 
   this.m_test_pass = !failed;
endfunction : report_phase


// Comparator logic

function bit o_ru_cmp::compare_dut_item(ref int scb_num, ref avsts_item dut_item,ref avsts_item ref_item);
   shortint ref_data;
   shortint obs_data;
   bit flag;
   int min_rmn,start_byte_print,end_loop;
   shortint  err, abs_err[] , abs_max_err_val,max_val[$],min_val[$];
   int cnt=0;
   bit signed [8:0] ref_buf9[],obs_buf9[];
   shortint ref_buf9_data , obs_buf9_data,abs_err_buf9[],err_buf9,max_val_buf9[$],min_val_buf9[$];  
   byte unsigned ref_queue[$],obs_queue[$] ;   
   int prb;
   byte unsigned ref_comp_arr[],obs_comp_arr[],ref_comp_data[],obs_comp_data[];  
   int length ;
   real nmse_db ; 
   shortint ref_data_nm[]; 
   shortint obs_data_nm[] ;
 
   flag=1'b0;
 
   if(scb_num == 3 || scb_num == 4 || scb_num == 29 || scb_num == 30) begin   //// After Compression Blocks needs to do 9 bit Comparison to check the error range precisely.
     if (ref_item.buf_packet_out.size != dut_item.buf_packet_out.size) begin
        `uvm_info("Size Mismatches", $sformatf("Scoreboard_name: %s, Reference_data_size: %0d, Observed data_size: %0d Scb_num :%0d, PKT_NO:%0d",scb_name[scb_num], ref_item.buf_packet_out.size, dut_item.buf_packet_out.size,scb_num,pkt_cnt[scb_num]),UVM_LOW)
        flag=1'b1;
     end else begin
        if(m_o_ru_config.o_ru_cfg.ud_comp_width != 0) begin 
          ref_queue = ref_item.buf_packet_out ;
          obs_queue = dut_item.buf_packet_out ; 
          `uvm_info("Size Matched", $sformatf("Scoreboard_name: %s, PKT_NO: %0d, Scb_num : %0d, Reference_data_size: %0d, Observed data_size: %0d",scb_name[scb_num], pkt_cnt[scb_num], scb_num, ref_queue.size, obs_queue.size),UVM_LOW);
          if(scb_num == 3 || scb_num == 29) begin
            for(int i = 0 ; i < 8 ; i++) begin
              if(ref_queue[0] != obs_queue[0]) begin               // Check for Error range
                 `uvm_info("MISMATCH ORAN HEADER", $sformatf("Scoreboard_name: %s, PKT NO : %0d  SCB NUM : %0d, REF[%0d]: %0h, OBS[%0d]: %0h",scb_name[scb_num],pkt_cnt[scb_num],scb_num, i,ref_queue[0], i,obs_queue[0]), UVM_LOW);
                  flag=1'b1;                                // return 1, if the comaparison is not passing
              end else begin
                 `uvm_info("MATCH", $sformatf("Scoreboard_name: %s, PKT NO : %0d  SCB NUM : %0d, REF[%0d]: %0h, OBS[%0d]: %0h",scb_name[scb_num],pkt_cnt[scb_num],scb_num, i,ref_queue[0], i,obs_queue[0]), UVM_HIGH);
              end
              if(i==7) prb =ref_queue[0];
              if(prb == 0) prb = 273;
              ref_queue.delete(0);  
              obs_queue.delete(0);  
            end
          end else begin
            for(int i = 0 ; i < 30 ; i++) begin
              if(ref_queue[0] != obs_queue[0]) begin               // Check for Mismatch
                 `uvm_info("MISMATCH ECPRI HEADER", $sformatf("Scoreboard_name: %s, PKT NO : %0d  SCB NUM : %0d, REF[%0d]: %0h, OBS[%0d]: %0h",scb_name[scb_num],pkt_cnt[scb_num],scb_num, i,ref_queue[0], i,obs_queue[0]), UVM_LOW);
                  flag=1'b1;                                // return 1, if the comaparison is not passing
              end else begin
                 `uvm_info("MATCH", $sformatf("Scoreboard_name: %s, PKT NO : %0d  SCB NUM : %0d, REF[%0d]: %0h, OBS[%0d]: %0h",scb_name[scb_num],pkt_cnt[scb_num],scb_num, i,ref_queue[0], i,obs_queue[0]), UVM_HIGH);
              end
              if(i==29) prb =ref_queue[0];
              if(prb == 0) prb = 273;
              ref_queue.delete(0);  
              obs_queue.delete(0); 
            end 
          end 
          ref_comp_arr  = new[prb];
          obs_comp_arr  = new[prb];
          ref_comp_data = new[prb * 27];
          obs_comp_data = new[prb * 27];
          for(int j=0 ; j < prb ; j++) begin
            for(int i=0 ; i < 1;i++) begin
               ref_comp_arr[j] = ref_queue[0];
               obs_comp_arr[j] = obs_queue[0];
               ref_queue.delete(0);  
               obs_queue.delete(0); 
            end  
            for(int i=0;i<27;i++) begin
               ref_comp_data[(j * 27) + i] = ref_queue[0];
               obs_comp_data[(j * 27) + i] = obs_queue[0];
               ref_queue.delete(0);  
               obs_queue.delete(0); 
            end
          end 
          {>>{ref_buf9}}    = ref_comp_data ;                // 8 bit to 9 bit conversion
          {>>{obs_buf9}}    = obs_comp_data ;                // 8 bit to 9 bit conversion
          abs_err_buf9  = new[ref_buf9.size] ;
          foreach(ref_comp_arr[j]) begin
             for(int i = j * 24 ; i < (24 + (j * 24)); i = i + 1) begin
              
                ref_buf9_data = ref_buf9[i] ;
                obs_buf9_data = obs_buf9[i] ;
                err_buf9 = ref_buf9_data - obs_buf9_data; 
                if(err_buf9[8] == 1) abs_err_buf9[i] = ~err_buf9 ;
                else abs_err_buf9[i] = err_buf9;

                abs_max_err_val = 50;
               
                if(abs_err_buf9[i][8:0] > abs_max_err_val) begin               // Check for Error range
                   ref_buf9_data = ref_buf9[i]  * (2 ** ref_comp_arr[j]);
                   obs_buf9_data = obs_buf9[i]  * (2 ** obs_comp_arr[j]);
                   err_buf9 = ref_buf9_data - obs_buf9_data; 
                   if(err_buf9[15] == 1) abs_err_buf9[i] = ~err_buf9 ;
                   else abs_err_buf9[i] = err_buf9;
                
                   abs_max_err_val = 513;
                   
                   if(abs_err_buf9[i] > abs_max_err_val) begin               // Check for Error range
                      `uvm_info("MISMATCH", $sformatf("Scoreboard_name: %s, PKT NO : %0d  SCB NUM : %0d, REF[%0d]: %0h, OBS[%0d]: %0h , ERROR RANGE : %0d REF COMPPARAM %0d , OBS COMPPARAM %0d",scb_name[scb_num],pkt_cnt[scb_num],scb_num, i,ref_buf9_data, i,obs_buf9_data,abs_err_buf9[i],ref_comp_arr[j],obs_comp_arr[j]), UVM_LOW);
                      flag=1'b1;                                // return 1, if the comaparison is not passing
                   end
                end else begin
                   `uvm_info("MATCH", $sformatf("Scoreboard_name: %s, PKT NO : %0d  SCB NUM : %0d, REF[%0d]: %0h, OBS[%0d]: %0h , ERROR RANGE : %0d",scb_name[scb_num],pkt_cnt[scb_num],scb_num, i,ref_buf9_data, i,obs_buf9_data,abs_err_buf9[i]), UVM_HIGH);
                end
             end
          end
          max_val_buf9 = abs_err_buf9.max();   /// Find Max of Error
          min_val_buf9 = abs_err_buf9.min();   /// Find Min of Error
          `uvm_info("MAX_ERROR_RANGE", $sformatf("Scoreboard_name: %s, PKT NO : %0d  SCB NUM : %0d, MAX_VALUE : %0p , MIN_VALUE : %0p",scb_name[scb_num],pkt_cnt[scb_num],scb_num,max_val_buf9,min_val_buf9), UVM_LOW);
        end else begin
          `uvm_info("Size Matched", $sformatf("Scoreboard_name: %s, PKT_NO: %0d, Scb_num : %0d, Reference_data_size: %0d, Observed data_size: %0d",scb_name[scb_num], pkt_cnt[scb_num], scb_num, ref_item.buf_packet_out.size, dut_item.buf_packet_out.size),UVM_LOW);
          abs_err = new[ref_item.buf_packet_out.size/2] ;
          for(int i = 0; i < ref_item.buf_packet_out.size; i = i + 2) begin
             ref_data = {ref_item.buf_packet_out[i],ref_item.buf_packet_out[i+1] };
             obs_data = {dut_item.buf_packet_out[i],dut_item.buf_packet_out[i+1]} ;
             err = ref_data - obs_data; 
             if(err[15] == 1) abs_err[cnt] = ~err ;
             else abs_err[cnt] = err;
             abs_max_err_val = 60; /// After FFT Blocks

             if(abs_err[cnt] > abs_max_err_val) begin               // Check for Error range
                `uvm_info("MISMATCH", $sformatf("Scoreboard_name: %s, PKT NO : %0d  SCB NUM : %0d, REF[%0d]: %0h, OBS[%0d]: %0h , ERROR RANGE : %0d",scb_name[scb_num],pkt_cnt[scb_num],scb_num, i,ref_data, i,obs_data,abs_err[cnt]), UVM_LOW);
                 flag=1'b1;                                // return 1, if the comaparison is not passing
             end else begin
                `uvm_info("MATCH", $sformatf("Scoreboard_name: %s, PKT NO : %0d  SCB NUM : %0d, REF[%0d]: %0h, OBS[%0d]: %0h , ERROR RANGE : %0d",scb_name[scb_num],pkt_cnt[scb_num],scb_num, i,ref_data, i,obs_data,abs_err[cnt]), UVM_HIGH);
             end
             cnt = cnt + 1 ;
          end
          max_val = abs_err.max();   /// Find Max of Error
          min_val = abs_err.min();   /// Find Min of Error
          `uvm_info("MAX_ERROR_RANGE", $sformatf("Scoreboard_name: %s, PKT NO : %0d  SCB NUM : %0d, MAX_VALUE : %0p , MIN_VALUE : %0p",scb_name[scb_num],pkt_cnt[scb_num],scb_num,max_val,min_val), UVM_LOW);
        end
     end 
   end else begin
     if (ref_item.buf_packet_out.size != dut_item.buf_packet_out.size) begin
        `uvm_info("Size Mismatches", $sformatf("Scoreboard_name: %s, Reference_data_size: %0d, Observed data_size: %0d Scb_num :%0d, PKT_NO:%0d",scb_name[scb_num], ref_item.buf_packet_out.size, dut_item.buf_packet_out.size,scb_num,pkt_cnt[scb_num]),UVM_LOW)
        flag=1'b1;
     end else begin
        `uvm_info("Size Matched", $sformatf("Scoreboard_name: %s, PKT_NO: %0d, Scb_num : %0d, Reference_data_size: %0d, Observed data_size: %0d",scb_name[scb_num], pkt_cnt[scb_num], scb_num, ref_item.buf_packet_out.size, dut_item.buf_packet_out.size),UVM_LOW);
        abs_err = new[ref_item.buf_packet_out.size/2] ;
        for(int i = 0; i < ref_item.buf_packet_out.size; i = i + 2) begin
           ref_data = {ref_item.buf_packet_out[i],ref_item.buf_packet_out[i+1] };
           obs_data = {dut_item.buf_packet_out[i],dut_item.buf_packet_out[i+1]} ;
           err = ref_data - obs_data; 
           if(err[15] == 1) abs_err[cnt] = ~err ;
           else abs_err[cnt] = err;

           //// Error Ranges for Each Scoreboard /////
           if(scb_num == 0 || scb_num == 1 || scb_num == 2 || scb_num == 6) begin
              abs_max_err_val = 0;  //// eCPRI , oRAN and FDV Demapper  
           end else if(scb_num >= 7 && scb_num <= 23) begin
              abs_max_err_val = 5 ; /// LoW PHY blocks before FFT
           end else if(scb_num == 24 || scb_num == 25 || scb_num == 3 || scb_num == 4 || scb_num == 5)begin
              abs_max_err_val = 60; /// After FFT Blocks
           end else begin
              `ifdef SHORT_PRACH_FORMAT
                 abs_max_err_val = 2;  /// PRACH blocks
	      `else 
                 abs_max_err_val = 60 ;  /// Long PRACH blocks
              `endif
           end


           if(abs_err[cnt] > abs_max_err_val) begin               // Check for Error range
              `uvm_info("MISMATCH", $sformatf("Scoreboard_name: %s, PKT NO : %0d  SCB NUM : %0d, REF[%0d]: %0h, OBS[%0d]: %0h , ERROR RANGE : %0d",scb_name[scb_num],pkt_cnt[scb_num],scb_num, i,ref_data, i,obs_data,abs_err[cnt]), UVM_LOW);
               flag=1'b1;                                // return 1, if the comaparison is not passing
           end else begin
              `uvm_info("MATCH", $sformatf("Scoreboard_name: %s, PKT NO : %0d  SCB NUM : %0d, REF[%0d]: %0h, OBS[%0d]: %0h , ERROR RANGE : %0d",scb_name[scb_num],pkt_cnt[scb_num],scb_num, i,ref_data, i,obs_data,abs_err[cnt]), UVM_HIGH);
           end
           cnt = cnt + 1 ;
        end
        max_val = abs_err.max();   /// Find Max of Error
        min_val = abs_err.min();   /// Find Min of Error
        `uvm_info("MAX_ERROR_RANGE", $sformatf("Scoreboard_name: %s, PKT NO : %0d  SCB NUM : %0d, MAX_VALUE : %0p , MIN_VALUE : %0p",scb_name[scb_num],pkt_cnt[scb_num],scb_num,max_val,min_val), UVM_LOW);
        ref_data_nm = {>> {ref_item.buf_packet_out}} ;
        obs_data_nm = {>> {dut_item.buf_packet_out}} ;
        length = ref_data_nm.size ;
        if(scb_num == 7 || scb_num == 8 || scb_num == 24 || scb_num == 25) begin    /// NMSE Calculation for iFFT and FFT Blocks
          nmse_db = CalcNMSE(length, ref_data_nm, obs_data_nm); 
          `uvm_info("NMSE", $sformatf("Scoreboard_name: %s, PKT NO : %0d  SCB NUM : %0d, NMSE (dB): %0f",scb_name[scb_num],pkt_cnt[scb_num],scb_num,nmse_db), UVM_LOW);
        end
        if(`FILE_WRITE_EN == 1) begin   
          for(int i =0 ;i<obs_data_nm.size;i=i+2) begin
            $fdisplay(filename[scb_num],"%h,%h",{ref_data_nm[i],ref_data_nm[i+1]},{obs_data_nm[i],obs_data_nm[i+1]});
          end 
        end
     end 
   end 
   if(`DEBUG_EN == 1) begin
      if(`SCB_NUM == scb_num) begin
         min_rmn = `MIN_BYTES % 8 ; 
         start_byte_print = `MIN_BYTES - min_rmn ;
         end_loop = ((`MAX_BYTES - `MIN_BYTES)/8) + 1 ;
         for(int i = 0 ; i< end_loop*8;i=i+8) begin
           `uvm_info("Compare", $sformatf("Scoreboard_name: %0s ,Data Compared  EXP[%0d]: %0h OBS:[%0d]: %0h PKT No : %0d", scb_name[scb_num],start_byte_print+i,{ref_item.buf_packet_out[start_byte_print+i],ref_item.buf_packet_out[start_byte_print+i+1],ref_item.buf_packet_out[start_byte_print+i+2],ref_item.buf_packet_out[start_byte_print+i+3],ref_item.buf_packet_out[start_byte_print+i+4],ref_item.buf_packet_out[start_byte_print+i+5],ref_item.buf_packet_out[start_byte_print+i+6],ref_item.buf_packet_out[start_byte_print+i+7]},start_byte_print+i,{dut_item.buf_packet_out[start_byte_print+i],dut_item.buf_packet_out[start_byte_print+i+1],dut_item.buf_packet_out[start_byte_print+i+2],dut_item.buf_packet_out[start_byte_print+i+3],dut_item.buf_packet_out[start_byte_print+i+4],dut_item.buf_packet_out[start_byte_print+i+5],dut_item.buf_packet_out[start_byte_print+i+6],dut_item.buf_packet_out[start_byte_print+i+7]},pkt_cnt[scb_num]), UVM_LOW);
         end
      end
   end
   pkt_cnt[scb_num] = pkt_cnt [scb_num] + 1 ;
   return(flag);


endfunction :compare_dut_item

function automatic real o_ru_cmp::CalcNMSE(
    int L,
    shortint  complex_data_ref_obs[], // Packed array of complex numbers (ref_data - obs_data)
    shortint complex_data_ULPath[]   // Packed array of complex numbers (ULPath_ref_dataout_S2B)      
);
  real  numerator_real;
  real  numerator_imag;
  real  numerator, denominator,nmse_out;
  shortint ref_real_part ;
  shortint obs_real_part ;
  	         				  
  shortint ref_imag_part ;
  shortint obs_imag_part ;
  shortint  diff_real;
  shortint  diff_imag;
  int abs_diff ; 
  int abs_diff_sqr ; 
  real abs_mean ; 
  real abs_diff_mean ; 
  // Initialize the denominator
  denominator = 0;

      
  for (int i = 0; i < L*2; i = i ) begin
    ref_real_part = complex_data_ref_obs[i];
    i = i + 1 ; 
    ref_imag_part = complex_data_ref_obs[i];	  
    abs_diff      = $sqrt(((ref_real_part**2))  + int'((ref_imag_part**2))); 
    abs_mean  = abs_mean +  (abs_diff**2); 
    i = i + 1 ; 
  end
  abs_mean = abs_mean/(L/2.0) ; 
  
  if (abs_mean == 0) begin
     `uvm_info("NMSE", $sformatf("Absoulte Mean Value is Infinte: %0f",abs_mean), UVM_LOW);
     return(-1) ;      
  end 
  
  for (int i = 0; i < L*2; i = i ) begin
    ref_real_part = complex_data_ref_obs[i];
    obs_real_part = complex_data_ULPath[i];
    i = i + 1 ; 
    ref_imag_part = complex_data_ref_obs[i];	  
    obs_imag_part = complex_data_ULPath[i];
    diff_real     = int'(ref_real_part - obs_real_part);  
    diff_imag     = int'(ref_imag_part - obs_imag_part);
    abs_diff      = $sqrt(int'((diff_real**2))  + int'((diff_imag**2))); 
    abs_diff_sqr  = (abs_diff**2); 
    abs_diff_mean = abs_diff_mean + abs_diff_sqr ; 
    i = i + 1 ;       
  end
  abs_diff_mean = abs_diff_mean/(L/2.0) ;
  numerator     = real'(real'(abs_diff_mean)/real'(abs_mean)) ;       
  if (numerator != 0) begin
     nmse_out = $log10(numerator)  * 10 ; 	   
  end else begin 
     `uvm_info("NMSE", $sformatf("NMSE Value is Infinte: %0f",numerator), UVM_LOW);
  end 
      
  return(nmse_out); 

endfunction

`endif 
