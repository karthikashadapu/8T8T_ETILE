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


module shift #(parameter WIDTH = 1, parameter DEPTH = 0) (
    input logic clk,
    input logic [WIDTH-1:0] din,
    output logic [WIDTH-1:0] dout
);

logic [WIDTH-1:0] shift_register [DEPTH-1:0];

integer i;
generate
if (DEPTH == 0)
begin
    always_comb
    begin
        dout = din;
    end
end
else
begin
    always_ff @(posedge clk)
    begin
        shift_register[0] <= din;
        for (i = 1; i < DEPTH; i = i + 1)
        begin
            shift_register[i] <= shift_register[i-1]; 
        end
    end

    always_comb
    begin
        dout = shift_register[DEPTH-1];
    end
end
endgenerate

endmodule 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "uqegiMVes1KmbQfme3CWF1C7qfQmGqzga5A0fD49zo8Mu6CeEAMPRlviHh40XnorS8zUh/cNBN+YCY1WBi7DzCS4w+zYiaLiVIB/ybyFQnjo6mwa+v+JITilP37KarRNEiMxM/MQfhg7B5lOpyxWjIYX96QLQvdwglBjWex/+xrvarPnru8siuRcMS2YyfYqCucmkQaVef8gD/PMNoVfnCLWBh17otV1NCKOrJU9BiVxgrDZQqtStKEtTvd/iOgYSSmMuKS463Z2rENIZXfh7tsszp/wl0XPtyTdbIlbmOvhgmHOvNqsjuILkoV7WAX/6fAqs5E8x3u11JGa1eQfICN7IccDHand+gGIADMHX+P4f0UlRHQ8NSdX5FXMeH+KBqpsmToDNXwWda1gd17Kb0mQiw1E+5tGlwfJhs9caQQEhrX3ti2rAUdkVEcQEX1ntp6IxU6/PF8YoTdxL7mcSHxaCqR9EDrfYfOQRo36Fc8bLz48ym2QJacEfYG6z/iXNtIoAgPvipE0zLDlUmPrXJ0Wo+PszaxmH5VtiyBgxEUe9GqPjSn8rrsh/j9+ZfHWwrcweZCARI6QB3wVF2iZkxYb6g1Q75AcOAiK4T1DkMeBVwMTzLTccyYJu50HaMmTt6NHNnjk80pUM6/zXB9bXglgoGz3iOnRI+bJGgjZOK2023d6T95B0JplLlxk6JKEOJciXOKDGwO22NaDne1ASuF4qu/8ZnOLvSSlv+gOcWVDRgNFjeA2ctJZMSjSzW4bGn3dVjXUjqfiJPYQcsrEXaHpF9ueZnKTuXfb2Pk5UHy762DdK04IH7QshOMWn5MEbm4Y4srUlbUIdJ8uKKWh/WPXQ8cSYyppKAQzm/VPcuO/5S+kxfZszDeD//Xv6ZCCP/1AX5AdwbDRyWBGekRoD+u/hu2lIfGa76JfJNUyCqz1e7oJ4BpbuSI7Ms0Oj7Mv3IWuRWtnu5wRyVXWiyC7/zVyI+zroNjLsF7HX9t/haL78O/fLm1dXHMF4Tp6PN+5"
`endif