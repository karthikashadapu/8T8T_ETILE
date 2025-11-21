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

`ifndef O_RU_REG_SV
`define O_RU_REG_SV
  
 class o_ru_reg extends uvm_component;
    `uvm_component_utils(o_ru_reg)
    Top_Subsystem_mmap_urm ral_blk;
    o_ru_ip_config  o_ru_cfg;
   
    bit [31:0] wr_data;
    bit [31:0] rd_data;
    bit [31:0] exp_val;
    uvm_status_e status ;
    uvm_reg_data_t value;

    function new(string name, uvm_component parent=null);
       super.new(name,parent);
    endfunction

    // Register write
    extern virtual task deploy_write_registers()              ;

    extern virtual task deploy_ecpri_source_lsb()             ;
    extern virtual task deploy_ecpri_source_msb()             ;
    extern virtual task deploy_ecpri_dest_lsb()               ;
    extern virtual task deploy_ecpri_dest_msb()               ;

    extern virtual task deploy_oran_func_mode()               ;
    extern virtual task deploy_oran_udcomp_hdr()              ;
    extern virtual task deploy_oran_t2a_max_cp()              ;
    extern virtual task deploy_oran_t2a_min_cp()              ;
    extern virtual task deploy_oran_t2a_min_up()              ;
    extern virtual task deploy_oran_t2a_max_up()              ;
    extern virtual task deploy_oran_ta3_min_up()              ;
    extern virtual task deploy_oran_ta3_max_up()              ;
    extern virtual task deploy_oran_ta3_min_cp()              ;
    extern virtual task deploy_oran_ta3_max_cp()              ;
    extern virtual task deploy_oran_t2a_max_cp_ul()           ;
    extern virtual task deploy_oran_t2a_min_cp_ul()           ;
    extern virtual task deploy_oran_rx_window_enable()        ;
    extern virtual task deploy_oran_tx_window_enable()        ;

    extern virtual task deploy_dl_input_config()              ;
    extern virtual task deploy_ul_input_config()              ;
    extern virtual task deploy_frame_config()                 ;
    extern virtual task deploy_c_hps()                        ;
    extern virtual task deploy_hps_config()                   ;
    extern virtual task deploy_short_prach_freq_offset()      ;
    extern virtual task deploy_short_prach_time_offset()       ;
    extern virtual task deploy_short_prach_time_offset_bias()  ;
    extern virtual task deploy_short_prach_startsym_bias();
    extern virtual task deploy_hps_valid()                    ;
    extern virtual task deploy_cc1_config()                   ;
    extern virtual task deploy_cc2_config()                   ;
    extern virtual task deploy_arbiter_config()               ;
    extern virtual task deploy_arbiter_priority()             ;
    extern virtual task deploy_cp_length()                    ;
    extern virtual task deploy_fft_size()                     ;
    extern virtual task deploy_ifft_l1_control()              ;
    extern virtual task deploy_ifft_l2_control()              ;
    extern virtual task deploy_fft_l1_control()               ;
    extern virtual task deploy_fft_l2_control()               ;
    extern virtual task deploy_ifft_l1_rc_bw_sel()            ;
    extern virtual task deploy_ifft_l2_rc_bw_sel()            ;
    extern virtual task deploy_fft_l1_rc_bw_sel()             ;
    extern virtual task deploy_fft_l2_rc_bw_sel()             ;
    extern virtual task deploy_ifft_gain_l1()                 ;
    extern virtual task deploy_ifft_shift_l1()                ;
    extern virtual task deploy_ifft_mux_const_data_l1()       ;
    extern virtual task deploy_ifft_mux_const_data_l2()       ;
    extern virtual task deploy_ifft_gain_l2()                 ;
    extern virtual task deploy_ifft_shift_l2()                ;
    extern virtual task deploy_fft_gain_l1()                  ;
    extern virtual task deploy_fft_shift_l1()                 ;
    extern virtual task deploy_ifft_fft_lpbk_en()             ;
    extern virtual task deploy_fft_gain_l2()                  ;
    extern virtual task deploy_fft_shift_l2()                 ;
    extern virtual task deploy_long_prach_filt_flush_en()     ;
    extern virtual task deploy_prach_pat_en()                 ;
    extern virtual task delpoy_prach_pb_sel()                 ;

    extern virtual task deploy_intr_idle_ms()                 ;
    extern virtual task deploy_intr_clr()                     ;
    extern virtual task deploy_dl_eaxc_config_reg()           ;
    extern virtual task deploy_ul_eaxc_config_reg()           ;
    extern virtual task deploy_decomp_fs_offset()             ; 
    extern virtual task deploy_comp_fs_offset()               ;
 
    extern virtual task deploy_ifft1_F1_reg_lsb()             ;  
    extern virtual task deploy_ifft1_F1_reg_msb()             ;  
    extern virtual task deploy_ifft2_F1_reg()                 ;  
    extern virtual task deploy_phase_comp_en1()               ;
    extern virtual task deploy_phase_comp_en2()               ;
    extern virtual task deploy_ifft1_Phase_Gen_Reg()          ;
    extern virtual task deploy_ifft2_Phase_Gen_Reg()          ;

    extern virtual task deploy_fft1_F1_reg_lsb()              ;  
    extern virtual task deploy_fft1_F1_reg_msb()              ;  
    extern virtual task deploy_fft2_F1_reg()                  ;  
    extern virtual task deploy_fft1_Enable_reg1()             ;
    extern virtual task deploy_fft2_Enable_reg1()             ;
    extern virtual task deploy_fft1_Phase_Gen_Reg()           ;
    extern virtual task deploy_fft2_Phase_Gen_Reg()           ;

    extern virtual task deploy_prach1_cfg_index()             ;
    extern virtual task deploy_prach1_cfg_time_index()        ;
    extern virtual task deploy_n_prach1_slot()                ;
    extern virtual task deploy_active_prach1_slot()           ;
    extern virtual task deploy_prach1_freq_idx()              ;
    extern virtual task deploy_prach2_cfg_index()             ;
    extern virtual task deploy_prach2_cfg_time_index()        ;
    extern virtual task deploy_n_prach2_slot()                ;
    extern virtual task deploy_active_prach2_slot()           ;
    extern virtual task deploy_prach2_freq_idx()              ;

    extern virtual task deploy_duc_gain_ant1()                ;
    extern virtual task deploy_duc_gain_ant2()                ;
    extern virtual task deploy_duc_gain_ant3()                ;
    extern virtual task deploy_duc_gain_ant4()                ;
    extern virtual task deploy_duc_hb_bypass_en()             ;
    extern virtual task deploy_duc_delay_comp_offset_ant1_1() ;
    extern virtual task deploy_duc_delay_comp_offset_ant2_1() ;
    extern virtual task deploy_duc_delay_comp_offset_ant3_1() ;
    extern virtual task deploy_duc_delay_comp_offset_ant4_1() ;
    extern virtual task deploy_duc_delay_comp_offset_ant1_2() ;
    extern virtual task deploy_duc_delay_comp_offset_ant2_2() ;
    extern virtual task deploy_duc_delay_comp_offset_ant3_2() ;
    extern virtual task deploy_duc_delay_comp_offset_ant4_2() ;

    extern virtual task deploy_ddc_gain_ant1()                ; 
    extern virtual task deploy_ddc_gain_ant2()                ; 
    extern virtual task deploy_ddc_gain_ant3()                ; 
    extern virtual task deploy_ddc_gain_ant4()                ; 
    extern virtual task deploy_ddc_hb_bypass_en()             ; 
    extern virtual task deploy_ddc_delay_comp_offset_ant1_1() ;
    extern virtual task deploy_ddc_delay_comp_offset_ant2_1() ;
    extern virtual task deploy_ddc_delay_comp_offset_ant3_1() ;
    extern virtual task deploy_ddc_delay_comp_offset_ant4_1() ;
    extern virtual task deploy_ddc_delay_comp_offset_ant1_2() ;
    extern virtual task deploy_ddc_delay_comp_offset_ant2_2() ;
    extern virtual task deploy_ddc_delay_comp_offset_ant3_2() ;
    extern virtual task deploy_ddc_delay_comp_offset_ant4_2() ;

    extern virtual task deploy_long_prach1_nco()              ;                                   
    extern virtual task deploy_long_prach1_nco_1()            ;
    extern virtual task deploy_long_prach1_nco_2()            ;
    extern virtual task deploy_long_prach1_nco_3()            ; 
    extern virtual task deploy_long_prach1_technology()       ;    
    extern virtual task deploy_long_prach1_cfg_index()        ;    
    extern virtual task deploy_long_prach1_nco_offset()       ;    
    extern virtual task deploy_long_prach1_gain_real()        ;    
    extern virtual task deploy_long_prach2_nco()              ;           
    extern virtual task deploy_long_prach2_nco_1()            ; 
    extern virtual task deploy_long_prach2_nco_2()            ; 
    extern virtual task deploy_long_prach2_nco_3()            ;  
    extern virtual task deploy_long_prach2_technology()       ;    
    extern virtual task deploy_long_prach2_cfg_index()        ; 
    extern virtual task deploy_long_prach2_nco_offset()       ;
    extern virtual task deploy_long_prach2_gain_real()        ;    

    extern virtual task deploy_duc_nco_l1_ant1_lsb()          ;
    extern virtual task deploy_duc_nco_l1_ant1_msb()          ;
    extern virtual task deploy_duc_nco_l1_ant2_lsb()          ;
    extern virtual task deploy_duc_nco_l1_ant2_msb()          ;
    extern virtual task deploy_duc_nco_l1_ant3_lsb()          ;
    extern virtual task deploy_duc_nco_l1_ant3_msb()          ;
    extern virtual task deploy_duc_nco_l1_ant4_lsb()          ;
    extern virtual task deploy_duc_nco_l1_ant4_msb()          ;
    extern virtual task deploy_duc_nco_l2_ant1_lsb()          ;
    extern virtual task deploy_duc_nco_l2_ant1_msb()          ;
    extern virtual task deploy_duc_nco_l2_ant2_lsb()          ;
    extern virtual task deploy_duc_nco_l2_ant2_msb()          ;
    extern virtual task deploy_duc_nco_l2_ant3_lsb()          ;
    extern virtual task deploy_duc_nco_l2_ant3_msb()          ;
    extern virtual task deploy_duc_nco_l2_ant4_lsb()          ;
    extern virtual task deploy_duc_nco_l2_ant4_msb()          ;

    extern virtual task deploy_ddc_nco_l1_ant1_lsb()          ;
    extern virtual task deploy_ddc_nco_l1_ant1_msb()          ;
    extern virtual task deploy_ddc_nco_l1_ant2_lsb()          ;
    extern virtual task deploy_ddc_nco_l1_ant2_msb()          ;
    extern virtual task deploy_ddc_nco_l1_ant3_lsb()          ;
    extern virtual task deploy_ddc_nco_l1_ant3_msb()          ;
    extern virtual task deploy_ddc_nco_l1_ant4_lsb()          ;
    extern virtual task deploy_ddc_nco_l1_ant4_msb()          ;
    extern virtual task deploy_ddc_nco_l2_ant1_lsb()          ;
    extern virtual task deploy_ddc_nco_l2_ant1_msb()          ;
    extern virtual task deploy_ddc_nco_l2_ant2_lsb()          ;
    extern virtual task deploy_ddc_nco_l2_ant2_msb()          ;
    extern virtual task deploy_ddc_nco_l2_ant3_lsb()          ;
    extern virtual task deploy_ddc_nco_l2_ant3_msb()          ;
    extern virtual task deploy_ddc_nco_l2_ant4_lsb()          ;
    extern virtual task deploy_ddc_nco_l2_ant4_msb()          ;

    extern virtual task deploy_fh_compress()                  ;
     
    extern virtual task deploy_pwr_mtr_control_reg_ifft_l1()  ;
    extern virtual task deploy_pwr_mtr_compute_time_ifft_l1() ;
    extern virtual task deploy_pwr_mtr_intr_mask_reg_ifft_l1();
    extern virtual task deploy_pwr_mtr_control_reg_ifft_l2()  ;
    extern virtual task deploy_pwr_mtr_compute_time_ifft_l2() ;
    extern virtual task deploy_pwr_mtr_intr_mask_reg_ifft_l2();
    extern virtual task deploy_pwr_mtr_control_reg_fft_l1()   ;
    extern virtual task deploy_pwr_mtr_compute_time_fft_l1()  ;
    extern virtual task deploy_pwr_mtr_intr_mask_reg_fft_l1() ;
    extern virtual task deploy_pwr_mtr_control_reg_fft_l2()   ;
    extern virtual task deploy_pwr_mtr_compute_time_fft_l2()  ;
    extern virtual task deploy_pwr_mtr_intr_mask_reg_fft_l2() ;

    // Register read
    extern virtual task check_lowphy_ss_registers()          ;
    extern virtual task check_oran_ss_registers()            ;
    extern virtual task check_oran_registers()               ;
    extern virtual task check_oran_window_registers()        ;
    extern virtual task check_ecpri_registers()              ;
    extern virtual task check_ifft_l1_registers()            ;
    extern virtual task check_ifft_l2_registers()            ;
    extern virtual task check_fft_l1_registers()             ;
    extern virtual task check_fft_l2_registers()             ;
    extern virtual task check_short_prach_l1_registers()     ;   
    extern virtual task check_short_prach_l2_registers()     ; 
    extern virtual task check_ca_interp_registers()          ;    
    extern virtual task check_duc_l1_registers()             ;   
    extern virtual task check_duc_l2_registers()             ;   
    extern virtual task check_dec_dly_comp_registers()       ;    
    extern virtual task check_ddc_l1_registers()             ;   
    extern virtual task check_ddc_l2_registers()             ;   
    extern virtual task check_long_prach_l1_registers()      ;          
    extern virtual task check_long_prach_l2_registers()      ;        
    extern virtual task check_ip_version_registers()         ;
    extern virtual task check_pwr_mtr_registers()            ;

    extern virtual task check_oran_func_mode()               ;
    extern virtual task check_oran_udcomp_hdr()              ;
    extern virtual task check_oran_t2a_max_cp()              ;
    extern virtual task check_oran_t2a_min_cp()              ;
    extern virtual task check_oran_t2a_min_up()              ;
    extern virtual task check_oran_t2a_max_up()              ;
    extern virtual task check_oran_ta3_min_up()              ;
    extern virtual task check_oran_ta3_max_up()              ;
    extern virtual task check_rx_early_high_up()             ;
    extern virtual task check_rx_early_low_up()              ;
    extern virtual task check_rx_late_high_up()              ;
    extern virtual task check_rx_late_low_up()               ;
    extern virtual task check_rx_on_time_high_up()           ;
    extern virtual task check_rx_on_time_low_up()            ;
    extern virtual task check_rx_total_high_c_u()            ;
    extern virtual task check_rx_total_low_c_u()             ;
    extern virtual task check_tx_total_high_cp()             ;
    extern virtual task check_tx_total_low_cp()              ;
    extern virtual task check_tx_total_high_c_u()            ;
    extern virtual task check_tx_total_low_c_u()             ;

    extern virtual task check_ecpri_source_lsb()             ;
    extern virtual task check_ecpri_source_msb()             ;
    extern virtual task check_ecpri_dest_lsb()               ;
    extern virtual task check_ecpri_dest_msb()               ;

    extern virtual task check_frame_config()                 ;
    extern virtual task check_dl_input_config()              ;
    extern virtual task check_ul_input_config()              ;
    extern virtual task check_c_hps()                        ;
    extern virtual task check_hps_config()                   ;
    extern virtual task check_long_prach_freq_offset()       ;
    extern virtual task check_hps_valid()                    ;
    extern virtual task check_short_prach_freq_offset()      ;
    extern virtual task check_bw_config_cc1()                ;
    extern virtual task check_cc2_config()                   ;
    extern virtual task check_prach_pat_en()                 ;
    extern virtual task check_prach_pb_sel()                 ;
    extern virtual task check_cp_length()                    ;
    extern virtual task check_fft_size()                     ;
    extern virtual task check_ifft_l1_control()              ;
    extern virtual task check_ifft_l2_control()              ;
    extern virtual task check_fft_l1_control()               ;
    extern virtual task check_fft_l2_control()               ;
    extern virtual task check_ifft_gain_l1()                 ;
    extern virtual task check_ifft_shift_l1()                ;
    extern virtual task check_ifft_mux_const_data_l1()       ;
    extern virtual task check_ifft_mux_const_data_l2()       ;
    extern virtual task check_ifft_gain_l2()                 ;
    extern virtual task check_ifft_shift_l2()                ;
    extern virtual task check_fft_gain_l1()                  ;
    extern virtual task check_fft_shift_l1()                 ;
    extern virtual task check_ifft_fft_lpbk_en()             ;
    extern virtual task check_fft_gain_l2()                  ;
    extern virtual task check_fft_shift_l2()                 ;
    extern virtual task check_long_prach_filt_flush_en()     ;
    extern virtual task check_long_prach_version()           ; 

    extern virtual task check_ecpri_ip_version()             ;
    extern virtual task check_oran_ip_version()              ;
    extern virtual task check_fh_comp_ip_version()           ;
    extern virtual task check_coupling_ip_version()          ;
    extern virtual task check_dl_eaxc_config_reg()           ;
    extern virtual task check_ul_eaxc_config_reg()           ;
    extern virtual task check_intr_clr()                     ;
    extern virtual task check_intr_idle_ms()                 ;
    extern virtual task check_decomp_fs_offset()             ; 
    extern virtual task check_comp_fs_offset()               ;

    extern virtual task check_ifft1_F1_reg_lsb()             ;
    extern virtual task check_ifft1_F1_reg_msb()             ;
    extern virtual task check_phase_comp_en1()               ;
    extern virtual task check_ifft1_Phase_Gen_Reg()          ;
    extern virtual task check_ifft1_version()                ; 
    extern virtual task check_ifft2_version()                ; 
    extern virtual task check_ifft2_F1_reg()                 ;
    extern virtual task check_phase_comp_en2()               ;
    extern virtual task check_ifft2_Phase_Gen_Reg()          ;

    extern virtual task check_fft1_F1_reg_lsb()              ;
    extern virtual task check_fft1_F1_reg_msb()              ;
    extern virtual task check_fft1_Enable_reg1()             ;
    extern virtual task check_fft1_Phase_Gen_Reg()           ;
    extern virtual task check_fft1_version()                 ; 
    extern virtual task check_fft2_version()                 ; 
    extern virtual task check_fft2_F1_reg()                  ;
    extern virtual task check_fft2_Enable_reg1()             ;
    extern virtual task check_fft2_Phase_Gen_Reg()           ;

    extern virtual task check_prach1_cfg_index()             ;
    extern virtual task check_prach1_cfg_time_index()        ;
    extern virtual task check_n_prach1_slot()                ;
    extern virtual task check_active_prach1_slot()           ;
    extern virtual task check_prach1_freq_idx()              ;
    extern virtual task check_prach2_cfg_index()             ;
    extern virtual task check_prach2_cfg_time_index()        ;
    extern virtual task check_n_prach2_slot()                ;
    extern virtual task check_active_prach2_slot()           ;
    extern virtual task check_prach2_freq_idx()              ;

    extern virtual task check_duc_gain_ant1()                ;
    extern virtual task check_duc_gain_ant2()                ;
    extern virtual task check_duc_gain_ant3()                ;
    extern virtual task check_duc_gain_ant4()                ;
    extern virtual task check_duc_hb_bypass_en()             ;
    extern virtual task check_duc_delay_comp_offset_ant1_1() ;
    extern virtual task check_duc_delay_comp_offset_ant2_1() ;
    extern virtual task check_duc_delay_comp_offset_ant3_1() ;
    extern virtual task check_duc_delay_comp_offset_ant4_1() ;
    extern virtual task check_duc_delay_comp_offset_ant1_2() ;
    extern virtual task check_duc_delay_comp_offset_ant2_2() ;
    extern virtual task check_duc_delay_comp_offset_ant3_2() ;
    extern virtual task check_duc_delay_comp_offset_ant4_2() ;
    extern virtual task check_ca_interp_version()            ; 

    extern virtual task check_ddc_gain_ant1()                ;
    extern virtual task check_ddc_gain_ant2()                ;
    extern virtual task check_ddc_gain_ant3()                ;
    extern virtual task check_ddc_gain_ant4()                ;
    extern virtual task check_ddc_hb_bypass_en()             ;
    extern virtual task check_ddc_delay_comp_offset_ant1_1() ;
    extern virtual task check_ddc_delay_comp_offset_ant2_1() ;
    extern virtual task check_ddc_delay_comp_offset_ant3_1() ;
    extern virtual task check_ddc_delay_comp_offset_ant4_1() ;
    extern virtual task check_ddc_delay_comp_offset_ant1_2() ;
    extern virtual task check_ddc_delay_comp_offset_ant2_2() ;
    extern virtual task check_ddc_delay_comp_offset_ant3_2() ;
    extern virtual task check_ddc_delay_comp_offset_ant4_2() ;
    extern virtual task check_dec_dly_comp_version()         ; 

    extern virtual task check_long_prach1_nco()              ;
    extern virtual task check_long_prach1_nco_1()            ;
    extern virtual task check_long_prach1_nco_2()            ;
    extern virtual task check_long_prach1_nco_3()            ;
    extern virtual task check_long_prach2_nco()              ;
    extern virtual task check_long_prach2_nco_1()            ;
    extern virtual task check_long_prach2_nco_2()            ;
    extern virtual task check_long_prach2_nco_3()            ;

    extern virtual task check_duc_l1_version()               ; 
    extern virtual task check_duc_nco_l1_ant1_lsb()          ;
    extern virtual task check_duc_nco_l1_ant1_msb()          ;
    extern virtual task check_duc_nco_l1_ant2_lsb()          ;
    extern virtual task check_duc_nco_l1_ant2_msb()          ;
    extern virtual task check_duc_nco_l1_ant3_lsb()          ;
    extern virtual task check_duc_nco_l1_ant3_msb()          ;
    extern virtual task check_duc_nco_l1_ant4_lsb()          ;
    extern virtual task check_duc_nco_l1_ant4_msb()          ;
    extern virtual task check_duc_l2_version()               ; 
    extern virtual task check_duc_nco_l2_ant1_lsb()          ;
    extern virtual task check_duc_nco_l2_ant1_msb()          ;
    extern virtual task check_duc_nco_l2_ant2_lsb()          ;
    extern virtual task check_duc_nco_l2_ant2_msb()          ;
    extern virtual task check_duc_nco_l2_ant3_lsb()          ;
    extern virtual task check_duc_nco_l2_ant3_msb()          ;
    extern virtual task check_duc_nco_l2_ant4_lsb()          ;
    extern virtual task check_duc_nco_l2_ant4_msb()          ;

    extern virtual task check_ddc_l1_version()               ; 
    extern virtual task check_ddc_nco_l1_ant1_lsb()          ;
    extern virtual task check_ddc_nco_l1_ant1_msb()          ;
    extern virtual task check_ddc_nco_l1_ant2_lsb()          ;
    extern virtual task check_ddc_nco_l1_ant2_msb()          ;
    extern virtual task check_ddc_nco_l1_ant3_lsb()          ;
    extern virtual task check_ddc_nco_l1_ant3_msb()          ;
    extern virtual task check_ddc_nco_l1_ant4_lsb()          ;
    extern virtual task check_ddc_nco_l1_ant4_msb()          ;
    extern virtual task check_ddc_l2_version()               ; 
    extern virtual task check_ddc_nco_l2_ant1_lsb()          ;
    extern virtual task check_ddc_nco_l2_ant1_msb()          ;
    extern virtual task check_ddc_nco_l2_ant2_lsb()          ;
    extern virtual task check_ddc_nco_l2_ant2_msb()          ;
    extern virtual task check_ddc_nco_l2_ant3_lsb()          ;
    extern virtual task check_ddc_nco_l2_ant3_msb()          ;
    extern virtual task check_ddc_nco_l2_ant4_lsb()          ;
    extern virtual task check_ddc_nco_l2_ant4_msb()          ;

    extern virtual task check_fh_compress()                  ;

    extern virtual task check_pwr_mtr_control_reg_ifft_l1()  ;
    extern virtual task check_pwr_mtr_status_reg_ifft_l1()   ;
    extern virtual task check_pwr_mtr_compute_time_ifft_l1() ;
    extern virtual task check_pwr_mtr_intr_mask_reg_ifft_l1();
    extern virtual task check_pwr_mtr_control_reg_ifft_l2()  ;
    extern virtual task check_pwr_mtr_status_reg_ifft_l2()   ;
    extern virtual task check_pwr_mtr_compute_time_ifft_l2() ;
    extern virtual task check_pwr_mtr_intr_mask_reg_ifft_l2();
    extern virtual task check_pwr_mtr_control_reg_fft_l1()   ;
    extern virtual task check_pwr_mtr_status_reg_fft_l1()    ;
    extern virtual task check_pwr_mtr_compute_time_fft_l1()  ;
    extern virtual task check_pwr_mtr_intr_mask_reg_fft_l1() ;
    extern virtual task check_pwr_mtr_control_reg_fft_l2()   ;
    extern virtual task check_pwr_mtr_status_reg_fft_l2()    ;
    extern virtual task check_pwr_mtr_compute_time_fft_l2()  ;
    extern virtual task check_pwr_mtr_intr_mask_reg_fft_l2() ;

 endclass : o_ru_reg


// Frame Sync register write
task o_ru_reg::deploy_write_registers();

   deploy_ecpri_source_lsb()            ;
   deploy_ecpri_source_msb()            ;
   deploy_ecpri_dest_lsb()              ;
   deploy_ecpri_dest_msb()              ;
   deploy_oran_func_mode()              ;
   deploy_oran_udcomp_hdr()             ;
   deploy_oran_t2a_max_cp()             ;
   deploy_oran_t2a_min_cp()             ;
   deploy_oran_t2a_min_up()             ;
   deploy_oran_t2a_max_up()             ;
   deploy_oran_ta3_min_up()             ;
   deploy_oran_ta3_max_up()             ;
   deploy_oran_ta3_min_cp()             ;
   deploy_oran_ta3_max_cp()             ;    
   deploy_oran_t2a_max_cp_ul()          ;
   deploy_oran_t2a_min_cp_ul()          ;
   deploy_oran_rx_window_enable()       ;
   deploy_oran_tx_window_enable()       ;
   deploy_dl_eaxc_config_reg()          ;
   deploy_ul_eaxc_config_reg()          ;
   deploy_arbiter_config()              ;
   deploy_arbiter_priority()            ;
   deploy_fh_compress()                 ;
   deploy_decomp_fs_offset()            ; 
   deploy_comp_fs_offset()              ;
   `ifndef ECPRI_ORAN_SS
     deploy_dl_input_config()              ;
     deploy_ul_input_config()              ;
     deploy_frame_config()                 ;
     deploy_cc1_config()                   ;
     deploy_cc2_config()                   ;
     deploy_cp_length()                    ;
     deploy_fft_size()                     ;
     deploy_ifft_l1_control()              ;
     deploy_fft_l1_control()               ;
     deploy_ifft_gain_l1()                 ;
     deploy_ifft_shift_l1()                ;
     deploy_ifft_mux_const_data_l1()       ;
     deploy_ifft_l1_rc_bw_sel()            ; 
     deploy_fft_l1_rc_bw_sel()             ;
     deploy_pwr_mtr_control_reg_ifft_l1()  ; 
     deploy_pwr_mtr_compute_time_ifft_l1() ; 
     deploy_pwr_mtr_intr_mask_reg_ifft_l1(); 
     deploy_pwr_mtr_control_reg_fft_l1()   ; 
     deploy_pwr_mtr_compute_time_fft_l1()  ; 
     deploy_pwr_mtr_intr_mask_reg_fft_l1() ; 

     `ifdef NUM_CC_TWO
       deploy_ifft_gain_l2()                 ;
       deploy_ifft_shift_l2()                ;
       deploy_ifft_l2_control()              ;
       deploy_fft_l2_control()               ;
       deploy_ifft_mux_const_data_l2()       ;
       deploy_ifft_l2_rc_bw_sel()            ;
       deploy_fft_gain_l2()                  ;
       deploy_fft_shift_l2()                 ;
       deploy_fft_l2_rc_bw_sel()             ;
       deploy_phase_comp_en2()               ;
       deploy_ifft2_F1_reg()                 ;  
       deploy_ifft2_Phase_Gen_Reg()          ;
       deploy_fft2_Enable_reg1()             ;
       deploy_fft2_F1_reg()                  ;  
       deploy_fft2_Phase_Gen_Reg()           ;
       deploy_pwr_mtr_control_reg_ifft_l2()  ;  
       deploy_pwr_mtr_compute_time_ifft_l2() ; 
       deploy_pwr_mtr_intr_mask_reg_ifft_l2(); 
       deploy_pwr_mtr_control_reg_fft_l2()   ; 
       deploy_pwr_mtr_compute_time_fft_l2()  ; 
       deploy_pwr_mtr_intr_mask_reg_fft_l2() ; 

     `endif
     deploy_fft_gain_l1()                 ;
     deploy_fft_shift_l1()                ;
     deploy_ifft_fft_lpbk_en()            ;
     deploy_long_prach_filt_flush_en()    ;
     deploy_ifft1_F1_reg_lsb()            ;  
     deploy_ifft1_F1_reg_msb()            ;  
     deploy_phase_comp_en1()              ;
     deploy_ifft1_Phase_Gen_Reg()         ;
     deploy_fft1_F1_reg_lsb()             ;  
     deploy_fft1_F1_reg_msb()             ;  
     deploy_fft1_Enable_reg1()            ;
     deploy_fft1_Phase_Gen_Reg()          ;
     `ifdef SHORT_PRACH_FORMAT 
       deploy_prach1_cfg_index()          ;
       deploy_prach1_cfg_time_index()     ;
       deploy_n_prach1_slot()             ;
       deploy_active_prach1_slot()        ;
       deploy_prach1_freq_idx()           ;
       `ifdef NUM_CC_TWO
         deploy_prach2_cfg_index()        ;
         deploy_prach2_cfg_time_index()   ;
         deploy_n_prach2_slot()           ;
         deploy_active_prach2_slot()      ;
         deploy_prach2_freq_idx()         ;
       `endif
     `else
       deploy_long_prach1_nco()         ;
       deploy_long_prach1_nco_1()       ;
       deploy_long_prach1_nco_2()       ;
       deploy_long_prach1_nco_3()       ;
       deploy_long_prach1_nco_offset()  ;
       deploy_long_prach1_gain_real()   ;
       `ifdef NUM_CC_TWO 
       	deploy_long_prach2_nco()       ;
       	deploy_long_prach2_nco_1()     ;
       	deploy_long_prach2_nco_2()     ;
       	deploy_long_prach2_nco_3()     ;
       	deploy_long_prach2_nco_offset();
       	deploy_long_prach2_gain_real() ;
       `endif
     `endif
     deploy_c_hps()                         ;
     deploy_hps_config()                    ;
     deploy_short_prach_freq_offset()       ;
     deploy_short_prach_time_offset()        ;
     deploy_short_prach_time_offset_bias()   ;
     deploy_short_prach_startsym_bias() ;
     deploy_hps_valid()                     ;
     
     `ifndef IFFT_FFT_LOOPBACK 
       deploy_duc_gain_ant1()               ;
       deploy_duc_gain_ant2()               ;
       deploy_duc_gain_ant3()               ;
       deploy_duc_gain_ant4()               ;
       deploy_duc_hb_bypass_en()            ;
       deploy_duc_delay_comp_offset_ant1_1();
       deploy_duc_delay_comp_offset_ant2_1();
       deploy_duc_delay_comp_offset_ant3_1();
       deploy_duc_delay_comp_offset_ant4_1();
       deploy_duc_nco_l1_ant1_lsb()         ;
       deploy_duc_nco_l1_ant1_msb()         ;
       deploy_duc_nco_l1_ant2_lsb()         ;
       deploy_duc_nco_l1_ant2_msb()         ;
       deploy_duc_nco_l1_ant3_lsb()         ;
       deploy_duc_nco_l1_ant3_msb()         ;
       deploy_duc_nco_l1_ant4_lsb()         ;
       deploy_duc_nco_l1_ant4_msb()         ;
       `ifdef NUM_CC_TWO
         deploy_duc_delay_comp_offset_ant1_2();
         deploy_duc_delay_comp_offset_ant2_2();
         deploy_duc_delay_comp_offset_ant3_2();
         deploy_duc_delay_comp_offset_ant4_2();
         deploy_duc_nco_l2_ant1_lsb()       ;
         deploy_duc_nco_l2_ant1_msb()       ;
         deploy_duc_nco_l2_ant2_lsb()       ;
         deploy_duc_nco_l2_ant2_msb()       ;
         deploy_duc_nco_l2_ant3_lsb()       ;
         deploy_duc_nco_l2_ant3_msb()       ;
         deploy_duc_nco_l2_ant4_lsb()       ;
         deploy_duc_nco_l2_ant4_msb()       ;
       `endif
       deploy_ddc_gain_ant1()               ;
       deploy_ddc_gain_ant2()               ;
       deploy_ddc_gain_ant3()               ;
       deploy_ddc_gain_ant4()               ;
       deploy_ddc_hb_bypass_en()            ;
       deploy_ddc_delay_comp_offset_ant1_1();
       deploy_ddc_delay_comp_offset_ant2_1();
       deploy_ddc_delay_comp_offset_ant3_1();
       deploy_ddc_delay_comp_offset_ant4_1();
       deploy_ddc_nco_l1_ant1_lsb()         ;
       deploy_ddc_nco_l1_ant1_msb()         ;
       deploy_ddc_nco_l1_ant2_lsb()         ;
       deploy_ddc_nco_l1_ant2_msb()         ;
       deploy_ddc_nco_l1_ant3_lsb()         ;
       deploy_ddc_nco_l1_ant3_msb()         ;
       deploy_ddc_nco_l1_ant4_lsb()         ;
       deploy_ddc_nco_l1_ant4_msb()         ;
       `ifdef NUM_CC_TWO
         deploy_ddc_delay_comp_offset_ant1_2();
         deploy_ddc_delay_comp_offset_ant2_2();
         deploy_ddc_delay_comp_offset_ant3_2();
         deploy_ddc_delay_comp_offset_ant4_2();
         deploy_ddc_nco_l2_ant1_lsb()         ;
         deploy_ddc_nco_l2_ant1_msb()         ;
         deploy_ddc_nco_l2_ant2_lsb()         ;
         deploy_ddc_nco_l2_ant2_msb()         ;
         deploy_ddc_nco_l2_ant3_lsb()         ;
         deploy_ddc_nco_l2_ant3_msb()         ;
         deploy_ddc_nco_l2_ant4_lsb()         ;
         deploy_ddc_nco_l2_ant4_msb()         ;
       `endif
     `endif
     deploy_prach_pat_en()                ;
     delpoy_prach_pb_sel()                ;
   `endif

