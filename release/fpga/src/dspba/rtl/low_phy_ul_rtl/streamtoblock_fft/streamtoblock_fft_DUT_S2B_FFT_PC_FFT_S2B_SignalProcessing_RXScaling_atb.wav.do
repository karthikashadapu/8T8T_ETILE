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
add wave -noupdate -format Logic /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/dut/clk
add wave -noupdate -format Logic /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/dut/areset
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/in_1_vin_tpl_stm
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/in_2_chin_tpl_stm 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/in_4_real_din_tpl_stm 29 15 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/in_4_imag_din_tpl_stm 29 15 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/in_3_size_tpl_stm 4 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/in_5_nsc_tpl_stm 16 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/in_6_fft_shift_tpl_stm 4 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/in_7_time_in_tpl_stm 64 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/in_8_eAxC_tpl_stm 2 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/in_9_sym_metadata_tpl_stm 64 0 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/dut/out_1_vout_tpl
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/out_1_vout_tpl_stm
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/dut/out_2_chout_tpl 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/out_2_chout_tpl_stm 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/dut/out_3_real_dout_tpl 16 12 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/out_3_real_dout_tpl_stm 16 12 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/dut/out_3_imag_dout_tpl 16 12 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/out_3_imag_dout_tpl_stm 16 12 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/dut/out_4_size_out_tpl 4 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/out_4_size_out_tpl_stm 4 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/dut/out_5_nsc_out_tpl 16 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/out_5_nsc_out_tpl_stm 16 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/dut/out_6_time_out_tpl 64 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/out_6_time_out_tpl_stm 64 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/dut/out_7_eAxCout_tpl 2 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/out_7_eAxCout_tpl_stm 2 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/dut/out_8_sym_metadataout_tpl 64 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_atb/sim/out_8_sym_metadataout_tpl_stm 64 0 unsigned
TreeUpdate [SetDefaultTree]
