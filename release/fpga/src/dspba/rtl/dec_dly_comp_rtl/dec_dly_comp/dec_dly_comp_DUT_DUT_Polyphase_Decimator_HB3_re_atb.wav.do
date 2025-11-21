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
add wave -noupdate -format Logic /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/dut/clk
add wave -noupdate -format Logic /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/dut/areset
add wave -noupdate -format Logical /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xIn_v_stm
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xIn_c_stm 8 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xIn_0_stm 16 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xIn_1_stm 16 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xIn_2_stm 16 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xIn_3_stm 16 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xIn_4_stm 16 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xIn_5_stm 16 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xIn_6_stm 16 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xIn_7_stm 16 0 signed
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/dut/xOut_v
add wave -noupdate -format Logical /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xOut_v_stm
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/dut/xOut_c 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xOut_c_stm 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/dut/xOut_0 39 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xOut_0_stm 39 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/dut/xOut_1 39 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xOut_1_stm 39 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/dut/xOut_2 39 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xOut_2_stm 39 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/dut/xOut_3 39 0 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb/sim/xOut_3_stm 39 0 signed
TreeUpdate [SetDefaultTree]
