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

`ifndef O_RU_REF_FFT_POWER_METER_SV 
`define O_RU_REF_FFT_POWER_METER_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_fft_power_meter
//------------------------------------------------------------------------------ 


class o_ru_ref_fft_power_meter extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_fft_power_meter) 
 
  o_ru_ref_avsts_item ref_item; 
  o_ru_ref_avsts_item m_item;
  avsts_item m_item_inp; 

  int sym_cnt[2],out_trig_counter,axc_cnt[2] ; 
  int file[2];
  int counter;
  int histogram_ref[2][14][4][32];
  int statistic_ref[2][2][14][4][8];
  int hist_cnt[2] ;
  int cntr[2] = {0,0}; 
   //------------------------------------------------------------------------------ 
   // Constructor 
   //------------------------------------------------------------------------------ 
   function new (string name, uvm_component parent); 
      super.new(name, parent);
   endfunction : new 

extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);
extern virtual task          run_phase(uvm_phase phase);
extern virtual task          power_meter_cal(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_cfg,int num);
endclass: o_ru_ref_fft_power_meter

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_fft_power_meter::build_phase(uvm_phase phase);
     super.build_phase(phase);
     foreach(statistic_ref[l]) begin
       foreach(statistic_ref[l][i]) begin
         foreach(statistic_ref[l][i][j]) begin
           foreach(statistic_ref[l][i][j][k]) begin
             statistic_ref[l][i][j][k][0] = 65536 ;
             statistic_ref[l][i][j][k][1] = 0     ;
             statistic_ref[l][i][j][k][6] = 0     ;
           end
         end
       end
     end
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_fft_power_meter::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_fft_power_meter::run_phase(uvm_phase phase);
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
               counter = counter + 1;
               ref_item.buf_packet_out = new[m_item.buf_packet_out.size] (m_item.buf_packet_out) ;
               power_meter_cal(ref_item,m_config,scb_num);
             end	
          end  // Fork
       join_none
     end
endtask : run_phase

