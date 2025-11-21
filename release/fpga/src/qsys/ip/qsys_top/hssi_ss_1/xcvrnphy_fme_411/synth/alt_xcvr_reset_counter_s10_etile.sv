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



//  File Name: alt_xcvr_reset_counter_s10_etile
//
//  Description:  
//
//    A simple counter targeted for the Stratix 10 reset controller. The parameters specify the clock domain's
//  clock frequency and the desired reset period specified in nanoseconds. The caller may specify
//  the active level of the internal reset flop.
//
//    The async_req input signal is active high. The reset outputs
//  will remain asserted while async_req is asserted and will not deassert
//  until the specified reset period has expired.
//    The sync_req input behaves similar to the async_req but is sampled
//  synchronously with the clock.
//    The "reset_or" input does not reset the counter but directly asserts the reset output flop.
//  The reset outputs will remain asserted so long as "reset_or" is asserted.
//
//  Revision History: 
//
//  Special notes:
//

`timescale 1ns / 1ns

// Parameter for clogb2 function
`define MAX_PRECISION 32	// VCS requires this declaration outside the function

module  alt_xcvr_reset_counter_s10_etile #(
    parameter CLKS_PER_SEC  = 25000000, // Clock frequency in Hz
    parameter RESET_PER_NS  = 1000000,  // Reset period in ns
    parameter RESET_COUNT   = 0,        // Overrides RESET_PER_NS
    parameter ACTIVE_LEVEL  = 1         //
) (
  input         clk,
  input         async_req,  // asynchronous reset request (restart sequence)
  input         sync_req,   // synchronous reset request
  input         reset_or,   // auxilliary reset override (assert only)

  output        reset,      // synchronous reset out
  output        reset_n,    // negation of reset
  output        reset_stat  // reset status (intended for control logic)
);

// Determine unrounded counter limit based on passed frequency
localparam  [63:0] INITIAL_COUNT  = (CLKS_PER_SEC * RESET_PER_NS) / 1000000000;
// Round counter limit up if needed
localparam  [63:0] ROUND_COUNT    = (((INITIAL_COUNT * 1000000000) / CLKS_PER_SEC) < RESET_PER_NS)
                            ? (INITIAL_COUNT + 1) : INITIAL_COUNT;
// Use given counter limit if provided (RESET_COUNT), otherwise use calculated counter limit
localparam  MAX_CNT = (RESET_COUNT == 0) ? ((ROUND_COUNT == 0) ? ROUND_COUNT : ROUND_COUNT - 1) : RESET_COUNT - 1;
localparam  CNT_WIDTH = clogb2(MAX_CNT);
// 1 bit wide active level
localparam  LCL_ACTIVE_LEVEL  = (ACTIVE_LEVEL == 0) ? 1'b0 : 1'b1;

