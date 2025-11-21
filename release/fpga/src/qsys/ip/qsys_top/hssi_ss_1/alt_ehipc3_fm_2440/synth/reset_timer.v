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


// (C) 2001-2018 Intel Corporation. All rights reserved.
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


module reset_timer (
   input clk,
   input reset,
   input start,
   output reg pulse1,
   output reg pulse2
);

reg start_r;
always @(posedge clk) begin
   if (reset) begin
      start_r <= 1'b0;
   end else begin
      start_r <= start;
   end
end
wire start_pulse = start & ~start_r;

reg [4:0] count;
reg count_enable;
wire count16 = (count == 16);
always @(posedge clk) begin
   if (reset | count16) begin
      count_enable <= 1'b0;
   end else if (start_pulse) begin
      count_enable <= 1'b1;
   end
end

always @(posedge clk) begin
   if (reset | ~count_enable) begin
      count <= 'd0;
   end else begin
      count <= count + 1'd1;
   end
end

wire count1 = (count == 1);
wire count6 = (count == 6);
always @(posedge clk) begin
   if (reset | count6) begin
      pulse1 <= 1'b0;
   end else if (count1) begin
      pulse1 <= 1'b1;
   end
end

wire count14 = (count == 5'd14);
always @(posedge clk) begin
   if (reset) 
   pulse2 <= 1'b0;
   else
   pulse2 <= count14;
end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7uQpVIUHSd0D92Ct0UReGGU8c5xdpMyWPAM3sgvs6WazNEnN9xoYqJ/yQIGaIdOAcVCwxq3gBWX2koVFeUTXkBUkGGoZuZTXveBE6M9LKueFLQopGDi/9srfgkuuaC2e/SCAACI2JFhxyaR2zT+Sp7zyOF67vYaTN+g0gohdgNX+9pk64O52Xs1HQnd1KqZjFnc36VKMWRK9ksYLhgZ3hg/J9G4zDCCrDgKs9M+cknzI9P3vY+xAhdufJVnnH2ovhzEB3CeOir1QtkZvZtB7KB5RpOWl2xM+Ia88LVIxO5JGrFo7Yde/jULiO+87lU5r1/zkfEB08fB8sKjIDvru6bLdy/zv+7DZouE9+dGR0Oddy3y01/09AFiiQVT9F3t9f9/s4AGlO/9HZGDz4tNv6Qk9ZBQTZ8ghMIJUHVVnekASMNIq9fCZJXF4rI1BsDaMnWt5u877Wy41rdgHcW1X8MZjVhzVyzMAbs+JKumRGybTPpi9gjaTj2G3Zs9weehpUomjx7eIWXOvkOCRdVy15BP811kfdLfMbw2CSnSQYQ1mh0sgglokLQzVlu1qtJYg2TSEZ+FNn4xiwx/sYMzCgRCvnkbj4GA1YIsPSNyc3pGaYWQdvoMN6gtCstLB8t0/a5qeVFwN5JrYLnrsAl1bcuE/kMfFodSpfHw25XdKhcNK/l7m0vlbEQ0fze29K0k1faMEPC4ind8LwlkmvW1gZcdigPIGEgwORp58QHV8sdyyK6YZEo4AQgNABA8fiRS/ezZWxUST5IbpbqvPADq7coG"
`endif