module ddr4_wr_rd (
		input  wire [20:0]  emif_mm_slave_0_address,        //     emif_mm_slave_0.address
		input  wire         emif_mm_slave_0_read,           //                    .read
		output wire [127:0] emif_mm_slave_0_readdata,       //                    .readdata
		input  wire         emif_mm_slave_0_write,          //                    .write
		input  wire [127:0] emif_mm_slave_0_writedata,      //                    .writedata
		output wire         emif_mm_slave_0_readdatavalid,  //                    .readdatavalid
		output wire         emif_mm_slave_0_waitrequest,    //                    .waitrequest
		input  wire [15:0]  emif_mm_slave_0_byteenable,     //                    .byteenable
		input  wire [6:0]   emif_mm_slave_0_burstcount,     //                    .burstcount
		input  wire         addr_span_0_cntl_read,          //    addr_span_0_cntl.read
		output wire [63:0]  addr_span_0_cntl_readdata,      //                    .readdata
		input  wire         addr_span_0_cntl_write,         //                    .write
		input  wire [63:0]  addr_span_0_cntl_writedata,     //                    .writedata
		input  wire [7:0]   addr_span_0_cntl_byteenable,    //                    .byteenable
		input  wire [20:0]  emif_mm_slave_1_address,        //     emif_mm_slave_1.address
		input  wire         emif_mm_slave_1_read,           //                    .read
		output wire [127:0] emif_mm_slave_1_readdata,       //                    .readdata
		input  wire         emif_mm_slave_1_write,          //                    .write
		input  wire [127:0] emif_mm_slave_1_writedata,      //                    .writedata
		output wire         emif_mm_slave_1_readdatavalid,  //                    .readdatavalid
		output wire         emif_mm_slave_1_waitrequest,    //                    .waitrequest
		input  wire [15:0]  emif_mm_slave_1_byteenable,     //                    .byteenable
		input  wire [6:0]   emif_mm_slave_1_burstcount,     //                    .burstcount
		input  wire         addr_span_1_cntl_read,          //    addr_span_1_cntl.read
		output wire [63:0]  addr_span_1_cntl_readdata,      //                    .readdata
		input  wire         addr_span_1_cntl_write,         //                    .write
		input  wire [63:0]  addr_span_1_cntl_writedata,     //                    .writedata
		input  wire [7:0]   addr_span_1_cntl_byteenable,    //                    .byteenable
		output wire [31:0]  wr_msgdma_ddr_address,          //       wr_msgdma_ddr.address
		output wire         wr_msgdma_ddr_read,             //                    .read
		input  wire         wr_msgdma_ddr_waitrequest,      //                    .waitrequest
		input  wire [127:0] wr_msgdma_ddr_readdata,         //                    .readdata
		output wire         wr_msgdma_ddr_write,            //                    .write
		output wire [127:0] wr_msgdma_ddr_writedata,        //                    .writedata
		input  wire         wr_msgdma_ddr_readdatavalid,    //                    .readdatavalid
		output wire [15:0]  wr_msgdma_ddr_byteenable,       //                    .byteenable
		output wire [6:0]   wr_msgdma_ddr_burstcount,       //                    .burstcount
		input  wire         in_clk_clk,                     //              in_clk.clk
		output wire         csr_bridge_s0_waitrequest,      //       csr_bridge_s0.waitrequest
		output wire [31:0]  csr_bridge_s0_readdata,         //                    .readdata
		output wire         csr_bridge_s0_readdatavalid,    //                    .readdatavalid
		input  wire [0:0]   csr_bridge_s0_burstcount,       //                    .burstcount
		input  wire [31:0]  csr_bridge_s0_writedata,        //                    .writedata
		input  wire [5:0]   csr_bridge_s0_address,          //                    .address
		input  wire         csr_bridge_s0_write,            //                    .write
		input  wire         csr_bridge_s0_read,             //                    .read
		input  wire [3:0]   csr_bridge_s0_byteenable,       //                    .byteenable
		input  wire         csr_bridge_s0_debugaccess,      //                    .debugaccess
		input  wire [12:0]  ocm_rd_address,                 //              ocm_rd.address
		input  wire         ocm_rd_read,                    //                    .read
		output wire [127:0] ocm_rd_readdata,                //                    .readdata
		input  wire         ocm_rd_clk_clk,                 //          ocm_rd_clk.clk
		input  wire         ocm_rd_reset_reset,             //        ocm_rd_reset.reset
		input  wire         ocm_rd_reset_reset_req,         //                    .reset_req
		input  wire         emif_mm_master_1_waitrequest,   //    emif_mm_master_1.waitrequest
		input  wire [127:0] emif_mm_master_1_readdata,      //                    .readdata
		input  wire         emif_mm_master_1_readdatavalid, //                    .readdatavalid
		output wire [6:0]   emif_mm_master_1_burstcount,    //                    .burstcount
		output wire [127:0] emif_mm_master_1_writedata,     //                    .writedata
		output wire [9:0]   emif_mm_master_1_address,       //                    .address
		output wire         emif_mm_master_1_write,         //                    .write
		output wire         emif_mm_master_1_read,          //                    .read
		output wire [15:0]  emif_mm_master_1_byteenable,    //                    .byteenable
		output wire         emif_mm_master_1_debugaccess,   //                    .debugaccess
		input  wire         in_reset_reset_n,               //            in_reset.reset_n
		output wire         wr_msgdma_0_csr_irq_irq,        // wr_msgdma_0_csr_irq.irq
		input  wire [127:0] wr_msgdma_0_st_sink_data,       // wr_msgdma_0_st_sink.data
		input  wire         wr_msgdma_0_st_sink_valid,      //                    .valid
		output wire         wr_msgdma_0_st_sink_ready       //                    .ready
	);
endmodule

