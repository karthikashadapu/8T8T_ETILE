	component master_tod_top_0 is
		generic (
			MASTER_PPS_CYCLE : integer := 2
		);
		port (
			i_csr_write          : in  std_logic                     := 'X';             -- write
			i_csr_writedata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			i_csr_read           : in  std_logic                     := 'X';             -- read
			o_csr_readdata       : out std_logic_vector(31 downto 0);                    -- readdata
			o_csr_waitrequest    : out std_logic;                                        -- waitrequest
			i_csr_addr           : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- address
			i_clk_reconfig       : in  std_logic                     := 'X';             -- clk
			i_clk_tod            : in  std_logic                     := 'X';             -- clk
			i_reconfig_rst_n     : in  std_logic                     := 'X';             -- reset_n
			i_tod_rst_n          : in  std_logic                     := 'X';             -- reset_n
			i_tod_96b_load_valid : in  std_logic                     := 'X';             -- valid
			i_tod_96b_load_data  : in  std_logic_vector(95 downto 0) := (others => 'X'); -- data
			o_pps                : out std_logic;                                        -- writeresponsevalid_n
			o_tod_96b_valid      : out std_logic;                                        -- valid
			o_tod_96b_data       : out std_logic_vector(95 downto 0);                    -- data
			i_upstr_pll_lock     : in  std_logic                     := 'X'              -- lock
		);
	end component master_tod_top_0;

	u0 : component master_tod_top_0
		generic map (
			MASTER_PPS_CYCLE => INTEGER_VALUE_FOR_MASTER_PPS_CYCLE
		)
		port map (
			i_csr_write          => CONNECTED_TO_i_csr_write,          --                csr.write
			i_csr_writedata      => CONNECTED_TO_i_csr_writedata,      --                   .writedata
			i_csr_read           => CONNECTED_TO_i_csr_read,           --                   .read
			o_csr_readdata       => CONNECTED_TO_o_csr_readdata,       --                   .readdata
			o_csr_waitrequest    => CONNECTED_TO_o_csr_waitrequest,    --                   .waitrequest
			i_csr_addr           => CONNECTED_TO_i_csr_addr,           --                   .address
			i_clk_reconfig       => CONNECTED_TO_i_clk_reconfig,       --     i_clk_reconfig.clk
			i_clk_tod            => CONNECTED_TO_i_clk_tod,            --          i_clk_tod.clk
			i_reconfig_rst_n     => CONNECTED_TO_i_reconfig_rst_n,     --   i_reconfig_rst_n.reset_n
			i_tod_rst_n          => CONNECTED_TO_i_tod_rst_n,          --        i_tod_rst_n.reset_n
			i_tod_96b_load_valid => CONNECTED_TO_i_tod_96b_load_valid, -- avst_tod_load_data.valid
			i_tod_96b_load_data  => CONNECTED_TO_i_tod_96b_load_data,  --                   .data
			o_pps                => CONNECTED_TO_o_pps,                --   pulse_per_second.writeresponsevalid_n
			o_tod_96b_valid      => CONNECTED_TO_o_tod_96b_valid,      --      avst_tod_data.valid
			o_tod_96b_data       => CONNECTED_TO_o_tod_96b_data,       --                   .data
			i_upstr_pll_lock     => CONNECTED_TO_i_upstr_pll_lock      --        i_upstr_pll.lock
		);

