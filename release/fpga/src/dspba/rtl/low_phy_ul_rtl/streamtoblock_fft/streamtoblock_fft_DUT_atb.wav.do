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
add wave -noupdate -format Logic /streamtoblock_fft_DUT_atb/dut/clk
add wave -noupdate -format Logic /streamtoblock_fft_DUT_atb/dut/areset
add wave -noupdate -format Logic /streamtoblock_fft_DUT_atb/dut/bus_clk
add wave -noupdate -format Logic /streamtoblock_fft_DUT_atb/dut/bus_areset
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/rx_vin_s_stm
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/rx_chin_s_stm 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/rx_din_im_stm 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/rx_din_re_stm 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/fft_in_s_stm 4 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/cp_in_s_stm 16 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/nprb_s_stm 16 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/hcs_bypass_s_stm
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/fft_gain_s_stm 16 14 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/fft_gain_im_s_stm 16 14 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/fft_shift_s_stm 4 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/time_ref_in_s_stm 64 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/DC_SC_EN_s_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/CP_EN_s_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/ripple_comp_en_s_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/rc_bw_sel_s_stm
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/sym_metadata_in_s_stm 64 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/sym_metadata_in_valid_s_stm
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/dut/rx_valid_s
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/rx_valid_s_stm
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/rx_chout_s 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/rx_chout_s_stm 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/rx_dout_im 16 11 signed
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/rx_dout_im_stm 16 11 signed
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/rx_dout_re 16 11 signed
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/rx_dout_re_stm 16 11 signed
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/rx_time_out_s 64 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/rx_time_out_s_stm 64 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/dut/fft_vout_s
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/fft_vout_s_stm
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/fft_chout_s 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/fft_chout_s_stm 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/fft_dout_im 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/fft_dout_im_stm 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/fft_dout_re 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/fft_dout_re_stm 16 14 signed
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/nsc_out_s 16 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/nsc_out_s_stm 16 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/size_out_s 4 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/size_out_s_stm 4 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/td_time_out_s 64 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/td_time_out_s_stm 64 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/dut/fd_data_v_s
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/fd_data_v_s_stm
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/fd_data_c_s 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/fd_data_c_s_stm 8 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/fd_data_q_im 16 12 signed
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/fd_data_q_im_stm 16 12 signed
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/fd_data_q_re 16 12 signed
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/fd_data_q_re_stm 16 12 signed
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/eAxCout_s 2 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/eAxCout_s_stm 2 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/symmetadataout_s 64 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/symmetadataout_s_stm 64 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/dut/eop_eAxC_s
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/eop_eAxC_s_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/dut/eop_sym_s
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/eop_sym_s_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/dut/sop_eAxC_s
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/sop_eAxC_s_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/dut/sop_sym_s
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/sop_sym_s_stm
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/version_out1_s 32 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/version_out1_s_stm 32 0 unsigned
add wave -noupdate -divider {Bus Ports}
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/busIn_writedata_stm 32 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/busIn_address_stm 14 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/busIn_write_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/busIn_read_stm
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/dut/busOut_readdatavalid
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/busOut_readdatavalid_stm
add_fixpt_wave /streamtoblock_fft_DUT_atb/dut/busOut_readdata 32 0 unsigned
add_fixpt_wave /streamtoblock_fft_DUT_atb/sim/busOut_readdata_stm 32 0 unsigned
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/dut/busOut_waitrequest
add wave -noupdate -format Logical /streamtoblock_fft_DUT_atb/sim/busOut_waitrequest_stm
TreeUpdate [SetDefaultTree]
