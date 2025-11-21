set StdArithNoWarnings 1
set NumericStdNoWarnings 1

if {$1=="1"} {
  add wave -r -ports sim:/top/* 
}

if {$3=="1"} {
  coverage exclude -du work.ecpri_hwtcl_top 
  coverage exclude -du work.oran_hwtcl_top 
  coverage exclude -du work.fifo_status_monitoring 
  coverage exclude -du work.ul_top 
  coverage exclude -du work.ul_ant_mux 
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[0]/u_ff_128i_128o_4096d_ul_sc
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[0]/u_ff_128i_128o_4096d_ul_sc/fifo_0
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[0]/u_ff_128i_128o_4096d_ul_time_ref_sc/
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[0]/u_ff_128i_128o_4096d_ul_time_ref_sc/fifo_0
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[0]/u_ff_32i_128o_8d_dc
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[0]/u_ff_32i_128o_8d_dc/fifo_0
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[0]/u_ff_32i_128o_8d_ul_time_ref_dc
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[0]/u_ff_32i_128o_8d_ul_time_ref_dc/fifo_0
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[1]/u_ff_128i_128o_4096d_ul_sc
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[1]/u_ff_128i_128o_4096d_ul_sc/fifo_0
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[1]/u_ff_128i_128o_4096d_ul_time_ref_sc/
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[1]/u_ff_128i_128o_4096d_ul_time_ref_sc/fifo_0
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[1]/u_ff_32i_128o_8d_dc
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[1]/u_ff_32i_128o_8d_dc/fifo_0
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[1]/u_ff_32i_128o_8d_ul_time_ref_dc
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/FFT_SLICE[1]/u_ff_32i_128o_8d_ul_time_ref_dc/fifo_0
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/u_ff_8i_8o_64d_dc
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ul_top/u_ul_ant_mux/u_ff_8i_8o_64d_dc/fifo_0
  
  ### Exclusion for Capture Buffer and its intsances
  
  coverage exclude -du work.capture_if 
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_ecpri_block_capture/u_trigger_event_pipe
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_dsp_block_capture/u_trigger_event_pipe
  
  ### Exclusion for Timestamp and its Instances
  
  coverage exclude -du work.xran_timestamp
  coverage exclude -scope /top/wrapper_inst/wrapper_wrapper_top/wrapper_wrapper_top/u_xran_timestamp/u_ff_64i_64o_4096kd/fifo_0/
  
  ### Exclusions of Libraries SC FIFO DC FIFO
  
  coverage exclude -src $2/eda/sim_lib/altera_mf.v 
  coverage exclude -src $2/eda/sim_lib/altera_lnsim.sv 
  coverage exclude -src $2/eda/sim_lib/tennm_atoms.sv
}
run -all
