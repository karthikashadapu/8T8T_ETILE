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


module eth_f_50g_rx_rptr_gen_async (
    input   logic               i_clk,
    input   logic   [5:0]       i_ptr,
    output  logic   [0:1][4:0]  o_ptr
);

    always_ff @(posedge i_clk) begin
        case (i_ptr[0])
            1'd0 : o_ptr <= {i_ptr[5:1], i_ptr[5:1]};
            1'd1 : o_ptr <= {i_ptr[5:1] + 1'd1, i_ptr[5:1]};
        endcase
    end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onovnU3WSdNo3KYydrifaa3Dkv+sQOnXUhubytsGd7FwEHR/RA9PPuAPAZrp0VPjK7GIFIiFQs9TA2l/hK7fxJ5VISdmQBAOfNwtMaMwvqBIiNPkEPnWw8fu/Clt0BD1D1ZJv/W64rKi+mBZ3nKYxV3DdjryjpgbO3tnhZuxJmqrbFt+QdbwBMKocS6fuhRZ4rCu0pC5QnNrD0fKmFGbWEiXI+j7Rf3iVuBoJiN+ujA3qSbljWmF/M9Imv6VSn/ndwQCMVJ3+F0UOtcNafaNEFpfCzyO4uCrC6Y7X1yQmV2SPXRicEGTDZvtMN2BIHb2mESA+/G5rpQyJXyU7RcXEbBq7uJMw7k/lJveJDXl9Gq7IFCHBF5ikcuFi3bw3m4AFDTZPmeJ7bCC/ytlCEpEBlILF0Lp+peiVeQovRECHZKnZaQ4+wPu95RK59TRgq/iXGRD/Iq1s1sajL1zjl9UzYB6oRpFRqTmU9z1y/h+zJizDUKNHY4rbaJOREZvqagl0jBDZSFgsMY+db8ctgBqBFFqx9zLdZrQhbEeCjKRGDWq/G9MWJ3vJYlj1/OOe8J8Dklsp1XlyIZvNPfqNtRzPB+f8mNwDw2D3IcH13OiLGVjbkk27YIPwlfY9G2tIurQkVn3kgVQIKATDW4nBFKA3qcIkCHKjqKsOSjpM13js7dI9razxu1unLsjvbRH2v/AQTzg0JAh9iEqo7YIPBCk8XfIrdi4SXJ5rDWGGcpyFq34pnorD401r3d0aIZxEIUPNviGuSO6/Cw5tC62gvX2ppAp"
`endif