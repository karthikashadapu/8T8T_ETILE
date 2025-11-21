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
add wave -noupdate -format Logic /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/clk
add wave -noupdate -format Logic /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/areset
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/in_1_valid_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/in_2_ch_tpl_stm 8 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/in_3_real_data_tpl_stm 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/in_3_imag_data_tpl_stm 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/in_4_FFTSize_tpl_stm 4 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/in_5_NSubCarr_tpl_stm 12 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/in_6_cplen_tpl_stm 11 0 unsigned
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/in_7_DC_SC_EN1_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/in_8_iftgain_real_tpl_stm 16 14 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/in_9_ifftgain_imag_tpl_stm 16 14 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/in_10_ifftshift_tpl_stm 4 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/in_11_ifft_mux_const_data_tpl_stm 16 15 signed
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/in_12_muxsel_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/in_13_time_in_tpl_stm 64 0 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/out_1_qvalid_tpl
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/out_1_qvalid_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/out_2_qchannel_tpl 8 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/out_2_qchannel_tpl_stm 8 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/out_3_real_qdata_tpl 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/out_3_real_qdata_tpl_stm 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/out_3_imag_qdata_tpl 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/out_3_imag_qdata_tpl_stm 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/out_4_qfftsize_tpl 4 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/out_4_qfftsize_tpl_stm 4 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/out_5_q_nprb_tpl 12 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/out_5_q_nprb_tpl_stm 12 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/out_6_qcplen_tpl 11 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/out_6_qcplen_tpl_stm 11 0 unsigned
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/out_7_q_dc_sc_en_tpl
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/out_7_q_dc_sc_en_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/out_8_qfft_gain_real_tpl 16 14 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/out_8_qfft_gain_real_tpl_stm 16 14 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/out_9_qf_ift_gain_imag_tpl 16 14 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/out_9_qf_ift_gain_imag_tpl_stm 16 14 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/out_10_q_ifftshift_tpl 4 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/out_10_q_ifftshift_tpl_stm 4 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/out_11_q_ifft_mux_const_data_tpl 16 15 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/out_11_q_ifft_mux_const_data_tpl_stm 16 15 signed
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/out_12_q_muxsel_tpl
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/out_12_q_muxsel_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/dut/out_13_time_out_tpl 64 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb/sim/out_13_time_out_tpl_stm 64 0 unsigned
TreeUpdate [SetDefaultTree]
