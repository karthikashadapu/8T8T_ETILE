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
add wave -noupdate -format Logic /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/clk
add wave -noupdate -format Logic /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/areset
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_1_0_imag_din_a1_tpl_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_1_0_real_din_a1_tpl_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_1_1_imag_din_a1_tpl_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_1_1_real_din_a1_tpl_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_1_2_imag_din_a1_tpl_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_1_2_real_din_a1_tpl_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_1_3_imag_din_a1_tpl_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_1_3_real_din_a1_tpl_stm 16 14 signed
add wave -noupdate -format Logical /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_2_vin_a1_tpl_stm
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_3_cin_a1_tpl_stm 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl_stm 16 13 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl_stm 16 13 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl_stm 16 13 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl_stm 16 13 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl_stm 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl_stm 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl_stm 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl_stm 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl_stm 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl_stm 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl_stm 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl_stm 8 0 unsigned
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_1_0_imag_altq_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_1_0_imag_altq_tpl_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_1_0_real_altq_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_1_0_real_altq_tpl_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_1_1_imag_altq_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_1_1_imag_altq_tpl_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_1_1_real_altq_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_1_1_real_altq_tpl_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_1_2_imag_altq_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_1_2_imag_altq_tpl_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_1_2_real_altq_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_1_2_real_altq_tpl_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_1_3_imag_altq_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_1_3_imag_altq_tpl_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_1_3_real_altq_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_1_3_real_altq_tpl_stm 32 27 signed
add wave -noupdate -format Logical /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_2_altv_tpl
add wave -noupdate -format Logical /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_2_altv_tpl_stm
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_3_altc_tpl 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_3_altc_tpl_stm 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_4_0_imag_altq1_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_4_0_imag_altq1_tpl_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_4_0_real_altq1_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_4_0_real_altq1_tpl_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_4_1_imag_altq1_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_4_1_imag_altq1_tpl_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_4_1_real_altq1_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_4_1_real_altq1_tpl_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_4_2_imag_altq1_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_4_2_imag_altq1_tpl_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_4_2_real_altq1_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_4_2_real_altq1_tpl_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_4_3_imag_altq1_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_4_3_imag_altq1_tpl_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_4_3_real_altq1_tpl 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_4_3_real_altq1_tpl_stm 32 27 signed
add wave -noupdate -format Logical /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_5_altv1_tpl
add wave -noupdate -format Logical /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_5_altv1_tpl_stm
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/dut/out_6_altc1_tpl 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb/sim/out_6_altc1_tpl_stm 8 0 unsigned
TreeUpdate [SetDefaultTree]
