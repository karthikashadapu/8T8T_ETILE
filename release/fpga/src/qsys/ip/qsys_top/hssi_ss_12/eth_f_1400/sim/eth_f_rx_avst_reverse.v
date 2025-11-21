// (C) 2001-2024 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


//------------------------------------------------------------------------------
// RX SEGEMNT to AVST interface bit re-ordering
//------------------------------------------------------------------------------

`timescale 1ps/1ps

module eth_f_rx_avst_reverse #(
       parameter AIB_LANES         = 1
)(
input  [AIB_LANES*64-1:0]  i_rx_data,
input  [AIB_LANES-1:0]     i_rx_inframe,
input  [AIB_LANES*3-1:0]   i_rx_empty,
input  [AIB_LANES*2-1:0]   i_rx_error,
input  [AIB_LANES-1:0]     i_rx_fcs_error,
input  [AIB_LANES*3-1:0]   i_rx_status,
output [AIB_LANES*64-1:0]  o_rx_data_avst,
output [AIB_LANES-1:0]     o_rx_inframe_avst,
output [AIB_LANES*3-1:0]   o_rx_empty_avst,
output [AIB_LANES-1:0]     o_rx_fcs_error_avst,
output [AIB_LANES*2-1:0]   o_rx_error_avst,
output [AIB_LANES*3-1:0]   o_rx_status_avst
);
       eth_f_reverse_bytes #(
            .NUM_BYTES      (AIB_LANES*8)
       ) reverse_data_rx (
            .din(i_rx_data),
            .dout(o_rx_data_avst)
       );
       eth_f_reverse_3bits #(
            .NUM_SYMBOL     (AIB_LANES)
       ) reverse_empty_rx (
            .din(i_rx_empty),
            .dout(o_rx_empty_avst)
       );
       eth_f_reverse_bits #(
            .WIDTH      (AIB_LANES)
       ) reverse_inframe_rx (
            .din(i_rx_inframe),
            .dout(o_rx_inframe_avst)
       );
       eth_f_reverse_2bits #(
            .NUM_SYMBOL     (AIB_LANES)
       ) reverse_error_rx (
            .din(i_rx_error),
            .dout(o_rx_error_avst)
       );
       eth_f_reverse_bits #(
            .WIDTH      (AIB_LANES)
       ) reverse_fcs_rx (
            .din(i_rx_fcs_error),
            .dout(o_rx_fcs_error_avst)
       );
       eth_f_reverse_3bits #(
            .NUM_SYMBOL     (AIB_LANES)
       ) reverse_status_rx (
            .din(i_rx_status),
            .dout(o_rx_status_avst)
       );

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onrFlrJpVJzg/erk/qvPj66zsqaIiGRPSh5SPaDDyqIgPuW2Sd886K486IeetGBLP1l198BDglLTVtCDy0GHjIbGKZloKc4jCVNEmqZdkY4gnXmkeFXKQCSbfhXVQ+MiTI+1k2CpREK4h4KiK/r5XYOFsMjebQn3gF0BicYjlZ2T2dc/HNZoLdSLdN9fq7nHE48QqXSN++jnwwo9dKicuFnVycNSuVhOpCIng/4g/4xfBIKfFBe8EPJptPENcl9OCsi9Vlkz2EJdjderNoYgwaBOsz9T1xfDSBD6POSM/nP2M+S6HxQstLCj7880RfCu3NsanX/OyN4DUyMSXS8WlWuNTeF1dKZv2hOHJMtcaQ/al3361ysDpL12U+UoumJ+oZ+94q9jZgzeScB0nnK0MrjP5SYVpG118+lxS/d/JZ0votqWzoVNtKo2tK/9W6IZVymmQSnLQihJgyoY9afo8giFu/SfTVjVC6fmy9YfZfXb1Po8zGg6fLrh2SCMWtAOZXjnBlSViGtnM4SUn95qQiyLGpHPnByhKglISpiJiqu8rJyzfiZOiUDIuLapX7OSvHWR5TeIA/mapaZmcdiWZlo5EWtisHhSuTR+ikCpAMpPg+4ftheSNeSUjJ4P10yNpjEQZbyoC+Yy8DpsZXjKufw422mOVL8QGWWLuk3ZrE15AfvCR1Am+UZoD10/h8VtlPYMyyB7nR6aKYD1mIR8Mre0VEVljxMDQ/HA46OUY1C9Av9SzifL34es5cbvU9+WnzCYZcJ6Y03NVR/W4Pj+/B3z"
`endif