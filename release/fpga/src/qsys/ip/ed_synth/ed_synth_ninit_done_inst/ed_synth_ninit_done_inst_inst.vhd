	component ed_synth_ninit_done_inst is
		port (
			ninit_done : out std_logic   -- ninit_done
		);
	end component ed_synth_ninit_done_inst;

	u0 : component ed_synth_ninit_done_inst
		port map (
			ninit_done => CONNECTED_TO_ninit_done  -- ninit_done.ninit_done
		);

