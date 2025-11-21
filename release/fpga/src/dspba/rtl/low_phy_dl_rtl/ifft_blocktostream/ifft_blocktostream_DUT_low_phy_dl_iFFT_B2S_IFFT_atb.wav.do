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
add wave -noupdate -format Logic /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/clk
add wave -noupdate -format Logic /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/areset
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_1_imag_data1_tpl_stm 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_1_real_data1_tpl_stm 16 14 signed
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_2_valid1_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_3_channel1_tpl_stm 8 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_4_size1_tpl_stm 4 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_5_cplen1_tpl_stm 11 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_6_nsc1_tpl_stm 12 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_7_ifft_gain_re_l1_tpl_stm 16 14 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_8_ifft_gain_im_l1_tpl_stm 16 14 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_9_ifft_shift_l1_tpl_stm 4 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_10_ifft_mux_const_l1_tpl_stm 16 15 signed
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_11_muxsel_l1_tpl_stm
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_12_DC_SC_EN_tpl_stm
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_13_ripple_comp_en_tpl_stm
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_14_rc_bw_sel_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_15_time_in_tpl_stm 64 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm 16 15 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm 16 15 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_1_vout1_tpl
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_1_vout1_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_2_cout1_tpl 8 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_2_cout1_tpl_stm 8 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_3_imag_dout1_tpl 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_3_imag_dout1_tpl_stm 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_3_real_dout1_tpl 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_3_real_dout1_tpl_stm 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_4_sizeout1_tpl 4 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_4_sizeout1_tpl_stm 4 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_5_cpout1_tpl 11 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_5_cpout1_tpl_stm 11 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_6_nprb_tpl 12 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_6_nprb_tpl_stm 12 0 unsigned
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_7_fd_data_v_tpl
add wave -noupdate -format Logical /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_7_fd_data_v_tpl_stm
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_8_fd_data_c_tpl 8 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_8_fd_data_c_tpl_stm 8 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_9_imag_fd_data_q_tpl 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_9_imag_fd_data_q_tpl_stm 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_9_real_fd_data_q_tpl 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_9_real_fd_data_q_tpl_stm 16 14 signed
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_10_fd_time_out_tpl 64 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_10_fd_time_out_tpl_stm 64 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl 12 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm 12 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl 12 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm 12 0 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl 16 15 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm 16 15 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/dut/out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl 16 15 unsigned
add_fixpt_wave /ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_atb/sim/out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm 16 15 unsigned
TreeUpdate [SetDefaultTree]
