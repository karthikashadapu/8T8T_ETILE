# This is the Run ModelSim file list for 'ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap.sv
source $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Risin0000e_State_Machine.dspb.do
source $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Risin0001e_State_Machine.dspb.do
source $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Risin0002e_State_Machine.dspb.do
source $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falli0000e_State_Machine.dspb.do
source $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falli0001e_State_Machine.dspb.do
