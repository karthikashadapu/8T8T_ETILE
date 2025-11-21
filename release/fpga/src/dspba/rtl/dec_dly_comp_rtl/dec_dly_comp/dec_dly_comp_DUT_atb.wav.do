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
add wave -noupdate -format Logic /dec_dly_comp_DUT_atb/dut/clk
add wave -noupdate -format Logic /dec_dly_comp_DUT_atb/dut/areset
add wave -noupdate -format Logic /dec_dly_comp_DUT_atb/dut/bus_clk
add wave -noupdate -format Logic /dec_dly_comp_DUT_atb/dut/bus_areset
add wave -noupdate -format Logical /dec_dly_comp_DUT_atb/sim/DDC_Valid_In_s_stm
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Chan_In_s_stm 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_0im_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_0re_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_1im_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_1re_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_2im_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_2re_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_3im_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_3re_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_4im_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_4re_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_5im_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_5re_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_6im_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_6re_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_7im_stm 16 14 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/DDC_Ant_Data_In_7re_stm 16 14 signed
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l1_dout_0im 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l1_dout_0im_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l1_dout_0re 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l1_dout_0re_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l1_dout_1im 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l1_dout_1im_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l1_dout_1re 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l1_dout_1re_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l1_dout_2im 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l1_dout_2im_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l1_dout_2re 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l1_dout_2re_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l1_dout_3im 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l1_dout_3im_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l1_dout_3re 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l1_dout_3re_stm 32 27 signed
add wave -noupdate -format Logical /dec_dly_comp_DUT_atb/dut/alq_l1_vout_s
add wave -noupdate -format Logical /dec_dly_comp_DUT_atb/sim/alq_l1_vout_s_stm
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l1_cout_s 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l1_cout_s_stm 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l2_dout_0im 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l2_dout_0im_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l2_dout_0re 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l2_dout_0re_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l2_dout_1im 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l2_dout_1im_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l2_dout_1re 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l2_dout_1re_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l2_dout_2im 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l2_dout_2im_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l2_dout_2re 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l2_dout_2re_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l2_dout_3im 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l2_dout_3im_stm 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l2_dout_3re 32 27 signed
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l2_dout_3re_stm 32 27 signed
add wave -noupdate -format Logical /dec_dly_comp_DUT_atb/dut/alq_l2_vout_s
add wave -noupdate -format Logical /dec_dly_comp_DUT_atb/sim/alq_l2_vout_s_stm
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/alq_l2_cout_s 8 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/alq_l2_cout_s_stm 8 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /dec_dly_comp_DUT_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /dec_dly_comp_DUT_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /dec_dly_comp_DUT_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /dec_dly_comp_DUT_atb/dut/busOut_readdatavalid
add_fixpt_wave /dec_dly_comp_DUT_atb/dut/busOut_readdata 32 0 unsigned
add wave -noupdate -format Logical /dec_dly_comp_DUT_atb/dut/busOut_waitrequest
TreeUpdate [SetDefaultTree]
