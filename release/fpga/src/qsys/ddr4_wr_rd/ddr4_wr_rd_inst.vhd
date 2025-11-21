	component ddr4_wr_rd is
		port (
			emif_mm_slave_0_address        : in  std_logic_vector(20 downto 0)  := (others => 'X'); -- address
			emif_mm_slave_0_read           : in  std_logic                      := 'X';             -- read
			emif_mm_slave_0_readdata       : out std_logic_vector(127 downto 0);                    -- readdata
			emif_mm_slave_0_write          : in  std_logic                      := 'X';             -- write
			emif_mm_slave_0_writedata      : in  std_logic_vector(127 downto 0) := (others => 'X'); -- writedata
			emif_mm_slave_0_readdatavalid  : out std_logic;                                         -- readdatavalid
			emif_mm_slave_0_waitrequest    : out std_logic;                                         -- waitrequest
			emif_mm_slave_0_byteenable     : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- byteenable
			emif_mm_slave_0_burstcount     : in  std_logic_vector(6 downto 0)   := (others => 'X'); -- burstcount
			addr_span_0_cntl_read          : in  std_logic                      := 'X';             -- read
			addr_span_0_cntl_readdata      : out std_logic_vector(63 downto 0);                     -- readdata
			addr_span_0_cntl_write         : in  std_logic                      := 'X';             -- write
			addr_span_0_cntl_writedata     : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- writedata
			addr_span_0_cntl_byteenable    : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- byteenable
			emif_mm_slave_1_address        : in  std_logic_vector(20 downto 0)  := (others => 'X'); -- address
			emif_mm_slave_1_read           : in  std_logic                      := 'X';             -- read
			emif_mm_slave_1_readdata       : out std_logic_vector(127 downto 0);                    -- readdata
			emif_mm_slave_1_write          : in  std_logic                      := 'X';             -- write
			emif_mm_slave_1_writedata      : in  std_logic_vector(127 downto 0) := (others => 'X'); -- writedata
			emif_mm_slave_1_readdatavalid  : out std_logic;                                         -- readdatavalid
			emif_mm_slave_1_waitrequest    : out std_logic;                                         -- waitrequest
			emif_mm_slave_1_byteenable     : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- byteenable
			emif_mm_slave_1_burstcount     : in  std_logic_vector(6 downto 0)   := (others => 'X'); -- burstcount
			addr_span_1_cntl_read          : in  std_logic                      := 'X';             -- read
			addr_span_1_cntl_readdata      : out std_logic_vector(63 downto 0);                     -- readdata
			addr_span_1_cntl_write         : in  std_logic                      := 'X';             -- write
			addr_span_1_cntl_writedata     : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- writedata
			addr_span_1_cntl_byteenable    : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- byteenable
			wr_msgdma_ddr_address          : out std_logic_vector(31 downto 0);                     -- address
			wr_msgdma_ddr_read             : out std_logic;                                         -- read
			wr_msgdma_ddr_waitrequest      : in  std_logic                      := 'X';             -- waitrequest
			wr_msgdma_ddr_readdata         : in  std_logic_vector(127 downto 0) := (others => 'X'); -- readdata
			wr_msgdma_ddr_write            : out std_logic;                                         -- write
			wr_msgdma_ddr_writedata        : out std_logic_vector(127 downto 0);                    -- writedata
			wr_msgdma_ddr_readdatavalid    : in  std_logic                      := 'X';             -- readdatavalid
			wr_msgdma_ddr_byteenable       : out std_logic_vector(15 downto 0);                     -- byteenable
			wr_msgdma_ddr_burstcount       : out std_logic_vector(6 downto 0);                      -- burstcount
			in_clk_clk                     : in  std_logic                      := 'X';             -- clk
			csr_bridge_s0_waitrequest      : out std_logic;                                         -- waitrequest
			csr_bridge_s0_readdata         : out std_logic_vector(31 downto 0);                     -- readdata
			csr_bridge_s0_readdatavalid    : out std_logic;                                         -- readdatavalid
			csr_bridge_s0_burstcount       : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			csr_bridge_s0_writedata        : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			csr_bridge_s0_address          : in  std_logic_vector(5 downto 0)   := (others => 'X'); -- address
			csr_bridge_s0_write            : in  std_logic                      := 'X';             -- write
			csr_bridge_s0_read             : in  std_logic                      := 'X';             -- read
			csr_bridge_s0_byteenable       : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			csr_bridge_s0_debugaccess      : in  std_logic                      := 'X';             -- debugaccess
			ocm_rd_address                 : in  std_logic_vector(12 downto 0)  := (others => 'X'); -- address
			ocm_rd_read                    : in  std_logic                      := 'X';             -- read
			ocm_rd_readdata                : out std_logic_vector(127 downto 0);                    -- readdata
			ocm_rd_clk_clk                 : in  std_logic                      := 'X';             -- clk
			ocm_rd_reset_reset             : in  std_logic                      := 'X';             -- reset
			ocm_rd_reset_reset_req         : in  std_logic                      := 'X';             -- reset_req
			emif_mm_master_1_waitrequest   : in  std_logic                      := 'X';             -- waitrequest
			emif_mm_master_1_readdata      : in  std_logic_vector(127 downto 0) := (others => 'X'); -- readdata
			emif_mm_master_1_readdatavalid : in  std_logic                      := 'X';             -- readdatavalid
			emif_mm_master_1_burstcount    : out std_logic_vector(6 downto 0);                      -- burstcount
			emif_mm_master_1_writedata     : out std_logic_vector(127 downto 0);                    -- writedata
			emif_mm_master_1_address       : out std_logic_vector(9 downto 0);                      -- address
			emif_mm_master_1_write         : out std_logic;                                         -- write
			emif_mm_master_1_read          : out std_logic;                                         -- read
			emif_mm_master_1_byteenable    : out std_logic_vector(15 downto 0);                     -- byteenable
			emif_mm_master_1_debugaccess   : out std_logic;                                         -- debugaccess
			in_reset_reset_n               : in  std_logic                      := 'X';             -- reset_n
			wr_msgdma_0_csr_irq_irq        : out std_logic;                                         -- irq
			wr_msgdma_0_st_sink_data       : in  std_logic_vector(127 downto 0) := (others => 'X'); -- data
			wr_msgdma_0_st_sink_valid      : in  std_logic                      := 'X';             -- valid
			wr_msgdma_0_st_sink_ready      : out std_logic                                          -- ready
		);
	end component ddr4_wr_rd;

	u0 : component ddr4_wr_rd
		port map (
			emif_mm_slave_0_address        => CONNECTED_TO_emif_mm_slave_0_address,        --     emif_mm_slave_0.address
			emif_mm_slave_0_read           => CONNECTED_TO_emif_mm_slave_0_read,           --                    .read
			emif_mm_slave_0_readdata       => CONNECTED_TO_emif_mm_slave_0_readdata,       --                    .readdata
			emif_mm_slave_0_write          => CONNECTED_TO_emif_mm_slave_0_write,          --                    .write
			emif_mm_slave_0_writedata      => CONNECTED_TO_emif_mm_slave_0_writedata,      --                    .writedata
			emif_mm_slave_0_readdatavalid  => CONNECTED_TO_emif_mm_slave_0_readdatavalid,  --                    .readdatavalid
			emif_mm_slave_0_waitrequest    => CONNECTED_TO_emif_mm_slave_0_waitrequest,    --                    .waitrequest
			emif_mm_slave_0_byteenable     => CONNECTED_TO_emif_mm_slave_0_byteenable,     --                    .byteenable
			emif_mm_slave_0_burstcount     => CONNECTED_TO_emif_mm_slave_0_burstcount,     --                    .burstcount
			addr_span_0_cntl_read          => CONNECTED_TO_addr_span_0_cntl_read,          --    addr_span_0_cntl.read
			addr_span_0_cntl_readdata      => CONNECTED_TO_addr_span_0_cntl_readdata,      --                    .readdata
			addr_span_0_cntl_write         => CONNECTED_TO_addr_span_0_cntl_write,         --                    .write
			addr_span_0_cntl_writedata     => CONNECTED_TO_addr_span_0_cntl_writedata,     --                    .writedata
			addr_span_0_cntl_byteenable    => CONNECTED_TO_addr_span_0_cntl_byteenable,    --                    .byteenable
			emif_mm_slave_1_address        => CONNECTED_TO_emif_mm_slave_1_address,        --     emif_mm_slave_1.address
			emif_mm_slave_1_read           => CONNECTED_TO_emif_mm_slave_1_read,           --                    .read
			emif_mm_slave_1_readdata       => CONNECTED_TO_emif_mm_slave_1_readdata,       --                    .readdata
			emif_mm_slave_1_write          => CONNECTED_TO_emif_mm_slave_1_write,          --                    .write
			emif_mm_slave_1_writedata      => CONNECTED_TO_emif_mm_slave_1_writedata,      --                    .writedata
			emif_mm_slave_1_readdatavalid  => CONNECTED_TO_emif_mm_slave_1_readdatavalid,  --                    .readdatavalid
			emif_mm_slave_1_waitrequest    => CONNECTED_TO_emif_mm_slave_1_waitrequest,    --                    .waitrequest
			emif_mm_slave_1_byteenable     => CONNECTED_TO_emif_mm_slave_1_byteenable,     --                    .byteenable
			emif_mm_slave_1_burstcount     => CONNECTED_TO_emif_mm_slave_1_burstcount,     --                    .burstcount
			addr_span_1_cntl_read          => CONNECTED_TO_addr_span_1_cntl_read,          --    addr_span_1_cntl.read
			addr_span_1_cntl_readdata      => CONNECTED_TO_addr_span_1_cntl_readdata,      --                    .readdata
			addr_span_1_cntl_write         => CONNECTED_TO_addr_span_1_cntl_write,         --                    .write
			addr_span_1_cntl_writedata     => CONNECTED_TO_addr_span_1_cntl_writedata,     --                    .writedata
			addr_span_1_cntl_byteenable    => CONNECTED_TO_addr_span_1_cntl_byteenable,    --                    .byteenable
			wr_msgdma_ddr_address          => CONNECTED_TO_wr_msgdma_ddr_address,          --       wr_msgdma_ddr.address
			wr_msgdma_ddr_read             => CONNECTED_TO_wr_msgdma_ddr_read,             --                    .read
			wr_msgdma_ddr_waitrequest      => CONNECTED_TO_wr_msgdma_ddr_waitrequest,      --                    .waitrequest
			wr_msgdma_ddr_readdata         => CONNECTED_TO_wr_msgdma_ddr_readdata,         --                    .readdata
			wr_msgdma_ddr_write            => CONNECTED_TO_wr_msgdma_ddr_write,            --                    .write
			wr_msgdma_ddr_writedata        => CONNECTED_TO_wr_msgdma_ddr_writedata,        --                    .writedata
			wr_msgdma_ddr_readdatavalid    => CONNECTED_TO_wr_msgdma_ddr_readdatavalid,    --                    .readdatavalid
			wr_msgdma_ddr_byteenable       => CONNECTED_TO_wr_msgdma_ddr_byteenable,       --                    .byteenable
			wr_msgdma_ddr_burstcount       => CONNECTED_TO_wr_msgdma_ddr_burstcount,       --                    .burstcount
			in_clk_clk                     => CONNECTED_TO_in_clk_clk,                     --              in_clk.clk
			csr_bridge_s0_waitrequest      => CONNECTED_TO_csr_bridge_s0_waitrequest,      --       csr_bridge_s0.waitrequest
			csr_bridge_s0_readdata         => CONNECTED_TO_csr_bridge_s0_readdata,         --                    .readdata
			csr_bridge_s0_readdatavalid    => CONNECTED_TO_csr_bridge_s0_readdatavalid,    --                    .readdatavalid
			csr_bridge_s0_burstcount       => CONNECTED_TO_csr_bridge_s0_burstcount,       --                    .burstcount
			csr_bridge_s0_writedata        => CONNECTED_TO_csr_bridge_s0_writedata,        --                    .writedata
			csr_bridge_s0_address          => CONNECTED_TO_csr_bridge_s0_address,          --                    .address
			csr_bridge_s0_write            => CONNECTED_TO_csr_bridge_s0_write,            --                    .write
			csr_bridge_s0_read             => CONNECTED_TO_csr_bridge_s0_read,             --                    .read
			csr_bridge_s0_byteenable       => CONNECTED_TO_csr_bridge_s0_byteenable,       --                    .byteenable
			csr_bridge_s0_debugaccess      => CONNECTED_TO_csr_bridge_s0_debugaccess,      --                    .debugaccess
			ocm_rd_address                 => CONNECTED_TO_ocm_rd_address,                 --              ocm_rd.address
			ocm_rd_read                    => CONNECTED_TO_ocm_rd_read,                    --                    .read
			ocm_rd_readdata                => CONNECTED_TO_ocm_rd_readdata,                --                    .readdata
			ocm_rd_clk_clk                 => CONNECTED_TO_ocm_rd_clk_clk,                 --          ocm_rd_clk.clk
			ocm_rd_reset_reset             => CONNECTED_TO_ocm_rd_reset_reset,             --        ocm_rd_reset.reset
			ocm_rd_reset_reset_req         => CONNECTED_TO_ocm_rd_reset_reset_req,         --                    .reset_req
			emif_mm_master_1_waitrequest   => CONNECTED_TO_emif_mm_master_1_waitrequest,   --    emif_mm_master_1.waitrequest
			emif_mm_master_1_readdata      => CONNECTED_TO_emif_mm_master_1_readdata,      --                    .readdata
			emif_mm_master_1_readdatavalid => CONNECTED_TO_emif_mm_master_1_readdatavalid, --                    .readdatavalid
			emif_mm_master_1_burstcount    => CONNECTED_TO_emif_mm_master_1_burstcount,    --                    .burstcount
			emif_mm_master_1_writedata     => CONNECTED_TO_emif_mm_master_1_writedata,     --                    .writedata
			emif_mm_master_1_address       => CONNECTED_TO_emif_mm_master_1_address,       --                    .address
			emif_mm_master_1_write         => CONNECTED_TO_emif_mm_master_1_write,         --                    .write
			emif_mm_master_1_read          => CONNECTED_TO_emif_mm_master_1_read,          --                    .read
			emif_mm_master_1_byteenable    => CONNECTED_TO_emif_mm_master_1_byteenable,    --                    .byteenable
			emif_mm_master_1_debugaccess   => CONNECTED_TO_emif_mm_master_1_debugaccess,   --                    .debugaccess
			in_reset_reset_n               => CONNECTED_TO_in_reset_reset_n,               --            in_reset.reset_n
			wr_msgdma_0_csr_irq_irq        => CONNECTED_TO_wr_msgdma_0_csr_irq_irq,        -- wr_msgdma_0_csr_irq.irq
			wr_msgdma_0_st_sink_data       => CONNECTED_TO_wr_msgdma_0_st_sink_data,       -- wr_msgdma_0_st_sink.data
			wr_msgdma_0_st_sink_valid      => CONNECTED_TO_wr_msgdma_0_st_sink_valid,      --                    .valid
			wr_msgdma_0_st_sink_ready      => CONNECTED_TO_wr_msgdma_0_st_sink_ready       --                    .ready
		);

