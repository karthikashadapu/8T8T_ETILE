# This is the Run ModelSim file list for 'prach_shortFormat_fftShift_prach_PRACH_CC'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC.sv
source $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection.dspb.do
source $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode.dspb.do
source $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_RemoveCP.dspb.do
source $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect.dspb.do
source $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv.dspb.do
source $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_VFFT.dspb.do
source $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane.dspb.do
source $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_gain.dspb.do
