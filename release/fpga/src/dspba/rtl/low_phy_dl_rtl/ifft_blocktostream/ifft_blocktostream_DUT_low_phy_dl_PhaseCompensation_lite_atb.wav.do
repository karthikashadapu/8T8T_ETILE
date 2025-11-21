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
add wave -noupdate -format Logic /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/clk
add wave -noupdate -format Logic /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/areset
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_1_v_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_2_c_tpl_stm 8 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_3_imag_d1_tpl_stm 16 15 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_3_real_d1_tpl_stm 16 15 signed
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_4_CP_EN1_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_5_fft_size_tpl_stm 4 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_6_CPLen_tpl_stm 11 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_7_nsc_tpl_stm 12 0 unsigned
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_8_eAxC_tpl_stm
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_9_sym_metadata_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_10_timerefin_tpl_stm 64 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl_stm 32 0 unsigned
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl_stm 32 0 unsigned
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl_stm
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/out_1_imag_dout1_tpl 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/out_1_imag_dout1_tpl_stm 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/out_1_real_dout1_tpl 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/out_1_real_dout1_tpl_stm 16 14 signed
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/out_2_vout_tpl
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/out_2_vout_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/out_3_cout_tpl 8 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/out_3_cout_tpl_stm 8 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/out_4_fft_size_out_tpl 4 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/out_4_fft_size_out_tpl_stm 4 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/out_5_CPLenout_tpl 11 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/out_5_CPLenout_tpl_stm 11 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/out_6_nsc_out_tpl 12 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/out_6_nsc_out_tpl_stm 12 0 unsigned
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/out_7_eAxCout_tpl
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/out_7_eAxCout_tpl_stm
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/out_8_sym_metadataout_tpl
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/out_8_sym_metadataout_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/out_9_timeref_out_tpl 64 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/out_9_timeref_out_tpl_stm 64 0 unsigned
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/out_10_eop_eAxC_tpl
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/out_10_eop_eAxC_tpl_stm
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/out_11_eop_sym_tpl
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/out_11_eop_sym_tpl_stm
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/out_12_sop_eAxC_tpl
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/out_12_sop_eAxC_tpl_stm
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/dut/out_13_sop_sym_tpl
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_atb/sim/out_13_sop_sym_tpl_stm
TreeUpdate [SetDefaultTree]
