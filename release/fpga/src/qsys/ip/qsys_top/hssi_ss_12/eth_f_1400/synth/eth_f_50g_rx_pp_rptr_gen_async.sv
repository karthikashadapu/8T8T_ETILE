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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on
module eth_f_50g_rx_pp_rptr_gen_async (              
    input   logic               i_clk,
    input   logic   [6:0]       i_ptr,
    output  logic   [0:3][4:0]  o_ptr
);

    always_ff @(posedge i_clk) begin
        case (i_ptr[1:0])
            2'd0 : o_ptr <= {i_ptr[6:2],        i_ptr[6:2], i_ptr[6:2], i_ptr[6:2] - 1'd1};
            2'd1 : o_ptr <= {i_ptr[6:2],        i_ptr[6:2], i_ptr[6:2], i_ptr[6:2]};
            2'd2 : o_ptr <= {i_ptr[6:2],        i_ptr[6:2], i_ptr[6:2], i_ptr[6:2]};
            2'd3 : o_ptr <= {i_ptr[6:2] + 1'd1, i_ptr[6:2], i_ptr[6:2], i_ptr[6:2]};
        endcase
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onqlYSLfaO0Q1c+BP0sJnOFfzbtP2Nba8wbT7IUnk3hh+X0zE/NcR7db5t6FLf7UHZn/Wx1gvxkCNfRyZZU7YfpOJnp3a3qPRE6JLdARUICxmC/BANeg0OiGvmDrsg26WQJTnei9AlwHJO61avWA0LolZ9ijiQgqKBlbLdIaMb7gkcnPVv53iAssL8AVPnye3yF7LW9BdgeTI36TEWmsX6vSTzBNR3OKR3IsveN/LVz1JPGRBxGpMYUmy8Oto4wqygrgpUuDK4Vy1iCGvAwkvO8se6O74oExtWLp9lfPr8dxYSgJoQAkrfCNGRs7rw0rV7TimqtGGVqwYQ1iqQh8mefb6GywxOTiB+tXgFy8yJW6weiEmo/zdH+cRMnOfGc8+zqHV9438Uh3F67NsnIO5nikA1RF3sEzaewa8NXzUyr79S+fxaLXirxtkyFZrnYhOyqkml9kl1GisnlY9XYC1JKIixQGvoVG5mNMAAoBxHD6ipNPe6cgjVtq0L+6WR5V9lWxX80tn8pLW0JaRjDI95NogYnZXtED/RRqRKx5vBZjKsA8+ILeY3bppTpZhIS2hE8VOlc6NEmcy3A8lGVwYcjVnLjXZN7edKYfn5hUq4u+f43sJYfwtT7nICeHkM+IWeNkDMcjlKiovthM/Rbk0sdcKZE81iUvbPXMDWO6aD5rEIS2hawUeDv3qPACXEEeNdLlJYsNMq62dJROGGibBIB9balqg9aa8AQTJrrLfid+cKM2hZvKoQf6CNpE9ITmzOJWQU0CX1M6sAf0CTM0r6qY"
`endif