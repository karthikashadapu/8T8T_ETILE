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
module eth_f_ready_gen_100g_s #(
    parameter READY_LATENCY         = 0,
	parameter EHIP_RATE             = "100G",
	parameter OUTBLOCKS 		    = 4, 
	parameter MEMBLOCKS 			=  8 ,
    parameter MEMDEPTH  			= 'd32 ,
	parameter COMP                 = (EHIP_RATE == "100G") ? 8'd8 : 8'd2,
    parameter O_READY_USED         = (EHIP_RATE == "100G") ? 8'd11 : 6'd5
) (
    input   logic                    i_reset,
    input   logic                    i_clk,
    input   logic   [OUTBLOCKS-1:0]  i_num_write,
    input   logic                    i_read,
    output  logic                    o_ready
);

    logic   [$clog2(MEMDEPTH)+$clog2(MEMBLOCKS)-1:0]  num_write;
    logic   [$clog2(MEMDEPTH)+$clog2(MEMBLOCKS)-1:0]  num_read;
    logic   [$clog2(MEMDEPTH)+$clog2(MEMBLOCKS)-1:0]   num_add;
    logic   [$clog2(MEMDEPTH)+$clog2(MEMBLOCKS)-1:0]   num_remove;

    logic   [$clog2(MEMDEPTH)+$clog2(MEMBLOCKS)-1:0]  used;
    logic           ready_delay;

generate 
	if (EHIP_RATE == "100G") begin
		assign num_read     = {5'd0, i_read, 2'd0};
	end
	else begin
	    assign num_read     = {4'd0, i_read, 1'b0};
	end	
endgenerate

    assign num_write    = {4'd0, i_num_write};
    
    assign num_add      = ready_delay ? 8'd0 : COMP;
    assign num_remove   = o_ready ? 8'd0 : COMP;
	
generate 
if (EHIP_RATE == "100G") begin
    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            used <= 8'd0;
        end else begin
            used <= 8'(used + num_write + num_add - num_read - num_remove);
        end
    end
end
else begin
always_ff @(posedge i_clk) begin
        if (i_reset) begin
            used <= 6'd0;
        end else begin
            used <= 6'(used + num_write + num_add - num_read - num_remove);
        end
    end
end
endgenerate
	
    assign o_ready = (used < O_READY_USED);

    eth_f_delay_reg #(
        .CYCLES (READY_LATENCY),
        .WIDTH  (1)
    ) dv (
        .clk    (i_clk),
        .din    (o_ready),
        .dout   (ready_delay)
    );

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onqyHFr95N23oBw87Tem7kTNUwSZvcuehAe+B/Ndjtef2EzGFIQpQnnWTGR/bfKrFqcOwprUmsDQvl9pvZFgrQqyyIVTMMBLl8zoOUbW411tyBxZWHLP39rI4WUZQiahr50225tR34bUVldeZ6GO0uTFop6k3I2a/wft8ln7xjI7FyZhqxfUJhHqa8OOR8bK3TuRyernxZNxL7pB6DGkBAcA/uFQkQSgxMDVKJhBlnThI3JwxM82L0wI2pSElFcoUVuvnv5e0fx2r6T0Fr7qsiKgO+DljiDj73XDIFnSiCeyLdfPJdpTgw2/+xNBkCioccd1O/eMbOBOc/QBPRMwjwE0BFDvD761H7BZvbP9uPNU58FCGeuYBaWLLiMHVo1Nsla1E8T51M73oGnJAre5wApAgxO4mmN1+++h6xVwhqJeWqRCyh5VrNtQ5hE7QRO6pwP8uKcpODVC9l7kEmIGONhUQCFGa56tvenBB1X1Pi+npzzRg4RU+zlT9pKXq3AhPidGOS0OS8Wxn9wR74z137EJmgt/CBX6vJIvms5y0w6FrE7+xFHkUsUDaabAuBfbP6FSjGKN6+25I9+wvvLXOGOdJlFQlMMx7r8bUri/VySiMdxtk3TVkv8FppaThu2avTSyb+aTKe0X0XB6LSriUowTeyKoiGsJgsYZOPCumPQeqzTzaz3y0UZ7Gym3y9nCXbdoq6/X2wTKbcWdfEoh79BaATwN+zuDTes9YACj4yhKnGhBsb310njdELEfq6SYTtSRixv/TXVkn31EMKmxci5X"
`endif