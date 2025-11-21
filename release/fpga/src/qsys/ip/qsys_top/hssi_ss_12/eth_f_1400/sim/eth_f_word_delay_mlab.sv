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


module eth_f_word_delay_mlab #(
    parameter WIDTH         = 32,
    parameter SIM_EMULATE   = 0
) (
    input 	       i_clk,
    input              i_rst,
    input [2:0]        i_delay,
    input [WIDTH-1:0]  i_data,
    output [WIDTH-1:0] o_data
);

    wire    [WIDTH-1:0] o_data_int;
    reg     [WIDTH-1:0] o_data_reg;

    reg [2:0]   write_ptr;
    reg [2:0]   read_ptr ;

    always @(posedge i_clk) begin
       if (i_rst) begin
	  write_ptr <= 3'd0;
	  read_ptr  <= 3'd0;
       end
       else
	 begin
            write_ptr <= 3'(read_ptr + i_delay);
            read_ptr <= 3'(read_ptr + 1'b1);
	 end
    end

    eth_f_mlab #(
        .WIDTH       (WIDTH),
        .ADDR_WIDTH  (5),
        .SIM_EMULATE (SIM_EMULATE)
    ) sm0 (
        .wclk       (i_clk),
        .wena       (1'b1),
        .waddr_reg  ({2'b00, write_ptr}),
        .wdata_reg  (i_data),
        .raddr      ({2'b00, read_ptr}),
        .rdata      (o_data_int)
    );

    always @(posedge i_clk) begin
        if (i_rst)
            o_data_reg <= '0;
        else
            o_data_reg <= o_data_int;
    end

    assign o_data = o_data_reg;
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX9Y65FcTv8/7Jr/yHgmFTiWEXh2MbR2noUv/TgxDddXQUfcDo9RmcirCinxt/743jhk030ak3rmiIDlc6E3fDFuyjFtdQMdqLtYBSSS6QcpZble/6cWCM9I/uZ3URAv4LTHlENL1XLCKoSAZUZVqvdTzQe27zbbxHiIAE+lNi2Fb/xoHvB+i3Zw/U0VL52blcd4XUfi+YOlV3xhF8ou6K4B3rpAwaOVQdvX7l2L47OLn8Sg63kJIttdghr3ufyfbdbnGmGNfdmdF/yr1X6sHXatlx5XzP7XHd2tORIEol0NseM3EUaKpnVik2mrPlyClVIyDY4maGJc4j0A8ab1Z5MWdyqSrG7W9wiYjQjqxLL8ONhPlTght6b9HHlkAWBceHcnDZOPwn9baiHgRiIlQHecOAWBFL6wzatLG0H0QHcAFrKsWkIfs+guoSmWPR+/osLz+m/mU+6M57pPxxD49ud6/RBBjt91yHa3aIw3T5XZMKfF1J3iL5KjNLvSruLyeMGHIvPtX2DliyW4jlukntLbk7yjcnskc1sGNCkmddhdYowE3MDSlM97R9JOHhyLkezwbT9EoiXFzTa8GCOR4oIga48J1pLQS43XtTGTBM5X9WIDFxnoLVIVfiUfzbDpVXFVpZDNJ20JnWyD4rws5r1g1ra5KwB2HgXOiQ/h50ZyALJ61muXgmPfNwt/LdeORs9EnesCHOQkjFZh3s7jfsaSGke3yqL2T4jdYccM8DYkqyPM5iM7/Dwr0wHasz7t8sCCWGHRSnufoa6nmIqfCy8Z"
`endif