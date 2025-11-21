# pass in -Gquit_at_end=true to make vsim call exit at the end. Useful for running standalone.
quietly set quit_at_end 0
if {[lsearch $argv -Gquit_at_end=true] != -1} {
    quietly set quit_at_end 1
}

if {$argc > 0} {
    quietly set base_dir $1
} else {
    quietly set base_dir "./../../rtl/ca_interp_rtl"
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

if {! [file exists $base_dir/ca_interp_DUT_Summer_DUC_Poly_phase_Interp_scale_HB3_im]} {
    file delete -force $base_dir/ca_interp_DUT_Summer_DUC_Poly_phase_Interp_scale_HB3_im
}

project new $base_dir ca_interp_DUT_Summer_DUC_Poly_phase_Interp_scale_HB3_im
if {! [file exists $base_dir/work/_info]} {
    file delete -force $base_dir/work
    vlib work
}
quietly vmap work $base_dir/work

do "$base_dir/ca_interp/ca_interp_DUT_Summer_DUC_Poly_phase_Interp_scale_HB3_im_fpc.do"


quietly set vcomfailed 0
onerror {
    quietly set vcomfailed 1
    resume
}

project addfile $base_dir/ca_interp/ca_interp_DUT_safe_path_msim_ver.sv systemverilog
project addfile $base_dir/ca_interp/ca_interp_DUT_safe_path_msim.vhd vhdl
project addfile $base_dir/ca_interp/ca_interp_DUT_Summer_DUC_Poly_phase_Interp_scale_HB3_im.sv systemverilog
puts {Note: Process variables may be optimized out of top-level testbench. Re-compile with the following command to disable optimizations:}
puts {vcom -quiet -O0 $base_dir/ca_interp/ca_interp_DUT_Summer_DUC_Poly_phase_Interp_scale_HB3_im_atb.vhd}
project addfile $base_dir/ca_interp/ca_interp_DUT_Summer_DUC_Poly_phase_Interp_scale_HB3_im_atb.vhd vhdl
project addfile $base_dir/ca_interp/ca_interp_DUT_Summer_DUC_Poly_phase_Interp_scale_HB3_im_stm.vhd vhdl
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
            if { [catch {exa mismatch_qOut_v} mismatch] == 0 && $mismatch } {
                report_mismatch qOut_v $cyclenum
            }
            if { [catch {exa mismatch_qOut_c} mismatch] == 0 && $mismatch } {
                report_mismatch qOut_c $cyclenum
            }
            if { [catch {exa mismatch_qOut_0} mismatch] == 0 && $mismatch } {
                report_mismatch qOut_0 $cyclenum
            }
            if { [catch {exa mismatch_qOut_1} mismatch] == 0 && $mismatch } {
                report_mismatch qOut_1 $cyclenum
            }
            if { [catch {exa mismatch_qOut_2} mismatch] == 0 && $mismatch } {
                report_mismatch qOut_2 $cyclenum
            }
            if { [catch {exa mismatch_qOut_3} mismatch] == 0 && $mismatch } {
                report_mismatch qOut_3 $cyclenum
            }
            if { [catch {exa mismatch_qOut_4} mismatch] == 0 && $mismatch } {
                report_mismatch qOut_4 $cyclenum
            }
            if { [catch {exa mismatch_qOut_5} mismatch] == 0 && $mismatch } {
                report_mismatch qOut_5 $cyclenum
            }
            if { [catch {exa mismatch_qOut_6} mismatch] == 0 && $mismatch } {
                report_mismatch qOut_6 $cyclenum
            }
            if { [catch {exa mismatch_qOut_7} mismatch] == 0 && $mismatch } {
                report_mismatch qOut_7 $cyclenum
            }
            if { [catch {exa mismatch_eOut_0} mismatch] == 0 && $mismatch } {
                report_mismatch eOut_0 $cyclenum
            }
            if { [catch {exa mismatch_eOut_1} mismatch] == 0 && $mismatch } {
                report_mismatch eOut_1 $cyclenum
            }
            if { [catch {exa mismatch_eOut_2} mismatch] == 0 && $mismatch } {
                report_mismatch eOut_2 $cyclenum
            }
            if { [catch {exa mismatch_eOut_3} mismatch] == 0 && $mismatch } {
                report_mismatch eOut_3 $cyclenum
            }
            if { [catch {exa mismatch_eOut_4} mismatch] == 0 && $mismatch } {
                report_mismatch eOut_4 $cyclenum
            }
            if { [catch {exa mismatch_eOut_5} mismatch] == 0 && $mismatch } {
                report_mismatch eOut_5 $cyclenum
            }
            if { [catch {exa mismatch_eOut_6} mismatch] == 0 && $mismatch } {
                report_mismatch eOut_6 $cyclenum
            }
            if { [catch {exa mismatch_eOut_7} mismatch] == 0 && $mismatch } {
                report_mismatch eOut_7 $cyclenum
            }
        } else {
            puts "Signal mismatch detected at $my_tb";
        }
        if {$quit_at_end == 1} {
            quit -code 1;
        }
    }
    eval vsim -quiet -suppress 14408 -error 3473 -msgmode both -voptargs="+acc" -t ps ca_interp_DUT_Summer_DUC_Poly_phase_Interp_scale_HB3_im_atb $ll
    do $base_dir/ca_interp/ca_interp_DUT_Summer_DUC_Poly_phase_Interp_scale_HB3_im_atb.wav.do
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
