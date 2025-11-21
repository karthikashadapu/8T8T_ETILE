	component ghrd_f_mtod_pps_pll is
		port (
			refclk            : in  std_logic                     := 'X';             -- clk
			locked            : out std_logic;                                        -- export
			rst               : in  std_logic                     := 'X';             -- reset
			reconfig_to_pll   : in  std_logic_vector(29 downto 0) := (others => 'X'); -- reconfig_to_pll
			reconfig_from_pll : out std_logic_vector(10 downto 0);                    -- reconfig_from_pll
			outclk_0          : out std_logic;                                        -- clk
			outclk_1          : out std_logic                                         -- clk
		);
	end component ghrd_f_mtod_pps_pll;

	u0 : component ghrd_f_mtod_pps_pll
		port map (
			refclk            => CONNECTED_TO_refclk,            --            refclk.clk
			locked            => CONNECTED_TO_locked,            --            locked.export
			rst               => CONNECTED_TO_rst,               --             reset.reset
			reconfig_to_pll   => CONNECTED_TO_reconfig_to_pll,   --   reconfig_to_pll.reconfig_to_pll
			reconfig_from_pll => CONNECTED_TO_reconfig_from_pll, -- reconfig_from_pll.reconfig_from_pll
			outclk_0          => CONNECTED_TO_outclk_0,          --           outclk0.clk
			outclk_1          => CONNECTED_TO_outclk_1           --           outclk1.clk
		);

