# This is the Run ModelSim file list for 'streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer.sv
