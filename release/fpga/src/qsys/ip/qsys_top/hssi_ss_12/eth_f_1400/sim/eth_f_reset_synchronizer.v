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


`timescale 1 ps / 1 ps

// DESCRIPTION
//
// This is a small register circuit for synchronizing aclr signals to produce asynchronous attack and
// synchronous release across clock domains.
//



// CONFIDENCE
// This component has significant hardware test coverage in reference designs and Altera IP cores.
//

module eth_f_reset_synchronizer (
    input   aclr, // no domain
    input   clk,
    output  aclr_sync
);

wire aclr_sync_n;

    eth_f_altera_std_synchronizer_nocut #(
                    .depth(3),
                    .rst_value(1'b0)
         )  synchronizer_nocut_inst  (
                    .clk(clk),
                    .reset_n(!aclr),
                    .din(1'b1),
                    .dout(aclr_sync_n)
    );

assign aclr_sync = ~aclr_sync_n;

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1Xa7cH4CI2oZ1/xwF3+15WzA93OobD5pUbr75tvjuEPgbksx72jYj4NX1FE1qQReNYyZayGQgBniWK7dhuGv1BzoHa4Y4Q2UMEchknU9Vr/IgzBxRbjYp9VAPlOP7nlI6pGsFbqwxpXD6hScCe3BIamAInigrMJTeBMG7neWMjK7DaIqMSeGM/XEHXQ+jDc2DFQUNpH3eLxKYo/8x7IpQrc1uUmO+RQcEzyu1NLpJttQvUKTAm5GYuRyRO+Ogud0Zyr77Jm9qdQbJ1VHlYLQCq0fPEfN9RwyW+yxiGVSyL3pjuuQFVVaVOLuV3K3OfOfUZu1hk9pTooGtagIT8BN9RcP18BCKu4beOwDdKTg4jCbsqDiB+XYaidmaTnF3sm8v5Zd1k9GdpSVf0C3iq2unamCDmRumnYA9aA1yXHfjrcbAxVg7bLJi949nlCkjwimhIgl41OGNCpKihJdflzSiTn/59FU9y1KoyCjMycSjUQykPYOVsweZFYa29evA26GK4OQtazd1spUVSOX8PUxnBjP+X4USe1cPLmkdKA9/eqtIspZ59DHfWPbmhRpXwOMYRr9bFV8VsOq4ki41HMAFFzudvGkOvqeUBFiRJy+Ihbdclp1wdKoohCyFLzryoWr4/fE7/R3u9i1Nnt3Sm+31P70qNWVhoMWa+8iB6LW6T7ltxe6jo6FMkX6OZbXW6yYtGfVd5gay2gbKF6v/SkxHbYloK1clyncT1vAkn5qD8sinJdhgd+axabhhjHp9Pr76xjBINCkYgdP0RPFnzllqezS"
`endif