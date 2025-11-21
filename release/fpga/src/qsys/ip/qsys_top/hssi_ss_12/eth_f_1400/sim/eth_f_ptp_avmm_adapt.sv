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


module eth_f_ptp_avmm_adapt 
#( 
    parameter ADDR_WIDTH = 17
) (
	input  logic                  i_clk, 
	input  logic                  i_rst,
	
	//--------------------------------------------------------------------
	//AIB6
	input  logic [ADDR_WIDTH-1:0] 	i_avmm_s32_addr_aib6,
	input  logic [31:0]           	i_avmm_s32_wdata_aib6,
	input  logic                  	i_avmm_s32_write_aib6,
	input  logic                  	i_avmm_s32_read_aib6,
	input  logic [3:0]            	i_avmm_s32_byte_enable_aib6,
	output logic [31:0]           	o_avmm_s32_readdata_aib6,
	output logic                  	o_avmm_s32_waitrequest_aib6,
	output logic                  	o_avmm_s32_readdatavalid_aib6,
	
	input   logic              		pld_avmm1_busy_aib6,
	output  logic              		pld_avmm1_clk_rowclk_aib6,
	input   logic              		pld_avmm1_cmdfifo_wr_full_aib6,
	input   logic              		pld_avmm1_cmdfifo_wr_pfull_aib6,
	output  logic              		pld_avmm1_read_aib6,
	input   logic  [7:0]       		pld_avmm1_readdata_aib6,
	input   logic              		pld_avmm1_readdatavalid_aib6,
	output  logic  [9:0]       		pld_avmm1_reg_addr_aib6,
	output  logic              		pld_avmm1_request_aib6,
	output  logic  [8:0]       		pld_avmm1_reserved_in_aib6,
	input   logic  [2:0]       		pld_avmm1_reserved_out_aib6,
	output  logic              		pld_avmm1_write_aib6,
	output  logic  [7:0]       		pld_avmm1_writedata_aib6,
	input   logic              		pld_chnl_cal_done_aib6,
	input   logic              		pld_hssi_osc_transfer_en_aib6,
	
	//--------------------------------------------------------------------
	//AIB7
	input  logic [ADDR_WIDTH-1:0] 	i_avmm_s32_addr_aib7,
	input  logic [31:0]           	i_avmm_s32_wdata_aib7,
	input  logic                  	i_avmm_s32_write_aib7,
	input  logic                  	i_avmm_s32_read_aib7,
	input  logic [3:0]            	i_avmm_s32_byte_enable_aib7,
	output logic [31:0]           	o_avmm_s32_readdata_aib7,
	output logic                  	o_avmm_s32_waitrequest_aib7,
	output logic                  	o_avmm_s32_readdatavalid_aib7,
   
	input   logic              		pld_avmm1_busy_aib7,
	output  logic              		pld_avmm1_clk_rowclk_aib7,
	input   logic              		pld_avmm1_cmdfifo_wr_full_aib7,
	input   logic              		pld_avmm1_cmdfifo_wr_pfull_aib7,
	output  logic              		pld_avmm1_read_aib7,
	input   logic  [7:0]       		pld_avmm1_readdata_aib7,
	input   logic              		pld_avmm1_readdatavalid_aib7,
	output  logic  [9:0]       		pld_avmm1_reg_addr_aib7,
	output  logic              		pld_avmm1_request_aib7,
	output  logic  [8:0]       		pld_avmm1_reserved_in_aib7,
	input   logic  [2:0]       		pld_avmm1_reserved_out_aib7,
	output  logic              		pld_avmm1_write_aib7,
	output  logic  [7:0]       		pld_avmm1_writedata_aib7,
	input   logic              		pld_chnl_cal_done_aib7,
	input   logic              		pld_hssi_osc_transfer_en_aib7
);

	logic [17:0] 	avmm_m8_addr_aib6;
	logic [7:0]  	avmm_m8_wdata_aib6;
	logic      		avmm_m8_write_aib6;
	logic      		avmm_m8_read_aib6;
	logic [7:0]		avmm_m8_readdata_aib6;  
	logic      		avmm_m8_waitrequest_aib6;
	
	logic [17:0] 	avmm_m8_addr_aib7;
	logic [7:0]  	avmm_m8_wdata_aib7;
	logic      		avmm_m8_write_aib7;
	logic      		avmm_m8_read_aib7;
	logic [7:0]		avmm_m8_readdata_aib7;  
	logic      		avmm_m8_waitrequest_aib7;

	//----------------------------------------------------
	//AIB6
	eth_f_ft_avmm_32to8_bridge #(
		.ADDR_WIDTH	(17)
	) avmm_32b_to_8b_aib6 (
	// AVMM slave port  
		.i_clk                    (i_clk),
		.i_rst                    (i_rst),
 
		.i_avmm_s32_addr          (i_avmm_s32_addr_aib6),
		.i_avmm_s32_wdata         (i_avmm_s32_wdata_aib6),
		.i_avmm_s32_write         (i_avmm_s32_write_aib6),
		.i_avmm_s32_read          (i_avmm_s32_read_aib6),
		.i_avmm_s32_byte_enable   (i_avmm_s32_byte_enable_aib6),
		.o_avmm_s32_readdata      (o_avmm_s32_readdata_aib6),
		.o_avmm_s32_waitrequest   (o_avmm_s32_waitrequest_aib6),
		.o_avmm_s32_readdatavalid (o_avmm_s32_readdatavalid_aib6),

	// AVMM Master Port
		.o_avmm_m8_addr           (avmm_m8_addr_aib6), 			//[17]: DW access
		.o_avmm_m8_wdata          (avmm_m8_wdata_aib6),
		.o_avmm_m8_write          (avmm_m8_write_aib6),
		.o_avmm_m8_read           (avmm_m8_read_aib6),
		.i_avmm_m8_readdata       (avmm_m8_readdata_aib6),
		.i_avmm_m8_waitrequest    (avmm_m8_waitrequest_aib6)
	);
	
	logic [1:0] addr_b9_b8_aib6;
	assign addr_b9_b8_aib6 = {1'b0, avmm_m8_addr_aib6[17]};
	
	eth_f_ctfb_avmm1_soft_logic #(
		.avmm_interfaces	(1),  		//Number of AVMM interfaces required - one for each bonded_lane, PLL, and Master CGkjkB
		.rcfg_enable     	(1)   		//Enable/disable reconfig interface in the Native PHY or PLL IP
	) ctf_avmm1_soft_logic_aib6 (
	//PORT_LIST_START
	// AVMM slave interface signals (user)
		.avmm_clk                   		(i_clk),
		.avmm_reset                 		(i_rst),
		.avmm_writedata             		(avmm_m8_wdata_aib6),
		.avmm_address               		({addr_b9_b8_aib6, avmm_m8_addr_aib6[7:0]}), 
		.avmm_reservedin            		(avmm_m8_addr_aib6[16:8]), 				
		.avmm_write                 		(avmm_m8_write_aib6),
		.avmm_read                  		(avmm_m8_read_aib6),
		.avmm_readdata              		(avmm_m8_readdata_aib6),
		.avmm_waitrequest           		(avmm_m8_waitrequest_aib6),
	// Signals from AVMM1 building block
		.pld_avmm1_busy_real        		(pld_avmm1_busy_aib6),
		.pld_avmm1_cmdfifo_wr_full_real 	(pld_avmm1_cmdfifo_wr_full_aib6),
		.pld_avmm1_cmdfifo_wr_pfull_real	(pld_avmm1_cmdfifo_wr_pfull_aib6),
		.pld_avmm1_readdata_real   			(pld_avmm1_readdata_aib6), 
		.pld_avmm1_readdatavalid_real		(pld_avmm1_readdatavalid_aib6),
		.pld_avmm1_reserved_out_real 		(pld_avmm1_reserved_out_aib6), 
		.pld_chnl_cal_done_real      		(pld_chnl_cal_done_aib6), 
		.pld_hssi_osc_transfer_en_real 		(pld_hssi_osc_transfer_en_aib6),
	// Signals to AVMM1 building block
		.pld_avmm1_clk_rowclk_real    		(pld_avmm1_clk_rowclk_aib6),
		.pld_avmm1_read_real          		(pld_avmm1_read_aib6),
		.pld_avmm1_reg_addr_real      		(pld_avmm1_reg_addr_aib6),
		.pld_avmm1_request_real       		(pld_avmm1_request_aib6),
		.pld_avmm1_reserved_in_real   		(pld_avmm1_reserved_in_aib6), 
		.pld_avmm1_write_real         		(pld_avmm1_write_aib6),
		.pld_avmm1_writedata_real     		(pld_avmm1_writedata_aib6) 
	//PORT_LIST_END
);
	
	
	//----------------------------------------------------
	//AIB7	
	eth_f_ft_avmm_32to8_bridge #(
		.ADDR_WIDTH	(17)
	) avmm_32b_to_8b_aib7 (
	// AVMM slave port  
		.i_clk                    (i_clk),
		.i_rst                    (i_rst),
 
		.i_avmm_s32_addr          (i_avmm_s32_addr_aib7),
		.i_avmm_s32_wdata         (i_avmm_s32_wdata_aib7),
		.i_avmm_s32_write         (i_avmm_s32_write_aib7),
		.i_avmm_s32_read          (i_avmm_s32_read_aib7),
		.i_avmm_s32_byte_enable   (i_avmm_s32_byte_enable_aib7),
		.o_avmm_s32_readdata      (o_avmm_s32_readdata_aib7),
		.o_avmm_s32_waitrequest   (o_avmm_s32_waitrequest_aib7),
		.o_avmm_s32_readdatavalid (o_avmm_s32_readdatavalid_aib7),

	// AVMM Master Port
		.o_avmm_m8_addr           (avmm_m8_addr_aib7), 			//[17]: DW access
		.o_avmm_m8_wdata          (avmm_m8_wdata_aib7),
		.o_avmm_m8_write          (avmm_m8_write_aib7),
		.o_avmm_m8_read           (avmm_m8_read_aib7),
		.i_avmm_m8_readdata       (avmm_m8_readdata_aib7),
		.i_avmm_m8_waitrequest    (avmm_m8_waitrequest_aib7)
	);
	
	logic [1:0] addr_b9_b8_aib7;
	assign addr_b9_b8_aib7 = {1'b0, avmm_m8_addr_aib7[17]};
	
 	eth_f_ctfb_avmm1_soft_logic #(
		.avmm_interfaces	(1),  		//Number of AVMM interfaces required - one for each bonded_lane, PLL, and Master CGkjkB
		.rcfg_enable     	(1)   		//Enable/disable reconfig interface in the Native PHY or PLL IP
	) ctf_avmm1_soft_logic_aib7 (
	//PORT_LIST_START
	// AVMM slave interface signals (user)
		.avmm_clk                   		(i_clk),
		.avmm_reset                 		(i_rst),
		.avmm_writedata             		(avmm_m8_wdata_aib7),
		.avmm_address               		({addr_b9_b8_aib7, avmm_m8_addr_aib7[7:0]}), 
		.avmm_reservedin            		(avmm_m8_addr_aib7[16:8]), 				
		.avmm_write                 		(avmm_m8_write_aib7),
		.avmm_read                  		(avmm_m8_read_aib7),
		.avmm_readdata              		(avmm_m8_readdata_aib7),
		.avmm_waitrequest           		(avmm_m8_waitrequest_aib7),
	// Signals from AVMM1 building block
		.pld_avmm1_busy_real        		(pld_avmm1_busy_aib7),
		.pld_avmm1_cmdfifo_wr_full_real 	(pld_avmm1_cmdfifo_wr_full_aib7),
		.pld_avmm1_cmdfifo_wr_pfull_real	(pld_avmm1_cmdfifo_wr_pfull_aib7),
		.pld_avmm1_readdata_real   			(pld_avmm1_readdata_aib7), 
		.pld_avmm1_readdatavalid_real		(pld_avmm1_readdatavalid_aib7),
		.pld_avmm1_reserved_out_real 		(pld_avmm1_reserved_out_aib7), 
		.pld_chnl_cal_done_real      		(pld_chnl_cal_done_aib7), 
		.pld_hssi_osc_transfer_en_real 		(pld_hssi_osc_transfer_en_aib7),
	// Signals to AVMM1 building block
		.pld_avmm1_clk_rowclk_real    		(pld_avmm1_clk_rowclk_aib7),
		.pld_avmm1_read_real          		(pld_avmm1_read_aib7),
		.pld_avmm1_reg_addr_real      		(pld_avmm1_reg_addr_aib7),
		.pld_avmm1_request_real       		(pld_avmm1_request_aib7),
		.pld_avmm1_reserved_in_real   		(pld_avmm1_reserved_in_aib7), 
		.pld_avmm1_write_real         		(pld_avmm1_write_aib7),
		.pld_avmm1_writedata_real     		(pld_avmm1_writedata_aib7) 
	//PORT_LIST_END
);


endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX8zaX8GasiLWKI1YrlPspb/88mjdRqPI/J27z3TNGpYR/PicMbPuukEhI5MTwVuam82FQF8BaigrR0dqyEPUxPI0JOxB+muoE3M4VzdmWR9rSjf+Nco+qU/OKewOZl2maPkMo2G29dboJ4V3LSSc43PhVsjIKJI32EHNb1garhTg+q6LJ7CwIkcx0th+5sZDLdVsSEVLshXjARrXnf499eREajpiVa/y77sCVk0N4x6odTy4e5XMCGYX0SeI0FuLEPW++ES6oMa1iMMDsUrEgAMNDgbOW1FjABpmnvqylabOeTZKbtyPsIpYsgJ7OLaB2m9oqaXFWmgnlPkL6+kuvQDzY4OjzvqwxI2HoNpKtYap/X4y8cbgBSDD8RehH4j28tjCIo1btlH55/O+J1fg0sTDPyJWbGMDq/4XC5L8yZsj7mNleE3m4RJPXkZTcsKjUU8O/oScmHaC5Hgq0q5TkCvqv43KHyIyiM74z3Kfc+YXSVyiA6DMyRMrNqIDvIDdaI+FWGqTdnXPD70aPuj8TZnqQUWnHHPoaJfUeLbIIkqeeRaByBoh9Sg9dyw4O96vti/n0J32/HKGdr5Tsk4yjr8hVSsA0BhKaEAwaaFVS8oKUqbXaaiaCdymmvOpkkRtAjvBsFAxIoMrFeLBuLjKezqq8G7DJ8vz2s0qb+J1YEnOqJwe5OZ5eXd8Iu0hxqOI5ANH7DEDrtkG8BMpDedE+/oS+GUGDd1voC4bGMXupk9h0C4TzjVO8n7l1Hv9H4g3VOdIAHnqxgKO+r8DoBtw37Z"
`endif