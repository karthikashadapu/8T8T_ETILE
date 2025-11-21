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
add wave -noupdate -format Logic /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/clk
add wave -noupdate -format Logic /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/areset
add wave -noupdate -format Logic /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/bus_clk
add wave -noupdate -format Logic /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/bus_areset
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_out_0im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_out_0re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_out_1im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_out_1re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_out_2im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_out_2re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_out_3im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_out_3re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_0im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_0re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_1im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_1re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_2im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_2re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_3im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_3re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_4im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_4re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_5im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_5re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_6im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_6re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_7im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_dec_in_7re_stm 16 14 signed
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/vin_dec_out_s_stm
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/cin_dec_in_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/cin_dec_out_s_stm 8 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/vin_dec_in_s_stm
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/din_a1_0im 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_a1_0im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/din_a1_0re 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_a1_0re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/din_a1_1im 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_a1_1im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/din_a1_1re 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_a1_1re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/din_a1_2im 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_a1_2im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/din_a1_2re 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_a1_2re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/din_a1_3im 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_a1_3im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/din_a1_3re 16 14 signed
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/din_a1_3re_stm 16 14 signed
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/vin_a1_s
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/vin_a1_s_stm
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/cin_a1_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/cin_a1_s_stm 8 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/busOut_readdatavalid
add_fixpt_wave /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/busOut_readdata 32 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb/dut/busOut_waitrequest
TreeUpdate [SetDefaultTree]
