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

module alt_ehipc3_fm_sl_lut6 #(
    parameter MASK = 64'h80000000_00000000,
    parameter SIM_EMULATE = 1'b0
) (
    input [5:0] din,
    output dout
);

generate
    if (SIM_EMULATE) begin
        assign dout = MASK [din];
    end else begin

        tennm_lcell_comb s10c (
            .dataa (din[0]),
            .datab (din[1]),
            .datac (din[2]),
            .datad (din[3]),
            .datae (din[4]),
            .dataf (din[5]),
            .datag(1'b1),
            .cin(1'b1),
            // synthesis translate_off
            .datah(1'b1),
            .sharein(1'b0),  // does not exist in S10, but present in models for now
            // synthesis translate_on
            .sumout(),.cout(),.shareout(),
            .combout(dout)
        );
        defparam s10c .lut_mask = MASK;
        defparam s10c .shared_arith = "off";
        defparam s10c .extended_lut = "off";
    end
endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B0Zad0utV30S0rFpG6TcByYOQ8vjUObY8NJIpQKh7hz4th8dJOkRpFmh3QIAJDvBtmfvpTg57sD+5Heqeo45fY/wIK8Gy97nqevJY6D+jPmLIvo5JR+rVLHbBgVHyszLjNUCtisWpT8klfOzQ5qkXTWSr6Ez6004DwOIaQ0DLaMMsiI1CxpUqcBCOzWJq9NtKbSvmLIV4RIDY29orr8+PF7XUIFYBYsoID+st404SvPZmXBAkBVTgVH+/4WostkDd1utWgN3vr92Ki5o9wGhoI0lgu97BhTD0ODWWAeml8aj8kpfWJ2/rbXGOjor5qu3Yy8+Snk2OHpaKHG+nYGP9vPbyxta11rkcLcTvufXULqAgMU1bPLBGiLoQB+6WjIJOMx1+VmpB7tHBM4ixKPEyrpZCASrpZKxZr90L4t5Cm6sl40lU2yH7DKSBIo6Y62OgfqMju1GLFzX/Nk0SW+zxzrY3S38fSALMTi03qWEXXTEGo60po8N5+HCxDrT7Df7kgXCMS2Ki64WMpQIElTEIzKBWfL89WAUtG2/C37hyGjZz+xIdDDDM1W67T1kW634YejU4Db/xlpozAnV13mxVhF8eVxB4cvAj1ykeX35Pdw0Q+P4zJ3N97pFI8o060+Xx/oYuipafepZuS5uapwbeTKo7JXt/DV9tMHWD7siOpEMQnCSYZ7eO71YZX4sh5jsQA1yQg555azi8xjxQvjbkRytJy2tTnp2c6xjwx10Z7c0VxVleAkmD7cnO1ioqJban+U8StwwB6y8izAa90t+yId"
`endif