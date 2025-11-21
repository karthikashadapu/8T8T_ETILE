# This is the Quartus file list for 'ca_interp_DUT_Summer_DUC'

set_global_assignment -name SYSTEMVERILOG_FILE ../../rtl/ca_interp_rtl/ca_interp/ca_interp_DUT_safe_path_ver.sv
set_global_assignment -name VHDL_FILE ../../rtl/ca_interp_rtl/ca_interp/ca_interp_DUT_safe_path.vhd 
set_global_assignment -name SYSTEMVERILOG_FILE ../../rtl/ca_interp_rtl/ca_interp/ca_interp_DUT_Summer_DUC.sv
source ../../rtl/ca_interp_rtl/ca_interp/ca_interp_DUT_Summer_DUC_Poly_phase_Interp.add.tcl
source ../../rtl/ca_interp_rtl/ca_interp/ca_interp_DUT_Summer_DUC_Subsystem.add.tcl
source ../../rtl/ca_interp_rtl/ca_interp/ca_interp_DUT_Summer_DUC_Summer.add.tcl
