# This is the Run ModelSim file list for 'duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/duc_model/duc_model_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/duc_model/duc_model_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter.sv
source $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_Scale.dspb.do
source $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_Scale1.dspb.do
source $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im.dspb.do
source $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re.dspb.do
