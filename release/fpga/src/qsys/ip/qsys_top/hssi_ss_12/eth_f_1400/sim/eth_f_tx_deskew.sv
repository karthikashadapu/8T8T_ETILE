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


//Simple TX Deskew moule
// This module generates a pulse every 32 cycles

module eth_f_tx_deskew
  #(parameter LANES = 1)
   (
    input wire 	     i_resetn,
    input wire 	     i_clk,
    output reg [LANES-1:0] o_dsk
    );
   
   
   reg [4:0] 		dsk_cnt;
   
   always @(posedge i_clk)
     begin
	if (~i_resetn)
	  begin
	     o_dsk <= ({LANES{1'b0}});
	     dsk_cnt <= 5'd0;
	  end
	else
	  begin
	     if (dsk_cnt == 5'd31)
	       begin
		  o_dsk <= ({LANES{1'b1}});
		  dsk_cnt <= 5'd0;
	       end
	     else
	       begin
		  o_dsk <= ({LANES{1'b0}});
		  dsk_cnt <= dsk_cnt+1'b1;
	       end
	  end // else: !if(~i_csr_rst_n)
     end // always @ (negedge i_resetn or posedge i_clk)

endmodule // eth_f_tx_deskew

   
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX8Y5JYYrrelTfMN+IIGXfjSPEiIEGJn+uVabWhCCkTo+kaFdYnOMgQFFCKhkIRKHmq0Hl81V6lpYeIVPz1ZrmAhjq0R9mLHyatVnbNiv4cPxsITL88OPfgCNYZu3FcKWe72o/bU7WoC5QlPPS6w7IgH8QS0IQMHg83tMgNAb2yn+a0WkhEGKzA8US7p8KygQjsks59A4nUetQrOxnPzln/zIaPiUVYBd1ilykRHP6+cc0UQKq6WVzc5UWwcwryDqYG1JTqbvNshFp68XjvP649hsCEmnao37fbhtV6MP20qTzDfFwI2Ve7vhbSqgGDHNzePupicgs8P8/cdw56sFpXkLI+ZEVLmcKHOxs2Jvf0NrfpXQ+xJ+YY4JAWRawf4gE7tsFlVGddW8zjYELgIbfc653PKTZt0lNL94JKJkAWEkR/dB3qjOSstQl4HnCeCyQUetPVWYWO3KEqCXAaJTrzmo88t5pEdwDtGABDiuj0mb3WGjpYsKx6FSjfE6zah7I+FFwV2mRCeofGoZQRJ5a0YDe+nY95nbcNaYXln56OoSd8PhZ0/KH9H5AxE+1BKtnTQ5AIFDZgnALLMmq16ah9J8Xu9WwSXcEr/ed7pRdWNX2388y56fiwm/D21TMJ9h5FlizNfgqTw1eDtxXMHcoFrKfZy6HQAPiTL8c3Pxh5b9mpaxVoDaDvnZP5af6yFe0km6H2ww84sRwg3bdFRu38mSYDDF/i8RLtgDBw6UB/Cn1QpqNZCfxyXJZdZhf55EuuxdvG7d+DvvOscSNAMaFbZ"
`endif