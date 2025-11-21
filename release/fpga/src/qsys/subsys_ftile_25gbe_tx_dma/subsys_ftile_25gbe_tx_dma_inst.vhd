	component subsys_ftile_25gbe_tx_dma is
		generic (
			FP_WIDTH : integer := 8
		);
		port (
			ts_chs_compl_0_clk_bus_in_clk              : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- clk
			ts_chs_compl_0_rst_bus_in_reset            : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- reset
			ts_chs_compl_0_i_ts_valid                  : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- valid
			ts_chs_compl_0_i_ts_fingerprint            : in  std_logic_vector(19 downto 0)  := (others => 'X'); -- fingerprint
			ts_chs_compl_0_i_ts_data                   : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- data
			dma_clk_clk                                : in  std_logic                      := 'X';             -- clk
			csr_waitrequest                            : out std_logic;                                         -- waitrequest
			csr_readdata                               : out std_logic_vector(31 downto 0);                     -- readdata
			csr_readdatavalid                          : out std_logic;                                         -- readdatavalid
			csr_burstcount                             : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			csr_writedata                              : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			csr_address                                : in  std_logic_vector(5 downto 0)   := (others => 'X'); -- address
			csr_write                                  : in  std_logic                      := 'X';             -- write
			csr_read                                   : in  std_logic                      := 'X';             -- read
			csr_byteenable                             : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			csr_debugaccess                            : in  std_logic                      := 'X';             -- debugaccess
			tx_dma_fifo_0_out_st_ready                 : in  std_logic                      := 'X';             -- ready
			tx_dma_fifo_0_out_st_startofpacket         : out std_logic;                                         -- startofpacket
			tx_dma_fifo_0_out_st_valid                 : out std_logic;                                         -- valid
			tx_dma_fifo_0_out_st_endofpacket           : out std_logic;                                         -- endofpacket
			tx_dma_fifo_0_out_st_data                  : out std_logic_vector(63 downto 0);                     -- data
			tx_dma_fifo_0_out_st_empty                 : out std_logic_vector(2 downto 0);                      -- empty
			tx_dma_fifo_0_out_st_error                 : out std_logic_vector(0 downto 0);                      -- error
			tx_dma_fifo_0_out_ts_req_valid             : out std_logic;                                         -- valid
			tx_dma_fifo_0_out_ts_req_fingerprint       : out std_logic_vector(19 downto 0);                     -- fingerprint
			ftile_clk_clk                              : in  std_logic                      := 'X';             -- clk
			prefetcher_read_master_address             : out std_logic_vector(36 downto 0);                     -- address
			prefetcher_read_master_read                : out std_logic;                                         -- read
			prefetcher_read_master_readdata            : in  std_logic_vector(127 downto 0) := (others => 'X'); -- readdata
			prefetcher_read_master_waitrequest         : in  std_logic                      := 'X';             -- waitrequest
			prefetcher_read_master_readdatavalid       : in  std_logic                      := 'X';             -- readdatavalid
			prefetcher_read_master_burstcount          : out std_logic_vector(2 downto 0);                      -- burstcount
			prefetcher_write_master_address            : out std_logic_vector(36 downto 0);                     -- address
			prefetcher_write_master_write              : out std_logic;                                         -- write
			prefetcher_write_master_byteenable         : out std_logic_vector(15 downto 0);                     -- byteenable
			prefetcher_write_master_writedata          : out std_logic_vector(127 downto 0);                    -- writedata
			prefetcher_write_master_waitrequest        : in  std_logic                      := 'X';             -- waitrequest
			prefetcher_write_master_response           : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- response
			prefetcher_write_master_writeresponsevalid : in  std_logic                      := 'X';             -- writeresponsevalid
			irq_irq                                    : out std_logic;                                         -- irq
			read_master_address                        : out std_logic_vector(36 downto 0);                     -- address
			read_master_read                           : out std_logic;                                         -- read
			read_master_byteenable                     : out std_logic_vector(15 downto 0);                     -- byteenable
			read_master_readdata                       : in  std_logic_vector(127 downto 0) := (others => 'X'); -- readdata
			read_master_waitrequest                    : in  std_logic                      := 'X';             -- waitrequest
			read_master_readdatavalid                  : in  std_logic                      := 'X';             -- readdatavalid
			read_master_burstcount                     : out std_logic_vector(4 downto 0);                      -- burstcount
			reset_reset_n                              : in  std_logic                      := 'X'              -- reset_n
		);
	end component subsys_ftile_25gbe_tx_dma;

	u0 : component subsys_ftile_25gbe_tx_dma
		generic map (
			FP_WIDTH => INTEGER_VALUE_FOR_FP_WIDTH
		)
		port map (
			ts_chs_compl_0_clk_bus_in_clk              => CONNECTED_TO_ts_chs_compl_0_clk_bus_in_clk,              -- ts_chs_compl_0_clk_bus_in.clk
			ts_chs_compl_0_rst_bus_in_reset            => CONNECTED_TO_ts_chs_compl_0_rst_bus_in_reset,            -- ts_chs_compl_0_rst_bus_in.reset
			ts_chs_compl_0_i_ts_valid                  => CONNECTED_TO_ts_chs_compl_0_i_ts_valid,                  --       ts_chs_compl_0_i_ts.valid
			ts_chs_compl_0_i_ts_fingerprint            => CONNECTED_TO_ts_chs_compl_0_i_ts_fingerprint,            --                          .fingerprint
			ts_chs_compl_0_i_ts_data                   => CONNECTED_TO_ts_chs_compl_0_i_ts_data,                   --                          .data
			dma_clk_clk                                => CONNECTED_TO_dma_clk_clk,                                --                   dma_clk.clk
			csr_waitrequest                            => CONNECTED_TO_csr_waitrequest,                            --                       csr.waitrequest
			csr_readdata                               => CONNECTED_TO_csr_readdata,                               --                          .readdata
			csr_readdatavalid                          => CONNECTED_TO_csr_readdatavalid,                          --                          .readdatavalid
			csr_burstcount                             => CONNECTED_TO_csr_burstcount,                             --                          .burstcount
			csr_writedata                              => CONNECTED_TO_csr_writedata,                              --                          .writedata
			csr_address                                => CONNECTED_TO_csr_address,                                --                          .address
			csr_write                                  => CONNECTED_TO_csr_write,                                  --                          .write
			csr_read                                   => CONNECTED_TO_csr_read,                                   --                          .read
			csr_byteenable                             => CONNECTED_TO_csr_byteenable,                             --                          .byteenable
			csr_debugaccess                            => CONNECTED_TO_csr_debugaccess,                            --                          .debugaccess
			tx_dma_fifo_0_out_st_ready                 => CONNECTED_TO_tx_dma_fifo_0_out_st_ready,                 --      tx_dma_fifo_0_out_st.ready
			tx_dma_fifo_0_out_st_startofpacket         => CONNECTED_TO_tx_dma_fifo_0_out_st_startofpacket,         --                          .startofpacket
			tx_dma_fifo_0_out_st_valid                 => CONNECTED_TO_tx_dma_fifo_0_out_st_valid,                 --                          .valid
			tx_dma_fifo_0_out_st_endofpacket           => CONNECTED_TO_tx_dma_fifo_0_out_st_endofpacket,           --                          .endofpacket
			tx_dma_fifo_0_out_st_data                  => CONNECTED_TO_tx_dma_fifo_0_out_st_data,                  --                          .data
			tx_dma_fifo_0_out_st_empty                 => CONNECTED_TO_tx_dma_fifo_0_out_st_empty,                 --                          .empty
			tx_dma_fifo_0_out_st_error                 => CONNECTED_TO_tx_dma_fifo_0_out_st_error,                 --                          .error
			tx_dma_fifo_0_out_ts_req_valid             => CONNECTED_TO_tx_dma_fifo_0_out_ts_req_valid,             --  tx_dma_fifo_0_out_ts_req.valid
			tx_dma_fifo_0_out_ts_req_fingerprint       => CONNECTED_TO_tx_dma_fifo_0_out_ts_req_fingerprint,       --                          .fingerprint
			ftile_clk_clk                              => CONNECTED_TO_ftile_clk_clk,                              --                 ftile_clk.clk
			prefetcher_read_master_address             => CONNECTED_TO_prefetcher_read_master_address,             --    prefetcher_read_master.address
			prefetcher_read_master_read                => CONNECTED_TO_prefetcher_read_master_read,                --                          .read
			prefetcher_read_master_readdata            => CONNECTED_TO_prefetcher_read_master_readdata,            --                          .readdata
			prefetcher_read_master_waitrequest         => CONNECTED_TO_prefetcher_read_master_waitrequest,         --                          .waitrequest
			prefetcher_read_master_readdatavalid       => CONNECTED_TO_prefetcher_read_master_readdatavalid,       --                          .readdatavalid
			prefetcher_read_master_burstcount          => CONNECTED_TO_prefetcher_read_master_burstcount,          --                          .burstcount
			prefetcher_write_master_address            => CONNECTED_TO_prefetcher_write_master_address,            --   prefetcher_write_master.address
			prefetcher_write_master_write              => CONNECTED_TO_prefetcher_write_master_write,              --                          .write
			prefetcher_write_master_byteenable         => CONNECTED_TO_prefetcher_write_master_byteenable,         --                          .byteenable
			prefetcher_write_master_writedata          => CONNECTED_TO_prefetcher_write_master_writedata,          --                          .writedata
			prefetcher_write_master_waitrequest        => CONNECTED_TO_prefetcher_write_master_waitrequest,        --                          .waitrequest
			prefetcher_write_master_response           => CONNECTED_TO_prefetcher_write_master_response,           --                          .response
			prefetcher_write_master_writeresponsevalid => CONNECTED_TO_prefetcher_write_master_writeresponsevalid, --                          .writeresponsevalid
			irq_irq                                    => CONNECTED_TO_irq_irq,                                    --                       irq.irq
			read_master_address                        => CONNECTED_TO_read_master_address,                        --               read_master.address
			read_master_read                           => CONNECTED_TO_read_master_read,                           --                          .read
			read_master_byteenable                     => CONNECTED_TO_read_master_byteenable,                     --                          .byteenable
			read_master_readdata                       => CONNECTED_TO_read_master_readdata,                       --                          .readdata
			read_master_waitrequest                    => CONNECTED_TO_read_master_waitrequest,                    --                          .waitrequest
			read_master_readdatavalid                  => CONNECTED_TO_read_master_readdatavalid,                  --                          .readdatavalid
			read_master_burstcount                     => CONNECTED_TO_read_master_burstcount,                     --                          .burstcount
			reset_reset_n                              => CONNECTED_TO_reset_reset_n                               --                     reset.reset_n
		);

