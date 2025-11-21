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
add wave -noupdate -format Logic /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/dut/clk
add wave -noupdate -format Logic /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/dut/areset
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/sim/in_1_v_in_tpl_stm
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/sim/in_2_ch_in_tpl_stm 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/sim/in_3_real_d_in1_tpl_stm 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/sim/in_3_imag_d_in1_tpl_stm 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/sim/in_4_d_in2_tpl_stm 18 17 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/sim/in_5_d_in3_tpl_stm 18 17 signed
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/dut/out_1_v_out_tpl
add wave -noupdate -format Logical /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/sim/out_1_v_out_tpl_stm
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/dut/out_2_ch_out_tpl 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/sim/out_2_ch_out_tpl_stm 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/dut/out_3_real_d_out1_tpl 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/sim/out_3_real_d_out1_tpl_stm 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/dut/out_3_imag_d_out1_tpl 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/sim/out_3_imag_d_out1_tpl_stm 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/dut/out_4_d_out2_tpl 18 17 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/sim/out_4_d_out2_tpl_stm 18 17 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/dut/out_5_d_out3_tpl 18 17 signed
add_fixpt_wave /streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe_atb/sim/out_5_d_out3_tpl_stm 18 17 signed
TreeUpdate [SetDefaultTree]
