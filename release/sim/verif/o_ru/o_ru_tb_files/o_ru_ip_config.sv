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

`ifndef O_RU_IP_CONFIG_SV
`define O_RU_IP_CONFIG_SV

//------------------------------------------------------------------------------
// CLASS: o_ru_ip_config
//------------------------------------------------------------------------------

class o_ru_ip_config extends uvm_object;
  `uvm_object_utils(o_ru_ip_config)
   
   localparam int AXC = 16        ;
   localparam int PKT = 5000      ;
   int        SEED                ;

   bit [31:0] pkt_time            ;
   shortint   pc_id               ;
   shortint   pc_id_arr[16]       ;
   shortint   min_pc_id_arr=16    ;
   shortint   pc_id_size          ;
   shortint   seq_id              ;
   bit [7:0]  port_id             ;
   bit [7:0]  msg_type            ;
   bit [3:0]  protocol_rev        ;
   bit [2:0]  reserved            ;
   bit        conc                ;
   bit [47:0] destination_addr    ;
   bit [47:0] source_addr         ;
   bit [31:0] vlan_tag            ;
   bit [15:0] eth_type            ;
   shortint   payload_size        ; 
   bit        data_direction [PKT]; 
   bit [2:0]  payload_version[PKT];
   bit [3:0]  filter_index   [PKT];
   bit [7:0]  frame_id       [PKT];
   bit [3:0]  subframe_id    [PKT];
   bit [5:0]  slot_id        [PKT];
   bit [5:0]  symbol_id      [PKT];

   bit [11:0] section_id[PKT][]   ;
   bit        rb        [PKT][]   ;
   bit        syminc    [PKT][]   ;
   bit [9:0]  startprb_u[PKT][]   ;
   bit [7:0]  numprb_u  [PKT][]   ;


   bit        c_dataDirection   [AXC][500];        // AXC and Packets 
   bit [2:0]  c_payloadVersion  [AXC][500]; 
   bit [3:0]  c_filterIndex     [AXC][500]; 
   bit [7:0]  c_frameId         [AXC][500]; 
   bit [3:0]  c_subframeId      [AXC][500]; 
   bit [5:0]  c_slotID          [AXC][500]; 
   bit [5:0]  c_startSymbolid   [AXC][500]; 
   bit [7:0]  c_numberOfSections[AXC][500]; 
   bit [7:0]  c_sectionType     [AXC][500]; 
   bit [7:0]  c_reserved        [AXC][500]; 
   bit [15:0] c_time_offset     [AXC][500]; 
   bit [7:0]  c_frame_struct    [AXC][500]; 
   bit [15:0] c_cp_length       [AXC][500]; 
   bit [7:0]  c_udCompHdr       [AXC][500]; 
   bit [11:0] c_sectionId     [AXC][500][500];     // AXC , Packets and Sections
   bit        c_rb            [AXC][500][500];
   bit        c_symInc        [AXC][500][500];
   bit [9:0]  c_startprb_c    [AXC][500][500];
   bit [7:0]  c_numprb_c      [AXC][500][500];
   bit [11:0] c_reMask        [AXC][500][500]; 
   bit [3:0]  c_numSymbol     [AXC][500][500]; 
   bit        c_ef            [AXC][500][500]; 
   bit [15:0] c_beamId        [AXC][500][500];
   bit [23:0] c_freq_off      [AXC][500][500];
   bit [7:0]  c_reserved_typ3 [AXC][500][500]; 

   bit [7:0]  ext_typ             ;
   bit [7:0]  ext_len             ;
   bit [7:0]  ucomp_hdr           ;  
  
   bit [13:0] mtu_size            ;
   bit [7:0]  comp_width          ;
   int        c_pkt_cnt           ;
   int        section_count[PKT]  ;
   reg [15:0] frac_nsec_cnt       ;
   reg [31:0] nsec_cnt            ;
   reg [47:0] sec_cnt             ;
   bit [7:0]  ud_comp_width       ;
   bit        func_mode           ;
   bit        rx_window_enable    ;
   bit        tx_window_enable    ;
   bit [31:0] t3a_max_up          ;
   bit [31:0] t3a_min_up          ;
   bit [31:0] t2a_max_up          ;
   bit [31:0] t2a_min_up          ;
   bit [31:0] t1a_min_cp          ;
   bit [31:0] t1a_max_cp          ;
   bit [31:0] t2a_min_cp_ul       ;
   bit [31:0] t2a_max_cp_ul       ;
   bit [31:0] ta3_min_up          ;    
   bit [31:0] ta3_max_up          ;
   bit [31:0] ta3_min_cp          ;
   bit [31:0] ta3_max_cp          ;
   bit [31:0] source_mac_lsb      ;
   bit [15:0] source_mac_msb      ;
   bit [31:0] destination_mac_lsb ;
   bit [15:0] destination_mac_msb ;
   bit [25:0] dl_input_config     ;
   bit [25:0] ul_input_config     ;
   bit [1:0]  frame_config        ;
   bit [23:0] long_prach_freq_offset   ;
   bit [23:0] short_prach_freq_offset  ;
   bit        c_hps               ;
   bit [7:0]  frame_structure     ;
   bit [7:0]  hps_valid           ;
   bit        prb_blanking        ; 
   bit        even_axc_bw_mode    ;             // 1 - 60MHz     0 - 100MHz
   bit        odd_axc_bw_mode     ;             // 1 - 60MHz     0 - 100MHz
   bit [15:0] dl_mac_axc[8]       ;
   bit [15:0] ul_mac_axc[16]      ;
   bit [6:0]  cc1_bw              ;
   bit [6:0]  cc2_bw              ;
   bit        cc1_dis             ;
   bit        cc2_dis             ;
   bit [10:0] cp_length           ;
   bit [3:0]  fft_size            ;  
   bit [31:0] ifft_gain_l1        ;  
   bit [3:0]  ifft_shift_l1       ;  
   bit [15:0] ifft_mux_constant_l1;
   bit [15:0] ifft_mux_constant_l2; 
   bit        mux_select_l1       ; 
   bit        mux_select_l2       ; 
   bit        ifft_dc_sc_en_l1    ;
   bit        ifft_dc_sc_en_l2    ;
   bit        ifft_rc_en_l1       ;
   bit        ifft_rc_en_l2       ;
   bit [3:0]  ifft_rc_bw_sel_l1   ;
   bit [3:0]  ifft_rc_bw_sel_l2   ;
   bit [31:0] ifft_gain_l2        ;   
   bit [3:0]  ifft_shift_l2       ;    
   bit [31:0] fft_gain_l1         ;  
   bit [3:0]  fft_shift_l1        ;  
   bit        ifft_fft_lpbk_en    ; 
   bit        fdv_lpbk_en         ;
   bit [31:0] fft_gain_l2         ;   
   bit [3:0]  fft_shift_l2        ;
   bit [31:0] dig_pow_scale_val_l1;
   bit [31:0] dig_pow_scale_val_l2;   
   bit        lprach1_filt_flush_en;
   bit        lprach2_filt_flush_en;  
   bit        phase_comp_en1      ;  
   bit        phase_comp_en2      ;
   bit        ifft1_Phase_Gen_Reg ;
   bit        ifft2_Phase_Gen_Reg ;
   bit        fft1_Enable_reg1    ;  
   bit        fft2_Enable_reg1    ;
   bit        fft1_Phase_Gen_Reg  ;
   bit        fft2_Phase_Gen_Reg  ;
   bit [7:0]  prach1_cfg_index    ;
   bit [31:0] prach1_cfg_time_index;
   bit [31:0] n_prach1_slot       ;
   bit [31:0] active_prach1_slot  ;
   bit [31:0] prach1_freq_idx     ;
   bit [7:0]  prach2_cfg_index    ;
   bit [31:0] prach2_cfg_time_index;
   bit [31:0] n_prach2_slot       ;
   bit [31:0] active_prach2_slot  ;
   bit [31:0] prach2_freq_idx     ;
   bit [15:0] duc_gain_ant1       ;
   bit [15:0] duc_gain_ant2       ;
   bit [15:0] duc_gain_ant3       ;
   bit [15:0] duc_gain_ant4       ;
   bit [15:0] duc_hb_bypass_en    ;
   bit [7:0]  duc_delay_comp_offset_ant1_1;
   bit [7:0]  duc_delay_comp_offset_ant2_1;
   bit [7:0]  duc_delay_comp_offset_ant3_1;
   bit [7:0]  duc_delay_comp_offset_ant4_1;
   bit [7:0]  duc_delay_comp_offset_ant1_2;
   bit [7:0]  duc_delay_comp_offset_ant2_2;
   bit [7:0]  duc_delay_comp_offset_ant3_2;
   bit [7:0]  duc_delay_comp_offset_ant4_2;
   bit [15:0] ddc_gain_ant1       ;
   bit [15:0] ddc_gain_ant2       ;
   bit [15:0] ddc_gain_ant3       ;
   bit [15:0] ddc_gain_ant4       ;
   bit [15:0] ddc_hb_bypass_en    ;
   bit [7:0]  ddc_delay_comp_offset_ant1_1;
   bit [7:0]  ddc_delay_comp_offset_ant2_1;
   bit [7:0]  ddc_delay_comp_offset_ant3_1;
   bit [7:0]  ddc_delay_comp_offset_ant4_1;
   bit [7:0]  ddc_delay_comp_offset_ant1_2;
   bit [7:0]  ddc_delay_comp_offset_ant2_2;
   bit [7:0]  ddc_delay_comp_offset_ant3_2;
   bit [7:0]  ddc_delay_comp_offset_ant4_2;
   bit        prach_pat_en        ;
   bit        prach_pb_sel        ;
   bit        prach_tc = 0        ;
   bit [1:0]  mixed_mode          ;
   bit [2:0]  blanking = 0        ;  // 0 - No Blanking , 1 - PRB Blanking , 2 - AXC Blanking , 3 - Symbol Blanking , 4 - Single Sec AXC SYM Blanking , 5 - Multi sec PRB Blanking, 6 - Multi sec AXC SYM PRB Blanking  
   bit [31:0] rx_early_high_up    ;
   bit [31:0] rx_early_low_up     ;  
   bit [31:0] rx_late_high_up     ;
   bit [31:0] rx_late_low_up      ;
   bit [31:0] rx_on_time_high_up  ;
   bit [31:0] rx_on_time_low_up   ;
   bit [31:0] rx_total_high_c_u   ;
   bit [31:0] rx_total_low_c_u    ;
   bit [31:0] tx_total_high_cp    ;
   bit [31:0] tx_total_low_cp     ;
   bit [31:0] tx_total_high_c_u   ;
   bit [31:0] tx_total_low_c_u    ;
   bit        delay_testing       ;
   bit [31:0] pkt_cnt_early       ;
   bit [31:0] pkt_cnt_late        ;
   bit [31:0] pkt_cnt_c_early     ;
   bit [31:0] pkt_cnt_c_late      ;
   bit [31:0] long_prach1_nco        ;
   bit [31:0] long_prach1_nco_1      ;
   bit [31:0] long_prach1_nco_2      ;
   bit [31:0] long_prach1_nco_3      ;
   bit        long_prach1_technology ;
   bit [15:0] long_prach1_cfg_index  ;
   bit [31:0] long_prach1_nco_offset ;
   bit [15:0] long_prach1_gain_real  ;
   bit [31:0] long_prach2_nco        ;
   bit [31:0] long_prach2_nco_1      ;
   bit [31:0] long_prach2_nco_2      ;
   bit [31:0] long_prach2_nco_3      ;
   bit        long_prach2_technology ;
   bit [15:0] long_prach2_cfg_index  ;
   bit [31:0] long_prach2_nco_offset ;
   bit [15:0] long_prach2_gain_real  ;
   bit        force_dut = 0          ;
   bit        multi_sec              ;
   event      prach_c_event_done     ;
   bit [5:0]  fs_offset = 1          ;

   bit [31:0] ecpri_ip_version   ;
   bit [31:0] oran_ip_version    ;
   bit [31:0] fh_comp_ip_version ;
   bit [31:0] coupling_version   ;
   bit [31:0] long_prach_version ;
   bit [31:0] ifft1_F1_reg_lsb   ;
   bit [31:0] ifft1_F1_reg_msb   ;
   bit [31:0] ifft2_F1_reg       ;
   bit [31:0] fft1_F1_reg_lsb    ;
   bit [31:0] fft1_F1_reg_msb    ;
   bit [31:0] fft2_F1_reg        ;
   bit [31:0] ifft1_version      ;
   bit [31:0] ifft2_version      ;
   bit [31:0] fft1_version       ;
   bit [31:0] fft2_version       ;
   bit [31:0] ca_interp_version  ;
   bit [31:0] duc_l1_version     ;
   bit [31:0] duc_l2_version     ;
   bit [31:0] ddc_l1_version     ;
   bit [31:0] ddc_l2_version     ;
   bit [31:0] dec_dly_comp_version ;
   bit [31:0] duc_nco_l1_ant1_lsb  ;
   bit [31:0] duc_nco_l1_ant1_msb  ;
   bit [31:0] duc_nco_l1_ant2_lsb  ;
   bit [31:0] duc_nco_l1_ant2_msb  ;
   bit [31:0] duc_nco_l1_ant3_lsb  ;
   bit [31:0] duc_nco_l1_ant3_msb  ;
   bit [31:0] duc_nco_l1_ant4_lsb  ;
   bit [31:0] duc_nco_l1_ant4_msb  ;
   bit [31:0] duc_nco_l2_ant1_lsb  ;
   bit [31:0] duc_nco_l2_ant1_msb  ;
   bit [31:0] duc_nco_l2_ant2_lsb  ;
   bit [31:0] duc_nco_l2_ant2_msb  ;
   bit [31:0] duc_nco_l2_ant3_lsb  ;
   bit [31:0] duc_nco_l2_ant3_msb  ;
   bit [31:0] duc_nco_l2_ant4_lsb  ;
   bit [31:0] duc_nco_l2_ant4_msb  ;
   bit [31:0] ddc_nco_l1_ant1_lsb  ;
   bit [31:0] ddc_nco_l1_ant1_msb  ;
   bit [31:0] ddc_nco_l1_ant2_lsb  ;
   bit [31:0] ddc_nco_l1_ant2_msb  ;
   bit [31:0] ddc_nco_l1_ant3_lsb  ;
   bit [31:0] ddc_nco_l1_ant3_msb  ;
   bit [31:0] ddc_nco_l1_ant4_lsb  ;
   bit [31:0] ddc_nco_l1_ant4_msb  ;
   bit [31:0] ddc_nco_l2_ant1_lsb  ;
   bit [31:0] ddc_nco_l2_ant1_msb  ;
   bit [31:0] ddc_nco_l2_ant2_lsb  ;
   bit [31:0] ddc_nco_l2_ant2_msb  ;
   bit [31:0] ddc_nco_l2_ant3_lsb  ;
   bit [31:0] ddc_nco_l2_ant3_msb  ;
   bit [31:0] ddc_nco_l2_ant4_lsb  ;
   bit [31:0] ddc_nco_l2_ant4_msb  ;
   bit [8:0]  fh_static_udcomphdr  ;
   bit        fft_dc_sc_en_l1      ;
   bit        fft_dc_sc_en_l2      ;
   bit        fft_rc_en_l1         ;
   bit        fft_rc_en_l2         ;
   bit [3:0]  fft_rc_bw_sel_l1     ;
   bit [3:0]  fft_rc_bw_sel_l2     ;
   bit        ul_hcs_bypass_l1     ;
   bit        ul_hcs_bypass_l2     ;
   bit        arb_ctrl             ;
   bit [1:0]  arb_pusch_priority   ;
   bit [1:0]  arb_prach_priority   ;
   bit [31:0] sp_time_off          ;
   bit [31:0] sp_time_off_bias     ;
   bit [31:0] sp_startsym_bias     ;
   bit        control_reset        ;
   bit [1:0]  UL_pwr_en            ;
   bit [1:0]  DL_pwr_en            ;
   bit        IRQ_Enable           ;
   bit        StartnStop           ;
   bit [3:0]  mode                 ;
   bit [31:0] comp_time            ;
   bit        data_ready           ;
   bit        Error                ;
   bit [15:0] reserved1            ; 
   bit [3:0]  debug_state          ;
   bit [1:0]  saturation           ; 
   bit [1:0]  data_status          ;

   bit        ifft_hist_done[2]    ;
   bit        fft_hist_done[2]     ;
   bit [1:0]  value                ;
  
   shortint   fs_decomp[16] = {128,181,256,362,512,724,1024,1448,2048,2896,4096,5793,8192,11585,16384,23170}  ;
   shortint   fs_comp[16]   = {32767,23170,16384,11585,8192,5792,4096,2896,2048,1448,1024,724,512,362,256,181};

   int        histogram_dut_ref[2][14][4][32];
   int        histogram_fft_dut_ref[2][14][4][32];
   int        statistic_ifft_dut_ref[2][2][14][4][8];
   int        statistic_fft_dut_ref[2][2][14][4][8];
   bit [31:0] thresh_data[33];
   bit [31:0] tmp_data[33];


  // Constructor - Required UVM syntax
  function new(string name = "o_ru_ip_config");
     super.new(name);
     $value$plusargs("SEED = %d",SEED);
     srandom(SEED);
  endfunction : new

  endclass : o_ru_ip_config
`endif
