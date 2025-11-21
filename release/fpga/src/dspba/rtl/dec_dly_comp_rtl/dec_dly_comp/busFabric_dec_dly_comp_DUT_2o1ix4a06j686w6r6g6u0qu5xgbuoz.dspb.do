# This is the Run ModelSim file list for 'busFabric_dec_dly_comp_DUT_2o1ix4a06j686w6r6g6u0qu5xgbuoz'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/dec_dly_comp/dec_dly_comp_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/dec_dly_comp/dec_dly_comp_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/dec_dly_comp/busFabric_dec_dly_comp_DUT_2o1ix4a06j686w6r6g6u0qu5xgbuoz.sv
