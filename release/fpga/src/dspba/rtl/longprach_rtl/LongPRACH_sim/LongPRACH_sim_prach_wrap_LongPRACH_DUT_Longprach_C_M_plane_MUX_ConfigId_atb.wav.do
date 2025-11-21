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
add wave -noupdate -format Logic /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/dut/clk
add wave -noupdate -format Logic /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/dut/areset
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_2_vin0_tpl_stm
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_3_chin0_tpl_stm 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_1_real_din0_tpl_stm 16 14 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_1_imag_din0_tpl_stm 16 14 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_7_cp_len_tpl_stm 21 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_8_offset_tpl_stm 21 0 unsigned
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_9_c_m_plane_sel_tpl_stm
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_10_prach_tech_tpl_stm
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_11_prcah_sym_start_tpl_stm 16 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_12_prcah_sym_end_tpl_stm 19 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_13_prach_out_start_tpl_stm 7 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_14_prach_out_end_tpl_stm 10 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_5_SubFrame_tpl_stm 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_6_prach_config_index_tpl_stm 16 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_4_SFN_tpl_stm 12 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_15_start_sym_tpl_stm 4 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_16_Subframe_cplane_tpl_stm 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/in_17_SFN_cplane_tpl_stm 12 0 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/dut/out_2_vout_tpl
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/out_2_vout_tpl_stm
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/dut/out_3_cout_tpl 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/out_3_cout_tpl_stm 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/dut/out_1_real_dout_tpl 16 14 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/out_1_real_dout_tpl_stm 16 14 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/dut/out_1_imag_dout_tpl 16 14 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/out_1_imag_dout_tpl_stm 16 14 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/dut/out_4_TimeReference_tpl 32 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/out_4_TimeReference_tpl_stm 32 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/dut/out_5_cp_start_tpl 22 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/out_5_cp_start_tpl_stm 22 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/dut/out_6_gt_end_tpl 23 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/out_6_gt_end_tpl_stm 23 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/dut/out_7_prach_outstart_tpl 7 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/out_7_prach_outstart_tpl_stm 7 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/dut/out_8_prach_outend_tpl 10 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb/sim/out_8_prach_outend_tpl_stm 10 0 unsigned
TreeUpdate [SetDefaultTree]
