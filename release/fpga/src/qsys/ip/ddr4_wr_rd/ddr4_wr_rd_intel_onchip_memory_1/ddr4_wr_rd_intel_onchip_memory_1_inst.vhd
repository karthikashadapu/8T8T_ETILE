	component ddr4_wr_rd_intel_onchip_memory_1 is
		port (
			clk        : in  std_logic                      := 'X';             -- clk
			address    : in  std_logic_vector(12 downto 0)  := (others => 'X'); -- address
			byteenable : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- byteenable
			write      : in  std_logic                      := 'X';             -- write
			writedata  : in  std_logic_vector(127 downto 0) := (others => 'X'); -- writedata
			reset      : in  std_logic                      := 'X';             -- reset
			reset_req  : in  std_logic                      := 'X';             -- reset_req
			address2   : in  std_logic_vector(12 downto 0)  := (others => 'X'); -- address
			read2      : in  std_logic                      := 'X';             -- read
			readdata2  : out std_logic_vector(127 downto 0);                    -- readdata
			clk2       : in  std_logic                      := 'X';             -- clk
			reset2     : in  std_logic                      := 'X';             -- reset
			reset_req2 : in  std_logic                      := 'X'              -- reset_req
		);
	end component ddr4_wr_rd_intel_onchip_memory_1;

	u0 : component ddr4_wr_rd_intel_onchip_memory_1
		port map (
			clk        => CONNECTED_TO_clk,        --   clk1.clk
			address    => CONNECTED_TO_address,    --     s1.address
			byteenable => CONNECTED_TO_byteenable, --       .byteenable
			write      => CONNECTED_TO_write,      --       .write
			writedata  => CONNECTED_TO_writedata,  --       .writedata
			reset      => CONNECTED_TO_reset,      -- reset1.reset
			reset_req  => CONNECTED_TO_reset_req,  --       .reset_req
			address2   => CONNECTED_TO_address2,   --     s2.address
			read2      => CONNECTED_TO_read2,      --       .read
			readdata2  => CONNECTED_TO_readdata2,  --       .readdata
			clk2       => CONNECTED_TO_clk2,       --   clk2.clk
			reset2     => CONNECTED_TO_reset2,     -- reset2.reset
			reset_req2 => CONNECTED_TO_reset_req2  --       .reset_req
		);

