// ================================================================================
// Copyright (c) <2024>, Intel Corporation
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
// 
//     * Redistributions of source code must retain the above copyright notice,
//       this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Intel Corporation nor the names of its contributors
//       may be used to endorse or promote products derived from this software
//       without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ================================================================================

`timescale 1ns/1ns

module incremental_counter #(
    parameter COUNTER_WIDTH = 8 // Width of the counter
) (
    input logic clk,              // Clock signal
    input logic rst,              // Reset signal (active low)
    input logic [COUNTER_WIDTH-1:0] start_value, // Start value for the counter
    input logic [COUNTER_WIDTH-1:0] end_value,   // End value for the counter
    input logic [COUNTER_WIDTH-1:0] reset_value, // Reset value for the counter
    input logic start_condition,  // condition to start the counter
	input logic incr_condition,   // Condition to increment the counter
    output logic [COUNTER_WIDTH-1:0] counter  // Output of the counter
);

    always @(posedge clk) begin
        if (~rst) begin
            counter <= reset_value;
		end else if (start_condition) begin
			counter <= start_value;
        end else if (incr_condition) begin
            if (counter == end_value) begin
                counter <= start_value; // Reset counter to start_value when it reaches end_value
            end else begin
                counter <= counter + 1; // Otherwise, increment the counter
            end
        end
    end
	
endmodule