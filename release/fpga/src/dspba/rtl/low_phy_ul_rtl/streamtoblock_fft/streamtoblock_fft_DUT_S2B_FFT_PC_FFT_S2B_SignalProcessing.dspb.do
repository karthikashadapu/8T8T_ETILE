# This is the Run ModelSim file list for 'streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing.sv
source $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1.dspb.do
source $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift.dspb.do
source $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXGainComp.dspb.do
source $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling.dspb.do
source $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb.dspb.do
