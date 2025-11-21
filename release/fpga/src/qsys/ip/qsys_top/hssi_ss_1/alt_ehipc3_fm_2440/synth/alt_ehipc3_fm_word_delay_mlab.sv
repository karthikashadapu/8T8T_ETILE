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

module alt_ehipc3_fm_word_delay_mlab #(
    parameter WIDTH         = 32,
    parameter SIM_EMULATE   = 0
) (
    input 	       i_clk,
    input              i_rst,
    input [4:0]        i_delay,
    input [WIDTH-1:0]  i_data,
    output [WIDTH-1:0] o_data
);

    wire    [WIDTH-1:0] o_data_int;
    reg     [WIDTH-1:0] o_data_reg;

    reg [4:0]   write_ptr;
    reg [4:0]   read_ptr = 5'd0;

    always @(posedge i_clk) begin
       if (i_rst) begin
	  write_ptr <= 3'd0;
	  read_ptr  <= 3'd0;
       end
       else begin
        write_ptr <= 5'(read_ptr + i_delay);
        read_ptr <= 5'(read_ptr + 1'b1);
       end
    end
   

    alt_ehipc3_fm_mlab #(
        .WIDTH       (WIDTH),
        .ADDR_WIDTH  (5),
        .SIM_EMULATE (SIM_EMULATE)
    ) sm0 (
        .wclk       (i_clk),
        .wena       (1'b1),
        .waddr_reg  ({ write_ptr}),
        .wdata_reg  (i_data),
        .raddr      ({read_ptr}),
        .rdata      (o_data_int)
    );

    always @(posedge i_clk) o_data_reg <= o_data_int;

    assign o_data = o_data_reg;
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B1hiYd+UjbJbPXyM4Em+DHCt5y36PNE0mDwI/8JEWtFfBD5FoSjIzqf2+X07qclRjOY57v4UPuvuk6WMJTVmrZI2aRec7p0rbmXpdOUAXxvtBiESHWb/LonZoQZA80YRPB2PA7siMN5QWS6LsQjQVvXko8qFKrhgDstI5ljV9hdrtsWtNC+NdNN0hph+3s4U+aocrnyV203ZmPsnyqjrwDw32DKDeR1kEMqqA/OD3SXTCRbc+3D8/ucDMYYZnY/kSx2CBVt123JOu/39sb54uLS7pUMfZ8axjacNYcoxoqY7naRIf48J7FX/C0Wewxd7Q+vFDan9Vr4+M61ByAHLpVyYHs2qPmIISQe/i53C6ayNYhWizRtjZVwuvy0OQtBnxR8nYQWj4gUa47Ft5a8JsHHXqzysJkkssOmDK2Rh9zLqw3m+t06lQiPXbx0fPJPv5k6d9BJ/DikxInysp4veLyz7MY5Za8f6L3khfSBEYXgJZ8JnFduBFckPXFYBfeH5HC+Kj3vHJqSscUQtGBXdg57Mq4ibdYG0Nvji7Zi7G3KE29LwfjonbQKL6i7P6aGy8vhWFWEYAgzpM31J6uMONtqbAcuJepem4QWHYuylB5eloVVWcQ9ianMcphCfjnP0Vc83CqKAsjOKIgREbevq+qXVKEqtZVmfX6+vCN8hj1MAa/SO+iM+JcNckU2ooVTnjQ8hoSgig/gbyv8Eh0g0j6kyDvcbGlWMsW67H3zjw7rEWLxalt6vhwDvVrL2jFCRINcsgxhhGkG6HQoSrTJcr9q"
`endif