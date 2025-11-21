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
add wave -noupdate -format Logic /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/clk
add wave -noupdate -format Logic /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/areset
add wave -noupdate -format Logic /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/bus_clk
add wave -noupdate -format Logic /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/bus_areset
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/vin_s_stm
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/chin_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/FFTSize_s_stm 4 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/d_im_stm 29 15 signed
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/d_re_stm 29 15 signed
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/BWby10_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/TimeReference_s_stm 29 0 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/qv_s
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/qv_s_stm
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/qch_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/qch_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/q_im 16 15 signed
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/q_im_stm 16 15 signed
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/q_re 16 15 signed
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/q_re_stm 16 15 signed
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/qv139_s
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/qv139_s_stm
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/FreqBinIdx_s 14 0 signed
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/FreqBinIdx_s_stm 14 0 signed
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/vout_FFTshift_s
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/vout_FFTshift_s_stm
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/cout_FFTshift_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/cout_FFTshift_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/dout_FFTshift_im 16 15 signed
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/dout_FFTshift_im_stm 16 15 signed
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/dout_FFTshift_re 16 15 signed
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/dout_FFTshift_re_stm 16 15 signed
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/Tref_s 29 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/Tref_s_stm 29 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/busIn_address_stm 10 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/busOut_readdatavalid
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/busOut_readdata 32 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb/dut/busOut_waitrequest
TreeUpdate [SetDefaultTree]
