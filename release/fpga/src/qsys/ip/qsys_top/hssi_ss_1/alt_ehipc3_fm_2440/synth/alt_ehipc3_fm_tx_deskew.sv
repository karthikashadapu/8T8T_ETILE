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
// This module generates a pulse after 30 clocks
// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module alt_ehipc3_fm_tx_deskew
  #(parameter LANES = 1)
   (
    input wire 	     i_resetn,
    input wire 	     i_clk,
    output reg [LANES-1:0] o_dsk
    );
   
   
   reg [4:0] 		dsk_cnt = 5'd0;
   
   always @(posedge i_clk)
     begin
	if (~i_resetn)
	  begin
	     o_dsk <= ({LANES{1'b0}});
	     dsk_cnt <= 5'd0;
	  end
	else
	  begin
	     if (dsk_cnt == 5'd30)
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

endmodule // alt_ehipc3_fm_tx_deskew

   
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B0kd8XSDp9FwpciAqH/rVZBIa3aM2zJm67mrcg/ykFLxumBfwQGxAIpQhb7WJtTMPCEHMuzJcYY2tDCoqutni6v1sdiF+PeBrYJPflEjgTDwwDCsJ/WN4elP39lHvR8db6DxYZ2T9zILeY6XTanN5TZS6zqyLnhqas673y7V7TnwbEfZbEXmhysJHKpo3JidoJS0Xulixwmu8dOuJSL6Bvp5Ko3aGjRjSYg0MatqDt2Ti16C8csuTwEB+JdyrUya4UYka0p+4eAKW3msakc18X89mqI9SvhyEneNsxHI8E5cSEpudfY6dpgJ/tBbmpl8D0zfoYhkTAUfZdMiZaIn3fgEXcqhL4mrjy6grmnmtBvAA+OuQTEMdjKPqJUQ13zeR6Tzsxw0orrg/23eEHk6J8APlugYA191lCbTEOEz8nYCwxqHCIxAdnAvtBMNQDi6eo4MDLuGMKbCSEPhuzDzOT6ZPERrzVrRk+VCgxwoBOSZhZXxVPrY8BxEnYz+CMmrgfTq/0dKV56UnY9MWsMsDkJqfQDWIZofFmtovnI8tuB4XsLMFWRXGeJXDmAtphyivtM+FwH9grzPiH3BKzg1spPKIVbqEX6zZt5gNCBsO8wlUObvozZhvfg2YcS19Rc5gby2vbSAEi6WcFFo9BUepZEesee95VQmfgxuhpYUPK+y64T4Acr1Ahgh9HNqhAT+0kbs59r3kuUi1vo8BEKlYZaU2vKl3xn5SPWSebUdKmkockG3f6Ro5VLr2utzkzjOZrDMeytvW+buIKAQcuyEWSC"
`endif