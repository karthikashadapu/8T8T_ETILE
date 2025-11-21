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
add wave -noupdate -format Logic /LongPRACH_sim_prach_wrap_atb/dut/clk
add wave -noupdate -format Logic /LongPRACH_sim_prach_wrap_atb/dut/areset
add wave -noupdate -format Logic /LongPRACH_sim_prach_wrap_atb/dut/bus_clk
add wave -noupdate -format Logic /LongPRACH_sim_prach_wrap_atb/dut/bus_areset
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_atb/sim/vin0_s_stm
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/chin0_s_stm 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/din0_im_stm 16 14 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/din0_re_stm 16 14 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/RFN_s_stm 12 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/subframe_s_stm 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/prach_cfg_idx_s_stm 16 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/cp_len_s_stm 21 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/offset_s_stm 21 0 unsigned
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_atb/sim/c_m_plane_sel_s_stm
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_atb/sim/prach_tech_s_stm
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_atb/sim/filt_flush_en_s_stm
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/start_sym_s_stm 4 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/SubFrame_cplane_s_stm 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/gain_re_s_stm 16 14 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/gain_im_s_stm 16 14 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/ch0_info_s_stm 16 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/ch1_info_s_stm 16 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/ch2_info_s_stm 16 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/ch3_info_s_stm 16 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/RFN_cplane_s_stm 12 0 unsigned
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/dut/dout_im 16 8 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/dout_im_stm 16 8 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/dut/dout_re 16 8 signed
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/dout_re_stm 16 8 signed
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_atb/dut/vout_s
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_atb/sim/vout_s_stm
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/dut/cout_s 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/cout_s_stm 8 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/dut/TimeReference_s 32 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/TimeReference_s_stm 32 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/dut/version_info_s 32 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/version_info_s_stm 32 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/dut/ch_info_s 16 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/ch_info_s_stm 16 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/sim/busIn_address_stm 2 0 unsigned
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_atb/dut/busOut_readdatavalid
add_fixpt_wave /LongPRACH_sim_prach_wrap_atb/dut/busOut_readdata 32 0 unsigned
add wave -noupdate -format Logical /LongPRACH_sim_prach_wrap_atb/dut/busOut_waitrequest
TreeUpdate [SetDefaultTree]
