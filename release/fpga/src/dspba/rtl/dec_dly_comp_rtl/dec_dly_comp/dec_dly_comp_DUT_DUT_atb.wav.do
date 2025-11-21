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
add wave -noupdate -format Logic /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/clk
add wave -noupdate -format Logic /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/areset
add wave -noupdate -format Logic /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/bus_clk
add wave -noupdate -format Logic /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/bus_areset
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_v_s_stm
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_c_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_0im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_0re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_1im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_1re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_2im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_2re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_3im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_3re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_4im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_4re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_5im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_5re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_6im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_6re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_7im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/In_d_7re_stm 16 14 signed
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q1_0im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q1_0im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q1_0re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q1_0re_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q1_1im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q1_1im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q1_1re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q1_1re_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q1_2im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q1_2im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q1_2re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q1_2re_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q1_3im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q1_3im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q1_3re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q1_3re_stm 32 27 signed
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q_v1_s
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q_v1_s_stm
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q_c1_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q_c1_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q2_0im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q2_0im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q2_0re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q2_0re_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q2_1im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q2_1im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q2_1re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q2_1re_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q2_2im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q2_2im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q2_2re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q2_2re_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q2_3im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q2_3im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q2_3re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q2_3re_stm 32 27 signed
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q_v2_s
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q_v2_s_stm
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/q_c2_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/q_c2_s_stm 8 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/busOut_readdatavalid
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/busOut_readdata 32 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_atb/dut/busOut_waitrequest
TreeUpdate [SetDefaultTree]
