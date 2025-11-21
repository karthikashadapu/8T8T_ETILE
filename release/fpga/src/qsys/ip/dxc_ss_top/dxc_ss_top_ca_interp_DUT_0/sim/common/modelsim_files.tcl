
namespace eval dxc_ss_top_ca_interp_DUT_0 {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries ca_interp_DUT_10           1
    dict set libraries dxc_ss_top_ca_interp_DUT_0 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/dspba_library_ver.sv"]\"  -work ca_interp_DUT_10"                                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT_safe_path_flat_ver.sv"]\"  -work ca_interp_DUT_10"                            
    lappend design_files "vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT_safe_path_flat.vhd"]\"  -work ca_interp_DUT_10"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT.sv"]\"  -work ca_interp_DUT_10"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/busFabric_ca_interp_DUT_2ouiflr06j62696x6u0qu5xajz.sv"]\"  -work ca_interp_DUT_10"          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT_Summer_DUC.sv"]\"  -work ca_interp_DUT_10"                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT_Summer_DUC_Poly_phase_Interp.sv"]\"  -work ca_interp_DUT_10"                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT_Summer_DUC_Poly_phase_Interp_hb3_im.sv"]\"  -work ca_interp_DUT_10"           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT_Summer_DUC_Poly_phase_Interp_hb3_re.sv"]\"  -work ca_interp_DUT_10"           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT_Summer_DUC_Poly_phase_Interp_scale_HB3_im.sv"]\"  -work ca_interp_DUT_10"     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT_Summer_DUC_Poly_phase_Interp_scale_HB3_re.sv"]\"  -work ca_interp_DUT_10"     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT_Summer_DUC_Subsystem.sv"]\"  -work ca_interp_DUT_10"                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT_Summer_DUC_Summer.sv"]\"  -work ca_interp_DUT_10"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer2.sv"]\"  -work ca_interp_DUT_10"       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer3.sv"]\"  -work ca_interp_DUT_10"       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain.sv"]\"  -work ca_interp_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ca_interp_DUT_10/sim/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation.sv"]\"  -work ca_interp_DUT_10"          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/dxc_ss_top_ca_interp_DUT_0.v"]\"  -work dxc_ss_top_ca_interp_DUT_0"                                                     
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
    append ELAB_OPTIONS { -t fs}
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