endtask :deploy_write_registers


task o_ru_reg::deploy_ecpri_source_lsb();
   wr_data = o_ru_cfg.source_mac_lsb;
   ral_blk.source_mac_addr0_0.write(status,wr_data); 
   `uvm_info("DBG", $psprintf("SOURCE ADDRESS LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ecpri_source_lsb

task o_ru_reg::deploy_ecpri_source_msb();
   wr_data = o_ru_cfg.source_mac_msb;
   ral_blk.source_mac_addr0_1.write(status,wr_data[15:0]); 
   `uvm_info("DBG", $psprintf("SOURCE ADDRESS MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ecpri_source_msb

task o_ru_reg::deploy_ecpri_dest_lsb();
   wr_data = o_ru_cfg.destination_mac_lsb;
   ral_blk.dest_mac_addr0_0.write(status,wr_data); 
   `uvm_info("DBG", $psprintf("DESTINATION ADDRESS LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ecpri_dest_lsb

task o_ru_reg::deploy_ecpri_dest_msb();
   wr_data = o_ru_cfg.destination_mac_msb;
   ral_blk.dest_mac_addr0_1.write(status,wr_data[15:0]); 
   `uvm_info("DBG", $psprintf("DESTINATION ADDRESS MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ecpri_dest_msb

task o_ru_reg::deploy_oran_func_mode();
   wr_data = {16'd0,o_ru_cfg.mtu_size,1'd0,o_ru_cfg.func_mode};
   ral_blk.csr_functional_mode.write(status,wr_data); 
   `uvm_info("DBG", $psprintf("ORAN FUNCTONAL MODE Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_oran_func_mode

task o_ru_reg::deploy_oran_udcomp_hdr();
   wr_data = o_ru_cfg.ud_comp_width;
   ral_blk.csr_static_udcomphdr.write(status,wr_data); 
   `uvm_info("DBG", $psprintf("ORAN UD COMP HDR Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_oran_udcomp_hdr

task o_ru_reg::deploy_dl_input_config();
   wr_data = o_ru_cfg.dl_input_config;
   ral_blk.dl_input_config.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DL INPUT CONFIG Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_dl_input_config

task o_ru_reg::deploy_ul_input_config();
   wr_data = o_ru_cfg.ul_input_config;
   ral_blk.ul_input_config.write(status,wr_data);
   `uvm_info("DBG", $psprintf("UL INPUT CONFIG Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ul_input_config

task o_ru_reg::deploy_frame_config();
   wr_data = o_ru_cfg.frame_config;
   ral_blk.frame_sync_frame_config.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FRAME CONFIG Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_frame_config

task o_ru_reg::deploy_c_hps();
   wr_data = o_ru_cfg.c_hps;
   ral_blk.c_hps.write(status,wr_data);
   `uvm_info("DBG", $psprintf("C_HPS Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_c_hps

task o_ru_reg::deploy_hps_config();
   wr_data = {24'd0, o_ru_cfg.frame_structure};
   ral_blk.hps_config.write(status,wr_data);
   `uvm_info("DBG", $psprintf("HPS_CONFIG Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_hps_config

task o_ru_reg::deploy_short_prach_freq_offset();
   wr_data = {8'd0, o_ru_cfg.short_prach_freq_offset};
   ral_blk.short_prach_freq_offset.write(status,wr_data);
   `uvm_info("DBG", $psprintf("SHORT PRACH FREQUENCY OFFSET Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_short_prach_freq_offset

task o_ru_reg::deploy_short_prach_time_offset();
   wr_data = o_ru_cfg.sp_time_off;
   ral_blk.short_prach_time_offset.write(status,wr_data);
   `uvm_info("DBG", $psprintf("SHORT PRACH TIME OFFSET Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_short_prach_time_offset

task o_ru_reg::deploy_short_prach_time_offset_bias();
   wr_data = o_ru_cfg.sp_time_off_bias;
   ral_blk.short_prach_time_offset_bias.write(status,wr_data);
   `uvm_info("DBG", $psprintf("SHORT PRACH TIME OFFSET BIAS Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_short_prach_time_offset_bias

task o_ru_reg::deploy_short_prach_startsym_bias();
   wr_data = o_ru_cfg.sp_startsym_bias;
   ral_blk.short_prach_startsym_bias.write(status,wr_data);
   `uvm_info("DBG", $psprintf("SHORT PRACH START SYM BIAS Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_short_prach_startsym_bias


task o_ru_reg::deploy_hps_valid();
   wr_data = {24'd0, o_ru_cfg.hps_valid};
   ral_blk.hps_valid.write(status,wr_data);
   `uvm_info("DBG", $psprintf("HPS_VALID Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_hps_valid

task o_ru_reg::deploy_oran_t2a_max_cp();
   wr_data = o_ru_cfg.t1a_max_cp;
   ral_blk.csr_t2a_max_cp_dl.write(status,wr_data);
   `uvm_info("DBG", $psprintf("ORAN T2A_MAX CPLANE Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_oran_t2a_max_cp

task o_ru_reg::deploy_oran_t2a_min_cp();
   wr_data = o_ru_cfg.t1a_min_cp;
   ral_blk.csr_t2a_min_cp_dl.write(status,wr_data);
   `uvm_info("DBG", $psprintf("ORAN T2A_MIN CPLANE Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_oran_t2a_min_cp

task o_ru_reg::deploy_oran_t2a_min_up();
   wr_data = o_ru_cfg.t2a_min_up;
   ral_blk.csr_t2a_min_up.write(status,wr_data);
   `uvm_info("DBG", $psprintf("ORAN T2A_MIN UPLANE Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_oran_t2a_min_up

task o_ru_reg::deploy_oran_t2a_max_up();
   wr_data = o_ru_cfg.t2a_max_up;
   ral_blk.csr_t2a_max_up.write(status,wr_data);
   `uvm_info("DBG", $psprintf("ORAN T2A_MAX UPLANE Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_oran_t2a_max_up

task o_ru_reg::deploy_oran_ta3_min_up();
   wr_data = o_ru_cfg.t3a_min_up;
   ral_blk.csr_ta3_min_up.write(status,wr_data);
   `uvm_info("DBG", $psprintf("ORAN TA3_MIN UPLANE Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_oran_ta3_min_up

task o_ru_reg::deploy_oran_ta3_max_up();
   wr_data = o_ru_cfg.t3a_max_up;
   ral_blk.csr_ta3_max_up.write(status,wr_data);
   `uvm_info("DBG", $psprintf("ORAN TA3_MAX UPLANE Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_oran_ta3_max_up

task o_ru_reg::deploy_oran_t2a_max_cp_ul();
   wr_data = o_ru_cfg.t2a_max_cp_ul;
   ral_blk.csr_t2a_max_cp_ul.write(status,wr_data);
   `uvm_info("DBG", $psprintf("ORAN T2A_MAX CPLANE UL Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_oran_t2a_max_cp_ul

task o_ru_reg::deploy_oran_t2a_min_cp_ul();
   wr_data = o_ru_cfg.t2a_min_cp_ul;
   ral_blk.csr_t2a_min_cp_ul.write(status,wr_data);
   `uvm_info("DBG", $psprintf("ORAN T2A_MIN CPLANE UL Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_oran_t2a_min_cp_ul

task o_ru_reg::deploy_oran_ta3_min_cp();
   wr_data = o_ru_cfg.ta3_min_cp;
   ral_blk.csr_ta3_min_up_1p25khz.write(status,wr_data);
   `uvm_info("DBG", $psprintf("ORAN TA3_MIN CPLANE Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_oran_ta3_min_cp

task o_ru_reg::deploy_oran_ta3_max_cp();
   wr_data = o_ru_cfg.ta3_max_cp;
   ral_blk.csr_ta3_max_up_1p25khz.write(status,wr_data);
   `uvm_info("DBG", $psprintf("ORAN TA3_MAX CPLANE Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_oran_ta3_max_cp

task o_ru_reg::deploy_oran_rx_window_enable();
   wr_data = o_ru_cfg.rx_window_enable;
   ral_blk.csr_rx_window_enable.write(status,wr_data);
   `uvm_info("DBG", $psprintf("ORAN RX WINDOW ENABLE Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_oran_rx_window_enable

task o_ru_reg::deploy_oran_tx_window_enable();
   wr_data = o_ru_cfg.tx_window_enable;
   ral_blk.csr_tx_window_enable.write(status,wr_data);
   `uvm_info("DBG", $psprintf("ORAN TX WINDOW ENABLE Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_oran_tx_window_enable

task o_ru_reg::deploy_cc1_config();
   wr_data = {24'd0,o_ru_cfg.cc1_dis,o_ru_cfg.cc1_bw};
   ral_blk.bw_config_cc1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("CC 1 Bandwidth Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_cc1_config

task o_ru_reg::deploy_cc2_config();
   wr_data = {24'd0,o_ru_cfg.cc2_dis,o_ru_cfg.cc2_bw};
   ral_blk.bw_config_cc2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("CC 2 Bandwidth Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_cc2_config

task o_ru_reg::deploy_arbiter_config();
   wr_data = {31'd0,o_ru_cfg.arb_ctrl};
   ral_blk.arbiter_cfg.write(status,wr_data);
   `uvm_info("DBG", $psprintf("Arbiter Ctrl Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_arbiter_config

task o_ru_reg::deploy_arbiter_priority();
   wr_data = {28'd0,o_ru_cfg.arb_prach_priority,o_ru_cfg.arb_pusch_priority};
   ral_blk.arbiter_prio1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("Arbiter Priority Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_arbiter_priority

task o_ru_reg::deploy_dl_eaxc_config_reg();

   wr_data = {16'd0,o_ru_cfg.dl_mac_axc[0]};
   ral_blk.dl_eaxc_id0.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DL eAXC config Register 0 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.dl_mac_axc[1]};
   ral_blk.dl_eaxc_id1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DL eAXC config Register 1 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.dl_mac_axc[2]};
   ral_blk.dl_eaxc_id2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DL eAXC config Register 2 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.dl_mac_axc[3]};
   ral_blk.dl_eaxc_id3.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DL eAXC config Register 3 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.dl_mac_axc[4]};
   ral_blk.dl_eaxc_id4.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DL eAXC config Register 4 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.dl_mac_axc[5] };
   ral_blk.dl_eaxc_id5.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DL eAXC config Register 5 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.dl_mac_axc[6] };
   ral_blk.dl_eaxc_id6.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DL eAXC config Register 6 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.dl_mac_axc[7] };
   ral_blk.dl_eaxc_id7.write(status,wr_data);
   `uvm_info("DBG", $psprintf(" DL eAXC config Register 7 Write value :%h",wr_data), UVM_LOW)

endtask :deploy_dl_eaxc_config_reg

task o_ru_reg::deploy_intr_idle_ms();
   wr_data = 1;
   ral_blk.intr_idle_ms.write(status,wr_data);
   `uvm_info("DBG", $psprintf(" Interrupt Idle MS Write value :%h",wr_data), UVM_LOW)
endtask

task o_ru_reg::deploy_intr_clr();
   wr_data = 3;
   ral_blk.intr_clear.write(status,wr_data);
   `uvm_info("DBG", $psprintf(" Interrupt Clear Write value :%h",wr_data), UVM_LOW)
endtask

task o_ru_reg::deploy_ul_eaxc_config_reg();

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[0]};
   ral_blk.ul_eaxc_id0.write(status,wr_data);
   `uvm_info("DBG", $psprintf("UL eAXC config Register 0 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[1]};
   ral_blk.ul_eaxc_id1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("UL eAXC config Register 1 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[2]};
   ral_blk.ul_eaxc_id2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("UL eAXC config Register 2 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[3]};
   ral_blk.ul_eaxc_id3.write(status,wr_data);
   `uvm_info("DBG", $psprintf("UL eAXC config Register 3 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[4]};
   ral_blk.ul_eaxc_id4.write(status,wr_data);
   `uvm_info("DBG", $psprintf("UL eAXC config Register 4 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[5]};
   ral_blk.ul_eaxc_id5.write(status,wr_data);
   `uvm_info("DBG", $psprintf("UL eAXC config Register 5 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[6]};
   ral_blk.ul_eaxc_id6.write(status,wr_data);
   `uvm_info("DBG", $psprintf("UL eAXC config Register 6 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[7]};
   ral_blk.ul_eaxc_id7.write(status,wr_data);
   `uvm_info("DBG", $psprintf(" UL eAXC config Register 7 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[8]};
   ral_blk.ul_eaxc_id8.write(status,wr_data);
   `uvm_info("DBG", $psprintf(" UL eAXC config Register 8 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[9]};
   ral_blk.ul_eaxc_id9.write(status,wr_data);
   `uvm_info("DBG", $psprintf(" UL eAXC config Register 9 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[10]};
   ral_blk.ul_eaxc_id10.write(status,wr_data);
   `uvm_info("DBG", $psprintf(" UL eAXC config Register 10 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[11]};
   ral_blk.ul_eaxc_id11.write(status,wr_data);
   `uvm_info("DBG", $psprintf(" UL eAXC config Register 11 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[12]};
   ral_blk.ul_eaxc_id12.write(status,wr_data);
   `uvm_info("DBG", $psprintf(" UL eAXC config Register 12 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[13]};
   ral_blk.ul_eaxc_id13.write(status,wr_data);
   `uvm_info("DBG", $psprintf(" UL eAXC config Register 13 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[14]};
   ral_blk.ul_eaxc_id14.write(status,wr_data);
   `uvm_info("DBG", $psprintf(" UL eAXC config Register 14 Write value :%h",wr_data), UVM_LOW)

   wr_data = {16'd0,o_ru_cfg.ul_mac_axc[15]};
   ral_blk.ul_eaxc_id15.write(status,wr_data);
   `uvm_info("DBG", $psprintf(" UL eAXC config Register 15 Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ul_eaxc_config_reg

task o_ru_reg::deploy_decomp_fs_offset();
   wr_data = {16'd0,o_ru_cfg.fs_offset};
   ral_blk.decomp_fsoffset.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DECOMP FS OFFSET Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_decomp_fs_offset

task o_ru_reg::deploy_comp_fs_offset();
   wr_data = {16'd0,o_ru_cfg.fs_offset};
   ral_blk.comp_fsoffset.write(status,wr_data);
   `uvm_info("DBG", $psprintf("COMP FS OFFSET Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_comp_fs_offset

task o_ru_reg::deploy_cp_length();
   wr_data = {21'd0,o_ru_cfg.cp_length};
   ral_blk.cp_length.write(status,wr_data);
   `uvm_info("DBG", $psprintf("CP Length Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_cp_length

task o_ru_reg::deploy_fft_size();
   wr_data = {28'd0,o_ru_cfg.fft_size};
   ral_blk.fft_size.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT Size Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft_size

task o_ru_reg::deploy_ifft_l1_control();
   wr_data = {29'd0,o_ru_cfg.ifft_rc_en_l1,o_ru_cfg.ifft_dc_sc_en_l1,o_ru_cfg.mux_select_l1};
   ral_blk.ifft_l1_control.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT L1 CONTROL Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft_l1_control

task o_ru_reg::deploy_ifft_l2_control();
   wr_data = {29'd0,o_ru_cfg.ifft_rc_en_l2,o_ru_cfg.ifft_dc_sc_en_l2,o_ru_cfg.mux_select_l2};
   ral_blk.ifft_l2_control.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT L2 CONTROL Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft_l2_control

task o_ru_reg::deploy_fft_l1_control();
   wr_data = {29'd0,o_ru_cfg.fft_rc_en_l1,o_ru_cfg.ul_hcs_bypass_l1,o_ru_cfg.fft_dc_sc_en_l1};
   ral_blk.fft_l1_control.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT L1 CONTROL Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft_l1_control

task o_ru_reg::deploy_fft_l2_control();
   wr_data = {29'd0,o_ru_cfg.fft_rc_en_l2,o_ru_cfg.ul_hcs_bypass_l2,o_ru_cfg.fft_dc_sc_en_l2};
   ral_blk.fft_l2_control.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT L2 CONTROL Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft_l2_control

task o_ru_reg::deploy_ifft_l1_rc_bw_sel();
   wr_data = {28'd0,o_ru_cfg.ifft_rc_bw_sel_l1};
   ral_blk.ifft_l1_rc_bw_sel.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT L1 RC BW Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft_l1_rc_bw_sel

task o_ru_reg::deploy_ifft_l2_rc_bw_sel();
   wr_data = {28'd0,o_ru_cfg.ifft_rc_bw_sel_l2};
   ral_blk.ifft_l2_rc_bw_sel.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT L2 RC BW Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft_l2_rc_bw_sel

task o_ru_reg::deploy_fft_l1_rc_bw_sel();
   wr_data = {28'd0,o_ru_cfg.fft_rc_bw_sel_l1};
   ral_blk.fft_l1_rc_bw_sel.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT L1 RC BW Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft_l1_rc_bw_sel

task o_ru_reg::deploy_fft_l2_rc_bw_sel();
   wr_data = {28'd0,o_ru_cfg.fft_rc_bw_sel_l2};
   ral_blk.fft_l2_rc_bw_sel.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT L2 RC BW Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft_l2_rc_bw_sel

task o_ru_reg::deploy_ifft_gain_l1();
   wr_data = o_ru_cfg.ifft_gain_l1;
   ral_blk.ifft_gain_l1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT Gain L1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft_gain_l1

task o_ru_reg::deploy_ifft_shift_l1();
   wr_data = {28'd0,o_ru_cfg.ifft_shift_l1};
   ral_blk.ifft_shift_l1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT Shift L1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft_shift_l1

task o_ru_reg::deploy_ifft_mux_const_data_l1();
   wr_data = {16'd0,o_ru_cfg.ifft_mux_constant_l1};
   ral_blk.ifft_mux_const_data_l1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT Mux Const Data L1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft_mux_const_data_l1

task o_ru_reg::deploy_ifft_mux_const_data_l2();
   wr_data = {16'd0,o_ru_cfg.ifft_mux_constant_l2};
   ral_blk.ifft_mux_const_data_l2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT Mux Const Data L2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft_mux_const_data_l2

task o_ru_reg::deploy_ifft_gain_l2();
   wr_data = o_ru_cfg.ifft_gain_l2;
   ral_blk.ifft_gain_l2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT Gain L2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft_gain_l2

task o_ru_reg::deploy_ifft_shift_l2();
   wr_data = {28'd0,o_ru_cfg.ifft_shift_l2};
   ral_blk.ifft_shift_l2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT Shift L2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft_shift_l2

task o_ru_reg::deploy_fft_gain_l1();
   wr_data = o_ru_cfg.fft_gain_l1;
   ral_blk.fft_gain_l1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT Gain L1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft_gain_l1

task o_ru_reg::deploy_fft_shift_l1();
   wr_data = {28'd0,o_ru_cfg.fft_shift_l1};
   ral_blk.fft_shift_l1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT Shift L1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft_shift_l1

task o_ru_reg::deploy_ifft_fft_lpbk_en();
   wr_data = {30'd0,o_ru_cfg.fdv_lpbk_en,o_ru_cfg.ifft_fft_lpbk_en};
   ral_blk.lpbk_en.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LPBK EN Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft_fft_lpbk_en

task o_ru_reg::deploy_fft_gain_l2();
   wr_data = o_ru_cfg.fft_gain_l2;
   ral_blk.fft_gain_l2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT Gain L2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft_gain_l2

task o_ru_reg::deploy_fft_shift_l2();
   wr_data = {28'd0,o_ru_cfg.fft_shift_l2};
   ral_blk.fft_shift_l2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT Shift L2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft_shift_l2

task o_ru_reg::deploy_long_prach_filt_flush_en();
   wr_data = {30'd0,o_ru_cfg.lprach2_filt_flush_en,o_ru_cfg.lprach1_filt_flush_en};
   ral_blk.long_prach_filt_flush_en.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH FILT FLUSH EN Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach_filt_flush_en

task o_ru_reg::deploy_prach_pat_en();
   wr_data = {31'd0,o_ru_cfg.prach_pat_en};
   ral_blk.prach_pat_en.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PRACH PAT EN Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_prach_pat_en

task o_ru_reg::delpoy_prach_pb_sel();
   wr_data = {31'd0,o_ru_cfg.prach_pb_sel};
   ral_blk.prach_pb_sel.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PRACH PB SEL Register Write value :%h",wr_data), UVM_LOW)
endtask :delpoy_prach_pb_sel


task o_ru_reg::deploy_ifft1_F1_reg_lsb();
   wr_data = o_ru_cfg.ifft1_F1_reg_lsb;
   ral_blk.ifft1_F1_reg_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT1 F1 Reg LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft1_F1_reg_lsb

task o_ru_reg::deploy_ifft1_F1_reg_msb();
   wr_data = o_ru_cfg.ifft1_F1_reg_msb;
   ral_blk.ifft1_F1_reg_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT1 F1 Reg MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft1_F1_reg_msb

task o_ru_reg::deploy_ifft2_F1_reg();
   wr_data = o_ru_cfg.ifft2_F1_reg;
   ral_blk.ifft2_F1_reg.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT2 F1 Reg Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft2_F1_reg

task o_ru_reg::deploy_phase_comp_en1();
   wr_data = {31'd0,o_ru_cfg.phase_comp_en1};
   ral_blk.ifft1_Enable_reg.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PHASE COMP EN 1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_phase_comp_en1

task o_ru_reg::deploy_phase_comp_en2();
   wr_data = {31'd0,o_ru_cfg.phase_comp_en2};
   ral_blk.ifft2_Enable_reg.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PHASE COMP EN 2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_phase_comp_en2

task o_ru_reg::deploy_ifft1_Phase_Gen_Reg();
   wr_data = {31'd0,o_ru_cfg.ifft1_Phase_Gen_Reg};
   ral_blk.ifft1_PhaseGen_reg.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT 1 Phase Gen Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft1_Phase_Gen_Reg

task o_ru_reg::deploy_ifft2_Phase_Gen_Reg();
   wr_data = {31'd0,o_ru_cfg.ifft2_Phase_Gen_Reg};
   ral_blk.ifft2_PhaseGen_reg.write(status,wr_data);
   `uvm_info("DBG", $psprintf("IFFT 2 Phase Gen Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ifft2_Phase_Gen_Reg

task o_ru_reg::deploy_fft1_F1_reg_lsb();
   wr_data = o_ru_cfg.fft1_F1_reg_lsb;
   ral_blk.fft1_F1_reg_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT1 F1 REG LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft1_F1_reg_lsb

task o_ru_reg::deploy_fft1_F1_reg_msb();
   wr_data = o_ru_cfg.fft1_F1_reg_msb;
   ral_blk.fft1_F1_reg_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT1 F1 REG MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft1_F1_reg_msb

task o_ru_reg::deploy_fft2_F1_reg();
   wr_data = o_ru_cfg.fft2_F1_reg;
   ral_blk.fft2_F1_reg.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT2 F1 REG Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft2_F1_reg

task o_ru_reg::deploy_fft1_Enable_reg1();
   wr_data = {31'd0,o_ru_cfg.fft1_Enable_reg1};
   ral_blk.fft1_Enable_reg.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT1 ENABLE REG1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft1_Enable_reg1

task o_ru_reg::deploy_fft2_Enable_reg1();
   wr_data = {31'd0,o_ru_cfg.fft2_Enable_reg1};
   ral_blk.fft2_Enable_reg.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT2 ENABLE REG1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft2_Enable_reg1

task o_ru_reg::deploy_fft1_Phase_Gen_Reg();
   wr_data = {31'd0,o_ru_cfg.fft1_Phase_Gen_Reg};
   ral_blk.fft1_PhaseGen_reg.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT1 Phase Gen Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft1_Phase_Gen_Reg

task o_ru_reg::deploy_fft2_Phase_Gen_Reg();
   wr_data = {31'd0,o_ru_cfg.fft2_Phase_Gen_Reg};
   ral_blk.fft2_PhaseGen_reg.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FFT2 Phase Gen Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fft2_Phase_Gen_Reg

task o_ru_reg::deploy_prach1_cfg_index();
   wr_data = {24'd0,o_ru_cfg.prach1_cfg_index};
   ral_blk.short_Prach1_cfg_index.write(status,wr_data);
   `uvm_info("DBG", $psprintf("SHORT PRACH1 CFG INDEX Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_prach1_cfg_index

task o_ru_reg::deploy_prach1_cfg_time_index();
   wr_data = o_ru_cfg.prach1_cfg_time_index;
   ral_blk.short_Prach1_cfg_time_index.write(status,wr_data);
   `uvm_info("DBG", $psprintf("SHORT PRACH1 CFG TIME INDEX Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_prach1_cfg_time_index

task o_ru_reg::deploy_n_prach1_slot();
   wr_data = o_ru_cfg.n_prach1_slot;
   ral_blk.n_short_prach1_slot.write(status,wr_data);
   `uvm_info("DBG", $psprintf("SHORT N PRACH1 SLOT Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_n_prach1_slot

task o_ru_reg::deploy_active_prach1_slot();
   wr_data = o_ru_cfg.active_prach1_slot;
   ral_blk.active_short_prach1_slot.write(status,wr_data);
   `uvm_info("DBG", $psprintf("SHORT ACTIVE PRACH1 SLOT Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_active_prach1_slot

task o_ru_reg::deploy_prach1_freq_idx();
   wr_data = o_ru_cfg.prach1_freq_idx;
   ral_blk.short_prach1_freq_idx.write(status,wr_data);
   `uvm_info("DBG", $psprintf("SHORT PRACH1 FREQ IDX Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_prach1_freq_idx

task o_ru_reg::deploy_prach2_cfg_index();
   wr_data = {24'd0,o_ru_cfg.prach2_cfg_index};
   ral_blk.short_Prach2_cfg_index.write(status,wr_data);
   `uvm_info("DBG", $psprintf("SHORT PRACH2 CFG INDEX Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_prach2_cfg_index

task o_ru_reg::deploy_prach2_cfg_time_index();
   wr_data = o_ru_cfg.prach2_cfg_time_index;
   ral_blk.short_Prach2_cfg_time_index.write(status,wr_data);
   `uvm_info("DBG", $psprintf("SHORT PRACH2 CFG TIME INDEX Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_prach2_cfg_time_index

task o_ru_reg::deploy_n_prach2_slot();
   wr_data = o_ru_cfg.n_prach2_slot;
   ral_blk.n_short_prach2_slot.write(status,wr_data);
   `uvm_info("DBG", $psprintf("SHORT N PRACH2 SLOT Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_n_prach2_slot

task o_ru_reg::deploy_active_prach2_slot();
   wr_data = o_ru_cfg.active_prach2_slot;
   ral_blk.active_short_prach2_slot.write(status,wr_data);
   `uvm_info("DBG", $psprintf("SHORT ACTIVE PRACH2 SLOT Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_active_prach2_slot

task o_ru_reg::deploy_prach2_freq_idx();
   wr_data = o_ru_cfg.prach2_freq_idx;
   ral_blk.short_prach2_freq_idx.write(status,wr_data);
   `uvm_info("DBG", $psprintf("SHORT PRACH2 FREQ IDX Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_prach2_freq_idx


task o_ru_reg::deploy_duc_gain_ant1();
   wr_data = {16'd0,o_ru_cfg.duc_gain_ant1};
   ral_blk.duc_gain_ant1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC GAIN ANT1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_gain_ant1

task o_ru_reg::deploy_duc_gain_ant2();
   wr_data = {16'd0,o_ru_cfg.duc_gain_ant2};
   ral_blk.duc_gain_ant2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC GAIN ANT2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_gain_ant2

task o_ru_reg::deploy_duc_gain_ant3();
   wr_data = {16'd0,o_ru_cfg.duc_gain_ant3};
   ral_blk.duc_gain_ant3.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC GAIN ANT3 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_gain_ant3

task o_ru_reg::deploy_duc_gain_ant4();
   wr_data = {16'd0,o_ru_cfg.duc_gain_ant4};
   ral_blk.duc_gain_ant4.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC GAIN ANT4 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_gain_ant4

task o_ru_reg::deploy_duc_hb_bypass_en();
   wr_data = {16'd0,o_ru_cfg.duc_hb_bypass_en};
   ral_blk.duc_hb_bypass_en.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC HB BYPASS EN Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_hb_bypass_en

task o_ru_reg::deploy_duc_delay_comp_offset_ant1_1();
   wr_data = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant1_1};
   ral_blk.duc_delay_comp_offset_ant1_1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC DELAY COMP OFFSET ANT1 1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_delay_comp_offset_ant1_1

task o_ru_reg::deploy_duc_delay_comp_offset_ant2_1();
   wr_data = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant2_1};
   ral_blk.duc_delay_comp_offset_ant2_1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC DELAY COMP OFFSET ANT2 1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_delay_comp_offset_ant2_1

task o_ru_reg::deploy_duc_delay_comp_offset_ant3_1();
   wr_data = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant3_1};
   ral_blk.duc_delay_comp_offset_ant3_1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC DELAY COMP OFFSET ANT3 1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_delay_comp_offset_ant3_1

task o_ru_reg::deploy_duc_delay_comp_offset_ant4_1();
   wr_data = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant4_1};
   ral_blk.duc_delay_comp_offset_ant4_1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC DELAY COMP OFFSET ANT4 1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_delay_comp_offset_ant4_1

task o_ru_reg::deploy_duc_delay_comp_offset_ant1_2();
   wr_data = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant1_2};
   ral_blk.duc_delay_comp_offset_ant1_2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC DELAY COMP OFFSET ANT1 2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_delay_comp_offset_ant1_2

task o_ru_reg::deploy_duc_delay_comp_offset_ant2_2();
   wr_data = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant2_2};
   ral_blk.duc_delay_comp_offset_ant2_2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC DELAY COMP OFFSET ANT2 2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_delay_comp_offset_ant2_2

task o_ru_reg::deploy_duc_delay_comp_offset_ant3_2();
   wr_data = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant3_2};
   ral_blk.duc_delay_comp_offset_ant3_2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC DELAY COMP OFFSET ANT3 2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_delay_comp_offset_ant3_2

task o_ru_reg::deploy_duc_delay_comp_offset_ant4_2();
   wr_data = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant4_2};
   ral_blk.duc_delay_comp_offset_ant4_2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC DELAY COMP OFFSET ANT4 2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_delay_comp_offset_ant4_2

task o_ru_reg::deploy_duc_nco_l1_ant1_lsb();
   wr_data = {o_ru_cfg.duc_nco_l1_ant1_lsb};
   ral_blk.duc_nco_l1_ant1_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L1 ANT1 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l1_ant1_lsb

task o_ru_reg::deploy_duc_nco_l1_ant1_msb();
   wr_data = {o_ru_cfg.duc_nco_l1_ant1_msb};
   ral_blk.duc_nco_l1_ant1_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L1 ANT1 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l1_ant1_msb

task o_ru_reg::deploy_duc_nco_l1_ant2_lsb();
   wr_data = {o_ru_cfg.duc_nco_l1_ant2_lsb};
   ral_blk.duc_nco_l1_ant2_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L1 ANT2 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l1_ant2_lsb

task o_ru_reg::deploy_duc_nco_l1_ant2_msb();
   wr_data = {o_ru_cfg.duc_nco_l1_ant2_msb};
   ral_blk.duc_nco_l1_ant2_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L1 ANT2 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l1_ant2_msb

task o_ru_reg::deploy_duc_nco_l1_ant3_lsb();
   wr_data = {o_ru_cfg.duc_nco_l1_ant3_lsb};
   ral_blk.duc_nco_l1_ant3_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L1 ANT3 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l1_ant3_lsb

task o_ru_reg::deploy_duc_nco_l1_ant3_msb();
   wr_data = {o_ru_cfg.duc_nco_l1_ant3_msb};
   ral_blk.duc_nco_l1_ant3_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L1 ANT3 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l1_ant3_msb

task o_ru_reg::deploy_duc_nco_l1_ant4_lsb();
   wr_data = {o_ru_cfg.duc_nco_l1_ant4_lsb};
   ral_blk.duc_nco_l1_ant4_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L1 ANT4 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l1_ant4_lsb

task o_ru_reg::deploy_duc_nco_l1_ant4_msb();
   wr_data = {o_ru_cfg.duc_nco_l1_ant4_msb};
   ral_blk.duc_nco_l1_ant4_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L1 ANT4 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l1_ant4_msb

task o_ru_reg::deploy_ddc_nco_l1_ant1_lsb();
   wr_data = {o_ru_cfg.ddc_nco_l1_ant1_lsb};
   ral_blk.ddc_nco_l1_ant1_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L1 ANT1 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l1_ant1_lsb

task o_ru_reg::deploy_ddc_nco_l1_ant1_msb();
   wr_data = {o_ru_cfg.ddc_nco_l1_ant1_msb};
   ral_blk.ddc_nco_l1_ant1_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L1 ANT1 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l1_ant1_msb

task o_ru_reg::deploy_ddc_nco_l1_ant2_lsb();
   wr_data = {o_ru_cfg.ddc_nco_l1_ant2_lsb};
   ral_blk.ddc_nco_l1_ant2_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L1 ANT2 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l1_ant2_lsb

task o_ru_reg::deploy_ddc_nco_l1_ant2_msb();
   wr_data = {o_ru_cfg.ddc_nco_l1_ant2_msb};
   ral_blk.ddc_nco_l1_ant2_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L1 ANT2 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l1_ant2_msb

task o_ru_reg::deploy_ddc_nco_l1_ant3_lsb();
   wr_data = {o_ru_cfg.ddc_nco_l1_ant3_lsb};
   ral_blk.ddc_nco_l1_ant3_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L1 ANT3 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l1_ant3_lsb

task o_ru_reg::deploy_ddc_nco_l1_ant3_msb();
   wr_data = {o_ru_cfg.ddc_nco_l1_ant3_msb};
   ral_blk.ddc_nco_l1_ant3_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L1 ANT3 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l1_ant3_msb

task o_ru_reg::deploy_ddc_nco_l1_ant4_lsb();
   wr_data = {o_ru_cfg.ddc_nco_l1_ant4_lsb};
   ral_blk.ddc_nco_l1_ant4_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L1 ANT4 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l1_ant4_lsb

task o_ru_reg::deploy_ddc_nco_l1_ant4_msb();
   wr_data = {o_ru_cfg.ddc_nco_l1_ant4_msb};
   ral_blk.ddc_nco_l1_ant4_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L1 ANT4 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l1_ant4_msb


task o_ru_reg::deploy_ddc_gain_ant1();
   wr_data = {16'd0,o_ru_cfg.ddc_gain_ant1};
   ral_blk.ddc_gain_ant1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC GAIN ANT1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_gain_ant1

task o_ru_reg::deploy_ddc_gain_ant2();
   wr_data = {16'd0,o_ru_cfg.ddc_gain_ant2};
   ral_blk.ddc_gain_ant2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC GAIN ANT2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_gain_ant2

task o_ru_reg::deploy_ddc_gain_ant3();
   wr_data = {16'd0,o_ru_cfg.ddc_gain_ant3};
   ral_blk.ddc_gain_ant3.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC GAIN ANT3 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_gain_ant3

task o_ru_reg::deploy_ddc_gain_ant4();
   wr_data = {16'd0,o_ru_cfg.ddc_gain_ant4};
   ral_blk.ddc_gain_ant4.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC GAIN ANT4 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_gain_ant4

task o_ru_reg::deploy_ddc_hb_bypass_en();
   wr_data = {16'd0,o_ru_cfg.ddc_hb_bypass_en};
   ral_blk.ddc_hb_bypass_en.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC HB BYPASS EN Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_hb_bypass_en

task o_ru_reg::deploy_ddc_delay_comp_offset_ant1_1();
   wr_data = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant1_1};
   ral_blk.ddc_delay_comp_offset_ant1_1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC DELAY COMP OFFSET ANT1 1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_delay_comp_offset_ant1_1

task o_ru_reg::deploy_ddc_delay_comp_offset_ant2_1();
   wr_data = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant2_1};
   ral_blk.ddc_delay_comp_offset_ant2_1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC DELAY COMP OFFSET ANT2 1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_delay_comp_offset_ant2_1

task o_ru_reg::deploy_ddc_delay_comp_offset_ant3_1();
   wr_data = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant3_1};
   ral_blk.ddc_delay_comp_offset_ant3_1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC DELAY COMP OFFSET ANT3 1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_delay_comp_offset_ant3_1

task o_ru_reg::deploy_ddc_delay_comp_offset_ant4_1();
   wr_data = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant4_1};
   ral_blk.ddc_delay_comp_offset_ant4_1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC DELAY COMP OFFSET ANT4 1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_delay_comp_offset_ant4_1

task o_ru_reg::deploy_ddc_delay_comp_offset_ant1_2();
   wr_data = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant1_2};
   ral_blk.ddc_delay_comp_offset_ant1_2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC DELAY COMP OFFSET ANT1 2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_delay_comp_offset_ant1_2

task o_ru_reg::deploy_ddc_delay_comp_offset_ant2_2();
   wr_data = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant2_2};
   ral_blk.ddc_delay_comp_offset_ant2_2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC DELAY COMP OFFSET ANT2 2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_delay_comp_offset_ant2_2

task o_ru_reg::deploy_ddc_delay_comp_offset_ant3_2();
   wr_data = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant3_2};
   ral_blk.ddc_delay_comp_offset_ant3_2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC DELAY COMP OFFSET ANT3 2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_delay_comp_offset_ant3_2

task o_ru_reg::deploy_ddc_delay_comp_offset_ant4_2();
   wr_data = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant4_2};
   ral_blk.ddc_delay_comp_offset_ant4_2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC DELAY COMP OFFSET ANT4 2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_delay_comp_offset_ant4_2

task o_ru_reg::deploy_duc_nco_l2_ant1_lsb();
   wr_data = {o_ru_cfg.duc_nco_l2_ant1_lsb};
   ral_blk.duc_nco_l2_ant1_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L2 ANT1 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l2_ant1_lsb

task o_ru_reg::deploy_duc_nco_l2_ant1_msb();
   wr_data = {o_ru_cfg.duc_nco_l2_ant1_msb};
   ral_blk.duc_nco_l2_ant1_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L2 ANT1 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l2_ant1_msb

task o_ru_reg::deploy_duc_nco_l2_ant2_lsb();
   wr_data = {o_ru_cfg.duc_nco_l2_ant2_lsb};
   ral_blk.duc_nco_l2_ant2_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L2 ANT2 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l2_ant2_lsb

task o_ru_reg::deploy_duc_nco_l2_ant2_msb();
   wr_data = {o_ru_cfg.duc_nco_l2_ant2_msb};
   ral_blk.duc_nco_l2_ant2_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L2 ANT2 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l2_ant2_msb

task o_ru_reg::deploy_duc_nco_l2_ant3_lsb();
   wr_data = {o_ru_cfg.duc_nco_l2_ant3_lsb};
   ral_blk.duc_nco_l2_ant3_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L2 ANT3 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l2_ant3_lsb

task o_ru_reg::deploy_duc_nco_l2_ant3_msb();
   wr_data = {o_ru_cfg.duc_nco_l2_ant3_msb};
   ral_blk.duc_nco_l2_ant3_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L2 ANT3 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l2_ant3_msb

task o_ru_reg::deploy_duc_nco_l2_ant4_lsb();
   wr_data = {o_ru_cfg.duc_nco_l2_ant4_lsb};
   ral_blk.duc_nco_l2_ant4_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L2 ANT4 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l2_ant4_lsb

task o_ru_reg::deploy_duc_nco_l2_ant4_msb();
   wr_data = {o_ru_cfg.duc_nco_l2_ant4_msb};
   ral_blk.duc_nco_l2_ant4_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DUC NCO L2 ANT4 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_duc_nco_l2_ant4_msb

task o_ru_reg::deploy_ddc_nco_l2_ant1_lsb();
   wr_data = {o_ru_cfg.ddc_nco_l2_ant1_lsb};
   ral_blk.ddc_nco_l2_ant1_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L2 ANT1 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l2_ant1_lsb

task o_ru_reg::deploy_ddc_nco_l2_ant1_msb();
   wr_data = {o_ru_cfg.ddc_nco_l2_ant1_msb};
   ral_blk.ddc_nco_l2_ant1_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L2 ANT1 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l2_ant1_msb

task o_ru_reg::deploy_ddc_nco_l2_ant2_lsb();
   wr_data = {o_ru_cfg.ddc_nco_l2_ant2_lsb};
   ral_blk.ddc_nco_l2_ant2_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L2 ANT2 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l2_ant2_lsb

task o_ru_reg::deploy_ddc_nco_l2_ant2_msb();
   wr_data = {o_ru_cfg.ddc_nco_l2_ant2_msb};
   ral_blk.ddc_nco_l2_ant2_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L2 ANT2 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l2_ant2_msb

task o_ru_reg::deploy_ddc_nco_l2_ant3_lsb();
   wr_data = {o_ru_cfg.ddc_nco_l2_ant3_lsb};
   ral_blk.ddc_nco_l2_ant3_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L2 ANT3 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l2_ant3_lsb

task o_ru_reg::deploy_ddc_nco_l2_ant3_msb();
   wr_data = {o_ru_cfg.ddc_nco_l2_ant3_msb};
   ral_blk.ddc_nco_l2_ant3_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L2 ANT3 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l2_ant3_msb

task o_ru_reg::deploy_ddc_nco_l2_ant4_lsb();
   wr_data = {o_ru_cfg.ddc_nco_l2_ant4_lsb};
   ral_blk.ddc_nco_l2_ant4_lsb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L2 ANT4 LSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l2_ant4_lsb

task o_ru_reg::deploy_ddc_nco_l2_ant4_msb();
   wr_data = {o_ru_cfg.ddc_nco_l2_ant4_msb};
   ral_blk.ddc_nco_l2_ant4_msb.write(status,wr_data);
   `uvm_info("DBG", $psprintf("DDC NCO L2 ANT4 MSB Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_ddc_nco_l2_ant4_msb

task o_ru_reg::deploy_fh_compress();
   wr_data = {23'd0,o_ru_cfg.func_mode,o_ru_cfg.ud_comp_width};
   ral_blk.compression_mode.write(status,wr_data);
   `uvm_info("DBG", $psprintf("FH COMPRESS Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_fh_compress

task o_ru_reg::deploy_long_prach1_nco();
   wr_data = {o_ru_cfg.long_prach1_nco};
   ral_blk.long_prach1_nco_ant1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH1 NCO Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach1_nco

task o_ru_reg::deploy_long_prach1_nco_1();
   wr_data = {o_ru_cfg.long_prach1_nco_1};
   ral_blk.long_prach1_nco_ant2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH1 NCO 1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach1_nco_1

task o_ru_reg::deploy_long_prach1_nco_2();
   wr_data = {o_ru_cfg.long_prach1_nco_2};
   ral_blk.long_prach1_nco_ant3.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH1 NCO 2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach1_nco_2

task o_ru_reg::deploy_long_prach1_nco_3();
   wr_data = {o_ru_cfg.long_prach1_nco_3};
   ral_blk.long_prach1_nco_ant4.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH1 NCO 3 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach1_nco_3

task o_ru_reg::deploy_long_prach1_technology();
   wr_data = {31'd0,o_ru_cfg.long_prach1_technology};
   ral_blk.long_prach1_technology.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH1 TECHNOLOGY Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach1_technology

task o_ru_reg::deploy_long_prach1_cfg_index();
   wr_data = {16'd0,o_ru_cfg.long_prach1_cfg_index};
   ral_blk.long_prach1_cfg_index.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH1 CFG INDEX Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach1_cfg_index

task o_ru_reg::deploy_long_prach1_nco_offset();
   wr_data = {o_ru_cfg.long_prach1_nco_offset};
   ral_blk.long_prach1_nco_offset.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH1 NCO OFFSET Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach1_nco_offset

task o_ru_reg::deploy_long_prach1_gain_real();
   wr_data = {o_ru_cfg.long_prach1_gain_real};
   ral_blk.long_prach1_gain_real.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH1 GAIN REAL Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach1_gain_real

task o_ru_reg::deploy_long_prach2_nco();
   wr_data = {o_ru_cfg.long_prach2_nco};
   ral_blk.long_prach2_nco_ant1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH2 NCO Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach2_nco

task o_ru_reg::deploy_long_prach2_nco_1();
   wr_data = {o_ru_cfg.long_prach2_nco_1};
   ral_blk.long_prach2_nco_ant2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH2 NCO 1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach2_nco_1

task o_ru_reg::deploy_long_prach2_nco_2();
   wr_data = {o_ru_cfg.long_prach2_nco_2};
   ral_blk.long_prach2_nco_ant3.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH2 NCO 2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach2_nco_2

task o_ru_reg::deploy_long_prach2_nco_3();
   wr_data = {o_ru_cfg.long_prach2_nco_3};
   ral_blk.long_prach2_nco_ant4.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH2 NCO 3 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach2_nco_3

task o_ru_reg::deploy_long_prach2_technology();
   wr_data = {31'd0,o_ru_cfg.long_prach2_technology};
   ral_blk.long_prach2_technology.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH2 TECHNOLOGY Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach2_technology

task o_ru_reg::deploy_long_prach2_cfg_index();
   wr_data = {16'd0,o_ru_cfg.long_prach2_cfg_index};
   ral_blk.long_prach2_cfg_index.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH2 CFG INDEX Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach2_cfg_index

task o_ru_reg::deploy_long_prach2_nco_offset();
   wr_data = {o_ru_cfg.long_prach2_nco_offset};
   ral_blk.long_prach2_nco_offset.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH2 NCO OFFSET Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach2_nco_offset

task o_ru_reg::deploy_long_prach2_gain_real();
   wr_data = {o_ru_cfg.long_prach2_gain_real};
   ral_blk.long_prach2_gain_real.write(status,wr_data);
   `uvm_info("DBG", $psprintf("LONG PRACH2 GAIN REAL Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_long_prach2_gain_real


task o_ru_reg::deploy_pwr_mtr_control_reg_ifft_l1();
   wr_data = {o_ru_cfg.control_reset,21'd0,o_ru_cfg.UL_pwr_en,o_ru_cfg.DL_pwr_en,o_ru_cfg.IRQ_Enable,o_ru_cfg.StartnStop,o_ru_cfg.mode};
   ral_blk.pwr_mtr_control_reg.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PWR MTR CONTROL REG Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_pwr_mtr_control_reg_ifft_l1

task o_ru_reg::deploy_pwr_mtr_compute_time_ifft_l1();
   wr_data = {o_ru_cfg.comp_time};
   ral_blk.pwr_mtr_compute_time.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PWR MTR COMPUTE TIME Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_pwr_mtr_compute_time_ifft_l1

task o_ru_reg::deploy_pwr_mtr_intr_mask_reg_ifft_l1();
   wr_data = {30'd0,o_ru_cfg.data_ready,o_ru_cfg.Error};
   ral_blk.pwr_mtr_intr_mask_reg.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PWR MTR INTR MASK Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_pwr_mtr_intr_mask_reg_ifft_l1

task o_ru_reg::deploy_pwr_mtr_control_reg_ifft_l2();
   wr_data = {o_ru_cfg.control_reset,21'd0,o_ru_cfg.UL_pwr_en,o_ru_cfg.DL_pwr_en,o_ru_cfg.IRQ_Enable,o_ru_cfg.StartnStop,o_ru_cfg.mode};
   ral_blk.pwr_mtr_control_reg_1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PWR MTR CONTROL REG1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_pwr_mtr_control_reg_ifft_l2

task o_ru_reg::deploy_pwr_mtr_compute_time_ifft_l2();
   wr_data = {o_ru_cfg.comp_time};
   ral_blk.pwr_mtr_compute_time_1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PWR MTR COMPUTE TIME1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_pwr_mtr_compute_time_ifft_l2

task o_ru_reg::deploy_pwr_mtr_intr_mask_reg_ifft_l2();
   wr_data = {30'd0,o_ru_cfg.data_ready,o_ru_cfg.Error};
   ral_blk.pwr_mtr_intr_mask_reg_1.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PWR MTR INTR MASK1 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_pwr_mtr_intr_mask_reg_ifft_l2

task o_ru_reg::deploy_pwr_mtr_control_reg_fft_l1();
   wr_data = {o_ru_cfg.control_reset,21'd0,o_ru_cfg.UL_pwr_en,o_ru_cfg.DL_pwr_en,o_ru_cfg.IRQ_Enable,o_ru_cfg.StartnStop,o_ru_cfg.mode};
   ral_blk.pwr_mtr_control_reg_2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PWR MTR CONTROL REG2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_pwr_mtr_control_reg_fft_l1

task o_ru_reg::deploy_pwr_mtr_compute_time_fft_l1();
   wr_data = {o_ru_cfg.comp_time};
   ral_blk.pwr_mtr_compute_time_2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PWR MTR COMPUTE TIME2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_pwr_mtr_compute_time_fft_l1

task o_ru_reg::deploy_pwr_mtr_intr_mask_reg_fft_l1();
   wr_data = {30'd0,o_ru_cfg.data_ready,o_ru_cfg.Error};
   ral_blk.pwr_mtr_intr_mask_reg_2.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PWR MTR INTR MASK2 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_pwr_mtr_intr_mask_reg_fft_l1

task o_ru_reg::deploy_pwr_mtr_control_reg_fft_l2();
   wr_data = {o_ru_cfg.control_reset,21'd0,o_ru_cfg.UL_pwr_en,o_ru_cfg.DL_pwr_en,o_ru_cfg.IRQ_Enable,o_ru_cfg.StartnStop,o_ru_cfg.mode};
   ral_blk.pwr_mtr_control_reg_3.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PWR MTR CONTROL REG3 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_pwr_mtr_control_reg_fft_l2

task o_ru_reg::deploy_pwr_mtr_compute_time_fft_l2();
   wr_data = {o_ru_cfg.comp_time};
   ral_blk.pwr_mtr_compute_time_3.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PWR MTR COMPUTE TIME3 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_pwr_mtr_compute_time_fft_l2

task o_ru_reg::deploy_pwr_mtr_intr_mask_reg_fft_l2();
   wr_data = {30'd0,o_ru_cfg.data_ready,o_ru_cfg.Error};
   ral_blk.pwr_mtr_intr_mask_reg_3.write(status,wr_data);
   `uvm_info("DBG", $psprintf("PWR MTR INTR MASK3 Register Write value :%h",wr_data), UVM_LOW)
endtask :deploy_pwr_mtr_intr_mask_reg_fft_l2

task o_ru_reg::check_oran_window_registers();

    check_rx_early_high_up()                 ;
    check_rx_early_low_up()                  ;
    check_rx_late_high_up()                  ;
    check_rx_late_low_up()                   ;
    check_rx_on_time_high_up()               ;
    check_rx_on_time_low_up()                ;
    check_rx_total_high_c_u()                ;
    check_tx_total_high_cp()                 ;
    check_tx_total_low_cp()                  ;
    check_tx_total_high_c_u()                ;

endtask :check_oran_window_registers


task o_ru_reg::check_rx_early_high_up();
   exp_val = {o_ru_cfg.rx_early_high_up};
   ral_blk.get_reg_by_name("csr_rx_early_high").predict(exp_val);
   ral_blk.csr_rx_early_high.read(status,value);
   `uvm_info("DBG", $psprintf("ORAN UPLANE_RX_EARLY_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_rx_early_high_up

task o_ru_reg::check_rx_early_low_up();   
   exp_val = {o_ru_cfg.rx_early_low_up};
   ral_blk.get_reg_by_name("csr_rx_early_low").predict(exp_val);
   ral_blk.csr_rx_early_low.read(status,value);
   `uvm_info("DBG", $psprintf("ORAN UPLANE_RX_EARLY_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_rx_early_low_up

task o_ru_reg::check_rx_late_high_up();   
   exp_val = {o_ru_cfg.rx_late_high_up};
   ral_blk.get_reg_by_name("csr_rx_late_high").predict(exp_val);
   ral_blk.csr_rx_late_high.read(status,value);
   `uvm_info("DBG", $psprintf("ORAN UPLANE_RX_LATE_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_rx_late_high_up

task o_ru_reg::check_rx_late_low_up();
   exp_val = {o_ru_cfg.rx_late_low_up};
   ral_blk.get_reg_by_name("csr_rx_late_low").predict(exp_val);
   ral_blk.csr_rx_late_low.read(status,value);
   `uvm_info("DBG", $psprintf("ORAN UPLANE_RX_LATE_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_rx_late_low_up

task o_ru_reg::check_rx_on_time_high_up();   
   exp_val = {o_ru_cfg.rx_on_time_high_up};
   ral_blk.get_reg_by_name("csr_rx_on_time_high").predict(exp_val);
   ral_blk.csr_rx_on_time_high.read(status,value);
   `uvm_info("DBG", $psprintf("ORAN UPLANE_RX_ON_TIME_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_rx_on_time_high_up

task o_ru_reg::check_rx_on_time_low_up(); 
   exp_val = {o_ru_cfg.rx_on_time_low_up};
   ral_blk.get_reg_by_name("csr_rx_on_time_low").predict(exp_val);
   ral_blk.csr_rx_on_time_low.read(status,value);
   `uvm_info("DBG", $psprintf("ORAN UPLANE_RX_ON_TIME_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_rx_on_time_low_up

task o_ru_reg::check_rx_total_high_c_u();
   rd_data = o_ru_cfg.rx_total_high_c_u;
   ral_blk.csr_rx_total_high.read(status,rd_data);
   `uvm_info("DBG", $psprintf("ORAN U_C_RX_TOTAL_MSB Register Read value :%h",rd_data), UVM_LOW)
endtask :check_rx_total_high_c_u

task o_ru_reg::check_rx_total_low_c_u();
   rd_data = o_ru_cfg.rx_total_low_c_u;
   ral_blk.csr_rx_total_low.read(status,rd_data);
   `uvm_info("DBG", $psprintf("ORAN U_C_RX_TOTAL_LSB Register Read value :%h",rd_data), UVM_LOW)
endtask :check_rx_total_low_c_u

task o_ru_reg::check_tx_total_high_cp();
   rd_data = o_ru_cfg.tx_total_high_cp;
   ral_blk.csr_tx_total_c_high.read(status,rd_data);
   `uvm_info("DBG", $psprintf("ORAN CPLANE_TX_TOTAL_MSB Register Read value :%h",rd_data), UVM_LOW)
endtask :check_tx_total_high_cp

task o_ru_reg::check_tx_total_low_cp();
   rd_data = o_ru_cfg.tx_total_low_cp;
   ral_blk.csr_tx_total_c_low.read(status,rd_data);
   `uvm_info("DBG", $psprintf("ORAN CPLANE_TX_TOTAL_LSB Register Read value :%h",rd_data), UVM_LOW)
endtask :check_tx_total_low_cp

task o_ru_reg::check_tx_total_high_c_u();
   rd_data = o_ru_cfg.tx_total_high_c_u;
   ral_blk.csr_tx_total_high.read(status,rd_data);
   `uvm_info("DBG", $psprintf("ORAN U_C_TX_TOTAL_MSB Register Read value :%h",rd_data), UVM_LOW)
endtask :check_tx_total_high_c_u

task o_ru_reg::check_tx_total_low_c_u();
   rd_data = o_ru_cfg.tx_total_low_c_u;
   ral_blk.csr_tx_total_low.read(status,rd_data);
   `uvm_info("DBG", $psprintf("ORAN U_C_TX_TOTAL_LSB Register Read value :%h",rd_data), UVM_LOW)
endtask :check_tx_total_low_c_u



// ORAN register read
task o_ru_reg::check_oran_registers();

    check_oran_func_mode()    ;
    check_oran_udcomp_hdr()   ;

endtask :check_oran_registers



task o_ru_reg::check_oran_func_mode();
   exp_val = {16'd0,o_ru_cfg.mtu_size,1'd0,o_ru_cfg.func_mode};
   ral_blk.get_reg_by_name("csr_functional_mode").predict(exp_val);
   ral_blk.csr_functional_mode.read(status,value);
   `uvm_info("DBG", $psprintf("FUNCTIONAL_MODE: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_oran_func_mode

task o_ru_reg::check_oran_udcomp_hdr();
   exp_val = {o_ru_cfg.ud_comp_width};
   ral_blk.get_reg_by_name("csr_static_udcomphdr").predict(exp_val);
   ral_blk.csr_static_udcomphdr.read(status,value);
   `uvm_info("DBG", $psprintf("STATIC_UDCOMPHDR: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_oran_udcomp_hdr

task o_ru_reg::check_oran_t2a_max_cp();
   exp_val = {o_ru_cfg.t1a_max_cp};
   ral_blk.get_reg_by_name("csr_t2a_max_cp_dl").predict(exp_val);
   ral_blk.csr_t2a_max_cp_dl.read(status,value);
   `uvm_info("DBG", $psprintf("CPLANE_T1A_MAX_CP: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_oran_t2a_max_cp

task o_ru_reg::check_oran_t2a_min_cp();
   exp_val = {o_ru_cfg.t1a_min_cp};
   ral_blk.get_reg_by_name("csr_t2a_min_cp_dl").predict(exp_val);
   ral_blk.csr_t2a_min_cp_dl.read(status,value);
   `uvm_info("DBG", $psprintf("CPLANE_T1A_MIN_CP: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_oran_t2a_min_cp

task o_ru_reg::check_oran_t2a_max_up();
   exp_val = {o_ru_cfg.t2a_max_up};
   ral_blk.get_reg_by_name("csr_t2a_max_up").predict(exp_val);
   ral_blk.csr_t2a_max_up.read(status,value);
   `uvm_info("DBG", $psprintf("UPLANE_T2A_MAX_UP: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_oran_t2a_max_up

task o_ru_reg::check_oran_t2a_min_up();
   exp_val = {o_ru_cfg.t2a_min_up};
   ral_blk.get_reg_by_name("csr_t2a_min_up").predict(exp_val);
   ral_blk.csr_t2a_min_up.read(status,value);
   `uvm_info("DBG", $psprintf("UPLANE_T2A_MIN_UP: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_oran_t2a_min_up

task o_ru_reg::check_oran_ta3_max_up();
   exp_val = {o_ru_cfg.t3a_max_up};
   ral_blk.get_reg_by_name("csr_ta3_max_up").predict(exp_val);
   ral_blk.csr_ta3_max_up.read(status,value);
   `uvm_info("DBG", $psprintf("UPLANE_TA3_MAX_UP: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_oran_ta3_max_up

task o_ru_reg::check_oran_ta3_min_up();
   exp_val = {o_ru_cfg.t3a_min_up};
   ral_blk.get_reg_by_name("csr_ta3_min_up").predict(exp_val);
   ral_blk.csr_ta3_min_up.read(status,value);
   `uvm_info("DBG", $psprintf("UPLANE_TA3_MIN_UP: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_oran_ta3_min_up

// eCPRI register read
task o_ru_reg::check_ecpri_registers();

    check_ecpri_source_lsb()    ;
    check_ecpri_source_msb()    ;
    check_ecpri_dest_lsb()      ;
    check_ecpri_dest_msb()      ;

endtask :check_ecpri_registers



task o_ru_reg::check_ecpri_source_lsb();
   exp_val = {o_ru_cfg.source_mac_lsb};
   ral_blk.get_reg_by_name("source_mac_addr0_0").predict(exp_val);
   ral_blk.source_mac_addr0_0.read(status,value);
   `uvm_info("DBG", $psprintf("SOURCE_MAC_ADDRESS_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ecpri_source_lsb

task o_ru_reg::check_ecpri_source_msb();
   exp_val = {o_ru_cfg.source_mac_msb};
   ral_blk.get_reg_by_name("source_mac_addr0_1").predict(exp_val);
   ral_blk.source_mac_addr0_1.read(status,value);
   `uvm_info("DBG", $psprintf("SOURCE_MAC_ADDRESS_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ecpri_source_msb


task o_ru_reg::check_ecpri_dest_lsb();
   exp_val = {o_ru_cfg.destination_mac_lsb};
   ral_blk.get_reg_by_name("dest_mac_addr0_0").predict(exp_val);
   ral_blk.dest_mac_addr0_0.read(status,value);
   `uvm_info("DBG", $psprintf("DESTINATION_MAC_ADDRESS_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ecpri_dest_lsb

task o_ru_reg::check_ecpri_dest_msb();
   exp_val = {o_ru_cfg.destination_mac_msb};
   ral_blk.get_reg_by_name("dest_mac_addr0_1").predict(exp_val);
   ral_blk.dest_mac_addr0_1.read(status,value);
   `uvm_info("DBG", $psprintf("DESTINATION_MAC_ADDRESS_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ecpri_dest_msb


// LowPHY subsystem register read
task o_ru_reg::check_lowphy_ss_registers();
 
    check_frame_config()             ;
    check_dl_input_config()          ;
    check_ul_input_config()          ;
    check_c_hps()                    ;
    check_hps_config()               ;
    check_long_prach_freq_offset()   ;
    check_hps_valid()                ;
    check_short_prach_freq_offset()  ;
    check_bw_config_cc1()            ;
    check_cc2_config()               ;
    check_cp_length()                ;
    check_fft_size()                 ;
    check_ifft_l1_control()          ;
    check_ifft_l2_control()          ;
    check_fft_l1_control()           ;
    check_fft_l2_control()           ;
    check_ifft_gain_l1()             ;
    check_ifft_shift_l1()            ;
    check_ifft_mux_const_data_l1()   ;
    check_ifft_mux_const_data_l2()   ;
    check_ifft_gain_l2()             ;
    check_ifft_shift_l2()            ;
    check_fft_gain_l1()              ;
    check_fft_shift_l1()             ;
    check_ifft_fft_lpbk_en()         ;
    check_fft_gain_l2()              ;
    check_fft_shift_l2()             ;
    check_long_prach_filt_flush_en() ;
    check_prach_pat_en()             ;
    check_prach_pb_sel()             ;
 
endtask :check_lowphy_ss_registers



task o_ru_reg::check_frame_config();
   exp_val = {o_ru_cfg.frame_config};
   ral_blk.get_reg_by_name("frame_sync_frame_config").predict(exp_val);
   ral_blk.frame_sync_frame_config.read(status,value);
   `uvm_info("DBG", $psprintf("FRAME_CONFIG: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_frame_config

task o_ru_reg::check_dl_input_config();
   exp_val = {o_ru_cfg.dl_input_config};
   ral_blk.get_reg_by_name("dl_input_config").predict(exp_val);
   ral_blk.dl_input_config.read(status,value);
   `uvm_info("DBG", $psprintf("DL_INPUT_CONFIG: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_dl_input_config

task o_ru_reg::check_ul_input_config();
   exp_val = {o_ru_cfg.ul_input_config};
   ral_blk.get_reg_by_name("ul_input_config").predict(exp_val);
   ral_blk.ul_input_config.read(status,value);
   `uvm_info("DBG", $psprintf("UL_INPUT_CONFIG: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ul_input_config

task o_ru_reg::check_c_hps();
   exp_val = {o_ru_cfg.c_hps};
   ral_blk.get_reg_by_name("c_hps").predict(exp_val);
   ral_blk.c_hps.read(status,value);
   `uvm_info("DBG", $psprintf("C_HPS: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_c_hps

task o_ru_reg::check_hps_config();
   exp_val = {24'd0, o_ru_cfg.frame_structure};
   ral_blk.get_reg_by_name("hps_config").predict(exp_val);
   ral_blk.hps_config.read(status,value);
   `uvm_info("DBG", $psprintf("HPS_CONFIG: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_hps_config

task o_ru_reg::check_long_prach_freq_offset();
   exp_val = {8'd0, o_ru_cfg.long_prach_freq_offset};
   ral_blk.get_reg_by_name("long_prach_freq_offset").predict(exp_val);
   ral_blk.long_prach_freq_offset.read(status,value);
   `uvm_info("DBG", $psprintf("LONG_PRACH_FREQ_OFFSET: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_long_prach_freq_offset

task o_ru_reg::check_hps_valid();
   exp_val = {24'd0, o_ru_cfg.hps_valid};
   ral_blk.get_reg_by_name("hps_valid").predict(exp_val);
   ral_blk.hps_valid.read(status,value);
   `uvm_info("DBG", $psprintf("HPS_VALID: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_hps_valid

task o_ru_reg::check_short_prach_freq_offset();
   exp_val = {8'd0, o_ru_cfg.short_prach_freq_offset};
   ral_blk.get_reg_by_name("short_prach_freq_offset").predict(exp_val);
   ral_blk.short_prach_freq_offset.read(status,value);
   `uvm_info("DBG", $psprintf("SHORT_PRACH_FREQ_OFFSET: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_short_prach_freq_offset

task o_ru_reg::check_bw_config_cc1();
   exp_val = {24'd0,o_ru_cfg.cc1_dis,o_ru_cfg.cc1_bw};
   ral_blk.get_reg_by_name("bw_config_cc1").predict(exp_val);
   ral_blk.bw_config_cc1.read(status,value);
   `uvm_info("DBG", $psprintf("CC1_CONFIG: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_bw_config_cc1

task o_ru_reg::check_cc2_config();
   exp_val = {24'd0,o_ru_cfg.cc2_dis,o_ru_cfg.cc2_bw};
   ral_blk.get_reg_by_name("bw_config_cc2").predict(exp_val);
   ral_blk.bw_config_cc2.read(status,value);
   `uvm_info("DBG", $psprintf("CC2_CONFIG: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_cc2_config


// oRAN subsystem register read
task o_ru_reg::check_oran_ss_registers();

    check_dl_eaxc_config_reg()    ;
    check_ul_eaxc_config_reg()    ;
    check_decomp_fs_offset()      ; 
    check_comp_fs_offset()        ;
 
endtask :check_oran_ss_registers


task o_ru_reg::check_ecpri_ip_version();
   exp_val = {o_ru_cfg.ecpri_ip_version};
   ral_blk.get_reg_by_name("ecpri_version").predict(exp_val);
   ral_blk.ecpri_version.read(status,value);
   `uvm_info("DBG", $psprintf("ECPRI_VERSION: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ecpri_ip_version

task o_ru_reg::check_oran_ip_version();
   exp_val = {o_ru_cfg.oran_ip_version};
   ral_blk.get_reg_by_name("oran_ip_version").predict(exp_val);
   ral_blk.oran_ip_version.read(status,value);
   `uvm_info("DBG", $psprintf("ORAN_IP_VERSION: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_oran_ip_version

task o_ru_reg::check_fh_comp_ip_version();
   exp_val = {o_ru_cfg.fh_comp_ip_version};
   ral_blk.get_reg_by_name("fh_comp_ip_version").predict(exp_val);
   ral_blk.fh_comp_ip_version.read(status,value);
   `uvm_info("DBG", $psprintf("FH_COMP_IP_VERSION: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fh_comp_ip_version

task o_ru_reg::check_coupling_ip_version();
   exp_val = {o_ru_cfg.coupling_version};
   ral_blk.get_reg_by_name("coupling_version").predict(exp_val);
   ral_blk.coupling_version.read(status,value);
   `uvm_info("DBG", $psprintf("COUPLING_VERSION: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_coupling_ip_version

task o_ru_reg::check_decomp_fs_offset();
   exp_val = {16'd0,o_ru_cfg.fs_offset};
   ral_blk.get_reg_by_name("decomp_fsoffset").predict(exp_val);
   ral_blk.decomp_fsoffset.read(status,value);
   `uvm_info("DBG", $psprintf("DECOMP FS OFFSET: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_decomp_fs_offset

task o_ru_reg::check_comp_fs_offset();
   exp_val = {16'd0,o_ru_cfg.fs_offset};
   ral_blk.get_reg_by_name("comp_fsoffset").predict(exp_val);
   ral_blk.comp_fsoffset.read(status,value);
   `uvm_info("DBG", $psprintf("COMP FS OFFSET: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_comp_fs_offset

task o_ru_reg::check_dl_eaxc_config_reg();

   exp_val = {16'd0,o_ru_cfg.dl_mac_axc[0]};
   ral_blk.get_reg_by_name("dl_eaxc_id0").predict(exp_val);
   ral_blk.dl_eaxc_id0.read(status,value);
   `uvm_info("DBG", $psprintf("DL_EAXC_ID0: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.dl_mac_axc[1]};
   ral_blk.get_reg_by_name("dl_eaxc_id1").predict(exp_val);
   ral_blk.dl_eaxc_id1.read(status,value);
   `uvm_info("DBG", $psprintf("DL_EAXC_ID1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.dl_mac_axc[2]};
   ral_blk.get_reg_by_name("dl_eaxc_id2").predict(exp_val);
   ral_blk.dl_eaxc_id2.read(status,value);
   `uvm_info("DBG", $psprintf("DL_EAXC_ID2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
 
   exp_val = {16'd0,o_ru_cfg.dl_mac_axc[3]};
   ral_blk.get_reg_by_name("dl_eaxc_id3").predict(exp_val);
   ral_blk.dl_eaxc_id3.read(status,value);
   `uvm_info("DBG", $psprintf("DL_EAXC_ID3: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.dl_mac_axc[4]};
   ral_blk.get_reg_by_name("dl_eaxc_id4").predict(exp_val);
   ral_blk.dl_eaxc_id4.read(status,value);
   `uvm_info("DBG", $psprintf("DL_EAXC_ID4: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.dl_mac_axc[5]};
   ral_blk.get_reg_by_name("dl_eaxc_id5").predict(exp_val);
   ral_blk.dl_eaxc_id5.read(status,value);
   `uvm_info("DBG", $psprintf("DL_EAXC_ID5: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.dl_mac_axc[6]};
   ral_blk.get_reg_by_name("dl_eaxc_id6").predict(exp_val);
   ral_blk.dl_eaxc_id6.read(status,value);
   `uvm_info("DBG", $psprintf("DL_EAXC_ID6: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.dl_mac_axc[7]};
   ral_blk.get_reg_by_name("dl_eaxc_id7").predict(exp_val);
   ral_blk.dl_eaxc_id7.read(status,value);
   `uvm_info("DBG", $psprintf("DL_EAXC_ID7: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

endtask :check_dl_eaxc_config_reg

task o_ru_reg::check_ul_eaxc_config_reg();

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[0]};
   ral_blk.get_reg_by_name("ul_eaxc_id0").predict(exp_val);
   ral_blk.ul_eaxc_id0.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID0: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[1]};
   ral_blk.get_reg_by_name("ul_eaxc_id1").predict(exp_val);
   ral_blk.ul_eaxc_id1.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[2]};
   ral_blk.get_reg_by_name("ul_eaxc_id2").predict(exp_val);
   ral_blk.ul_eaxc_id2.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[3]};
   ral_blk.get_reg_by_name("ul_eaxc_id3").predict(exp_val);
   ral_blk.ul_eaxc_id3.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID3: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[4]};
   ral_blk.get_reg_by_name("ul_eaxc_id4").predict(exp_val);
   ral_blk.ul_eaxc_id4.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID4: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[5]};
   ral_blk.get_reg_by_name("ul_eaxc_id5").predict(exp_val);
   ral_blk.ul_eaxc_id5.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID5: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[6]};
   ral_blk.get_reg_by_name("ul_eaxc_id6").predict(exp_val);
   ral_blk.ul_eaxc_id6.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID6: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[7]};
   ral_blk.get_reg_by_name("ul_eaxc_id7").predict(exp_val);
   ral_blk.ul_eaxc_id7.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID7: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[8]};
   ral_blk.get_reg_by_name("ul_eaxc_id8").predict(exp_val);
   ral_blk.ul_eaxc_id8.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID8: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[9]};
   ral_blk.get_reg_by_name("ul_eaxc_id9").predict(exp_val);
   ral_blk.ul_eaxc_id9.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID9: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[10]};
   ral_blk.get_reg_by_name("ul_eaxc_id10").predict(exp_val);
   ral_blk.ul_eaxc_id10.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID10: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[11]};
   ral_blk.get_reg_by_name("ul_eaxc_id11").predict(exp_val);
   ral_blk.ul_eaxc_id11.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID11: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[12]};
   ral_blk.get_reg_by_name("ul_eaxc_id12").predict(exp_val);
   ral_blk.ul_eaxc_id12.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID12: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[13]};
   ral_blk.get_reg_by_name("ul_eaxc_id13").predict(exp_val);
   ral_blk.ul_eaxc_id13.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID13: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[14]};
   ral_blk.get_reg_by_name("ul_eaxc_id14").predict(exp_val);
   ral_blk.ul_eaxc_id14.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID14: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

   exp_val = {16'd0,o_ru_cfg.ul_mac_axc[15]};
   ral_blk.get_reg_by_name("ul_eaxc_id15").predict(exp_val);
   ral_blk.ul_eaxc_id15.read(status,value);
   `uvm_info("DBG", $psprintf("UL_EAXC_ID15: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)

endtask :check_ul_eaxc_config_reg

task o_ru_reg::check_cp_length();
   exp_val = {21'd0,o_ru_cfg.cp_length};
   ral_blk.get_reg_by_name("cp_length").predict(exp_val);
   ral_blk.cp_length.read(status,value);
   `uvm_info("DBG", $psprintf("CP_LENGTH: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_cp_length

task o_ru_reg::check_fft_size();
   exp_val = {28'd0,o_ru_cfg.fft_size};
   ral_blk.get_reg_by_name("fft_size").predict(exp_val);
   ral_blk.fft_size.read(status,value);
   `uvm_info("DBG", $psprintf("FFT_SIZE: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft_size

task o_ru_reg::check_ifft_l1_control();
   exp_val = {29'd0,o_ru_cfg.ifft_rc_en_l1,o_ru_cfg.ifft_dc_sc_en_l1,o_ru_cfg.mux_select_l1};
   ral_blk.get_reg_by_name("ifft_l1_control").predict(exp_val);
   ral_blk.ifft_l1_control.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT_L1_CONTROL: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft_l1_control

task o_ru_reg::check_ifft_l2_control();
   exp_val = {29'd0,o_ru_cfg.ifft_rc_en_l2,o_ru_cfg.ifft_dc_sc_en_l2,o_ru_cfg.mux_select_l2};
   ral_blk.get_reg_by_name("ifft_l2_control").predict(exp_val);
   ral_blk.ifft_l2_control.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT_L2_CONTROL: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft_l2_control

task o_ru_reg::check_fft_l1_control();
   exp_val = {29'd0,o_ru_cfg.fft_rc_en_l1,o_ru_cfg.ul_hcs_bypass_l2,o_ru_cfg.fft_dc_sc_en_l1};
   ral_blk.get_reg_by_name("fft_l1_control").predict(exp_val);
   ral_blk.fft_l1_control.read(status,value);
   `uvm_info("DBG", $psprintf("FFT_L1_CONTROL: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft_l1_control

task o_ru_reg::check_fft_l2_control();
   exp_val = {29'd0,o_ru_cfg.fft_rc_en_l2,o_ru_cfg.ul_hcs_bypass_l2,o_ru_cfg.fft_dc_sc_en_l2};
   ral_blk.get_reg_by_name("fft_l2_control").predict(exp_val);
   ral_blk.fft_l2_control.read(status,value);
   `uvm_info("DBG", $psprintf("FFT_L2_CONTROL: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft_l2_control

task o_ru_reg::check_ifft_gain_l1();
   exp_val = {o_ru_cfg.ifft_gain_l1};
   ral_blk.get_reg_by_name("ifft_gain_l1").predict(exp_val);
   ral_blk.ifft_gain_l1.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT_GAIN_L1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft_gain_l1

task o_ru_reg::check_ifft_shift_l1();
   exp_val = {28'd0,o_ru_cfg.ifft_shift_l1};
   ral_blk.get_reg_by_name("ifft_shift_l1").predict(exp_val);
   ral_blk.ifft_shift_l1.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT_SHIFT_L1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft_shift_l1

task o_ru_reg::check_ifft_mux_const_data_l1();
   exp_val = {16'd0,o_ru_cfg.ifft_mux_constant_l1};
   ral_blk.get_reg_by_name("ifft_mux_const_data_l1").predict(exp_val);
   ral_blk.ifft_mux_const_data_l1.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT_MUX_CONST_L1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft_mux_const_data_l1

task o_ru_reg::check_ifft_mux_const_data_l2();
   exp_val = {16'd0,o_ru_cfg.ifft_mux_constant_l2};
   ral_blk.get_reg_by_name("ifft_mux_const_data_l2").predict(exp_val);
   ral_blk.ifft_mux_const_data_l2.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT_MUX_CONST_L2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft_mux_const_data_l2


task o_ru_reg::check_ifft_gain_l2();
   exp_val = {o_ru_cfg.ifft_gain_l2};
   ral_blk.get_reg_by_name("ifft_gain_l2").predict(exp_val);
   ral_blk.ifft_gain_l2.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT_GAIN_L2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft_gain_l2

task o_ru_reg::check_ifft_shift_l2();
   exp_val = {28'd0,o_ru_cfg.ifft_shift_l2};
   ral_blk.get_reg_by_name("ifft_shift_l2").predict(exp_val);
   ral_blk.ifft_shift_l2.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT_SHIFT_L2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft_shift_l2


task o_ru_reg::check_fft_gain_l1();
   exp_val = {o_ru_cfg.fft_gain_l1};
   ral_blk.get_reg_by_name("fft_gain_l1").predict(exp_val);
   ral_blk.fft_gain_l1.read(status,value);
   `uvm_info("DBG", $psprintf("FFT_GAIN_L1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft_gain_l1

task o_ru_reg::check_fft_shift_l1();
   exp_val = {28'd0,o_ru_cfg.fft_shift_l1};
   ral_blk.get_reg_by_name("fft_shift_l1").predict(exp_val);
   ral_blk.fft_shift_l1.read(status,value);
   `uvm_info("DBG", $psprintf("FFT_SHIFT_L1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft_shift_l1

task o_ru_reg::check_ifft_fft_lpbk_en();
   exp_val = {30'd0,o_ru_cfg.fdv_lpbk_en,o_ru_cfg.ifft_fft_lpbk_en};
   ral_blk.get_reg_by_name("lpbk_en").predict(exp_val);
   ral_blk.lpbk_en.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT_FFT_LPBK_EN: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft_fft_lpbk_en

task o_ru_reg::check_fft_gain_l2();
   exp_val = {o_ru_cfg.fft_gain_l2};
   ral_blk.get_reg_by_name("fft_gain_l2").predict(exp_val);
   ral_blk.fft_gain_l2.read(status,value);
   `uvm_info("DBG", $psprintf("FFT_GAIN_L2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft_gain_l2

task o_ru_reg::check_fft_shift_l2();
   exp_val = {28'd0,o_ru_cfg.fft_shift_l2};
   ral_blk.get_reg_by_name("fft_shift_l2").predict(exp_val);
   ral_blk.fft_shift_l2.read(status,value);
   `uvm_info("DBG", $psprintf("FFT_SHIFT_L2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft_shift_l2

task o_ru_reg::check_long_prach_version();
   exp_val = {o_ru_cfg.long_prach_version};
   ral_blk.get_reg_by_name("long_prach_version").predict(exp_val);
   ral_blk.long_prach_version.read(status,value);
   `uvm_info("DBG", $psprintf("LONG_PRACH_VERSION: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_long_prach_version

task o_ru_reg::check_long_prach_filt_flush_en();
   exp_val = {30'd0,o_ru_cfg.lprach2_filt_flush_en,o_ru_cfg.lprach1_filt_flush_en};
   ral_blk.get_reg_by_name("long_prach_filt_flush_en").predict(exp_val);
   ral_blk.long_prach_filt_flush_en.read(status,value);
   `uvm_info("DBG", $psprintf("DIG_POW_SCALE_VAL_L2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_long_prach_filt_flush_en

task o_ru_reg::check_prach_pat_en();
   exp_val = {31'd0,o_ru_cfg.prach_pat_en};
   ral_blk.get_reg_by_name("prach_pat_en").predict(exp_val);
   ral_blk.prach_pat_en.read(status,value);
   `uvm_info("DBG", $psprintf("PRACH_PAT_EN: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_prach_pat_en

task o_ru_reg::check_prach_pb_sel();
   exp_val = {31'd0,o_ru_cfg.prach_pb_sel};
   ral_blk.get_reg_by_name("prach_pb_sel").predict(exp_val);
   ral_blk.prach_pb_sel.read(status,value);
   `uvm_info("DBG", $psprintf("PRACH_PB_SEL: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_prach_pb_sel



task o_ru_reg::check_intr_clr();
   exp_val = 3;
   ral_blk.get_reg_by_name("intr_clear").predict(exp_val);
   ral_blk.intr_clear.read(status,value);
   `uvm_info("DBG", $psprintf("INTR_CLR: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_intr_clr

task o_ru_reg::check_intr_idle_ms();
   exp_val = 1;
   ral_blk.get_reg_by_name("intr_idle_ms").predict(exp_val);
   ral_blk.intr_idle_ms.read(status,value);
   `uvm_info("DBG", $psprintf("INTR_IDLE_MS: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_intr_idle_ms


// IFFT L1 register read
task o_ru_reg::check_ifft_l1_registers();

    check_ifft1_F1_reg_lsb()      ;
    check_ifft1_F1_reg_msb()      ;
    check_phase_comp_en1()        ;
    check_ifft1_Phase_Gen_Reg()   ;

endtask :check_ifft_l1_registers



task o_ru_reg::check_ifft1_F1_reg_lsb();
   exp_val = {o_ru_cfg.ifft1_F1_reg_lsb};
   ral_blk.get_reg_by_name("ifft1_F1_reg_lsb").predict(exp_val);
   ral_blk.ifft1_F1_reg_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT1_F1_REG_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft1_F1_reg_lsb

task o_ru_reg::check_ifft1_F1_reg_msb();
   exp_val = {o_ru_cfg.ifft1_F1_reg_msb};
   ral_blk.get_reg_by_name("ifft1_F1_reg_msb").predict(exp_val);
   ral_blk.ifft1_F1_reg_msb.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT1_F1_REG_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft1_F1_reg_msb

task o_ru_reg::check_phase_comp_en1();
   exp_val = {31'd0,o_ru_cfg.phase_comp_en1};
   ral_blk.get_reg_by_name("ifft1_Enable_reg").predict(exp_val);
   ral_blk.ifft1_Enable_reg.read(status,value);
   `uvm_info("DBG", $psprintf("PHASE_COMP_EN1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_phase_comp_en1

task o_ru_reg::check_ifft1_Phase_Gen_Reg();
   exp_val = {31'd0,o_ru_cfg.ifft1_Phase_Gen_Reg};
   ral_blk.get_reg_by_name("ifft1_PhaseGen_reg").predict(exp_val);
   ral_blk.ifft1_PhaseGen_reg.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT1_PHASE_GEN_REG: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft1_Phase_Gen_Reg

task o_ru_reg::check_ifft1_version();
   exp_val = {o_ru_cfg.ifft1_version};
   ral_blk.get_reg_by_name("ifft1_version").predict(exp_val);
   ral_blk.ifft1_version.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT1_VERSION: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft1_version



// IFFT L2 register read
task o_ru_reg::check_ifft_l2_registers();

    check_ifft2_F1_reg()          ;
    check_phase_comp_en2()        ;
    check_ifft2_Phase_Gen_Reg()   ;

endtask :check_ifft_l2_registers


task o_ru_reg::check_ifft2_F1_reg();
   exp_val = {o_ru_cfg.ifft2_F1_reg};
   ral_blk.get_reg_by_name("ifft2_F1_reg").predict(exp_val);
   ral_blk.ifft2_F1_reg.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT2_F1_REG: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft2_F1_reg

task o_ru_reg::check_phase_comp_en2();
   exp_val = {31'd0,o_ru_cfg.phase_comp_en2};
   ral_blk.get_reg_by_name("ifft2_Enable_reg").predict(exp_val);
   ral_blk.ifft2_Enable_reg.read(status,value);
   `uvm_info("DBG", $psprintf("PHASE_COMP_EN2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_phase_comp_en2

task o_ru_reg::check_ifft2_Phase_Gen_Reg();
   exp_val = {31'd0,o_ru_cfg.ifft2_Phase_Gen_Reg};
   ral_blk.get_reg_by_name("ifft2_PhaseGen_reg").predict(exp_val);
   ral_blk.ifft2_PhaseGen_reg.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT2_PHASE_GEN_REG: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft2_Phase_Gen_Reg

task o_ru_reg::check_ifft2_version();
   exp_val = {o_ru_cfg.ifft2_version};
   ral_blk.get_reg_by_name("ifft2_version").predict(exp_val);
   ral_blk.ifft2_version.read(status,value);
   `uvm_info("DBG", $psprintf("IFFT2_VERSION: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ifft2_version


// FFT L1 register read
task o_ru_reg::check_fft_l1_registers();

    check_fft1_F1_reg_lsb()     ;
    check_fft1_F1_reg_msb()     ;
    check_fft1_Enable_reg1()    ;
    check_fft1_Phase_Gen_Reg()  ;

endtask :check_fft_l1_registers



task o_ru_reg::check_fft1_F1_reg_lsb();
   exp_val = {o_ru_cfg.fft1_F1_reg_lsb};
   ral_blk.get_reg_by_name("fft1_F1_reg_lsb").predict(exp_val);
   ral_blk.fft1_F1_reg_lsb.read(status,value);
   `uvm_info("DBG", $psprintf(" FFT1_F1_REG_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft1_F1_reg_lsb

task o_ru_reg::check_fft1_F1_reg_msb();
   exp_val = {o_ru_cfg.fft1_F1_reg_msb};
   ral_blk.get_reg_by_name("fft1_F1_reg_msb").predict(exp_val);
   ral_blk.fft1_F1_reg_msb.read(status,value);
   `uvm_info("DBG", $psprintf(" FFT1_F1_REG_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft1_F1_reg_msb

task o_ru_reg::check_fft1_Enable_reg1();
   exp_val = {31'd0,o_ru_cfg.fft1_Enable_reg1};
   ral_blk.get_reg_by_name("fft1_Enable_reg").predict(exp_val);
   ral_blk.fft1_Enable_reg.read(status,value);
   `uvm_info("DBG", $psprintf("FFT1_ENABLE_REG1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft1_Enable_reg1

task o_ru_reg::check_fft1_Phase_Gen_Reg();
   exp_val = {31'd0,o_ru_cfg.fft1_Phase_Gen_Reg};
   ral_blk.get_reg_by_name("fft1_PhaseGen_reg").predict(exp_val);
   ral_blk.fft1_PhaseGen_reg.read(status,value);
   `uvm_info("DBG", $psprintf("FFT1_PHASE_GEN_REG: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft1_Phase_Gen_Reg

task o_ru_reg::check_fft1_version();
   exp_val = {o_ru_cfg.fft1_version};
   ral_blk.get_reg_by_name("fft1_version").predict(exp_val);
   ral_blk.fft1_version.read(status,value);
   `uvm_info("DBG", $psprintf("FFT1_VERSION: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft1_version



// FFT L2 register read
task o_ru_reg:: check_fft_l2_registers();

    check_fft2_F1_reg()          ;
    check_fft2_Enable_reg1()     ;
    check_fft2_Phase_Gen_Reg()   ;

endtask :check_fft_l2_registers


task o_ru_reg::check_fft2_F1_reg();
   exp_val = {o_ru_cfg.fft2_F1_reg};
   ral_blk.get_reg_by_name("fft2_F1_reg").predict(exp_val);
   ral_blk.fft2_F1_reg.read(status,value);
   `uvm_info("DBG", $psprintf("FFT2_F1_REG: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft2_F1_reg

task o_ru_reg::check_fft2_Enable_reg1();
   exp_val = {31'd0,o_ru_cfg.fft2_Enable_reg1};
   ral_blk.get_reg_by_name("fft2_Enable_reg").predict(exp_val);
   ral_blk.fft2_Enable_reg.read(status,value);
   `uvm_info("DBG", $psprintf("FFT2_ENABLE_REG1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft2_Enable_reg1

task o_ru_reg::check_fft2_Phase_Gen_Reg();
   exp_val = {31'd0,o_ru_cfg.fft2_Phase_Gen_Reg};
   ral_blk.get_reg_by_name("fft2_PhaseGen_reg").predict(exp_val);
   ral_blk.fft2_PhaseGen_reg.read(status,value);
   `uvm_info("DBG", $psprintf("FFT2_PHASE_GEN_REG: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft2_Phase_Gen_Reg

task o_ru_reg::check_fft2_version();
   exp_val = {o_ru_cfg.fft2_version};
   ral_blk.get_reg_by_name("fft2_version").predict(exp_val);
   ral_blk.fft2_version.read(status,value);
   `uvm_info("DBG", $psprintf("FFT2_VERSION: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fft2_version



// Short PRACH L1 register read
task o_ru_reg::check_short_prach_l1_registers();

    check_prach1_cfg_index()       ;
    check_prach1_cfg_time_index()  ;
    check_n_prach1_slot()          ;
    check_active_prach1_slot()     ;
    check_prach1_freq_idx()        ;

endtask :check_short_prach_l1_registers



task o_ru_reg::check_prach1_cfg_index();
   exp_val = {24'd0,o_ru_cfg.prach1_cfg_index};
   ral_blk.get_reg_by_name("short_Prach1_cfg_index").predict(exp_val);
   ral_blk.short_Prach1_cfg_index.read(status,value);
   `uvm_info("DBG", $psprintf("SHORT PRACH1_CFG_INDEX: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_prach1_cfg_index

task o_ru_reg::check_prach1_cfg_time_index();
   exp_val = {o_ru_cfg.prach1_cfg_time_index};
   ral_blk.get_reg_by_name("short_Prach1_cfg_time_index").predict(exp_val);
   ral_blk.short_Prach1_cfg_time_index.read(status,value);
   `uvm_info("DBG", $psprintf("SHORT PRACH1_CFG_TIME_INDEX: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_prach1_cfg_time_index

task o_ru_reg::check_n_prach1_slot();
   exp_val = {o_ru_cfg.n_prach1_slot};
   ral_blk.get_reg_by_name("n_short_prach1_slot").predict(exp_val);
   ral_blk.n_short_prach1_slot.read(status,value);
   `uvm_info("DBG", $psprintf("SHORT N_PRACH1_SLOT: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_n_prach1_slot

task o_ru_reg::check_active_prach1_slot();
   exp_val = {o_ru_cfg.active_prach1_slot};
   ral_blk.get_reg_by_name("active_short_prach1_slot").predict(exp_val);
   ral_blk.active_short_prach1_slot.read(status,value);
   `uvm_info("DBG", $psprintf("SHORT ACTIVE_PRACH1_SLOT: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_active_prach1_slot

task o_ru_reg::check_prach1_freq_idx();
   exp_val = {o_ru_cfg.prach1_freq_idx};
   ral_blk.get_reg_by_name("short_prach1_freq_idx").predict(exp_val);
   ral_blk.short_prach1_freq_idx.read(status,value);
   `uvm_info("DBG", $psprintf("SHORT PRACH1_FREQ_IDX: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_prach1_freq_idx



// Short PRACH L2 register read
task o_ru_reg::check_short_prach_l2_registers();

    check_prach2_cfg_index()       ;
    check_prach2_cfg_time_index()  ;
    check_n_prach2_slot()          ;
    check_active_prach2_slot()     ;
    check_prach2_freq_idx()        ;

endtask :check_short_prach_l2_registers



task o_ru_reg::check_prach2_cfg_index();
   exp_val = {24'd0,o_ru_cfg.prach2_cfg_index};
   ral_blk.get_reg_by_name("short_Prach2_cfg_index").predict(exp_val);
   ral_blk.short_Prach2_cfg_index.read(status,value);
   `uvm_info("DBG", $psprintf("SHORT PRACH2_CFG_INDEX: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_prach2_cfg_index

task o_ru_reg::check_prach2_cfg_time_index();
   exp_val = {o_ru_cfg.prach2_cfg_time_index};
   ral_blk.get_reg_by_name("short_Prach2_cfg_time_index").predict(exp_val);
   ral_blk.short_Prach2_cfg_time_index.read(status,value);
   `uvm_info("DBG", $psprintf("SHORT PRACH2_CFG_TIME_INDEX: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_prach2_cfg_time_index

task o_ru_reg::check_n_prach2_slot();
   exp_val = {o_ru_cfg.n_prach2_slot};
   ral_blk.get_reg_by_name("n_short_prach2_slot").predict(exp_val);
   ral_blk.n_short_prach2_slot.read(status,value);
   `uvm_info("DBG", $psprintf("SHORT N_PRACH2_SLOT: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_n_prach2_slot

task o_ru_reg::check_active_prach2_slot();
   exp_val = {o_ru_cfg.active_prach2_slot};
   ral_blk.get_reg_by_name("active_short_prach2_slot").predict(exp_val);
   ral_blk.active_short_prach2_slot.read(status,value);
   `uvm_info("DBG", $psprintf("SHORT ACTIVE_PRACH2_SLOT: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_active_prach2_slot

task o_ru_reg::check_prach2_freq_idx();
   exp_val = {o_ru_cfg.prach2_freq_idx};
   ral_blk.get_reg_by_name("short_prach2_freq_idx").predict(exp_val);
   ral_blk.short_prach2_freq_idx.read(status,value);
   `uvm_info("DBG", $psprintf("SHORT PRACH2_FREQ_IDX: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_prach2_freq_idx



// CA_INTERP register read
task o_ru_reg::check_ca_interp_registers();

    check_duc_gain_ant1()                ;
    check_duc_gain_ant2()                ;
    check_duc_gain_ant3()                ;
    check_duc_gain_ant4()                ;
    check_duc_hb_bypass_en()             ;
    check_duc_delay_comp_offset_ant1_1() ;
    check_duc_delay_comp_offset_ant2_1() ;
    check_duc_delay_comp_offset_ant3_1() ;
    check_duc_delay_comp_offset_ant4_1() ;
    check_duc_delay_comp_offset_ant1_2() ;
    check_duc_delay_comp_offset_ant2_2() ;
    check_duc_delay_comp_offset_ant3_2() ;
    check_duc_delay_comp_offset_ant4_2() ;

endtask :check_ca_interp_registers


task o_ru_reg::check_duc_gain_ant1();
   exp_val = {16'd0,o_ru_cfg.duc_gain_ant1};
   ral_blk.get_reg_by_name("duc_gain_ant1").predict(exp_val);
   ral_blk.duc_gain_ant1.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_GAIN_ANT1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_gain_ant1

task o_ru_reg::check_duc_gain_ant2();
   exp_val = {16'd0,o_ru_cfg.duc_gain_ant2};
   ral_blk.get_reg_by_name("duc_gain_ant2").predict(exp_val);
   ral_blk.duc_gain_ant2.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_GAIN_ANT2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_gain_ant2

task o_ru_reg::check_duc_gain_ant3();
   exp_val = {16'd0,o_ru_cfg.duc_gain_ant3};
   ral_blk.get_reg_by_name("duc_gain_ant3").predict(exp_val);
   ral_blk.duc_gain_ant3.read(status,value);
   `uvm_info("DBG", $psprintf("PASSED: DUC_GAIN_ANT3: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_gain_ant3

task o_ru_reg::check_duc_gain_ant4();
   exp_val = {16'd0,o_ru_cfg.duc_gain_ant4};
   ral_blk.get_reg_by_name("duc_gain_ant4").predict(exp_val);
   ral_blk.duc_gain_ant4.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_GAIN_ANT4: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_gain_ant4

task o_ru_reg::check_duc_hb_bypass_en();
   exp_val = {16'd0,o_ru_cfg.duc_hb_bypass_en};
   ral_blk.get_reg_by_name("duc_hb_bypass_en").predict(exp_val);
   ral_blk.duc_hb_bypass_en.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_HB_BYPASS_EN: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_hb_bypass_en

task o_ru_reg::check_duc_delay_comp_offset_ant1_1();
   exp_val = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant1_1};
   ral_blk.get_reg_by_name("duc_delay_comp_offset_ant1_1").predict(exp_val);
   ral_blk.duc_delay_comp_offset_ant1_1.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_DELAY_COMP_OFFSET_ANT1_1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_delay_comp_offset_ant1_1

task o_ru_reg::check_duc_delay_comp_offset_ant2_1();
   exp_val = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant2_1};
   ral_blk.get_reg_by_name("duc_delay_comp_offset_ant2_1").predict(exp_val);
   ral_blk.duc_delay_comp_offset_ant2_1.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_DELAY_COMP_OFFSET_ANT2_1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_delay_comp_offset_ant2_1

task o_ru_reg::check_duc_delay_comp_offset_ant3_1();
   exp_val = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant3_1};
   ral_blk.get_reg_by_name("duc_delay_comp_offset_ant3_1").predict(exp_val);
   ral_blk.duc_delay_comp_offset_ant3_1.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_DELAY_COMP_OFFSET_ANT3_1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_delay_comp_offset_ant3_1

task o_ru_reg::check_duc_delay_comp_offset_ant4_1();
   exp_val = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant4_1};
   ral_blk.get_reg_by_name("duc_delay_comp_offset_ant4_1").predict(exp_val);
   ral_blk.duc_delay_comp_offset_ant4_1.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_DELAY_COMP_OFFSET_ANT4_1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_delay_comp_offset_ant4_1

task o_ru_reg::check_duc_delay_comp_offset_ant1_2();
   exp_val = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant1_2};
   ral_blk.get_reg_by_name("duc_delay_comp_offset_ant1_2").predict(exp_val);
   ral_blk.duc_delay_comp_offset_ant1_2.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_DELAY_COMP_OFFSET_ANT1_2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_delay_comp_offset_ant1_2

task o_ru_reg::check_duc_delay_comp_offset_ant2_2();
   exp_val = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant2_2};
   ral_blk.get_reg_by_name("duc_delay_comp_offset_ant2_2").predict(exp_val);
   ral_blk.duc_delay_comp_offset_ant2_2.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_DELAY_COMP_OFFSET_ANT2_2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_delay_comp_offset_ant2_2

task o_ru_reg::check_duc_delay_comp_offset_ant3_2();
   exp_val = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant3_2};
   ral_blk.get_reg_by_name("duc_delay_comp_offset_ant3_2").predict(exp_val);
   ral_blk.duc_delay_comp_offset_ant3_2.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_DELAY_COMP_OFFSET_ANT3_2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_delay_comp_offset_ant3_2

task o_ru_reg::check_duc_delay_comp_offset_ant4_2();
   exp_val = {24'd0,o_ru_cfg.duc_delay_comp_offset_ant4_2};
   ral_blk.get_reg_by_name("duc_delay_comp_offset_ant4_2").predict(exp_val);
   ral_blk.duc_delay_comp_offset_ant4_2.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_DELAY_COMP_OFFSET_ANT4_2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_delay_comp_offset_ant4_2

task o_ru_reg::check_ca_interp_version();
   exp_val = {o_ru_cfg.ca_interp_version};
   ral_blk.get_reg_by_name("ca_interp_version").predict(exp_val);
   ral_blk.ca_interp_version.read(status,value);
   `uvm_info("DBG", $psprintf("CA_INTERP_VERSION: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ca_interp_version



// DUC Lineup1 register read
task o_ru_reg::check_duc_l1_registers();

    check_duc_nco_l1_ant1_lsb()  ;
    check_duc_nco_l1_ant1_msb()  ;
    check_duc_nco_l1_ant2_lsb()  ;
    check_duc_nco_l1_ant2_msb()  ;
    check_duc_nco_l1_ant3_lsb()  ;
    check_duc_nco_l1_ant3_msb()  ;
    check_duc_nco_l1_ant4_lsb()  ;
    check_duc_nco_l1_ant4_msb()  ;

endtask :check_duc_l1_registers


task o_ru_reg::check_duc_l1_version();
   exp_val = {o_ru_cfg.duc_l1_version};
   ral_blk.get_reg_by_name("duc_l1_version").predict(exp_val);
   ral_blk.duc_l1_version.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_L1_VERSION: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_l1_version

task o_ru_reg::check_duc_nco_l1_ant1_lsb();
   exp_val = {o_ru_cfg.duc_nco_l1_ant1_lsb};
   ral_blk.get_reg_by_name("duc_nco_l1_ant1_lsb").predict(exp_val);
   ral_blk.duc_nco_l1_ant1_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L1_ANT1_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l1_ant1_lsb

task o_ru_reg::check_duc_nco_l1_ant1_msb();
   exp_val = {o_ru_cfg.duc_nco_l1_ant1_msb};
   ral_blk.get_reg_by_name("duc_nco_l1_ant1_msb").predict(exp_val);
   ral_blk.duc_nco_l1_ant1_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L1_ANT1_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l1_ant1_msb

task o_ru_reg::check_duc_nco_l1_ant2_lsb();
   exp_val = {o_ru_cfg.duc_nco_l1_ant2_lsb};
   ral_blk.get_reg_by_name("duc_nco_l1_ant2_lsb").predict(exp_val);
   ral_blk.duc_nco_l1_ant2_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L1_ANT2_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l1_ant2_lsb

task o_ru_reg::check_duc_nco_l1_ant2_msb();
   exp_val = {o_ru_cfg.duc_nco_l1_ant2_msb};
   ral_blk.get_reg_by_name("duc_nco_l1_ant2_msb").predict(exp_val);
   ral_blk.duc_nco_l1_ant2_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L1_ANT2_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l1_ant2_msb

task o_ru_reg::check_duc_nco_l1_ant3_lsb();
   exp_val = {o_ru_cfg.duc_nco_l1_ant3_lsb};
   ral_blk.get_reg_by_name("duc_nco_l1_ant3_lsb").predict(exp_val);
   ral_blk.duc_nco_l1_ant3_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L1_ANT3_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l1_ant3_lsb

task o_ru_reg::check_duc_nco_l1_ant3_msb();
   exp_val = {o_ru_cfg.duc_nco_l1_ant3_msb};
   ral_blk.get_reg_by_name("duc_nco_l1_ant3_msb").predict(exp_val);
   ral_blk.duc_nco_l1_ant3_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L1_ANT3_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l1_ant3_msb

task o_ru_reg::check_duc_nco_l1_ant4_lsb();
   exp_val = {o_ru_cfg.duc_nco_l1_ant4_lsb};
   ral_blk.get_reg_by_name("duc_nco_l1_ant4_lsb").predict(exp_val);
   ral_blk.duc_nco_l1_ant4_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L1_ANT4_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l1_ant4_lsb

task o_ru_reg::check_duc_nco_l1_ant4_msb();
   exp_val = {o_ru_cfg.duc_nco_l1_ant4_msb};
   ral_blk.get_reg_by_name("duc_nco_l1_ant4_msb").predict(exp_val);
   ral_blk.duc_nco_l1_ant4_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L1_ANT4_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l1_ant4_msb



// DUC Lineup2 register read
task o_ru_reg::check_duc_l2_registers();

    check_duc_nco_l2_ant1_lsb()  ;
    check_duc_nco_l2_ant1_msb()  ;
    check_duc_nco_l2_ant2_lsb()  ;
    check_duc_nco_l2_ant2_msb()  ;
    check_duc_nco_l2_ant3_lsb()  ;
    check_duc_nco_l2_ant3_msb()  ;
    check_duc_nco_l2_ant4_lsb()  ;
    check_duc_nco_l2_ant4_msb()  ;

endtask :check_duc_l2_registers


task o_ru_reg::check_duc_l2_version();
   exp_val = {o_ru_cfg.duc_l2_version};
   ral_blk.get_reg_by_name("duc_l2_version").predict(exp_val);
   ral_blk.duc_l2_version.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_L2_VERSION: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_l2_version

task o_ru_reg::check_duc_nco_l2_ant1_lsb();
   exp_val = {o_ru_cfg.duc_nco_l2_ant1_lsb};
   ral_blk.get_reg_by_name("duc_nco_l2_ant1_lsb").predict(exp_val);
   ral_blk.duc_nco_l2_ant1_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L2_ANT1_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l2_ant1_lsb

task o_ru_reg::check_duc_nco_l2_ant1_msb();
   exp_val = {o_ru_cfg.duc_nco_l2_ant1_msb};
   ral_blk.get_reg_by_name("duc_nco_l2_ant1_msb").predict(exp_val);
   ral_blk.duc_nco_l2_ant1_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L2_ANT1_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l2_ant1_msb

task o_ru_reg::check_duc_nco_l2_ant2_lsb();
   exp_val = {o_ru_cfg.duc_nco_l2_ant2_lsb};
   ral_blk.get_reg_by_name("duc_nco_l2_ant2_lsb").predict(exp_val);
   ral_blk.duc_nco_l2_ant2_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L2_ANT2_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l2_ant2_lsb

task o_ru_reg::check_duc_nco_l2_ant2_msb();
   exp_val = {o_ru_cfg.duc_nco_l2_ant2_msb};
   ral_blk.get_reg_by_name("duc_nco_l2_ant2_msb").predict(exp_val);
   ral_blk.duc_nco_l2_ant2_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L2_ANT2_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l2_ant2_msb

task o_ru_reg::check_duc_nco_l2_ant3_lsb();
   exp_val = {o_ru_cfg.duc_nco_l2_ant3_lsb};
   ral_blk.get_reg_by_name("duc_nco_l2_ant3_lsb").predict(exp_val);
   ral_blk.duc_nco_l2_ant3_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L2_ANT3_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l2_ant3_lsb

task o_ru_reg::check_duc_nco_l2_ant3_msb();
   exp_val = {o_ru_cfg.duc_nco_l2_ant3_msb};
   ral_blk.get_reg_by_name("duc_nco_l2_ant3_msb").predict(exp_val);
   ral_blk.duc_nco_l2_ant3_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L2_ANT3_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l2_ant3_msb

task o_ru_reg::check_duc_nco_l2_ant4_lsb();
   exp_val = {o_ru_cfg.duc_nco_l2_ant4_lsb};
   ral_blk.get_reg_by_name("duc_nco_l2_ant4_lsb").predict(exp_val);
   ral_blk.duc_nco_l2_ant4_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L2_ANT4_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l2_ant4_lsb

task o_ru_reg::check_duc_nco_l2_ant4_msb();
   exp_val = {o_ru_cfg.duc_nco_l2_ant4_msb};
   ral_blk.get_reg_by_name("duc_nco_l2_ant4_msb").predict(exp_val);
   ral_blk.duc_nco_l2_ant4_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DUC_NCO_L2_ANT4_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_duc_nco_l2_ant4_msb


// DDC register read
task o_ru_reg::check_dec_dly_comp_registers();

    check_ddc_gain_ant1()                ;
    check_ddc_gain_ant2()                ;
    check_ddc_gain_ant3()                ;
    check_ddc_gain_ant4()                ;
    check_ddc_hb_bypass_en()             ;
    check_ddc_delay_comp_offset_ant1_1() ;
    check_ddc_delay_comp_offset_ant2_1() ;
    check_ddc_delay_comp_offset_ant3_1() ;
    check_ddc_delay_comp_offset_ant4_1() ;
    check_ddc_delay_comp_offset_ant1_2() ;
    check_ddc_delay_comp_offset_ant2_2() ;
    check_ddc_delay_comp_offset_ant3_2() ;
    check_ddc_delay_comp_offset_ant4_2() ;

endtask :check_dec_dly_comp_registers


task o_ru_reg::check_ddc_gain_ant1();
   exp_val = {16'd0,o_ru_cfg.ddc_gain_ant1};
   ral_blk.get_reg_by_name("ddc_gain_ant1").predict(exp_val);
   ral_blk.ddc_gain_ant1.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_GAIN_ANT1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_gain_ant1

task o_ru_reg::check_ddc_gain_ant2();
   exp_val = {16'd0,o_ru_cfg.ddc_gain_ant2};
   ral_blk.get_reg_by_name("ddc_gain_ant2").predict(exp_val);
   ral_blk.ddc_gain_ant2.read(status,value);
       `uvm_info("DBG", $psprintf("DDC_GAIN_ANT2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_gain_ant2

task o_ru_reg::check_ddc_gain_ant3();
   exp_val = {16'd0,o_ru_cfg.ddc_gain_ant3};
   ral_blk.get_reg_by_name("ddc_gain_ant3").predict(exp_val);
   ral_blk.ddc_gain_ant3.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_GAIN_ANT3: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_gain_ant3

task o_ru_reg::check_ddc_gain_ant4();
   exp_val = {16'd0,o_ru_cfg.ddc_gain_ant4};
   ral_blk.get_reg_by_name("ddc_gain_ant4").predict(exp_val);
   ral_blk.ddc_gain_ant4.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_GAIN_ANT4: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_gain_ant4

task o_ru_reg::check_ddc_hb_bypass_en();
   exp_val = {16'd0,o_ru_cfg.ddc_hb_bypass_en};
   ral_blk.get_reg_by_name("ddc_hb_bypass_en").predict(exp_val);
   ral_blk.ddc_hb_bypass_en.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_HB_BYPASS_EN: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_hb_bypass_en

task o_ru_reg::check_ddc_delay_comp_offset_ant1_1();
   exp_val = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant1_1};
   ral_blk.get_reg_by_name("ddc_delay_comp_offset_ant1_1").predict(exp_val);
   ral_blk.ddc_delay_comp_offset_ant1_1.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_DELAY_COMP_OFFSET_ANT1_1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_delay_comp_offset_ant1_1

task o_ru_reg::check_ddc_delay_comp_offset_ant2_1();
   exp_val = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant2_1};
   ral_blk.get_reg_by_name("ddc_delay_comp_offset_ant2_1").predict(exp_val);
   ral_blk.ddc_delay_comp_offset_ant2_1.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_DELAY_COMP_OFFSET_ANT2_1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_delay_comp_offset_ant2_1

task o_ru_reg::check_ddc_delay_comp_offset_ant3_1();
   exp_val = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant3_1};
   ral_blk.get_reg_by_name("ddc_delay_comp_offset_ant3_1").predict(exp_val);
   ral_blk.ddc_delay_comp_offset_ant3_1.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_DELAY_COMP_OFFSET_ANT3_1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_delay_comp_offset_ant3_1

task o_ru_reg::check_ddc_delay_comp_offset_ant4_1();
   exp_val = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant4_1};
   ral_blk.get_reg_by_name("ddc_delay_comp_offset_ant4_1").predict(exp_val);
   ral_blk.ddc_delay_comp_offset_ant4_1.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_DELAY_COMP_OFFSET_ANT4_1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_delay_comp_offset_ant4_1

task o_ru_reg::check_ddc_delay_comp_offset_ant1_2();
   exp_val = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant1_2};
   ral_blk.get_reg_by_name("ddc_delay_comp_offset_ant1_2").predict(exp_val);
   ral_blk.ddc_delay_comp_offset_ant1_2.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_DELAY_COMP_OFFSET_ANT1_2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_delay_comp_offset_ant1_2

task o_ru_reg::check_ddc_delay_comp_offset_ant2_2();
   exp_val = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant2_2};
   ral_blk.get_reg_by_name("ddc_delay_comp_offset_ant2_2").predict(exp_val);
   ral_blk.ddc_delay_comp_offset_ant2_2.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_DELAY_COMP_OFFSET_ANT2_2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_delay_comp_offset_ant2_2

task o_ru_reg::check_ddc_delay_comp_offset_ant3_2();
   exp_val = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant3_2};
   ral_blk.get_reg_by_name("ddc_delay_comp_offset_ant3_2").predict(exp_val);
   ral_blk.ddc_delay_comp_offset_ant3_2.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_DELAY_COMP_OFFSET_ANT3_2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_delay_comp_offset_ant3_2

task o_ru_reg::check_ddc_delay_comp_offset_ant4_2();
   exp_val = {24'd0,o_ru_cfg.ddc_delay_comp_offset_ant4_2};
   ral_blk.get_reg_by_name("ddc_delay_comp_offset_ant4_2").predict(exp_val);
   ral_blk.ddc_delay_comp_offset_ant4_2.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_DELAY_COMP_OFFSET_ANT4_2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_delay_comp_offset_ant4_2

task o_ru_reg::check_dec_dly_comp_version();
   exp_val = {o_ru_cfg.dec_dly_comp_version};
   ral_blk.get_reg_by_name("dec_dly_comp_version").predict(exp_val);
   ral_blk.dec_dly_comp_version.read(status,value);
   `uvm_info("DBG", $psprintf("DEC_DELAY_COMP: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_dec_dly_comp_version


// DDC Lineup1 register read
task o_ru_reg::check_ddc_l1_registers();

    check_ddc_nco_l1_ant1_lsb()  ;
    check_ddc_nco_l1_ant1_msb()  ;
    check_ddc_nco_l1_ant2_lsb()  ;
    check_ddc_nco_l1_ant2_msb()  ;
    check_ddc_nco_l1_ant3_lsb()  ;
    check_ddc_nco_l1_ant3_msb()  ;
    check_ddc_nco_l1_ant4_lsb()  ;
    check_ddc_nco_l1_ant4_msb()  ;

endtask :check_ddc_l1_registers


task o_ru_reg::check_ddc_l1_version();
   exp_val = {o_ru_cfg.ddc_l1_version};
   ral_blk.get_reg_by_name("ddc_l1_version").predict(exp_val);
   ral_blk.ddc_l1_version.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_L1_VERSION: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_l1_version

task o_ru_reg::check_ddc_nco_l1_ant1_lsb();
   exp_val = {o_ru_cfg.ddc_nco_l1_ant1_lsb};
   ral_blk.get_reg_by_name("ddc_nco_l1_ant1_lsb").predict(exp_val);
   ral_blk.ddc_nco_l1_ant1_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L1_ANT1_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l1_ant1_lsb

task o_ru_reg::check_ddc_nco_l1_ant1_msb();
   exp_val = {o_ru_cfg.ddc_nco_l1_ant1_msb};
   ral_blk.get_reg_by_name("ddc_nco_l1_ant1_msb").predict(exp_val);
   ral_blk.ddc_nco_l1_ant1_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L1_ANT1_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l1_ant1_msb

task o_ru_reg::check_ddc_nco_l1_ant2_lsb();
   exp_val = {o_ru_cfg.ddc_nco_l1_ant2_lsb};
   ral_blk.get_reg_by_name("ddc_nco_l1_ant2_lsb").predict(exp_val);
   ral_blk.ddc_nco_l1_ant2_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L1_ANT2_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l1_ant2_lsb

task o_ru_reg::check_ddc_nco_l1_ant2_msb();
   exp_val = {o_ru_cfg.ddc_nco_l1_ant2_msb};
   ral_blk.get_reg_by_name("ddc_nco_l1_ant2_msb").predict(exp_val);
   ral_blk.ddc_nco_l1_ant2_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L1_ANT2_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l1_ant2_msb

task o_ru_reg::check_ddc_nco_l1_ant3_lsb();
   exp_val = {o_ru_cfg.ddc_nco_l1_ant3_lsb};
   ral_blk.get_reg_by_name("ddc_nco_l1_ant3_lsb").predict(exp_val);
   ral_blk.ddc_nco_l1_ant3_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L1_ANT3_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l1_ant3_lsb

task o_ru_reg::check_ddc_nco_l1_ant3_msb();
   exp_val = {o_ru_cfg.ddc_nco_l1_ant3_msb};
   ral_blk.get_reg_by_name("ddc_nco_l1_ant3_msb").predict(exp_val);
   ral_blk.ddc_nco_l1_ant3_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L1_ANT3_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l1_ant3_msb

task o_ru_reg::check_ddc_nco_l1_ant4_lsb();
   exp_val = {o_ru_cfg.ddc_nco_l1_ant4_lsb};
   ral_blk.get_reg_by_name("ddc_nco_l1_ant4_lsb").predict(exp_val);
   ral_blk.ddc_nco_l1_ant4_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L1_ANT4_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l1_ant4_lsb

task o_ru_reg::check_ddc_nco_l1_ant4_msb();
   exp_val = {o_ru_cfg.ddc_nco_l1_ant4_msb};
   ral_blk.get_reg_by_name("ddc_nco_l1_ant4_msb").predict(exp_val);
   ral_blk.ddc_nco_l1_ant4_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L1_ANT4_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l1_ant4_msb



// DUC Lineup2 register read
task o_ru_reg::check_ddc_l2_registers();

    check_ddc_nco_l2_ant1_lsb()  ;
    check_ddc_nco_l2_ant1_msb()  ;
    check_ddc_nco_l2_ant2_lsb()  ;
    check_ddc_nco_l2_ant2_msb()  ;
    check_ddc_nco_l2_ant3_lsb()  ;
    check_ddc_nco_l2_ant3_msb()  ;
    check_ddc_nco_l2_ant4_lsb()  ;
    check_ddc_nco_l2_ant4_msb()  ;

endtask :check_ddc_l2_registers


task o_ru_reg::check_ddc_l2_version();
   exp_val = {o_ru_cfg.ddc_l2_version};
   ral_blk.get_reg_by_name("ddc_l2_version").predict(exp_val);
   ral_blk.ddc_l2_version.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_L2_VERSION: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_l2_version

task o_ru_reg::check_ddc_nco_l2_ant1_lsb();
   exp_val = {o_ru_cfg.ddc_nco_l2_ant1_lsb};
   ral_blk.get_reg_by_name("ddc_nco_l2_ant1_lsb").predict(exp_val);
   ral_blk.ddc_nco_l2_ant1_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L2_ANT1_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l2_ant1_lsb

task o_ru_reg::check_ddc_nco_l2_ant1_msb();
   exp_val = {o_ru_cfg.ddc_nco_l2_ant1_msb};
   ral_blk.get_reg_by_name("ddc_nco_l2_ant1_msb").predict(exp_val);
   ral_blk.ddc_nco_l2_ant1_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L2_ANT1_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l2_ant1_msb

task o_ru_reg::check_ddc_nco_l2_ant2_lsb();
   exp_val = {o_ru_cfg.ddc_nco_l2_ant2_lsb};
   ral_blk.get_reg_by_name("ddc_nco_l2_ant2_lsb").predict(exp_val);
   ral_blk.ddc_nco_l2_ant2_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L2_ANT2_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l2_ant2_lsb

task o_ru_reg::check_ddc_nco_l2_ant2_msb();
   exp_val = {o_ru_cfg.ddc_nco_l2_ant2_msb};
   ral_blk.get_reg_by_name("ddc_nco_l2_ant2_msb").predict(exp_val);
   ral_blk.ddc_nco_l2_ant2_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L2_ANT2_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l2_ant2_msb

task o_ru_reg::check_ddc_nco_l2_ant3_lsb();
   exp_val = {o_ru_cfg.ddc_nco_l2_ant3_lsb};
   ral_blk.get_reg_by_name("ddc_nco_l2_ant3_lsb").predict(exp_val);
   ral_blk.ddc_nco_l2_ant3_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L2_ANT3_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l2_ant3_lsb

task o_ru_reg::check_ddc_nco_l2_ant3_msb();
   exp_val = {o_ru_cfg.ddc_nco_l2_ant3_msb};
   ral_blk.get_reg_by_name("ddc_nco_l2_ant3_msb").predict(exp_val);
   ral_blk.ddc_nco_l2_ant3_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L2_ANT3_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l2_ant3_msb

task o_ru_reg::check_ddc_nco_l2_ant4_lsb();
   exp_val = {o_ru_cfg.ddc_nco_l2_ant4_lsb};
   ral_blk.get_reg_by_name("ddc_nco_l2_ant4_lsb").predict(exp_val);
   ral_blk.ddc_nco_l2_ant4_lsb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L2_ANT4_LSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l2_ant4_lsb

task o_ru_reg::check_ddc_nco_l2_ant4_msb();
   exp_val = {o_ru_cfg.ddc_nco_l2_ant4_msb};
   ral_blk.get_reg_by_name("ddc_nco_l2_ant4_msb").predict(exp_val);
   ral_blk.ddc_nco_l2_ant4_msb.read(status,value);
   `uvm_info("DBG", $psprintf("DDC_NCO_L2_ANT4_MSB: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_ddc_nco_l2_ant4_msb

task o_ru_reg::check_fh_compress();
   exp_val = {23'd0,o_ru_cfg.func_mode,o_ru_cfg.ud_comp_width};
   ral_blk.get_reg_by_name("compression_mode").predict(exp_val);
   ral_blk.compression_mode.read(status,value);
   `uvm_info("DBG", $psprintf("FH_COMPRESS: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_fh_compress



// Long PRACH L1 register read
task o_ru_reg::check_long_prach_l1_registers();

    check_long_prach1_nco()                    ;
    check_long_prach1_nco_1()                  ;
    check_long_prach1_nco_2()                  ;
    check_long_prach1_nco_3()                  ;

endtask :check_long_prach_l1_registers


task o_ru_reg::check_long_prach1_nco();
   exp_val = {o_ru_cfg.long_prach1_nco};
   ral_blk.get_reg_by_name("long_prach1_nco_ant1").predict(exp_val);
   ral_blk.long_prach1_nco_ant1.read(status,value);
   `uvm_info("DBG", $psprintf("LONG_PRACH1_NCO: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_long_prach1_nco

task o_ru_reg::check_long_prach1_nco_1();
   exp_val = {o_ru_cfg.long_prach1_nco_1};
   ral_blk.get_reg_by_name("long_prach1_nco_ant2").predict(exp_val);
   ral_blk.long_prach1_nco_ant2.read(status,value);
   `uvm_info("DBG", $psprintf("LONG_PRACH1_NCO_1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_long_prach1_nco_1

task o_ru_reg::check_long_prach1_nco_2();
   exp_val = {o_ru_cfg.long_prach1_nco_2};
   ral_blk.get_reg_by_name("long_prach1_nco_ant3").predict(exp_val);
   ral_blk.long_prach1_nco_ant3.read(status,value);
   `uvm_info("DBG", $psprintf("LONG_PRACH1_NCO_2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_long_prach1_nco_2

task o_ru_reg::check_long_prach1_nco_3();
   exp_val = {o_ru_cfg.long_prach1_nco_3};
   ral_blk.get_reg_by_name("long_prach1_nco_ant4").predict(exp_val);
   ral_blk.long_prach1_nco_ant4.read(status,value);
   `uvm_info("DBG", $psprintf("LONG_PRACH1_NCO_3: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_long_prach1_nco_3



// Long PRACH L2 register read
task o_ru_reg::check_long_prach_l2_registers();

    check_long_prach2_nco()                    ;                   
    check_long_prach2_nco_1()                  ;
    check_long_prach2_nco_2()                  ;
    check_long_prach2_nco_3()                  ;

endtask :check_long_prach_l2_registers


task o_ru_reg::check_long_prach2_nco();
   exp_val = {o_ru_cfg.long_prach2_nco};
   ral_blk.get_reg_by_name("long_prach2_nco_ant1").predict(exp_val);
   ral_blk.long_prach2_nco_ant1.read(status,value);
   `uvm_info("DBG", $psprintf("LONG_PRACH2_NCO: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_long_prach2_nco

task o_ru_reg::check_long_prach2_nco_1();
   exp_val = {o_ru_cfg.long_prach2_nco_1};
   ral_blk.get_reg_by_name("long_prach2_nco_ant2").predict(exp_val);
   ral_blk.long_prach2_nco_ant2.read(status,value);
   `uvm_info("DBG", $psprintf("LONG_PRACH2_NCO_1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_long_prach2_nco_1

task o_ru_reg::check_long_prach2_nco_2();
   exp_val = {o_ru_cfg.long_prach2_nco_2};
   ral_blk.get_reg_by_name("long_prach2_nco_ant3").predict(exp_val);
   ral_blk.long_prach2_nco_ant3.read(status,value);
   `uvm_info("DBG", $psprintf("LONG_PRACH2_NCO_2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_long_prach2_nco_2

task o_ru_reg::check_long_prach2_nco_3();
   exp_val = {o_ru_cfg.long_prach2_nco_3};
   ral_blk.get_reg_by_name("long_prach2_nco_ant4").predict(exp_val);
   ral_blk.long_prach2_nco_ant4.read(status,value);
   `uvm_info("DBG", $psprintf("LONG_PRACH2_NCO_3: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_long_prach2_nco_3


// IP Version register read
task o_ru_reg::check_ip_version_registers();

    check_ecpri_ip_version()      ;
    check_oran_ip_version()       ;
    check_fh_comp_ip_version()    ;
    check_coupling_ip_version()   ;
    check_long_prach_version()    ;
    check_ifft1_version()         ;
    check_ifft2_version()         ;
    check_fft1_version()          ;
    check_fft2_version()          ;
    check_ca_interp_version()     ;
    check_dec_dly_comp_version()  ;
    check_duc_l1_version()        ;
    check_duc_l2_version()        ;
    check_ddc_l1_version()        ;
    check_ddc_l2_version()        ;
 
endtask :check_ip_version_registers


task o_ru_reg::check_pwr_mtr_registers();

    check_pwr_mtr_control_reg_ifft_l1()    ;
    check_pwr_mtr_status_reg_ifft_l1()     ;
    check_pwr_mtr_compute_time_ifft_l1()   ;
    check_pwr_mtr_intr_mask_reg_ifft_l1()  ;
    check_pwr_mtr_control_reg_ifft_l2()    ;
    check_pwr_mtr_status_reg_ifft_l2()     ;
    check_pwr_mtr_compute_time_ifft_l2()   ;
    check_pwr_mtr_intr_mask_reg_ifft_l2()  ;
    check_pwr_mtr_control_reg_fft_l1()     ;
    check_pwr_mtr_status_reg_fft_l1()      ;
    check_pwr_mtr_compute_time_fft_l1()    ;
    check_pwr_mtr_intr_mask_reg_fft_l1()   ;
    check_pwr_mtr_control_reg_fft_l2()     ;
    check_pwr_mtr_status_reg_fft_l2()      ;
    check_pwr_mtr_compute_time_fft_l2()    ;
    check_pwr_mtr_intr_mask_reg_fft_l2()   ;
 
endtask :check_pwr_mtr_registers


task o_ru_reg::check_pwr_mtr_control_reg_ifft_l1();
   exp_val = {o_ru_cfg.control_reset,21'd0,o_ru_cfg.UL_pwr_en,o_ru_cfg.DL_pwr_en,o_ru_cfg.IRQ_Enable,o_ru_cfg.StartnStop,o_ru_cfg.mode};
   ral_blk.get_reg_by_name("pwr_mtr_control_reg").predict(exp_val);
   ral_blk.pwr_mtr_control_reg.read(status,value);
   `uvm_info("DBG", $psprintf("PWR MTR CONTROL REG: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_control_reg_ifft_l1

task o_ru_reg::check_pwr_mtr_status_reg_ifft_l1();
   exp_val = {o_ru_cfg.reserved1,8'd0,o_ru_cfg.debug_state,o_ru_cfg.saturation,o_ru_cfg.data_status};
   ral_blk.get_reg_by_name("pwr_mtr_status_reg").predict(exp_val);
   ral_blk.pwr_mtr_status_reg.read(status,value);
   o_ru_cfg.data_status = value[1:0];
   `uvm_info("DBG", $psprintf("PWR MTR STATUS REG: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_status_reg_ifft_l1

task o_ru_reg::check_pwr_mtr_compute_time_ifft_l1();
   exp_val = {o_ru_cfg.comp_time};
   ral_blk.get_reg_by_name("pwr_mtr_compute_time").predict(exp_val);
   ral_blk.pwr_mtr_compute_time.read(status,value);
   `uvm_info("DBG", $psprintf("PWR MTR COMPUTE TIME: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_compute_time_ifft_l1

task o_ru_reg::check_pwr_mtr_intr_mask_reg_ifft_l1();
   exp_val = {30'd0,o_ru_cfg.data_ready,o_ru_cfg.Error};
   ral_blk.get_reg_by_name("pwr_mtr_intr_mask_reg").predict(exp_val);
   ral_blk.pwr_mtr_intr_mask_reg.read(status,value);
   `uvm_info("DBG", $psprintf("PWR MTR INTR MASK: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_intr_mask_reg_ifft_l1

task o_ru_reg::check_pwr_mtr_control_reg_ifft_l2();
   exp_val = {o_ru_cfg.control_reset,21'd0,o_ru_cfg.UL_pwr_en,o_ru_cfg.DL_pwr_en,o_ru_cfg.IRQ_Enable,o_ru_cfg.StartnStop,o_ru_cfg.mode};
   ral_blk.get_reg_by_name("pwr_mtr_control_reg_1").predict(exp_val);
   ral_blk.pwr_mtr_control_reg_1.read(status,value);
   `uvm_info("DBG", $psprintf("PWR MTR CONTROL REG1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_control_reg_ifft_l2

task o_ru_reg::check_pwr_mtr_status_reg_ifft_l2();
   exp_val = {o_ru_cfg.reserved1,8'd0,o_ru_cfg.debug_state,o_ru_cfg.saturation,o_ru_cfg.data_status};
   ral_blk.get_reg_by_name("pwr_mtr_status_reg_1").predict(exp_val);
   ral_blk.pwr_mtr_status_reg_1.read(status,value);
   o_ru_cfg.data_status = value[1:0];
   `uvm_info("DBG", $psprintf("PWR MTR STATUS REG1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_status_reg_ifft_l2

task o_ru_reg::check_pwr_mtr_compute_time_ifft_l2();
   exp_val = {o_ru_cfg.comp_time};
   ral_blk.get_reg_by_name("pwr_mtr_compute_time_1").predict(exp_val);
   ral_blk.pwr_mtr_compute_time_1.read(status,value);
   `uvm_info("DBG", $psprintf("PWR MTR COMPUTE TIME1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_compute_time_ifft_l2

task o_ru_reg::check_pwr_mtr_intr_mask_reg_ifft_l2();
   exp_val = {30'd0,o_ru_cfg.data_ready,o_ru_cfg.Error};
   ral_blk.get_reg_by_name("pwr_mtr_intr_mask_reg_1").predict(exp_val);
   ral_blk.pwr_mtr_intr_mask_reg_1.read(status,value);
   `uvm_info("DBG", $psprintf("PWR MTR INTR MASK1: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_intr_mask_reg_ifft_l2

task o_ru_reg::check_pwr_mtr_control_reg_fft_l1();
   exp_val = {o_ru_cfg.control_reset,21'd0,o_ru_cfg.UL_pwr_en,o_ru_cfg.DL_pwr_en,o_ru_cfg.IRQ_Enable,o_ru_cfg.StartnStop,o_ru_cfg.mode};
   ral_blk.get_reg_by_name("pwr_mtr_control_reg_2").predict(exp_val);
   ral_blk.pwr_mtr_control_reg_2.read(status,value);
   `uvm_info("DBG", $psprintf("PWR MTR CONTROL REG2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_control_reg_fft_l1

task o_ru_reg::check_pwr_mtr_status_reg_fft_l1();
   exp_val = {o_ru_cfg.reserved1,8'd0,o_ru_cfg.debug_state,o_ru_cfg.saturation,o_ru_cfg.data_status};
   ral_blk.get_reg_by_name("pwr_mtr_status_reg_2").predict(exp_val);
   ral_blk.pwr_mtr_status_reg_2.read(status,value);
   o_ru_cfg.data_status = value[1:0];
   `uvm_info("DBG", $psprintf("PWR MTR STATUS REG2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_status_reg_fft_l1

task o_ru_reg::check_pwr_mtr_compute_time_fft_l1();
   exp_val = {o_ru_cfg.comp_time};
   ral_blk.get_reg_by_name("pwr_mtr_compute_time_2").predict(exp_val);
   ral_blk.pwr_mtr_compute_time_2.read(status,value);
   `uvm_info("DBG", $psprintf("PWR MTR COMPUTE TIME2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_compute_time_fft_l1

task o_ru_reg::check_pwr_mtr_intr_mask_reg_fft_l1();
   exp_val = {30'd0,o_ru_cfg.data_ready,o_ru_cfg.Error};
   ral_blk.get_reg_by_name("pwr_mtr_intr_mask_reg_2").predict(exp_val);
   ral_blk.pwr_mtr_intr_mask_reg_2.read(status,value);
   `uvm_info("DBG", $psprintf("PWR MTR INTR MASK2: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_intr_mask_reg_fft_l1

task o_ru_reg::check_pwr_mtr_control_reg_fft_l2();
   exp_val = {o_ru_cfg.control_reset,21'd0,o_ru_cfg.UL_pwr_en,o_ru_cfg.DL_pwr_en,o_ru_cfg.IRQ_Enable,o_ru_cfg.StartnStop,o_ru_cfg.mode};
   ral_blk.get_reg_by_name("pwr_mtr_control_reg_3").predict(exp_val);
   ral_blk.pwr_mtr_control_reg_3.read(status,value);
   `uvm_info("DBG", $psprintf("PWR MTR CONTROL REG3: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_control_reg_fft_l2

task o_ru_reg::check_pwr_mtr_status_reg_fft_l2();
   exp_val = {o_ru_cfg.reserved1,8'd0,o_ru_cfg.debug_state,o_ru_cfg.saturation,o_ru_cfg.data_status};
   ral_blk.get_reg_by_name("pwr_mtr_status_reg_3").predict(exp_val);
   ral_blk.pwr_mtr_status_reg_3.read(status,value);
   o_ru_cfg.data_status = value[1:0];
   `uvm_info("DBG", $psprintf("PWR MTR STATUS REG3: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_status_reg_fft_l2

task o_ru_reg::check_pwr_mtr_compute_time_fft_l2();
   exp_val = {o_ru_cfg.comp_time};
   ral_blk.get_reg_by_name("pwr_mtr_compute_time_3").predict(exp_val);
   ral_blk.pwr_mtr_compute_time_3.read(status,value);
   `uvm_info("DBG", $psprintf("PWR MTR COMPUTE TIME3: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_compute_time_fft_l2

task o_ru_reg::check_pwr_mtr_intr_mask_reg_fft_l2();
   exp_val = {30'd0,o_ru_cfg.data_ready,o_ru_cfg.Error};
   ral_blk.get_reg_by_name("pwr_mtr_intr_mask_reg_3").predict(exp_val);
   ral_blk.pwr_mtr_intr_mask_reg_3.read(status,value);
   `uvm_info("DBG", $psprintf("PWR MTR INTR MASK3: EXP =%0h  OBS =%0h \n",exp_val,value), UVM_LOW)
endtask :check_pwr_mtr_intr_mask_reg_fft_l2




`endif 
