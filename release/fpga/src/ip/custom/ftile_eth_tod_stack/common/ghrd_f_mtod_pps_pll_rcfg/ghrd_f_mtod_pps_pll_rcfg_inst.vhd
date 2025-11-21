	component ghrd_f_mtod_pps_pll_rcfg is
		port (
			mgmt_clk          : in  std_logic                     := 'X';             -- clk
			mgmt_reset        : in  std_logic                     := 'X';             -- reset
			mgmt_waitrequest  : out std_logic;                                        -- waitrequest
			mgmt_write        : in  std_logic                     := 'X';             -- write
			mgmt_read         : in  std_logic                     := 'X';             -- read
			mgmt_writedata    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- writedata
			mgmt_readdata     : out std_logic_vector(7 downto 0);                     -- readdata
			mgmt_address      : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- address
			reconfig_to_pll   : out std_logic_vector(29 downto 0);                    -- reconfig_to_pll
			reconfig_from_pll : in  std_logic_vector(10 downto 0) := (others => 'X')  -- reconfig_from_pll
		);
	end component ghrd_f_mtod_pps_pll_rcfg;

	u0 : component ghrd_f_mtod_pps_pll_rcfg
		port map (
			mgmt_clk          => CONNECTED_TO_mgmt_clk,          --          mgmt_clk.clk
			mgmt_reset        => CONNECTED_TO_mgmt_reset,        --        mgmt_reset.reset
			mgmt_waitrequest  => CONNECTED_TO_mgmt_waitrequest,  -- mgmt_avalon_slave.waitrequest
			mgmt_write        => CONNECTED_TO_mgmt_write,        --                  .write
			mgmt_read         => CONNECTED_TO_mgmt_read,         --                  .read
			mgmt_writedata    => CONNECTED_TO_mgmt_writedata,    --                  .writedata
			mgmt_readdata     => CONNECTED_TO_mgmt_readdata,     --                  .readdata
			mgmt_address      => CONNECTED_TO_mgmt_address,      --                  .address
			reconfig_to_pll   => CONNECTED_TO_reconfig_to_pll,   --   reconfig_to_pll.reconfig_to_pll
			reconfig_from_pll => CONNECTED_TO_reconfig_from_pll  -- reconfig_from_pll.reconfig_from_pll
		);

