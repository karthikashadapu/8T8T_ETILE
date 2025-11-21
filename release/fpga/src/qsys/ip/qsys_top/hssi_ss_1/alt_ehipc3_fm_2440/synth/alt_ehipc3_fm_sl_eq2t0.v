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




`timescale 1ps/1ps

// DESCRIPTION
// Equality compare of two 2 bit words.  Latency 0.

module alt_ehipc3_fm_sl_eq2t0 #(
    parameter SIM_EMULATE = 1'b0
) (
    input [1:0] dina,
    input [1:0] dinb,
    output dout
);

alt_ehipc3_fm_sl_lut6 t0 (.din({1'b0,dina[1:0],1'b0,dinb[1:0]}),.dout(dout));
defparam t0 .SIM_EMULATE = SIM_EMULATE;
defparam t0 .MASK = 64'h8040201008040201; // {a,b,c} == {d,e,f};

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7s4mQvdN4IwrVemh+6OYlpokoItmALZikLOCKAbeRKsVg0WvVLDNDSUqvzh9Mrx2ACIWxzCaAxKuzVtwheHwz9Bt3QbV5DnZqIEWschvr5dM2iBxk7vpr3ZKIapkYfblywqnbCjgW1cnq6MkqUoIVLyk9jhIvLZXkYHpqXqpKbAhAmTij7hAgxHQv1d0dPclVG72vcAfrkaQkI9U+r75r87sdBi+QERyDXTtxxxO6xBqA4tQhZgnwD4Nr7ZEt6S5aRiMntDWLxc23xxXz3pQhEZ+e88DW5IVZrKKNS+zwB4pyOzDN3EMF3qNPdAhTpjqZzuckTuRDRpJOCIdNpaJs46szZAm68I9Ng+NsZTE6JL3Sl8R/FMP50OmpJDguoqKTOatpEQTrHM8lscLOig8CqeC0+Oo5Xmp6NMGQEgmLd25HtOdgR7Av8XREdLBporSb4CZH4opw69fHRISRvU67yREhzl6ptj10AqKwEufj0HXrFHMNGXtHpauMnSS/WSsl/YWiAL31NVtGTZLbp2nzLLD4PPqIJnbC9FpBWveV7XABN97TAdJcEFICai4gybXIUSCeOChlZXUK6UGYHMI4repYXhg3qHlmce8lFVye9m3pMozEoMBP4yNBS8S+I3aLrqhcuj66dU4n02Vz+Xc2aPm4S8uA3l5BeLSOFJnBuXGFCG9NkJWijzyx25zsGyQ8iAlZwyyrwaavjeo5Q21YV50mn67PfwR5n4OZvRqiciu4zhp19dZBBs129b89Nj16oZYN3IV9sw3psCIeseoexR"
`endif