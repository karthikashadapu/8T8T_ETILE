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


`timescale 1 ps / 1 ps

module  ddr4_wr_rd_intel_onchip_memory_1_intel_onchip_memory_148_3d3ll6i  (
    address,
    address2,
    byteenable,
    clk,
    clk2,
    read2,
    readdata2,
    reset,
    reset2,
    reset_req,
    reset_req2,
    write,
    writedata
    );

    parameter INIT_FILE = "ddr4_wr_rd_intel_onchip_memory_1_intel_onchip_memory_1.hex";

    input  [12:0]	address;
    input  [12:0]	address2;
    input  [15:0]	byteenable;
    input        	clk;
    input        	clk2;
    input        	read2;
    output [127:0]	readdata2;
    input        	reset;
    input        	reset2;
    input        	reset_req;
    input        	reset_req2;
    input        	write;
    input  [127:0]	writedata;

    wire    [127:0]	readdata2;
    wire    [127:0]	q_b;
    wire        	wren_a;
    wire        	clken_int;
    wire        	clken2_int;
    wire        	ram_clocken0;
    wire        	ram_clocken1;



    assign wren_a = write;

    assign readdata2 = q_b;

    assign clken_int = ~reset_req;
    assign clken2_int = ~reset_req2;



    assign ram_clocken0 = clken_int;

    assign ram_clocken1 = clken2_int;


    altera_syncram  altera_syncram_component (
                .address_a    	(address),
                .address_b    	(address2),
                .byteena_a    	(byteenable),
                .clock0    	(clk),
                .clock1    	(clk2),
                .clocken0    	(ram_clocken0),
                .clocken1    	(ram_clocken1),
                .data_a    	(writedata),
                .q_b    	(q_b),
                .rden_b    	(read2),
                .wren_a    	(wren_a),
                .aclr0    	(1'b0),
                .aclr1    	(1'b0),
                .address2_a    	(1'b1),
                .address2_b    	(1'b1),
                .addressstall_a    	(1'b0),
                .addressstall_b    	(1'b0),
                .byteena_b    	(1'b1),
                .clocken2    	(1'b1),
                .clocken3    	(1'b1),
                .data_b    	({128{1'b1}}),
                .eccencbypass    	(1'b0),
                .eccencparity    	(8'b0),
                .eccstatus    	(),
                .q_a    	(),
                .rden_a    	(1'b1),
                .sclr    	(1'b0),
                .wren_b    	(1'b0)
                );

    defparam
        altera_syncram_component.intended_device_family  	= "Agilex 7",
        altera_syncram_component.lpm_type  	= "altera_syncram",
        altera_syncram_component.operation_mode  	= "DUAL_PORT",
        altera_syncram_component.ram_block_type  	= "M20K",
        altera_syncram_component.byte_size  	= 8,
        altera_syncram_component.numwords_a  	= 8192,
        altera_syncram_component.numwords_b  	= 8192,
        altera_syncram_component.width_a  	= 128,
        altera_syncram_component.width_b  	= 128,
        altera_syncram_component.widthad_a  	= 13,
        altera_syncram_component.widthad_b  	= 13,
        altera_syncram_component.width_byteena_a  	= 16,
        altera_syncram_component.address_reg_b  	= "CLOCK1",
        altera_syncram_component.rdcontrol_reg_b  	= "CLOCK1",
        altera_syncram_component.outdata_reg_b  	= "UNREGISTERED",
        altera_syncram_component.outdata_aclr_b  	= "NONE",
        altera_syncram_component.outdata_sclr_b  	= "NONE",
        altera_syncram_component.clock_enable_input_a  	= "NORMAL",
        altera_syncram_component.clock_enable_output_a  	= "BYPASS",
        altera_syncram_component.clock_enable_input_b  	= "NORMAL",
        altera_syncram_component.clock_enable_output_b  	= "BYPASS",
        altera_syncram_component.init_file  	= INIT_FILE,
        altera_syncram_component.init_file_layout  	= "Port_A";



endmodule
