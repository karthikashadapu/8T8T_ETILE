	component tod_subsys_tod_timestamp_96b_0 is
		port (
			clk_tod                          : in  std_logic                      := 'X';             -- clk
			rst_clk_tod_n                    : in  std_logic                      := 'X';             -- reset_n
			clk_100                          : in  std_logic                      := 'X';             -- clk
			system_reset_n                   : in  std_logic                      := 'X';             -- reset_n
			pps_in                           : in  std_logic                      := 'X';             -- pps_in
			irq_delay_pulse                  : out std_logic;                                         -- irq
			eth_tod_master_96b_tx            : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- data
			eth_tod_master_96b_tx_load_data  : out std_logic_vector(95 downto 0);                     -- data
			eth_tod_master_96b_tx_load_valid : out std_logic;                                         -- valid
			rfp_sync_pul                     : out std_logic;                                         -- data
			rfp_sync_pul_cpri                : out std_logic;                                         -- cpri_aux_rx_rfp_l1_cpri
			csr_address                      : in  std_logic_vector(4 downto 0)   := (others => 'X'); -- address
			csr_write                        : in  std_logic                      := 'X';             -- write
			csr_read                         : in  std_logic                      := 'X';             -- read
			csr_writedata                    : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			csr_readdata                     : out std_logic_vector(31 downto 0);                     -- readdata
			csr_waitrequest                  : out std_logic;                                         -- waitrequest
			csr_readdatavalid                : out std_logic;                                         -- readdatavalid
			ram_read                         : in  std_logic                      := 'X';             -- read
			ram_q                            : out std_logic_vector(127 downto 0);                    -- readdata
			rfp_sync_pul_dup                 : out std_logic                                          -- data
		);
	end component tod_subsys_tod_timestamp_96b_0;

	u0 : component tod_subsys_tod_timestamp_96b_0
		port map (
			clk_tod                          => CONNECTED_TO_clk_tod,                          --                    clk_tod.clk
			rst_clk_tod_n                    => CONNECTED_TO_rst_clk_tod_n,                    --              rst_clk_tod_n.reset_n
			clk_100                          => CONNECTED_TO_clk_100,                          --                    clk_100.clk
			system_reset_n                   => CONNECTED_TO_system_reset_n,                   --             system_reset_n.reset_n
			pps_in                           => CONNECTED_TO_pps_in,                           --                     pps_in.pps_in
			irq_delay_pulse                  => CONNECTED_TO_irq_delay_pulse,                  --            irq_delay_pulse.irq
			eth_tod_master_96b_tx            => CONNECTED_TO_eth_tod_master_96b_tx,            --      eth_tod_master_96b_tx.data
			eth_tod_master_96b_tx_load_data  => CONNECTED_TO_eth_tod_master_96b_tx_load_data,  -- eth_tod_master_96b_tx_load.data
			eth_tod_master_96b_tx_load_valid => CONNECTED_TO_eth_tod_master_96b_tx_load_valid, --                           .valid
			rfp_sync_pul                     => CONNECTED_TO_rfp_sync_pul,                     --               rfp_sync_pul.data
			rfp_sync_pul_cpri                => CONNECTED_TO_rfp_sync_pul_cpri,                --          rfp_sync_pul_cpri.cpri_aux_rx_rfp_l1_cpri
			csr_address                      => CONNECTED_TO_csr_address,                      --      tod_timestamp_96b_csr.address
			csr_write                        => CONNECTED_TO_csr_write,                        --                           .write
			csr_read                         => CONNECTED_TO_csr_read,                         --                           .read
			csr_writedata                    => CONNECTED_TO_csr_writedata,                    --                           .writedata
			csr_readdata                     => CONNECTED_TO_csr_readdata,                     --                           .readdata
			csr_waitrequest                  => CONNECTED_TO_csr_waitrequest,                  --                           .waitrequest
			csr_readdatavalid                => CONNECTED_TO_csr_readdatavalid,                --                           .readdatavalid
			ram_read                         => CONNECTED_TO_ram_read,                         --          tod_timestamp_mem.read
			ram_q                            => CONNECTED_TO_ram_q,                            --                           .readdata
			rfp_sync_pul_dup                 => CONNECTED_TO_rfp_sync_pul_dup                  --           rfp_sync_pul_dup.data
		);

