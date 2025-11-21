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

module alt_ehipc3_fm_sm_recover #( SWIDTH = 8)
(
 input 	clk,
 input 	rst_n,
 input [SWIDTH-1:0] state,
 output reg error
 );

   logic     error_comb;
   logic [$clog2(SWIDTH)-1:0] sum;
   
   

   always_comb
     begin
	sum = '0;
	for(integer n=0;n<SWIDTH;n++) begin:compress
	   sum = (state[n])? sum + 1'b1 : sum;
	end:compress
	
	error_comb = sum != 1;
     end
   

   always_ff @(posedge clk)
     begin
	if (~rst_n)
	  error <= 1'b0;
	else
	  error <= error_comb;
     end
   

endmodule // alt_ehipc3_fm_sm_recover
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh3TTzKz2B2CKoDwGdM9JMDfmhbBBeQOxSyw3D9uzEMNHQ+IdmOKXVShvUoLSTokhTASCCfhudvJIZoZMKAFXckAlRo1ZVQueIYId/RWRehUHmgcbgqgYhYIEbAxAvIypKNz3XhOl135MLJtQXf59muvjmq9BTjU/iabS9zqAEdJ+HQTjbCGkuWhz5mt+Xgjuuad3MO6MnNAJB1Mtx8zRYghqa7AGnXysZ5wqlTigU17QIYHIQDzw5N/t9t+ZQteq1+NMJZqHdOtdfxoRRPD6Xkn7U07fGDLIYRdKygFmh8uGNuHsWtj9nzp7QkR0DYNZTA41gQvOL4AGQxsjmdARefbt80fChN/duWbzU0t3nGFqMDHGDbI2OtGPkpn4s3T4xYLvCneg9J3b1W2iLEfGXI31qlbCpiK/k3ea6+iigCfe3OqFuoWcgNx35RQUzk4u3Ozugv7WkKnoPrDDBc7htkiTz8W7OOkfP0Q9jHHpCr85guhygqA0s9I5aT5yXVbyttVQZxDKh/E9NXEQH8ta6rXzUsPu6NawW+sPH6WpfT8A1ILw9H7ROFpSsCu9gbvKAfR0dVSPa1itS2f3xm+G1oQkvxtjASBz0CAKl9VwVFJxC5o+E930V3TC4N3U0+EE5CI9R5djma9AI2qeKWUixvO23r/jF16bVZZFdPSy5N+0RXXBEZPi8YH5xFJz0AKAOgn8alHfKcUwUpMhdxiNIy30erhSXzM4Cp/upiN4hjwLVH0fNGJ7XxVoM8mkqrTGWo+1ObUL8xWC7hLBY+6HV8d"
`endif