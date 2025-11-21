module sys_manager (
		input  wire        clk_100_in_clk_clk,                               //                           clk_100_in_clk.clk
		output wire        clk_100_out_clk_clk,                              //                          clk_100_out_clk.clk
		input  wire        dma_subsys_port0_rx_dma_resetn_clk_clk,           //       dma_subsys_port0_rx_dma_resetn_clk.clk
		input  wire        dma_subsys_port0_rx_dma_resetn_in_reset_reset_n,  //  dma_subsys_port0_rx_dma_resetn_in_reset.reset_n
		output wire        dma_subsys_port0_rx_dma_resetn_out_reset_reset_n, // dma_subsys_port0_rx_dma_resetn_out_reset.reset_n
		input  wire        dma_subsys_port1_rx_dma_resetn_clk_clk,           //       dma_subsys_port1_rx_dma_resetn_clk.clk
		input  wire        dma_subsys_port1_rx_dma_resetn_in_reset_reset_n,  //  dma_subsys_port1_rx_dma_resetn_in_reset.reset_n
		output wire        dma_subsys_port1_rx_dma_resetn_out_reset_reset_n, // dma_subsys_port1_rx_dma_resetn_out_reset.reset_n
		input  wire        ftile_iopll_ptp_sampling_refclk_clk,              //          ftile_iopll_ptp_sampling_refclk.clk
		input  wire        ftile_iopll_ptp_sampling_reset_reset,             //           ftile_iopll_ptp_sampling_reset.reset
		output wire        ftile_iopll_ptp_sampling_outclk0_clk,             //         ftile_iopll_ptp_sampling_outclk0.clk
		input  wire        ftile_iopll_todsync_sampling_refclk_clk,          //      ftile_iopll_todsync_sampling_refclk.clk
		output wire        ftile_iopll_todsync_sampling_locked_lock,         //      ftile_iopll_todsync_sampling_locked.lock
		input  wire        ftile_iopll_todsync_sampling_reset_reset,         //       ftile_iopll_todsync_sampling_reset.reset
		output wire        ftile_iopll_todsync_sampling_outclk0_clk,         //     ftile_iopll_todsync_sampling_outclk0.clk
		input  wire        qsys_top_master_todclk_0_in_clk_clk,              //          qsys_top_master_todclk_0_in_clk.clk
		output wire        qsys_top_master_todclk_0_out_clk_clk,             //         qsys_top_master_todclk_0_out_clk.clk
		input  wire        rst_in_clk_clk,                                   //                               rst_in_clk.clk
		input  wire        rst_in_in_reset_reset_n,                          //                          rst_in_in_reset.reset_n
		output wire        rst_in_out_reset_reset_n,                         //                         rst_in_out_reset.reset_n
		input  wire        sysid_clk_clk,                                    //                                sysid_clk.clk
		input  wire        sysid_reset_reset_n,                              //                              sysid_reset.reset_n
		output wire [31:0] sysid_control_slave_readdata,                     //                      sysid_control_slave.readdata
		input  wire        sysid_control_slave_address,                      //                                         .address
		output wire        user_rst_clkgate_0_ninit_done_ninit_done          //            user_rst_clkgate_0_ninit_done.ninit_done
	);
endmodule

