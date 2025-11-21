	component clk_ss is
		port (
			clk_csr_in_clk_clk              : in  std_logic := 'X'; -- clk
			clk_csr_out_clk_clk             : out std_logic;        -- clk
			clk_dsp_in_clk_clk              : in  std_logic := 'X'; -- clk
			clk_dsp_out_clk_clk             : out std_logic;        -- clk
			clk_eth_in_clk_clk              : in  std_logic := 'X'; -- clk
			clk_eth_out_clk_clk             : out std_logic;        -- clk
			clk_ftile_402_in_clk_clk        : in  std_logic := 'X'; -- clk
			clk_ftile_402_out_clk_clk       : out std_logic;        -- clk
			clock_bridge_rec_rx_in_clk_clk  : in  std_logic := 'X'; -- clk
			clock_bridge_rec_rx_out_clk_clk : out std_logic;        -- clk
			ftile_in_clk_clk                : in  std_logic := 'X'; -- clk
			ftile_out_clk_clk               : out std_logic         -- clk
		);
	end component clk_ss;

	u0 : component clk_ss
		port map (
			clk_csr_in_clk_clk              => CONNECTED_TO_clk_csr_in_clk_clk,              --              clk_csr_in_clk.clk
			clk_csr_out_clk_clk             => CONNECTED_TO_clk_csr_out_clk_clk,             --             clk_csr_out_clk.clk
			clk_dsp_in_clk_clk              => CONNECTED_TO_clk_dsp_in_clk_clk,              --              clk_dsp_in_clk.clk
			clk_dsp_out_clk_clk             => CONNECTED_TO_clk_dsp_out_clk_clk,             --             clk_dsp_out_clk.clk
			clk_eth_in_clk_clk              => CONNECTED_TO_clk_eth_in_clk_clk,              --              clk_eth_in_clk.clk
			clk_eth_out_clk_clk             => CONNECTED_TO_clk_eth_out_clk_clk,             --             clk_eth_out_clk.clk
			clk_ftile_402_in_clk_clk        => CONNECTED_TO_clk_ftile_402_in_clk_clk,        --        clk_ftile_402_in_clk.clk
			clk_ftile_402_out_clk_clk       => CONNECTED_TO_clk_ftile_402_out_clk_clk,       --       clk_ftile_402_out_clk.clk
			clock_bridge_rec_rx_in_clk_clk  => CONNECTED_TO_clock_bridge_rec_rx_in_clk_clk,  --  clock_bridge_rec_rx_in_clk.clk
			clock_bridge_rec_rx_out_clk_clk => CONNECTED_TO_clock_bridge_rec_rx_out_clk_clk, -- clock_bridge_rec_rx_out_clk.clk
			ftile_in_clk_clk                => CONNECTED_TO_ftile_in_clk_clk,                --                ftile_in_clk.clk
			ftile_out_clk_clk               => CONNECTED_TO_ftile_out_clk_clk                --               ftile_out_clk.clk
		);

