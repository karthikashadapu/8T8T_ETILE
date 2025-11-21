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

if {! [file exists $base_dir/duc_model_DUT]} {
    file delete -force $base_dir/duc_model_DUT
}

project new $base_dir duc_model_DUT
if {! [file exists $base_dir/work/_info]} {
    file delete -force $base_dir/work
    vlib work
}
quietly vmap work $base_dir/work

do "$base_dir/duc_model/duc_model_DUT_fpc.do"


quietly set vcomfailed 0
onerror {
    quietly set vcomfailed 1
    resume
}

project addfile $base_dir/duc_model/duc_model_DUT_safe_path_msim_ver.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_safe_path_msim.vhd vhdl
project addfile $base_dir/duc_model/duc_model_DUT.sv systemverilog
project addfile $base_dir/duc_model/busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_Scale.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_Scale1.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_Scale1.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_DUC_l1.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB1.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB1_HB1_im.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB1_HB1_re.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB1_scale_HB1_im.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB1_scale_HB1_re.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB2.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB2_HB2_im.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB2_HB2_re.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB2_scale_HB2_im.sv systemverilog
project addfile $base_dir/duc_model/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB2_scale_HB2_re.sv systemverilog
puts {Note: Process variables may be optimized out of top-level testbench. Re-compile with the following command to disable optimizations:}
puts {vcom -quiet -O0 $base_dir/duc_model/duc_model_DUT_atb.vhd}
project addfile $base_dir/duc_model/duc_model_DUT_atb.vhd vhdl
project addfile $base_dir/duc_model/duc_model_DUT_stm.vhd vhdl
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
            if { [catch {exa mismatch_DUC_Valid_Out_s} mismatch] == 0 && $mismatch } {
                report_mismatch DUC_Valid_Out_s $cyclenum
            }
            if { [catch {exa mismatch_DUC_Chan_Out_s} mismatch] == 0 && $mismatch } {
                report_mismatch DUC_Chan_Out_s $cyclenum
            }
            if { [catch {exa mismatch_DUC_Data_Out_0im} mismatch] == 0 && $mismatch } {
                report_mismatch DUC_Data_Out_0im $cyclenum
            }
            if { [catch {exa mismatch_DUC_Data_Out_0re} mismatch] == 0 && $mismatch } {
                report_mismatch DUC_Data_Out_0re $cyclenum
            }
            if { [catch {exa mismatch_DUC_Data_Out_1im} mismatch] == 0 && $mismatch } {
                report_mismatch DUC_Data_Out_1im $cyclenum
            }
            if { [catch {exa mismatch_DUC_Data_Out_1re} mismatch] == 0 && $mismatch } {
                report_mismatch DUC_Data_Out_1re $cyclenum
            }
            if { [catch {exa mismatch_DUC_Data_Out_2im} mismatch] == 0 && $mismatch } {
                report_mismatch DUC_Data_Out_2im $cyclenum
            }
            if { [catch {exa mismatch_DUC_Data_Out_2re} mismatch] == 0 && $mismatch } {
                report_mismatch DUC_Data_Out_2re $cyclenum
            }
            if { [catch {exa mismatch_DUC_Data_Out_3im} mismatch] == 0 && $mismatch } {
                report_mismatch DUC_Data_Out_3im $cyclenum
            }
            if { [catch {exa mismatch_DUC_Data_Out_3re} mismatch] == 0 && $mismatch } {
                report_mismatch DUC_Data_Out_3re $cyclenum
            }
            if { [catch {exa mismatch_duc_l1_vout_s} mismatch] == 0 && $mismatch } {
                report_mismatch duc_l1_vout_s $cyclenum
            }
            if { [catch {exa mismatch_duc_l1_cout_s} mismatch] == 0 && $mismatch } {
                report_mismatch duc_l1_cout_s $cyclenum
            }
            if { [catch {exa mismatch_duc_l1_dout_0im} mismatch] == 0 && $mismatch } {
                report_mismatch duc_l1_dout_0im $cyclenum
            }
            if { [catch {exa mismatch_duc_l1_dout_0re} mismatch] == 0 && $mismatch } {
                report_mismatch duc_l1_dout_0re $cyclenum
            }
            if { [catch {exa mismatch_duc_l1_dout_1im} mismatch] == 0 && $mismatch } {
                report_mismatch duc_l1_dout_1im $cyclenum
            }
            if { [catch {exa mismatch_duc_l1_dout_1re} mismatch] == 0 && $mismatch } {
                report_mismatch duc_l1_dout_1re $cyclenum
            }
            if { [catch {exa mismatch_duc_l1_dout_2im} mismatch] == 0 && $mismatch } {
                report_mismatch duc_l1_dout_2im $cyclenum
            }
            if { [catch {exa mismatch_duc_l1_dout_2re} mismatch] == 0 && $mismatch } {
                report_mismatch duc_l1_dout_2re $cyclenum
            }
            if { [catch {exa mismatch_duc_l1_dout_3im} mismatch] == 0 && $mismatch } {
                report_mismatch duc_l1_dout_3im $cyclenum
            }
            if { [catch {exa mismatch_duc_l1_dout_3re} mismatch] == 0 && $mismatch } {
                report_mismatch duc_l1_dout_3re $cyclenum
            }
        } else {
            puts "Signal mismatch detected at $my_tb";
        }
        if {$quit_at_end == 1} {
            quit -code 1;
        }
    }
    eval vsim -quiet -suppress 14408 -error 3473 -msgmode both -voptargs="+acc" -t ps duc_model_DUT_atb $ll
    do $base_dir/duc_model/duc_model_DUT_atb.wav.do
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
