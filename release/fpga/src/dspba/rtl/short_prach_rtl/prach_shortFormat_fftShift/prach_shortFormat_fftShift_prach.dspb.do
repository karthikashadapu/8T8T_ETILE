# This is the Run ModelSim file list for 'prach_shortFormat_fftShift_prach'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach.sv
source $base_dir/prach_shortFormat_fftShift/busFabric_prach_shortFormat_fftShift_prach_3i06i3ib0063663c63o60160760uq5ux5gubo0u.dspb.do
source $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC.dspb.do
