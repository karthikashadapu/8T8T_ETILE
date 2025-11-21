# pass in -Gquit_at_end=true to make vsim call exit at the end. Useful for running standalone.
quietly set quit_at_end 0
if {[lsearch $argv -Gquit_at_end=true] != -1} {
    quietly set quit_at_end 1
}

if {$argc > 0} {
    quietly set base_dir $1
} else {
    quietly set base_dir "./../../rtl/low_phy_dl_rtl"
    echo The current directory is: [pwd]
}
quietly set base_dir [file normalize $base_dir]
echo Creating the project under $base_dir

do $base_dir/compile_modelsim_libraries.do
onerror {resume}

if { [string compare [project env] ""] != 0 } {
    quit -sim
    project close
}

if {! [file exists $base_dir/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S]} {
    file delete -force $base_dir/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S
}

project new $base_dir ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S
if {! [file exists $base_dir/work/_info]} {
    file delete -force $base_dir/work
    vlib work
}
quietly vmap work $base_dir/work

do "$base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_fpc.do"


quietly set vcomfailed 0
onerror {
    quietly set vcomfailed 1
    resume
}

project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_msim_ver.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_msim.vhd vhdl
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Risin0000Finite_State_Machine.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Risin0001Finite_State_Machine.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_Risin0002Finite_State_Machine.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falli0000Finite_State_Machine.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_falli0001Finite_State_Machine.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_VFFT.sv systemverilog
puts {Note: Process variables may be optimized out of top-level testbench. Re-compile with the following command to disable optimizations:}
puts {vcom -quiet -O0 $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_atb.vhd}
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_atb.vhd vhdl
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_stm.vhd vhdl
project calculateorder

onerror {resume}

proc report_mismatch {signal cycle} {
    puts "Mismatch in ${signal} at system clock cycle ${cycle}"
    set modelsimvalue [examine ${signal}_dut];
    set stmvalue [examine ${signal}_stm];
    puts "\t${signal} (ModelSim):\t${modelsimvalue}"
    puts "\t${signal} (Simulink):\t${stmvalue}"
}

if {$vcomfailed == 0} {
    onbreak {
        quietly set my_tb [string trim [tb]];
        quietly set regOK [regexp {(.*) ([0-9]+) ([\[address]*) ([.]*)} $my_tb \ match atbfile linenum ignore_this];
        if {$regOK == 1} {
            quietly set simtime [expr $now - 200];
            quietly set cyclenum [expr int($simtime / 2034.505208)];
            if { [catch {exa mismatch_out_1_vout1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_vout1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_2_cout1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_2_cout1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_3_imag_dout1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_3_imag_dout1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_3_real_dout1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_3_real_dout1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_4_imag_td_ifft_out_d_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_4_imag_td_ifft_out_d_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_4_real_td_ifft_out_d_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_4_real_td_ifft_out_d_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_5_td_ifft_out_ch_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_5_td_ifft_out_ch_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_6_td_ifft_out_v_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_6_td_ifft_out_v_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_7_ifft_size_out_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_7_ifft_size_out_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_8_ifft_nprb_out_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_8_ifft_nprb_out_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_9_ifft_cp_out_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_9_ifft_cp_out_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_10_fd_data_v_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_10_fd_data_v_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_11_fd_data_c_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_11_fd_data_c_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_12_imag_fd_data_q_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_12_imag_fd_data_q_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_12_real_fd_data_q_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_12_real_fd_data_q_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_13_fd_time_out_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_13_fd_time_out_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl $cyclenum
            }
        } else {
            puts "Signal mismatch detected at $my_tb";
        }
        if {$quit_at_end == 1} {
            quit -code 1;
        }
    }
    eval vsim -quiet -suppress 14408 -error 3473 -msgmode both -voptargs="+acc" -t ps ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_atb $ll
    do $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_atb.wav.do
# Disable some warnings that occur at the very start of simulation
    quietly set StdArithNoWarnings 1
    run 0ns
    quietly set StdArithNoWarnings 0
    run -all
} else {
    echo At least one module failed to compile, not starting simulation
}

if {$quit_at_end == 1} {
    exit
}
