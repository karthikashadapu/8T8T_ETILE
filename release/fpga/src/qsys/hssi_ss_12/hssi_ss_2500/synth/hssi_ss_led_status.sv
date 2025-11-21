// (C) 2001-2024 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


module hssi_ss_led_status (

			input 		reconfig_clk,
			input 		csr_rst_n,
			input 		pulse_10msec, //500msec pulse
			input			led_override_en, //bit-10 == 1'b1 and port match
			input [19:0] 	port_params,
			input 		cdr_lock,
			input     tx_lanes_stable,
      input     rx_pcs_ready,
      input 		tx_clk,
			input 		tx_tvalid,
			input 		rx_clk,
			input 		rx_tvalid,
			input  [2:0] 	csr_led_status,
			input  [2:0] 	csr_led_speed,
			output reg [2:0] 	led_status,
			output reg [2:0] 	led_speed
			);

//****************************************************************************************		
//****************************************************************************************		
	
logic tx_sig_det;
logic rx_sig_det;
logic pulse_10msec_tx_d1;
logic pulse_10msec_rx_d1;
logic pulse_10msec_d1;

//****************************************************************************************		

always @(posedge reconfig_clk or negedge csr_rst_n)
	begin
		if(~csr_rst_n)
		  led_speed[0] <= 1'b1;
		else if(led_override_en)
			led_speed[0] <= csr_led_speed[0];
    else if(port_params[6:1] == 6'h21) 
		  led_speed[0] <= 1'b0;
    else if(port_params[0] && (cdr_lock & rx_pcs_ready & tx_lanes_stable)) //port enable
		  led_speed[0] <= 1'b0;
    else
		  led_speed[0] <= 1'b1;
	end

	always @(posedge reconfig_clk or negedge csr_rst_n)
	begin
		if(~csr_rst_n)
		  led_speed[1] <= 1'b0;
		else if(led_override_en)
			led_speed[1] <= csr_led_speed[1];
    else if(port_params[6:1] == 6'h21) //CPRI 
		  led_speed[1] <= 1'b0;
    else if(led_speed[0]) 
		  led_speed[1] <= 1'b0;
    else if(port_params[6:1] == 6'h14)
		  led_speed[1] <= 1'b1;
    else
		  led_speed[1] <= 1'b0;
	end

	always @(posedge reconfig_clk or negedge csr_rst_n)
	begin
		if(~csr_rst_n)
		  led_speed[2] <= 1'b0;
		else if(led_override_en)
			led_speed[2] <= csr_led_speed[2];
    else if(port_params[6:1] == 6'h21) 
		  led_speed[2] <= 1'b0;
    else if(led_speed[0]) 
		  led_speed[2] <= 1'b0;
    else if(port_params[6:1] == 6'h14) 
		  led_speed[2] <= 1'b0;
    else
		  led_speed[2] <= 1'b1;
	end

//****************************************************************************************		
//****************************************************************************************		

	always @(posedge reconfig_clk or negedge csr_rst_n)
	begin
		if(~csr_rst_n)
		  led_status[0] <= 1'b1;
		else if(led_override_en)
			led_status[0] <= csr_led_status[0];
    else if(port_params[6:1] == 6'h21) 
		  led_status[0] <= 1'b0;
    else if(port_params[0] && rx_pcs_ready) //port enable
		  led_status[0] <= 1'b0;
    else
		  led_status[0] <= 1'b1;
	end

	always @(posedge reconfig_clk or negedge csr_rst_n)
	begin
		if(~csr_rst_n)
		  led_status[1] <= 1'b1;
		else if(led_override_en)
			led_status[1] <= csr_led_status[1];
    else if(port_params[6:1] == 6'h21) 
		  led_status[1] <= 1'b0;
    else if(port_params[0] && (~tx_lanes_stable || ~cdr_lock)) //port enable
		  led_status[1] <= 1'b1;
    else
		  led_status[1] <= 1'b0;
	end

	always @(posedge reconfig_clk or negedge csr_rst_n)
	begin 
		if(~csr_rst_n)
			pulse_10msec_d1 <= 1'b0;
		else
			pulse_10msec_d1 <= pulse_10msec;
	end

  hssi_ss_std_synchronizer_nocut tx_pulse_sync  (.clk (tx_clk), .reset_n (1'b1), .din (pulse_10msec), .dout (pulse_10msec_tx));
  hssi_ss_std_synchronizer_nocut rx_pulse_sync  (.clk (rx_clk), .reset_n (1'b1), .din (pulse_10msec), .dout (pulse_10msec_rx));
	always @(posedge tx_clk or negedge csr_rst_n)
	begin 
		if(~csr_rst_n)
			pulse_10msec_tx_d1 <= 1'b0;
		else
			pulse_10msec_tx_d1 <= pulse_10msec_tx;
	end
	always @(posedge rx_clk or negedge csr_rst_n)
	begin 
		if(~csr_rst_n)
			pulse_10msec_rx_d1 <= 1'b0;
		else
			pulse_10msec_rx_d1 <= pulse_10msec_rx;
	end

	always @(posedge tx_clk or negedge csr_rst_n)
  begin 
		if(~csr_rst_n)
		 	tx_sig_det <= 1'b0;
		else if(~pulse_10msec_tx && pulse_10msec_tx_d1) //falling edge
			tx_sig_det <= 1'b0;
		else if(tx_tvalid)
			tx_sig_det <= 1'b1;
	end

	always @(posedge rx_clk or negedge csr_rst_n)
  begin 
		if(~csr_rst_n)
		 	rx_sig_det <= 1'b0;
		else if(~pulse_10msec_rx && pulse_10msec_rx_d1) //falling edge
			rx_sig_det <= 1'b0;
		else if(rx_tvalid)
			rx_sig_det <= 1'b1;
	end

	always @(posedge reconfig_clk or negedge csr_rst_n)
	begin
		if(~csr_rst_n)
		  led_status[2] <= 1'b0;
		else if(led_override_en)
			led_status[2] <= csr_led_status[2];
    else if(port_params[6:1] == 6'h21) 
		  led_status[2] <= 1'b0;
    else if(~port_params[0] || led_status[1] || led_status[0]) //port enable
		  led_status[2] <= 1'b0;
		else if(pulse_10msec && ~pulse_10msec_d1)  //raising edge
		begin
			if(tx_sig_det || rx_sig_det)  //assuming multicycle pulse
		  	led_status[2] <= ~led_status[2]; 
    	else
		  	led_status[2] <= 1'b0;
		end
	end
      
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6yv9Zee12jDOd6tIyqCZLrHUkzbSP2DylJGmCLhMq2ITiuHSv0xsIFUyR6zTF1Xs539cBH7sb/LGdCQf1hlSXklN4GoMJIRs/iQE4A5twqaZcILVg8Pf3xW9KsH7POR69bMNI08Zwo+yq8PSXpcUJHRE1vA6XVRgFMnUO26vzc6hUIics5ac7hq1ttQmPt5k/DBQ3Ubk1tOsGW1eg4xd505qis5zjedynRvEh9ycz19W7YXJAFkLciyc+FDCWNa9mxC47C7119LnlUQcUhtcgl+25ctQ9ICtAnvfOvuulEc4o3WeE1xO6wmmfKJ7IwB5/YATnoozDg2XMTV12uAQAIxIbVH77E1e+QEl4DIWprMKmtLFghIC+I2G0WCEjJeAhO3Mrq+mf1oKfpO0Z6N6DcGLQH6Bd5iGsoLqBt9HGfits3VIaqzyLnCK5mSoxKHYHue7VXpM8S21DsQfSuE/rWvYH5y5berA5GgaLPYY0zNPHc1aVmEEeK5gHz0NeUahSR8ARu/Im3RRhkfXi9anCPNgeJxoylJtvjiDExk5rCtfaRoUPU2YU6n8gRYfEgdb2NAqcMYi/Woqky1Rh9efRfD2wxPTw0WF/BqtakunI2ol2Cl+Z53jx0Wn05V+QF4YzkNP1JGWVbil3/uq8mXurMiTzVQsCC/xiXlgnLasJQE4BZw2OiCkjZQp4Kz5RFYNOM43VSaF9mc8Jd6W5ja42yIWbiHkpTqejrAEOlb3p9BbQqwgLR5QztFNVSRMetzbIn+ejHihap+BLRcJPARPg7MC"
`endif