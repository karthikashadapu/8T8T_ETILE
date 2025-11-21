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
// 8 input AND gate.  Latency 2.

module alt_ehipc3_fm_sl_and8t2 #(
    parameter SIM_EMULATE = 1'b0
) (
    input clk,
    input [7:0] din,
    output dout
);

wire [1:0] leaf;

alt_ehipc3_fm_sl_and4t1 c0 (
    .clk(clk),
    .din(din[3:0]),
    .dout(leaf[0])
);
defparam c0 .SIM_EMULATE = SIM_EMULATE;

alt_ehipc3_fm_sl_and4t1 c1 (
    .clk(clk),
    .din(din[7:4]),
    .dout(leaf[1])
);
defparam c1 .SIM_EMULATE = SIM_EMULATE;

alt_ehipc3_fm_sl_and2t1 c2 (
    .clk(clk),
    .din(leaf),
    .dout(dout)
);
defparam c2 .SIM_EMULATE = SIM_EMULATE;

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iNcmQeM5R+2wXyQcrIvK9Aed2O3DNv4QGFTpmcaGURS3nf96+gCegtWg50e6rleWE64VT4+790Ghs95mog/VHoEYybDIGn5EoWfqpEPzBOW06ogVsMbRm79acU6L09a0INNw7swJhWgHQdzl07TrCbOuFN5j/YV4soVomm30RbpyPicKqaC/jMGdl00awWTRKYI/LlUWB2031x5qz4fwVbhj6DvZKYVLlQLmylj6M7uom15GG/fqYdZ38z9DZ71mkchwKhnSTqCI/Vazc8l9rAEKpXN7JnyiKSl7yGIT6p1mJIA/mkQw9Ebaoj9qkeW2i0dohuRarb8qXRN06kCKuVmdfYyVA2agIHtXDnkMeFMtfP/nwv/a1WOv3h9leDSj8wukmA2trSI8bblBhNGupSvGbY/1b90aYIECqBpXdqLldHJNxPzyyS9/P/xKuGpZIfTBfzauvqPE3LPl5xjduAOOoVyGS3YsxAFQnNxqLxPjTsTRfkHTFz62gOeYOfCUA61uayB04zkhsh2KJIXWTI1jq5JL5t5bbmntPb4W2LQejfxlIM23Q+YKE6fmNpx71w3szvF0j5vyhZFtv+mxImnekZHoJfJxL9HIowstm+Jzs+tasPvoHhg8Hkh3m2w2ag2TlF3a8vVQTVLps26teRlv7T+PyFexZndpKd7GVf5AU1OIiL4LED+ekwBKKhckyeV+yyol2w6T4DZT1iKClRxZYuka7py1bJP0HM36PwWT9gnrtvIVmJDIwDJy5ZHBEMqLb4K+VI26FXPiOkj8LoKz3f8ZTQHhC/2Hc/DNQVjIXpO1ADU7K8nzyq2ECikeavL3bsXhq/U2UXy0yBY5uF7zBnTYpZFKGP9bFVN/ROWhyW43bir41tWkPmk5WaGTmLJ3jqEft/9xqZm/TZOIxkbhJygv2gAZuEUB5svFIJ3PB66yb+DSJNWtyJoISVZJjigS7SZ5uHOegs9xeYIOoixB5EIBkz1uMO/fzOXMoP2h4Iii03q5VwemnwFta25K"
`endif