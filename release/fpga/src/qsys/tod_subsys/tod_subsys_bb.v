module tod_subsys (
		input  wire        cdc_pipeline_0_dst_clk_clk,                                          //                                         cdc_pipeline_0_dst_clk.clk
		input  wire        cdc_pipeline_0_rst_dst_clk_n_reset_n,                                //                                   cdc_pipeline_0_rst_dst_clk_n.reset_n
		output wire [95:0] cdc_pipeline_0_dataout_data,                                         //                                         cdc_pipeline_0_dataout.data
		input  wire        clock_bridge_100_in_clk_clk,                                         //                                        clock_bridge_100_in_clk.clk
		input  wire        clock_bridge_156_in_clk_clk,                                         //                                        clock_bridge_156_in_clk.clk
		input  wire        reset_bridge_100_in_reset_reset_n,                                   //                                      reset_bridge_100_in_reset.reset_n
		input  wire        reset_bridge_156_in_reset_reset,                                     //                                      reset_bridge_156_in_reset.reset
		output wire [95:0] tod_sync_interface_adapter_0_0_tx2_tod_master_data_data,             //             tod_sync_interface_adapter_0_0_tx2_tod_master_data.data
		input  wire        tod_timestamp_96b_0_pps_in_pps_in,                                   //                                     tod_timestamp_96b_0_pps_in.pps_in
		output wire        tod_timestamp_96b_0_rfp_sync_pul_data,                               //                               tod_timestamp_96b_0_rfp_sync_pul.data
		input  wire [4:0]  tod_timestamp_96b_0_tod_timestamp_96b_csr_address,                   //                      tod_timestamp_96b_0_tod_timestamp_96b_csr.address
		input  wire        tod_timestamp_96b_0_tod_timestamp_96b_csr_write,                     //                                                               .write
		input  wire        tod_timestamp_96b_0_tod_timestamp_96b_csr_read,                      //                                                               .read
		input  wire [31:0] tod_timestamp_96b_0_tod_timestamp_96b_csr_writedata,                 //                                                               .writedata
		output wire [31:0] tod_timestamp_96b_0_tod_timestamp_96b_csr_readdata,                  //                                                               .readdata
		output wire        tod_timestamp_96b_0_tod_timestamp_96b_csr_waitrequest,               //                                                               .waitrequest
		output wire        tod_timestamp_96b_0_tod_timestamp_96b_csr_readdatavalid,             //                                                               .readdatavalid
		output wire        tod_timestamp_96b_0_rfp_sync_pul_dup_data,                           //                           tod_timestamp_96b_0_rfp_sync_pul_dup.data
		input  wire        master_tod_top_0_csr_write,                                          //                                           master_tod_top_0_csr.write
		input  wire [31:0] master_tod_top_0_csr_writedata,                                      //                                                               .writedata
		input  wire        master_tod_top_0_csr_read,                                           //                                                               .read
		output wire [31:0] master_tod_top_0_csr_readdata,                                       //                                                               .readdata
		output wire        master_tod_top_0_csr_waitrequest,                                    //                                                               .waitrequest
		input  wire [3:0]  master_tod_top_0_csr_address,                                        //                                                               .address
		input  wire        master_tod_top_0_i_reconfig_rst_n_reset_n,                           //                              master_tod_top_0_i_reconfig_rst_n.reset_n
		output wire        master_tod_top_0_pulse_per_second_pps,                               //                              master_tod_top_0_pulse_per_second.pps
		input  wire        mtod_subsys_master_tod_top_0_i_upstr_pll_lock,                       //                       mtod_subsys_master_tod_top_0_i_upstr_pll.lock
		input  wire        mtod_subsys_clk100_in_clk_clk,                                       //                                      mtod_subsys_clk100_in_clk.clk
		input  wire        mtod_subsys_pps_load_tod_0_period_clock_clk,                         //                        mtod_subsys_pps_load_tod_0_period_clock.clk
		input  wire        mtod_subsys_pps_load_tod_0_reset_reset,                              //                               mtod_subsys_pps_load_tod_0_reset.reset
		input  wire        mtod_subsys_pps_load_tod_0_csr_reset_reset,                          //                           mtod_subsys_pps_load_tod_0_csr_reset.reset
		output wire [31:0] mtod_subsys_pps_load_tod_0_csr_readdata,                             //                                 mtod_subsys_pps_load_tod_0_csr.readdata
		input  wire        mtod_subsys_pps_load_tod_0_csr_write,                                //                                                               .write
		input  wire        mtod_subsys_pps_load_tod_0_csr_read,                                 //                                                               .read
		input  wire [31:0] mtod_subsys_pps_load_tod_0_csr_writedata,                            //                                                               .writedata
		output wire        mtod_subsys_pps_load_tod_0_csr_waitrequest,                          //                                                               .waitrequest
		input  wire [5:0]  mtod_subsys_pps_load_tod_0_csr_address,                              //                                                               .address
		input  wire        mtod_subsys_pps_in_pulse_per_second,                                 //                                             mtod_subsys_pps_in.pulse_per_second
		input  wire [95:0] master_tod_subsys_0_mtod_subsys_pps_load_tod_0_time_of_day_96b_data, // master_tod_subsys_0_mtod_subsys_pps_load_tod_0_time_of_day_96b.data
		output wire        mtod_subsys_pps_load_tod_0_pps_irq_irq,                              //                             mtod_subsys_pps_load_tod_0_pps_irq.irq
		input  wire        mtod_subsys_rstn_in_reset_reset_n,                                   //                                      mtod_subsys_rstn_in_reset.reset_n
		output wire [95:0] tod_slave_sub_system_0_master_tod_split_conduit_end_10_data,         //         tod_slave_sub_system_0_master_tod_split_conduit_end_10.data
		output wire        tod_slave_sub_system_0_master_tod_split_conduit_end_10_valid,        //                                                               .valid
		input  wire        tod_slave_oran_tod_stack_tx_clk_clk,                                 //                                tod_slave_oran_tod_stack_tx_clk.clk
		input  wire        tod_slave_oran_tod_stack_rx_clk_clk,                                 //                                tod_slave_oran_tod_stack_rx_clk.clk
		input  wire        tod_slave_oran_tod_stack_todsync_sample_clk_clk,                     //                    tod_slave_oran_tod_stack_todsync_sample_clk.clk
		output wire [95:0] tx_oran_tod_time_of_day_96b_tdata,                                   //                                    tx_oran_tod_time_of_day_96b.tdata
		output wire        tx_oran_tod_time_of_day_96b_tvalid,                                  //                                                               .tvalid
		output wire [95:0] rx_oran_tod_time_of_day_96b_tdata,                                   //                                    rx_oran_tod_time_of_day_96b.tdata
		output wire        rx_oran_tod_time_of_day_96b_tvalid,                                  //                                                               .tvalid
		input  wire        tod_slave_port_8_tod_stack_tx_clk_clk,                               //                              tod_slave_port_8_tod_stack_tx_clk.clk
		input  wire        tod_slave_port_8_tod_stack_rx_clk_clk,                               //                              tod_slave_port_8_tod_stack_rx_clk.clk
		input  wire        tod_slave_port_8_tod_stack_todsync_sample_clk_clk,                   //                  tod_slave_port_8_tod_stack_todsync_sample_clk.clk
		output wire [95:0] tod_slave_port_8_tod_stack_tx_tod_interface_tdata,                   //                    tod_slave_port_8_tod_stack_tx_tod_interface.tdata
		output wire        tod_slave_port_8_tod_stack_tx_tod_interface_tvalid,                  //                                                               .tvalid
		output wire [95:0] tod_slave_port_8_tod_stack_rx_tod_interface_tdata,                   //                    tod_slave_port_8_tod_stack_rx_tod_interface.tdata
		output wire        tod_slave_port_8_tod_stack_rx_tod_interface_tvalid,                  //                                                               .tvalid
		input  wire        tod_slave_subsys_port_8_tod_stack_tx_pll_locked_lock,                //                tod_slave_subsys_port_8_tod_stack_tx_pll_locked.lock
		input  wire        tod_slave_tod_subsys_clk_100_in_clk_clk,                             //                            tod_slave_tod_subsys_clk_100_in_clk.clk
		input  wire        tod_slave_tod_subsys_mtod_clk_in_clk_clk,                            //                           tod_slave_tod_subsys_mtod_clk_in_clk.clk
		input  wire        tod_slave_tod_subsys_rst_100_in_reset_reset_n,                       //                          tod_slave_tod_subsys_rst_100_in_reset.reset_n
		input  wire [0:0]  tod_slave_todsync_sample_plllock_split_conduit_end_lock              //         tod_slave_todsync_sample_plllock_split_conduit_end_1_1.lock
	);
endmodule

