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


module eth_f_rx_deskew #(
    parameter WIDTH         = 64,
    parameter LANES         = 2,
    parameter SIM_EMULATE   = 0
) (
    input   logic                           i_clk,
    input   logic                           i_reset,
    input   logic [0:LANES-1][WIDTH-1:0]    i_data,
    input   logic [0:LANES-1]               i_sync_pulse,
    output  logic [0:LANES-1][WIDTH-1:0]    o_data,
    output  logic [0:LANES-1]               o_sync_pulse,
    output  logic                           o_deskew_done
);
    logic   [0:LANES-1] deskew_pulse_arrive;
    logic   initial_sync_received;
    logic   [15:0]  startup_timer;
    logic           ready;

    logic   [15:0]              gap_timer;
    logic   [0:LANES-1]         incr_delay;
    logic   [0:LANES-1]         incr_delay_masked;
    logic   [0:LANES-1][2:0]    delay;
    logic   [0:LANES-1]         sync_pulses_delay;


   wire r_reset;
   assign r_reset = i_reset;
   assign initial_sync_received =  &deskew_pulse_arrive;

    always_ff @(posedge i_clk) begin
        //if (r_reset) begin
        //    initial_sync_received   <= 1'b0;
        //end else begin
        //    initial_sync_received   <= initial_sync_received | (|i_sync_pulse);
        //end
         if (r_reset) begin
             deskew_pulse_arrive    <=  {LANES{1'b0}};
         end else begin
             deskew_pulse_arrive    <= deskew_pulse_arrive | i_sync_pulse; // bit-OR: detect first pulse of each lane
         end

        if (r_reset) begin
            startup_timer           <= 16'b0;
        end else begin
            startup_timer           <= {initial_sync_received, startup_timer[14:1]};
        end

        if (r_reset) begin
            gap_timer           <= 16'b0;
        end else begin
            if (sync_pulses_delay) begin
                gap_timer           <= 16'b0;
            end else begin
                gap_timer           <= {1'b1, gap_timer[14:1]};
            end
        end

        if (r_reset) begin
            incr_delay  <= {LANES{1'b0}};
        end else begin
            if (gap_timer[0]) begin
                case (sync_pulses_delay)
                    {LANES{1'b0}}   : incr_delay    <= {LANES{1'b0}};
                    {LANES{1'b1}}   : incr_delay    <= {LANES{1'b0}};
                    default         : incr_delay    <= sync_pulses_delay;
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
            o_deskew_done   <= 1'b0;
        end else begin
            o_deskew_done   <= o_deskew_done || &sync_pulses_delay;
        end

    end

    assign ready = startup_timer[0]; // only count up when all deskew pulse already arrive

    genvar i;
    generate
        for (i = 0; i < LANES; i++) begin : lane_loop

            eth_f_word_delay_mlab #(
                .WIDTH       (WIDTH+1),
                .SIM_EMULATE (SIM_EMULATE)
            ) lane_delay (
                .i_clk      (i_clk),
		.i_rst      (r_reset),
                .i_delay    (delay[i]),
                .i_data     ({i_sync_pulse[i], i_data[i]}),
                .o_data     ({sync_pulses_delay[i], o_data[i]})
            );

            always_ff @(posedge i_clk) begin
                if (r_reset) begin
                    delay[i]    <= 3'd2;  // 2 is minimum delay
                end else begin
                        delay[i]    <= 3'(delay[i] + incr_delay_masked[i]);
                end
            end
        end
    endgenerate

    assign o_sync_pulse = sync_pulses_delay;

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX+T1T/96z1qsWhJI2lu79J1aWxuOoX42L6yqgkEOOnN45ATA+yUoo/9buowbneemAYfiBLhUECyyLyqtzmbJUOd2AYsTvS1pVVN91YIEhW37ARnsUtCcqZNTs4gyTksrh+252uNHyu9WxK4l/zl6Kq6H4pNUfL1ri6klSOHojEdsd7BRZqjxFzVp6yeWrS0aWJ8N9RtYfetj7fTE9FrcqamOOMGF9v4SaJgmCl1SjWrM0IO7fAZ0QKDdut/p1rG2lTjZz2bSieoP/bM4Necg6b2AXLz3UKWbQFdCKaAfdq+teonKVzbD5kb0WlZ3LT2RiARjhwbodLwlUbJiPev+WT8RP7x2kUhRg99V9X9Xire7Bd1smWE/g26fDx/FNhxnxb252bmrNI7GbPj7lxcj4OpEQY8cG+j339G5PVlepD1xWGnZ6ouycfclKThzdoeOOB4j2UzK9vDT1KdamKcxes/QrAh9WdGmZ87Fnr8lc+Q2jl/S5LW0ovdkIXlHuOLK6kwFr3MFzdODUQFtx6h6HebkJT9XKdBPxRQzQcjZ+RRhBNL5RoPBDq2hyqxohLop1/TBNWWh41lqbLUoMNLe1F2TjLDraCzzc8SzK4/NYeqN5qlapK/Gq0/be3tmx9m2hauaUWPp04Q6Hp1j6MdwlHU+f0z9rW1QRbhEZH+bvUujMArI1sL27lHGGx7h8ZU4LanCn4j3MAuzwI5JoKjgnJkjfVBSw2qEjOVEiZOzFhM22aAf9WJqAl8rIQFsHfRj7wLTufV4LUOYWKz8DAyI3by"
`endif