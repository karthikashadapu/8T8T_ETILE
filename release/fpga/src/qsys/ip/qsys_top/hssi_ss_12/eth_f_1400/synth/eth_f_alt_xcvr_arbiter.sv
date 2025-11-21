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


// Clocked priority encoder with state
//
// On each clock cycle, updates state to show which request is granted.
// Most recent grant holder is always the highest priority.
// If current grant holder is not making a request, while others are, 
// then new grant holder is always the requester with lowest bit number.
// If no requests, current grant holder retains grant state

// $Header$

`timescale 1 ns / 1 ns
//altera message_off 16753
module eth_f_alt_xcvr_arbiter #(
	parameter width = 2
) (
	input  wire clock,
	input  wire [width-1:0] req,	// req[n] requests for this cycle
	output reg  [width-1:0] grant	// grant[n] means requester n is grantee in this cycle
);

	wire idle;	// idle when no requests
	wire [width-1:0] keep;	// keep[n] means requester n is requesting, and already has the grant
							// Note: current grantee is always highest priority for next grant
	wire [width-1:0] take;	// take[n] means requester n is requesting, and there are no higher-priority requests

	assign keep = req & grant;	// current grantee is always highest priority for next grant
	assign idle = ~| req;		// idle when no requests

	initial begin
		grant = 0;
	end

	// grant next state depends on current grant and take priority
	always @(posedge clock) begin
		grant <= 
// synthesis translate_off
                    (grant === {width{1'bx}})? {width{1'b0}} :
// synthesis translate_on
				keep				// if current grantee is requesting, gets to keep grant
				 | ({width{idle}} & grant)	// if no requests, grant state remains unchanged
				 | take;			// take applies only if current grantee is not requesting
	end

	// 'take' bus encodes priority.  Request with lowest bit number wins when current grantee not requesting
	assign take[0] = req[0]
					 & (~| (keep & ({width{1'b1}} << 1)));	// no 'keep' from lower-priority inputs
	genvar i;
	generate
	for (i=1; i < width; i = i + 1) begin : arb
		assign take[i] = req[i]
						 & (~| (keep & ({width{1'b1}} << (i+1))))	// no 'keep' from lower-priority inputs
						 & (~| (req & {i{1'b1}}));	// no 'req' from higher-priority inputs
	end
	endgenerate
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX+U1S3VpkUPD3SbWOTWb53+2/gUwPvgPhA2bZDvfSyc6r5QgY/TSMswmrXGs6hXrd3htY3jN1kOYoc52uJMQZnN7bsbax/VQi3xaIa5eJ5uIDgvLtaCiP75nJhXT4BvzBQOutJfZXHRzJibfZ+upkuNB4c3uPcVOrRRvZHcg33GL1pfr43iQl8SdY7M4bWTkvG9HU2GQeCKXHNnI3JuJzZGqucptJM5LzeFXD/UwNpvxSfnZ6TmnWw/0lrXKnx2SvoDU2FJKqfOTDqMAHWzWIN0X5fTXbut5rJgEKxdZ/KUb+i6Q2R6bYxTQQlDmBYcss/X5Nx7w3CQBpf9AJCwWDjrwxxxidKxZq/n/vHkTb4Z4oWdILdVTNlmdxIaaP2c3/2ukvTEgmngiTfFlcQUFAmWBph3DVO8IO04LGKZOiEvaKWVSptFT6YosVtjDx50mmJgbW6SIzMdCxm6o9R6Q/rU7NXrwbvoo0znEednwCZ87UmYZYQPuiKFmC3uETAq6quJAh3oBUd1E5WXACXoSy8jv5Fq+x3wFmwa0DUJhZH48aZd0403UzLIjrtkxI6uza6RIlwf4qf2DjS8kRPRIQYtaMxuAOnqRwJOWIixhAQR1Yx/DRTI6DBBPUIu9k6gApSxkn94a6jEW5MFCtfXc0fwFSgA2/OJO+axhC3MmVbiyp7aaEGid1SpcgLjRtwjrGrhX626QyX/zWv1zlF6dWo9Ur07c0inHvtX9jtvgxgSlz7wEwUXDArT9bV6DEJV9DhMTf0t4syywE5k1snCySUt"
`endif