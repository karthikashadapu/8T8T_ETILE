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
add wave -noupdate -format Logic /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/clk
add wave -noupdate -format Logic /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/areset
add wave -noupdate -format Logic /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/bus_clk
add wave -noupdate -format Logic /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/bus_areset
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/xIn_v_stm
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/xIn_c_stm 8 0 unsigned
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/xIn_p_0_stm 32 0 unsigned
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/xIn_p_1_stm 32 0 unsigned
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/xIn_p_2_stm 32 0 unsigned
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/xIn_p_3_stm 32 0 unsigned
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/xIn_s_0_stm
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/xIn_s_1_stm
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/xIn_s_2_stm
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/xIn_s_3_stm
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/ncoOut_v
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/ncoOut_v_stm
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/ncoOut_c 8 0 unsigned
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/ncoOut_c_stm 8 0 unsigned
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/sinOut_0 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/sinOut_0_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/sinOut_1 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/sinOut_1_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/sinOut_2 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/sinOut_2_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/sinOut_3 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/sinOut_3_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/cosOut_0 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/cosOut_0_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/cosOut_1 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/cosOut_1_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/cosOut_2 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/cosOut_2_stm 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/cosOut_3 16 0 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/cosOut_3_stm 16 0 signed
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/busOut_readdatavalid
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/busOut_readdatavalid_stm
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/dut/busOut_readdata 32 0 unsigned
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb/sim/busOut_readdata_stm 32 0 unsigned
TreeUpdate [SetDefaultTree]
