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
add wave -noupdate -format Logic /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/clk
add wave -noupdate -format Logic /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/areset
add wave -noupdate -format Logic /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/bus_clk
add wave -noupdate -format Logic /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/bus_areset
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/valid1_s_stm
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/ifft_gain_re_l1_s_stm 16 14 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/ifft_gain_im_l1_s_stm 16 14 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/ifft_shift_l1_s_stm 4 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/ifft_mux_const_l1_s_stm 16 15 signed
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/muxsel_l1_s_stm
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/DC_SC_EN_s_stm
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/data1_im_stm 16 15 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/data1_re_stm 16 15 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/channel1_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/size1_s_stm 4 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/nsc1_s_stm 12 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/cplen1_s_stm 11 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/CP_EN1_s_stm
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/ripple_comp_en_s_stm
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/rc_bw_sel_s_stm
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/timeref_in_s_stm 64 0 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/vout2_s
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/vout2_s_stm
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/cout2_s 2 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/cout2_s_stm 2 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/dout2_im 16 14 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/dout2_im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/dout2_re 16 14 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/dout2_re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/td_ifft_out_d_im 16 14 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/td_ifft_out_d_im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/td_ifft_out_d_re 16 14 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/td_ifft_out_d_re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/td_ifft_out_ch_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/td_ifft_out_ch_s_stm 8 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/td_ifft_out_v_s
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/td_ifft_out_v_s_stm
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/ifft_size_out_s 4 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/ifft_size_out_s_stm 4 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/ifft_nprb_out_s 12 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/ifft_nprb_out_s_stm 12 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/ifft_cp_out_s 11 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/ifft_cp_out_s_stm 11 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/fd_data_v_s
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/fd_data_v_s_stm
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/fd_data_c_s 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/fd_data_c_s_stm 8 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/fd_data_q_im 16 14 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/fd_data_q_im_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/fd_data_q_re 16 14 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/fd_data_q_re_stm 16 14 signed
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/fd_timeref_out_s 64 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/fd_timeref_out_s_stm 64 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/version_out_s 32 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/version_out_s_stm 32 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/busOut_readdatavalid
add_fixpt_wave /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/busOut_readdata 32 0 unsigned
add wave -noupdate -format Logical /standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb/dut/busOut_waitrequest
TreeUpdate [SetDefaultTree]
