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
add wave -noupdate -format Logic /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/dut/clk
add wave -noupdate -format Logic /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/dut/areset
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/sim/in_1_v_in_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/sim/in_2_c_in_tpl_stm 8 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/sim/in_3_imag_q_in_tpl_stm 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/sim/in_3_real_q_in_tpl_stm 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/sim/in_4_sizein_tpl_stm 4 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/sim/in_5_cplen_tpl_stm 11 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/sim/in_6_nprb_tpl_stm 12 0 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/dut/out_1_vout1_tpl
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/sim/out_1_vout1_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/dut/out_2_cout1_tpl 2 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/sim/out_2_cout1_tpl_stm 2 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/dut/out_3_imag_dout1_tpl 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/sim/out_3_imag_dout1_tpl_stm 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/dut/out_3_real_dout1_tpl 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_atb/sim/out_3_real_dout1_tpl_stm 16 14 signed
TreeUpdate [SetDefaultTree]
