onerror {resume}

# obtain Modelsim version and extract the NN.Nc part after vsim
quietly set vsim_ver [regexp -inline {vsim (\d+\.\d+)(\w?)} [vsim -version]]
quietly set has_fixpt_radix 0
if {[lindex $vsim_ver 1] == 10.2} {
    if {[lindex $vsim_ver 2] >= "d"} {
        quietly set has_fixpt_radix 1
    }
} elseif {[lindex $vsim_ver 1] > 10.2} {
    quietly set has_fixpt_radix 1
}

proc add_fixpt_wave {name width frac_width signed} {
    global has_fixpt_radix
    if {$frac_width > 0 && $has_fixpt_radix} {
        set type "[string index $signed 0]fix${width}_En${frac_width}"
        if {[lsearch [radix names] $type] < 0} {
            if {$signed == "signed"} {
                radix define $type -fixed -signed -fraction $frac_width
            } else {
                radix define $type -fixed -fraction $frac_width
            }
        }
        add wave -noupdate -format Literal -radix $type $name
    } else {
        add wave -noupdate -format Literal -radix $signed $name
    }
}

add wave -noupdate -divider {Input Ports}
add wave -noupdate -format Logic /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/dut/clk
add wave -noupdate -format Logic /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/dut/areset
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/sim/in_1_imag_din_tpl_stm 16 14 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/sim/in_1_real_din_tpl_stm 16 14 signed
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/sim/in_2_vin_tpl_stm
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/sim/in_3_cin_tpl_stm 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/sim/in_4_cp_start_tpl_stm 22 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/sim/in_5_gt_end_tpl_stm 23 0 unsigned
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/sim/in_6_filt_flush_en_tpl_stm
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/dut/out_1_imag_dout_tpl 16 14 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/sim/out_1_imag_dout_tpl_stm 16 14 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/dut/out_1_real_dout_tpl 16 14 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/sim/out_1_real_dout_tpl_stm 16 14 signed
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/dut/out_2_vout_tpl
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/sim/out_2_vout_tpl_stm
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/dut/out_3_cout_tpl 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/sim/out_3_cout_tpl_stm 8 0 unsigned
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/dut/out_4_filt_flush_tpl
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/sim/out_4_filt_flush_tpl_stm
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/dut/out_5_sync_out_tpl
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_atb/sim/out_5_sync_out_tpl_stm
TreeUpdate [SetDefaultTree]
