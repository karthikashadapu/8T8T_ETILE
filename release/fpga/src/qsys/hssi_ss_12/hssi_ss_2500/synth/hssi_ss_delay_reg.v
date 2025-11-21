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

module hssi_ss_delay_reg #(
    parameter CYCLES = 3,
    parameter WIDTH = 1
) (
    input              clk,
    input  [WIDTH-1:0] din,
    output [WIDTH-1:0] dout
);

    genvar i;
    generate
        for (i = 0; i < WIDTH; i=i+1) begin : bit_loop
            hssi_ss_delay_reg_1b #(
                .CYCLES (CYCLES)
            ) delay_1b (
                .clk    (clk),
                .din    (din[i]),
                .dout   (dout[i])
            );
        end
    endgenerate
endmodule

module hssi_ss_delay_reg_1b #(
    parameter CYCLES = 1
) (
    input   clk,
    input   din,
    output  dout
);

    generate
        if (CYCLES == 0) begin
            assign dout = din;
        end else if (CYCLES == 1) begin
            reg state;
            always @(posedge clk) state <= din;
            assign dout = state;
        end else begin
            reg [CYCLES-1:0] state;
            always @(posedge clk) state <= {din, state[CYCLES-1:1]};
            assign dout = state[0];
        end
    endgenerate
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6ysNviaHLZAzTJdMtEgF/rvjbxz1YCamIS3/6DwVxxUZvAlImxc+TCu39KVAqfRUtbBhpU4RMXUPeDbGtt76nQpR50EAmV6SLyfFp/oIdLrbYoVdgv7F8CH7gnRvGEFcyRPvS6/5rJwqryPiRo6114amfdAsMMzUb3C+DWmMcj5r6hxh1/WJwsAjIrAVYK4+jrQbyJe3GNITauQ7Yh7jR1kf5PO65i3ABTVMqZP3EBc+CGC9tgXNEW8XOvXCq9MfC3e6tZqOqrXft9No2OKJ64NTw/ZYsFNVhIDK+UPiqNe5lRIv88hW3lFjaulLJ19Xc4AcKvzaSwMqwtUyGM9H2UOsmCMRB7ztNnhnV76CikdeN+W7xzxaSrkjRUU8hmYTzsUBWWxxsgrzHuKvqdQ/hjsXgi3XO36lN2+u6Jmb9UgQVQ23tkXemeyLwdN3GzXB5Y4tXTrEVQdRVqZtNHFEnIEFoD2fjRnK9G+6XLn3u8GCUrwAmM++rw5CyolGWFsxBrQVPeMxvA+9iLxXvGV3zNNADy3VNNhgBL9SDdKhg6aTO5tkelw/0zGfQEfSmxrugUDKv5lEZFuBqmV7Viw8s7l26kYhtMZ63hyBVuhO5wyj58WYpVX5USVjky20+ABrw5ay1ChgRLHLsUj1lDlPq1Lj2graF66mPw9zqFYV7Cz4NzWuYCTPYyXwffhFG/R3j4pagtqZwFNumTMsI9a0PwglQk4xrUAdaGllX4bLH0FUS/UBYJA9xUTv4ZQ9z/As/GSy5lmXkefxJwLVk7P00vhv"
`endif