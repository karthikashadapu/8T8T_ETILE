# pass in -Gquit_at_end=true to make vsim call exit at the end. Useful for running standalone.
quietly set quit_at_end 0
if {[lsearch $argv -Gquit_at_end=true] != -1} {
    quietly set quit_at_end 1
}

if {$argc > 0} {
    quietly set base_dir $1
} else {
    quietly set base_dir "./../../rtl/low_phy_ul_rtl"
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

if {! [file exists $base_dir/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite]} {
    file delete -force $base_dir/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite
}

project new $base_dir streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite
if {! [file exists $base_dir/work/_info]} {
    file delete -force $base_dir/work
    vlib work
}
quietly vmap work $base_dir/work

do "$base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_fpc.do"


quietly set vcomfailed 0
onerror {
    quietly set vcomfailed 1
    resume
}

project addfile $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_safe_path_msim_ver.sv systemverilog
project addfile $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_safe_path_msim.vhd vhdl
project addfile $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite.sv systemverilog
project addfile $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer.sv systemverilog
project addfile $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer.sv systemverilog
project addfile $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_Scalei.sv systemverilog
project addfile $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_Scaleq.sv systemverilog
project addfile $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate.sv systemverilog
project addfile $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen.sv systemverilog
project addfile $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen_Rising_edge_Finite_State_Machine.sv systemverilog
project addfile $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen_falling_edge_Finite_State_Machine.sv systemverilog
puts {Note: Process variables may be optimized out of top-level testbench. Re-compile with the following command to disable optimizations:}
puts {vcom -quiet -O0 $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_atb.vhd}
project addfile $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_atb.vhd vhdl
project addfile $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_stm.vhd vhdl
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
            if { [catch {exa mismatch_out_1_imag_dout1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_imag_dout1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_1_real_dout1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_real_dout1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_2_vout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_2_vout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_3_cout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_3_cout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_4_fft_size_out_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_4_fft_size_out_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_5_CPLenout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_5_CPLenout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_6_nsc_out_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_6_nsc_out_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_7_eAxCout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_7_eAxCout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_8_sym_metadataout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_8_sym_metadataout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_9_timeref_out_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_9_timeref_out_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_10_eop_eAxC_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_10_eop_eAxC_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_11_eop_sym_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_11_eop_sym_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_12_sop_eAxC_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_12_sop_eAxC_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_13_sop_sym_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_13_sop_sym_tpl $cyclenum
            }
        } else {
            puts "Signal mismatch detected at $my_tb";
        }
        if {$quit_at_end == 1} {
            quit -code 1;
        }
    }
    eval vsim -quiet -suppress 14408 -error 3473 -msgmode both -voptargs="+acc" -t ps streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_atb $ll
    do $base_dir/streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_atb.wav.do
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
