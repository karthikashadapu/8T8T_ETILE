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

module altera_msgdma_prefetcher_interrupt (
    input           clk,
    input           reset,
    input           write_back_done,
    input           transfer_complete_irq_mask,
    input [7:0]     error_irq_mask,
    input           early_termination_irq_mask,
    input [7:0]     error,
    input           early_termination,
    input           clear_irq,
    input           global_interrupt_enable_mask,

    output reg      irq

);

wire set_irq;

always @(posedge clk) begin
    if (reset)
        irq <= 0;
    else begin
        case ({clear_irq, set_irq})
            2'b00: irq <= irq;
            2'b01: irq <= 1'b1;
            2'b10: irq <= 1'b0;
            2'b11: irq <= 1'b1;
        endcase
    end
end

assign set_irq  = (global_interrupt_enable_mask == 1) & (write_back_done == 1) &       // transfer ended and interrupts are enabled
                   ((transfer_complete_irq_mask == 1) |                        // transfer ended and the transfer complete IRQ is enabled
                    ((error & error_irq_mask) != 0) |                          // transfer ended with an error and this IRQ is enabled
                    ((early_termination & early_termination_irq_mask) == 1));  // transfer ended early due to early termination and this IRQ is enabled

                    
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "d5vhRwahtu8K9yyM8KR4OOUSgHRUUd/iZK0O+4Vc7vQ0A733p9gY0o587LXEP52iAIIMByDdR1wcsL18HQtfJF8E2VG+wVMmpQ64EE6q84uGd7nmdLQeT1PX73A3+xvRTo2VqBPPQs9TDabvm3GtHppSmtjgfDWMnGnsoEsUgMh7jxHPXtTG04d7CfaIAPo+gEAxaU+3an+UaRyraEAreqvUHpkjs4PfOEYgQrDmYQV8hQ9vsARvj9zaNyQsTSqAi0iapjBD6spMsj+GObH9FN4faDzv1rKFaJ/6qFAOb3lbEiJliZbV+GAfgsHy/hAsT+DNOkEEflvXZ/4wh0AKssmyL8kYTvAvh6AIYmi6crAcHs5eoFFHDCQMwzmL7xpEkB93PTMFW4vt9qRfJ+zqLrJiUgE0ezMEcc+oGlsESmh1lyX1SPNgGSjJ/f5b4GgO9oYFGwCLzm1Hg5nndZh5feBXzNUaMsE5ZdUHYJTBAlpu41YgkTr+kg0rWZQYVRzAU9QgpxnFm7IyoPnOTEAlfezz9xU3o1ZVPuqVrkLC61Lj8WCCi2SehMsuAPXCZYZQAO79A1w0iSK290aYLkR6eK+Fz4knL0V2Y5Px5vfbfQNYnM4w9Jayx8GqoTfrCeIRZBjsfsdsfKRBn70eYL2XxROE4VzqSc403vj2qeBt6ayRMAIIHS5dU/qaqKCVoo0L96seqG4OQ2k5eaw4MrtZKxdXagyQnWk5jgV6owFHJSG3JAuIaRoqAP2qnDBufFGv4C8Zq4E93g0xPVYnW5uv4npVNTBCoZ94esZbm7k3zSskTBoWkVQxbiU1D8mFtKrj4ZGIaIcwgkAA8EWIIW7NTzaJwQWtd98F7DYfRkHvfmsFHDLtyQRIprTiSleYQDwSXbVFbK2D8ghYZpKbtpM3N3eQV+IcBwO1LP+iMnXHg668+nTHdJoKVaofrT4W11NvlyZOr+9Tli4ndKDD3DMPK57L1j6ZzAZ8Ow+snXc0MQVurmUsHBQfhcFL+mV05HEx"
`endif