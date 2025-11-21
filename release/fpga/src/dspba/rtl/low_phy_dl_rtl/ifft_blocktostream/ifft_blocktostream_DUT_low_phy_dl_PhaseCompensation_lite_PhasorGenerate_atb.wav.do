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
add wave -noupdate -format Logic /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/clk
add wave -noupdate -format Logic /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/areset
add wave -noupdate -format Logic /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/bus_clk
add wave -noupdate -format Logic /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/bus_areset
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/v_s_stm
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/c_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/d1_im_stm 16 15 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/d1_re_stm 16 15 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/Tsym1_s_stm 16 15 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/cp_T1_s_stm 16 15 signed
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/CP_EN1_s_stm
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/fft_size_s_stm 4 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/CPLen_s_stm 11 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/nsc_s_stm 12 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/eAxC_s_stm
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/sym_metadata_s_stm
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/ul_timerefin_s_stm 64 0 unsigned
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/dout1_im 16 15 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/dout1_im_stm 16 15 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/dout1_re 16 15 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/dout1_re_stm 16 15 signed
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/vout_s
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/vout_s_stm
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/cout_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/cout_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/sin_s 18 15 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/sin_s_stm 18 15 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/cos_s 18 15 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/cos_s_stm 18 15 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/fft_size_out_s 4 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/fft_size_out_s_stm 4 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/CPLenout_s 11 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/CPLenout_s_stm 11 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/nsc_out_s 12 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/nsc_out_s_stm 12 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/eAxC_out_s
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/eAxC_out_s_stm
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/sym_metadata_out_s
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/sym_metadata_out_s_stm
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/ul_timeref_out_s 64 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/ul_timeref_out_s_stm 64 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/busOut_readdatavalid
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/busOut_readdata 32 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb/dut/busOut_waitrequest
TreeUpdate [SetDefaultTree]
