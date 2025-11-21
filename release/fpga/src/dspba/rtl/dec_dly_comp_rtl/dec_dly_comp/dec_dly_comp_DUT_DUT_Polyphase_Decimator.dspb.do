# This is the Run ModelSim file list for 'dec_dly_comp_DUT_DUT_Polyphase_Decimator'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/dec_dly_comp/dec_dly_comp_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/dec_dly_comp/dec_dly_comp_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/dec_dly_comp/dec_dly_comp_DUT_DUT_Polyphase_Decimator.sv
source $base_dir/dec_dly_comp/dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_im.dspb.do
source $base_dir/dec_dly_comp/dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re.dspb.do
source $base_dir/dec_dly_comp/dec_dly_comp_DUT_DUT_Polyphase_Decimator_scale_HB3_im.dspb.do
source $base_dir/dec_dly_comp/dec_dly_comp_DUT_DUT_Polyphase_Decimator_scale_HB3_re.dspb.do
