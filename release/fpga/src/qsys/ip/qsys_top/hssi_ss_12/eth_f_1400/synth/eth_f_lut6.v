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

module eth_f_lut6 #(
    parameter MASK = 64'h80000000_00000000,
    parameter SIM_EMULATE = 1'b0
) (
    input [5:0] din,
    output dout
);

generate
    if (SIM_EMULATE) begin : g_sim_emulate
        assign dout = MASK [din];
    end else begin : g_sim_10nm
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
`pragma questa_oem_00 "HEQcwkIk4AJUnyybgwol/5f4LNrpC62dnM4HE75Mb8kxROzHwkOVqUjjNakwyQUVn3rWDca7QqKGruQoj2QI6diWrHBuVPm2ePzJYe0opoRKRsrSLsozd6ihfZo7Y4AobDGlA0sx1RWdC2xxmhs6EhsIEYbW0OeABq8z3YlmhZOCNJP7S54htV6uHLAYjjaGmL7pkx5+dyKYUHnNRVlphInbKBlJ9OHWSVdDlWH+1XaeP48avRWOmTTZcIeqtEBbUx807iOk2qMiYoYYVQtVTATzpYsyYg+zmAXOlbqU+b9o/1puEixiCrCUqTGcLzutaab8ukek7iEATY19AlSGkpnQP7tRy1HZz4dsmeso/rNvpNVAxSwq/5ZqBdouE73Cjw1CZUhzGYT+uI7touN8GjARiwutkVZ1iqOlpSWBadpHKG1rG4ItJ5W/rlI6LWrGUG4JnGHH1AcVCPwlEVeyV4wWWPbiElUIchos9VLozM2ftgkUEh5CG4O0DzZUJ/ZBBDxT662lDlqDB8FpQzVZWw84H2GSFoMISo5ozT8oUBbp5/OaAv548Z6ynaYUIANqAkb/64Fylp7mTSIGWjCaZhdYko2iUkDw7KQc4t7ofx7mhgjaIy4yfPSnXi4D7GcAF/0oEnjoLz4MzXJscjRz1Ua/c1k/hXtap6qe8OnYKloTSE0CKhJ8zeleKw2HlUeNj4JqZ8y6ATial3ZwrPm4+gmJXtCOZ1jsQ5nXLN19zK8jW9B5ckkte7ZJYDU75BfjdxBrpu39no5kLqhoBoV6Mq3AFPoqFUpoIaRFENp36qHS5mDqAsGa6/HzgbtB1XT0dQXuhnC8aWdudYmT+CSMVQtwpOJ3rfjWrbTD1ZlIkg+eZWRUy9/7wdtb+vOLk/Fy147+KeJy/oG/DgSsdfm/Zf0ETvpNOdgEFshjcQnatQH3GjX4tw4XILYAif0I9/m5T8HozkIuDBpesKj8ha/bFD8EewpmnweI0MKaUfGsJ0N26xsoVH/VMw5uA8tX8MWX"
`endif