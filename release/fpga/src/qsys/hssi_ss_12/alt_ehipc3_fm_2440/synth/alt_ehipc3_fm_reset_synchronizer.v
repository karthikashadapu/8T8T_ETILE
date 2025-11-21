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

// DESCRIPTION
//
// This is a small register circuit for synchronizing aclr signals to produce asynchronous attack and
// synchronous release across clock domains.
//



// CONFIDENCE
// This component has significant hardware test coverage in reference designs and Altera IP cores.
//

module alt_ehipc3_fm_reset_synchronizer (
    input   aclr, // no domain
    input   clk,
    output  aclr_sync
);

wire aclr_sync_n;

    alt_ehipc3_fm_altera_std_synchronizer_nocut #(
                    .depth(3),
                    .rst_value(1'b0)
         )  synchronizer_nocut_inst  (
                    .clk(clk),
                    .reset_n(!aclr),
                    .din(1'b1),
                    .dout(aclr_sync_n)
    );

assign aclr_sync = ~aclr_sync_n;

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh2Qlk2YF9qQyySCFR3mu6mdK8h0uK57Zv4FgKqlizV8mxaeGaSkq9NM83VmHrhm2jdjl7OUaxS17r8B/Xu6Ad/9Obp35yA3OQZzlBznqcQrrvrTPXpIfsl4eNfWpM3a1LqzKQ6XSmLDz3AkbYXZevIVhH7JXg57rzQJ/HgM9Ich81tLMPTkBE/0xPye59IoEkZBtjegSHG3NOQk/6bVMWliRz2hMxNlPuFL5x6NW030Gf/G67zZz7PJYqHxob0B886bdIxA3ZHn2MxjBPIqF0AHSSLLB+aijV5MKCTi8iduPzIiwB93sFfSzSJL0+m9XuT2eZl8KkUMKPrQFL8L0qsoxm5KxUPU0/RmHZmfjoOAPYUNKC2Xj7gjw6mcnmbztTEtGUsUmLcigfnMUkSvvAfysREnFihOCIT9C7Dj3/5exYQ7FC/q6BpFJ7wAOnqI8ciFgjsJJdlHF3U5VBi+uRizwoQD9vP+Bbabv3Fi1cfcytHIpiVKtoksrdiB7y5/+HRW/z4T4VtBeSgZbiFGLN3QPXVtvIQAZIUPgz/EwDvX8FEBtDzweVpV52Q2ENBQYFCGWUexbnIcuoO7JBuoFhRQN0XeGfx9VzoxsdkYqW1/bt92p7xxYrVP7H3DqYhOZlFnDaKOL+9hE+92AWLCss3VrYolqXOgciuuvoOYuizHfla1zgP3DliUIWgulY8ADRU/Gde8FpoF4Juae0P2XFisXd9UjbJexhwGRQWZq/ULX8VDSVe2ysgGiXMRBYpo6Y4wrcg5Pi7zgBNUrpTZtdMo"
`endif