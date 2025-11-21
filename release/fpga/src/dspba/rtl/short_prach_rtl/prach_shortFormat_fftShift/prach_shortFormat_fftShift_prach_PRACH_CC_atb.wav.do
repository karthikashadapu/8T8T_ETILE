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
add wave -noupdate -format Logic /prach_shortFormat_fftShift_prach_PRACH_CC_atb/dut/clk
add wave -noupdate -format Logic /prach_shortFormat_fftShift_prach_PRACH_CC_atb/dut/areset
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_1_imag_din0_tpl_stm 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_1_real_din0_tpl_stm 16 15 signed
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_2_vin0_tpl_stm
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_3_chin0_tpl_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_4_SFN_tpl_stm 12 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_5_SubFN_tpl_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_6_SCSby15_tpl_stm 2 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_7_BWby10_tpl_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_8_CPLen_cplane_tpl_stm 23 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_9_timeoffset_cplane_tpl_stm 23 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_10_numsym_cplane_tpl_stm 4 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_11_slotID_cplane_tpl_stm 2 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_12_startsym_cplane_tpl_stm 4 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_13_timerefin_cplane_tpl_stm 29 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_14_cur_slot_tpl_stm 2 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_15_SubFN_cplane_tpl_stm 8 0 unsigned
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_16_cbar_mplane_sel_tpl_stm
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_17_time_offset_bias_tpl_stm 23 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_18_startsym_bias_tpl_stm 23 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_19_gain_in_re_tpl_stm 16 14 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_20_gain_in_im_tpl_stm 16 14 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl_stm 3 0 unsigned
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl_stm
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl_stm
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl_stm 12 0 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_atb/dut/out_1_qv_tpl
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/out_1_qv_tpl_stm
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/dut/out_2_qch_tpl 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/out_2_qch_tpl_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/dut/out_3_imag_q_tpl 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/out_3_imag_q_tpl_stm 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/dut/out_3_real_q_tpl 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/out_3_real_q_tpl_stm 16 15 signed
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_atb/dut/out_4_qv139_tpl
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/out_4_qv139_tpl_stm
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/dut/out_5_qFreqBinIdx_tpl 14 0 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/out_5_qFreqBinIdx_tpl_stm 14 0 signed
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_atb/dut/out_6_fftShift_v_tpl
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/out_6_fftShift_v_tpl_stm
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/dut/out_7_fftShift_c_tpl 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/out_7_fftShift_c_tpl_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/dut/out_8_imag_fftShift_d_tpl 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/out_8_imag_fftShift_d_tpl_stm 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/dut/out_8_real_fftShift_d_tpl 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/out_8_real_fftShift_d_tpl_stm 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/dut/out_9_TimeReference_tpl 29 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_atb/sim/out_9_TimeReference_tpl_stm 29 0 unsigned
TreeUpdate [SetDefaultTree]
