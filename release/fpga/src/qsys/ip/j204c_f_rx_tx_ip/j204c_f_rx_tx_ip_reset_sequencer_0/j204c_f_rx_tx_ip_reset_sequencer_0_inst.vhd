	component j204c_f_rx_tx_ip_reset_sequencer_0 is
		generic (
			NUM_OUTPUTS                   : integer := 6;
			ENABLE_DEASSERTION_INPUT_QUAL : integer := 22;
			ENABLE_ASSERTION_SEQUENCE     : integer := 0;
			ENABLE_DEASSERTION_SEQUENCE   : integer := 1;
			MIN_ASRT_TIME                 : integer := 20;
			ASRT_DELAY0                   : integer := 0;
			DSRT_DELAY0                   : integer := 2;
			ASRT_REMAP0                   : integer := 0;
			DSRT_REMAP0                   : integer := 0;
			DSRT_QUALCNT_0                : integer := 0;
			ASRT_DELAY1                   : integer := 0;
			DSRT_DELAY1                   : integer := 0;
			ASRT_REMAP1                   : integer := 1;
			DSRT_REMAP1                   : integer := 1;
			DSRT_QUALCNT_1                : integer := 2;
			ASRT_DELAY2                   : integer := 0;
			DSRT_DELAY2                   : integer := 0;
			ASRT_REMAP2                   : integer := 2;
			DSRT_REMAP2                   : integer := 2;
			DSRT_QUALCNT_2                : integer := 0;
			ASRT_DELAY3                   : integer := 0;
			DSRT_DELAY3                   : integer := 100;
			ASRT_REMAP3                   : integer := 3;
			DSRT_REMAP3                   : integer := 3;
			DSRT_QUALCNT_3                : integer := 0;
			ASRT_DELAY4                   : integer := 0;
			DSRT_DELAY4                   : integer := 0;
			ASRT_REMAP4                   : integer := 4;
			DSRT_REMAP4                   : integer := 4;
			DSRT_QUALCNT_4                : integer := 0;
			ASRT_DELAY5                   : integer := 0;
			DSRT_DELAY5                   : integer := 50;
			ASRT_REMAP5                   : integer := 5;
			DSRT_REMAP5                   : integer := 5;
			DSRT_QUALCNT_5                : integer := 0;
			ASRT_DELAY6                   : integer := 0;
			DSRT_DELAY6                   : integer := 0;
			ASRT_REMAP6                   : integer := 6;
			DSRT_REMAP6                   : integer := 6;
			DSRT_QUALCNT_6                : integer := 0;
			ASRT_DELAY7                   : integer := 0;
			DSRT_DELAY7                   : integer := 0;
			ASRT_REMAP7                   : integer := 7;
			DSRT_REMAP7                   : integer := 7;
			DSRT_QUALCNT_7                : integer := 0;
			ASRT_DELAY8                   : integer := 0;
			DSRT_DELAY8                   : integer := 0;
			ASRT_REMAP8                   : integer := 8;
			DSRT_REMAP8                   : integer := 8;
			DSRT_QUALCNT_8                : integer := 0;
			ASRT_DELAY9                   : integer := 0;
			DSRT_DELAY9                   : integer := 0;
			ASRT_REMAP9                   : integer := 9;
			DSRT_REMAP9                   : integer := 9;
			DSRT_QUALCNT_9                : integer := 0
		);
		port (
			clk              : in  std_logic                     := 'X';             -- clk
			reset_in0        : in  std_logic                     := 'X';             -- reset
			reset_out0       : out std_logic;                                        -- reset
			reset_out1       : out std_logic;                                        -- reset
			reset_out2       : out std_logic;                                        -- reset
			reset_out3       : out std_logic;                                        -- reset
			reset_out4       : out std_logic;                                        -- reset
			reset_out5       : out std_logic;                                        -- reset
			reset1_dsrt_qual : in  std_logic                     := 'X';             -- reset1_dsrt_qual
			reset2_dsrt_qual : in  std_logic                     := 'X';             -- reset2_dsrt_qual
			reset4_dsrt_qual : in  std_logic                     := 'X';             -- reset4_dsrt_qual
			csr_reset        : in  std_logic                     := 'X';             -- reset
			av_address       : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			av_readdata      : out std_logic_vector(31 downto 0);                    -- readdata
			av_read          : in  std_logic                     := 'X';             -- read
			av_writedata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			av_write         : in  std_logic                     := 'X';             -- write
			irq              : out std_logic                                         -- irq
		);
	end component j204c_f_rx_tx_ip_reset_sequencer_0;

	u0 : component j204c_f_rx_tx_ip_reset_sequencer_0
		generic map (
			NUM_OUTPUTS                   => INTEGER_VALUE_FOR_NUM_OUTPUTS,
			ENABLE_DEASSERTION_INPUT_QUAL => INTEGER_VALUE_FOR_ENABLE_DEASSERTION_INPUT_QUAL,
			ENABLE_ASSERTION_SEQUENCE     => INTEGER_VALUE_FOR_ENABLE_ASSERTION_SEQUENCE,
			ENABLE_DEASSERTION_SEQUENCE   => INTEGER_VALUE_FOR_ENABLE_DEASSERTION_SEQUENCE,
			MIN_ASRT_TIME                 => INTEGER_VALUE_FOR_MIN_ASRT_TIME,
			ASRT_DELAY0                   => INTEGER_VALUE_FOR_ASRT_DELAY0,
			DSRT_DELAY0                   => INTEGER_VALUE_FOR_DSRT_DELAY0,
			ASRT_REMAP0                   => INTEGER_VALUE_FOR_ASRT_REMAP0,
			DSRT_REMAP0                   => INTEGER_VALUE_FOR_DSRT_REMAP0,
			DSRT_QUALCNT_0                => INTEGER_VALUE_FOR_DSRT_QUALCNT_0,
			ASRT_DELAY1                   => INTEGER_VALUE_FOR_ASRT_DELAY1,
			DSRT_DELAY1                   => INTEGER_VALUE_FOR_DSRT_DELAY1,
			ASRT_REMAP1                   => INTEGER_VALUE_FOR_ASRT_REMAP1,
			DSRT_REMAP1                   => INTEGER_VALUE_FOR_DSRT_REMAP1,
			DSRT_QUALCNT_1                => INTEGER_VALUE_FOR_DSRT_QUALCNT_1,
			ASRT_DELAY2                   => INTEGER_VALUE_FOR_ASRT_DELAY2,
			DSRT_DELAY2                   => INTEGER_VALUE_FOR_DSRT_DELAY2,
			ASRT_REMAP2                   => INTEGER_VALUE_FOR_ASRT_REMAP2,
			DSRT_REMAP2                   => INTEGER_VALUE_FOR_DSRT_REMAP2,
			DSRT_QUALCNT_2                => INTEGER_VALUE_FOR_DSRT_QUALCNT_2,
			ASRT_DELAY3                   => INTEGER_VALUE_FOR_ASRT_DELAY3,
			DSRT_DELAY3                   => INTEGER_VALUE_FOR_DSRT_DELAY3,
			ASRT_REMAP3                   => INTEGER_VALUE_FOR_ASRT_REMAP3,
			DSRT_REMAP3                   => INTEGER_VALUE_FOR_DSRT_REMAP3,
			DSRT_QUALCNT_3                => INTEGER_VALUE_FOR_DSRT_QUALCNT_3,
			ASRT_DELAY4                   => INTEGER_VALUE_FOR_ASRT_DELAY4,
			DSRT_DELAY4                   => INTEGER_VALUE_FOR_DSRT_DELAY4,
			ASRT_REMAP4                   => INTEGER_VALUE_FOR_ASRT_REMAP4,
			DSRT_REMAP4                   => INTEGER_VALUE_FOR_DSRT_REMAP4,
			DSRT_QUALCNT_4                => INTEGER_VALUE_FOR_DSRT_QUALCNT_4,
			ASRT_DELAY5                   => INTEGER_VALUE_FOR_ASRT_DELAY5,
			DSRT_DELAY5                   => INTEGER_VALUE_FOR_DSRT_DELAY5,
			ASRT_REMAP5                   => INTEGER_VALUE_FOR_ASRT_REMAP5,
			DSRT_REMAP5                   => INTEGER_VALUE_FOR_DSRT_REMAP5,
			DSRT_QUALCNT_5                => INTEGER_VALUE_FOR_DSRT_QUALCNT_5,
			ASRT_DELAY6                   => INTEGER_VALUE_FOR_ASRT_DELAY6,
			DSRT_DELAY6                   => INTEGER_VALUE_FOR_DSRT_DELAY6,
			ASRT_REMAP6                   => INTEGER_VALUE_FOR_ASRT_REMAP6,
			DSRT_REMAP6                   => INTEGER_VALUE_FOR_DSRT_REMAP6,
			DSRT_QUALCNT_6                => INTEGER_VALUE_FOR_DSRT_QUALCNT_6,
			ASRT_DELAY7                   => INTEGER_VALUE_FOR_ASRT_DELAY7,
			DSRT_DELAY7                   => INTEGER_VALUE_FOR_DSRT_DELAY7,
			ASRT_REMAP7                   => INTEGER_VALUE_FOR_ASRT_REMAP7,
			DSRT_REMAP7                   => INTEGER_VALUE_FOR_DSRT_REMAP7,
			DSRT_QUALCNT_7                => INTEGER_VALUE_FOR_DSRT_QUALCNT_7,
			ASRT_DELAY8                   => INTEGER_VALUE_FOR_ASRT_DELAY8,
			DSRT_DELAY8                   => INTEGER_VALUE_FOR_DSRT_DELAY8,
			ASRT_REMAP8                   => INTEGER_VALUE_FOR_ASRT_REMAP8,
			DSRT_REMAP8                   => INTEGER_VALUE_FOR_DSRT_REMAP8,
			DSRT_QUALCNT_8                => INTEGER_VALUE_FOR_DSRT_QUALCNT_8,
			ASRT_DELAY9                   => INTEGER_VALUE_FOR_ASRT_DELAY9,
			DSRT_DELAY9                   => INTEGER_VALUE_FOR_DSRT_DELAY9,
			ASRT_REMAP9                   => INTEGER_VALUE_FOR_ASRT_REMAP9,
			DSRT_REMAP9                   => INTEGER_VALUE_FOR_DSRT_REMAP9,
			DSRT_QUALCNT_9                => INTEGER_VALUE_FOR_DSRT_QUALCNT_9
		)
		port map (
			clk              => CONNECTED_TO_clk,              --              clk.clk
			reset_in0        => CONNECTED_TO_reset_in0,        --        reset_in0.reset
			reset_out0       => CONNECTED_TO_reset_out0,       --       reset_out0.reset
			reset_out1       => CONNECTED_TO_reset_out1,       --       reset_out1.reset
			reset_out2       => CONNECTED_TO_reset_out2,       --       reset_out2.reset
			reset_out3       => CONNECTED_TO_reset_out3,       --       reset_out3.reset
			reset_out4       => CONNECTED_TO_reset_out4,       --       reset_out4.reset
			reset_out5       => CONNECTED_TO_reset_out5,       --       reset_out5.reset
			reset1_dsrt_qual => CONNECTED_TO_reset1_dsrt_qual, -- reset1_dsrt_qual.reset1_dsrt_qual
			reset2_dsrt_qual => CONNECTED_TO_reset2_dsrt_qual, -- reset2_dsrt_qual.reset2_dsrt_qual
			reset4_dsrt_qual => CONNECTED_TO_reset4_dsrt_qual, -- reset4_dsrt_qual.reset4_dsrt_qual
			csr_reset        => CONNECTED_TO_csr_reset,        --        csr_reset.reset
			av_address       => CONNECTED_TO_av_address,       --           av_csr.address
			av_readdata      => CONNECTED_TO_av_readdata,      --                 .readdata
			av_read          => CONNECTED_TO_av_read,          --                 .read
			av_writedata     => CONNECTED_TO_av_writedata,     --                 .writedata
			av_write         => CONNECTED_TO_av_write,         --                 .write
			irq              => CONNECTED_TO_irq               --       av_csr_irq.irq
		);

