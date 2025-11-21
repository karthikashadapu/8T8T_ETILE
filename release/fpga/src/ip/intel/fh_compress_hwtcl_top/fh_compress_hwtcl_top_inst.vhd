	component fh_compress_hwtcl_top is
		port (
			tx_clk                       : in  std_logic                      := 'X';             -- clk
			rx_clk                       : in  std_logic                      := 'X';             -- clk
			csr_clk                      : in  std_logic                      := 'X';             -- clk
			tx_rst_n                     : in  std_logic                      := 'X';             -- reset
			rx_rst_n                     : in  std_logic                      := 'X';             -- reset
			csr_rst_n                    : in  std_logic                      := 'X';             -- reset
			csr_address                  : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- address
			csr_write                    : in  std_logic                      := 'X';             -- write
			csr_writedata                : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			csr_readdata                 : out std_logic_vector(31 downto 0);                     -- readdata
			csr_read                     : in  std_logic                      := 'X';             -- read
			csr_readdatavalid            : out std_logic;                                         -- readdatavalid
			csr_waitrequest              : out std_logic;                                         -- waitrequest
			irq                          : out std_logic;                                         -- irq
			tx_metadata_i                : in  std_logic_vector(127 downto 0) := (others => 'X'); -- tx_metadata_i
			tx_udcomphdr_i               : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- tx_udcomphdr_i
			comp_fs_offset               : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- comp_fs_offset
			rx_metadata_o                : out std_logic_vector(127 downto 0);                    -- rx_metadata_o
			rx_udcomphdr_o               : out std_logic_vector(7 downto 0);                      -- rx_udcomphdr_o
			rx_metadata_valid_o          : out std_logic;                                         -- rx_metadata_valid_o
			tx_metadata_o                : out std_logic_vector(127 downto 0);                    -- tx_metadata_o
			tx_udcomphdr_o               : out std_logic_vector(7 downto 0);                      -- tx_udcomphdr_o
			rx_metadata_i                : in  std_logic_vector(127 downto 0) := (others => 'X'); -- rx_metadata_i
			rx_udcomphdr_i               : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- rx_udcomphdr_i
			rx_metadata_valid_i          : in  std_logic                      := 'X';             -- rx_metadata_valid_i
			decomp_fs_offset             : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- decomp_fs_offset
			tx_avst_sink_valid           : in  std_logic                      := 'X';             -- valid
			tx_avst_sink_data            : in  std_logic_vector(127 downto 0) := (others => 'X'); -- data
			tx_avst_sink_startofpacket   : in  std_logic                      := 'X';             -- startofpacket
			tx_avst_sink_endofpacket     : in  std_logic                      := 'X';             -- endofpacket
			tx_avst_sink_ready           : out std_logic;                                         -- ready
			rx_avst_source_valid         : out std_logic;                                         -- valid
			rx_avst_source_data          : out std_logic_vector(127 downto 0);                    -- data
			rx_avst_source_startofpacket : out std_logic;                                         -- startofpacket
			rx_avst_source_endofpacket   : out std_logic;                                         -- endofpacket
			rx_avst_source_error         : out std_logic;                                         -- error
			tx_avst_source_valid         : out std_logic;                                         -- valid
			tx_avst_source_data          : out std_logic_vector(63 downto 0);                     -- data
			tx_avst_source_startofpacket : out std_logic;                                         -- startofpacket
			tx_avst_source_endofpacket   : out std_logic;                                         -- endofpacket
			tx_avst_source_ready         : in  std_logic                      := 'X';             -- ready
			tx_avst_source_empty         : out std_logic_vector(2 downto 0);                      -- empty
			rx_avst_sink_valid           : in  std_logic                      := 'X';             -- valid
			rx_avst_sink_data            : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- data
			rx_avst_sink_startofpacket   : in  std_logic                      := 'X';             -- startofpacket
			rx_avst_sink_endofpacket     : in  std_logic                      := 'X';             -- endofpacket
			rx_avst_sink_error           : in  std_logic                      := 'X'              -- error
		);
	end component fh_compress_hwtcl_top;

	u0 : component fh_compress_hwtcl_top
		port map (
			tx_clk                       => CONNECTED_TO_tx_clk,                       --         tx_clk.clk
			rx_clk                       => CONNECTED_TO_rx_clk,                       --         rx_clk.clk
			csr_clk                      => CONNECTED_TO_csr_clk,                      --        csr_clk.clk
			tx_rst_n                     => CONNECTED_TO_tx_rst_n,                     --       tx_rst_n.reset
			rx_rst_n                     => CONNECTED_TO_rx_rst_n,                     --       rx_rst_n.reset
			csr_rst_n                    => CONNECTED_TO_csr_rst_n,                    --      csr_rst_n.reset
			csr_address                  => CONNECTED_TO_csr_address,                  --   avalon_slave.address
			csr_write                    => CONNECTED_TO_csr_write,                    --               .write
			csr_writedata                => CONNECTED_TO_csr_writedata,                --               .writedata
			csr_readdata                 => CONNECTED_TO_csr_readdata,                 --               .readdata
			csr_read                     => CONNECTED_TO_csr_read,                     --               .read
			csr_readdatavalid            => CONNECTED_TO_csr_readdatavalid,            --               .readdatavalid
			csr_waitrequest              => CONNECTED_TO_csr_waitrequest,              --               .waitrequest
			irq                          => CONNECTED_TO_irq,                          --    conduit_end.irq
			tx_metadata_i                => CONNECTED_TO_tx_metadata_i,                --               .tx_metadata_i
			tx_udcomphdr_i               => CONNECTED_TO_tx_udcomphdr_i,               --               .tx_udcomphdr_i
			comp_fs_offset               => CONNECTED_TO_comp_fs_offset,               --               .comp_fs_offset
			rx_metadata_o                => CONNECTED_TO_rx_metadata_o,                --               .rx_metadata_o
			rx_udcomphdr_o               => CONNECTED_TO_rx_udcomphdr_o,               --               .rx_udcomphdr_o
			rx_metadata_valid_o          => CONNECTED_TO_rx_metadata_valid_o,          --               .rx_metadata_valid_o
			tx_metadata_o                => CONNECTED_TO_tx_metadata_o,                --               .tx_metadata_o
			tx_udcomphdr_o               => CONNECTED_TO_tx_udcomphdr_o,               --               .tx_udcomphdr_o
			rx_metadata_i                => CONNECTED_TO_rx_metadata_i,                --               .rx_metadata_i
			rx_udcomphdr_i               => CONNECTED_TO_rx_udcomphdr_i,               --               .rx_udcomphdr_i
			rx_metadata_valid_i          => CONNECTED_TO_rx_metadata_valid_i,          --               .rx_metadata_valid_i
			decomp_fs_offset             => CONNECTED_TO_decomp_fs_offset,             --               .decomp_fs_offset
			tx_avst_sink_valid           => CONNECTED_TO_tx_avst_sink_valid,           --   tx_avst_sink.valid
			tx_avst_sink_data            => CONNECTED_TO_tx_avst_sink_data,            --               .data
			tx_avst_sink_startofpacket   => CONNECTED_TO_tx_avst_sink_startofpacket,   --               .startofpacket
			tx_avst_sink_endofpacket     => CONNECTED_TO_tx_avst_sink_endofpacket,     --               .endofpacket
			tx_avst_sink_ready           => CONNECTED_TO_tx_avst_sink_ready,           --               .ready
			rx_avst_source_valid         => CONNECTED_TO_rx_avst_source_valid,         -- rx_avst_source.valid
			rx_avst_source_data          => CONNECTED_TO_rx_avst_source_data,          --               .data
			rx_avst_source_startofpacket => CONNECTED_TO_rx_avst_source_startofpacket, --               .startofpacket
			rx_avst_source_endofpacket   => CONNECTED_TO_rx_avst_source_endofpacket,   --               .endofpacket
			rx_avst_source_error         => CONNECTED_TO_rx_avst_source_error,         --               .error
			tx_avst_source_valid         => CONNECTED_TO_tx_avst_source_valid,         -- tx_avst_source.valid
			tx_avst_source_data          => CONNECTED_TO_tx_avst_source_data,          --               .data
			tx_avst_source_startofpacket => CONNECTED_TO_tx_avst_source_startofpacket, --               .startofpacket
			tx_avst_source_endofpacket   => CONNECTED_TO_tx_avst_source_endofpacket,   --               .endofpacket
			tx_avst_source_ready         => CONNECTED_TO_tx_avst_source_ready,         --               .ready
			tx_avst_source_empty         => CONNECTED_TO_tx_avst_source_empty,         --               .empty
			rx_avst_sink_valid           => CONNECTED_TO_rx_avst_sink_valid,           --   rx_avst_sink.valid
			rx_avst_sink_data            => CONNECTED_TO_rx_avst_sink_data,            --               .data
			rx_avst_sink_startofpacket   => CONNECTED_TO_rx_avst_sink_startofpacket,   --               .startofpacket
			rx_avst_sink_endofpacket     => CONNECTED_TO_rx_avst_sink_endofpacket,     --               .endofpacket
			rx_avst_sink_error           => CONNECTED_TO_rx_avst_sink_error            --               .error
		);

