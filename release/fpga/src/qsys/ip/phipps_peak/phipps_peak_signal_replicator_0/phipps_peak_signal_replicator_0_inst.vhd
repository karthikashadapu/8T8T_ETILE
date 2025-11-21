	component phipps_peak_signal_replicator_0 is
		port (
			bw_config_cc1             : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- bw_config_cc1
			bw_config_cc2             : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- bw_config_cc2
			radio_config_status       : in  std_logic_vector(55 downto 0) := (others => 'X'); -- radio_config_status
			short_long_prach_sel      : in  std_logic                     := 'X';             -- short_long_prach_sel
			bw_config_cc1_dup1        : out std_logic_vector(7 downto 0);                     -- bw_config_cc1
			bw_config_cc2_dup1        : out std_logic_vector(7 downto 0);                     -- bw_config_cc2
			radio_config_status_dup1  : out std_logic_vector(55 downto 0);                    -- radio_config_status
			short_long_prach_sel_dup1 : out std_logic;                                        -- short_long_prach_sel
			rst_soft_n_dup1           : out std_logic;                                        -- rst_soft_n
			bw_config_cc1_dup2        : out std_logic_vector(7 downto 0);                     -- bw_config_cc1
			bw_config_cc2_dup2        : out std_logic_vector(7 downto 0);                     -- bw_config_cc2
			radio_config_status_dup2  : out std_logic_vector(55 downto 0);                    -- radio_config_status
			short_long_prach_sel_dup2 : out std_logic;                                        -- short_long_prach_sel
			rst_soft_n_dup2           : out std_logic;                                        -- rst_soft_n
			bw_config_cc1_dup3        : out std_logic_vector(7 downto 0);                     -- bw_config_cc1
			bw_config_cc2_dup3        : out std_logic_vector(7 downto 0);                     -- bw_config_cc2
			radio_config_status_dup3  : out std_logic_vector(55 downto 0);                    -- data
			short_long_prach_sel_dup3 : out std_logic;                                        -- short_long_prach_sel
			rst_soft_n_dup3           : out std_logic;                                        -- rst_soft_n
			rst_soft_n                : in  std_logic                     := 'X';             -- rst_soft_n
			rst_soft_n_dup4           : out std_logic;                                        -- rst_soft_n
			interface_sel             : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			interface_sel_dup1        : out std_logic_vector(31 downto 0);                    -- data
			interface_sel_dup2        : out std_logic_vector(31 downto 0)                     -- data
		);
	end component phipps_peak_signal_replicator_0;

	u0 : component phipps_peak_signal_replicator_0
		port map (
			bw_config_cc1             => CONNECTED_TO_bw_config_cc1,             --             bw_config_cc1.bw_config_cc1
			bw_config_cc2             => CONNECTED_TO_bw_config_cc2,             --             bw_config_cc2.bw_config_cc2
			radio_config_status       => CONNECTED_TO_radio_config_status,       --       radio_config_status.radio_config_status
			short_long_prach_sel      => CONNECTED_TO_short_long_prach_sel,      --      short_long_prach_sel.short_long_prach_sel
			bw_config_cc1_dup1        => CONNECTED_TO_bw_config_cc1_dup1,        --        bw_config_cc1_dup1.bw_config_cc1
			bw_config_cc2_dup1        => CONNECTED_TO_bw_config_cc2_dup1,        --        bw_config_cc2_dup1.bw_config_cc2
			radio_config_status_dup1  => CONNECTED_TO_radio_config_status_dup1,  --  radio_config_status_dup1.radio_config_status
			short_long_prach_sel_dup1 => CONNECTED_TO_short_long_prach_sel_dup1, -- short_long_prach_sel_dup1.short_long_prach_sel
			rst_soft_n_dup1           => CONNECTED_TO_rst_soft_n_dup1,           --           rst_soft_n_dup1.rst_soft_n
			bw_config_cc1_dup2        => CONNECTED_TO_bw_config_cc1_dup2,        --        bw_config_cc1_dup2.bw_config_cc1
			bw_config_cc2_dup2        => CONNECTED_TO_bw_config_cc2_dup2,        --        bw_config_cc2_dup2.bw_config_cc2
			radio_config_status_dup2  => CONNECTED_TO_radio_config_status_dup2,  --  radio_config_status_dup2.radio_config_status
			short_long_prach_sel_dup2 => CONNECTED_TO_short_long_prach_sel_dup2, -- short_long_prach_sel_dup2.short_long_prach_sel
			rst_soft_n_dup2           => CONNECTED_TO_rst_soft_n_dup2,           --           rst_soft_n_dup2.rst_soft_n
			bw_config_cc1_dup3        => CONNECTED_TO_bw_config_cc1_dup3,        --        bw_config_cc1_dup3.bw_config_cc1
			bw_config_cc2_dup3        => CONNECTED_TO_bw_config_cc2_dup3,        --        bw_config_cc2_dup3.bw_config_cc2
			radio_config_status_dup3  => CONNECTED_TO_radio_config_status_dup3,  --  radio_config_status_dup3.data
			short_long_prach_sel_dup3 => CONNECTED_TO_short_long_prach_sel_dup3, -- short_long_prach_sel_dup3.short_long_prach_sel
			rst_soft_n_dup3           => CONNECTED_TO_rst_soft_n_dup3,           --           rst_soft_n_dup3.rst_soft_n
			rst_soft_n                => CONNECTED_TO_rst_soft_n,                --                rst_soft_n.rst_soft_n
			rst_soft_n_dup4           => CONNECTED_TO_rst_soft_n_dup4,           --           rst_soft_n_dup4.rst_soft_n
			interface_sel             => CONNECTED_TO_interface_sel,             --             interface_sel.data
			interface_sel_dup1        => CONNECTED_TO_interface_sel_dup1,        --        interface_sel_dup1.data
			interface_sel_dup2        => CONNECTED_TO_interface_sel_dup2         --        interface_sel_dup2.data
		);

