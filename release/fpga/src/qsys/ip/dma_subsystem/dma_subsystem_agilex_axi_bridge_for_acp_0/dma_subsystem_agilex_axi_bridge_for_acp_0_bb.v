module dma_subsystem_agilex_axi_bridge_for_acp_0 #(
		parameter WSTRB_WIDTH = 64
	) (
		input  wire         clk,             //     clock.clk
		input  wire         reset,           //     reset.reset
		input  wire         csr_clk,         // csr_clock.clk
		input  wire         csr_reset,       // csr_reset.reset
		input  wire         addr,            //       csr.address
		input  wire         read,            //          .read
		input  wire         write,           //          .write
		input  wire [31:0]  writedata,       //          .writedata
		output wire [31:0]  readdata,        //          .readdata
		output wire [33:0]  axm_m0_araddr,   //        m0.araddr
		output wire [1:0]   axm_m0_arburst,  //          .arburst
		output wire [3:0]   axm_m0_arcache,  //          .arcache
		output wire [4:0]   axm_m0_arid,     //          .arid
		output wire [7:0]   axm_m0_arlen,    //          .arlen
		output wire         axm_m0_arlock,   //          .arlock
		output wire [2:0]   axm_m0_arprot,   //          .arprot
		output wire [3:0]   axm_m0_arqos,    //          .arqos
		input  wire         axm_m0_arready,  //          .arready
		output wire [2:0]   axm_m0_arsize,   //          .arsize
		output wire         axm_m0_arvalid,  //          .arvalid
		output wire [3:0]   axm_m0_arsnoop,  //          .arsnoop
		output wire [1:0]   axm_m0_ardomain, //          .ardomain
		output wire [1:0]   axm_m0_arbar,    //          .arbar
		output wire [22:0]  axm_m0_aruser,   //          .aruser
		output wire [33:0]  axm_m0_awaddr,   //          .awaddr
		output wire [1:0]   axm_m0_awburst,  //          .awburst
		output wire [3:0]   axm_m0_awcache,  //          .awcache
		output wire [4:0]   axm_m0_awid,     //          .awid
		output wire [7:0]   axm_m0_awlen,    //          .awlen
		output wire         axm_m0_awlock,   //          .awlock
		output wire [2:0]   axm_m0_awprot,   //          .awprot
		input  wire         axm_m0_awready,  //          .awready
		output wire [2:0]   axm_m0_awsize,   //          .awsize
		output wire         axm_m0_awvalid,  //          .awvalid
		output wire [3:0]   axm_m0_awqos,    //          .awqos
		input  wire [4:0]   axm_m0_bid,      //          .bid
		output wire         axm_m0_bready,   //          .bready
		input  wire [1:0]   axm_m0_bresp,    //          .bresp
		input  wire         axm_m0_bvalid,   //          .bvalid
		input  wire [511:0] axm_m0_rdata,    //          .rdata
		input  wire [4:0]   axm_m0_rid,      //          .rid
		input  wire         axm_m0_rlast,    //          .rlast
		output wire         axm_m0_rready,   //          .rready
		input  wire [1:0]   axm_m0_rresp,    //          .rresp
		input  wire         axm_m0_rvalid,   //          .rvalid
		output wire [511:0] axm_m0_wdata,    //          .wdata
		output wire         axm_m0_wlast,    //          .wlast
		input  wire         axm_m0_wready,   //          .wready
		output wire [63:0]  axm_m0_wstrb,    //          .wstrb
		output wire         axm_m0_wvalid,   //          .wvalid
		output wire [2:0]   axm_m0_awsnoop,  //          .awsnoop
		output wire [1:0]   axm_m0_awdomain, //          .awdomain
		output wire [1:0]   axm_m0_awbar,    //          .awbar
		output wire [22:0]  axm_m0_awuser,   //          .awuser
		input  wire [33:0]  axs_s0_araddr,   //        s0.araddr
		input  wire [1:0]   axs_s0_arburst,  //          .arburst
		input  wire [3:0]   axs_s0_arcache,  //          .arcache
		input  wire [3:0]   axs_s0_arid,     //          .arid
		input  wire [7:0]   axs_s0_arlen,    //          .arlen
		input  wire         axs_s0_arlock,   //          .arlock
		input  wire [2:0]   axs_s0_arprot,   //          .arprot
		output wire         axs_s0_arready,  //          .arready
		input  wire [2:0]   axs_s0_arsize,   //          .arsize
		input  wire         axs_s0_arvalid,  //          .arvalid
		input  wire [33:0]  axs_s0_awaddr,   //          .awaddr
		input  wire [1:0]   axs_s0_awburst,  //          .awburst
		input  wire [3:0]   axs_s0_awcache,  //          .awcache
		input  wire [3:0]   axs_s0_awid,     //          .awid
		input  wire [7:0]   axs_s0_awlen,    //          .awlen
		input  wire         axs_s0_awlock,   //          .awlock
		input  wire [2:0]   axs_s0_awprot,   //          .awprot
		output wire         axs_s0_awready,  //          .awready
		input  wire [2:0]   axs_s0_awsize,   //          .awsize
		input  wire         axs_s0_awvalid,  //          .awvalid
		output wire [3:0]   axs_s0_bid,      //          .bid
		input  wire         axs_s0_bready,   //          .bready
		output wire [1:0]   axs_s0_bresp,    //          .bresp
		output wire         axs_s0_bvalid,   //          .bvalid
		output wire [511:0] axs_s0_rdata,    //          .rdata
		output wire [3:0]   axs_s0_rid,      //          .rid
		output wire         axs_s0_rlast,    //          .rlast
		input  wire         axs_s0_rready,   //          .rready
		output wire [1:0]   axs_s0_rresp,    //          .rresp
		output wire         axs_s0_rvalid,   //          .rvalid
		input  wire [511:0] axs_s0_wdata,    //          .wdata
		input  wire         axs_s0_wlast,    //          .wlast
		output wire         axs_s0_wready,   //          .wready
		input  wire [63:0]  axs_s0_wstrb,    //          .wstrb
		input  wire         axs_s0_wvalid    //          .wvalid
	);
endmodule

