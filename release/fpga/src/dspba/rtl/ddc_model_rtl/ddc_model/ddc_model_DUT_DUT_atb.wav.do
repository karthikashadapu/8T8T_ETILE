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
add wave -noupdate -format Logic /ddc_model_DUT_DUT_atb/dut/clk
add wave -noupdate -format Logic /ddc_model_DUT_DUT_atb/dut/areset
add wave -noupdate -format Logic /ddc_model_DUT_DUT_atb/dut/bus_clk
add wave -noupdate -format Logic /ddc_model_DUT_DUT_atb/dut/bus_areset
add wave -noupdate -format Logical /ddc_model_DUT_DUT_atb/sim/in_1_In_v_tpl_stm
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_2_In_c_tpl_stm 8 0 unsigned
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_3_0_imag_In_d_tpl_stm 32 27 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_3_0_real_In_d_tpl_stm 32 27 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_3_1_imag_In_d_tpl_stm 32 27 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_3_1_real_In_d_tpl_stm 32 27 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_3_2_imag_In_d_tpl_stm 32 27 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_3_2_real_In_d_tpl_stm 32 27 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_3_3_imag_In_d_tpl_stm 32 27 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_3_3_real_In_d_tpl_stm 32 27 signed
add wave -noupdate -format Logical /ddc_model_DUT_DUT_atb/sim/in_4_0_sync_tpl_stm
add wave -noupdate -format Logical /ddc_model_DUT_DUT_atb/sim/in_4_1_sync_tpl_stm
add wave -noupdate -format Logical /ddc_model_DUT_DUT_atb/sim/in_4_2_sync_tpl_stm
add wave -noupdate -format Logical /ddc_model_DUT_DUT_atb/sim/in_4_3_sync_tpl_stm
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_5_BW_config_CC1_tpl_stm 8 0 unsigned
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_6_0_imag_In_Const_tpl_stm 32 27 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_6_0_real_In_Const_tpl_stm 32 27 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_6_1_imag_In_Const_tpl_stm 32 27 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_6_1_real_In_Const_tpl_stm 32 27 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_6_2_imag_In_Const_tpl_stm 32 27 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_6_2_real_In_Const_tpl_stm 32 27 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_6_3_imag_In_Const_tpl_stm 32 27 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/in_6_3_real_In_Const_tpl_stm 32 27 signed
add wave -noupdate -format Logical /ddc_model_DUT_DUT_atb/sim/in_7_In_Sel_tpl_stm
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /ddc_model_DUT_DUT_atb/dut/out_1_imag_q1_tpl 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/out_1_imag_q1_tpl_stm 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/dut/out_1_real_q1_tpl 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/out_1_real_q1_tpl_stm 16 14 signed
add wave -noupdate -format Logical /ddc_model_DUT_DUT_atb/dut/out_2_q_v1_tpl
add wave -noupdate -format Logical /ddc_model_DUT_DUT_atb/sim/out_2_q_v1_tpl_stm
add_fixpt_wave /ddc_model_DUT_DUT_atb/dut/out_3_q_c1_tpl 8 0 unsigned
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/out_3_q_c1_tpl_stm 8 0 unsigned
add_fixpt_wave /ddc_model_DUT_DUT_atb/dut/out_4_0_imag_mixer_l1_dout_tpl 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/out_4_0_imag_mixer_l1_dout_tpl_stm 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/dut/out_4_0_real_mixer_l1_dout_tpl 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/out_4_0_real_mixer_l1_dout_tpl_stm 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/dut/out_4_1_imag_mixer_l1_dout_tpl 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/out_4_1_imag_mixer_l1_dout_tpl_stm 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/dut/out_4_1_real_mixer_l1_dout_tpl 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/out_4_1_real_mixer_l1_dout_tpl_stm 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/dut/out_4_2_imag_mixer_l1_dout_tpl 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/out_4_2_imag_mixer_l1_dout_tpl_stm 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/dut/out_4_2_real_mixer_l1_dout_tpl 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/out_4_2_real_mixer_l1_dout_tpl_stm 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/dut/out_4_3_imag_mixer_l1_dout_tpl 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/out_4_3_imag_mixer_l1_dout_tpl_stm 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/dut/out_4_3_real_mixer_l1_dout_tpl 16 14 signed
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/out_4_3_real_mixer_l1_dout_tpl_stm 16 14 signed
add wave -noupdate -format Logical /ddc_model_DUT_DUT_atb/dut/out_5_mixer_l1_vout_tpl
add wave -noupdate -format Logical /ddc_model_DUT_DUT_atb/sim/out_5_mixer_l1_vout_tpl_stm
add_fixpt_wave /ddc_model_DUT_DUT_atb/dut/out_6_mixer_l1_cout_tpl 8 0 unsigned
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/out_6_mixer_l1_cout_tpl_stm 8 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /ddc_model_DUT_DUT_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /ddc_model_DUT_DUT_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /ddc_model_DUT_DUT_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /ddc_model_DUT_DUT_atb/dut/busOut_readdatavalid
add_fixpt_wave /ddc_model_DUT_DUT_atb/dut/busOut_readdata 32 0 unsigned
TreeUpdate [SetDefaultTree]
