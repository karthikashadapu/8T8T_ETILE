	component tx_dma_prefetcher is
		generic (
			ADDRESS_WIDTH            : integer := 37;
			RESPONSE_FIFO_DEPTH      : integer := 256;
			RESPONSE_FIFO_DEPTH_LOG2 : integer := 8
		);
		port (
			clk                         : in  std_logic                      := 'X';             -- clk
			reset                       : in  std_logic                      := 'X';             -- reset
			mm_read_address             : out std_logic_vector(36 downto 0);                     -- address
			mm_read_read                : out std_logic;                                         -- read
			mm_read_readdata            : in  std_logic_vector(127 downto 0) := (others => 'X'); -- readdata
			mm_read_waitrequest         : in  std_logic                      := 'X';             -- waitrequest
			mm_read_readdatavalid       : in  std_logic                      := 'X';             -- readdatavalid
			mm_read_burstcount          : out std_logic_vector(2 downto 0);                      -- burstcount
			mm_write_address            : out std_logic_vector(36 downto 0);                     -- address
			mm_write_write              : out std_logic;                                         -- write
			mm_write_byteenable         : out std_logic_vector(15 downto 0);                     -- byteenable
			mm_write_writedata          : out std_logic_vector(127 downto 0);                    -- writedata
			mm_write_waitrequest        : in  std_logic                      := 'X';             -- waitrequest
			mm_write_response           : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- response
			mm_write_writeresponsevalid : in  std_logic                      := 'X';             -- writeresponsevalid
			st_src_descr_data           : out std_logic_vector(255 downto 0);                    -- data
			st_src_descr_valid          : out std_logic;                                         -- valid
			st_src_descr_ready          : in  std_logic                      := 'X';             -- ready
			st_snk_data                 : in  std_logic_vector(255 downto 0) := (others => 'X'); -- data
			st_snk_valid                : in  std_logic                      := 'X';             -- valid
			st_snk_ready                : out std_logic;                                         -- ready
			mm_csr_address              : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- address
			mm_csr_read                 : in  std_logic                      := 'X';             -- read
			mm_csr_write                : in  std_logic                      := 'X';             -- write
			mm_csr_writedata            : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			mm_csr_readdata             : out std_logic_vector(31 downto 0);                     -- readdata
			csr_irq                     : out std_logic                                          -- irq
		);
	end component tx_dma_prefetcher;

	u0 : component tx_dma_prefetcher
		generic map (
			ADDRESS_WIDTH            => INTEGER_VALUE_FOR_ADDRESS_WIDTH,
			RESPONSE_FIFO_DEPTH      => INTEGER_VALUE_FOR_RESPONSE_FIFO_DEPTH,
			RESPONSE_FIFO_DEPTH_LOG2 => INTEGER_VALUE_FOR_RESPONSE_FIFO_DEPTH_LOG2
		)
		port map (
			clk                         => CONNECTED_TO_clk,                         --                              Clock.clk
			reset                       => CONNECTED_TO_reset,                       --                        Clock_reset.reset
			mm_read_address             => CONNECTED_TO_mm_read_address,             --             Descriptor_Read_Master.address
			mm_read_read                => CONNECTED_TO_mm_read_read,                --                                   .read
			mm_read_readdata            => CONNECTED_TO_mm_read_readdata,            --                                   .readdata
			mm_read_waitrequest         => CONNECTED_TO_mm_read_waitrequest,         --                                   .waitrequest
			mm_read_readdatavalid       => CONNECTED_TO_mm_read_readdatavalid,       --                                   .readdatavalid
			mm_read_burstcount          => CONNECTED_TO_mm_read_burstcount,          --                                   .burstcount
			mm_write_address            => CONNECTED_TO_mm_write_address,            --            Descriptor_Write_Master.address
			mm_write_write              => CONNECTED_TO_mm_write_write,              --                                   .write
			mm_write_byteenable         => CONNECTED_TO_mm_write_byteenable,         --                                   .byteenable
			mm_write_writedata          => CONNECTED_TO_mm_write_writedata,          --                                   .writedata
			mm_write_waitrequest        => CONNECTED_TO_mm_write_waitrequest,        --                                   .waitrequest
			mm_write_response           => CONNECTED_TO_mm_write_response,           --                                   .response
			mm_write_writeresponsevalid => CONNECTED_TO_mm_write_writeresponsevalid, --                                   .writeresponsevalid
			st_src_descr_data           => CONNECTED_TO_st_src_descr_data,           -- Descriptor_Write_Dispatcher_Source.data
			st_src_descr_valid          => CONNECTED_TO_st_src_descr_valid,          --                                   .valid
			st_src_descr_ready          => CONNECTED_TO_st_src_descr_ready,          --                                   .ready
			st_snk_data                 => CONNECTED_TO_st_snk_data,                 --                      Response_Sink.data
			st_snk_valid                => CONNECTED_TO_st_snk_valid,                --                                   .valid
			st_snk_ready                => CONNECTED_TO_st_snk_ready,                --                                   .ready
			mm_csr_address              => CONNECTED_TO_mm_csr_address,              --                                Csr.address
			mm_csr_read                 => CONNECTED_TO_mm_csr_read,                 --                                   .read
			mm_csr_write                => CONNECTED_TO_mm_csr_write,                --                                   .write
			mm_csr_writedata            => CONNECTED_TO_mm_csr_writedata,            --                                   .writedata
			mm_csr_readdata             => CONNECTED_TO_mm_csr_readdata,             --                                   .readdata
			csr_irq                     => CONNECTED_TO_csr_irq                      --                            Csr_Irq.irq
		);

