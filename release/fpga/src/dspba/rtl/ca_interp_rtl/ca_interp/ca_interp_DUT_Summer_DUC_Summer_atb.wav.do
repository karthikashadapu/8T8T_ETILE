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
add wave -noupdate -format Logic /ca_interp_DUT_Summer_DUC_Summer_atb/dut/clk
add wave -noupdate -format Logic /ca_interp_DUT_Summer_DUC_Summer_atb/dut/areset
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_1_0_imag_d1_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_1_0_real_d1_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_1_1_imag_d1_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_1_1_real_d1_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_1_2_imag_d1_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_1_2_real_d1_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_1_3_imag_d1_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_1_3_real_d1_tpl_stm 16 14 signed
add wave -noupdate -format Logical /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_2_v1_tpl_stm
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_3_c1_tpl_stm 8 0 unsigned
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_4_0_imag_d2_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_4_0_real_d2_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_4_1_imag_d2_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_4_1_real_d2_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_4_2_imag_d2_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_4_2_real_d2_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_4_3_imag_d2_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_4_3_real_d2_tpl_stm 16 14 signed
add wave -noupdate -format Logical /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_5_v2_tpl_stm
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_6_c2_tpl_stm 8 0 unsigned
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl_stm 16 13 unsigned
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl_stm 16 13 unsigned
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl_stm 16 13 unsigned
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl_stm 16 13 unsigned
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl_stm 8 0 unsigned
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl_stm 8 0 unsigned
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl_stm 8 0 unsigned
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl_stm 8 0 unsigned
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl_stm 8 0 unsigned
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl_stm 8 0 unsigned
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl_stm 8 0 unsigned
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl_stm 8 0 unsigned
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/dut/out_1_0_imag_alt_data1_tpl 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/out_1_0_imag_alt_data1_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/dut/out_1_0_real_alt_data1_tpl 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/out_1_0_real_alt_data1_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/dut/out_1_1_imag_alt_data1_tpl 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/out_1_1_imag_alt_data1_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/dut/out_1_1_real_alt_data1_tpl 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/out_1_1_real_alt_data1_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/dut/out_1_2_imag_alt_data1_tpl 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/out_1_2_imag_alt_data1_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/dut/out_1_2_real_alt_data1_tpl 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/out_1_2_real_alt_data1_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/dut/out_1_3_imag_alt_data1_tpl 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/out_1_3_imag_alt_data1_tpl_stm 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/dut/out_1_3_real_alt_data1_tpl 16 14 signed
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/out_1_3_real_alt_data1_tpl_stm 16 14 signed
add wave -noupdate -format Logical /ca_interp_DUT_Summer_DUC_Summer_atb/dut/out_2_alt_v1_tpl
add wave -noupdate -format Logical /ca_interp_DUT_Summer_DUC_Summer_atb/sim/out_2_alt_v1_tpl_stm
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/dut/out_3_alt_c1_tpl 8 0 unsigned
add_fixpt_wave /ca_interp_DUT_Summer_DUC_Summer_atb/sim/out_3_alt_c1_tpl_stm 8 0 unsigned
TreeUpdate [SetDefaultTree]
