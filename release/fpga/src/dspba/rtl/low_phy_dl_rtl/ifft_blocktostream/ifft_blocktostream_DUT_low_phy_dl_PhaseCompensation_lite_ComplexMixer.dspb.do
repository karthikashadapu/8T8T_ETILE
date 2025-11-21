# This is the Run ModelSim file list for 'ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_ComplexMixer'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_ComplexMixer.sv
source $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_ComplexMixer_ComplexMixer.dspb.do
source $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_ComplexMixer_Scalei.dspb.do
source $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_ComplexMixer_Scaleq.dspb.do
