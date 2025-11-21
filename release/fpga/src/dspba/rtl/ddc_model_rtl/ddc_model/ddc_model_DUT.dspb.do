# This is the Run ModelSim file list for 'ddc_model_DUT'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/ddc_model/ddc_model_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/ddc_model/ddc_model_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/ddc_model/ddc_model_DUT.sv
source $base_dir/ddc_model/busFabric_ddc_model_DUT_2ouiflr06j68696x6u0qu5xajz.dspb.do
source $base_dir/ddc_model/ddc_model_DUT_DUT.dspb.do
