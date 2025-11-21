	component mtod_subsys_pps_load_tod_0 is
		port (
			period_clock                : in  std_logic                     := 'X';             -- clk
			reset                       : in  std_logic                     := 'X';             -- reset
			csr_clock                   : in  std_logic                     := 'X';             -- clk
			csr_reset                   : in  std_logic                     := 'X';             -- reset
			csr_readdata                : out std_logic_vector(31 downto 0);                    -- readdata
			csr_write                   : in  std_logic                     := 'X';             -- write
			csr_read                    : in  std_logic                     := 'X';             -- read
			csr_writedata               : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			csr_waitrequest             : out std_logic;                                        -- waitrequest
			csr_address                 : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- address
			pps_pulse_per_second        : in  std_logic                     := 'X';             -- pulse_per_second
			time_of_day_96b             : in  std_logic_vector(95 downto 0) := (others => 'X'); -- data
			time_of_data_96b_load_data  : out std_logic_vector(95 downto 0);                    -- data
			time_of_data_96b_load_valid : out std_logic;                                        -- valid
			pps_irq                     : out std_logic                                         -- irq
		);
	end component mtod_subsys_pps_load_tod_0;

	u0 : component mtod_subsys_pps_load_tod_0
		port map (
			period_clock                => CONNECTED_TO_period_clock,                --          period_clock.clk
			reset                       => CONNECTED_TO_reset,                       --                 reset.reset
			csr_clock                   => CONNECTED_TO_csr_clock,                   --             csr_clock.clk
			csr_reset                   => CONNECTED_TO_csr_reset,                   --             csr_reset.reset
			csr_readdata                => CONNECTED_TO_csr_readdata,                --                   csr.readdata
			csr_write                   => CONNECTED_TO_csr_write,                   --                      .write
			csr_read                    => CONNECTED_TO_csr_read,                    --                      .read
			csr_writedata               => CONNECTED_TO_csr_writedata,               --                      .writedata
			csr_waitrequest             => CONNECTED_TO_csr_waitrequest,             --                      .waitrequest
			csr_address                 => CONNECTED_TO_csr_address,                 --                      .address
			pps_pulse_per_second        => CONNECTED_TO_pps_pulse_per_second,        --         pps_interface.pulse_per_second
			time_of_day_96b             => CONNECTED_TO_time_of_day_96b,             --       time_of_day_96b.data
			time_of_data_96b_load_data  => CONNECTED_TO_time_of_data_96b_load_data,  -- time_of_data_96b_load.data
			time_of_data_96b_load_valid => CONNECTED_TO_time_of_data_96b_load_valid, --                      .valid
			pps_irq                     => CONNECTED_TO_pps_irq                      --               pps_irq.irq
		);

