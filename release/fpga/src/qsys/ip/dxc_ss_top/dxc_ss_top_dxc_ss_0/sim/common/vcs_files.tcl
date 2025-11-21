
namespace eval dxc_ss_top_dxc_ss_0 {
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    dict set design_files "dxc_ss.sv"             "\"+incdir+$QSYS_SIMDIR/../dxc_ss_10/sim/\" $QSYS_SIMDIR/../dxc_ss_10/sim/dxc_ss.sv"         
    dict set design_files "ddc_top_ss.sv"         "\"+incdir+$QSYS_SIMDIR/../dxc_ss_10/sim/\" $QSYS_SIMDIR/../dxc_ss_10/sim/ddc_top_ss.sv"     
    dict set design_files "duc_top_ss.sv"         "\"+incdir+$QSYS_SIMDIR/../dxc_ss_10/sim/\" $QSYS_SIMDIR/../dxc_ss_10/sim/duc_top_ss.sv"     
    dict set design_files "DXC_SS_Registers.v"    "\"+incdir+$QSYS_SIMDIR/../dxc_ss_10/sim/\" $QSYS_SIMDIR/../dxc_ss_10/sim/DXC_SS_Registers.v"
    dict set design_files "dxc_ss_top_dxc_ss_0.v" "$QSYS_SIMDIR/dxc_ss_top_dxc_ss_0.v"                                                         
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
  
  
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    
    return $libraries
  }
  
}