task o_ru_ref_fft_power_meter::power_meter_cal(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_cfg,int num);


   shortint   pm_ref_data[];
   shortint   ref_real ;
   shortint   ref_imag ;
   int        numBins = 32 ;
   bit [42:0] abs_mean = 0;
   real       yms_out;
   real       yms_out_stat;
   bit [31:0] threshold[];
   int        i = 0;
   int        sqr_real_imag;
   int        ram_addr;
   byte unsigned prb_arr[] ;
   int        total_samp[14][4];
   int        peak_pwr;
   real       temp_peak[4];

   o_ru_ref_avsts_item pkt_tmp;
   pkt_tmp = new() ;

   prb_arr = new[16384] (pkt.buf_packet_out);   // 4096 Samples 
   pm_ref_data = {>>{prb_arr}};

   temp_peak[axc_cnt[num]] = 0 ;
   for (int i = 0; i < (pm_ref_data.size()); i = i ) begin
      ref_real = pm_ref_data[i];
      i = i + 1 ;
      ref_imag = pm_ref_data[i];
   
      if(ref_real[15] == 1) ref_real = ~ref_real;
      else ref_real = ref_real;
      if(ref_imag[15] == 1) ref_imag = ~ref_imag;
      else ref_imag = ref_imag;
  
      sqr_real_imag = (ref_real**2) + (ref_imag**2);
      abs_mean = abs_mean + sqr_real_imag;
      i = i + 1 ;

      // Calculating Peak Power value
      if (sqr_real_imag > temp_peak[axc_cnt[num]]) begin
         temp_peak[axc_cnt[num]] = sqr_real_imag;
      end else begin
         temp_peak[axc_cnt[num]] = temp_peak[axc_cnt[num]];
      end

   end

   abs_mean = abs_mean[42:8] / (pm_ref_data.size() / 2);
   yms_out = abs_mean;
   yms_out_stat = abs_mean[22:7];  // For Statistic 

   threshold = m_cfg.thresh_data;

   // Check Mean on which bin threshold it falls
   if (yms_out <= threshold[0]) begin
      histogram_ref[num][sym_cnt[num]][axc_cnt[num]][0] = histogram_ref[num][sym_cnt[num]][axc_cnt[num]][0] + 1;
   end else if (yms_out >= threshold[numBins-1]) begin
      histogram_ref[num][sym_cnt[num]][axc_cnt[num]][numBins-1] = histogram_ref[num][sym_cnt[num]][axc_cnt[num]][numBins-1] + 1;
   end else begin
      for (int bin_idx = 1; bin_idx < (numBins-1); bin_idx++) begin
         if (yms_out > threshold[bin_idx-1] && yms_out <= threshold[bin_idx]) begin
            histogram_ref[num][sym_cnt[num]][axc_cnt[num]][bin_idx] = histogram_ref[num][sym_cnt[num]][axc_cnt[num]][bin_idx] + 1;
            break; 
         end
      end
   end

   total_samp[sym_cnt[num]][axc_cnt[num]] = 4096 * (m_cfg.comp_time / 14);
   peak_pwr = temp_peak[axc_cnt[num]];

   // Check Minimum for each Computed Symbols 
   if(statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][0] < yms_out_stat) statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][0] = statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][0] ;
   else statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][0] = yms_out_stat ;

   // Check Maximum for each Computed Symbols 
   if(statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][1] > yms_out_stat) statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][1] = statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][1] ;
   else statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][1] = yms_out_stat ;

   // Calculate Sum for each Computed Symbols 
   statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][2] = statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][2][15:0] + yms_out_stat;
   statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][3] = statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][3] + statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][2][31:16];
   
   // Calculate Peakpower for each Computed Symbols 
   if(statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][6] > peak_pwr[30:15]) statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][6] = statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][6] ;
   else statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][6] = peak_pwr[30:15];         

   // Total Samples with respect to Compute time
   statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][4] = total_samp[sym_cnt[num]][axc_cnt[num]][15:0]; 
   statistic_ref[num][cntr[num]][sym_cnt[num]][axc_cnt[num]][5] = total_samp[sym_cnt[num]][axc_cnt[num]][31:16]; 
   
   axc_cnt[num] = axc_cnt[num] + 1 ;
   if(axc_cnt[num] == 4) begin 
     sym_cnt[num] = sym_cnt[num] + 1 ;
     axc_cnt[num] = 0 ;
   end
   else begin   
     sym_cnt[num] = sym_cnt[num] ;
     axc_cnt[num] = axc_cnt[num] ;
   end

   if (sym_cnt[num] == 14) begin
      sym_cnt[num] = 0;
      hist_cnt[num] = hist_cnt[num] + 1;


      if (hist_cnt[num] == (m_cfg.comp_time/14)) begin
         m_cfg.histogram_fft_dut_ref[num] = histogram_ref[num] ;
         m_cfg.statistic_fft_dut_ref[num] = statistic_ref[num] ;
         foreach (histogram_ref[num]) begin
           foreach (histogram_ref[num][i]) begin
              foreach (histogram_ref[num][i][j]) begin
                 foreach (histogram_ref[num][i][j][k]) begin
                    histogram_ref[num][i][j][k] = 0;
                 end
              end
           end
         end
         hist_cnt[num] = 0;
         if (m_cfg.mode == 1) begin
            cntr[num] = 0;
         end else begin
            cntr[num] = cntr[num] + 1;
            if (cntr[num] == 2) begin
               cntr[num] = 0;
            end
         end
         foreach(statistic_ref[l]) begin
           foreach(statistic_ref[l][i]) begin
             foreach(statistic_ref[l][i][j]) begin
               foreach(statistic_ref[l][i][j][k]) begin
                 statistic_ref[l][i][j][k][0] = 65536 ;
                 statistic_ref[l][i][j][k][1] = 0     ;
                 statistic_ref[l][i][j][k][2] = 0     ;
                 statistic_ref[l][i][j][k][3] = 0     ;
                 statistic_ref[l][i][j][k][6] = 0     ;
               end
             end
           end
         end
      end
   end
endtask : power_meter_cal

`endif 
