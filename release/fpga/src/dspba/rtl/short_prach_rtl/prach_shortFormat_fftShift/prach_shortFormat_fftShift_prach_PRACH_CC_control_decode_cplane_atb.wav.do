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
add wave -noupdate -format Logic /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/dut/clk
add wave -noupdate -format Logic /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/dut/areset
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_2_vin_tpl_stm
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_3_chin_tpl_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_1_real_din_tpl_stm 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_1_imag_din_tpl_stm 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_4_CPLen_cplane_tpl_stm 23 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_5_timeoffset_cplane_tpl_stm 23 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_6_numsym_cplane_tpl_stm 4 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_7_slotID_cplane_tpl_stm 2 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_8_startsym_cplane_tpl_stm 4 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_9_TimeReference_tpl_stm 29 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_10_cur_SubFN_tpl_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_11_cur_slot_tpl_stm 2 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_12_SubFN_cplane_tpl_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_13_time_offset_bias_tpl_stm 23 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_14_startsym_bias_tpl_stm 23 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/in_15_SFN_tpl_stm 12 0 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/dut/out_1_vout_tpl
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/out_1_vout_tpl_stm
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/dut/out_2_cout_tpl 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/out_2_cout_tpl_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/dut/out_3_real_dout_tpl 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/out_3_real_dout_tpl_stm 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/dut/out_3_imag_dout_tpl 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/out_3_imag_dout_tpl_stm 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/dut/out_4_qFFTSize_tpl 4 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/out_4_qFFTSize_tpl_stm 4 0 unsigned
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/dut/out_5_qSOP_tpl
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/out_5_qSOP_tpl_stm
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/dut/out_6_qBWby10_tpl 4 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/out_6_qBWby10_tpl_stm 4 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/dut/out_7_T_ref_tpl 29 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/out_7_T_ref_tpl_stm 29 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/dut/out_8_qNFFT_tpl 4 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/out_8_qNFFT_tpl_stm 4 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/dut/out_9_CPLen_tpl 26 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane_atb/sim/out_9_CPLen_tpl_stm 26 0 unsigned
TreeUpdate [SetDefaultTree]
