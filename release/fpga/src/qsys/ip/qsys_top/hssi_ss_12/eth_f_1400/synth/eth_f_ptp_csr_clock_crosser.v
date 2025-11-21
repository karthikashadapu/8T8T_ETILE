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


//------------------------------------------------------------------------------
//
// Filename         : eth_f_ptp_csr_clock_crosser.v
//
//==============================================================================
//
// Description         :
// DATA_BUFFER_MODE = 0, 
//        no data buffer. sdc constraint for o_out_data to next_flop required.
// DATA_BUFFER_MODE = 1, 
//        i_in_data is flopped to out_data_buffer.
//        out_data updates value when out_valid=1;
//
//------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module eth_f_ptp_csr_clock_crosser #(
    parameter SYNC_DEPTH = 3,
    parameter DATA_WIDTH = 8,
    parameter DATA_BUFFER_MODE = 0
) (
    input                       i_in_clk,
    input                       i_in_rst_n,
    input                       i_in_valid,
    input   [DATA_WIDTH-1:0]    i_in_data,
    input                       i_out_clk,
    input                       i_out_rst_n,
    output                      o_out_valid,
    output  [DATA_WIDTH-1:0]    o_out_data
    
);

// valid
reg     in_transfer_valid;
wire    out_transfer_valid;
reg     out_valid;
// Data buffers
wire [DATA_WIDTH-1:0] in_data;
// reg  [DATA_WIDTH-1:0] in_data_buffer;
// (* altera_attribute = {"-name SYNCHRONIZER_IDENTIFICATION OFF"} *) reg [DATA_WIDTH-1:0] out_data_buffer;
reg  [DATA_WIDTH-1:0] out_data_buffer;
reg  [DATA_WIDTH-1:0] out_data;


// -------------------------------------------
// i_in_clk
// -------------------------------------------
// flop - ensure no combi involved in clock crossing
always @(posedge i_in_clk) begin
    if (~i_in_rst_n) begin
        in_transfer_valid   <= 1'b0;
        // in_data_buffer <= {DATA_WIDTH{1'b0}};
    end
    else begin
        in_transfer_valid   <= i_in_valid;
        // in_data_buffer      <= i_in_data;
    end
end
assign in_data = i_in_data;

// -------------------------------------------
// clock crossing
// -------------------------------------------
// Clock cross the data valid (clean, no combi)
eth_f_altera_std_synchronizer_nocut #(
    .depth(SYNC_DEPTH)
) valid_sync (
    .clk        (i_out_clk),
    .reset_n    (1'b1),
    .din        (in_transfer_valid),
    .dout       (out_transfer_valid)
);

// Clock cross the multi-bit data (clean, no combi)
generate if (DATA_BUFFER_MODE == 1) begin
    always @(posedge i_out_clk) begin
        out_data_buffer <= in_data;
    end
end
else begin
    always @(*) begin
        out_data_buffer = in_data;
    end
end
endgenerate

// -------------------------------------------
// i_out_clk
// -------------------------------------------
generate if (DATA_BUFFER_MODE == 1) begin
    always @(posedge i_out_clk) begin
        if (~i_out_rst_n) begin
            out_valid   <= {1'b0};
            out_data    <= {DATA_WIDTH{1'b0}};
        end
        else begin
            out_valid   <= out_transfer_valid;
            if (out_transfer_valid) begin
                out_data    <= out_data_buffer;
            end
        end
    end
end
else begin
    always @(*) begin
        out_valid   = out_transfer_valid;
        out_data    = out_data_buffer;
    end
end
endgenerate

// Output data
assign o_out_valid  = out_valid;
assign o_out_data   = out_data ;

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX945iaWiOVwswjYdjOCrEZ3xXVrjE24niZ1UtZA9fn2KZNgoabqL4ukZi2j3Lj7keeah9bsCIvicbCrrrr6QYAIgqkdEASwuhJaS3suwVNBIzPm63I6xkbaX1u0LdOe6ZKTfym6a6UEgkvXCPduH6d/m5nUDN52229a+3NtRsgAPff4RDkZzFeqKWG+CEDY2e4/T/vX2QAZbT30Kogw6Pnq3zV4Ln/BS2VPp0S7xSBD9C3k0qPdMhSuagcqEA5TjeHB6O8bHK2No0LVsLtNZeFVU42UHC/jAzlhQA0Nxr2x9i3D9Nh7hEKc1uZTretW+YM6c6TyDqowBwvtOskyKBWgKLTTFyECds8zee+GUESC8oMZzvAsoae36zpqVedMe4MiaQvNixEMAHpHjX5JNlAFutJ4+85tjqcIMF1WQj1owAf4C0UwTNSYaeFwCZ82sHt4rQ8zecGRrxqnOyZfsMykVVdr7bclr+GP+6AH4cv5gBNr+qgeIhO16X1ys0Pd3q/TvgZk983t37c3qx0zHo/f4YjPi0vu7RXjZLQY+3nsnDd0XvmpTYovppJfHhqXf7APyZ5e/oEEEZ8WJ0fZ5egHqn3omWeMZ2K/gSJO4vTx0NqJtwYD3eL1Ypbajf6pz572CMjJAGBNNEIfy07se0MgiqBXzFSxbx4SrI7kVs5Ae4KVlVKpVPlX1NVQdbpfEIfSP4OLVkOhAkAtFLPfTPSAOWcSYiL7DxDguPbXTwOWRO9URLL8D3fAsp2mHvDsq2kvq4c/xPpvZaaGDApNdPJS"
`endif