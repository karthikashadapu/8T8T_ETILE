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
add wave -noupdate -format Logic /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/dut/clk
add wave -noupdate -format Logic /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/dut/areset
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/In_v_stm
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/In_c_stm 8 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/iIn_0_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/iIn_1_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/iIn_2_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/iIn_3_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/qIn_0_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/qIn_1_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/qIn_2_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/qIn_3_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/sIn_0_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/sIn_1_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/sIn_2_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/sIn_3_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/cIn_0_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/cIn_1_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/cIn_2_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/cIn_3_stm 16 0 signed
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/dut/qOut_0 33 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/qOut_0_stm 33 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/dut/qOut_1 33 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/qOut_1_stm 33 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/dut/qOut_2 33 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/qOut_2_stm 33 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/dut/qOut_3 33 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/qOut_3_stm 33 0 signed
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/dut/Out_v
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/Out_v_stm
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/dut/Out_c 8 0 unsigned
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/Out_c_stm 8 0 unsigned
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/dut/iOut_0 33 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/iOut_0_stm 33 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/dut/iOut_1 33 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/iOut_1_stm 33 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/dut/iOut_2 33 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/iOut_2_stm 33 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/dut/iOut_3 33 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_atb/sim/iOut_3_stm 33 0 signed
TreeUpdate [SetDefaultTree]
