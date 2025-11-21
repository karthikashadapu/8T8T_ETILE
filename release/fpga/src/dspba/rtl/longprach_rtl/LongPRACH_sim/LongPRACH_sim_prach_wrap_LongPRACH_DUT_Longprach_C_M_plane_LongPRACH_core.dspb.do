# This is the Run ModelSim file list for 'LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core.sv
source $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo.dspb.do
source $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL.dspb.do
source $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMATION1.dspb.do
source $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_FFTShift.dspb.do
source $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_MIXER.dspb.do
source $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT.dspb.do
source $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT.dspb.do
