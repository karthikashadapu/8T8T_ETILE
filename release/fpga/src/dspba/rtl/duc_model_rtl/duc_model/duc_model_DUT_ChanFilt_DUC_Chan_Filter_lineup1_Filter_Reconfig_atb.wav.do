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
add wave -noupdate -format Logic /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/dut/clk
add wave -noupdate -format Logic /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/dut/areset
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/sim/in_2_In3_tpl_stm
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/sim/in_3_In6_tpl_stm 8 0 unsigned
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/sim/in_1_real_In1_tpl_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/sim/in_1_imag_In1_tpl_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/sim/in_4_BW_CC1_tpl_stm 8 0 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/dut/out_2_Out4_tpl
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/sim/out_2_Out4_tpl_stm
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/dut/out_3_Out6_tpl 8 0 unsigned
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/sim/out_3_Out6_tpl_stm 8 0 unsigned
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/dut/out_1_real_Out1_tpl 16 14 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/sim/out_1_real_Out1_tpl_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/dut/out_1_imag_Out1_tpl 16 14 signed
add_fixpt_wave /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/sim/out_1_imag_Out1_tpl_stm 16 14 signed
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/dut/out_4_CoefBankSel_tpl
add wave -noupdate -format Logical /duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb/sim/out_4_CoefBankSel_tpl_stm
TreeUpdate [SetDefaultTree]
