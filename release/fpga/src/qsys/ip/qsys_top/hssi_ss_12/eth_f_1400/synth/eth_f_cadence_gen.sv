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


module eth_f_cadence_gen #(
parameter SIM_EMULATE = 1'b0
) (
		    input i_rst_n, 	//Reset input, active low
                    input i_clk_tx_div, //TX PMA Div66 Clock (390M/312M/156M)
                    input i_clk_pll,    //GDR System PLL Clock(403M/415M or Custom Clock)
                    output o_cadence    //Cadence output @ i_clk_pll
                    );

//custom cadence - efifo implementation
localparam AW=4;
localparam THRS=7;

logic [AW-1:0] wptr=1<<(AW-1), rptr=0;
logic [AW-1:0] wptr_sync;
logic [AW:0] ptrdiff;
logic [AW-1:0] ptrdiff2;
logic pempty;
logic i_rst_n_sync;

// synchronize i_rst_n with div66 clock
eth_f_altera_std_synchronizer_nocut rst_n_sync_inst (
    .clk        (i_clk_tx_div),
    .reset_n    (1'b1),
    .din        (i_rst_n), 
    .dout       (i_rst_n_sync)
  );




always @ (posedge i_clk_tx_div or negedge i_rst_n_sync)
begin
    if(~i_rst_n_sync)
        wptr <= 0;
    else
        wptr <= wptr + 1;
end

eth_f_pointer_synchronizer #(
	.WIDTH      (AW+1),
	.SIM_EMULATE (SIM_EMULATE)
) u_wptr_sync (
		.clk_in     (i_clk_tx_div),
		.ptr_in     (wptr),
		.clk_out    (i_clk_pll),
		.ptr_out    (wptr_sync)
);

assign ptrdiff = wptr_sync - rptr;
assign pempty = ptrdiff2 < THRS;

always @ (posedge i_clk_pll or negedge i_rst_n)
begin
    if(~i_rst_n)
        rptr <= (1<<(AW-1));
    else
    if(wptr_sync[AW-1:2] == rptr[AW-1:2])
        rptr <= rptr + (1<<(AW-1));
    else if(pempty)
        rptr <= rptr;
    else
        rptr <= rptr + 1;
end

assign ptrdiff2 = ptrdiff[AW-1:0];

assign o_cadence = ~pempty;

endmodule 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onrTLegu8N3nFFaF6rCq6eLAqD5reEAiuoN9LfTpNP3+Lp9cEHBhtXThdLBoWaSIAs9GeoIGKi8BziaWRIktth/Vj2bhTt8gH0G7L611bMqgT2Mpm+3vngbP+QWDTSwyRMyWiVJOEhbOh/dZgXkHvFtiQ35urwiMoxUuWQrwjRc41LCWNjvIRa2SlaRoTjPHC3iuec9pIvc0U4Fegs7mW+fr3i+m2deoLaeY2NPUw905z6wfUprLMcjKkWkqhY52ydkA44DPMa/QE1q3MokHe/AN0NV45qS+L1Qb1Ahc8s7B3L7kVRB1PCOfFoGcrjw1aGyR8LUA1fZhyCtGcO+SlYTuQrTrrWB2o2vnygfkex0RG7ZyZYLRq8o2SqI9Y1ezidpJ3v75uSxLSXisSxj1248aJqXZRokXhERAVTx0dpBdeetcIAN8kVmBe4tWc8YeDPffpjarCdktAhvbX/KoRyZJOuIeucXA3i/ib+1O4Iy+XimQRtD0AwbaNqePzIZfuvvuAUWTTjG+PpEjjqgWc54qUuOiZDUju3KSoG9nK0Q06rHfnONeQDyB21uOt0f+Nfzx4I44sinKKm8n3VcIk9USfQffAlAf/IaT7ceqonIU9ovjmWc30NwD7PNPAmgi6wgNDZoOLb9iKB1tsgT9R6gJOEmCZhACf7NnIN0ktyBmV4Jm34BZ335eCsnxS5ZI3JzRZmKTHHbOi1FmhLUA+52otLZYSRoOFSin31DGDQfj59xtku0l8P8z2L5NINGKgAFMUNBg8snRDQtw3l75eyNG"
`endif