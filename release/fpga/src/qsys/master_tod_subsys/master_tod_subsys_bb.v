module master_tod_subsys (
		input  wire        master_tod_top_0_csr_write,                                //                       master_tod_top_0_csr.write
		input  wire [31:0] master_tod_top_0_csr_writedata,                            //                                           .writedata
		input  wire        master_tod_top_0_csr_read,                                 //                                           .read
		output wire [31:0] master_tod_top_0_csr_readdata,                             //                                           .readdata
		output wire        master_tod_top_0_csr_waitrequest,                          //                                           .waitrequest
		input  wire [3:0]  master_tod_top_0_csr_address,                              //                                           .address
		input  wire        master_tod_top_0_i_clk_tod_clk,                            //                 master_tod_top_0_i_clk_tod.clk
		input  wire        master_tod_top_0_i_reconfig_rst_n_reset_n,                 //          master_tod_top_0_i_reconfig_rst_n.reset_n
		input  wire        master_tod_top_0_i_tod_rst_n_reset_n,                      //               master_tod_top_0_i_tod_rst_n.reset_n
		output wire        master_tod_top_0_pulse_per_second_pps,                     //          master_tod_top_0_pulse_per_second.pps
		output wire        master_tod_top_0_avst_tod_data_valid,                      //             master_tod_top_0_avst_tod_data.valid
		output wire [95:0] master_tod_top_0_avst_tod_data_data,                       //                                           .data
		input  wire        master_tod_top_0_i_upstr_pll_lock,                         //               master_tod_top_0_i_upstr_pll.lock
		input  wire        mtod_subsys_clk100_in_clk_clk,                             //                  mtod_subsys_clk100_in_clk.clk
		input  wire        mtod_subsys_pps_load_tod_0_period_clock_clk,               //    mtod_subsys_pps_load_tod_0_period_clock.clk
		input  wire        mtod_subsys_pps_load_tod_0_reset_reset,                    //           mtod_subsys_pps_load_tod_0_reset.reset
		input  wire        mtod_subsys_pps_load_tod_0_csr_reset_reset,                //       mtod_subsys_pps_load_tod_0_csr_reset.reset
		output wire [31:0] mtod_subsys_pps_load_tod_0_csr_readdata,                   //             mtod_subsys_pps_load_tod_0_csr.readdata
		input  wire        mtod_subsys_pps_load_tod_0_csr_write,                      //                                           .write
		input  wire        mtod_subsys_pps_load_tod_0_csr_read,                       //                                           .read
		input  wire [31:0] mtod_subsys_pps_load_tod_0_csr_writedata,                  //                                           .writedata
		output wire        mtod_subsys_pps_load_tod_0_csr_waitrequest,                //                                           .waitrequest
		input  wire [5:0]  mtod_subsys_pps_load_tod_0_csr_address,                    //                                           .address
		input  wire        mtod_subsys_pps_load_tod_0_pps_interface_pulse_per_second, //   mtod_subsys_pps_load_tod_0_pps_interface.pulse_per_second
		input  wire [95:0] mtod_subsys_pps_load_tod_0_time_of_day_96b_data,           // mtod_subsys_pps_load_tod_0_time_of_day_96b.data
		output wire        mtod_subsys_pps_load_tod_0_pps_irq_irq,                    //         mtod_subsys_pps_load_tod_0_pps_irq.irq
		input  wire        mtod_subsys_rstn_in_reset_reset_n                          //                  mtod_subsys_rstn_in_reset.reset_n
	);
endmodule

