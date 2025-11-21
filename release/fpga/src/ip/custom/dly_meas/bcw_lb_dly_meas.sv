/*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %                                                                           %
 % BigCat Wireless Pvt Ltd CONFIDENTIAL                                      %
 %                                                                           %
 % [2018]  BigCat Wireless Pvt Ltd                                           %
 %  All Rights Reserved.                                                     %
 %                                                                           %
 % All information contained herein is, and remains the property of          %
 % BigCat Wireless. The intellectual and technical concepts contained        %
 % herein are proprietary to BigCat Wireless Pvt Ltd and may be covered      %
 % by Patents, patents in process and protected by trade secret or           %
 % copyright law. Dissemination of this information or reproduction of       %
 % this material is strictly forbidden unless prior written permission is    %
 % obtained from BigCat Wireless Pvt Ltd.                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/

module bcw_lb_dly_meas(
// clocks and resets
  input wire						clk,   		
  input wire						rst_n,
  
  //tx AVST sink 
  input  wire                 tx_avst_snk_vld,
  input  wire [32-1:0]        tx_avst_snk_data,
  input  wire [8-1:0]         tx_avst_snk_chan,
  
  //tx AVST source 
  output  reg                tx_avst_src_vld,
  output  reg [32-1:0]       tx_avst_src_data,
  output  reg [8-1:0]        tx_avst_src_chan, 
  
  //rx AVST sink 
  input  wire                 rx_avst_snk_vld,
  input  wire [32-1:0]        rx_avst_snk_data,
  input  wire [8-1:0]         rx_avst_snk_chan,
  
  //Config
  input   wire						lb_dly_meas_start,
  input   wire [15:0]         lb_dly_meas_window,
  output  reg [11:0]         lb_dly_mease_value,
  output  reg [15:0]         lb_dly_mease_cnt,
  output  reg                lb_dly_peak_en
  );

localparam  PILOT1_SAMPLES      = 9         		;

reg			lb_dly_meas_start_dly;
wire		lb_dly_meas_start_pul;
reg [15:0]  window_cntr;
reg         window_en,window_en_1d,window_en_2d;
reg [15:0]  window_cntr_dly,window_cntr_2dly;

wire [31:0] pilot_ram_q;
reg  [31:0] tx_avst_snk_data_dly;

reg tx_avst_snk_vld_dly;
reg [7:0] tx_avst_snk_chan_dly;

reg [31:0] 	taps0x,taps1x,taps2x,taps3x,taps4x,taps5x,taps6x,taps7x,taps8x;  

reg signed [31:0] taps0x_real_sq,taps0x_imag_sq;
reg signed [32:0] taps0x_amp;
reg signed [31:0] taps1x_real_sq,taps1x_imag_sq;
reg signed [32:0] taps1x_amp;
reg signed [31:0] taps2x_real_sq,taps2x_imag_sq;
reg signed [32:0] taps2x_amp;
reg signed [31:0] taps3x_real_sq,taps3x_imag_sq;
reg signed [32:0] taps3x_amp;
reg signed [31:0] taps4x_real_sq,taps4x_imag_sq;
reg signed [32:0] taps4x_amp;
reg signed [31:0] taps5x_real_sq,taps5x_imag_sq;
reg signed [32:0] taps5x_amp;
reg signed [31:0] taps6x_real_sq,taps6x_imag_sq;
reg signed [32:0] taps6x_amp;
reg signed [31:0] taps7x_real_sq,taps7x_imag_sq;
reg signed [32:0] taps7x_amp;
reg signed [31:0] taps8x_real_sq,taps8x_imag_sq;
reg signed [32:0] taps8x_amp;

reg signed [33:0] add_stg1_tap01,add_stg1_tap23,add_stg1_tap45;
reg signed [34:0] add_stg1_tap678;

reg signed [34:0] add_stg2_tap0123;
reg signed [35:0] add_stg2_tap45678;

reg signed [36:0] add_stg3_alltaps,add_stg3_alltaps_dly;

reg signed [(32*PILOT1_SAMPLES)-1:0] shift_reg;

reg signed [31:0] peak_sq;

///////////////////////////////////////////Impulse Injection in Tx path////////////////////////////////////////////////
 
//Start Pulse generation
always @(posedge clk) begin
	if(~rst_n) begin
	lb_dly_meas_start_dly <= 1'b0;
	end else begin
	lb_dly_meas_start_dly <= lb_dly_meas_start;
	end
end 

assign lb_dly_meas_start_pul = lb_dly_meas_start & ~lb_dly_meas_start_dly;
  
//Counter that runs upto window length
always @(posedge clk) begin
        if(~rst_n)
           window_cntr <= 16'd65535;
        else begin
           if (lb_dly_meas_start_pul)        
              window_cntr <= 16'd0;
           else if ( tx_avst_snk_vld & ~|tx_avst_snk_chan & (window_cntr < lb_dly_meas_window))
              window_cntr <= window_cntr + 16'd1;
           else
              window_cntr <= window_cntr;
        end
end

//Window enable
always @(posedge clk) begin
        if(~rst_n)
           window_en <= 1'b0;
        else begin
           if (lb_dly_meas_start_pul)        
              window_en <= 1'b1;
           else if ( tx_avst_snk_vld & ~|tx_avst_snk_chan & (window_cntr == lb_dly_meas_window))
              window_en <= 1'b0;
           else
              window_en <= window_en;
        end
end

always @(posedge clk) begin
        if(~rst_n) begin
           window_en_1d <= 1'b0;
	   window_en_2d <= 1'b0;
        end else begin
           window_en_1d <= window_en;
	   window_en_2d <= window_en_1d;
        end
end           

//assign imp_data = ((~|window_cntr) & tx_avst_snk_vld & ~|tx_avst_snk_chan) ? 32'h00007FFF : 32'h00000000;

altera_syncram
#(
    .address_aclr_b                     ("NONE"                     ),
    .address_reg_b                      ("CLOCK1"                   ),
    .clock_enable_input_a               ("BYPASS"                   ),
    .clock_enable_input_b               ("BYPASS"                   ),
    .clock_enable_output_b              ("BYPASS"                   ),
    .init_file                          ("bcw_slot_pilot_ZC_9.mif" ),
    .intended_device_family             ("Arria 10"                 ),
    .lpm_type                           ("altera_syncram"           ),
    .numwords_a                         (PILOT1_SAMPLES             ),
    .numwords_b                         (PILOT1_SAMPLES             ),
    .operation_mode                     ("DUAL_PORT"                ),
    .outdata_aclr_b                     ("NONE"                     ),
    .outdata_sclr_b                     ("NONE"                     ),
    //.outdata_reg_b                      ("CLOCK1"                   ),
    .power_up_uninitialized             ("FALSE"                    ),
    .widthad_a                          ($clog2(PILOT1_SAMPLES)     ),
    .widthad_b                          ($clog2(PILOT1_SAMPLES)     ),
    .width_a                            (32				            ),
    .width_b                            (32				            ),
    .width_byteena_a                    (1                          )
) pilot_ram
(
    .address_a      ({$clog2(PILOT1_SAMPLES){1'b0}}                            ),
    .address_b      (window_cntr[$clog2(PILOT1_SAMPLES)-1:0] ),
    .clock0         (clk                                            ),
    .clock1         (clk                                            ),
    .data_a         ({(32){1'b0}}                                ),
    .wren_a         (1'b0			                             ),
    .q_b            (pilot_ram_q                                        ),
    .rden_b         (1'b1                                               )
);

always @(posedge clk) begin
        if(~rst_n)
           tx_avst_src_data <= 32'd0;
        else begin
		if (window_cntr_dly < 9 & tx_avst_snk_vld_dly & ~|tx_avst_snk_chan_dly)
		   tx_avst_src_data <= pilot_ram_q;
		else if (window_cntr_dly < lb_dly_meas_window & tx_avst_snk_vld_dly & ~|tx_avst_snk_chan_dly)
		   tx_avst_src_data <= 32'd0;
		else
		   tx_avst_src_data <= tx_avst_snk_data_dly;
		end
end

always @(posedge clk) begin
        if(~rst_n) begin
	   tx_avst_snk_data_dly <= 32'd0;
           window_cntr_dly <= 16'd0;
           window_cntr_2dly <= 16'd0;
        end else begin
 	   tx_avst_snk_data_dly <= tx_avst_snk_data;
	   window_cntr_dly <= window_cntr;
           window_cntr_2dly <= window_cntr_dly;
	end
end

always @(posedge clk) begin
        if(~rst_n) begin
           tx_avst_src_vld <= 1'd0;
		   tx_avst_src_chan <= 8'd0;
		   tx_avst_snk_vld_dly <= 1'd0;
		   tx_avst_snk_chan_dly <= 8'd0;
        end else begin
           tx_avst_snk_vld_dly <= tx_avst_snk_vld;
		   tx_avst_src_vld  <= tx_avst_snk_vld_dly;
		   tx_avst_snk_chan_dly <= tx_avst_snk_chan;
		   tx_avst_src_chan <= tx_avst_snk_chan_dly;
		end
end

///////////////////////////////////////////Peak Analysis in Rx path////////////////////////////////////////////////

//shift_ram_9taps_altshift_taps_1920_g7rgiiy  shift_ram_9(
//	.aclr			(1'b0),
//	.clken			(rx_avst_snk_vld & (rx_avst_snk_chan==8'd0)),
//	.clock			(clk),
//	.shiftin		(rx_avst_snk_data),
//	.shiftout		(),
//	.taps0x			(taps0x),
//	.taps1x			(taps1x),
//	.taps2x			(taps2x),
//	.taps3x			(taps3x),
//	.taps4x			(taps4x),
//	.taps5x			(taps5x),
//	.taps6x			(taps6x),
//	.taps7x			(taps7x),
//	.taps8x			(taps8x)
//	);

always @(posedge clk) begin
	if(~rst_n) begin
	shift_reg <= 'b0;
	end else if (window_en_2d==1'b0) begin
	shift_reg <= 'b0;
	end else if (rx_avst_snk_vld & (rx_avst_snk_chan==8'd0) & window_en_2d==1'b1) begin
	shift_reg <= {shift_reg[(32*PILOT1_SAMPLES)-1-32:0],rx_avst_snk_data};
        end else begin
        shift_reg <= shift_reg;
        end
end

assign taps0x = shift_reg[(32*1)-1:32*0];
assign taps1x = shift_reg[(32*2)-1:32*1];
assign taps2x = shift_reg[(32*3)-1:32*2];
assign taps3x = shift_reg[(32*4)-1:32*3];
assign taps4x = shift_reg[(32*5)-1:32*4];
assign taps5x = shift_reg[(32*6)-1:32*5];
assign taps6x = shift_reg[(32*7)-1:32*6];
assign taps7x = shift_reg[(32*8)-1:32*7];
assign taps8x = shift_reg[(32*9)-1:32*8];

//Tap 0 amplitude calculation(I^2+Q^2)	
always @(posedge clk) begin
	if(~rst_n) begin
	taps0x_real_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
        taps0x_real_sq <= 32'b0;
	end else begin
	taps0x_real_sq <= signed'(taps0x[15:0]) * signed'(taps0x[15:0]);
	end
end 

always @(posedge clk) begin
	if(~rst_n) begin
	taps0x_imag_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
        taps0x_imag_sq <= 32'b0;
	end else begin
	taps0x_imag_sq <= signed'(taps0x[31:16]) * signed'(taps0x[31:16]);
	end
end

always @(posedge clk) begin
	if(~rst_n) begin
	taps0x_amp <= 33'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps0x_amp <= 33'b0;
	end else begin
	taps0x_amp <= signed'(taps0x_real_sq) + signed'(taps0x_imag_sq);
	end
end

//Tap 1 amplitude calculation(I^2+Q^2)	
always @(posedge clk) begin
	if(~rst_n) begin
	taps1x_real_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps1x_real_sq <= 32'b0;
	end else begin
	taps1x_real_sq <= signed'(taps1x[15:0]) * signed'(taps1x[15:0]);
	end
end 

always @(posedge clk) begin
	if(~rst_n) begin
	taps1x_imag_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps1x_imag_sq <= 32'b0;
	end else begin
	taps1x_imag_sq <= signed'(taps1x[31:16]) * signed'(taps1x[31:16]);
	end
end

always @(posedge clk) begin
	if(~rst_n) begin
	taps1x_amp <= 33'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps1x_amp <= 33'b0;
	end else begin
	taps1x_amp <= signed'(taps1x_real_sq) + signed'(taps1x_imag_sq);
	end
end

//Tap 2 amplitude calculation(I^2+Q^2)	
always @(posedge clk) begin
	if(~rst_n) begin
	taps2x_real_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps2x_real_sq <= 32'b0;
	end else begin
	taps2x_real_sq <= signed'(taps2x[15:0]) * signed'(taps2x[15:0]);
	end
end 

always @(posedge clk) begin
	if(~rst_n) begin
	taps2x_imag_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps2x_imag_sq <= 32'b0;
	end else begin
	taps2x_imag_sq <= signed'(taps2x[31:16]) * signed'(taps2x[31:16]);
	end
end

always @(posedge clk) begin
	if(~rst_n) begin
	taps2x_amp <= 33'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps2x_amp <= 33'b0;
	end else begin
	taps2x_amp <= signed'(taps2x_real_sq) + signed'(taps2x_imag_sq);
	end
end

//Tap 3 amplitude calculation(I^2+Q^2)	
always @(posedge clk) begin
	if(~rst_n) begin
	taps3x_real_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps3x_real_sq <= 32'b0;
	end else begin
	taps3x_real_sq <= signed'(taps3x[15:0]) * signed'(taps3x[15:0]);
	end
end 

always @(posedge clk) begin
	if(~rst_n) begin
	taps3x_imag_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps3x_imag_sq <= 32'b0;
	end else begin
	taps3x_imag_sq <= signed'(taps3x[31:16]) * signed'(taps3x[31:16]);
	end
end

always @(posedge clk) begin
	if(~rst_n) begin
	taps3x_amp <= 33'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps3x_amp <= 33'b0;
	end else begin
	taps3x_amp <= signed'(taps3x_real_sq) + signed'(taps3x_imag_sq);
	end
end

//Tap 4 amplitude calculation(I^2+Q^2)	
always @(posedge clk) begin
	if(~rst_n) begin
	taps4x_real_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps4x_real_sq <= 32'b0;
	end else begin
	taps4x_real_sq <= signed'(taps4x[15:0]) * signed'(taps4x[15:0]);
	end
end 

always @(posedge clk) begin
	if(~rst_n) begin
	taps4x_imag_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps4x_imag_sq <= 32'b0;
	end else begin
	taps4x_imag_sq <= signed'(taps4x[31:16]) * signed'(taps4x[31:16]);
	end
end

always @(posedge clk) begin
	if(~rst_n) begin
	taps4x_amp <= 33'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps4x_amp <= 33'b0;
	end else begin
	taps4x_amp <= signed'(taps4x_real_sq) + signed'(taps4x_imag_sq);
	end
end

//Tap 5 amplitude calculation(I^2+Q^2)	
always @(posedge clk) begin
	if(~rst_n) begin
	taps5x_real_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps5x_real_sq <= 32'b0;
	end else begin
	taps5x_real_sq <= signed'(taps5x[15:0]) * signed'(taps5x[15:0]);
	end
end 

always @(posedge clk) begin
	if(~rst_n) begin
	taps5x_imag_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps5x_imag_sq <= 32'b0;
	end else begin
	taps5x_imag_sq <= signed'(taps5x[31:16]) * signed'(taps5x[31:16]);
	end
end

always @(posedge clk) begin
	if(~rst_n) begin
	taps5x_amp <= 33'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps5x_amp <= 33'b0;
	end else begin
	taps5x_amp <= signed'(taps5x_real_sq) + signed'(taps5x_imag_sq);
	end
end

//Tap 6 amplitude calculation(I^2+Q^2)	
always @(posedge clk) begin
	if(~rst_n) begin
	taps6x_real_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps6x_real_sq <= 32'b0;
	end else begin
	taps6x_real_sq <= signed'(taps6x[15:0]) * signed'(taps6x[15:0]);
	end
end 

always @(posedge clk) begin
	if(~rst_n) begin
	taps6x_imag_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps6x_imag_sq <= 32'b0;
	end else begin
	taps6x_imag_sq <= signed'(taps6x[31:16]) * signed'(taps6x[31:16]);
	end
end

always @(posedge clk) begin
	if(~rst_n) begin
	taps6x_amp <= 33'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps6x_amp <= 33'b0;
	end else begin
	taps6x_amp <= signed'(taps6x_real_sq) + signed'(taps6x_imag_sq);
	end
end

//Tap 7 amplitude calculation(I^2+Q^2)	
always @(posedge clk) begin
	if(~rst_n) begin
	taps7x_real_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps7x_real_sq <= 32'b0;
	end else begin
	taps7x_real_sq <= signed'(taps7x[15:0]) * signed'(taps7x[15:0]);
	end
end 

always @(posedge clk) begin
	if(~rst_n) begin
	taps7x_imag_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps7x_imag_sq <= 32'b0;
	end else begin
	taps7x_imag_sq <= signed'(taps7x[31:16]) * signed'(taps7x[31:16]);
	end
end

always @(posedge clk) begin
	if(~rst_n) begin
	taps7x_amp <= 33'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps7x_amp <= 33'b0;
	end else begin
	taps7x_amp <= signed'(taps7x_real_sq) + signed'(taps7x_imag_sq);
	end
end

//Tap 8 amplitude calculation(I^2+Q^2)	
always @(posedge clk) begin
	if(~rst_n) begin
	taps8x_real_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps8x_real_sq <= 32'b0;
	end else begin
	taps8x_real_sq <= signed'(taps8x[15:0]) * signed'(taps8x[15:0]);
	end
end 

always @(posedge clk) begin
	if(~rst_n) begin
	taps8x_imag_sq <= 32'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps8x_imag_sq <= 32'b0;
	end else begin
	taps8x_imag_sq <= signed'(taps8x[31:16]) * signed'(taps8x[31:16]);
	end
end

always @(posedge clk) begin
	if(~rst_n) begin
	taps8x_amp <= 33'b0;
        end else if (lb_dly_meas_start_pul) begin
	taps8x_amp <= 33'b0;
	end else begin
	taps8x_amp <= taps8x_real_sq + taps8x_imag_sq;
	end
end

//Add stg1 - tap 0 and tap 1
always @(posedge clk) begin
	if(~rst_n) begin
	add_stg1_tap01 <= 34'b0;
	end else begin
	add_stg1_tap01 <= taps0x_amp + taps1x_amp;
	end
end

//Add stg1 - tap 2 and tap 3
always @(posedge clk) begin
	if(~rst_n) begin
	add_stg1_tap23 <= 34'b0;
	end else begin
	add_stg1_tap23 <= taps2x_amp + taps3x_amp;
	end
end

//Add stg1 - tap 4 and tap 5
always @(posedge clk) begin
	if(~rst_n) begin
	add_stg1_tap45 <= 34'b0;
	end else begin
	add_stg1_tap45 <= taps4x_amp + taps5x_amp;
	end
end

//Add stg1 - tap 6 tap 7 and tap 8
always @(posedge clk) begin
	if(~rst_n) begin
	add_stg1_tap678 <= 35'b0;
	end else begin
	add_stg1_tap678 <= taps6x_amp + taps7x_amp + taps8x_amp;
	end
end

//Add stg2 - tap 01 and tap 23
always @(posedge clk) begin
	if(~rst_n) begin
	add_stg2_tap0123 <= 35'b0;
	end else begin
	add_stg2_tap0123 <= add_stg1_tap01 + add_stg1_tap23;
	end
end

//Add stg2 - tap 45 and tap 678
always @(posedge clk) begin
	if(~rst_n) begin
	add_stg2_tap45678 <= 36'b0;
	end else begin
	add_stg2_tap45678 <= add_stg1_tap45 + add_stg1_tap678;
	end
end

//Add stg3 - tap 0123 and tap 45678
always @(posedge clk) begin
	if(~rst_n) begin
	add_stg3_alltaps <= 37'b0;
	end else begin
	add_stg3_alltaps <= add_stg2_tap0123 + add_stg2_tap45678;
	end
end

//Add stg3 - tap 0123 and tap 45678
always @(posedge clk) begin
	if(~rst_n) begin
	add_stg3_alltaps_dly <= 37'b0;
	end else begin
	add_stg3_alltaps_dly <= add_stg3_alltaps;
	end
end

//Peak Square
always @(posedge clk) begin
	if(~rst_n) begin
	peak_sq <= 32'b0;
        end else begin
        peak_sq <= add_stg3_alltaps_dly[36:21] * add_stg3_alltaps_dly[36:21];
        end
end

//Peak detection
always @(posedge clk) begin
	if(~rst_n) begin
	lb_dly_peak_en <= 1'b0;
	end else if (peak_sq[31:18] > 12'd75  & window_en_2d==1'b1)begin
	lb_dly_peak_en <= 1'b1;
	end else begin
	lb_dly_peak_en <= 1'b0;
	end
end

always @(posedge clk) begin
	if(~rst_n) begin
	lb_dly_mease_value <= 6'b0;
        lb_dly_mease_cnt <= 16'd0;
        end else if (lb_dly_meas_start_pul) begin
        lb_dly_mease_value <= 6'b0;
        lb_dly_mease_cnt <= 16'd0;
	end else if ((peak_sq[31:18] > lb_dly_mease_value) & window_en_2d==1'b1)begin
	lb_dly_mease_value <= peak_sq[31:18];
        lb_dly_mease_cnt <= window_cntr_2dly ; //14 value is no delay - 9 zadoff seq and 6 operational delay
	end else begin
	lb_dly_mease_value <= lb_dly_mease_value;
        lb_dly_mease_cnt <= lb_dly_mease_cnt;
	end
end

endmodule
