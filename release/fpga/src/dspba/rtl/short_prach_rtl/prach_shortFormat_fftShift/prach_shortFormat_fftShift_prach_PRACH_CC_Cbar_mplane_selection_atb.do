# pass in -Gquit_at_end=true to make vsim call exit at the end. Useful for running standalone.
quietly set quit_at_end 0
if {[lsearch $argv -Gquit_at_end=true] != -1} {
    quietly set quit_at_end 1
}

if {$argc > 0} {
    quietly set base_dir $1
} else {
    quietly set base_dir "./../../rtl/short_prach_rtl"
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

if {! [file exists $base_dir/prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection]} {
    file delete -force $base_dir/prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection
}

project new $base_dir prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection
if {! [file exists $base_dir/work/_info]} {
    file delete -force $base_dir/work
    vlib work
}
quietly vmap work $base_dir/work

do "$base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection_fpc.do"


quietly set vcomfailed 0
onerror {
    quietly set vcomfailed 1
    resume
}

project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_safe_path_msim_ver.sv systemverilog
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_safe_path_msim.vhd vhdl
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection.sv systemverilog
puts {Note: Process variables may be optimized out of top-level testbench. Re-compile with the following command to disable optimizations:}
puts {vcom -quiet -O0 $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection_atb.vhd}
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection_atb.vhd vhdl
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection_stm.vhd vhdl
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
            if { [catch {exa mismatch_out_1_vout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_vout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_2_cout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_2_cout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_3_real_dout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_3_real_dout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_3_imag_dout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_3_imag_dout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_4_qFFTSize_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_4_qFFTSize_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_5_qSOP_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_5_qSOP_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_6_qBWby10_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_6_qBWby10_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_7_T_ref_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_7_T_ref_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_8_qNFFT_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_8_qNFFT_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_9_CPLen_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_9_CPLen_tpl $cyclenum
            }
        } else {
            puts "Signal mismatch detected at $my_tb";
        }
        if {$quit_at_end == 1} {
            quit -code 1;
        }
    }
    eval vsim -quiet -suppress 14408 -error 3473 -msgmode both -voptargs="+acc" -t ps prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection_atb $ll
    do $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection_atb.wav.do
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
