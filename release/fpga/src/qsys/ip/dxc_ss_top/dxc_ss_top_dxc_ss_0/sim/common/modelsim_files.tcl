
namespace eval dxc_ss_top_dxc_ss_0 {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries dxc_ss_10           1
    dict set libraries dxc_ss_top_dxc_ss_0 1
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
    lappend design_files "-makelib dxc_ss_10 \"[normalize_path "$QSYS_SIMDIR/../dxc_ss_10/sim/dxc_ss.sv"]\" +incdir+[normalize_path "$QSYS_SIMDIR/../dxc_ss_10/sim/"]  -end"         
    lappend design_files "-makelib dxc_ss_10 \"[normalize_path "$QSYS_SIMDIR/../dxc_ss_10/sim/ddc_top_ss.sv"]\" +incdir+[normalize_path "$QSYS_SIMDIR/../dxc_ss_10/sim/"]  -end"     
    lappend design_files "-makelib dxc_ss_10 \"[normalize_path "$QSYS_SIMDIR/../dxc_ss_10/sim/duc_top_ss.sv"]\" +incdir+[normalize_path "$QSYS_SIMDIR/../dxc_ss_10/sim/"]  -end"     
    lappend design_files "-makelib dxc_ss_10 \"[normalize_path "$QSYS_SIMDIR/../dxc_ss_10/sim/DXC_SS_Registers.v"]\" +incdir+[normalize_path "$QSYS_SIMDIR/../dxc_ss_10/sim/"]  -end"
    lappend design_files "-makelib dxc_ss_top_dxc_ss_0 \"[normalize_path "$QSYS_SIMDIR/dxc_ss_top_dxc_ss_0.v"]\"   -end"                                                             
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
