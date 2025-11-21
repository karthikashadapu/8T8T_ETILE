source [file join [file dirname [info script]] ./../../../ip/qsys_top/sysid/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/qsys_top/qsys_top_iopll_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/sys_manager/dma_subsys_port1_rx_dma_resetn/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/qsys_top/rst_in/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/qsys_top/clk_100/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/qsys_top/ftile_iopll_todsync_sampling/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/qsys_top/user_rst_clkgate_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/qsys_top/qsys_top_master_todclk_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/sys_manager/dma_subsys_port0_rx_dma_resetn/sim/common/modelsim_files.tcl]

namespace eval sys_manager {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [sysid::get_design_libraries]]
    set libraries [dict merge $libraries [qsys_top_iopll_0::get_design_libraries]]
    set libraries [dict merge $libraries [dma_subsys_port1_rx_dma_resetn::get_design_libraries]]
    set libraries [dict merge $libraries [rst_in::get_design_libraries]]
    set libraries [dict merge $libraries [clk_100::get_design_libraries]]
    set libraries [dict merge $libraries [ftile_iopll_todsync_sampling::get_design_libraries]]
    set libraries [dict merge $libraries [user_rst_clkgate_0::get_design_libraries]]
    set libraries [dict merge $libraries [qsys_top_master_todclk_0::get_design_libraries]]
    set libraries [dict merge $libraries [dma_subsys_port0_rx_dma_resetn::get_design_libraries]]
    dict set libraries sys_manager 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [sysid::get_memory_files "$QSYS_SIMDIR/../../ip/qsys_top/sysid/sim/"]]
    set memory_files [concat $memory_files [qsys_top_iopll_0::get_memory_files "$QSYS_SIMDIR/../../ip/qsys_top/qsys_top_iopll_0/sim/"]]
    set memory_files [concat $memory_files [dma_subsys_port1_rx_dma_resetn::get_memory_files "$QSYS_SIMDIR/../../ip/sys_manager/dma_subsys_port1_rx_dma_resetn/sim/"]]
    set memory_files [concat $memory_files [rst_in::get_memory_files "$QSYS_SIMDIR/../../ip/qsys_top/rst_in/sim/"]]
    set memory_files [concat $memory_files [clk_100::get_memory_files "$QSYS_SIMDIR/../../ip/qsys_top/clk_100/sim/"]]
    set memory_files [concat $memory_files [ftile_iopll_todsync_sampling::get_memory_files "$QSYS_SIMDIR/../../ip/qsys_top/ftile_iopll_todsync_sampling/sim/"]]
    set memory_files [concat $memory_files [user_rst_clkgate_0::get_memory_files "$QSYS_SIMDIR/../../ip/qsys_top/user_rst_clkgate_0/sim/"]]
    set memory_files [concat $memory_files [qsys_top_master_todclk_0::get_memory_files "$QSYS_SIMDIR/../../ip/qsys_top/qsys_top_master_todclk_0/sim/"]]
    set memory_files [concat $memory_files [dma_subsys_port0_rx_dma_resetn::get_memory_files "$QSYS_SIMDIR/../../ip/sys_manager/dma_subsys_port0_rx_dma_resetn/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [sysid::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/sysid/sim/"]]
    set design_files [dict merge $design_files [qsys_top_iopll_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/qsys_top_iopll_0/sim/"]]
    set design_files [dict merge $design_files [dma_subsys_port1_rx_dma_resetn::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/sys_manager/dma_subsys_port1_rx_dma_resetn/sim/"]]
    set design_files [dict merge $design_files [rst_in::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/rst_in/sim/"]]
    set design_files [dict merge $design_files [clk_100::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/clk_100/sim/"]]
    set design_files [dict merge $design_files [ftile_iopll_todsync_sampling::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/ftile_iopll_todsync_sampling/sim/"]]
    set design_files [dict merge $design_files [user_rst_clkgate_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/user_rst_clkgate_0/sim/"]]
    set design_files [dict merge $design_files [qsys_top_master_todclk_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/qsys_top_master_todclk_0/sim/"]]
    set design_files [dict merge $design_files [dma_subsys_port0_rx_dma_resetn::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/sys_manager/dma_subsys_port0_rx_dma_resetn/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [sysid::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/sysid/sim/"]]
    set design_files [concat $design_files [qsys_top_iopll_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/qsys_top_iopll_0/sim/"]]
    set design_files [concat $design_files [dma_subsys_port1_rx_dma_resetn::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/sys_manager/dma_subsys_port1_rx_dma_resetn/sim/"]]
    set design_files [concat $design_files [rst_in::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/rst_in/sim/"]]
    set design_files [concat $design_files [clk_100::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/clk_100/sim/"]]
    set design_files [concat $design_files [ftile_iopll_todsync_sampling::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/ftile_iopll_todsync_sampling/sim/"]]
    set design_files [concat $design_files [user_rst_clkgate_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/user_rst_clkgate_0/sim/"]]
    set design_files [concat $design_files [qsys_top_master_todclk_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/qsys_top_master_todclk_0/sim/"]]
    set design_files [concat $design_files [dma_subsys_port0_rx_dma_resetn::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/sys_manager/dma_subsys_port0_rx_dma_resetn/sim/"]]
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/sys_manager.v"]\"  -work sys_manager"
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [sysid::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [qsys_top_iopll_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [dma_subsys_port1_rx_dma_resetn::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [rst_in::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [clk_100::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [ftile_iopll_todsync_sampling::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [user_rst_clkgate_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [qsys_top_master_todclk_0::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [dma_subsys_port0_rx_dma_resetn::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [sysid::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [qsys_top_iopll_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [dma_subsys_port1_rx_dma_resetn::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [rst_in::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clk_100::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ftile_iopll_todsync_sampling::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [user_rst_clkgate_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [qsys_top_master_todclk_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [dma_subsys_port0_rx_dma_resetn::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [sysid::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [qsys_top_iopll_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [dma_subsys_port1_rx_dma_resetn::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [rst_in::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clk_100::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ftile_iopll_todsync_sampling::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [user_rst_clkgate_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [qsys_top_master_todclk_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [dma_subsys_port0_rx_dma_resetn::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
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
    set libraries [dict merge $libraries [sysid::get_dpi_libraries "$QSYS_SIMDIR/../../ip/qsys_top/sysid/sim/"]]
    set libraries [dict merge $libraries [qsys_top_iopll_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/qsys_top/qsys_top_iopll_0/sim/"]]
    set libraries [dict merge $libraries [dma_subsys_port1_rx_dma_resetn::get_dpi_libraries "$QSYS_SIMDIR/../../ip/sys_manager/dma_subsys_port1_rx_dma_resetn/sim/"]]
    set libraries [dict merge $libraries [rst_in::get_dpi_libraries "$QSYS_SIMDIR/../../ip/qsys_top/rst_in/sim/"]]
    set libraries [dict merge $libraries [clk_100::get_dpi_libraries "$QSYS_SIMDIR/../../ip/qsys_top/clk_100/sim/"]]
    set libraries [dict merge $libraries [ftile_iopll_todsync_sampling::get_dpi_libraries "$QSYS_SIMDIR/../../ip/qsys_top/ftile_iopll_todsync_sampling/sim/"]]
    set libraries [dict merge $libraries [user_rst_clkgate_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/qsys_top/user_rst_clkgate_0/sim/"]]
    set libraries [dict merge $libraries [qsys_top_master_todclk_0::get_dpi_libraries "$QSYS_SIMDIR/../../ip/qsys_top/qsys_top_master_todclk_0/sim/"]]
    set libraries [dict merge $libraries [dma_subsys_port0_rx_dma_resetn::get_dpi_libraries "$QSYS_SIMDIR/../../ip/sys_manager/dma_subsys_port0_rx_dma_resetn/sim/"]]
    
    return $libraries
  }
  
}
