	component dma_subsystem is
		port (
			acp_bridge_in_clk_clk                                                        : out std_logic;                                         -- clk
			dma_clk_100_in_clk_clk                                                       : in  std_logic                      := 'X';             -- clk
			dma_clk_out_bridge_0_out_clk_clk                                             : out std_logic;                                         -- clk
			dma_rst_100_in_reset_reset                                                   : in  std_logic                      := 'X';             -- reset
			dma_ss_master_m0_waitrequest                                                 : in  std_logic                      := 'X';             -- waitrequest
			dma_ss_master_m0_readdata                                                    : in  std_logic_vector(511 downto 0) := (others => 'X'); -- readdata
			dma_ss_master_m0_readdatavalid                                               : in  std_logic                      := 'X';             -- readdatavalid
			dma_ss_master_m0_response                                                    : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- response
			dma_ss_master_m0_burstcount                                                  : out std_logic_vector(4 downto 0);                      -- burstcount
			dma_ss_master_m0_writedata                                                   : out std_logic_vector(511 downto 0);                    -- writedata
			dma_ss_master_m0_address                                                     : out std_logic_vector(36 downto 0);                     -- address
			dma_ss_master_m0_write                                                       : out std_logic;                                         -- write
			dma_ss_master_m0_read                                                        : out std_logic;                                         -- read
			dma_ss_master_m0_byteenable                                                  : out std_logic_vector(63 downto 0);                     -- byteenable
			dma_ss_master_m0_debugaccess                                                 : out std_logic;                                         -- debugaccess
			dma_ss_master_m0_writeresponsevalid                                          : in  std_logic                      := 'X';             -- writeresponsevalid
			ext_hps_m_master_windowed_slave_address                                      : in  std_logic_vector(29 downto 0)  := (others => 'X'); -- address
			ext_hps_m_master_windowed_slave_read                                         : in  std_logic                      := 'X';             -- read
			ext_hps_m_master_windowed_slave_readdata                                     : out std_logic_vector(31 downto 0);                     -- readdata
			ext_hps_m_master_windowed_slave_write                                        : in  std_logic                      := 'X';             -- write
			ext_hps_m_master_windowed_slave_writedata                                    : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			ext_hps_m_master_windowed_slave_readdatavalid                                : out std_logic;                                         -- readdatavalid
			ext_hps_m_master_windowed_slave_waitrequest                                  : out std_logic;                                         -- waitrequest
			ext_hps_m_master_windowed_slave_byteenable                                   : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			ext_hps_m_master_windowed_slave_burstcount                                   : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			ext_hps_m_master_expanded_master_address                                     : out std_logic_vector(36 downto 0);                     -- address
			ext_hps_m_master_expanded_master_read                                        : out std_logic;                                         -- read
			ext_hps_m_master_expanded_master_waitrequest                                 : in  std_logic                      := 'X';             -- waitrequest
			ext_hps_m_master_expanded_master_readdata                                    : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- readdata
			ext_hps_m_master_expanded_master_write                                       : out std_logic;                                         -- write
			ext_hps_m_master_expanded_master_writedata                                   : out std_logic_vector(31 downto 0);                     -- writedata
			ext_hps_m_master_expanded_master_readdatavalid                               : in  std_logic                      := 'X';             -- readdatavalid
			ext_hps_m_master_expanded_master_byteenable                                  : out std_logic_vector(3 downto 0);                      -- byteenable
			ext_hps_m_master_expanded_master_burstcount                                  : out std_logic_vector(0 downto 0);                      -- burstcount
			oclk_pll_port8_in_clk_clk                                                    : in  std_logic                      := 'X';             -- clk
			rx_dma_reset_bridge_0_in_reset_reset_n                                       : in  std_logic                      := 'X';             -- reset_n
			rx_dma_reset_bridge_1_in_reset_reset_n                                       : in  std_logic                      := 'X';             -- reset_n
			subsys_ftile_25gbe_1588_dmaclkout_reset_out_reset_reset_n                    : out std_logic;                                         -- reset_n
			ninit_done_reset                                                             : in  std_logic                      := 'X';             -- reset
			dma_subsys_port8_csr_waitrequest                                             : out std_logic;                                         -- waitrequest
			dma_subsys_port8_csr_readdata                                                : out std_logic_vector(31 downto 0);                     -- readdata
			dma_subsys_port8_csr_readdatavalid                                           : out std_logic;                                         -- readdatavalid
			dma_subsys_port8_csr_burstcount                                              : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			dma_subsys_port8_csr_writedata                                               : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			dma_subsys_port8_csr_address                                                 : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- address
			dma_subsys_port8_csr_write                                                   : in  std_logic                      := 'X';             -- write
			dma_subsys_port8_csr_read                                                    : in  std_logic                      := 'X';             -- read
			dma_subsys_port8_csr_byteenable                                              : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			dma_subsys_port8_csr_debugaccess                                             : in  std_logic                      := 'X';             -- debugaccess
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_startofpacket                  : in  std_logic                      := 'X';             -- startofpacket
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_valid                          : in  std_logic                      := 'X';             -- valid
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_endofpacket                    : in  std_logic                      := 'X';             -- endofpacket
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_data                           : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- data
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_empty                          : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- empty
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_error                          : in  std_logic_vector(5 downto 0)   := (others => 'X'); -- error
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_valid            : in  std_logic                      := 'X';             -- valid
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_data             : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- data
			dma_subsys_port8_rx_dma_ch1_irq_irq                                          : out std_logic;                                         -- irq
			dma_subsys_port8_ts_chs_compl_0_clk_bus_in_clk                               : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- clk
			dma_subsys_port8_ts_chs_compl_0_rst_bus_in_reset                             : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- reset
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_valid            : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- valid
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_fingerprint      : in  std_logic_vector(19 downto 0)  := (others => 'X'); -- fingerprint
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_data             : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- data
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_ready           : in  std_logic                      := 'X';             -- ready
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_startofpacket   : out std_logic;                                         -- startofpacket
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_valid           : out std_logic;                                         -- valid
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_endofpacket     : out std_logic;                                         -- endofpacket
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_data            : out std_logic_vector(63 downto 0);                     -- data
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_empty           : out std_logic_vector(2 downto 0);                      -- empty
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_error           : out std_logic_vector(0 downto 0);                      -- error
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_valid       : out std_logic;                                         -- valid
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_fingerprint : out std_logic_vector(19 downto 0);                     -- fingerprint
			dma_subsys_port8_tx_dma_ch1_irq_irq                                          : out std_logic                                          -- irq
		);
	end component dma_subsystem;

	u0 : component dma_subsystem
		port map (
			acp_bridge_in_clk_clk                                                        => CONNECTED_TO_acp_bridge_in_clk_clk,                                                        --                                                acp_bridge_in_clk.clk
			dma_clk_100_in_clk_clk                                                       => CONNECTED_TO_dma_clk_100_in_clk_clk,                                                       --                                               dma_clk_100_in_clk.clk
			dma_clk_out_bridge_0_out_clk_clk                                             => CONNECTED_TO_dma_clk_out_bridge_0_out_clk_clk,                                             --                                     dma_clk_out_bridge_0_out_clk.clk
			dma_rst_100_in_reset_reset                                                   => CONNECTED_TO_dma_rst_100_in_reset_reset,                                                   --                                             dma_rst_100_in_reset.reset
			dma_ss_master_m0_waitrequest                                                 => CONNECTED_TO_dma_ss_master_m0_waitrequest,                                                 --                                                 dma_ss_master_m0.waitrequest
			dma_ss_master_m0_readdata                                                    => CONNECTED_TO_dma_ss_master_m0_readdata,                                                    --                                                                 .readdata
			dma_ss_master_m0_readdatavalid                                               => CONNECTED_TO_dma_ss_master_m0_readdatavalid,                                               --                                                                 .readdatavalid
			dma_ss_master_m0_response                                                    => CONNECTED_TO_dma_ss_master_m0_response,                                                    --                                                                 .response
			dma_ss_master_m0_burstcount                                                  => CONNECTED_TO_dma_ss_master_m0_burstcount,                                                  --                                                                 .burstcount
			dma_ss_master_m0_writedata                                                   => CONNECTED_TO_dma_ss_master_m0_writedata,                                                   --                                                                 .writedata
			dma_ss_master_m0_address                                                     => CONNECTED_TO_dma_ss_master_m0_address,                                                     --                                                                 .address
			dma_ss_master_m0_write                                                       => CONNECTED_TO_dma_ss_master_m0_write,                                                       --                                                                 .write
			dma_ss_master_m0_read                                                        => CONNECTED_TO_dma_ss_master_m0_read,                                                        --                                                                 .read
			dma_ss_master_m0_byteenable                                                  => CONNECTED_TO_dma_ss_master_m0_byteenable,                                                  --                                                                 .byteenable
			dma_ss_master_m0_debugaccess                                                 => CONNECTED_TO_dma_ss_master_m0_debugaccess,                                                 --                                                                 .debugaccess
			dma_ss_master_m0_writeresponsevalid                                          => CONNECTED_TO_dma_ss_master_m0_writeresponsevalid,                                          --                                                                 .writeresponsevalid
			ext_hps_m_master_windowed_slave_address                                      => CONNECTED_TO_ext_hps_m_master_windowed_slave_address,                                      --                                  ext_hps_m_master_windowed_slave.address
			ext_hps_m_master_windowed_slave_read                                         => CONNECTED_TO_ext_hps_m_master_windowed_slave_read,                                         --                                                                 .read
			ext_hps_m_master_windowed_slave_readdata                                     => CONNECTED_TO_ext_hps_m_master_windowed_slave_readdata,                                     --                                                                 .readdata
			ext_hps_m_master_windowed_slave_write                                        => CONNECTED_TO_ext_hps_m_master_windowed_slave_write,                                        --                                                                 .write
			ext_hps_m_master_windowed_slave_writedata                                    => CONNECTED_TO_ext_hps_m_master_windowed_slave_writedata,                                    --                                                                 .writedata
			ext_hps_m_master_windowed_slave_readdatavalid                                => CONNECTED_TO_ext_hps_m_master_windowed_slave_readdatavalid,                                --                                                                 .readdatavalid
			ext_hps_m_master_windowed_slave_waitrequest                                  => CONNECTED_TO_ext_hps_m_master_windowed_slave_waitrequest,                                  --                                                                 .waitrequest
			ext_hps_m_master_windowed_slave_byteenable                                   => CONNECTED_TO_ext_hps_m_master_windowed_slave_byteenable,                                   --                                                                 .byteenable
			ext_hps_m_master_windowed_slave_burstcount                                   => CONNECTED_TO_ext_hps_m_master_windowed_slave_burstcount,                                   --                                                                 .burstcount
			ext_hps_m_master_expanded_master_address                                     => CONNECTED_TO_ext_hps_m_master_expanded_master_address,                                     --                                 ext_hps_m_master_expanded_master.address
			ext_hps_m_master_expanded_master_read                                        => CONNECTED_TO_ext_hps_m_master_expanded_master_read,                                        --                                                                 .read
			ext_hps_m_master_expanded_master_waitrequest                                 => CONNECTED_TO_ext_hps_m_master_expanded_master_waitrequest,                                 --                                                                 .waitrequest
			ext_hps_m_master_expanded_master_readdata                                    => CONNECTED_TO_ext_hps_m_master_expanded_master_readdata,                                    --                                                                 .readdata
			ext_hps_m_master_expanded_master_write                                       => CONNECTED_TO_ext_hps_m_master_expanded_master_write,                                       --                                                                 .write
			ext_hps_m_master_expanded_master_writedata                                   => CONNECTED_TO_ext_hps_m_master_expanded_master_writedata,                                   --                                                                 .writedata
			ext_hps_m_master_expanded_master_readdatavalid                               => CONNECTED_TO_ext_hps_m_master_expanded_master_readdatavalid,                               --                                                                 .readdatavalid
			ext_hps_m_master_expanded_master_byteenable                                  => CONNECTED_TO_ext_hps_m_master_expanded_master_byteenable,                                  --                                                                 .byteenable
			ext_hps_m_master_expanded_master_burstcount                                  => CONNECTED_TO_ext_hps_m_master_expanded_master_burstcount,                                  --                                                                 .burstcount
			oclk_pll_port8_in_clk_clk                                                    => CONNECTED_TO_oclk_pll_port8_in_clk_clk,                                                    --                                            oclk_pll_port8_in_clk.clk
			rx_dma_reset_bridge_0_in_reset_reset_n                                       => CONNECTED_TO_rx_dma_reset_bridge_0_in_reset_reset_n,                                       --                                   rx_dma_reset_bridge_0_in_reset.reset_n
			rx_dma_reset_bridge_1_in_reset_reset_n                                       => CONNECTED_TO_rx_dma_reset_bridge_1_in_reset_reset_n,                                       --                                   rx_dma_reset_bridge_1_in_reset.reset_n
			subsys_ftile_25gbe_1588_dmaclkout_reset_out_reset_reset_n                    => CONNECTED_TO_subsys_ftile_25gbe_1588_dmaclkout_reset_out_reset_reset_n,                    --                subsys_ftile_25gbe_1588_dmaclkout_reset_out_reset.reset_n
			ninit_done_reset                                                             => CONNECTED_TO_ninit_done_reset,                                                             --                                                       ninit_done.reset
			dma_subsys_port8_csr_waitrequest                                             => CONNECTED_TO_dma_subsys_port8_csr_waitrequest,                                             --                                             dma_subsys_port8_csr.waitrequest
			dma_subsys_port8_csr_readdata                                                => CONNECTED_TO_dma_subsys_port8_csr_readdata,                                                --                                                                 .readdata
			dma_subsys_port8_csr_readdatavalid                                           => CONNECTED_TO_dma_subsys_port8_csr_readdatavalid,                                           --                                                                 .readdatavalid
			dma_subsys_port8_csr_burstcount                                              => CONNECTED_TO_dma_subsys_port8_csr_burstcount,                                              --                                                                 .burstcount
			dma_subsys_port8_csr_writedata                                               => CONNECTED_TO_dma_subsys_port8_csr_writedata,                                               --                                                                 .writedata
			dma_subsys_port8_csr_address                                                 => CONNECTED_TO_dma_subsys_port8_csr_address,                                                 --                                                                 .address
			dma_subsys_port8_csr_write                                                   => CONNECTED_TO_dma_subsys_port8_csr_write,                                                   --                                                                 .write
			dma_subsys_port8_csr_read                                                    => CONNECTED_TO_dma_subsys_port8_csr_read,                                                    --                                                                 .read
			dma_subsys_port8_csr_byteenable                                              => CONNECTED_TO_dma_subsys_port8_csr_byteenable,                                              --                                                                 .byteenable
			dma_subsys_port8_csr_debugaccess                                             => CONNECTED_TO_dma_subsys_port8_csr_debugaccess,                                             --                                                                 .debugaccess
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_startofpacket                  => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_startofpacket,                  --                    dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin.startofpacket
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_valid                          => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_valid,                          --                                                                 .valid
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_endofpacket                    => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_endofpacket,                    --                                                                 .endofpacket
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_data                           => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_data,                           --                                                                 .data
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_empty                          => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_empty,                          --                                                                 .empty
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_error                          => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_error,                          --                                                                 .error
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_valid            => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_valid,            --      dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts.valid
			dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_data             => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_data,             --                                                                 .data
			dma_subsys_port8_rx_dma_ch1_irq_irq                                          => CONNECTED_TO_dma_subsys_port8_rx_dma_ch1_irq_irq,                                          --                                  dma_subsys_port8_rx_dma_ch1_irq.irq
			dma_subsys_port8_ts_chs_compl_0_clk_bus_in_clk                               => CONNECTED_TO_dma_subsys_port8_ts_chs_compl_0_clk_bus_in_clk,                               --                       dma_subsys_port8_ts_chs_compl_0_clk_bus_in.clk
			dma_subsys_port8_ts_chs_compl_0_rst_bus_in_reset                             => CONNECTED_TO_dma_subsys_port8_ts_chs_compl_0_rst_bus_in_reset,                             --                       dma_subsys_port8_ts_chs_compl_0_rst_bus_in.reset
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_valid            => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_valid,            --      dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts.valid
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_fingerprint      => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_fingerprint,      --                                                                 .fingerprint
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_data             => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_data,             --                                                                 .data
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_ready           => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_ready,           --     dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st.ready
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_startofpacket   => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_startofpacket,   --                                                                 .startofpacket
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_valid           => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_valid,           --                                                                 .valid
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_endofpacket     => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_endofpacket,     --                                                                 .endofpacket
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_data            => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_data,            --                                                                 .data
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_empty           => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_empty,           --                                                                 .empty
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_error           => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_error,           --                                                                 .error
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_valid       => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_valid,       -- dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req.valid
			dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_fingerprint => CONNECTED_TO_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_fingerprint, --                                                                 .fingerprint
			dma_subsys_port8_tx_dma_ch1_irq_irq                                          => CONNECTED_TO_dma_subsys_port8_tx_dma_ch1_irq_irq                                           --                                  dma_subsys_port8_tx_dma_ch1_irq.irq
		);

