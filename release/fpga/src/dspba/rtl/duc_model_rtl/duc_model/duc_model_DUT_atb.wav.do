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
add wave -noupdate -format Logic /duc_model_DUT_atb/dut/clk
add wave -noupdate -format Logic /duc_model_DUT_atb/dut/areset
add wave -noupdate -format Logic /duc_model_DUT_atb/dut/bus_clk
add wave -noupdate -format Logic /duc_model_DUT_atb/dut/bus_areset
add wave -noupdate -format Logical /duc_model_DUT_atb/sim/DUC_Valid_l1_s_stm
add_fixpt_wave /duc_model_DUT_atb/sim/DUC_Chan_l1_s_stm 8 0 unsigned
add_fixpt_wave /duc_model_DUT_atb/sim/DUC_Data_l1_im_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/DUC_Data_l1_re_stm 16 14 signed
add wave -noupdate -format Logical /duc_model_DUT_atb/sim/DUC_NCO_sync_0_stm
add wave -noupdate -format Logical /duc_model_DUT_atb/sim/DUC_NCO_sync_1_stm
add wave -noupdate -format Logical /duc_model_DUT_atb/sim/DUC_NCO_sync_2_stm
add wave -noupdate -format Logical /duc_model_DUT_atb/sim/DUC_NCO_sync_3_stm
add_fixpt_wave /duc_model_DUT_atb/sim/BW_Config_CC1_s_stm 8 0 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /duc_model_DUT_atb/dut/DUC_Valid_Out_s
add wave -noupdate -format Logical /duc_model_DUT_atb/sim/DUC_Valid_Out_s_stm
add_fixpt_wave /duc_model_DUT_atb/dut/DUC_Chan_Out_s 8 0 unsigned
add_fixpt_wave /duc_model_DUT_atb/sim/DUC_Chan_Out_s_stm 8 0 unsigned
add_fixpt_wave /duc_model_DUT_atb/dut/DUC_Data_Out_0im 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/DUC_Data_Out_0im_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/dut/DUC_Data_Out_0re 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/DUC_Data_Out_0re_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/dut/DUC_Data_Out_1im 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/DUC_Data_Out_1im_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/dut/DUC_Data_Out_1re 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/DUC_Data_Out_1re_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/dut/DUC_Data_Out_2im 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/DUC_Data_Out_2im_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/dut/DUC_Data_Out_2re 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/DUC_Data_Out_2re_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/dut/DUC_Data_Out_3im 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/DUC_Data_Out_3im_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/dut/DUC_Data_Out_3re 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/DUC_Data_Out_3re_stm 16 14 signed
add wave -noupdate -format Logical /duc_model_DUT_atb/dut/duc_l1_vout_s
add wave -noupdate -format Logical /duc_model_DUT_atb/sim/duc_l1_vout_s_stm
add_fixpt_wave /duc_model_DUT_atb/dut/duc_l1_cout_s 8 0 unsigned
add_fixpt_wave /duc_model_DUT_atb/sim/duc_l1_cout_s_stm 8 0 unsigned
add_fixpt_wave /duc_model_DUT_atb/dut/duc_l1_dout_0im 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/duc_l1_dout_0im_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/dut/duc_l1_dout_0re 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/duc_l1_dout_0re_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/dut/duc_l1_dout_1im 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/duc_l1_dout_1im_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/dut/duc_l1_dout_1re 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/duc_l1_dout_1re_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/dut/duc_l1_dout_2im 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/duc_l1_dout_2im_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/dut/duc_l1_dout_2re 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/duc_l1_dout_2re_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/dut/duc_l1_dout_3im 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/duc_l1_dout_3im_stm 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/dut/duc_l1_dout_3re 16 14 signed
add_fixpt_wave /duc_model_DUT_atb/sim/duc_l1_dout_3re_stm 16 14 signed
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /duc_model_DUT_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /duc_model_DUT_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /duc_model_DUT_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /duc_model_DUT_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /duc_model_DUT_atb/dut/busOut_readdatavalid
add_fixpt_wave /duc_model_DUT_atb/dut/busOut_readdata 32 0 unsigned
add wave -noupdate -format Logical /duc_model_DUT_atb/dut/busOut_waitrequest
TreeUpdate [SetDefaultTree]
