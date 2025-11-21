	component master_tod_subsys is
		port (
			master_tod_top_0_csr_write                                : in  std_logic                     := 'X';             -- write
			master_tod_top_0_csr_writedata                            : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			master_tod_top_0_csr_read                                 : in  std_logic                     := 'X';             -- read
			master_tod_top_0_csr_readdata                             : out std_logic_vector(31 downto 0);                    -- readdata
			master_tod_top_0_csr_waitrequest                          : out std_logic;                                        -- waitrequest
			master_tod_top_0_csr_address                              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- address
			master_tod_top_0_i_clk_tod_clk                            : in  std_logic                     := 'X';             -- clk
			master_tod_top_0_i_reconfig_rst_n_reset_n                 : in  std_logic                     := 'X';             -- reset_n
			master_tod_top_0_i_tod_rst_n_reset_n                      : in  std_logic                     := 'X';             -- reset_n
			master_tod_top_0_pulse_per_second_pps                     : out std_logic;                                        -- pps
			master_tod_top_0_avst_tod_data_valid                      : out std_logic;                                        -- valid
			master_tod_top_0_avst_tod_data_data                       : out std_logic_vector(95 downto 0);                    -- data
			master_tod_top_0_i_upstr_pll_lock                         : in  std_logic                     := 'X';             -- lock
			mtod_subsys_clk100_in_clk_clk                             : in  std_logic                     := 'X';             -- clk
			mtod_subsys_pps_load_tod_0_period_clock_clk               : in  std_logic                     := 'X';             -- clk
			mtod_subsys_pps_load_tod_0_reset_reset                    : in  std_logic                     := 'X';             -- reset
			mtod_subsys_pps_load_tod_0_csr_reset_reset                : in  std_logic                     := 'X';             -- reset
			mtod_subsys_pps_load_tod_0_csr_readdata                   : out std_logic_vector(31 downto 0);                    -- readdata
			mtod_subsys_pps_load_tod_0_csr_write                      : in  std_logic                     := 'X';             -- write
			mtod_subsys_pps_load_tod_0_csr_read                       : in  std_logic                     := 'X';             -- read
			mtod_subsys_pps_load_tod_0_csr_writedata                  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			mtod_subsys_pps_load_tod_0_csr_waitrequest                : out std_logic;                                        -- waitrequest
			mtod_subsys_pps_load_tod_0_csr_address                    : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- address
			mtod_subsys_pps_load_tod_0_pps_interface_pulse_per_second : in  std_logic                     := 'X';             -- pulse_per_second
			mtod_subsys_pps_load_tod_0_time_of_day_96b_data           : in  std_logic_vector(95 downto 0) := (others => 'X'); -- data
			mtod_subsys_pps_load_tod_0_pps_irq_irq                    : out std_logic;                                        -- irq
			mtod_subsys_rstn_in_reset_reset_n                         : in  std_logic                     := 'X'              -- reset_n
		);
	end component master_tod_subsys;

	u0 : component master_tod_subsys
		port map (
			master_tod_top_0_csr_write                                => CONNECTED_TO_master_tod_top_0_csr_write,                                --                       master_tod_top_0_csr.write
			master_tod_top_0_csr_writedata                            => CONNECTED_TO_master_tod_top_0_csr_writedata,                            --                                           .writedata
			master_tod_top_0_csr_read                                 => CONNECTED_TO_master_tod_top_0_csr_read,                                 --                                           .read
			master_tod_top_0_csr_readdata                             => CONNECTED_TO_master_tod_top_0_csr_readdata,                             --                                           .readdata
			master_tod_top_0_csr_waitrequest                          => CONNECTED_TO_master_tod_top_0_csr_waitrequest,                          --                                           .waitrequest
			master_tod_top_0_csr_address                              => CONNECTED_TO_master_tod_top_0_csr_address,                              --                                           .address
			master_tod_top_0_i_clk_tod_clk                            => CONNECTED_TO_master_tod_top_0_i_clk_tod_clk,                            --                 master_tod_top_0_i_clk_tod.clk
			master_tod_top_0_i_reconfig_rst_n_reset_n                 => CONNECTED_TO_master_tod_top_0_i_reconfig_rst_n_reset_n,                 --          master_tod_top_0_i_reconfig_rst_n.reset_n
			master_tod_top_0_i_tod_rst_n_reset_n                      => CONNECTED_TO_master_tod_top_0_i_tod_rst_n_reset_n,                      --               master_tod_top_0_i_tod_rst_n.reset_n
			master_tod_top_0_pulse_per_second_pps                     => CONNECTED_TO_master_tod_top_0_pulse_per_second_pps,                     --          master_tod_top_0_pulse_per_second.pps
			master_tod_top_0_avst_tod_data_valid                      => CONNECTED_TO_master_tod_top_0_avst_tod_data_valid,                      --             master_tod_top_0_avst_tod_data.valid
			master_tod_top_0_avst_tod_data_data                       => CONNECTED_TO_master_tod_top_0_avst_tod_data_data,                       --                                           .data
			master_tod_top_0_i_upstr_pll_lock                         => CONNECTED_TO_master_tod_top_0_i_upstr_pll_lock,                         --               master_tod_top_0_i_upstr_pll.lock
			mtod_subsys_clk100_in_clk_clk                             => CONNECTED_TO_mtod_subsys_clk100_in_clk_clk,                             --                  mtod_subsys_clk100_in_clk.clk
			mtod_subsys_pps_load_tod_0_period_clock_clk               => CONNECTED_TO_mtod_subsys_pps_load_tod_0_period_clock_clk,               --    mtod_subsys_pps_load_tod_0_period_clock.clk
			mtod_subsys_pps_load_tod_0_reset_reset                    => CONNECTED_TO_mtod_subsys_pps_load_tod_0_reset_reset,                    --           mtod_subsys_pps_load_tod_0_reset.reset
			mtod_subsys_pps_load_tod_0_csr_reset_reset                => CONNECTED_TO_mtod_subsys_pps_load_tod_0_csr_reset_reset,                --       mtod_subsys_pps_load_tod_0_csr_reset.reset
			mtod_subsys_pps_load_tod_0_csr_readdata                   => CONNECTED_TO_mtod_subsys_pps_load_tod_0_csr_readdata,                   --             mtod_subsys_pps_load_tod_0_csr.readdata
			mtod_subsys_pps_load_tod_0_csr_write                      => CONNECTED_TO_mtod_subsys_pps_load_tod_0_csr_write,                      --                                           .write
			mtod_subsys_pps_load_tod_0_csr_read                       => CONNECTED_TO_mtod_subsys_pps_load_tod_0_csr_read,                       --                                           .read
			mtod_subsys_pps_load_tod_0_csr_writedata                  => CONNECTED_TO_mtod_subsys_pps_load_tod_0_csr_writedata,                  --                                           .writedata
			mtod_subsys_pps_load_tod_0_csr_waitrequest                => CONNECTED_TO_mtod_subsys_pps_load_tod_0_csr_waitrequest,                --                                           .waitrequest
			mtod_subsys_pps_load_tod_0_csr_address                    => CONNECTED_TO_mtod_subsys_pps_load_tod_0_csr_address,                    --                                           .address
			mtod_subsys_pps_load_tod_0_pps_interface_pulse_per_second => CONNECTED_TO_mtod_subsys_pps_load_tod_0_pps_interface_pulse_per_second, --   mtod_subsys_pps_load_tod_0_pps_interface.pulse_per_second
			mtod_subsys_pps_load_tod_0_time_of_day_96b_data           => CONNECTED_TO_mtod_subsys_pps_load_tod_0_time_of_day_96b_data,           -- mtod_subsys_pps_load_tod_0_time_of_day_96b.data
			mtod_subsys_pps_load_tod_0_pps_irq_irq                    => CONNECTED_TO_mtod_subsys_pps_load_tod_0_pps_irq_irq,                    --         mtod_subsys_pps_load_tod_0_pps_irq.irq
			mtod_subsys_rstn_in_reset_reset_n                         => CONNECTED_TO_mtod_subsys_rstn_in_reset_reset_n                          --                  mtod_subsys_rstn_in_reset.reset_n
		);

