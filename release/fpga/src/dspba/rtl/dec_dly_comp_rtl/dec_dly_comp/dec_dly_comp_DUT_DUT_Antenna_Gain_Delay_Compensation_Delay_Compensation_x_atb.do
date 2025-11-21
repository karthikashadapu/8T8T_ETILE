# pass in -Gquit_at_end=true to make vsim call exit at the end. Useful for running standalone.
quietly set quit_at_end 0
if {[lsearch $argv -Gquit_at_end=true] != -1} {
    quietly set quit_at_end 1
}

if {$argc > 0} {
    quietly set base_dir $1
} else {
    quietly set base_dir "./../../rtl/dec_dly_comp_rtl"
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

if {! [file exists $base_dir/standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_x]} {
    file delete -force $base_dir/standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_x
}

project new $base_dir standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_x
if {! [file exists $base_dir/work/_info]} {
    file delete -force $base_dir/work
    vlib work
}
quietly vmap work $base_dir/work

do "$base_dir/dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_x_fpc.do"


quietly set vcomfailed 0
onerror {
    quietly set vcomfailed 1
    resume
}

project addfile $base_dir/dec_dly_comp/dec_dly_comp_DUT_safe_path_msim_ver.sv systemverilog
project addfile $base_dir/dec_dly_comp/dec_dly_comp_DUT_safe_path_msim.vhd vhdl
project addfile $base_dir/dec_dly_comp/standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_x.sv systemverilog
project addfile $base_dir/dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation.sv systemverilog
project addfile $base_dir/dec_dly_comp/busFabric_dec_dly_comp_DUT_2o1ix4a06j686w6r6g6u0qu5xgbuoz.sv systemverilog
puts {Note: Process variables may be optimized out of top-level testbench. Re-compile with the following command to disable optimizations:}
puts {vcom -quiet -O0 $base_dir/dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_x_atb.vhd}
project addfile $base_dir/dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_x_atb.vhd vhdl
project addfile $base_dir/dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_x_stm.vhd vhdl
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
            if { [catch {exa mismatch_altq_0im} mismatch] == 0 && $mismatch } {
                report_mismatch altq_0im $cyclenum
            }
            if { [catch {exa mismatch_altq_0re} mismatch] == 0 && $mismatch } {
                report_mismatch altq_0re $cyclenum
            }
            if { [catch {exa mismatch_altq_1im} mismatch] == 0 && $mismatch } {
                report_mismatch altq_1im $cyclenum
            }
            if { [catch {exa mismatch_altq_1re} mismatch] == 0 && $mismatch } {
                report_mismatch altq_1re $cyclenum
            }
            if { [catch {exa mismatch_altq_2im} mismatch] == 0 && $mismatch } {
                report_mismatch altq_2im $cyclenum
            }
            if { [catch {exa mismatch_altq_2re} mismatch] == 0 && $mismatch } {
                report_mismatch altq_2re $cyclenum
            }
            if { [catch {exa mismatch_altq_3im} mismatch] == 0 && $mismatch } {
                report_mismatch altq_3im $cyclenum
            }
            if { [catch {exa mismatch_altq_3re} mismatch] == 0 && $mismatch } {
                report_mismatch altq_3re $cyclenum
            }
            if { [catch {exa mismatch_altv_s} mismatch] == 0 && $mismatch } {
                report_mismatch altv_s $cyclenum
            }
            if { [catch {exa mismatch_altc_s} mismatch] == 0 && $mismatch } {
                report_mismatch altc_s $cyclenum
            }
            if { [catch {exa mismatch_altq1_0im} mismatch] == 0 && $mismatch } {
                report_mismatch altq1_0im $cyclenum
            }
            if { [catch {exa mismatch_altq1_0re} mismatch] == 0 && $mismatch } {
                report_mismatch altq1_0re $cyclenum
            }
            if { [catch {exa mismatch_altq1_1im} mismatch] == 0 && $mismatch } {
                report_mismatch altq1_1im $cyclenum
            }
            if { [catch {exa mismatch_altq1_1re} mismatch] == 0 && $mismatch } {
                report_mismatch altq1_1re $cyclenum
            }
            if { [catch {exa mismatch_altq1_2im} mismatch] == 0 && $mismatch } {
                report_mismatch altq1_2im $cyclenum
            }
            if { [catch {exa mismatch_altq1_2re} mismatch] == 0 && $mismatch } {
                report_mismatch altq1_2re $cyclenum
            }
            if { [catch {exa mismatch_altq1_3im} mismatch] == 0 && $mismatch } {
                report_mismatch altq1_3im $cyclenum
            }
            if { [catch {exa mismatch_altq1_3re} mismatch] == 0 && $mismatch } {
                report_mismatch altq1_3re $cyclenum
            }
            if { [catch {exa mismatch_altqv1_s} mismatch] == 0 && $mismatch } {
                report_mismatch altqv1_s $cyclenum
            }
            if { [catch {exa mismatch_altc1_s} mismatch] == 0 && $mismatch } {
                report_mismatch altc1_s $cyclenum
            }
        } else {
            puts "Signal mismatch detected at $my_tb";
        }
        if {$quit_at_end == 1} {
            quit -code 1;
        }
    }
    eval vsim -quiet -suppress 14408 -error 3473 -msgmode both -voptargs="+acc" -t ps standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_x_atb $ll
    do $base_dir/dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_x_atb.wav.do
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
