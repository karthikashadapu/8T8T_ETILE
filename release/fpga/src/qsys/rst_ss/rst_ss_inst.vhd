	component rst_ss is
		port (
			dsp_rst_cntrl_reset_in0_reset        : in  std_logic := 'X'; -- reset
			dsp_rst_cntrl_clk_clk                : in  std_logic := 'X'; -- clk
			dsp_rst_cntrl_reset_out_reset        : out std_logic;        -- reset
			ecpri_rst_cntrl_reset_in0_reset      : in  std_logic := 'X'; -- reset
			ecpri_rst_cntrl_clk_clk              : in  std_logic := 'X'; -- clk
			ecpri_rst_cntrl_reset_out_reset      : out std_logic;        -- reset
			eth_rst_cntrl_reset_in0_reset        : in  std_logic := 'X'; -- reset
			eth_rst_cntrl_clk_clk                : in  std_logic := 'X'; -- clk
			eth_rst_cntrl_reset_out_reset        : out std_logic;        -- reset
			reset_bridge_act_high_clk_clk        : in  std_logic := 'X'; -- clk
			reset_bridge_act_high_in_reset_reset : in  std_logic := 'X'; -- reset
			rst_csr_clk_clk                      : in  std_logic := 'X'; -- clk
			rst_csr_in_reset_reset_n             : in  std_logic := 'X'; -- reset_n
			rst_csr_out_reset_reset_n            : out std_logic;        -- reset_n
			reset_bridge_rec_rx_clk_clk          : in  std_logic := 'X'; -- clk
			reset_bridge_rec_rx_in_reset_reset   : in  std_logic := 'X'; -- reset
			reset_bridge_tx_div_clk_clk          : in  std_logic := 'X'; -- clk
			reset_bridge_tx_div_in_reset_reset   : in  std_logic := 'X'  -- reset
		);
	end component rst_ss;

	u0 : component rst_ss
		port map (
			dsp_rst_cntrl_reset_in0_reset        => CONNECTED_TO_dsp_rst_cntrl_reset_in0_reset,        --        dsp_rst_cntrl_reset_in0.reset
			dsp_rst_cntrl_clk_clk                => CONNECTED_TO_dsp_rst_cntrl_clk_clk,                --              dsp_rst_cntrl_clk.clk
			dsp_rst_cntrl_reset_out_reset        => CONNECTED_TO_dsp_rst_cntrl_reset_out_reset,        --        dsp_rst_cntrl_reset_out.reset
			ecpri_rst_cntrl_reset_in0_reset      => CONNECTED_TO_ecpri_rst_cntrl_reset_in0_reset,      --      ecpri_rst_cntrl_reset_in0.reset
			ecpri_rst_cntrl_clk_clk              => CONNECTED_TO_ecpri_rst_cntrl_clk_clk,              --            ecpri_rst_cntrl_clk.clk
			ecpri_rst_cntrl_reset_out_reset      => CONNECTED_TO_ecpri_rst_cntrl_reset_out_reset,      --      ecpri_rst_cntrl_reset_out.reset
			eth_rst_cntrl_reset_in0_reset        => CONNECTED_TO_eth_rst_cntrl_reset_in0_reset,        --        eth_rst_cntrl_reset_in0.reset
			eth_rst_cntrl_clk_clk                => CONNECTED_TO_eth_rst_cntrl_clk_clk,                --              eth_rst_cntrl_clk.clk
			eth_rst_cntrl_reset_out_reset        => CONNECTED_TO_eth_rst_cntrl_reset_out_reset,        --        eth_rst_cntrl_reset_out.reset
			reset_bridge_act_high_clk_clk        => CONNECTED_TO_reset_bridge_act_high_clk_clk,        --      reset_bridge_act_high_clk.clk
			reset_bridge_act_high_in_reset_reset => CONNECTED_TO_reset_bridge_act_high_in_reset_reset, -- reset_bridge_act_high_in_reset.reset
			rst_csr_clk_clk                      => CONNECTED_TO_rst_csr_clk_clk,                      --                    rst_csr_clk.clk
			rst_csr_in_reset_reset_n             => CONNECTED_TO_rst_csr_in_reset_reset_n,             --               rst_csr_in_reset.reset_n
			rst_csr_out_reset_reset_n            => CONNECTED_TO_rst_csr_out_reset_reset_n,            --              rst_csr_out_reset.reset_n
			reset_bridge_rec_rx_clk_clk          => CONNECTED_TO_reset_bridge_rec_rx_clk_clk,          --        reset_bridge_rec_rx_clk.clk
			reset_bridge_rec_rx_in_reset_reset   => CONNECTED_TO_reset_bridge_rec_rx_in_reset_reset,   --   reset_bridge_rec_rx_in_reset.reset
			reset_bridge_tx_div_clk_clk          => CONNECTED_TO_reset_bridge_tx_div_clk_clk,          --        reset_bridge_tx_div_clk.clk
			reset_bridge_tx_div_in_reset_reset   => CONNECTED_TO_reset_bridge_tx_div_in_reset_reset    --   reset_bridge_tx_div_in_reset.reset
		);

