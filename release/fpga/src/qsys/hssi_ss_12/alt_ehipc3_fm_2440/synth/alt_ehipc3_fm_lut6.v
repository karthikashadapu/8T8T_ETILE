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

module alt_ehipc3_fm_lut6 #(
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
        //Note: the S5 cell is 99% the same, and compatible
        //stratixv_lcell_comb a10c (
 
        tennm_lcell_comb a10c (
            .dataa (din[0]),
            .datab (din[1]),
            .datac (din[2]),
            .datad (din[3]),
            .datae (din[4]),
            .dataf (din[5]),
            .datag(1'b1),
            
            .cin(1'b1),
            
            
            // synthesis translate_off
            // this is for stratix 10 (fourteen) but not the others
            .datah(1'b1),
                        
            // this does not exist in S10, but is partially there in the models right this second
            .sharein(1'b0),
            // synthesis translate_on
            
            .sumout(),.cout(),.shareout(),
            .combout(dout)
        );
        defparam a10c .lut_mask = MASK;
        defparam a10c .shared_arith = "off";
        defparam a10c .extended_lut = "off";
    end
endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7tCBT2jROsGLavv3+BL7vl1EpIIGlnhiHA+KWQ1FwSaMsTUi0krt28Gstwa1/k2mpTPP+WEIbJdLDnMBqrZIilRfJcPoqjQRcea08130ADlGdtNolg1PGbo1pBq43OfLF5f/V4R4q/Bcay1BP6SOH9zL6FU+1iaPJ3ApApHo3n4SbkrqQemkv0YceE78c/Gl8V5YkbocLAb2uIJ4es8gCZzsmpIv4LnmbYKU+0LqR74wqRpZrCvYv4xsdqp3VGlOjELKgkhFoXztnSA7sUbP3wb6R56EU9lDjKm8RMDtWTECsoiuWaC5xdHEjzFyEdycbLjyzuvVOZ573mpdd5sS8+6OW1hmE8Gj2PrN3VLLNN9sTCCvLBVG5R9fG/iI+b+7J9Zp+I6CEcIwEPdqwAxNB3gamE4Pmwf322b0vqQsutdNb15+eSgX4nJjfL1r/H0vQX4eN+tW9dqqCs/WHo3YYkpNxip7UFuMmvIYfS042CtISNvSaig48Rf5u4UwgK2T/UUeITZ1IPpE+8/Gwx+K7+6pDsVDVnXsSREQr9L9fg4MJkEhXWfPypQ7Ld2F71o2bZKEWKe4Cq2eB9SFe2T34pthKjKbRdHhv3efgGdfyOMnMZS+So+GJNr3xvDveYWGd7WmfU5SihVbC2xVbYW5fGWdS9kc92r9Seu6h7Aabng1+hou1L+uOeYCeUxlYwSe6BDbtm2M7weRvcPGJZvlay1kkJuw00lS/a/LHubPJN35DvHo3/Ds15lYPqJ3d36SyKewKj6Ihmbfm7o5y9oZHsN"
`endif