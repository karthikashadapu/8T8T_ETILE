
namespace eval ecpri_hwtcl_top {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries ecpri_302       1
    dict set libraries ecpri_hwtcl_top 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_pkg.sv"]\"   -end"                                       
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/iwf_pkg.sv"]\"   -end"                                 
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/ecpri_iwf_top.sv"]\"   -end"                           
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_top.sv"]\"   -end"                                       
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/alt_ecpri_offset_compute.sv"]\"   -end"                        
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/csrunit.sv"]\"   -end"                                         
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri.sv"]\"   -end"                                           
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_avst_guard.sv"]\"   -end"                                
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_csr.sv"]\"   -end"                                       
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_cunit_8w.sv"]\"   -end"                                  
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_cunit_8w_st.sv"]\"   -end"                               
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_hdrinsert.sv"]\"   -end"                                 
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_mac.sv"]\"   -end"                                       
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_msg4_buffer.sv"]\"   -end"                               
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_msg4_timebank8.sv"]\"   -end"                            
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_msg5_rx.sv"]\"   -end"                                   
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_msg5_tx.sv"]\"   -end"                                   
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_msg5_unit.sv"]\"   -end"                                 
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_msg6_timebank8.sv"]\"   -end"                            
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_pkt_cnt.sv"]\"   -end"                                   
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_pkt_cnt_st.sv"]\"   -end"                                
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_rx.sv"]\"   -end"                                        
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_rx_adapter.sv"]\"   -end"                                
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/alt_ecpri_dw8_decon.sv"]\"   -end"                             
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_tx.sv"]\"   -end"                                        
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ecpri_tx_adapter.sv"]\"   -end"                                
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/sync_reset_logic.sv"]\"   -end"                                
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_avalon_fifo.sv"]\"   -end"                
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_avalon_fifo_wrapper.sv"]\"   -end"        
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_barrel_layer.sv"]\"   -end"               
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_barrel_shift.sv"]\"   -end"               
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_clkcrosser.sv"]\"   -end"                 
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_dcfifo_m20k_ecc.sv"]\"   -end"            
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_dcfifo_noecc.sv"]\"   -end"               
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_delay_mlab.sv"]\"   -end"                 
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_delay_regs.sv"]\"   -end"                 
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_fifo.sv"]\"   -end"                       
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_fifo_ratematch.sv"]\"   -end"             
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_fifo_8.sv"]\"   -end"                     
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_fmmlab.sv"]\"   -end"                     
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_iw16_sync_fifo_mlab.sv"]\"   -end"        
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_iwX_addr_gen.sv"]\"   -end"               
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_leftmost_one_8.sv"]\"   -end"             
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_m20k_ecc_1r1w.sv"]\"   -end"              
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_m20k_group.sv"]\"   -end"                 
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_maddr_sel.sv"]\"   -end"                  
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_mx4r.sv"]\"   -end"                       
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_mx8r.sv"]\"   -end"                       
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_pulse_stretch_sync.sv"]\"   -end"         
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_s10mlab.sv"]\"   -end"                    
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_scfifo_m20k.sv"]\"   -end"                
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_scfifo_mlab.sv"]\"   -end"                
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_seg_shift.sv"]\"   -end"                  
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_seg_shift_layer.sv"]\"   -end"            
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_seg_shift_split.sv"]\"   -end"            
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_std_synchronizer_nocut.sv"]\"   -end"     
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_wram_m20k.sv"]\"   -end"                  
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/alt_ecpri_wram_mult_inst.sv"]\"   -end"             
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/altera_std_synchronizer_nocut.v"]\"   -end"         
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/chksum_ver.sv"]\"   -end"                           
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/ecpri_eq_18.v"]\"   -end"                           
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/ecpri_eq_3.v"]\"   -end"                            
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/components/ecpri_wys_lut.sv"]\"   -end"                        
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ethframe/ethframe_ins.sv"]\"   -end"                           
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ethframe/ethframe_rem.sv"]\"   -end"                           
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ethframe/ethframe_top.sv"]\"   -end"                           
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ethframe/packet_parser.sv"]\"   -end"                          
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ethframe/ecpri_l2cos_arbiter.sv"]\"   -end"                    
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ethframe/ecpri_l2cos_packet_queue_fifo.sv"]\"   -end"          
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ethframe/ecpri_l2cos_packet_queue_fifo_top.sv"]\"   -end"      
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ethframe/ecpri_pcp_checker.sv"]\"   -end"                      
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ethframe/ecpri_l2cos_top.sv"]\"   -end"                        
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ethframe/packet_queue.sv"]\"   -end"                           
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ethframe/packet_queue_fixed_arb.sv"]\"   -end"                 
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/ethframe/packet_queue_fifo.sv"]\"   -end"                      
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/iwf_ctl_demapper.sv"]\"   -end"                        
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/iwf_inband_ctl.sv"]\"   -end"                          
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/iwf_iq_demapper.sv"]\"   -end"                         
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/iwf_rx.sv"]\"   -end"                                  
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/iwf_rx_top.sv"]\"   -end"                              
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/iwf_shifter.sv"]\"   -end"                             
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/iwf_top.sv"]\"   -end"                                 
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/iwf_tx_aggregator.sv"]\"   -end"                       
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/iwf_tx_scheduler.sv"]\"   -end"                        
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/iwf_tx.sv"]\"   -end"                                  
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/iwf_tx_top.sv"]\"   -end"                              
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/iwf_wrapper.sv"]\"   -end"                             
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/component/alt_iwf_fifo.sv"]\"   -end"                  
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/component/alt_iwf_std_synchronizer_nocut.sv"]\"   -end"
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/component/altera_std_synchronizer_nocut.v"]\"   -end"  
    lappend design_files "-makelib ecpri_302 \"[normalize_path "$QSYS_SIMDIR/../ecpri_302/sim/mentor/IWF/src/component/alt_iwf_clkcrosser.sv"]\"   -end"            
    lappend design_files "-makelib ecpri_hwtcl_top \"[normalize_path "$QSYS_SIMDIR/ecpri_hwtcl_top.v"]\"   -end"                                                    
    return $design_files
  }
  
  proc get_non_duplicate_elab_option {ELAB_OPTIONS NEW_ELAB_OPTION} {
    set IS_DUPLICATE [string first $NEW_ELAB_OPTION $ELAB_OPTIONS]
    if {$IS_DUPLICATE == -1} {
      return $NEW_ELAB_OPTION
    } else {
      return ""
    }
  }
  
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc normalize_path {FILEPATH} {
      if {[catch { package require fileutil } err]} { 
          return $FILEPATH 
      } 
      set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
      if {[file pathtype $FILEPATH] eq "relative"} { 
          set path [fileutil::relative [pwd] $path] 
      } 
      return $path 
  } 
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    
    return $libraries
  }
  
}
