	component sys_manager is
		port (
			clk_100_in_clk_clk                               : in  std_logic                     := 'X'; -- clk
			clk_100_out_clk_clk                              : out std_logic;                            -- clk
			dma_subsys_port0_rx_dma_resetn_clk_clk           : in  std_logic                     := 'X'; -- clk
			dma_subsys_port0_rx_dma_resetn_in_reset_reset_n  : in  std_logic                     := 'X'; -- reset_n
			dma_subsys_port0_rx_dma_resetn_out_reset_reset_n : out std_logic;                            -- reset_n
			dma_subsys_port1_rx_dma_resetn_clk_clk           : in  std_logic                     := 'X'; -- clk
			dma_subsys_port1_rx_dma_resetn_in_reset_reset_n  : in  std_logic                     := 'X'; -- reset_n
			dma_subsys_port1_rx_dma_resetn_out_reset_reset_n : out std_logic;                            -- reset_n
			ftile_iopll_ptp_sampling_refclk_clk              : in  std_logic                     := 'X'; -- clk
			ftile_iopll_ptp_sampling_reset_reset             : in  std_logic                     := 'X'; -- reset
			ftile_iopll_ptp_sampling_outclk0_clk             : out std_logic;                            -- clk
			ftile_iopll_todsync_sampling_refclk_clk          : in  std_logic                     := 'X'; -- clk
			ftile_iopll_todsync_sampling_locked_lock         : out std_logic;                            -- lock
			ftile_iopll_todsync_sampling_reset_reset         : in  std_logic                     := 'X'; -- reset
			ftile_iopll_todsync_sampling_outclk0_clk         : out std_logic;                            -- clk
			qsys_top_master_todclk_0_in_clk_clk              : in  std_logic                     := 'X'; -- clk
			qsys_top_master_todclk_0_out_clk_clk             : out std_logic;                            -- clk
			rst_in_clk_clk                                   : in  std_logic                     := 'X'; -- clk
			rst_in_in_reset_reset_n                          : in  std_logic                     := 'X'; -- reset_n
			rst_in_out_reset_reset_n                         : out std_logic;                            -- reset_n
			sysid_clk_clk                                    : in  std_logic                     := 'X'; -- clk
			sysid_reset_reset_n                              : in  std_logic                     := 'X'; -- reset_n
			sysid_control_slave_readdata                     : out std_logic_vector(31 downto 0);        -- readdata
			sysid_control_slave_address                      : in  std_logic                     := 'X'; -- address
			user_rst_clkgate_0_ninit_done_ninit_done         : out std_logic                             -- ninit_done
		);
	end component sys_manager;

	u0 : component sys_manager
		port map (
			clk_100_in_clk_clk                               => CONNECTED_TO_clk_100_in_clk_clk,                               --                           clk_100_in_clk.clk
			clk_100_out_clk_clk                              => CONNECTED_TO_clk_100_out_clk_clk,                              --                          clk_100_out_clk.clk
			dma_subsys_port0_rx_dma_resetn_clk_clk           => CONNECTED_TO_dma_subsys_port0_rx_dma_resetn_clk_clk,           --       dma_subsys_port0_rx_dma_resetn_clk.clk
			dma_subsys_port0_rx_dma_resetn_in_reset_reset_n  => CONNECTED_TO_dma_subsys_port0_rx_dma_resetn_in_reset_reset_n,  --  dma_subsys_port0_rx_dma_resetn_in_reset.reset_n
			dma_subsys_port0_rx_dma_resetn_out_reset_reset_n => CONNECTED_TO_dma_subsys_port0_rx_dma_resetn_out_reset_reset_n, -- dma_subsys_port0_rx_dma_resetn_out_reset.reset_n
			dma_subsys_port1_rx_dma_resetn_clk_clk           => CONNECTED_TO_dma_subsys_port1_rx_dma_resetn_clk_clk,           --       dma_subsys_port1_rx_dma_resetn_clk.clk
			dma_subsys_port1_rx_dma_resetn_in_reset_reset_n  => CONNECTED_TO_dma_subsys_port1_rx_dma_resetn_in_reset_reset_n,  --  dma_subsys_port1_rx_dma_resetn_in_reset.reset_n
			dma_subsys_port1_rx_dma_resetn_out_reset_reset_n => CONNECTED_TO_dma_subsys_port1_rx_dma_resetn_out_reset_reset_n, -- dma_subsys_port1_rx_dma_resetn_out_reset.reset_n
			ftile_iopll_ptp_sampling_refclk_clk              => CONNECTED_TO_ftile_iopll_ptp_sampling_refclk_clk,              --          ftile_iopll_ptp_sampling_refclk.clk
			ftile_iopll_ptp_sampling_reset_reset             => CONNECTED_TO_ftile_iopll_ptp_sampling_reset_reset,             --           ftile_iopll_ptp_sampling_reset.reset
			ftile_iopll_ptp_sampling_outclk0_clk             => CONNECTED_TO_ftile_iopll_ptp_sampling_outclk0_clk,             --         ftile_iopll_ptp_sampling_outclk0.clk
			ftile_iopll_todsync_sampling_refclk_clk          => CONNECTED_TO_ftile_iopll_todsync_sampling_refclk_clk,          --      ftile_iopll_todsync_sampling_refclk.clk
			ftile_iopll_todsync_sampling_locked_lock         => CONNECTED_TO_ftile_iopll_todsync_sampling_locked_lock,         --      ftile_iopll_todsync_sampling_locked.lock
			ftile_iopll_todsync_sampling_reset_reset         => CONNECTED_TO_ftile_iopll_todsync_sampling_reset_reset,         --       ftile_iopll_todsync_sampling_reset.reset
			ftile_iopll_todsync_sampling_outclk0_clk         => CONNECTED_TO_ftile_iopll_todsync_sampling_outclk0_clk,         --     ftile_iopll_todsync_sampling_outclk0.clk
			qsys_top_master_todclk_0_in_clk_clk              => CONNECTED_TO_qsys_top_master_todclk_0_in_clk_clk,              --          qsys_top_master_todclk_0_in_clk.clk
			qsys_top_master_todclk_0_out_clk_clk             => CONNECTED_TO_qsys_top_master_todclk_0_out_clk_clk,             --         qsys_top_master_todclk_0_out_clk.clk
			rst_in_clk_clk                                   => CONNECTED_TO_rst_in_clk_clk,                                   --                               rst_in_clk.clk
			rst_in_in_reset_reset_n                          => CONNECTED_TO_rst_in_in_reset_reset_n,                          --                          rst_in_in_reset.reset_n
			rst_in_out_reset_reset_n                         => CONNECTED_TO_rst_in_out_reset_reset_n,                         --                         rst_in_out_reset.reset_n
			sysid_clk_clk                                    => CONNECTED_TO_sysid_clk_clk,                                    --                                sysid_clk.clk
			sysid_reset_reset_n                              => CONNECTED_TO_sysid_reset_reset_n,                              --                              sysid_reset.reset_n
			sysid_control_slave_readdata                     => CONNECTED_TO_sysid_control_slave_readdata,                     --                      sysid_control_slave.readdata
			sysid_control_slave_address                      => CONNECTED_TO_sysid_control_slave_address,                      --                                         .address
			user_rst_clkgate_0_ninit_done_ninit_done         => CONNECTED_TO_user_rst_clkgate_0_ninit_done_ninit_done          --            user_rst_clkgate_0_ninit_done.ninit_done
		);

