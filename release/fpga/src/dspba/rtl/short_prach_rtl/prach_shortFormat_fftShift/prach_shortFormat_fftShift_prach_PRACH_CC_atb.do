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

if {! [file exists $base_dir/prach_shortFormat_fftShift_prach_PRACH_CC]} {
    file delete -force $base_dir/prach_shortFormat_fftShift_prach_PRACH_CC
}

project new $base_dir prach_shortFormat_fftShift_prach_PRACH_CC
if {! [file exists $base_dir/work/_info]} {
    file delete -force $base_dir/work
    vlib work
}
quietly vmap work $base_dir/work

do "$base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_fpc.do"


quietly set vcomfailed 0
onerror {
    quietly set vcomfailed 1
    resume
}

project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_safe_path_msim_ver.sv systemverilog
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_safe_path_msim.vhd vhdl
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC.sv systemverilog
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection.sv systemverilog
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode.sv systemverilog
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_RemoveCP.sv systemverilog
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect.sv systemverilog
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_Stream2BlockConv.sv systemverilog
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_VFFT.sv systemverilog
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_control_decode_cplane.sv systemverilog
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_gain.sv systemverilog
puts {Note: Process variables may be optimized out of top-level testbench. Re-compile with the following command to disable optimizations:}
puts {vcom -quiet -O0 $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_atb.vhd}
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_atb.vhd vhdl
project addfile $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_stm.vhd vhdl
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
            if { [catch {exa mismatch_out_1_qv_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_qv_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_2_qch_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_2_qch_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_3_imag_q_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_3_imag_q_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_3_real_q_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_3_real_q_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_4_qv139_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_4_qv139_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_5_qFreqBinIdx_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_5_qFreqBinIdx_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_6_fftShift_v_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_6_fftShift_v_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_7_fftShift_c_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_7_fftShift_c_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_8_imag_fftShift_d_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_8_imag_fftShift_d_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_8_real_fftShift_d_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_8_real_fftShift_d_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_9_TimeReference_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_9_TimeReference_tpl $cyclenum
            }
        } else {
            puts "Signal mismatch detected at $my_tb";
        }
        if {$quit_at_end == 1} {
            quit -code 1;
        }
    }
    eval vsim -quiet -suppress 14408 -error 3473 -msgmode both -voptargs="+acc" -t ps prach_shortFormat_fftShift_prach_PRACH_CC_atb $ll
    do $base_dir/prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_atb.wav.do
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
