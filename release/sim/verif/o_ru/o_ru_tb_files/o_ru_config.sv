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

`ifndef O_RU_CONFIG_SV 
`define O_RU_CONFIG_SV 

//------------------------------------------------------------------------------ 
// Name        : o_ru_config 
// Description : Main test config to setup the testbench environment and 
//               control of UVCs
//------------------------------------------------------------------------------ 

class o_ru_config extends uvm_component; 
  `uvm_component_utils(o_ru_config) 
  o_ru_ip_config o_ru_cfg;
  avsts_config avsts_drv_cfg[4]; //TODO
  avsts_config avsts_mon_cfg[4]; //TODO
  
  Top_Subsystem_mmap_urm ral_blk ; 
  o_ru_reg        reg_model; 
  virtual o_ru_clk_if#(.TIME_PERIOD(`MAC_CLK_PERIOD), .RESET_ACTIVE_LOW(1'b1) ) o_ru_clk_vif[c_clk_cnt]; //TODO
  virtual o_ru_clk_if#(.TIME_PERIOD(`MAC_CLK_PERIOD), .RESET_ACTIVE_LOW(1'b1) ) o_ru_clk0_vif; //TODO
  virtual o_ru_clk_if#(.TIME_PERIOD(`DSP_CLK_PERIOD), .RESET_ACTIVE_LOW(1'b1) ) o_ru_clk1_vif; //TODO
  virtual o_ru_clk_if#(.TIME_PERIOD(`ETH_CLK_PERIOD), .RESET_ACTIVE_LOW(1'b1) ) o_ru_clk2_vif; //TODO
  virtual o_ru_clk_if#(.TIME_PERIOD(`CSR_CLK_PERIOD), .RESET_ACTIVE_LOW(1'b1) ) o_ru_clk3_vif; //TODO

  //----------------------------------------------------------------------
  // Constructor 
  //----------------------------------------------------------------------
  function new (string name, uvm_component parent=null); 
     super.new(.name(name), .parent(parent));
  endfunction : new 

  //----------------------------------------------------------------------
  // Build Phase 
  //----------------------------------------------------------------------
  function void build_phase (uvm_phase phase); 
     super.build_phase(phase);
     reg_model      = o_ru_reg::type_id::create("reg_model",this);
     o_ru_cfg         = o_ru_ip_config::type_id::create("o_ru_cfg");
  endfunction : build_phase 

  //----------------------------------------------------------------------
  // Connect Phase 
  //----------------------------------------------------------------------
  function void connect_phase (uvm_phase phase); 
     super.connect_phase(.phase(phase));
     reg_model.o_ru_cfg = this.o_ru_cfg;
  endfunction : connect_phase 

  extern virtual task deploy_write_registers();
  extern virtual task init_config();

endclass : o_ru_config

task o_ru_config::deploy_write_registers();
   reg_model.deploy_write_registers();
endtask :deploy_write_registers


task o_ru_config::init_config();

   o_ru_cfg.source_mac_lsb               = 32'h02030405;
   o_ru_cfg.source_mac_msb               = 16'h8009    ;
   o_ru_cfg.destination_mac_lsb          = 32'h0       ;
   o_ru_cfg.destination_mac_msb          = 16'h0       ;
   o_ru_cfg.dl_input_config              = 32'h5160b   ;
   if(`IFFT_FFT_LPBK_EN == 1) 
     o_ru_cfg.ul_input_config            = 32'h00aaa   ;   
   else
     o_ru_cfg.ul_input_config            = 32'h63867   ;   
   o_ru_cfg.frame_config                 = 32'd3       ;
   o_ru_cfg.frame_structure              = 8'd192      ;
   o_ru_cfg.long_prach_freq_offset       = 24'd0       ;
   o_ru_cfg.short_prach_freq_offset      = 24'd228     ;
   o_ru_cfg.sp_time_off                  = 32'd1156    ;
   o_ru_cfg.sp_time_off_bias             = 32'd220     ;
   o_ru_cfg.sp_startsym_bias             = 32'd0       ;
   o_ru_cfg.c_hps                        = 32'd1       ;
   o_ru_cfg.hps_valid                    = 8'd1        ;
   o_ru_cfg.ud_comp_width                = 32'h00      ;
   o_ru_cfg.func_mode                    = 32'h0       ;
   o_ru_cfg.rx_window_enable             = 32'd0       ; 
   o_ru_cfg.tx_window_enable             = 32'd0       ;
   o_ru_cfg.t3a_max_up                   = 32'h249f0   ;
   o_ru_cfg.t3a_min_up                   = 32'h09c40   ;
   o_ru_cfg.t2a_max_up                   = 32'h2e630   ;
   o_ru_cfg.t2a_min_up                   = 32'h186a0   ;
   o_ru_cfg.t1a_min_cp                   = 32'h543a8   ;
   o_ru_cfg.t1a_max_cp                   = 32'h65900   ;
   o_ru_cfg.t2a_max_cp_ul                = 32'h543a8   ;
   o_ru_cfg.t2a_min_cp_ul                = 32'h65900   ;
   o_ru_cfg.ta3_min_cp                   = 32'd0       ;
   o_ru_cfg.ta3_max_cp                   = 32'h249f0   ;
   o_ru_cfg.ta3_max_up                   = 32'd0       ;
   o_ru_cfg.ta3_max_up                   = 32'h249f0   ;
   o_ru_cfg.cc1_bw                       = 7'he        ;
   o_ru_cfg.cc2_bw                       = 7'he        ;
   o_ru_cfg.cc1_dis                      = 1'h0        ;
   `ifndef NUM_CC_TWO
      o_ru_cfg.cc2_dis                   = 1'h1        ;
   `else
      o_ru_cfg.cc2_dis                   = 1'h0        ;
   `endif
   o_ru_cfg.mtu_size                     = 14'h0       ;
   o_ru_cfg.arb_ctrl                     = 1           ;
   o_ru_cfg.arb_pusch_priority           = 3           ;
   o_ru_cfg.arb_prach_priority           = 3           ;
   o_ru_cfg.cp_length                    = 11'd352     ;
   o_ru_cfg.fft_size                     = 4'd12       ;
   o_ru_cfg.ifft_gain_l1                 = 32'd16384   ;
   o_ru_cfg.ifft_shift_l1                = 4'd12       ;
   o_ru_cfg.ifft_mux_constant_l1         = 16'd0       ;
   o_ru_cfg.ifft_mux_constant_l2         = 16'd0       ;
   o_ru_cfg.mux_select_l1                = 1'd0        ;
   o_ru_cfg.mux_select_l2                = 1'd0        ;
   o_ru_cfg.ifft_dc_sc_en_l1             = 1'd1        ;
   o_ru_cfg.ifft_dc_sc_en_l2             = 1'd1        ;
   o_ru_cfg.ifft_rc_en_l1                = 1'd1        ;
   o_ru_cfg.ifft_rc_en_l2                = 1'd1        ;
   o_ru_cfg.ifft_gain_l2                 = 32'd16384   ;
   o_ru_cfg.ifft_shift_l2                = 4'd12       ;
   o_ru_cfg.fft_dc_sc_en_l1              = 1'd1        ;
   o_ru_cfg.fft_dc_sc_en_l2              = 1'd1        ;
   o_ru_cfg.fft_rc_en_l1                 = 1'd1        ;
   o_ru_cfg.fft_rc_en_l2                 = 1'd1        ;
   if(o_ru_cfg.cc1_bw == 7'he) begin
     o_ru_cfg.ifft_rc_bw_sel_l1          = 4'd0        ;
     o_ru_cfg.fft_rc_bw_sel_l1           = 4'd0        ;
   end else begin
     o_ru_cfg.ifft_rc_bw_sel_l1          = 4'd1        ;
     o_ru_cfg.fft_rc_bw_sel_l1           = 4'd1        ;
   end
   if(o_ru_cfg.cc2_bw == 7'he) begin
     o_ru_cfg.ifft_rc_bw_sel_l2          = 4'd0        ;
     o_ru_cfg.fft_rc_bw_sel_l2           = 4'd0        ;
   end else begin
     o_ru_cfg.ifft_rc_bw_sel_l2          = 4'd1        ;
     o_ru_cfg.fft_rc_bw_sel_l2           = 4'd1        ;
   end
   o_ru_cfg.ul_hcs_bypass_l1             = 1'd0        ;
   o_ru_cfg.ul_hcs_bypass_l2             = 1'd0        ;
   o_ru_cfg.fft_gain_l1                  = 32'd16384   ;
   o_ru_cfg.fft_shift_l1                 = 4'd0        ;
   o_ru_cfg.ifft_fft_lpbk_en             = `IFFT_FFT_LPBK_EN;
   o_ru_cfg.fdv_lpbk_en                  = 0           ;
   o_ru_cfg.fft_gain_l2                  = 32'd16384   ;
   o_ru_cfg.fft_shift_l2                 = 4'd0        ;
   o_ru_cfg.dig_pow_scale_val_l1         = 32'h7fff    ;
   o_ru_cfg.dig_pow_scale_val_l2         = 32'h7fff    ;
   o_ru_cfg.lprach1_filt_flush_en        = 1'd1        ;
   o_ru_cfg.lprach2_filt_flush_en        = 1'd1        ;
   o_ru_cfg.phase_comp_en1               = 1'd0        ;
   o_ru_cfg.phase_comp_en2               = 1'd0        ;
   o_ru_cfg.ifft1_Phase_Gen_Reg          = 1'd1        ;
   o_ru_cfg.ifft2_Phase_Gen_Reg          = 1'd1        ;
   o_ru_cfg.fft1_Enable_reg1             = 1'd0        ;
   o_ru_cfg.fft2_Enable_reg1             = 1'd0        ;
   o_ru_cfg.fft1_Phase_Gen_Reg           = 1'd0        ;
   o_ru_cfg.fft2_Phase_Gen_Reg           = 1'd0        ;
   o_ru_cfg.prach1_cfg_index             = 8'd167      ;
   o_ru_cfg.prach1_cfg_time_index        = 32'd0       ;
   o_ru_cfg.n_prach1_slot                = 32'd0       ;
   o_ru_cfg.active_prach1_slot           = 32'd0       ;
   o_ru_cfg.prach1_freq_idx              = 32'd0       ;
   o_ru_cfg.prach2_cfg_index             = 8'd167      ;
   o_ru_cfg.prach2_cfg_time_index        = 32'd0       ;
   o_ru_cfg.n_prach2_slot                = 32'd0       ;
   o_ru_cfg.active_prach2_slot           = 32'd0       ;
   o_ru_cfg.prach2_freq_idx              = 32'd0       ;
   o_ru_cfg.duc_gain_ant1                = 16'd8192    ;
   o_ru_cfg.duc_gain_ant2                = 16'd8192    ;
   o_ru_cfg.duc_gain_ant3                = 16'd8192    ;
   o_ru_cfg.duc_gain_ant4                = 16'd8192    ;
   o_ru_cfg.duc_hb_bypass_en             = 16'd0       ;
   o_ru_cfg.duc_delay_comp_offset_ant1_1 = 16'd0       ;
   o_ru_cfg.duc_delay_comp_offset_ant2_1 = 16'd0       ;
   o_ru_cfg.duc_delay_comp_offset_ant3_1 = 16'd0       ;
   o_ru_cfg.duc_delay_comp_offset_ant4_1 = 16'd0       ;
   o_ru_cfg.duc_delay_comp_offset_ant1_2 = 16'd0       ;
   o_ru_cfg.duc_delay_comp_offset_ant2_2 = 16'd0       ;
   o_ru_cfg.duc_delay_comp_offset_ant3_2 = 16'd0       ;
   o_ru_cfg.duc_delay_comp_offset_ant4_2 = 16'd0       ;
   o_ru_cfg.ddc_gain_ant1                = 16'd8192    ;
   o_ru_cfg.ddc_gain_ant2                = 16'd8192    ;
   o_ru_cfg.ddc_gain_ant3                = 16'd8192    ;
   o_ru_cfg.ddc_gain_ant4                = 16'd8192    ;
   o_ru_cfg.ddc_hb_bypass_en             = 16'd0       ;
   o_ru_cfg.ddc_delay_comp_offset_ant1_1 = 16'd0       ;
   o_ru_cfg.ddc_delay_comp_offset_ant2_1 = 16'd0       ;
   o_ru_cfg.ddc_delay_comp_offset_ant3_1 = 16'd0       ;
   o_ru_cfg.ddc_delay_comp_offset_ant4_1 = 16'd0       ;
   o_ru_cfg.ddc_delay_comp_offset_ant1_2 = 16'd0       ;
   o_ru_cfg.ddc_delay_comp_offset_ant2_2 = 16'd0       ;
   o_ru_cfg.ddc_delay_comp_offset_ant3_2 = 16'd0       ;
   o_ru_cfg.ddc_delay_comp_offset_ant4_2 = 16'd0       ;
   o_ru_cfg.mixed_mode                   = 2'd0        ;

   o_ru_cfg.long_prach1_nco            = 32'd424804352 ;  
   o_ru_cfg.long_prach1_nco_1          = 32'd424804352 ;
   o_ru_cfg.long_prach1_nco_2          = 32'd424804352 ;
   o_ru_cfg.long_prach1_nco_3          = 32'd424804352 ; 
   o_ru_cfg.long_prach1_technology     = 1'd1          ;  
   o_ru_cfg.long_prach1_cfg_index      = 16'd27        ;  
   o_ru_cfg.long_prach1_nco_offset     = 32'd4587520   ;  
   o_ru_cfg.long_prach1_gain_real      = 16'd16384     ; 
   o_ru_cfg.long_prach2_nco            = 32'd424804352 ;  
   o_ru_cfg.long_prach2_nco_1          = 32'd424804352 ;
   o_ru_cfg.long_prach2_nco_2          = 32'd424804352 ;
   o_ru_cfg.long_prach2_nco_3          = 32'd424804352 ;  
   o_ru_cfg.long_prach2_technology     = 1'd1          ;  
   o_ru_cfg.long_prach2_cfg_index      = 16'd27        ;   
   o_ru_cfg.long_prach2_nco_offset     = 32'd4587520   ;   
   o_ru_cfg.long_prach2_gain_real      = 16'd16384     ; 
   o_ru_cfg.pkt_cnt_early              = 32'd0         ;
   o_ru_cfg.pkt_cnt_late               = 32'd0         ;
   o_ru_cfg.pkt_cnt_c_early            = 32'd0         ;
   o_ru_cfg.pkt_cnt_c_late             = 32'd0         ;
 
  if( `IFFT_FFT_LPBK_EN == 1) begin
     o_ru_cfg.prach_pat_en             = 1'd0          ;
     o_ru_cfg.prach_pb_sel             = 1'd1          ;
   end else begin
     o_ru_cfg.prach_pat_en             = 1'd1          ;
     o_ru_cfg.prach_pb_sel             = 1'd1          ;
   end

   o_ru_cfg.ifft_mux_constant_l1       = 16'd0         ;
   o_ru_cfg.ifft_mux_constant_l2       = 16'd0         ;
   o_ru_cfg.ifft1_F1_reg_lsb           = 32'd0         ;
   o_ru_cfg.ifft1_F1_reg_msb           = 32'd0         ;
   o_ru_cfg.ifft2_F1_reg               = 32'd25165824  ;
   o_ru_cfg.fft1_F1_reg_lsb            = 32'd0         ;
   o_ru_cfg.fft1_F1_reg_msb            = 32'd0         ;
   o_ru_cfg.fft2_F1_reg                = 32'd42781901  ;
   o_ru_cfg.duc_nco_l1_ant1_lsb        = 32'd436906666 ;
   o_ru_cfg.duc_nco_l1_ant1_msb        = 32'd0         ;
   o_ru_cfg.duc_nco_l1_ant2_lsb        = 32'd436906666 ;
   o_ru_cfg.duc_nco_l1_ant2_msb        = 32'd2         ;
   o_ru_cfg.duc_nco_l1_ant3_lsb        = 32'd436906666 ;
   o_ru_cfg.duc_nco_l1_ant3_msb        = 32'd0         ;
   o_ru_cfg.duc_nco_l1_ant4_lsb        = 32'd436906666 ;
   o_ru_cfg.duc_nco_l1_ant4_msb        = 32'd2         ;

   o_ru_cfg.duc_nco_l2_ant1_lsb        = 32'd436906666 ;
   o_ru_cfg.duc_nco_l2_ant1_msb        = 32'd2         ;
   o_ru_cfg.duc_nco_l2_ant2_lsb        = 32'd436906666 ;
   o_ru_cfg.duc_nco_l2_ant2_msb        = 32'd0         ;
   o_ru_cfg.duc_nco_l2_ant3_lsb        = 32'd436906666 ;
   o_ru_cfg.duc_nco_l2_ant3_msb        = 32'd2         ;
   o_ru_cfg.duc_nco_l2_ant4_lsb        = 32'd436906666 ;
   o_ru_cfg.duc_nco_l2_ant4_msb        = 32'd0         ;

   o_ru_cfg.ddc_nco_l1_ant1_lsb        = 32'd436906666 ;
   o_ru_cfg.ddc_nco_l1_ant1_msb        = 32'd2         ;
   o_ru_cfg.ddc_nco_l1_ant2_lsb        = 32'd436906666 ;
   o_ru_cfg.ddc_nco_l1_ant2_msb        = 32'd0         ;
   o_ru_cfg.ddc_nco_l1_ant3_lsb        = 32'd436906666 ;
   o_ru_cfg.ddc_nco_l1_ant3_msb        = 32'd2         ;
   o_ru_cfg.ddc_nco_l1_ant4_lsb        = 32'd436906666 ;
   o_ru_cfg.ddc_nco_l1_ant4_msb        = 32'd0         ;

   o_ru_cfg.ddc_nco_l2_ant1_lsb        = 32'd436906666 ;
   o_ru_cfg.ddc_nco_l2_ant1_msb        = 32'd0         ;
   o_ru_cfg.ddc_nco_l2_ant2_lsb        = 32'd436906666 ;
   o_ru_cfg.ddc_nco_l2_ant2_msb        = 32'd2         ;
   o_ru_cfg.ddc_nco_l2_ant3_lsb        = 32'd436906666 ;
   o_ru_cfg.ddc_nco_l2_ant3_msb        = 32'd0         ;
   o_ru_cfg.ddc_nco_l2_ant4_lsb        = 32'd436906666 ;
   o_ru_cfg.ddc_nco_l2_ant4_msb        = 32'd2         ;

   o_ru_cfg.fh_static_udcomphdr        = 32'd0         ;

   o_ru_cfg.control_reset              = 1'd0  ;
   o_ru_cfg.UL_pwr_en                  = 2'd0  ;
   o_ru_cfg.DL_pwr_en                  = 2'd0  ;
   o_ru_cfg.IRQ_Enable                 = 1'd0  ;
   o_ru_cfg.StartnStop                 = 1'd0  ;
   o_ru_cfg.mode                       = 4'd1  ;   // 1- single mode, 2-continuous mode
   o_ru_cfg.comp_time                  = 32'd14 ;
   o_ru_cfg.data_ready                 = 1'd0  ;
   o_ru_cfg.Error                      = 1'd0  ;


   foreach(o_ru_cfg.dl_mac_axc[i]) begin
        o_ru_cfg.dl_mac_axc[i] = i;
   end
   foreach(o_ru_cfg.ul_mac_axc[i]) begin
        o_ru_cfg.ul_mac_axc[i] = i;
   end
    
   for(int i=0; i<33; i++) begin
        o_ru_cfg.tmp_data[i] = (i / 32.0) * 1048576;
        o_ru_cfg.thresh_data[i] = o_ru_cfg.tmp_data[i];
   end

endtask :init_config


`endif //}
