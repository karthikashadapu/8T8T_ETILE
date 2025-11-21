	ram_48i_48o_36d_dc u0 (
		.data      (_connected_to_data_),      //   input,  width = 48,      data.datain
		.q         (_connected_to_q_),         //  output,  width = 48,         q.dataout
		.wraddress (_connected_to_wraddress_), //   input,   width = 6, wraddress.wraddress
		.rdaddress (_connected_to_rdaddress_), //   input,   width = 6, rdaddress.rdaddress
		.wren      (_connected_to_wren_),      //   input,   width = 1,      wren.wren
		.wrclock   (_connected_to_wrclock_),   //   input,   width = 1,   wrclock.clk
		.rdclock   (_connected_to_rdclock_),   //   input,   width = 1,   rdclock.clk
		.rden      (_connected_to_rden_),      //   input,   width = 1,      rden.rden
		.byteena_a (_connected_to_byteena_a_)  //   input,   width = 6, byteena_a.byte_enable_a
	);

