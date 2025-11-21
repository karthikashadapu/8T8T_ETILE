source [file join [file dirname [info script]] ./../../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_csr/sim/common/xcelium_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ecpri_oran_top/clock_bridge_dsp/sim/common/xcelium_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ecpri_oran_top/ecpri_oran_top_mm_bridge_0/sim/common/xcelium_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ecpri_oran_top/reset_bridge_dsp/sim/common/xcelium_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_0/sim/common/xcelium_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/ecpri_oran_top/ecpri_oran_top_ecpri_oran_0/sim/common/xcelium_files.tcl]

namespace eval ecpri_oran_top {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [ecpri_oran_top_reset_bridge_csr::get_design_libraries]]
    set libraries [dict merge $libraries [clock_bridge_dsp::get_design_libraries]]
    set libraries [dict merge $libraries [ecpri_oran_top_mm_bridge_0::get_design_libraries]]
    set libraries [dict merge $libraries [reset_bridge_dsp::get_design_libraries]]
    set libraries [dict merge $libraries [ecpri_oran_top_reset_bridge_0::get_design_libraries]]
    set libraries [dict merge $libraries [ecpri_oran_top_ecpri_oran_0::get_design_libraries]]
    dict set libraries ecpri_oran_top_avst_axist_bridge_0  1
    dict set libraries altera_merlin_master_translator_192 1
    dict set libraries altera_merlin_slave_translator_191  1
    dict set libraries altera_merlin_master_agent_1922     1
    dict set libraries altera_merlin_slave_agent_1921      1
    dict set libraries altera_avalon_sc_fifo_1932          1
    dict set libraries altera_merlin_router_1921           1
    dict set libraries altera_merlin_traffic_limiter_1921  1
    dict set libraries altera_merlin_demultiplexer_1921    1
    dict set libraries altera_merlin_multiplexer_1922      1
    dict set libraries altera_mm_interconnect_1920         1
    dict set libraries timing_adapter_1940                 1
    dict set libraries altera_avalon_st_adapter_1920       1
    dict set libraries error_adapter_1920                  1
    dict set libraries altera_reset_controller_1922        1
    dict set libraries ecpri_oran_top                      1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [ecpri_oran_top_reset_bridge_csr::get_memory_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_csr/sim/"]]
    set memory_files [concat $memory_files [clock_bridge_dsp::get_memory_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/clock_bridge_dsp/sim/"]]
    set memory_files [concat $memory_files [ecpri_oran_top_mm_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_mm_bridge_0/sim/"]]
    set memory_files [concat $memory_files [reset_bridge_dsp::get_memory_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/reset_bridge_dsp/sim/"]]
    set memory_files [concat $memory_files [ecpri_oran_top_reset_bridge_0::get_memory_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_0/sim/"]]
    set memory_files [concat $memory_files [ecpri_oran_top_ecpri_oran_0::get_memory_files "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_ecpri_oran_0/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [ecpri_oran_top_reset_bridge_csr::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_csr/sim/"]]
    set design_files [dict merge $design_files [clock_bridge_dsp::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ecpri_oran_top/clock_bridge_dsp/sim/"]]
    set design_files [dict merge $design_files [ecpri_oran_top_mm_bridge_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_mm_bridge_0/sim/"]]
    set design_files [dict merge $design_files [reset_bridge_dsp::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ecpri_oran_top/reset_bridge_dsp/sim/"]]
    set design_files [dict merge $design_files [ecpri_oran_top_reset_bridge_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_0/sim/"]]
    set design_files [dict merge $design_files [ecpri_oran_top_ecpri_oran_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_ecpri_oran_0/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [ecpri_oran_top_reset_bridge_csr::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_csr/sim/"]]
    set design_files [concat $design_files [clock_bridge_dsp::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ecpri_oran_top/clock_bridge_dsp/sim/"]]
    set design_files [concat $design_files [ecpri_oran_top_mm_bridge_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_mm_bridge_0/sim/"]]
    set design_files [concat $design_files [reset_bridge_dsp::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ecpri_oran_top/reset_bridge_dsp/sim/"]]
    set design_files [concat $design_files [ecpri_oran_top_reset_bridge_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_0/sim/"]]
    set design_files [concat $design_files [ecpri_oran_top_ecpri_oran_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_ecpri_oran_0/sim/"]]
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ecpri_oran_top_avst_axist_bridge_0/sim/ftile_ghrd_avst_axist_bridge.sv\"  -work ecpri_oran_top_avst_axist_bridge_0 -cdslib  ./cds_libs/ecpri_oran_top_avst_axist_bridge_0.cds.lib"                                 
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_master_translator_192/sim/ecpri_oran_top_altera_merlin_master_translator_192_lykd4la.sv\"  -work altera_merlin_master_translator_192 -cdslib  ./cds_libs/altera_merlin_master_translator_192.cds.lib"
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_slave_translator_191/sim/ecpri_oran_top_altera_merlin_slave_translator_191_x56fcki.sv\"  -work altera_merlin_slave_translator_191 -cdslib  ./cds_libs/altera_merlin_slave_translator_191.cds.lib"    
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_master_agent_1922/sim/ecpri_oran_top_altera_merlin_master_agent_1922_fy3n5ti.sv\"  -work altera_merlin_master_agent_1922 -cdslib  ./cds_libs/altera_merlin_master_agent_1922.cds.lib"                
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/ecpri_oran_top_altera_merlin_slave_agent_1921_b6r3djy.sv\"  -work altera_merlin_slave_agent_1921 -cdslib  ./cds_libs/altera_merlin_slave_agent_1921.cds.lib"                    
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/altera_merlin_burst_uncompressor.sv\"  -work altera_merlin_slave_agent_1921 -cdslib  ./cds_libs/altera_merlin_slave_agent_1921.cds.lib"                                         
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_avalon_sc_fifo_1932/sim/ecpri_oran_top_altera_avalon_sc_fifo_1932_w27kryi.v\"  -work altera_avalon_sc_fifo_1932 -cdslib  ./cds_libs/altera_avalon_sc_fifo_1932.cds.lib"                                         
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_router_1921/sim/ecpri_oran_top_altera_merlin_router_1921_6fp3vva.sv\"  -work altera_merlin_router_1921 -cdslib  ./cds_libs/altera_merlin_router_1921.cds.lib"                                        
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_router_1921/sim/ecpri_oran_top_altera_merlin_router_1921_iimzh7i.sv\"  -work altera_merlin_router_1921 -cdslib  ./cds_libs/altera_merlin_router_1921.cds.lib"                                        
    lappend design_files "xmvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/ecpri_oran_top_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_wq7ojcq.v\"  -work altera_merlin_traffic_limiter_1921"                                        
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv\"  -work altera_merlin_traffic_limiter_1921 -cdslib  ./cds_libs/altera_merlin_traffic_limiter_1921.cds.lib"                                 
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v\"  -work altera_merlin_traffic_limiter_1921 -cdslib  ./cds_libs/altera_merlin_traffic_limiter_1921.cds.lib"                                
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/ecpri_oran_top_altera_merlin_traffic_limiter_1921_js7yfey.sv\"  -work altera_merlin_traffic_limiter_1921 -cdslib  ./cds_libs/altera_merlin_traffic_limiter_1921.cds.lib"    
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/ecpri_oran_top_altera_merlin_demultiplexer_1921_qdhafey.sv\"  -work altera_merlin_demultiplexer_1921 -cdslib  ./cds_libs/altera_merlin_demultiplexer_1921.cds.lib"            
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/ecpri_oran_top_altera_merlin_multiplexer_1922_4xmqb4q.sv\"  -work altera_merlin_multiplexer_1922 -cdslib  ./cds_libs/altera_merlin_multiplexer_1922.cds.lib"                    
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv\"  -work altera_merlin_multiplexer_1922 -cdslib  ./cds_libs/altera_merlin_multiplexer_1922.cds.lib"                                                 
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/ecpri_oran_top_altera_merlin_demultiplexer_1921_4kurn6q.sv\"  -work altera_merlin_demultiplexer_1921 -cdslib  ./cds_libs/altera_merlin_demultiplexer_1921.cds.lib"            
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/ecpri_oran_top_altera_merlin_multiplexer_1922_jfnui6q.sv\"  -work altera_merlin_multiplexer_1922 -cdslib  ./cds_libs/altera_merlin_multiplexer_1922.cds.lib"                    
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv\"  -work altera_merlin_multiplexer_1922 -cdslib  ./cds_libs/altera_merlin_multiplexer_1922.cds.lib"                                                 
    lappend design_files "xmvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/ecpri_oran_top_altera_mm_interconnect_1920_u73qfxa.v\"  -work altera_mm_interconnect_1920"                                                                                   
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../timing_adapter_1940/sim/ecpri_oran_top_timing_adapter_1940_almb5ea.sv\"  -work timing_adapter_1940 -cdslib  ./cds_libs/timing_adapter_1940.cds.lib"                                                                
    lappend design_files "xmvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_avalon_st_adapter_1920/sim/ecpri_oran_top_altera_avalon_st_adapter_1920_jd3c5fa.v\"  -work altera_avalon_st_adapter_1920"                                                                             
    lappend design_files "xmvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../error_adapter_1920/sim/ecpri_oran_top_error_adapter_1920_tb2uqmq.sv\"  -work error_adapter_1920 -cdslib  ./cds_libs/error_adapter_1920.cds.lib"                                                                    
    lappend design_files "xmvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_avalon_st_adapter_1920/sim/ecpri_oran_top_altera_avalon_st_adapter_1920_x2kj6fa.v\"  -work altera_avalon_st_adapter_1920"                                                                             
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_controller.v\"  -work altera_reset_controller_1922 -cdslib  ./cds_libs/altera_reset_controller_1922.cds.lib"                                                             
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_synchronizer.v\"  -work altera_reset_controller_1922 -cdslib  ./cds_libs/altera_reset_controller_1922.cds.lib"                                                           
    lappend design_files "xmvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/ecpri_oran_top.v\"  -work ecpri_oran_top"                                                                                                                                                                       
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ecpri_oran_top_reset_bridge_csr::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [clock_bridge_dsp::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ecpri_oran_top_mm_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [reset_bridge_dsp::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ecpri_oran_top_reset_bridge_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ecpri_oran_top_ecpri_oran_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [ecpri_oran_top_reset_bridge_csr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clock_bridge_dsp::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ecpri_oran_top_mm_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [reset_bridge_dsp::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ecpri_oran_top_reset_bridge_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ecpri_oran_top_ecpri_oran_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ecpri_oran_top_reset_bridge_csr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clock_bridge_dsp::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ecpri_oran_top_mm_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [reset_bridge_dsp::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ecpri_oran_top_reset_bridge_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ecpri_oran_top_ecpri_oran_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    set libraries [dict merge $libraries [ecpri_oran_top_reset_bridge_csr::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_csr/sim/"]]
    set libraries [dict merge $libraries [clock_bridge_dsp::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ecpri_oran_top/clock_bridge_dsp/sim/"]]
    set libraries [dict merge $libraries [ecpri_oran_top_mm_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_mm_bridge_0/sim/"]]
    set libraries [dict merge $libraries [reset_bridge_dsp::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ecpri_oran_top/reset_bridge_dsp/sim/"]]
    set libraries [dict merge $libraries [ecpri_oran_top_reset_bridge_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_reset_bridge_0/sim/"]]
    set libraries [dict merge $libraries [ecpri_oran_top_ecpri_oran_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/ecpri_oran_top/ecpri_oran_top_ecpri_oran_0/sim/"]]
    
    return $libraries
  }
  
}
