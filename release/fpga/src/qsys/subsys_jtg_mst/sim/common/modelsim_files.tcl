source [file join [file dirname [info script]] ./../../../ip/qsys_top/fpga_m2ocm_pb/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_jtg_mst/fpga_m/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_jtg_mst/hps_m/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_jtg_mst/jtag_rst_in/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/subsys_jtg_mst/jtag_clk/sim/common/modelsim_files.tcl]

namespace eval subsys_jtg_mst {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [fpga_m2ocm_pb::get_design_libraries]]
    set libraries [dict merge $libraries [fpga_m::get_design_libraries]]
    set libraries [dict merge $libraries [hps_m::get_design_libraries]]
    set libraries [dict merge $libraries [jtag_rst_in::get_design_libraries]]
    set libraries [dict merge $libraries [jtag_clk::get_design_libraries]]
    dict set libraries subsys_jtg_mst 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [fpga_m2ocm_pb::get_memory_files "$QSYS_SIMDIR/../../ip/qsys_top/fpga_m2ocm_pb/sim/"]]
    set memory_files [concat $memory_files [fpga_m::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/fpga_m/sim/"]]
    set memory_files [concat $memory_files [hps_m::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/hps_m/sim/"]]
    set memory_files [concat $memory_files [jtag_rst_in::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/jtag_rst_in/sim/"]]
    set memory_files [concat $memory_files [jtag_clk::get_memory_files "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/jtag_clk/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [fpga_m2ocm_pb::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/fpga_m2ocm_pb/sim/"]]
    set design_files [dict merge $design_files [fpga_m::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/fpga_m/sim/"]]
    set design_files [dict merge $design_files [hps_m::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/hps_m/sim/"]]
    set design_files [dict merge $design_files [jtag_rst_in::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/jtag_rst_in/sim/"]]
    set design_files [dict merge $design_files [jtag_clk::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/jtag_clk/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [fpga_m2ocm_pb::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/qsys_top/fpga_m2ocm_pb/sim/"]]
    set design_files [concat $design_files [fpga_m::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/fpga_m/sim/"]]
    set design_files [concat $design_files [hps_m::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/hps_m/sim/"]]
    set design_files [concat $design_files [jtag_rst_in::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/jtag_rst_in/sim/"]]
    set design_files [concat $design_files [jtag_clk::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/jtag_clk/sim/"]]
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/subsys_jtg_mst.v"]\"  -work subsys_jtg_mst"
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
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [fpga_m2ocm_pb::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [fpga_m::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [hps_m::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [jtag_rst_in::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    append ELAB_OPTIONS [get_non_duplicate_elab_option $ELAB_OPTIONS [jtag_clk::get_elab_options $SIMULATOR_TOOL_BITNESS]]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [fpga_m2ocm_pb::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [fpga_m::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [hps_m::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [jtag_rst_in::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [jtag_clk::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [fpga_m2ocm_pb::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [fpga_m::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [hps_m::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [jtag_rst_in::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [jtag_clk::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
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
    set libraries [dict merge $libraries [fpga_m2ocm_pb::get_dpi_libraries "$QSYS_SIMDIR/../../ip/qsys_top/fpga_m2ocm_pb/sim/"]]
    set libraries [dict merge $libraries [fpga_m::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/fpga_m/sim/"]]
    set libraries [dict merge $libraries [hps_m::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/hps_m/sim/"]]
    set libraries [dict merge $libraries [jtag_rst_in::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/jtag_rst_in/sim/"]]
    set libraries [dict merge $libraries [jtag_clk::get_dpi_libraries "$QSYS_SIMDIR/../../ip/subsys_jtg_mst/jtag_clk/sim/"]]
    
    return $libraries
  }
  
}
