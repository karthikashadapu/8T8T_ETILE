	component tod_subsys_cdc_pipeline_0 is
		generic (
			DW     : integer := 96;
			DELAYS : integer := 2
		);
		port (
			src_clk       : in  std_logic                       := 'X';             -- clk
			rst_src_clk_n : in  std_logic                       := 'X';             -- reset_n
			dst_clk       : in  std_logic                       := 'X';             -- clk
			rst_dst_clk_n : in  std_logic                       := 'X';             -- reset_n
			datain        : in  std_logic_vector(DW-1 downto 0) := (others => 'X'); -- data
			dataout       : out std_logic_vector(DW-1 downto 0)                     -- data
		);
	end component tod_subsys_cdc_pipeline_0;

	u0 : component tod_subsys_cdc_pipeline_0
		generic map (
			DW     => INTEGER_VALUE_FOR_DW,
			DELAYS => INTEGER_VALUE_FOR_DELAYS
		)
		port map (
			src_clk       => CONNECTED_TO_src_clk,       --       src_clk.clk
			rst_src_clk_n => CONNECTED_TO_rst_src_clk_n, -- rst_src_clk_n.reset_n
			dst_clk       => CONNECTED_TO_dst_clk,       --       dst_clk.clk
			rst_dst_clk_n => CONNECTED_TO_rst_dst_clk_n, -- rst_dst_clk_n.reset_n
			datain        => CONNECTED_TO_datain,        --        datain.data
			dataout       => CONNECTED_TO_dataout        --       dataout.data
		);

