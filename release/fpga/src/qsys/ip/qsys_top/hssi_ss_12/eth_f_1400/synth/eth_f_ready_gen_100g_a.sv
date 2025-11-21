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
module eth_f_ready_gen_100g_a #(
    parameter READY_LATENCY         = 0,
	parameter EHIP_RATE             = "100G",
	parameter OUTBLOCKS             = 4,
	parameter MEMBLOCKS             = 8,
    parameter MEMDEPTH              = 'd32,
	parameter COMP1                = (EHIP_RATE == "100G") ? 8'd8 : 8'd2,
	parameter VIRTUAL_USED_PRAM    = (EHIP_RATE == "100G") ? 8'd39 : 6'd17	
) (
    input   logic                     i_reset,
    input   logic                     i_clk,
    input   logic   [OUTBLOCKS-1:0]   i_num_write,
    input   logic   [5:0]             i_read_ptr,
    output  logic                     o_ready
);

    logic   [$clog2(MEMDEPTH)+$clog2(MEMBLOCKS)-1:0]   virtual_writes;
    logic   [$clog2(MEMDEPTH)+$clog2(MEMBLOCKS)-1:0]   virtual_used;
    logic           partial_full;
    logic           ready_delay;

    logic   [$clog2(MEMDEPTH)+$clog2(MEMBLOCKS)-1:0]   num_add;
    logic   [$clog2(MEMDEPTH)+$clog2(MEMBLOCKS)-1:0]   num_remove;

generate 
	if (EHIP_RATE == "100G") begin
		assign virtual_used = 8'(virtual_writes - {i_read_ptr,2'd0});
	end
	else begin
	    assign virtual_used = 6'(virtual_writes - {i_read_ptr[4:0], 1'b0});
	end	
endgenerate
 


    assign partial_full = (virtual_used >= VIRTUAL_USED_PRAM);
    assign o_ready      = !partial_full;

	 assign num_add      = ready_delay ? 8'd0 : COMP1;
    assign num_remove   = o_ready ? 8'd0 : COMP1;

generate	
if (EHIP_RATE == "100G") begin
  always_ff @(posedge i_clk) begin	  
			if (i_reset) begin
				virtual_writes  <= 8'd0;
			end 
			else begin
				virtual_writes  <= 8'(virtual_writes + i_num_write + num_add - num_remove);
			end
	end
end
else begin
    always_ff @(posedge i_clk) begin
			if (i_reset) begin
				virtual_writes <= 6'd0;
			end 
			else begin
				virtual_writes <= 6'(virtual_writes + i_num_write + num_add - num_remove);
			end
	end
end	     
endgenerate

    eth_f_delay_reg #(
        .CYCLES (READY_LATENCY),
        .WIDTH  (1)
    ) delay_rdy_fb (
        .clk    (i_clk),
        .din    (o_ready),
        .dout   (ready_delay)
    );
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onpbBftIRDk0BL2F1HEaWlMBUviK5szdTR0myku/3YP1LS/RPg9ZP2O/QIpuMNwP7YnTCStQKznmcvXw1870E8LuFAj5Fmw0c0Ba6GYvKflLc9mxEoNOZzsIEC2lsWiNmlMbrhmX19Rjt3b0L+nEb/WQDDLYmtIhawQummvbCu6+CTzJL7kf199R7PX0dCvAyzy1KxXGNFvWmpanZ6CoejicYJ6+JrVW/QJQ42gq48OSxgk/lZoKZbSHOjymuCZ9Um0sP1Hl7n2ipdVBfWN6RqVgFv4yHBgbJ8CxztMh7iF3W8fcUz8q5R5vjL6EqY9qzszKGSfYGoLb3Oc/gH+rEh0NpYQWb+xKJAec6tnjB9RVVuUbCjOoQX25zKeJ1hR9fy7kx8pjtD2F/ohWI9Vd+SHsxU0bHTGI4awrxAC0wtbqllkjOoDiITAKcc8Va+1iBV1NGMBmLNzwRbTjn+MQX2+epKG5Kdx7KdFOTJ+HO/YnG45EhKzH55uStOCC6ki+xQFBBX6DRu8kSVl63MarwTaojTMHb7Ucp/qgkKxV0Iz52w4QjjwY3WJnXmS973fIfXj/54yCPdYtLsAeG26q8R7ZDVFkreTwbwOu70MlYQhYMzlpK6fec0wi38u3eCkAb3ncXG55hg7EUYaL6pO5W0kwBCT+Esg8LeLaJj1veldDEgTvO4/kX+5v226Nj3MGL0gTIoupVNeXZ5BoLc+k1K8EHNsMXUFfASy1vzs/eHLNjvTZfbjJqpTNrK0Dij3aWjo1vqH7HoVCpJv03XDVCPpJ"
`endif