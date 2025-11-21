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
module eth_f_data_rotate_8to8_tx100a #(
    parameter WIDTH = 8
) (
    input   logic                       i_clk,
    input   logic        [2:0]          i_rotate,
    input   logic   [0:7][WIDTH-1:0]    i_data,
    output  logic   [0:7][WIDTH-1:0]    o_data
);

    logic   [0:7][WIDTH-1:0]    o_data_reg;

    always_ff @(posedge i_clk) begin
        case (i_rotate)
            3'd0 : o_data_reg   <= i_data;
            3'd1 : o_data_reg   <= {i_data[7], i_data[0:6]};
            3'd2 : o_data_reg   <= {i_data[6:7], i_data[0:5]};
            3'd3 : o_data_reg   <= {i_data[5:7], i_data[0:4]};
            3'd4 : o_data_reg   <= {i_data[4:7], i_data[0:3]};
            3'd5 : o_data_reg   <= {i_data[3:7], i_data[0:2]};
            3'd6 : o_data_reg   <= {i_data[2:7], i_data[0:1]};
            3'd7 : o_data_reg   <= {i_data[1:7], i_data[0]};
        endcase
        o_data <= o_data_reg;
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onq6KBsYc10+rApMY73adMd2tY9UPaEMxFh/knasQcXdxv90yzvfO87FwmF99+6tbTv0gL0tkf98NermhqJwp4bk/taBABx3LE4esQWB2dRn3ZTd6cV0WEPogOouSgKmY85NfdMMoxb6h/dF5ukrEDEKysG1u8RfU/cPxQ7loruiw3DmnJNqYwihJXPb+MJNcoiHbfdpA2AaqXIut8xOkmDgbqly+dn/TE02JCbcWdBsdn8rQQgoaS9kaWx3/4uSFfYKeXk4ZG87JyuzjRlHajlV0blMRzarfRlZk7xZdhL+pd040A9RDnF4tr35GmaFX1ninjdTov4wMteJ0wY3gRzDSSojaGV5gDSC/aksycCdkaFych5bInmTQdyXldm5JFw3IL26x6OGe1pFx/E+a3iixax2jR573UCxV76LxJBeusd3x4xEt43GRF1OmuJHuQhgXmufnZr/aEEwbjT5Sb5vYvLhBN/ikz0QVnyqc4yWPe4ouv82uVIfdDBhFSsoe1GrH0E2uqqwkDXyoJXukhb4t7IIJ9/0/XusnqxMAuPkxEHUvlNuzh3SwlvoDjEqVrOJrU+qEZZh0oGGgZyWybWFKtrPgzN+vE0Y6xT/ZMe6CNgtFahTmbMpg03bqL42mzOG6ID2P+jjn+vYVWUXWXGUCE3363R/TTKcKtFpIRnFPDC0L3bKH+OiwUGgLFfc2NArBlpuCLM0tVzExBPyC8ImIzX1hfZ0MTqu6q/97ZB38p3aWPe8Ac9zPMTVu70Qemx17GiQsl7MusU3jSLoUxv8"
`endif