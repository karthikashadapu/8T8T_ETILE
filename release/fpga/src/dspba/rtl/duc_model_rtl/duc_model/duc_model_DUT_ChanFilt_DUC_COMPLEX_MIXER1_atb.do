# pass in -Gquit_at_end=true to make vsim call exit at the end. Useful for running standalone.
quietly set quit_at_end 0
if {[lsearch $argv -Gquit_at_end=true] != -1} {
    quietly set quit_at_end 1
}

if {$argc > 0} {
    quietly set base_dir $1
} else {
    quietly set base_dir "./../../rtl/duc_model_rtl"
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

if {! [file exists $base_dir/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1]} {
    file delete -force $base_dir/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1
}

project new $base_dir duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1
if {! [file exists $base_dir/work/_info]} {
    file delete -force $base_dir/work
    vlib work
}
quietly vmap work $base_dir/work

do "$base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_fpc.do"


quietly set vcomfailed 0
onerror {
    quietly set vcomfailed 1
    resume
}

project addfile $base_dir/duc_model/duc_model_DUT_safe_path_msim_ver.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_safe_path_msim.vhd vhdl
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_Scale1.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO.sv systemverilog
puts {Note: Process variables may be optimized out of top-level testbench. Re-compile with the following command to disable optimizations:}
puts {vcom -quiet -O0 $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_atb.vhd}
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_atb.vhd vhdl
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_stm.vhd vhdl
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
            if { [catch {exa mismatch_out_1_0_imag_q1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_0_imag_q1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_1_0_real_q1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_0_real_q1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_1_1_imag_q1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_1_imag_q1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_1_1_real_q1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_1_real_q1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_1_2_imag_q1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_2_imag_q1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_1_2_real_q1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_2_real_q1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_1_3_imag_q1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_3_imag_q1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_1_3_real_q1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_3_real_q1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_2_qv1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_2_qv1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_3_qc1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_3_qc1_tpl $cyclenum
            }
        } else {
            puts "Signal mismatch detected at $my_tb";
        }
        if {$quit_at_end == 1} {
            quit -code 1;
        }
    }
    eval vsim -quiet -suppress 14408 -error 3473 -msgmode both -voptargs="+acc" -t ps duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_atb $ll
    do $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_atb.wav.do
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
