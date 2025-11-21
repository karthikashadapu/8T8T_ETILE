	component subsys_ftile_25gbe_1588 is
		generic (
			FP_WIDTH : integer := 8
		);
		port (
			rx_dma_resetn                                               : in  std_logic                      := 'X';             -- reset_n
			csr_waitrequest                                             : out std_logic;                                         -- waitrequest
			csr_readdata                                                : out std_logic_vector(31 downto 0);                     -- readdata
			csr_readdatavalid                                           : out std_logic;                                         -- readdatavalid
			csr_burstcount                                              : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			csr_writedata                                               : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			csr_address                                                 : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- address
			csr_write                                                   : in  std_logic                      := 'X';             -- write
			csr_read                                                    : in  std_logic                      := 'X';             -- read
			csr_byteenable                                              : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			csr_debugaccess                                             : in  std_logic                      := 'X';             -- debugaccess
			clk_clk                                                     : in  std_logic                      := 'X';             -- clk
			subsys_ftile_25gbe_1588_dmaclkout_in_clk_clk                : in  std_logic                      := 'X';             -- clk
			subsys_ftile_25gbe_1588_o_pll_clk_in_clk_clk                : in  std_logic                      := 'X';             -- clk
			reset_reset_n                                               : in  std_logic                      := 'X';             -- reset_n
			ftile_25gbe_rx_dma_ch1_pktin_startofpacket                  : in  std_logic                      := 'X';             -- startofpacket
			ftile_25gbe_rx_dma_ch1_pktin_valid                          : in  std_logic                      := 'X';             -- valid
			ftile_25gbe_rx_dma_ch1_pktin_endofpacket                    : in  std_logic                      := 'X';             -- endofpacket
			ftile_25gbe_rx_dma_ch1_pktin_data                           : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- data
			ftile_25gbe_rx_dma_ch1_pktin_empty                          : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- empty
			ftile_25gbe_rx_dma_ch1_pktin_error                          : in  std_logic_vector(5 downto 0)   := (others => 'X'); -- error
			ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_valid            : in  std_logic                      := 'X';             -- valid
			ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_data             : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- data
			rx_dma_ch1_prefetcher_read_master_address                   : out std_logic_vector(36 downto 0);                     -- address
			rx_dma_ch1_prefetcher_read_master_read                      : out std_logic;                                         -- read
			rx_dma_ch1_prefetcher_read_master_readdata                  : in  std_logic_vector(127 downto 0) := (others => 'X'); -- readdata
			rx_dma_ch1_prefetcher_read_master_waitrequest               : in  std_logic                      := 'X';             -- waitrequest
			rx_dma_ch1_prefetcher_read_master_readdatavalid             : in  std_logic                      := 'X';             -- readdatavalid
			rx_dma_ch1_prefetcher_read_master_burstcount                : out std_logic_vector(2 downto 0);                      -- burstcount
			rx_dma_ch1_prefetcher_write_master_address                  : out std_logic_vector(36 downto 0);                     -- address
			rx_dma_ch1_prefetcher_write_master_write                    : out std_logic;                                         -- write
			rx_dma_ch1_prefetcher_write_master_byteenable               : out std_logic_vector(15 downto 0);                     -- byteenable
			rx_dma_ch1_prefetcher_write_master_writedata                : out std_logic_vector(127 downto 0);                    -- writedata
			rx_dma_ch1_prefetcher_write_master_waitrequest              : in  std_logic                      := 'X';             -- waitrequest
			rx_dma_ch1_prefetcher_write_master_response                 : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- response
			rx_dma_ch1_prefetcher_write_master_writeresponsevalid       : in  std_logic                      := 'X';             -- writeresponsevalid
			rx_dma_ch1_irq_irq                                          : out std_logic;                                         -- irq
			rx_dma_ch1_write_master_address                             : out std_logic_vector(36 downto 0);                     -- address
			rx_dma_ch1_write_master_write                               : out std_logic;                                         -- write
			rx_dma_ch1_write_master_byteenable                          : out std_logic_vector(15 downto 0);                     -- byteenable
			rx_dma_ch1_write_master_writedata                           : out std_logic_vector(127 downto 0);                    -- writedata
			rx_dma_ch1_write_master_waitrequest                         : in  std_logic                      := 'X';             -- waitrequest
			rx_dma_ch1_write_master_burstcount                          : out std_logic_vector(4 downto 0);                      -- burstcount
			rx_dma_ch1_write_master_response                            : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- response
			rx_dma_ch1_write_master_writeresponsevalid                  : in  std_logic                      := 'X';             -- writeresponsevalid
			ts_chs_compl_0_clk_bus_in_clk                               : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- clk
			ts_chs_compl_0_rst_bus_in_reset                             : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- reset
			ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_valid            : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- valid
			ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_fingerprint      : in  std_logic_vector(19 downto 0)  := (others => 'X'); -- fingerprint
			ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_data             : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- data
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_ready           : in  std_logic                      := 'X';             -- ready
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_startofpacket   : out std_logic;                                         -- startofpacket
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_valid           : out std_logic;                                         -- valid
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_endofpacket     : out std_logic;                                         -- endofpacket
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_data            : out std_logic_vector(63 downto 0);                     -- data
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_empty           : out std_logic_vector(2 downto 0);                      -- empty
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_error           : out std_logic_vector(0 downto 0);                      -- error
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_valid       : out std_logic;                                         -- valid
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_fingerprint : out std_logic_vector(19 downto 0);                     -- fingerprint
			tx_dma_ch1_prefetcher_read_master_address                   : out std_logic_vector(36 downto 0);                     -- address
			tx_dma_ch1_prefetcher_read_master_read                      : out std_logic;                                         -- read
			tx_dma_ch1_prefetcher_read_master_readdata                  : in  std_logic_vector(127 downto 0) := (others => 'X'); -- readdata
			tx_dma_ch1_prefetcher_read_master_waitrequest               : in  std_logic                      := 'X';             -- waitrequest
			tx_dma_ch1_prefetcher_read_master_readdatavalid             : in  std_logic                      := 'X';             -- readdatavalid
			tx_dma_ch1_prefetcher_read_master_burstcount                : out std_logic_vector(2 downto 0);                      -- burstcount
			tx_dma_ch1_prefetcher_write_master_address                  : out std_logic_vector(36 downto 0);                     -- address
			tx_dma_ch1_prefetcher_write_master_write                    : out std_logic;                                         -- write
			tx_dma_ch1_prefetcher_write_master_byteenable               : out std_logic_vector(15 downto 0);                     -- byteenable
			tx_dma_ch1_prefetcher_write_master_writedata                : out std_logic_vector(127 downto 0);                    -- writedata
			tx_dma_ch1_prefetcher_write_master_waitrequest              : in  std_logic                      := 'X';             -- waitrequest
			tx_dma_ch1_prefetcher_write_master_response                 : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- response
			tx_dma_ch1_prefetcher_write_master_writeresponsevalid       : in  std_logic                      := 'X';             -- writeresponsevalid
			tx_dma_ch1_irq_irq                                          : out std_logic;                                         -- irq
			tx_dma_ch1_read_master_address                              : out std_logic_vector(36 downto 0);                     -- address
			tx_dma_ch1_read_master_read                                 : out std_logic;                                         -- read
			tx_dma_ch1_read_master_byteenable                           : out std_logic_vector(15 downto 0);                     -- byteenable
			tx_dma_ch1_read_master_readdata                             : in  std_logic_vector(127 downto 0) := (others => 'X'); -- readdata
			tx_dma_ch1_read_master_waitrequest                          : in  std_logic                      := 'X';             -- waitrequest
			tx_dma_ch1_read_master_readdatavalid                        : in  std_logic                      := 'X';             -- readdatavalid
			tx_dma_ch1_read_master_burstcount                           : out std_logic_vector(4 downto 0)                       -- burstcount
		);
	end component subsys_ftile_25gbe_1588;

	u0 : component subsys_ftile_25gbe_1588
		generic map (
			FP_WIDTH => INTEGER_VALUE_FOR_FP_WIDTH
		)
		port map (
			rx_dma_resetn                                               => CONNECTED_TO_rx_dma_resetn,                                               --                                   rx_dma_resetn.reset_n
			csr_waitrequest                                             => CONNECTED_TO_csr_waitrequest,                                             --                                             csr.waitrequest
			csr_readdata                                                => CONNECTED_TO_csr_readdata,                                                --                                                .readdata
			csr_readdatavalid                                           => CONNECTED_TO_csr_readdatavalid,                                           --                                                .readdatavalid
			csr_burstcount                                              => CONNECTED_TO_csr_burstcount,                                              --                                                .burstcount
			csr_writedata                                               => CONNECTED_TO_csr_writedata,                                               --                                                .writedata
			csr_address                                                 => CONNECTED_TO_csr_address,                                                 --                                                .address
			csr_write                                                   => CONNECTED_TO_csr_write,                                                   --                                                .write
			csr_read                                                    => CONNECTED_TO_csr_read,                                                    --                                                .read
			csr_byteenable                                              => CONNECTED_TO_csr_byteenable,                                              --                                                .byteenable
			csr_debugaccess                                             => CONNECTED_TO_csr_debugaccess,                                             --                                                .debugaccess
			clk_clk                                                     => CONNECTED_TO_clk_clk,                                                     --                                             clk.clk
			subsys_ftile_25gbe_1588_dmaclkout_in_clk_clk                => CONNECTED_TO_subsys_ftile_25gbe_1588_dmaclkout_in_clk_clk,                --        subsys_ftile_25gbe_1588_dmaclkout_in_clk.clk
			subsys_ftile_25gbe_1588_o_pll_clk_in_clk_clk                => CONNECTED_TO_subsys_ftile_25gbe_1588_o_pll_clk_in_clk_clk,                --        subsys_ftile_25gbe_1588_o_pll_clk_in_clk.clk
			reset_reset_n                                               => CONNECTED_TO_reset_reset_n,                                               --                                           reset.reset_n
			ftile_25gbe_rx_dma_ch1_pktin_startofpacket                  => CONNECTED_TO_ftile_25gbe_rx_dma_ch1_pktin_startofpacket,                  --                    ftile_25gbe_rx_dma_ch1_pktin.startofpacket
			ftile_25gbe_rx_dma_ch1_pktin_valid                          => CONNECTED_TO_ftile_25gbe_rx_dma_ch1_pktin_valid,                          --                                                .valid
			ftile_25gbe_rx_dma_ch1_pktin_endofpacket                    => CONNECTED_TO_ftile_25gbe_rx_dma_ch1_pktin_endofpacket,                    --                                                .endofpacket
			ftile_25gbe_rx_dma_ch1_pktin_data                           => CONNECTED_TO_ftile_25gbe_rx_dma_ch1_pktin_data,                           --                                                .data
			ftile_25gbe_rx_dma_ch1_pktin_empty                          => CONNECTED_TO_ftile_25gbe_rx_dma_ch1_pktin_empty,                          --                                                .empty
			ftile_25gbe_rx_dma_ch1_pktin_error                          => CONNECTED_TO_ftile_25gbe_rx_dma_ch1_pktin_error,                          --                                                .error
			ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_valid            => CONNECTED_TO_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_valid,            --      ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts.valid
			ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_data             => CONNECTED_TO_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_data,             --                                                .data
			rx_dma_ch1_prefetcher_read_master_address                   => CONNECTED_TO_rx_dma_ch1_prefetcher_read_master_address,                   --               rx_dma_ch1_prefetcher_read_master.address
			rx_dma_ch1_prefetcher_read_master_read                      => CONNECTED_TO_rx_dma_ch1_prefetcher_read_master_read,                      --                                                .read
			rx_dma_ch1_prefetcher_read_master_readdata                  => CONNECTED_TO_rx_dma_ch1_prefetcher_read_master_readdata,                  --                                                .readdata
			rx_dma_ch1_prefetcher_read_master_waitrequest               => CONNECTED_TO_rx_dma_ch1_prefetcher_read_master_waitrequest,               --                                                .waitrequest
			rx_dma_ch1_prefetcher_read_master_readdatavalid             => CONNECTED_TO_rx_dma_ch1_prefetcher_read_master_readdatavalid,             --                                                .readdatavalid
			rx_dma_ch1_prefetcher_read_master_burstcount                => CONNECTED_TO_rx_dma_ch1_prefetcher_read_master_burstcount,                --                                                .burstcount
			rx_dma_ch1_prefetcher_write_master_address                  => CONNECTED_TO_rx_dma_ch1_prefetcher_write_master_address,                  --              rx_dma_ch1_prefetcher_write_master.address
			rx_dma_ch1_prefetcher_write_master_write                    => CONNECTED_TO_rx_dma_ch1_prefetcher_write_master_write,                    --                                                .write
			rx_dma_ch1_prefetcher_write_master_byteenable               => CONNECTED_TO_rx_dma_ch1_prefetcher_write_master_byteenable,               --                                                .byteenable
			rx_dma_ch1_prefetcher_write_master_writedata                => CONNECTED_TO_rx_dma_ch1_prefetcher_write_master_writedata,                --                                                .writedata
			rx_dma_ch1_prefetcher_write_master_waitrequest              => CONNECTED_TO_rx_dma_ch1_prefetcher_write_master_waitrequest,              --                                                .waitrequest
			rx_dma_ch1_prefetcher_write_master_response                 => CONNECTED_TO_rx_dma_ch1_prefetcher_write_master_response,                 --                                                .response
			rx_dma_ch1_prefetcher_write_master_writeresponsevalid       => CONNECTED_TO_rx_dma_ch1_prefetcher_write_master_writeresponsevalid,       --                                                .writeresponsevalid
			rx_dma_ch1_irq_irq                                          => CONNECTED_TO_rx_dma_ch1_irq_irq,                                          --                                  rx_dma_ch1_irq.irq
			rx_dma_ch1_write_master_address                             => CONNECTED_TO_rx_dma_ch1_write_master_address,                             --                         rx_dma_ch1_write_master.address
			rx_dma_ch1_write_master_write                               => CONNECTED_TO_rx_dma_ch1_write_master_write,                               --                                                .write
			rx_dma_ch1_write_master_byteenable                          => CONNECTED_TO_rx_dma_ch1_write_master_byteenable,                          --                                                .byteenable
			rx_dma_ch1_write_master_writedata                           => CONNECTED_TO_rx_dma_ch1_write_master_writedata,                           --                                                .writedata
			rx_dma_ch1_write_master_waitrequest                         => CONNECTED_TO_rx_dma_ch1_write_master_waitrequest,                         --                                                .waitrequest
			rx_dma_ch1_write_master_burstcount                          => CONNECTED_TO_rx_dma_ch1_write_master_burstcount,                          --                                                .burstcount
			rx_dma_ch1_write_master_response                            => CONNECTED_TO_rx_dma_ch1_write_master_response,                            --                                                .response
			rx_dma_ch1_write_master_writeresponsevalid                  => CONNECTED_TO_rx_dma_ch1_write_master_writeresponsevalid,                  --                                                .writeresponsevalid
			ts_chs_compl_0_clk_bus_in_clk                               => CONNECTED_TO_ts_chs_compl_0_clk_bus_in_clk,                               --                       ts_chs_compl_0_clk_bus_in.clk
			ts_chs_compl_0_rst_bus_in_reset                             => CONNECTED_TO_ts_chs_compl_0_rst_bus_in_reset,                             --                       ts_chs_compl_0_rst_bus_in.reset
			ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_valid            => CONNECTED_TO_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_valid,            --      ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts.valid
			ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_fingerprint      => CONNECTED_TO_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_fingerprint,      --                                                .fingerprint
			ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_data             => CONNECTED_TO_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_data,             --                                                .data
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_ready           => CONNECTED_TO_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_ready,           --     ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st.ready
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_startofpacket   => CONNECTED_TO_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_startofpacket,   --                                                .startofpacket
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_valid           => CONNECTED_TO_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_valid,           --                                                .valid
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_endofpacket     => CONNECTED_TO_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_endofpacket,     --                                                .endofpacket
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_data            => CONNECTED_TO_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_data,            --                                                .data
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_empty           => CONNECTED_TO_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_empty,           --                                                .empty
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_error           => CONNECTED_TO_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_error,           --                                                .error
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_valid       => CONNECTED_TO_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_valid,       -- ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req.valid
			ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_fingerprint => CONNECTED_TO_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_fingerprint, --                                                .fingerprint
			tx_dma_ch1_prefetcher_read_master_address                   => CONNECTED_TO_tx_dma_ch1_prefetcher_read_master_address,                   --               tx_dma_ch1_prefetcher_read_master.address
			tx_dma_ch1_prefetcher_read_master_read                      => CONNECTED_TO_tx_dma_ch1_prefetcher_read_master_read,                      --                                                .read
			tx_dma_ch1_prefetcher_read_master_readdata                  => CONNECTED_TO_tx_dma_ch1_prefetcher_read_master_readdata,                  --                                                .readdata
			tx_dma_ch1_prefetcher_read_master_waitrequest               => CONNECTED_TO_tx_dma_ch1_prefetcher_read_master_waitrequest,               --                                                .waitrequest
			tx_dma_ch1_prefetcher_read_master_readdatavalid             => CONNECTED_TO_tx_dma_ch1_prefetcher_read_master_readdatavalid,             --                                                .readdatavalid
			tx_dma_ch1_prefetcher_read_master_burstcount                => CONNECTED_TO_tx_dma_ch1_prefetcher_read_master_burstcount,                --                                                .burstcount
			tx_dma_ch1_prefetcher_write_master_address                  => CONNECTED_TO_tx_dma_ch1_prefetcher_write_master_address,                  --              tx_dma_ch1_prefetcher_write_master.address
			tx_dma_ch1_prefetcher_write_master_write                    => CONNECTED_TO_tx_dma_ch1_prefetcher_write_master_write,                    --                                                .write
			tx_dma_ch1_prefetcher_write_master_byteenable               => CONNECTED_TO_tx_dma_ch1_prefetcher_write_master_byteenable,               --                                                .byteenable
			tx_dma_ch1_prefetcher_write_master_writedata                => CONNECTED_TO_tx_dma_ch1_prefetcher_write_master_writedata,                --                                                .writedata
			tx_dma_ch1_prefetcher_write_master_waitrequest              => CONNECTED_TO_tx_dma_ch1_prefetcher_write_master_waitrequest,              --                                                .waitrequest
			tx_dma_ch1_prefetcher_write_master_response                 => CONNECTED_TO_tx_dma_ch1_prefetcher_write_master_response,                 --                                                .response
			tx_dma_ch1_prefetcher_write_master_writeresponsevalid       => CONNECTED_TO_tx_dma_ch1_prefetcher_write_master_writeresponsevalid,       --                                                .writeresponsevalid
			tx_dma_ch1_irq_irq                                          => CONNECTED_TO_tx_dma_ch1_irq_irq,                                          --                                  tx_dma_ch1_irq.irq
			tx_dma_ch1_read_master_address                              => CONNECTED_TO_tx_dma_ch1_read_master_address,                              --                          tx_dma_ch1_read_master.address
			tx_dma_ch1_read_master_read                                 => CONNECTED_TO_tx_dma_ch1_read_master_read,                                 --                                                .read
			tx_dma_ch1_read_master_byteenable                           => CONNECTED_TO_tx_dma_ch1_read_master_byteenable,                           --                                                .byteenable
			tx_dma_ch1_read_master_readdata                             => CONNECTED_TO_tx_dma_ch1_read_master_readdata,                             --                                                .readdata
			tx_dma_ch1_read_master_waitrequest                          => CONNECTED_TO_tx_dma_ch1_read_master_waitrequest,                          --                                                .waitrequest
			tx_dma_ch1_read_master_readdatavalid                        => CONNECTED_TO_tx_dma_ch1_read_master_readdatavalid,                        --                                                .readdatavalid
			tx_dma_ch1_read_master_burstcount                           => CONNECTED_TO_tx_dma_ch1_read_master_burstcount                            --                                                .burstcount
		);

