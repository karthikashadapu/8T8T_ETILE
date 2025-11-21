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


module eth_f_sop_eop_detection # (
parameter       INFRAME  = 0

)( 


input logic [INFRAME-1:0]      rx_mac_inframe,
input logic                    rx_mac_valid,
input logic                    clk_i,
input logic                    srst_n_i,

output logic[INFRAME-1:0]              SOP_detected,
output logic[INFRAME-1:0]              EOP_detected

);


integer i,j;
logic rx_mac_inframe_d;

always @(*) begin
  for (i=0; i<INFRAME; i=i+1)begin
    if ((rx_mac_valid == 1'b1 ))
         SOP_detected[i] = (i!=0) ? (rx_mac_inframe[i] & ~rx_mac_inframe[i-1]) : (rx_mac_inframe[0] & ~ rx_mac_inframe_d);
		else 
	      SOP_detected[i] = 'h0;	
    end
   end   

always @(posedge clk_i ) begin
  if (~srst_n_i)
   rx_mac_inframe_d <= 1'b0;
  else if(rx_mac_valid) 
   rx_mac_inframe_d <= rx_mac_inframe[INFRAME -1];
end

always @(* ) begin
for (j=0; j<INFRAME; j=j+1)begin
    if (rx_mac_valid == 1'b1 )
         EOP_detected[j] = (j!=0) ? (~rx_mac_inframe[j] & rx_mac_inframe[j-1]) : (~rx_mac_inframe[0] & rx_mac_inframe_d);
	 else
	    EOP_detected[j] = 'h0;
    end
   end   


endmodule






               
                                        
















`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onqmPuOQIcU/Xp6E0p7qDdOJkDs2CVy9Rr8vsaQPTDh5LaX9f/LkcvGATPR+0AYnR1xgtQeI7rs17rLP6ljwNk/m/V2Tmc0Shc7Eno72b/eDRMpRAJ5QKDZfsjHxtg3ZU+npNSEVVC4YKw25JeI3MjqcGXrUaIwt0kfSwEQHvfueF3xg/y3mK+pNjaCWG863/sWVekNcrJpD7xf3hchqFT4SLUbmbYNccLgFqs2DVo+T+8HuNir7Kdgmtu2xGl+tnfZEbLYxtng8OHxKx/PiauebQOc6CYAEzIO1ZZPI1kWBxPvpzSUdb0Xn0Vgmgd8ucJ6W/qepKWz+uphSLdOsgZtQ3yaPV8GLDjHh7YYbKXCusGm4rnuuFIwGPpqijpdKxpuM0dL+IUeq8OYBogmCrVPBJ95pIDO/zQh+iQNlqZI58HrK4P3zsVfkyeOZyYBhg57EPwWepfrP12tlv3rBhwxZaiKBitvlrtRzuhnxfCumXvvAy+jwJD82tqSbVw0UaeTDAh6ouou6CoQiZIYI0qzKvC1WCHkb0KsAR6WPzTEGbYrf7oeFi9lewzfHALURhRQ9KKBEAHRmDvaor6wjo5dBk17ZMSClG37CHlPi/lW+DcNVJHOewfT3AnpvdB9iwIMEgeus19M9TH8rLEkIy+h1m3lunjzoHOJwAGxAoLp5bq/D9joIHIEZUnlw7UnqAV7aKO9aHRYSSfke1e/M4054ymkz+vG7j6a+hWCfOQQBFkCz41RZj+5lL//Vnekgi6PSzDermP1NHg0LC+PSImCz"
`endif