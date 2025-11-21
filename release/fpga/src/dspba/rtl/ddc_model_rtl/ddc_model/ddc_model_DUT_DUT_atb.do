# pass in -Gquit_at_end=true to make vsim call exit at the end. Useful for running standalone.
quietly set quit_at_end 0
if {[lsearch $argv -Gquit_at_end=true] != -1} {
    quietly set quit_at_end 1
}

if {$argc > 0} {
    quietly set base_dir $1
} else {
    quietly set base_dir "./../../rtl/ddc_model_rtl"
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

if {! [file exists $base_dir/ddc_model_DUT_DUT]} {
    file delete -force $base_dir/ddc_model_DUT_DUT
}

project new $base_dir ddc_model_DUT_DUT
if {! [file exists $base_dir/work/_info]} {
    file delete -force $base_dir/work
    vlib work
}
quietly vmap work $base_dir/work

do "$base_dir/ddc_model/ddc_model_DUT_DUT_fpc.do"


quietly set vcomfailed 0
onerror {
    quietly set vcomfailed 1
    resume
}

project addfile $base_dir/ddc_model/ddc_model_DUT_safe_path_msim_ver.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_safe_path_msim.vhd vhdl
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_chan_filter_Scale_re.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_chan_filter_Scaleim.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_chan_filter_im.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_chan_filter_re.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_routing_reg_chan_re.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_routing_reg_chan_re1.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1_Filter_Reconfig.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_routing_reg_hb72chan_l1.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_Scale.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_Const_sel.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB1.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB1_HB1_im.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB1_HB1_re.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB1_scale_HB1_im.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB1_scale_HB1_re.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB2.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB2_HB2_im.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB2_HB2_re.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB2_scale_HB2_im.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_HB2_scale_HB2_re.sv systemverilog
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_DDC_l1_x_routing_reg_hb62hb7.sv systemverilog
puts {Note: Process variables may be optimized out of top-level testbench. Re-compile with the following command to disable optimizations:}
puts {vcom -quiet -O0 $base_dir/ddc_model/ddc_model_DUT_DUT_atb.vhd}
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_atb.vhd vhdl
project addfile $base_dir/ddc_model/ddc_model_DUT_DUT_stm.vhd vhdl
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
            if { [catch {exa mismatch_out_1_imag_q1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_imag_q1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_1_real_q1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_1_real_q1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_2_q_v1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_2_q_v1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_3_q_c1_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_3_q_c1_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_4_0_imag_mixer_l1_dout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_4_0_imag_mixer_l1_dout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_4_0_real_mixer_l1_dout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_4_0_real_mixer_l1_dout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_4_1_imag_mixer_l1_dout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_4_1_imag_mixer_l1_dout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_4_1_real_mixer_l1_dout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_4_1_real_mixer_l1_dout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_4_2_imag_mixer_l1_dout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_4_2_imag_mixer_l1_dout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_4_2_real_mixer_l1_dout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_4_2_real_mixer_l1_dout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_4_3_imag_mixer_l1_dout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_4_3_imag_mixer_l1_dout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_4_3_real_mixer_l1_dout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_4_3_real_mixer_l1_dout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_5_mixer_l1_vout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_5_mixer_l1_vout_tpl $cyclenum
            }
            if { [catch {exa mismatch_out_6_mixer_l1_cout_tpl} mismatch] == 0 && $mismatch } {
                report_mismatch out_6_mixer_l1_cout_tpl $cyclenum
            }
        } else {
            puts "Signal mismatch detected at $my_tb";
        }
        if {$quit_at_end == 1} {
            quit -code 1;
        }
    }
    eval vsim -quiet -suppress 14408 -error 3473 -msgmode both -voptargs="+acc" -t ps ddc_model_DUT_DUT_atb $ll
    do $base_dir/ddc_model/ddc_model_DUT_DUT_atb.wav.do
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
