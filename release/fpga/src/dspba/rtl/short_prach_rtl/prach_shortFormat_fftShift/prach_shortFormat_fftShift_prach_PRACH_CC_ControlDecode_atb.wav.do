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
add wave -noupdate -format Logic /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/clk
add wave -noupdate -format Logic /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/areset
add wave -noupdate -format Logic /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/bus_clk
add wave -noupdate -format Logic /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/bus_areset
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/din_im_stm 16 15 signed
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/din_re_stm 16 15 signed
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/vin_s_stm
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/chin_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/SFN_s_stm 12 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/SubFN_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/SCSby15_s_stm 2 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/BWby10_s_stm 8 0 unsigned
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/dout_im 16 15 signed
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/dout_im_stm 16 15 signed
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/dout_re 16 15 signed
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/dout_re_stm 16 15 signed
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/vout_s
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/vout_s_stm
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/cout_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/cout_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/CPLen_s 23 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/CPLen_s_stm 23 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/FFTSize_s 4 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/FFTSize_s_stm 4 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/NFFTs_s 4 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/NFFTs_s_stm 4 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/SOP_s
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/SOP_s_stm
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/qBWby10_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/qBWby10_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/TimeReference_s 29 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/TimeReference_s_stm 29 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/busIn_address_stm 10 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/busOut_readdatavalid
add_fixpt_wave /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/busOut_readdata 32 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb/dut/busOut_waitrequest
TreeUpdate [SetDefaultTree]
