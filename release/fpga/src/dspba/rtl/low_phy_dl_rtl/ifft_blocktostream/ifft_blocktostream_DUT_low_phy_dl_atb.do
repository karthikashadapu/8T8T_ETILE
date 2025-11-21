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

if {! [file exists $base_dir/standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl]} {
    file delete -force $base_dir/standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl
}

project new $base_dir standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl
if {! [file exists $base_dir/work/_info]} {
    file delete -force $base_dir/work
    vlib work
}
quietly vmap work $base_dir/work

do "$base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_fpc.do"


quietly set vcomfailed 0
onerror {
    quietly set vcomfailed 1
    resume
}

project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_msim_ver.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_safe_path_msim.vhd vhdl
project addfile $base_dir/ifft_blocktostream/standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_ComplexMixer.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_ComplexMixer_ComplexMixer.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_ComplexMixer_Scalei.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_ComplexMixer_Scaleq.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_Rising_edge_Finite_State_Machine.sv systemverilog
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_SOP_EOP_gen_falling_edge_Finite_State_Machine.sv systemverilog
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
project addfile $base_dir/ifft_blocktostream/busFabric_ifft_blocktostream_DUT_2ouiy5b06j6e6s6h6u0qu5xajz.sv systemverilog
puts {Note: Process variables may be optimized out of top-level testbench. Re-compile with the following command to disable optimizations:}
puts {vcom -quiet -O0 $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_atb.vhd}
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_atb.vhd vhdl
project addfile $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_stm.vhd vhdl
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
            if { [catch {exa mismatch_vout2_s} mismatch] == 0 && $mismatch } {
                report_mismatch vout2_s $cyclenum
            }
            if { [catch {exa mismatch_cout2_s} mismatch] == 0 && $mismatch } {
                report_mismatch cout2_s $cyclenum
            }
            if { [catch {exa mismatch_dout2_im} mismatch] == 0 && $mismatch } {
                report_mismatch dout2_im $cyclenum
            }
            if { [catch {exa mismatch_dout2_re} mismatch] == 0 && $mismatch } {
                report_mismatch dout2_re $cyclenum
            }
            if { [catch {exa mismatch_td_ifft_out_d_im} mismatch] == 0 && $mismatch } {
                report_mismatch td_ifft_out_d_im $cyclenum
            }
            if { [catch {exa mismatch_td_ifft_out_d_re} mismatch] == 0 && $mismatch } {
                report_mismatch td_ifft_out_d_re $cyclenum
            }
            if { [catch {exa mismatch_td_ifft_out_ch_s} mismatch] == 0 && $mismatch } {
                report_mismatch td_ifft_out_ch_s $cyclenum
            }
            if { [catch {exa mismatch_td_ifft_out_v_s} mismatch] == 0 && $mismatch } {
                report_mismatch td_ifft_out_v_s $cyclenum
            }
            if { [catch {exa mismatch_ifft_size_out_s} mismatch] == 0 && $mismatch } {
                report_mismatch ifft_size_out_s $cyclenum
            }
            if { [catch {exa mismatch_ifft_nprb_out_s} mismatch] == 0 && $mismatch } {
                report_mismatch ifft_nprb_out_s $cyclenum
            }
            if { [catch {exa mismatch_ifft_cp_out_s} mismatch] == 0 && $mismatch } {
                report_mismatch ifft_cp_out_s $cyclenum
            }
            if { [catch {exa mismatch_fd_data_v_s} mismatch] == 0 && $mismatch } {
                report_mismatch fd_data_v_s $cyclenum
            }
            if { [catch {exa mismatch_fd_data_c_s} mismatch] == 0 && $mismatch } {
                report_mismatch fd_data_c_s $cyclenum
            }
            if { [catch {exa mismatch_fd_data_q_im} mismatch] == 0 && $mismatch } {
                report_mismatch fd_data_q_im $cyclenum
            }
            if { [catch {exa mismatch_fd_data_q_re} mismatch] == 0 && $mismatch } {
                report_mismatch fd_data_q_re $cyclenum
            }
            if { [catch {exa mismatch_fd_timeref_out_s} mismatch] == 0 && $mismatch } {
                report_mismatch fd_timeref_out_s $cyclenum
            }
            if { [catch {exa mismatch_version_out_s} mismatch] == 0 && $mismatch } {
                report_mismatch version_out_s $cyclenum
            }
        } else {
            puts "Signal mismatch detected at $my_tb";
        }
        if {$quit_at_end == 1} {
            quit -code 1;
        }
    }
    eval vsim -quiet -suppress 14408 -error 3473 -msgmode both -voptargs="+acc" -t ps standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb $ll
    do $base_dir/ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_atb.wav.do
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
