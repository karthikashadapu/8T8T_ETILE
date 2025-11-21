# This is the Run ModelSim file list for 'LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000Filt_DEC_by_2_stage3'

if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vlog -sv -quiet $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_safe_path_msim_ver.sv
}
if {![info exist use_own_safe_path] || ![string equal -nocase $use_own_safe_path true]} {
    vcom -93 -quiet $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_safe_path_msim.vhd
}
vlog -sv -quiet $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000Filt_DEC_by_2_stage3.sv
source $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA00003_DecimatingFIR.dspb.do
source $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0002_DecimatingFIR1.dspb.do
source $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA0000_2_stage3_Scale.dspb.do
source $base_dir/LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_DECIMA00002_stage3_Scale1.dspb.do
