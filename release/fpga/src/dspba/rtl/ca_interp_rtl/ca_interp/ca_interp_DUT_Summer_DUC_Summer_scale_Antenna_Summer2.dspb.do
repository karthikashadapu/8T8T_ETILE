# This is the Run ModelSim file list for 'ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer2'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/ca_interp/ca_interp_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/ca_interp/ca_interp_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/ca_interp/ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer2.sv
