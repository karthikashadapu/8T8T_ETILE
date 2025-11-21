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
add wave -noupdate -format Logic /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/clk
add wave -noupdate -format Logic /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/areset
add wave -noupdate -format Logic /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/bus_clk
add wave -noupdate -format Logic /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/bus_areset
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_0im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_0re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_1im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_1re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_2im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_2re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_3im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_3re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_4im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_4re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_5im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_5re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_6im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_6re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_7im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_out_7re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_in_0im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_in_0re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_in_1im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_in_1re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_in_2im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_in_2re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_in_3im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/din_intp_in_3re_stm 16 14 signed
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/vin_intp_out_s_stm
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/cin_intp_in_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/cin_intp_out_s_stm 8 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/vin_intp_in_s_stm
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_0im 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_0im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_0re 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_0re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_1im 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_1im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_1re 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_1re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_2im 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_2im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_2re 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_2re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_3im 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_3im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_3re 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_3re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_4im 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_4im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_4re 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_4re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_5im 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_5im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_5re 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_5re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_6im 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_6im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_6re 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_6re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_7im 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_7im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/dout_7re 16 14 signed
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/dout_7re_stm 16 14 signed
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/vout_s
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/vout_s_stm
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/cout_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/cout_s_stm 8 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/busOut_readdatavalid
add_fixpt_wave /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/busOut_readdata 32 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_atb/dut/busOut_waitrequest
TreeUpdate [SetDefaultTree]
