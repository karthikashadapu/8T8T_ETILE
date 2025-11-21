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
add wave -noupdate -format Logic /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/clk
add wave -noupdate -format Logic /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/areset
add wave -noupdate -format Logic /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/bus_clk
add wave -noupdate -format Logic /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/bus_areset
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/In1_s_stm
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/In2_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/In3_0im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/In3_0re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/In3_1im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/In3_1re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/In3_2im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/In3_2re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/In3_3im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/In3_3re_stm 16 14 signed
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout1_0im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout1_0im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout1_0re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout1_0re_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout1_1im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout1_1im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout1_1re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout1_1re_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout1_2im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout1_2im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout1_2re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout1_2re_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout1_3im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout1_3im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout1_3re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout1_3re_stm 32 27 signed
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/vout1_s
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/vout1_s_stm
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/cout1_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/cout1_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout2_0im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout2_0im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout2_0re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout2_0re_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout2_1im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout2_1im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout2_1re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout2_1re_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout2_2im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout2_2im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout2_2re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout2_2re_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout2_3im 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout2_3im_stm 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/dout2_3re 32 27 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/dout2_3re_stm 32 27 signed
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/vout2_s
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/vout2_s_stm
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/cout2_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/cout2_s_stm 8 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/busOut_readdatavalid
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/busOut_readdata 32 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb/dut/busOut_waitrequest
TreeUpdate [SetDefaultTree]
