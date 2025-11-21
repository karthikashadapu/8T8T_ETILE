	component tod_subsys is
		port (
			cdc_pipeline_0_dst_clk_clk                                          : in  std_logic                     := 'X';             -- clk
			cdc_pipeline_0_rst_dst_clk_n_reset_n                                : in  std_logic                     := 'X';             -- reset_n
			cdc_pipeline_0_dataout_data                                         : out std_logic_vector(95 downto 0);                    -- data
			clock_bridge_100_in_clk_clk                                         : in  std_logic                     := 'X';             -- clk
			clock_bridge_156_in_clk_clk                                         : in  std_logic                     := 'X';             -- clk
			reset_bridge_100_in_reset_reset_n                                   : in  std_logic                     := 'X';             -- reset_n
			reset_bridge_156_in_reset_reset                                     : in  std_logic                     := 'X';             -- reset
			tod_sync_interface_adapter_0_0_tx2_tod_master_data_data             : out std_logic_vector(95 downto 0);                    -- data
			tod_timestamp_96b_0_pps_in_pps_in                                   : in  std_logic                     := 'X';             -- pps_in
			tod_timestamp_96b_0_rfp_sync_pul_data                               : out std_logic;                                        -- data
			tod_timestamp_96b_0_tod_timestamp_96b_csr_address                   : in  std_logic_vector(4 downto 0)  := (others => 'X'); -- address
			tod_timestamp_96b_0_tod_timestamp_96b_csr_write                     : in  std_logic                     := 'X';             -- write
			tod_timestamp_96b_0_tod_timestamp_96b_csr_read                      : in  std_logic                     := 'X';             -- read
			tod_timestamp_96b_0_tod_timestamp_96b_csr_writedata                 : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			tod_timestamp_96b_0_tod_timestamp_96b_csr_readdata                  : out std_logic_vector(31 downto 0);                    -- readdata
			tod_timestamp_96b_0_tod_timestamp_96b_csr_waitrequest               : out std_logic;                                        -- waitrequest
			tod_timestamp_96b_0_tod_timestamp_96b_csr_readdatavalid             : out std_logic;                                        -- readdatavalid
			tod_timestamp_96b_0_rfp_sync_pul_dup_data                           : out std_logic;                                        -- data
			master_tod_top_0_csr_write                                          : in  std_logic                     := 'X';             -- write
			master_tod_top_0_csr_writedata                                      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			master_tod_top_0_csr_read                                           : in  std_logic                     := 'X';             -- read
			master_tod_top_0_csr_readdata                                       : out std_logic_vector(31 downto 0);                    -- readdata
			master_tod_top_0_csr_waitrequest                                    : out std_logic;                                        -- waitrequest
			master_tod_top_0_csr_address                                        : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- address
			master_tod_top_0_i_reconfig_rst_n_reset_n                           : in  std_logic                     := 'X';             -- reset_n
			master_tod_top_0_pulse_per_second_pps                               : out std_logic;                                        -- pps
			mtod_subsys_master_tod_top_0_i_upstr_pll_lock                       : in  std_logic                     := 'X';             -- lock
			mtod_subsys_clk100_in_clk_clk                                       : in  std_logic                     := 'X';             -- clk
			mtod_subsys_pps_load_tod_0_period_clock_clk                         : in  std_logic                     := 'X';             -- clk
			mtod_subsys_pps_load_tod_0_reset_reset                              : in  std_logic                     := 'X';             -- reset
			mtod_subsys_pps_load_tod_0_csr_reset_reset                          : in  std_logic                     := 'X';             -- reset
			mtod_subsys_pps_load_tod_0_csr_readdata                             : out std_logic_vector(31 downto 0);                    -- readdata
			mtod_subsys_pps_load_tod_0_csr_write                                : in  std_logic                     := 'X';             -- write
			mtod_subsys_pps_load_tod_0_csr_read                                 : in  std_logic                     := 'X';             -- read
			mtod_subsys_pps_load_tod_0_csr_writedata                            : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			mtod_subsys_pps_load_tod_0_csr_waitrequest                          : out std_logic;                                        -- waitrequest
			mtod_subsys_pps_load_tod_0_csr_address                              : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- address
			mtod_subsys_pps_in_pulse_per_second                                 : in  std_logic                     := 'X';             -- pulse_per_second
			master_tod_subsys_0_mtod_subsys_pps_load_tod_0_time_of_day_96b_data : in  std_logic_vector(95 downto 0) := (others => 'X'); -- data
			mtod_subsys_pps_load_tod_0_pps_irq_irq                              : out std_logic;                                        -- irq
			mtod_subsys_rstn_in_reset_reset_n                                   : in  std_logic                     := 'X';             -- reset_n
			tod_slave_sub_system_0_master_tod_split_conduit_end_10_data         : out std_logic_vector(95 downto 0);                    -- data
			tod_slave_sub_system_0_master_tod_split_conduit_end_10_valid        : out std_logic;                                        -- valid
			tod_slave_oran_tod_stack_tx_clk_clk                                 : in  std_logic                     := 'X';             -- clk
			tod_slave_oran_tod_stack_rx_clk_clk                                 : in  std_logic                     := 'X';             -- clk
			tod_slave_oran_tod_stack_todsync_sample_clk_clk                     : in  std_logic                     := 'X';             -- clk
			tx_oran_tod_time_of_day_96b_tdata                                   : out std_logic_vector(95 downto 0);                    -- tdata
			tx_oran_tod_time_of_day_96b_tvalid                                  : out std_logic;                                        -- tvalid
			rx_oran_tod_time_of_day_96b_tdata                                   : out std_logic_vector(95 downto 0);                    -- tdata
			rx_oran_tod_time_of_day_96b_tvalid                                  : out std_logic;                                        -- tvalid
			tod_slave_port_8_tod_stack_tx_clk_clk                               : in  std_logic                     := 'X';             -- clk
			tod_slave_port_8_tod_stack_rx_clk_clk                               : in  std_logic                     := 'X';             -- clk
			tod_slave_port_8_tod_stack_todsync_sample_clk_clk                   : in  std_logic                     := 'X';             -- clk
			tod_slave_port_8_tod_stack_tx_tod_interface_tdata                   : out std_logic_vector(95 downto 0);                    -- tdata
			tod_slave_port_8_tod_stack_tx_tod_interface_tvalid                  : out std_logic;                                        -- tvalid
			tod_slave_port_8_tod_stack_rx_tod_interface_tdata                   : out std_logic_vector(95 downto 0);                    -- tdata
			tod_slave_port_8_tod_stack_rx_tod_interface_tvalid                  : out std_logic;                                        -- tvalid
			tod_slave_subsys_port_8_tod_stack_tx_pll_locked_lock                : in  std_logic                     := 'X';             -- lock
			tod_slave_tod_subsys_clk_100_in_clk_clk                             : in  std_logic                     := 'X';             -- clk
			tod_slave_tod_subsys_mtod_clk_in_clk_clk                            : in  std_logic                     := 'X';             -- clk
			tod_slave_tod_subsys_rst_100_in_reset_reset_n                       : in  std_logic                     := 'X';             -- reset_n
			tod_slave_todsync_sample_plllock_split_conduit_end_lock             : in  std_logic_vector(0 downto 0)  := (others => 'X')  -- lock
		);
	end component tod_subsys;

	u0 : component tod_subsys
		port map (
			cdc_pipeline_0_dst_clk_clk                                          => CONNECTED_TO_cdc_pipeline_0_dst_clk_clk,                                          --                                         cdc_pipeline_0_dst_clk.clk
			cdc_pipeline_0_rst_dst_clk_n_reset_n                                => CONNECTED_TO_cdc_pipeline_0_rst_dst_clk_n_reset_n,                                --                                   cdc_pipeline_0_rst_dst_clk_n.reset_n
			cdc_pipeline_0_dataout_data                                         => CONNECTED_TO_cdc_pipeline_0_dataout_data,                                         --                                         cdc_pipeline_0_dataout.data
			clock_bridge_100_in_clk_clk                                         => CONNECTED_TO_clock_bridge_100_in_clk_clk,                                         --                                        clock_bridge_100_in_clk.clk
			clock_bridge_156_in_clk_clk                                         => CONNECTED_TO_clock_bridge_156_in_clk_clk,                                         --                                        clock_bridge_156_in_clk.clk
			reset_bridge_100_in_reset_reset_n                                   => CONNECTED_TO_reset_bridge_100_in_reset_reset_n,                                   --                                      reset_bridge_100_in_reset.reset_n
			reset_bridge_156_in_reset_reset                                     => CONNECTED_TO_reset_bridge_156_in_reset_reset,                                     --                                      reset_bridge_156_in_reset.reset
			tod_sync_interface_adapter_0_0_tx2_tod_master_data_data             => CONNECTED_TO_tod_sync_interface_adapter_0_0_tx2_tod_master_data_data,             --             tod_sync_interface_adapter_0_0_tx2_tod_master_data.data
			tod_timestamp_96b_0_pps_in_pps_in                                   => CONNECTED_TO_tod_timestamp_96b_0_pps_in_pps_in,                                   --                                     tod_timestamp_96b_0_pps_in.pps_in
			tod_timestamp_96b_0_rfp_sync_pul_data                               => CONNECTED_TO_tod_timestamp_96b_0_rfp_sync_pul_data,                               --                               tod_timestamp_96b_0_rfp_sync_pul.data
			tod_timestamp_96b_0_tod_timestamp_96b_csr_address                   => CONNECTED_TO_tod_timestamp_96b_0_tod_timestamp_96b_csr_address,                   --                      tod_timestamp_96b_0_tod_timestamp_96b_csr.address
			tod_timestamp_96b_0_tod_timestamp_96b_csr_write                     => CONNECTED_TO_tod_timestamp_96b_0_tod_timestamp_96b_csr_write,                     --                                                               .write
			tod_timestamp_96b_0_tod_timestamp_96b_csr_read                      => CONNECTED_TO_tod_timestamp_96b_0_tod_timestamp_96b_csr_read,                      --                                                               .read
			tod_timestamp_96b_0_tod_timestamp_96b_csr_writedata                 => CONNECTED_TO_tod_timestamp_96b_0_tod_timestamp_96b_csr_writedata,                 --                                                               .writedata
			tod_timestamp_96b_0_tod_timestamp_96b_csr_readdata                  => CONNECTED_TO_tod_timestamp_96b_0_tod_timestamp_96b_csr_readdata,                  --                                                               .readdata
			tod_timestamp_96b_0_tod_timestamp_96b_csr_waitrequest               => CONNECTED_TO_tod_timestamp_96b_0_tod_timestamp_96b_csr_waitrequest,               --                                                               .waitrequest
			tod_timestamp_96b_0_tod_timestamp_96b_csr_readdatavalid             => CONNECTED_TO_tod_timestamp_96b_0_tod_timestamp_96b_csr_readdatavalid,             --                                                               .readdatavalid
			tod_timestamp_96b_0_rfp_sync_pul_dup_data                           => CONNECTED_TO_tod_timestamp_96b_0_rfp_sync_pul_dup_data,                           --                           tod_timestamp_96b_0_rfp_sync_pul_dup.data
			master_tod_top_0_csr_write                                          => CONNECTED_TO_master_tod_top_0_csr_write,                                          --                                           master_tod_top_0_csr.write
			master_tod_top_0_csr_writedata                                      => CONNECTED_TO_master_tod_top_0_csr_writedata,                                      --                                                               .writedata
			master_tod_top_0_csr_read                                           => CONNECTED_TO_master_tod_top_0_csr_read,                                           --                                                               .read
			master_tod_top_0_csr_readdata                                       => CONNECTED_TO_master_tod_top_0_csr_readdata,                                       --                                                               .readdata
			master_tod_top_0_csr_waitrequest                                    => CONNECTED_TO_master_tod_top_0_csr_waitrequest,                                    --                                                               .waitrequest
			master_tod_top_0_csr_address                                        => CONNECTED_TO_master_tod_top_0_csr_address,                                        --                                                               .address
			master_tod_top_0_i_reconfig_rst_n_reset_n                           => CONNECTED_TO_master_tod_top_0_i_reconfig_rst_n_reset_n,                           --                              master_tod_top_0_i_reconfig_rst_n.reset_n
			master_tod_top_0_pulse_per_second_pps                               => CONNECTED_TO_master_tod_top_0_pulse_per_second_pps,                               --                              master_tod_top_0_pulse_per_second.pps
			mtod_subsys_master_tod_top_0_i_upstr_pll_lock                       => CONNECTED_TO_mtod_subsys_master_tod_top_0_i_upstr_pll_lock,                       --                       mtod_subsys_master_tod_top_0_i_upstr_pll.lock
			mtod_subsys_clk100_in_clk_clk                                       => CONNECTED_TO_mtod_subsys_clk100_in_clk_clk,                                       --                                      mtod_subsys_clk100_in_clk.clk
			mtod_subsys_pps_load_tod_0_period_clock_clk                         => CONNECTED_TO_mtod_subsys_pps_load_tod_0_period_clock_clk,                         --                        mtod_subsys_pps_load_tod_0_period_clock.clk
			mtod_subsys_pps_load_tod_0_reset_reset                              => CONNECTED_TO_mtod_subsys_pps_load_tod_0_reset_reset,                              --                               mtod_subsys_pps_load_tod_0_reset.reset
			mtod_subsys_pps_load_tod_0_csr_reset_reset                          => CONNECTED_TO_mtod_subsys_pps_load_tod_0_csr_reset_reset,                          --                           mtod_subsys_pps_load_tod_0_csr_reset.reset
			mtod_subsys_pps_load_tod_0_csr_readdata                             => CONNECTED_TO_mtod_subsys_pps_load_tod_0_csr_readdata,                             --                                 mtod_subsys_pps_load_tod_0_csr.readdata
			mtod_subsys_pps_load_tod_0_csr_write                                => CONNECTED_TO_mtod_subsys_pps_load_tod_0_csr_write,                                --                                                               .write
			mtod_subsys_pps_load_tod_0_csr_read                                 => CONNECTED_TO_mtod_subsys_pps_load_tod_0_csr_read,                                 --                                                               .read
			mtod_subsys_pps_load_tod_0_csr_writedata                            => CONNECTED_TO_mtod_subsys_pps_load_tod_0_csr_writedata,                            --                                                               .writedata
			mtod_subsys_pps_load_tod_0_csr_waitrequest                          => CONNECTED_TO_mtod_subsys_pps_load_tod_0_csr_waitrequest,                          --                                                               .waitrequest
			mtod_subsys_pps_load_tod_0_csr_address                              => CONNECTED_TO_mtod_subsys_pps_load_tod_0_csr_address,                              --                                                               .address
			mtod_subsys_pps_in_pulse_per_second                                 => CONNECTED_TO_mtod_subsys_pps_in_pulse_per_second,                                 --                                             mtod_subsys_pps_in.pulse_per_second
			master_tod_subsys_0_mtod_subsys_pps_load_tod_0_time_of_day_96b_data => CONNECTED_TO_master_tod_subsys_0_mtod_subsys_pps_load_tod_0_time_of_day_96b_data, -- master_tod_subsys_0_mtod_subsys_pps_load_tod_0_time_of_day_96b.data
			mtod_subsys_pps_load_tod_0_pps_irq_irq                              => CONNECTED_TO_mtod_subsys_pps_load_tod_0_pps_irq_irq,                              --                             mtod_subsys_pps_load_tod_0_pps_irq.irq
			mtod_subsys_rstn_in_reset_reset_n                                   => CONNECTED_TO_mtod_subsys_rstn_in_reset_reset_n,                                   --                                      mtod_subsys_rstn_in_reset.reset_n
			tod_slave_sub_system_0_master_tod_split_conduit_end_10_data         => CONNECTED_TO_tod_slave_sub_system_0_master_tod_split_conduit_end_10_data,         --         tod_slave_sub_system_0_master_tod_split_conduit_end_10.data
			tod_slave_sub_system_0_master_tod_split_conduit_end_10_valid        => CONNECTED_TO_tod_slave_sub_system_0_master_tod_split_conduit_end_10_valid,        --                                                               .valid
			tod_slave_oran_tod_stack_tx_clk_clk                                 => CONNECTED_TO_tod_slave_oran_tod_stack_tx_clk_clk,                                 --                                tod_slave_oran_tod_stack_tx_clk.clk
			tod_slave_oran_tod_stack_rx_clk_clk                                 => CONNECTED_TO_tod_slave_oran_tod_stack_rx_clk_clk,                                 --                                tod_slave_oran_tod_stack_rx_clk.clk
			tod_slave_oran_tod_stack_todsync_sample_clk_clk                     => CONNECTED_TO_tod_slave_oran_tod_stack_todsync_sample_clk_clk,                     --                    tod_slave_oran_tod_stack_todsync_sample_clk.clk
			tx_oran_tod_time_of_day_96b_tdata                                   => CONNECTED_TO_tx_oran_tod_time_of_day_96b_tdata,                                   --                                    tx_oran_tod_time_of_day_96b.tdata
			tx_oran_tod_time_of_day_96b_tvalid                                  => CONNECTED_TO_tx_oran_tod_time_of_day_96b_tvalid,                                  --                                                               .tvalid
			rx_oran_tod_time_of_day_96b_tdata                                   => CONNECTED_TO_rx_oran_tod_time_of_day_96b_tdata,                                   --                                    rx_oran_tod_time_of_day_96b.tdata
			rx_oran_tod_time_of_day_96b_tvalid                                  => CONNECTED_TO_rx_oran_tod_time_of_day_96b_tvalid,                                  --                                                               .tvalid
			tod_slave_port_8_tod_stack_tx_clk_clk                               => CONNECTED_TO_tod_slave_port_8_tod_stack_tx_clk_clk,                               --                              tod_slave_port_8_tod_stack_tx_clk.clk
			tod_slave_port_8_tod_stack_rx_clk_clk                               => CONNECTED_TO_tod_slave_port_8_tod_stack_rx_clk_clk,                               --                              tod_slave_port_8_tod_stack_rx_clk.clk
			tod_slave_port_8_tod_stack_todsync_sample_clk_clk                   => CONNECTED_TO_tod_slave_port_8_tod_stack_todsync_sample_clk_clk,                   --                  tod_slave_port_8_tod_stack_todsync_sample_clk.clk
			tod_slave_port_8_tod_stack_tx_tod_interface_tdata                   => CONNECTED_TO_tod_slave_port_8_tod_stack_tx_tod_interface_tdata,                   --                    tod_slave_port_8_tod_stack_tx_tod_interface.tdata
			tod_slave_port_8_tod_stack_tx_tod_interface_tvalid                  => CONNECTED_TO_tod_slave_port_8_tod_stack_tx_tod_interface_tvalid,                  --                                                               .tvalid
			tod_slave_port_8_tod_stack_rx_tod_interface_tdata                   => CONNECTED_TO_tod_slave_port_8_tod_stack_rx_tod_interface_tdata,                   --                    tod_slave_port_8_tod_stack_rx_tod_interface.tdata
			tod_slave_port_8_tod_stack_rx_tod_interface_tvalid                  => CONNECTED_TO_tod_slave_port_8_tod_stack_rx_tod_interface_tvalid,                  --                                                               .tvalid
			tod_slave_subsys_port_8_tod_stack_tx_pll_locked_lock                => CONNECTED_TO_tod_slave_subsys_port_8_tod_stack_tx_pll_locked_lock,                --                tod_slave_subsys_port_8_tod_stack_tx_pll_locked.lock
			tod_slave_tod_subsys_clk_100_in_clk_clk                             => CONNECTED_TO_tod_slave_tod_subsys_clk_100_in_clk_clk,                             --                            tod_slave_tod_subsys_clk_100_in_clk.clk
			tod_slave_tod_subsys_mtod_clk_in_clk_clk                            => CONNECTED_TO_tod_slave_tod_subsys_mtod_clk_in_clk_clk,                            --                           tod_slave_tod_subsys_mtod_clk_in_clk.clk
			tod_slave_tod_subsys_rst_100_in_reset_reset_n                       => CONNECTED_TO_tod_slave_tod_subsys_rst_100_in_reset_reset_n,                       --                          tod_slave_tod_subsys_rst_100_in_reset.reset_n
			tod_slave_todsync_sample_plllock_split_conduit_end_lock             => CONNECTED_TO_tod_slave_todsync_sample_plllock_split_conduit_end_lock              --         tod_slave_todsync_sample_plllock_split_conduit_end_1_1.lock
		);

