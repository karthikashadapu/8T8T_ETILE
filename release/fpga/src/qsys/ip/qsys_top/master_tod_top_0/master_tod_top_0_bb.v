module master_tod_top_0 #(
		parameter MASTER_PPS_CYCLE = 2
	) (
		input  wire        i_csr_write,          //                csr.write
		input  wire [31:0] i_csr_writedata,      //                   .writedata
		input  wire        i_csr_read,           //                   .read
		output wire [31:0] o_csr_readdata,       //                   .readdata
		output wire        o_csr_waitrequest,    //                   .waitrequest
		input  wire [3:0]  i_csr_addr,           //                   .address
		input  wire        i_clk_reconfig,       //     i_clk_reconfig.clk
		input  wire        i_clk_tod,            //          i_clk_tod.clk
		input  wire        i_reconfig_rst_n,     //   i_reconfig_rst_n.reset_n
		input  wire        i_tod_rst_n,          //        i_tod_rst_n.reset_n
		input  wire        i_tod_96b_load_valid, // avst_tod_load_data.valid
		input  wire [95:0] i_tod_96b_load_data,  //                   .data
		output wire        o_pps,                //   pulse_per_second.writeresponsevalid_n
		output wire        o_tod_96b_valid,      //      avst_tod_data.valid
		output wire [95:0] o_tod_96b_data,       //                   .data
		input  wire        i_upstr_pll_lock      //        i_upstr_pll.lock
	);
endmodule

