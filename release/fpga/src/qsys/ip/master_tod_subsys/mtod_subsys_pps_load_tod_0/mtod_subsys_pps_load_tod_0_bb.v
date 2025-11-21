module mtod_subsys_pps_load_tod_0 (
		input  wire        period_clock,                //          period_clock.clk
		input  wire        reset,                       //                 reset.reset
		input  wire        csr_clock,                   //             csr_clock.clk
		input  wire        csr_reset,                   //             csr_reset.reset
		output wire [31:0] csr_readdata,                //                   csr.readdata
		input  wire        csr_write,                   //                      .write
		input  wire        csr_read,                    //                      .read
		input  wire [31:0] csr_writedata,               //                      .writedata
		output wire        csr_waitrequest,             //                      .waitrequest
		input  wire [5:0]  csr_address,                 //                      .address
		input  wire        pps_pulse_per_second,        //         pps_interface.pulse_per_second
		input  wire [95:0] time_of_day_96b,             //       time_of_day_96b.data
		output wire [95:0] time_of_data_96b_load_data,  // time_of_data_96b_load.data
		output wire        time_of_data_96b_load_valid, //                      .valid
		output wire        pps_irq                      //               pps_irq.irq
	);
endmodule

