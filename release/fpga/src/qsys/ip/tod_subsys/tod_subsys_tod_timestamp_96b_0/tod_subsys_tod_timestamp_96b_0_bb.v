module tod_subsys_tod_timestamp_96b_0 (
		input  wire         clk_tod,                          //                    clk_tod.clk
		input  wire         rst_clk_tod_n,                    //              rst_clk_tod_n.reset_n
		input  wire         clk_100,                          //                    clk_100.clk
		input  wire         system_reset_n,                   //             system_reset_n.reset_n
		input  wire         pps_in,                           //                     pps_in.pps_in
		output wire         irq_delay_pulse,                  //            irq_delay_pulse.irq
		input  wire [95:0]  eth_tod_master_96b_tx,            //      eth_tod_master_96b_tx.data
		output wire [95:0]  eth_tod_master_96b_tx_load_data,  // eth_tod_master_96b_tx_load.data
		output wire         eth_tod_master_96b_tx_load_valid, //                           .valid
		output wire         rfp_sync_pul,                     //               rfp_sync_pul.data
		output wire         rfp_sync_pul_cpri,                //          rfp_sync_pul_cpri.cpri_aux_rx_rfp_l1_cpri
		input  wire [4:0]   csr_address,                      //      tod_timestamp_96b_csr.address
		input  wire         csr_write,                        //                           .write
		input  wire         csr_read,                         //                           .read
		input  wire [31:0]  csr_writedata,                    //                           .writedata
		output wire [31:0]  csr_readdata,                     //                           .readdata
		output wire         csr_waitrequest,                  //                           .waitrequest
		output wire         csr_readdatavalid,                //                           .readdatavalid
		input  wire         ram_read,                         //          tod_timestamp_mem.read
		output wire [127:0] ram_q,                            //                           .readdata
		output wire         rfp_sync_pul_dup                  //           rfp_sync_pul_dup.data
	);
endmodule

