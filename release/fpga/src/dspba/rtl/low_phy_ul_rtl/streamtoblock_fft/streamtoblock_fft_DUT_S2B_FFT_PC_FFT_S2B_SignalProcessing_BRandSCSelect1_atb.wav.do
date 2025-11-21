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
add wave -noupdate -format Logic /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/clk
add wave -noupdate -format Logic /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/areset
add wave -noupdate -format Logic /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/bus_clk
add wave -noupdate -format Logic /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/bus_areset
add wave -noupdate -format Logical /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/v_s_stm
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/c_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/x_im_stm 16 12 signed
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/x_re_stm 16 12 signed
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/FFTSize_s_stm 4 0 unsigned
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/NSubCarr_s_stm 16 0 unsigned
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/time_in_s_stm 64 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/DC_SC_EN_s_stm
add wave -noupdate -format Logical /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/ripple_comp_en_s_stm
add wave -noupdate -format Logical /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/rc_bw_sel_s_stm
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/eAxC_s_stm 2 0 unsigned
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/metadata_in_s_stm 64 0 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/qv_s
add wave -noupdate -format Logical /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/qv_s_stm
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/qc_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/qc_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/q_im 16 11 signed
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/q_im_stm 16 11 signed
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/q_re 16 11 signed
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/q_re_stm 16 11 signed
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/qsizeout_s 4 0 unsigned
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/qsizeout_s_stm 4 0 unsigned
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/time_out_s 64 0 unsigned
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/time_out_s_stm 64 0 unsigned
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/eAxC_out_s 2 0 unsigned
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/eAxC_out_s_stm 2 0 unsigned
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/meatadata_sym_out_s 64 0 unsigned
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/meatadata_sym_out_s_stm 64 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/busOut_readdatavalid
add_fixpt_wave /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/busOut_readdata 32 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb/dut/busOut_waitrequest
TreeUpdate [SetDefaultTree]
