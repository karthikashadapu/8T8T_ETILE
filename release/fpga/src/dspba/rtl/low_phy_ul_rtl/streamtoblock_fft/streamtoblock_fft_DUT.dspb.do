# This is the Run ModelSim file list for 'streamtoblock_fft_DUT'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/streamtoblock_fft/streamtoblock_fft_DUT.sv
source $base_dir/streamtoblock_fft/busFabric_streamtoblock_fft_DUT_2ouisy506j6x6m6b6u0qu5xajz.dspb.do
source $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC.dspb.do
