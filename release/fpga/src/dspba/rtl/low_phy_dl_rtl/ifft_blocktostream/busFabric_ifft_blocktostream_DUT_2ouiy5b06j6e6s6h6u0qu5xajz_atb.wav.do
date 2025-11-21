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
add wave -noupdate -format Logic /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/dut/clk
add wave -noupdate -format Logic /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/dut/areset
add wave -noupdate -format Logic /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/dut/bus_clk
add wave -noupdate -format Logic /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/dut/bus_areset
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/in_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm 12 0 unsigned
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/in_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm 12 0 unsigned
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/in_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm 16 15 unsigned
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/in_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm 16 15 unsigned
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/dut/out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_RegField4_x_tpl 32 0 unsigned
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_RegField4_x_tpl_stm 32 0 unsigned
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/dut/out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl 32 0 unsigned
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl_stm 32 0 unsigned
add wave -noupdate -format Logical /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/dut/out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl
add wave -noupdate -format Logical /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl_stm
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/dut/out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl 32 0 unsigned
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl_stm 32 0 unsigned
add wave -noupdate -format Logical /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/dut/out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl
add wave -noupdate -format Logical /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/out_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl_stm
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/dut/out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl 16 15 unsigned
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm 16 15 unsigned
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/dut/out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl 16 15 unsigned
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/out_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm 16 15 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/dut/busOut_readdatavalid
add_fixpt_wave /busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz_atb/dut/busOut_readdata 32 0 unsigned
TreeUpdate [SetDefaultTree]
