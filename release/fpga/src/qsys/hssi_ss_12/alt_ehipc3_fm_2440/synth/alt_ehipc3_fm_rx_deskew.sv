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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module alt_ehipc3_fm_rx_deskew #(
    parameter WIDTH          = 64,
    parameter LANES          = 2,
    parameter REGISTER_INPUT = 0,
    parameter REGISTER_OUTPUT= 0,
    parameter SIM_EMULATE    = 0
) (
    input   logic                           i_clk,
    input   logic                           i_reset,
    input   logic [0:LANES-1][WIDTH-1:0]    i_data,
    input   logic [0:LANES-1]               i_sync_pulse,
    output  logic [0:LANES-1][WIDTH-1:0]    o_data,
    output  logic                           o_deskew_done
);

    logic   initial_sync_received;
    logic   [15:0]  startup_timer;
    logic           ready;

    logic   [15:0]              gap_timer;
    logic   [0:LANES-1]         incr_delay;
    logic   [0:LANES-1]         incr_delay_masked;
    logic   [0:LANES-1][4:0]    delay;
    logic   [0:LANES-1]         sync_pulses_delay;
    logic   [0:LANES-1]         sync_pulses_delay_r;


    wire r_reset;
    assign r_reset = i_reset;
   
    //flop for timing
    logic [0:LANES-1][WIDTH-1:0] data_in_r;
    logic [0:LANES-1][WIDTH-1:0] data_in_rr;
    logic [0:LANES-1][WIDTH-1:0] data_in_int;
    logic [0:LANES-1]            sync_pulse_r;
    logic [0:LANES-1]            sync_pulse_rr;
    logic [0:LANES-1]            sync_pulse_int;
    logic [0:LANES-1][WIDTH-1:0] data_out_r;
    logic [0:LANES-1][WIDTH-1:0] data_out_int;
    logic                        deskew_done;
    logic                        deskew_done_r;
    generate
    if (REGISTER_INPUT) begin:REG_IN
        always_ff @(posedge i_clk) begin
            if (r_reset) begin
                data_in_r <= {LANES*WIDTH{1'h0}};
                data_in_rr <= {LANES*WIDTH{1'h0}};
            end else begin
                data_in_r <= i_data;
                data_in_rr <= data_in_r;
            end
        end
        always_ff @(posedge i_clk) begin
            if (r_reset) begin
                sync_pulse_r <= 1'b0;           
                sync_pulse_rr <= 1'b0;          
            end else begin
                sync_pulse_r <= i_sync_pulse;
                sync_pulse_rr <= sync_pulse_r;
            end            
        end
        assign data_in_int = data_in_rr;
        assign sync_pulse_int = sync_pulse_rr;
    end else begin
        assign data_in_int = i_data;
        assign sync_pulse_int = i_sync_pulse;    
    end
    endgenerate
    
    generate
    if (REGISTER_OUTPUT) begin:REG_OUT
        always_ff @(posedge i_clk) begin
            if (r_reset) begin
                data_out_r <= {LANES*WIDTH{1'h0}};
            end else begin
                data_out_r <= data_out_int;
            end
        end
        
        always_ff @(posedge i_clk) begin
            if (r_reset) begin
                deskew_done_r <= 1'b0;
            end else begin
                deskew_done_r <= deskew_done;
            end            
        end
        
        assign o_data = data_out_r;
        assign o_deskew_done = deskew_done_r;
    end else begin
        assign o_data = data_out_int;
        assign o_deskew_done = deskew_done;   
    end
    endgenerate
   
    always_ff @(posedge i_clk) begin
        if (r_reset) begin
            initial_sync_received   <= 1'b0;
        end else begin
            initial_sync_received   <= initial_sync_received | (|sync_pulse_int);
        end

        if (r_reset) begin
            startup_timer           <= 16'b0;
        end else begin
            startup_timer           <= {initial_sync_received, startup_timer[14:1]};
        end

        if (r_reset) begin
            gap_timer           <= 16'b0;
        end else begin
            if (sync_pulses_delay_r) begin
                gap_timer           <= 16'b0;
            end else begin
                gap_timer           <= {1'b1, gap_timer[14:1]};
            end
        end

        if (r_reset) begin
            incr_delay  <= {LANES{1'b0}};
        end else begin
            if (gap_timer[0]) begin
                case (sync_pulses_delay_r)
                    {LANES{1'b0}}   : incr_delay    <= {LANES{1'b0}};
                    {LANES{1'b1}}   : incr_delay    <= {LANES{1'b0}};
                    default         : incr_delay    <= sync_pulses_delay_r;
                endcase
            end else begin
                incr_delay    <= {LANES{1'b0}};
            end
        end

        if (r_reset) begin
            incr_delay_masked   <= {LANES{1'b0}};
        end else begin
            if (ready) begin
                incr_delay_masked    <= incr_delay;
            end else begin
                incr_delay_masked   <= {LANES{1'b0}};
            end
        end

        if (r_reset) begin
            deskew_done   <= 1'b0;
        end else begin
            deskew_done   <= deskew_done || &sync_pulses_delay_r;
        end

    end

    assign ready = startup_timer[0];

    genvar i;
    generate
        for (i = 0; i < LANES; i++) begin : lane_loop

            alt_ehipc3_fm_word_delay_mlab #(
                .WIDTH       (WIDTH+1),
                .SIM_EMULATE (SIM_EMULATE)
            ) lane_delay (
                .i_clk      (i_clk),
		.i_rst      (r_reset),
                .i_delay    (delay[i]),
                .i_data     ({sync_pulse_int[i], data_in_int[i]}),
                .o_data     ({sync_pulses_delay[i], data_out_int[i]})
            );

            always_ff @(posedge i_clk) begin
                if (r_reset) begin
                    delay[i]    <= 5'd2;  // 2 is minimum delay
                end else begin
                    delay[i]    <= 5'(delay[i] + incr_delay_masked[i]);
                end
            end

            always_ff @(posedge i_clk) begin
                if (r_reset) begin
                    sync_pulses_delay_r[i] <= 1'b0;
                end else begin
                    sync_pulses_delay_r[i] <= sync_pulses_delay[i];
                end
            end
        end
    endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B3Jwv3ZnZlwhCtyZk18e/O05TKW8VrrOvBFrik9xMbwQCm/fC+cSLw1z9ow8yAcrMLjGfComZ33FBKL1LMHRPXOWURFhT09uSO36bO7n9xj8R+es4ADhiC4ovINMXEGP2fI5/B098AJe3xv9MdjTjqzGGTe6DxbPKiDvHgMHopWWFri+31p9dTmeJBCGZ71x/BuvKr3OIJqVEILCAJcqX0z1mXcKpkxHN8YNww91Vs9r+sMpGya5x9qFWc4iW+eprCkwCjFD5LEQ+C6gNrgbUJlVjH9oPYKgdMJlhDZxoYfMhNdt49gscncE0r3WZfYriZbakFZ7vzd0wd84XDl2PBazvPpiFDsb6DlMFrZjcOujEiuEZ7U4al3NHQjKL6um48BiQ0LmFoWF1YHQyZ+zE39WhYql3yvjYANbDOo0fk3pUx70xX0U8ENBLuIvCHLsGzJTR71EkmSdzHsheIyji8B7n08L+Uth4Iqq+dohijEhEmk4Dkhmts43fBYno9w29tSfQd4IjVlUBWsZ9pTeFhkLT92WMrSJ9NKmewr7i/JrNd9jFloyt0Bmw0htCQu/vy9h+krmGzGhji0aFFdU7OX1AXUQmUpBTvLtjeCkASj1HolfPUQ9h/aETRp+u2iNuzqeBR0X269kXLeOIes8A2xCQDgQ7QC+emwSknIr7mNJHUu4UIxahGNhy4968ffa357p9NSTDYBlBiXkfuWkZK5bRfSMhxabHo5HaTN6MjmQqRsqcUuVF0qgF7nAG5QWrBMkOY9XPLnY9eARFoT3C2m"
`endif