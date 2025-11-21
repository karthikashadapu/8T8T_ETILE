module ghrd_f_master_tod #(
		parameter PERIOD_CLOCK_FREQUENCY        = 0,
		parameter OFFSET_JITTER_WANDER_EN       = 0,
		parameter DEFAULT_NSEC_PERIOD           = 6,
		parameter DEFAULT_FNSEC_PERIOD          = 26214,
		parameter DEFAULT_NSEC_ADJPERIOD        = 6,
		parameter DEFAULT_FNSEC_ADJPERIOD       = 26214,
		parameter PPS_PULSE_ASSERT_CYCLE_MASTER = 100000,
		parameter PLL_SCAN_CLK_FREQ             = 78,
		parameter UNIT_PHASE_SHIFT              = 88
	) (
		input  wire        clk,                        //            csr_clock.clk
		input  wire        rst_n,                      //            csr_reset.reset_n
		input  wire        period_clk,                 //         period_clock.clk
		input  wire        period_rst_n,               //   period_clock_reset.reset_n
		output wire [31:0] csr_readdata,               //                  csr.readdata
		input  wire        csr_write,                  //                     .write
		input  wire        csr_read,                   //                     .read
		input  wire [31:0] csr_writedata,              //                     .writedata
		output wire        csr_waitrequest,            //                     .waitrequest
		input  wire [3:0]  csr_address,                //                     .address
		output wire [95:0] time_of_day_96b,            //      time_of_day_96b.data
		output wire [63:0] time_of_day_64b,            //      time_of_day_64b.data
		input  wire [95:0] time_of_day_96b_load_data,  // time_of_day_96b_load.data
		input  wire        time_of_day_96b_load_valid, //                     .valid
		input  wire [63:0] time_of_day_64b_load_data,  // time_of_day_64b_load.data
		input  wire        time_of_day_64b_load_valid, //                     .valid
		input  wire        iopll_scan_clk,             //           scan_clock.clk
		input  wire        pps_sampling_clk,           //       sampling_clock.clk
		input  wire        iopll_phased_clk,           //         phased_clock.clk
		input  wire        iopll_locked,               //        pll_interface.lock
		input  wire        iopll_phase_done,           //                     .done
		output wire        iopll_phase_en,             //                     .enable
		output wire        iopll_updn,                 //                     .up_down
		output wire [2:0]  iopll_num_phase_shifts,     //                     .num
		output wire [4:0]  iopll_cnt_sel,              //                     .count_select
		output wire        pps_pulse_per_second        //        pps_interface.phased_pulse
	);
endmodule

