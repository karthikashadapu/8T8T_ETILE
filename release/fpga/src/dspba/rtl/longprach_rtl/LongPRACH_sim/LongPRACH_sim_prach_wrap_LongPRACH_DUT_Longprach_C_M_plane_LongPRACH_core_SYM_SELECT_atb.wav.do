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
add wave -noupdate -format Logic /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/dut/clk
add wave -noupdate -format Logic /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/dut/areset
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/in_2_vin_tpl_stm
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/in_3_chin_tpl_stm 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/in_1_real_din_tpl_stm 16 8 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/in_1_imag_din_tpl_stm 16 8 signed
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/in_4_TimeRef_tpl_stm
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/in_5_prach_outstart_tpl_stm 7 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/in_6_prach_outend_tpl_stm 10 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/in_7_ch0_info_tpl_stm 16 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/in_8_ch1_info_tpl_stm 16 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/in_9_ch2_info_tpl_stm 16 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/in_10_ch3_info_tpl_stm 16 0 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/dut/out_2_vout_tpl
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/out_2_vout_tpl_stm
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/dut/out_3_cout_tpl 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/out_3_cout_tpl_stm 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/dut/out_1_real_dout_tpl 16 8 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/out_1_real_dout_tpl_stm 16 8 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/dut/out_1_imag_dout_tpl 16 8 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/out_1_imag_dout_tpl_stm 16 8 signed
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/dut/out_4_TimeReference_tpl
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/out_4_TimeReference_tpl_stm
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/dut/out_5_ch_info_tpl 16 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_atb/sim/out_5_ch_info_tpl_stm 16 0 unsigned
TreeUpdate [SetDefaultTree]
