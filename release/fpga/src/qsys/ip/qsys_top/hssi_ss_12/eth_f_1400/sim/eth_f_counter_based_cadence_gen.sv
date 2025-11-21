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


`timescale 1ps/1ps

module eth_f_counter_based_cadence_gen 
#(
	parameter num = 32,
	parameter denom = 33
)
( 
	input wire i_clk, 
	input wire i_rst_n,
	output wire o_cadence
);

logic [7:0] accum, accum1;
logic custom_cadence;

assign accum1 = (accum >= denom)? accum-denom : accum;
assign o_cadence = custom_cadence;


always @ (posedge i_clk) begin
   if(!i_rst_n) begin
    accum <= 8'h00;
    custom_cadence <= 1'b0;
   end
   else begin
    accum <= accum1 + num;

    if(accum >= denom)
        custom_cadence <= 1'b1;
        else 
        custom_cadence <= 1'b0;
   end
end

endmodule 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onpQIUrL5LqKOEr3c8NItSPQeCAvYwjKO/oMV9Tg2rMxNE31YPvsSFsrD1ak/+VTnxgJYXsjB4OC8l8aCiburm23/NlX2qXrid+FTu23SWB2PTcu1r+OuiuUWrd7jXuMaEmct7KwlBC+Re3qVqlViG6Vk0HBLrBpQSu3urtLntqBn0e4hNYCn2Wwz3sKYRA+zh+9kT33Tf19999Ut2BKDBwdBmu1lEGLRgtMlwfGm4H4vF3aLCsAaCav6g1Jq3Pcra+0Bb76XtzFaiROda9UTYJyR7ZPIf+LeA0e36C1JtqFqDom96oojDcvRAFty5/T3aQyK1unUBvGILMQG1j+RUH3O6bmfdY2uLZDQrfmg9GT9YzMTRKU3spjmO6q095FxitjatvxNZSbet0fjw7gO2j5bhHR9WFODGjxfdXxVwAg2i9WC8F0zmov7QdImOxPumgTU8iTh5GpDFFlGDPtLxE2bdK0JQjhPHb7SMShCaB3tsN8ohkWiROEFLnQ0w+sVyo6hxg9k5KPmep6cAqAEF521ybjb+1HxHIHRx630XKNKFYOS+iZRFI7n/TBthylQLHngr1wiGrbMKMoFS55TSxGi+My+RFII4UUu9CZ3So7u8xt9W9yMitZPnOkkZKrP8ANVhH8w7GIFPFeZytknna+PZVcZOZLTaYLq9Tje//QNHljmOWcivF08Qgk9BTX42KGOI0lKj1TC15avvSJk55Z21LSjEFLvF16tNRIBVRhVa8JeW/2qc3a5C+zLaNa+8OF0QxFAn5P7DSH4WXgKmQB"
`endif