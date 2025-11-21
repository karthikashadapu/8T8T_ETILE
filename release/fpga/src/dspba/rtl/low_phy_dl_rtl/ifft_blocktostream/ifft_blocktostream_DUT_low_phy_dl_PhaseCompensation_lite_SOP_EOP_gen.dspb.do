# This is the Run ModelSim file list for 'ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen.sv
source $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_Rising_edge0000e_State_Machine.dspb.do
source $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_falling_edg0000e_State_Machine.dspb.do
