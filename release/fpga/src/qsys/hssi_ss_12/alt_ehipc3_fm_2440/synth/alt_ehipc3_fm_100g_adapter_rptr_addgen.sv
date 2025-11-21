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

module alt_ehipc3_fm_100g_adapter_rptr_addgen (
    input   logic               clk,
    input   logic   [7:0]       i_ptr,
    output  logic   [0:7][4:0]  o_ptr
);

    genvar i;
    generate
    for (i = 0; i < 8; i++) begin : lane_loop
            always_ff @(posedge clk) o_ptr[i]   <= (i_ptr[2:0] <= i[2:0]) ? i_ptr[7:3] : i_ptr[7:3] + 1'b1;
        end
    endgenerate
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B06mmUprvbUvt6T6VoQnV3fdDvE036dfFEAOYIPgrV9bvZuzPaVTuftDWABF2Yl+uRw8GLtERtuMbCu0xNjCifKsk4zPj4dw8vIPBDe6g0Klk6icV9cEzI/Oh/zf2ckFbRLXtDMcLCvrqHAanZ1me5NzIXFsp9aLYn2CQT9aX9zW1oY03xYySVVlL2PVXR7e2AD8DrG0VRPe+7O0Fo3uEPcRc9MvXe/9APGLzQk+gD4loWDcVhWALAoS56qCl2Xu6ly15jkP4LhfDl3P7LiR+znnjQbG1QZojAVVqL+adcLMOkgOU1yRS4NfTlchq4kld0j92f8Dma+4P9Ede9aAQ+c9tSDvPbd4tWeohk1/hAsWRjpVg53vM1qsQly0uSqMYCTKDb5VJEijwhv6wQrb6oy4y8u6AnCSehADVyjeaIj5rpQ+9VNqmXd99vjeIV3cu94uyrDCodlVnZWvj7euDteYmqPtEq3dHjDLMtgwwsW2crDebt4V1sq2HzaMXcnl09e+v4KCY9UQyfhJhuUEcjtvunp2lI5LFs5UhlFZFkq7IIgx8MZBvNmam2n4Mk0CLSIw3fM+4RYmqnl0Af3axMblLSo5ZBS6gh0tktS02XcYb2iN59b0RTBuUjzefBGRFDNowu8jOhHtjd3zSqeSF+ZD0xiYS4DtIzsxFpZxFuzYM0wYtW5UiksnBUIpQaQbN4VUZM/A+D1MBiVDjaWoxSaqCPHvmKqjn6qLoJIQ3RM1qWHZ69Ro8io29Ao8wlzrIZIp7FMWEjgv2nwVPPTy/VP"
`endif