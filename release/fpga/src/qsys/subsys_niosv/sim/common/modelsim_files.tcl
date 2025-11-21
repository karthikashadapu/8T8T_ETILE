source [file join [file dirname [info script]] ./../../../ip/subsys_niosv/jtag_uart/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_niosv/niosv_issp_reset_in/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_niosv/niosv_issp_reset_out/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_niosv/niosv_clk/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_niosv/niosv_rst_in/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_niosv/cpu/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_niosv/ram/sim/common/modelsim_files.tcl]

namespace eval subsys_niosv {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [jtag_uart::get_design_libraries]]
    set libraries [dict merge $libraries [niosv_issp_reset_in::get_design_libraries]]
    set libraries [dict merge $libraries [niosv_issp_reset_out::get_design_libraries]]
    set libraries [dict merge $libraries [niosv_clk::get_design_libraries]]
    set libraries [dict merge $libraries [niosv_rst_in::get_design_libraries]]
    set libraries [dict merge $libraries [cpu::get_design_libraries]]
    set libraries [dict merge $libraries [ram::get_design_libraries]]
    dict set libraries altera_merlin_slave_translator_191 1
    dict set libraries altera_merlin_axi_master_ni_1980   1
    dict set libraries altera_merlin_slave_agent_1921     1
    dict set libraries altera_avalon_sc_fifo_1932         1
    dict set libraries altera_merlin_router_1921          1
    dict set libraries altera_merlin_traffic_limiter_1921 1
    dict set libraries altera_merlin_demultiplexer_1921   1
    dict set libraries altera_merlin_multiplexer_1922     1
    dict set libraries altera_mm_interconnect_1920        1
    dict set libraries altera_irq_mapper_2001             1
    dict set libraries altera_reset_controller_1922       1
    dict set libraries subsys_niosv                       1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [jtag_uart::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_niosv/jtag_uart/sim/"]]
    set memory_files [concat $memory_files [niosv_issp_reset_in::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_issp_reset_in/sim/"]]
    set memory_files [concat $memory_files [niosv_issp_reset_out::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_issp_reset_out/sim/"]]
    set memory_files [concat $memory_files [niosv_clk::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_clk/sim/"]]
    set memory_files [concat $memory_files [niosv_rst_in::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_rst_in/sim/"]]
    set memory_files [concat $memory_files [cpu::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_niosv/cpu/sim/"]]
    set memory_files [concat $memory_files [ram::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_niosv/ram/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [jtag_uart::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_niosv/jtag_uart/sim/"]]
    set design_files [dict merge $design_files [niosv_issp_reset_in::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_issp_reset_in/sim/"]]
    set design_files [dict merge $design_files [niosv_issp_reset_out::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_issp_reset_out/sim/"]]
    set design_files [dict merge $design_files [niosv_clk::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_clk/sim/"]]
    set design_files [dict merge $design_files [niosv_rst_in::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_rst_in/sim/"]]
    set design_files [dict merge $design_files [cpu::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_niosv/cpu/sim/"]]
    set design_files [dict merge $design_files [ram::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_niosv/ram/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [jtag_uart::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_niosv/jtag_uart/sim/"]]
    set design_files [concat $design_files [niosv_issp_reset_in::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_issp_reset_in/sim/"]]
    set design_files [concat $design_files [niosv_issp_reset_out::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_issp_reset_out/sim/"]]
    set design_files [concat $design_files [niosv_clk::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_clk/sim/"]]
    set design_files [concat $design_files [niosv_rst_in::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_rst_in/sim/"]]
    set design_files [concat $design_files [cpu::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_niosv/cpu/sim/"]]
    set design_files [concat $design_files [ram::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_niosv/ram/sim/"]]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_translator_191/sim/subsys_niosv_altera_merlin_slave_translator_191_x56fcki.sv"]\"  -work altera_merlin_slave_translator_191"                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_master_ni_1980/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_axi_master_ni_1980"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_master_ni_1980/sim/subsys_niosv_altera_merlin_axi_master_ni_1980_4qd7sla.sv"]\"  -work altera_merlin_axi_master_ni_1980"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/subsys_niosv_altera_merlin_slave_agent_1921_b6r3djy.sv"]\"  -work altera_merlin_slave_agent_1921"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_1921/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_slave_agent_1921"                                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_sc_fifo_1932/sim/subsys_niosv_altera_avalon_sc_fifo_1932_w27kryi.v"]\"  -work altera_avalon_sc_fifo_1932"                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/subsys_niosv_altera_merlin_router_1921_oepd4ei.sv"]\"  -work altera_merlin_router_1921"                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/subsys_niosv_altera_merlin_router_1921_pigggii.sv"]\"  -work altera_merlin_router_1921"                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/subsys_niosv_altera_merlin_router_1921_d2kw2eq.sv"]\"  -work altera_merlin_router_1921"                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/subsys_niosv_altera_merlin_router_1921_tjwd77a.sv"]\"  -work altera_merlin_router_1921"                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/subsys_niosv_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_rspjw2y.v"]\"  -work altera_merlin_traffic_limiter_1921"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv"]\"  -work altera_merlin_traffic_limiter_1921"                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v"]\"  -work altera_merlin_traffic_limiter_1921"                                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/subsys_niosv_altera_merlin_traffic_limiter_1921_ggluely.sv"]\"  -work altera_merlin_traffic_limiter_1921"                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/subsys_niosv_altera_merlin_demultiplexer_1921_57pilba.sv"]\"  -work altera_merlin_demultiplexer_1921"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/subsys_niosv_altera_merlin_demultiplexer_1921_3odtgdi.sv"]\"  -work altera_merlin_demultiplexer_1921"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/subsys_niosv_altera_merlin_multiplexer_1922_retwjqy.sv"]\"  -work altera_merlin_multiplexer_1922"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/subsys_niosv_altera_merlin_multiplexer_1922_va2hnty.sv"]\"  -work altera_merlin_multiplexer_1922"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/subsys_niosv_altera_merlin_demultiplexer_1921_blwqdmi.sv"]\"  -work altera_merlin_demultiplexer_1921"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/subsys_niosv_altera_merlin_multiplexer_1922_nmwv3ri.sv"]\"  -work altera_merlin_multiplexer_1922"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/subsys_niosv_altera_merlin_multiplexer_1922_p6xhf2q.sv"]\"  -work altera_merlin_multiplexer_1922"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                        
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/subsys_niosv_altera_mm_interconnect_1920_glxvwqa.v"]\"  -work altera_mm_interconnect_1920"                                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_irq_mapper_2001/sim/subsys_niosv_altera_irq_mapper_2001_sfbnk2i.sv"]\"  -work altera_irq_mapper_2001"                                                     
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_controller.v"]\"  -work altera_reset_controller_1922"                                                                  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1922/sim/altera_reset_synchronizer.v"]\"  -work altera_reset_controller_1922"                                                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/subsys_niosv.v"]\"  -work subsys_niosv"                                                                                                                                 
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [jtag_uart::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [niosv_issp_reset_in::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [niosv_issp_reset_out::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [niosv_clk::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [niosv_rst_in::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [cpu::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ram::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [jtag_uart::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [niosv_issp_reset_in::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [niosv_issp_reset_out::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [niosv_clk::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [niosv_rst_in::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [cpu::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ram::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [jtag_uart::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [niosv_issp_reset_in::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [niosv_issp_reset_out::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [niosv_clk::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [niosv_rst_in::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [cpu::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ram::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
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
    set libraries [dict merge $libraries [jtag_uart::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_niosv/jtag_uart/sim/"]]
    set libraries [dict merge $libraries [niosv_issp_reset_in::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_issp_reset_in/sim/"]]
    set libraries [dict merge $libraries [niosv_issp_reset_out::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_issp_reset_out/sim/"]]
    set libraries [dict merge $libraries [niosv_clk::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_clk/sim/"]]
    set libraries [dict merge $libraries [niosv_rst_in::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_niosv/niosv_rst_in/sim/"]]
    set libraries [dict merge $libraries [cpu::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_niosv/cpu/sim/"]]
    set libraries [dict merge $libraries [ram::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_niosv/ram/sim/"]]
    
    return $libraries
  }
  
}
