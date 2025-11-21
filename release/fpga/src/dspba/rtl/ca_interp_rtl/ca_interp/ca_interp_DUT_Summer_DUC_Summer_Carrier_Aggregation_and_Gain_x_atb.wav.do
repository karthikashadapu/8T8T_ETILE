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
add wave -noupdate -format Logic /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/clk
add wave -noupdate -format Logic /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/areset
add wave -noupdate -format Logic /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/bus_clk
add wave -noupdate -format Logic /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/bus_areset
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a1_0im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a1_0re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a1_1im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a1_1re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a1_2im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a1_2re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a1_3im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a1_3re_stm 16 14 signed
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/vin_a1_s_stm
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/cin_a1_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a2_0im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a2_0re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a2_1im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a2_1re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a2_2im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a2_2re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a2_3im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/din_a2_3re_stm 16 14 signed
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/altq_0im 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/altq_0im_stm 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/altq_0re 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/altq_0re_stm 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/altq_1im 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/altq_1im_stm 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/altq_1re 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/altq_1re_stm 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/altq_2im 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/altq_2im_stm 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/altq_2re 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/altq_2re_stm 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/altq_3im 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/altq_3im_stm 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/altq_3re 33 27 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/altq_3re_stm 33 27 signed
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/altv_s
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/altv_s_stm
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/altc_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/altc_s_stm 8 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/busOut_readdatavalid
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/busOut_readdata 32 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb/dut/busOut_waitrequest
TreeUpdate [SetDefaultTree]
