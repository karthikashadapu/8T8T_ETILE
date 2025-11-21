module subsys_jtg_mst (
		output wire [31:0]  fpga_m_master_address,          //    fpga_m_master.address
		input  wire [31:0]  fpga_m_master_readdata,         //                 .readdata
		output wire         fpga_m_master_read,             //                 .read
		output wire         fpga_m_master_write,            //                 .write
		output wire [31:0]  fpga_m_master_writedata,        //                 .writedata
		input  wire         fpga_m_master_waitrequest,      //                 .waitrequest
		input  wire         fpga_m_master_readdatavalid,    //                 .readdatavalid
		output wire [3:0]   fpga_m_master_byteenable,       //                 .byteenable
		output wire         fpga_m2ocm_pb_s0_waitrequest,   // fpga_m2ocm_pb_s0.waitrequest
		output wire [127:0] fpga_m2ocm_pb_s0_readdata,      //                 .readdata
		output wire         fpga_m2ocm_pb_s0_readdatavalid, //                 .readdatavalid
		input  wire [0:0]   fpga_m2ocm_pb_s0_burstcount,    //                 .burstcount
		input  wire [127:0] fpga_m2ocm_pb_s0_writedata,     //                 .writedata
		input  wire [17:0]  fpga_m2ocm_pb_s0_address,       //                 .address
		input  wire         fpga_m2ocm_pb_s0_write,         //                 .write
		input  wire         fpga_m2ocm_pb_s0_read,          //                 .read
		input  wire [15:0]  fpga_m2ocm_pb_s0_byteenable,    //                 .byteenable
		input  wire         fpga_m2ocm_pb_s0_debugaccess,   //                 .debugaccess
		input  wire         fpga_m2ocm_pb_m0_waitrequest,   // fpga_m2ocm_pb_m0.waitrequest
		input  wire [127:0] fpga_m2ocm_pb_m0_readdata,      //                 .readdata
		input  wire         fpga_m2ocm_pb_m0_readdatavalid, //                 .readdatavalid
		output wire [0:0]   fpga_m2ocm_pb_m0_burstcount,    //                 .burstcount
		output wire [127:0] fpga_m2ocm_pb_m0_writedata,     //                 .writedata
		output wire [17:0]  fpga_m2ocm_pb_m0_address,       //                 .address
		output wire         fpga_m2ocm_pb_m0_write,         //                 .write
		output wire         fpga_m2ocm_pb_m0_read,          //                 .read
		output wire [15:0]  fpga_m2ocm_pb_m0_byteenable,    //                 .byteenable
		output wire         fpga_m2ocm_pb_m0_debugaccess,   //                 .debugaccess
		output wire [31:0]  hps_m_master_address,           //     hps_m_master.address
		input  wire [31:0]  hps_m_master_readdata,          //                 .readdata
		output wire         hps_m_master_read,              //                 .read
		output wire         hps_m_master_write,             //                 .write
		output wire [31:0]  hps_m_master_writedata,         //                 .writedata
		input  wire         hps_m_master_waitrequest,       //                 .waitrequest
		input  wire         hps_m_master_readdatavalid,     //                 .readdatavalid
		output wire [3:0]   hps_m_master_byteenable,        //                 .byteenable
		input  wire         clk_clk,                        //              clk.clk
		input  wire         reset_reset_n                   //            reset.reset_n
	);
endmodule

