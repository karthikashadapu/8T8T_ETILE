# This is the Run ModelSim file list for 'ddc_model_DUT_DUT_DDC_l1_x_HB2'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/ddc_model/ddc_model_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/ddc_model/ddc_model_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB2.sv
source $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB2_HB2_im.dspb.do
source $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB2_HB2_re.dspb.do
source $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB2_scale_HB2_im.dspb.do
source $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB2_scale_HB2_re.dspb.do
