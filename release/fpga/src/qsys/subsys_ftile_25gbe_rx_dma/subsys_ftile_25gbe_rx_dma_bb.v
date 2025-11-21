module subsys_ftile_25gbe_rx_dma (
		input  wire         dma_clk_clk,                                //                 dma_clk.clk
		output wire         csr_waitrequest,                            //                     csr.waitrequest
		output wire [31:0]  csr_readdata,                               //                        .readdata
		output wire         csr_readdatavalid,                          //                        .readdatavalid
		input  wire [0:0]   csr_burstcount,                             //                        .burstcount
		input  wire [31:0]  csr_writedata,                              //                        .writedata
		input  wire [5:0]   csr_address,                                //                        .address
		input  wire         csr_write,                                  //                        .write
		input  wire         csr_read,                                   //                        .read
		input  wire [3:0]   csr_byteenable,                             //                        .byteenable
		input  wire         csr_debugaccess,                            //                        .debugaccess
		input  wire         pktin_startofpacket,                        //                   pktin.startofpacket
		input  wire         pktin_valid,                                //                        .valid
		input  wire         pktin_endofpacket,                          //                        .endofpacket
		input  wire [63:0]  pktin_data,                                 //                        .data
		input  wire [2:0]   pktin_empty,                                //                        .empty
		input  wire [5:0]   pktin_error,                                //                        .error
		input  wire         rx_dma_fifo_0_in_ts_valid,                  //     rx_dma_fifo_0_in_ts.valid
		input  wire [95:0]  rx_dma_fifo_0_in_ts_data,                   //                        .data
		input  wire         ftile_clk_clk,                              //               ftile_clk.clk
		output wire [36:0]  prefetcher_read_master_address,             //  prefetcher_read_master.address
		output wire         prefetcher_read_master_read,                //                        .read
		input  wire [127:0] prefetcher_read_master_readdata,            //                        .readdata
		input  wire         prefetcher_read_master_waitrequest,         //                        .waitrequest
		input  wire         prefetcher_read_master_readdatavalid,       //                        .readdatavalid
		output wire [2:0]   prefetcher_read_master_burstcount,          //                        .burstcount
		output wire [36:0]  prefetcher_write_master_address,            // prefetcher_write_master.address
		output wire         prefetcher_write_master_write,              //                        .write
		output wire [15:0]  prefetcher_write_master_byteenable,         //                        .byteenable
		output wire [127:0] prefetcher_write_master_writedata,          //                        .writedata
		input  wire         prefetcher_write_master_waitrequest,        //                        .waitrequest
		input  wire [1:0]   prefetcher_write_master_response,           //                        .response
		input  wire         prefetcher_write_master_writeresponsevalid, //                        .writeresponsevalid
		output wire         irq_irq,                                    //                     irq.irq
		input  wire         reset_reset_n,                              //                   reset.reset_n
		output wire [36:0]  write_master_address,                       //            write_master.address
		output wire         write_master_write,                         //                        .write
		output wire [15:0]  write_master_byteenable,                    //                        .byteenable
		output wire [127:0] write_master_writedata,                     //                        .writedata
		input  wire         write_master_waitrequest,                   //                        .waitrequest
		output wire [4:0]   write_master_burstcount,                    //                        .burstcount
		input  wire [1:0]   write_master_response,                      //                        .response
		input  wire         write_master_writeresponsevalid             //                        .writeresponsevalid
	);
endmodule

