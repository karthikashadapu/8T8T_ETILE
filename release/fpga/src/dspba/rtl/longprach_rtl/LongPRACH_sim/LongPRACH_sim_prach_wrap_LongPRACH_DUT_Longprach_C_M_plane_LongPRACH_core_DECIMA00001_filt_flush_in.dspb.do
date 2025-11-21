# This is the Run ModelSim file list for 'LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000Stage1_filt_flush_in'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000Stage1_filt_flush_in.sv
