	component eth_f_tod is
		generic (
			PERIOD_CLOCK_FREQUENCY        : integer := 1;
			OFFSET_JITTER_WANDER_EN       : integer := 0;
			DEFAULT_NSEC_PERIOD           : integer := 2;
			DEFAULT_FNSEC_PERIOD          : integer := 36700;
			DEFAULT_NSEC_ADJPERIOD        : integer := 2;
			DEFAULT_FNSEC_ADJPERIOD       : integer := 36700;
			PPS_PULSE_ASSERT_CYCLE_MASTER : integer := 2;
			PLL_SCAN_CLK_FREQ             : integer := 100;
			UNIT_PHASE_SHIFT              : integer := 100
		);
		port (
			clk                        : in  std_logic                     := 'X';             -- clk
			rst_n                      : in  std_logic                     := 'X';             -- reset_n
			period_clk                 : in  std_logic                     := 'X';             -- clk
			period_rst_n               : in  std_logic                     := 'X';             -- reset_n
			csr_readdata               : out std_logic_vector(31 downto 0);                    -- readdata
			csr_write                  : in  std_logic                     := 'X';             -- write
			csr_read                   : in  std_logic                     := 'X';             -- read
			csr_writedata              : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			csr_waitrequest            : out std_logic;                                        -- waitrequest
			csr_address                : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- address
			time_of_day_96b            : out std_logic_vector(95 downto 0);                    -- data
			time_of_day_64b            : out std_logic_vector(63 downto 0);                    -- data
			time_of_day_96b_load_data  : in  std_logic_vector(95 downto 0) := (others => 'X'); -- data
			time_of_day_96b_load_valid : in  std_logic                     := 'X';             -- valid
			time_of_day_64b_load_data  : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			time_of_day_64b_load_valid : in  std_logic                     := 'X'              -- valid
		);
	end component eth_f_tod;

	u0 : component eth_f_tod
		generic map (
			PERIOD_CLOCK_FREQUENCY        => INTEGER_VALUE_FOR_PERIOD_CLOCK_FREQUENCY,
			OFFSET_JITTER_WANDER_EN       => INTEGER_VALUE_FOR_OFFSET_JITTER_WANDER_EN,
			DEFAULT_NSEC_PERIOD           => INTEGER_VALUE_FOR_DEFAULT_NSEC_PERIOD,
			DEFAULT_FNSEC_PERIOD          => INTEGER_VALUE_FOR_DEFAULT_FNSEC_PERIOD,
			DEFAULT_NSEC_ADJPERIOD        => INTEGER_VALUE_FOR_DEFAULT_NSEC_ADJPERIOD,
			DEFAULT_FNSEC_ADJPERIOD       => INTEGER_VALUE_FOR_DEFAULT_FNSEC_ADJPERIOD,
			PPS_PULSE_ASSERT_CYCLE_MASTER => INTEGER_VALUE_FOR_PPS_PULSE_ASSERT_CYCLE_MASTER,
			PLL_SCAN_CLK_FREQ             => INTEGER_VALUE_FOR_PLL_SCAN_CLK_FREQ,
			UNIT_PHASE_SHIFT              => INTEGER_VALUE_FOR_UNIT_PHASE_SHIFT
		)
		port map (
			clk                        => CONNECTED_TO_clk,                        --            csr_clock.clk
			rst_n                      => CONNECTED_TO_rst_n,                      --            csr_reset.reset_n
			period_clk                 => CONNECTED_TO_period_clk,                 --         period_clock.clk
			period_rst_n               => CONNECTED_TO_period_rst_n,               --   period_clock_reset.reset_n
			csr_readdata               => CONNECTED_TO_csr_readdata,               --                  csr.readdata
			csr_write                  => CONNECTED_TO_csr_write,                  --                     .write
			csr_read                   => CONNECTED_TO_csr_read,                   --                     .read
			csr_writedata              => CONNECTED_TO_csr_writedata,              --                     .writedata
			csr_waitrequest            => CONNECTED_TO_csr_waitrequest,            --                     .waitrequest
			csr_address                => CONNECTED_TO_csr_address,                --                     .address
			time_of_day_96b            => CONNECTED_TO_time_of_day_96b,            --      time_of_day_96b.data
			time_of_day_64b            => CONNECTED_TO_time_of_day_64b,            --      time_of_day_64b.data
			time_of_day_96b_load_data  => CONNECTED_TO_time_of_day_96b_load_data,  -- time_of_day_96b_load.data
			time_of_day_96b_load_valid => CONNECTED_TO_time_of_day_96b_load_valid, --                     .valid
			time_of_day_64b_load_data  => CONNECTED_TO_time_of_day_64b_load_data,  -- time_of_day_64b_load.data
			time_of_day_64b_load_valid => CONNECTED_TO_time_of_day_64b_load_valid  --                     .valid
		);

