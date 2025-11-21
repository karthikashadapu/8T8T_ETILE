# This is the Run ModelSim file list for 'duc_model_DUT_ChanFilt_DUC'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/duc_model/duc_model_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/duc_model/duc_model_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC.sv
source $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1.dspb.do
source $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1.dspb.do
source $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_DUC_l1.dspb.do
