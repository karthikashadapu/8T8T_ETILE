	component subsys_ftile_25gbe_rx_dma is
		port (
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
			pktin_startofpacket                        : in  std_logic                      := 'X';             -- startofpacket
			pktin_valid                                : in  std_logic                      := 'X';             -- valid
			pktin_endofpacket                          : in  std_logic                      := 'X';             -- endofpacket
			pktin_data                                 : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- data
			pktin_empty                                : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- empty
			pktin_error                                : in  std_logic_vector(5 downto 0)   := (others => 'X'); -- error
			rx_dma_fifo_0_in_ts_valid                  : in  std_logic                      := 'X';             -- valid
			rx_dma_fifo_0_in_ts_data                   : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- data
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
			reset_reset_n                              : in  std_logic                      := 'X';             -- reset_n
			write_master_address                       : out std_logic_vector(36 downto 0);                     -- address
			write_master_write                         : out std_logic;                                         -- write
			write_master_byteenable                    : out std_logic_vector(15 downto 0);                     -- byteenable
			write_master_writedata                     : out std_logic_vector(127 downto 0);                    -- writedata
			write_master_waitrequest                   : in  std_logic                      := 'X';             -- waitrequest
			write_master_burstcount                    : out std_logic_vector(4 downto 0);                      -- burstcount
			write_master_response                      : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- response
			write_master_writeresponsevalid            : in  std_logic                      := 'X'              -- writeresponsevalid
		);
	end component subsys_ftile_25gbe_rx_dma;

	u0 : component subsys_ftile_25gbe_rx_dma
		port map (
			dma_clk_clk                                => CONNECTED_TO_dma_clk_clk,                                --                 dma_clk.clk
			csr_waitrequest                            => CONNECTED_TO_csr_waitrequest,                            --                     csr.waitrequest
			csr_readdata                               => CONNECTED_TO_csr_readdata,                               --                        .readdata
			csr_readdatavalid                          => CONNECTED_TO_csr_readdatavalid,                          --                        .readdatavalid
			csr_burstcount                             => CONNECTED_TO_csr_burstcount,                             --                        .burstcount
			csr_writedata                              => CONNECTED_TO_csr_writedata,                              --                        .writedata
			csr_address                                => CONNECTED_TO_csr_address,                                --                        .address
			csr_write                                  => CONNECTED_TO_csr_write,                                  --                        .write
			csr_read                                   => CONNECTED_TO_csr_read,                                   --                        .read
			csr_byteenable                             => CONNECTED_TO_csr_byteenable,                             --                        .byteenable
			csr_debugaccess                            => CONNECTED_TO_csr_debugaccess,                            --                        .debugaccess
			pktin_startofpacket                        => CONNECTED_TO_pktin_startofpacket,                        --                   pktin.startofpacket
			pktin_valid                                => CONNECTED_TO_pktin_valid,                                --                        .valid
			pktin_endofpacket                          => CONNECTED_TO_pktin_endofpacket,                          --                        .endofpacket
			pktin_data                                 => CONNECTED_TO_pktin_data,                                 --                        .data
			pktin_empty                                => CONNECTED_TO_pktin_empty,                                --                        .empty
			pktin_error                                => CONNECTED_TO_pktin_error,                                --                        .error
			rx_dma_fifo_0_in_ts_valid                  => CONNECTED_TO_rx_dma_fifo_0_in_ts_valid,                  --     rx_dma_fifo_0_in_ts.valid
			rx_dma_fifo_0_in_ts_data                   => CONNECTED_TO_rx_dma_fifo_0_in_ts_data,                   --                        .data
			ftile_clk_clk                              => CONNECTED_TO_ftile_clk_clk,                              --               ftile_clk.clk
			prefetcher_read_master_address             => CONNECTED_TO_prefetcher_read_master_address,             --  prefetcher_read_master.address
			prefetcher_read_master_read                => CONNECTED_TO_prefetcher_read_master_read,                --                        .read
			prefetcher_read_master_readdata            => CONNECTED_TO_prefetcher_read_master_readdata,            --                        .readdata
			prefetcher_read_master_waitrequest         => CONNECTED_TO_prefetcher_read_master_waitrequest,         --                        .waitrequest
			prefetcher_read_master_readdatavalid       => CONNECTED_TO_prefetcher_read_master_readdatavalid,       --                        .readdatavalid
			prefetcher_read_master_burstcount          => CONNECTED_TO_prefetcher_read_master_burstcount,          --                        .burstcount
			prefetcher_write_master_address            => CONNECTED_TO_prefetcher_write_master_address,            -- prefetcher_write_master.address
			prefetcher_write_master_write              => CONNECTED_TO_prefetcher_write_master_write,              --                        .write
			prefetcher_write_master_byteenable         => CONNECTED_TO_prefetcher_write_master_byteenable,         --                        .byteenable
			prefetcher_write_master_writedata          => CONNECTED_TO_prefetcher_write_master_writedata,          --                        .writedata
			prefetcher_write_master_waitrequest        => CONNECTED_TO_prefetcher_write_master_waitrequest,        --                        .waitrequest
			prefetcher_write_master_response           => CONNECTED_TO_prefetcher_write_master_response,           --                        .response
			prefetcher_write_master_writeresponsevalid => CONNECTED_TO_prefetcher_write_master_writeresponsevalid, --                        .writeresponsevalid
			irq_irq                                    => CONNECTED_TO_irq_irq,                                    --                     irq.irq
			reset_reset_n                              => CONNECTED_TO_reset_reset_n,                              --                   reset.reset_n
			write_master_address                       => CONNECTED_TO_write_master_address,                       --            write_master.address
			write_master_write                         => CONNECTED_TO_write_master_write,                         --                        .write
			write_master_byteenable                    => CONNECTED_TO_write_master_byteenable,                    --                        .byteenable
			write_master_writedata                     => CONNECTED_TO_write_master_writedata,                     --                        .writedata
			write_master_waitrequest                   => CONNECTED_TO_write_master_waitrequest,                   --                        .waitrequest
			write_master_burstcount                    => CONNECTED_TO_write_master_burstcount,                    --                        .burstcount
			write_master_response                      => CONNECTED_TO_write_master_response,                      --                        .response
			write_master_writeresponsevalid            => CONNECTED_TO_write_master_writeresponsevalid             --                        .writeresponsevalid
		);

