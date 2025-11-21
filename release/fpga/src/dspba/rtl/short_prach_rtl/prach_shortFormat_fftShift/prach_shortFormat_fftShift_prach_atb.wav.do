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
add wave -noupdate -format Logic /prach_shortFormat_fftShift_prach_atb/dut/clk
add wave -noupdate -format Logic /prach_shortFormat_fftShift_prach_atb/dut/areset
add wave -noupdate -format Logic /prach_shortFormat_fftShift_prach_atb/dut/bus_clk
add wave -noupdate -format Logic /prach_shortFormat_fftShift_prach_atb/dut/bus_areset
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_atb/sim/vin1_s_stm
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/chin1_s_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/din1_im_stm 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/din1_re_stm 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/SFN_s_stm 12 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/SubFN_s_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/SCSby15_s_stm 2 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/BWby10_s_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/CPLen_cplane_s_stm 23 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/timeoffset_cplane_s_stm 23 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/numsym_cplane_s_stm 4 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/slotID_cplane_s_stm 2 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/startsym_cplane_s_stm 4 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/timerefin_cplane_s_stm 29 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/cur_slot_s_stm 2 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/SubFN_cplane_s_stm 8 0 unsigned
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_atb/sim/cbar_mplane_s_stm
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/timeoffset_bias_cplane_s_stm 23 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/startsym_bias_cplane_s_stm 23 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/gain_in_re_s_stm 16 14 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/gain_in_imag_s_stm 16 14 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_atb/dut/fftShift_v_s
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_atb/sim/fftShift_v_s_stm
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/dut/fftShift_c_s 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/fftShift_c_s_stm 8 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/dut/fftShift_d_im 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/fftShift_d_im_stm 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/dut/fftShift_d_re 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/fftShift_d_re_stm 16 15 signed
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/dut/TimeReference_s 29 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/TimeReference_s_stm 29 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/sim/busIn_address_stm 10 0 unsigned
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_atb/dut/busOut_readdatavalid
add_fixpt_wave /prach_shortFormat_fftShift_prach_atb/dut/busOut_readdata 32 0 unsigned
add wave -noupdate -format Logical /prach_shortFormat_fftShift_prach_atb/dut/busOut_waitrequest
TreeUpdate [SetDefaultTree]
