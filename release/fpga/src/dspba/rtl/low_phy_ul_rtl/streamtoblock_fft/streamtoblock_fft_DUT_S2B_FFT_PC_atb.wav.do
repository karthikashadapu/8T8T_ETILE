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
add wave -noupdate -format Logic /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/clk
add wave -noupdate -format Logic /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/areset
add wave -noupdate -format Logic /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/bus_clk
add wave -noupdate -format Logic /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/bus_areset
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_1_rx_vin1_tpl_stm
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_2_rx_chin1_tpl_stm 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_3_imag_rx_din1_tpl_stm 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_3_real_rx_din1_tpl_stm 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_4_fft_in1_tpl_stm 4 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_5_cp_in1_tpl_stm 16 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_6_nprb1_tpl_stm 16 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_7_hcs_bypass_l1_tpl_stm
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_8_fft_gain_l1_tpl_stm 16 14 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_9_fft_gain_im_l1_tpl_stm 16 14 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_10_fft_shift_l1_tpl_stm 4 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_11_time_ref_in1_tpl_stm 64 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_12_DC_SC_EN_tpl_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_13_CP_EN1_tpl_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_14_ripple_comp_en_tpl_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_15_rc_bw_sel_tpl_stm
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_16_sym_metadata_in_tpl_stm 64 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_17_sym_metadata_in_valid_tpl_stm
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl_stm 32 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl_stm
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl_stm 32 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl_stm
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm 16 15 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm 16 15 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_1_rx_valid_tpl
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_1_rx_valid_tpl_stm
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_2_rx_chout_tpl 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_2_rx_chout_tpl_stm 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_3_imag_rx_dout_tpl 16 11 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_3_imag_rx_dout_tpl_stm 16 11 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_3_real_rx_dout_tpl 16 11 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_3_real_rx_dout_tpl_stm 16 11 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_4_rx_time_out_tpl 64 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_4_rx_time_out_tpl_stm 64 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_5_td_fft_in_v_tpl
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_5_td_fft_in_v_tpl_stm
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_6_td_fft_in_chout_tpl 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_6_td_fft_in_chout_tpl_stm 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_7_imag_td_fft_in_d_tpl 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_7_imag_td_fft_in_d_tpl_stm 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_7_real_td_fft_in_d_tpl 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_7_real_td_fft_in_d_tpl_stm 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_8_nsc_out_tpl 16 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_8_nsc_out_tpl_stm 16 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_9_size_out_tpl 4 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_9_size_out_tpl_stm 4 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_10_td_time_out_tpl 64 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_10_td_time_out_tpl_stm 64 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_11_fd_data_v_tpl
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_11_fd_data_v_tpl_stm
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_12_fd_data_c_tpl 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_12_fd_data_c_tpl_stm 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_13_imag_fd_data_q_tpl 16 12 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_13_imag_fd_data_q_tpl_stm 16 12 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_13_real_fd_data_q_tpl 16 12 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_13_real_fd_data_q_tpl_stm 16 12 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_14_eAxCout_tpl 2 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_14_eAxCout_tpl_stm 2 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_15_symmetadataout_tpl 64 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_15_symmetadataout_tpl_stm 64 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_16_eop_eAxC_tpl
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_16_eop_eAxC_tpl_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_17_eop_sym_tpl
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_17_eop_sym_tpl_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_18_sop_eAxC_tpl
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_18_sop_eAxC_tpl_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_19_sop_sym_tpl
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_19_sop_sym_tpl_stm
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl 12 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm 12 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl 12 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm 12 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl 16 15 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm 16 15 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl 16 15 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm 16 15 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/busOut_readdatavalid
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_atb/dut/busOut_readdata 32 0 unsigned
TreeUpdate [SetDefaultTree]
