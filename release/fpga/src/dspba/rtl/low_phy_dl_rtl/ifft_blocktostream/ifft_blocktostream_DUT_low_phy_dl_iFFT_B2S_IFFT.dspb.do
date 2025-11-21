# This is the Run ModelSim file list for 'ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT.sv
source $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch.dspb.do
source $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT.dspb.do