// Counter signals
reg [CNT_WIDTH-1:0] count = {CNT_WIDTH{1'b0}};
wire                count_lim;

// Internal reset signals
(* dont_merge *) 
reg   r_reset;      // Reset output register
reg   r_reset_stat; // Reset status register
wire  reset_cond;   // Condition for reset

// Reset counter
//***************************************************************************
//**************************** Reset counter ********************************
assign  count_lim = (count == MAX_CNT);
always @(posedge clk or posedge async_req)
  if(async_req)       count <= {CNT_WIDTH{1'b0}};
  else if(sync_req)   count <= {CNT_WIDTH{1'b0}};
  else if(~count_lim) count <= count + 1'b1;
//************************** End Reset counter ******************************
//***************************************************************************


//***************************************************************************
//********************** Internal reset register ****************************
// The condition for a reset (other than asynchrnous reset) are:
// 1 - Synchronous reset request
// 2 - Timer has not expired.
// 3 - Reset override is asserted
assign  reset_cond  = (sync_req | ~count_lim | reset_or);

// Reset register
always @(posedge clk or posedge async_req)
  if(async_req)     r_reset <= LCL_ACTIVE_LEVEL;
  else              r_reset <= ~(reset_cond ^ LCL_ACTIVE_LEVEL);

// External reset status generation. We create a status of the reset
// output simply so we can allow the actual reset output to drive resets
// with limited fanout to other logic. This status output is intended
// to be used for reset control logic.
assign  reset_stat  = r_reset_stat;
always @(posedge clk or posedge async_req)
  if(async_req)     r_reset_stat  <= 1'b1;
  else              r_reset_stat  <= reset_cond;
//******************** End Internal reset register **************************
//***************************************************************************


//***************************************************************************
//*********************** Reset output generation ***************************
// External reset generation
//generate if (ACTIVE_LEVEL == 0) begin : g_active_low_resets
//  assign  reset   = ~r_reset;
//  assign  reset_n = r_reset;
//end else begin : g_active_high_resets
// begin and end in generate block removed by JRJ - 2/1/2018 - to eliminate quartus synthesis warning
generate
  assign  reset   = r_reset;
  assign  reset_n = ~r_reset;
endgenerate
//********************* End Reset output generation *************************
//***************************************************************************

////////////////////////////////////////////////////////////////////
// Return the number of bits required to represent an integer
// E.g. 0->1; 1->1; 2->2; 3->2 ... 31->5; 32->6
//
function integer clogb2;
  input integer MAX_CNT;

  begin
    integer input_num_temp;
    input_num_temp = MAX_CNT; 
    for (clogb2=0; input_num_temp > 0 && clogb2<`MAX_PRECISION; clogb2=clogb2+1)
     input_num_temp = input_num_temp >> 1;
    if(clogb2 == 0)
      clogb2 = 32'b1;
  end
endfunction

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "gWvZQJuy3cgLOv0tRs1qUJ7l9DPIFHBslIjmReh83yW+6Fr8uwnXoVTcuGQwv0Q0whNK+r6SK6uHHBmHQVn/rw+C3atJKVAzL6ri4jktmdTUjwEnQWJyOkTnH6oYBLwlgnfl+Mr7p1SkVzsmd8ZhAdDlh+tBo8K6dynI2S9bBcxtVvMq9ES8ZVhRmmpTX4goGWMQ/UipnjBwEMXjHTUXk+HGvg38VjGHImYbxYmiX4Grw2Pi1jBDx6Q2u9GOFmxlF1zjqCTdAQwtdvVzPkw4q2x/aMFm0/SflQ6HYk2OnokGkJ006rSHGiHg0u5694JQl03e+Zp6GQIiK0xdfBHYSY96JkqnDeF+iZPbsxm5+bTCDmkho1a02d1HZgdP2Ic2STxLYVUZRckT4IAKmpymRL400YjIsD3dBwq7jituVsS/uQlUwLYQJxJyPdk+aGXnc2SdTsyz0ww6qflHR5CWEFWpBZ9zqQv1PsGgG7aPoEPSC32tptHGvJ1WSNcs03mkmIYgc4ba1kTAvmVbIP6kQKXg6mtwj5FhoBmOS9C/MDixhBNjokm8Ep4/LOyZZkZMcheSzsCiUrvc+Vs8SXx2J3oQ8bjRof0ZppKFWFDQpiYEyuqh7MjVF+ElIdsXEZCM0JrE/ihk7XRyBIkserdE8RplZGD84c+DrTYG4KrrRk5Kl2sqgy47F6Ae+1qD+kAwctkFWKC4joQrYGVWCdgbbSAfFSR9ppcW8g2myHAAnr716VBPkecRTL+rtOTBL3VBdn6/S1iybQ2/5Uec13qSqH8A6cD7WRLu6tYTAhu31NS1wdlBPP5dBbyROgjHPObACN0bkUKouzk8qTfqaBZnzAvsYh59Hb99ieP6t7mz/JdyCLwvMxeEF98OKMuykjflp6ToyxqLhsX0SH/uo2MzjQbjOHI6tgDSBdP4NPpiynbKLqRHodO9p0U+Re3NOX1tzEZ3sRklNp6W/n6h7d4Gj0QLBLKxNcQSvP8D1CTnZVSP63tIk8pDS9dZJSe9vRui"
`endif