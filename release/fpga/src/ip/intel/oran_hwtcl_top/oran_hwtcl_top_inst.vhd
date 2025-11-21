	component oran_hwtcl_top is
		port (
			clk_tx                          : in  std_logic                     := 'X';             -- clk
			clk_rx                          : in  std_logic                     := 'X';             -- clk
			clk_csr                         : in  std_logic                     := 'X';             -- clk
			rst_tx_n                        : in  std_logic                     := 'X';             -- reset_n
			rst_rx_n                        : in  std_logic                     := 'X';             -- reset_n
			rst_csr_n                       : in  std_logic                     := 'X';             -- reset_n
			avst_sink_u_valid               : in  std_logic                     := 'X';             -- valid
			avst_sink_u_data                : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			avst_sink_u_startofpacket       : in  std_logic                     := 'X';             -- startofpacket
			avst_sink_u_endofpacket         : in  std_logic                     := 'X';             -- endofpacket
			avst_sink_u_ready               : out std_logic;                                        -- ready
			avst_sink_u_empty               : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- empty
			avst_sink_c_valid               : in  std_logic                     := 'X';             -- valid
			avst_sink_c_startofpacket       : in  std_logic                     := 'X';             -- startofpacket
			avst_sink_c_endofpacket         : in  std_logic                     := 'X';             -- endofpacket
			avst_sink_c_ready               : out std_logic;                                        -- ready
			avst_sink_c_ext_valid           : in  std_logic                     := 'X';             -- valid
			avst_sink_c_ext_data            : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			avst_sink_c_ext_startofpacket   : in  std_logic                     := 'X';             -- startofpacket
			avst_sink_c_ext_endofpacket     : in  std_logic                     := 'X';             -- endofpacket
			avst_sink_c_ext_empty           : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- empty
			avst_sink_c_ext_ready           : out std_logic;                                        -- ready
			avst_source_valid               : out std_logic;                                        -- valid
			avst_source_data                : out std_logic_vector(63 downto 0);                    -- data
			avst_source_startofpacket       : out std_logic;                                        -- startofpacket
			avst_source_endofpacket         : out std_logic;                                        -- endofpacket
			avst_source_empty               : out std_logic_vector(2 downto 0);                     -- empty
			avst_source_ready               : in  std_logic                     := 'X';             -- ready
			avst_source_u_valid             : out std_logic;                                        -- valid
			avst_source_u_data              : out std_logic_vector(63 downto 0);                    -- data
			avst_source_u_startofpacket     : out std_logic;                                        -- startofpacket
			avst_source_u_endofpacket       : out std_logic;                                        -- endofpacket
			avst_source_u_empty             : out std_logic_vector(2 downto 0);                     -- empty
			avst_source_u_error             : out std_logic;                                        -- error
			avst_source_c_valid             : out std_logic;                                        -- valid
			avst_source_c_startofpacket     : out std_logic;                                        -- startofpacket
			avst_source_c_endofpacket       : out std_logic;                                        -- endofpacket
			avst_source_c_error             : out std_logic;                                        -- error
			avst_source_c_ext_valid         : out std_logic;                                        -- valid
			avst_source_c_ext_data          : out std_logic_vector(63 downto 0);                    -- data
			avst_source_c_ext_startofpacket : out std_logic;                                        -- startofpacket
			avst_source_c_ext_endofpacket   : out std_logic;                                        -- endofpacket
			avst_source_c_ext_empty         : out std_logic_vector(2 downto 0);                     -- empty
			avst_source_c_ext_error         : out std_logic;                                        -- error
			avst_sink_valid                 : in  std_logic                     := 'X';             -- valid
			avst_sink_data                  : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			avst_sink_startofpacket         : in  std_logic                     := 'X';             -- startofpacket
			avst_sink_endofpacket           : in  std_logic                     := 'X';             -- endofpacket
			avst_sink_empty                 : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- empty
			avst_sink_error                 : in  std_logic                     := 'X';             -- error
			csr_address                     : in  std_logic_vector(15 downto 0) := (others => 'X'); -- address
			csr_write                       : in  std_logic                     := 'X';             -- write
			csr_writedata                   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			csr_readdata                    : out std_logic_vector(31 downto 0);                    -- readdata
			csr_read                        : in  std_logic                     := 'X';             -- read
			csr_readdatavalid               : out std_logic;                                        -- readdatavalid
			csr_waitrequest                 : out std_logic;                                        -- waitrequest
			irq                             : out std_logic;                                        -- irq
			tx_c_size                       : in  std_logic_vector(15 downto 0) := (others => 'X'); -- tx_c_size
			tx_c_dataDirection              : in  std_logic                     := 'X';             -- tx_c_dataDirection
			tx_c_filterIndex                : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- tx_c_filterIndex
			tx_c_frameId                    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- tx_c_frameId
			tx_c_subframeId                 : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- tx_c_subframeId
			tx_c_slotID                     : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- tx_c_slotID
			tx_c_symbolid                   : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- tx_c_symbolid
			tx_c_sectionId                  : in  std_logic_vector(11 downto 0) := (others => 'X'); -- tx_c_sectionId
			tx_c_rb                         : in  std_logic                     := 'X';             -- tx_c_rb
			tx_c_startPrb                   : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- tx_c_startPrb
			tx_c_numPrb                     : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- tx_c_numPrb
			tx_c_udCompHdr                  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- tx_c_udCompHdr
			tx_sectionType                  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- tx_sectionType
			tx_ext_sectionType              : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- tx_ext_sectionType
			tx_timeOffset                   : in  std_logic_vector(15 downto 0) := (others => 'X'); -- tx_timeOffset
			tx_frameStructure               : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- tx_frameStructure
			tx_cpLength                     : in  std_logic_vector(15 downto 0) := (others => 'X'); -- tx_cpLength
			tx_reMask                       : in  std_logic_vector(11 downto 0) := (others => 'X'); -- tx_reMask
			tx_numSymbol                    : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- tx_numSymbol
			tx_ef                           : in  std_logic                     := 'X';             -- tx_ef
			tx_frequencyOffset              : in  std_logic_vector(23 downto 0) := (others => 'X'); -- tx_frequencyOffset
			tx_beamid                       : in  std_logic_vector(14 downto 0) := (others => 'X'); -- tx_beamid
			tx_u_prbusize                   : in  std_logic_vector(15 downto 0) := (others => 'X'); -- tx_u_prbusize
			tx_u_numberofsection            : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- tx_u_numberofsection
			tx_u_dataDirection              : in  std_logic                     := 'X';             -- tx_u_dataDirection
			tx_u_filterIndex                : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- tx_u_filterIndex
			tx_u_frameId                    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- tx_u_frameId
			tx_u_subframeId                 : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- tx_u_subframeId
			tx_u_slotID                     : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- tx_u_slotID
			tx_u_symbolid                   : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- tx_u_symbolid
			tx_u_sectionId                  : in  std_logic_vector(11 downto 0) := (others => 'X'); -- tx_u_sectionId
			tx_u_rb                         : in  std_logic                     := 'X';             -- tx_u_rb
			tx_u_startPrb                   : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- tx_u_startPrb
			tx_u_numPrb                     : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- tx_u_numPrb
			tx_u_udCompHdr                  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- tx_u_udCompHdr
			ext_scs_sel                     : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- ext_scs_sel
			tx_transport_c_u                : out std_logic;                                        -- tx_transport_c_u
			tx_time_of_day_96b              : in  std_logic_vector(95 downto 0) := (others => 'X'); -- tx_time_of_day_96b
			rx_c_dataDirection              : out std_logic;                                        -- rx_c_dataDirection
			rx_c_filterIndex                : out std_logic_vector(3 downto 0);                     -- rx_c_filterIndex
			rx_c_frameId                    : out std_logic_vector(7 downto 0);                     -- rx_c_frameId
			rx_c_subframeId                 : out std_logic_vector(3 downto 0);                     -- rx_c_subframeId
			rx_c_slotID                     : out std_logic_vector(5 downto 0);                     -- rx_c_slotID
			rx_c_symbolid                   : out std_logic_vector(5 downto 0);                     -- rx_c_symbolid
			rx_c_numberOfsections           : out std_logic_vector(7 downto 0);                     -- rx_c_numberOfsections
			rx_c_sectionId                  : out std_logic_vector(11 downto 0);                    -- rx_c_sectionId
			rx_c_rb                         : out std_logic;                                        -- rx_c_rb
			rx_c_symInc                     : out std_logic;                                        -- rx_c_symInc
			rx_c_startPrb                   : out std_logic_vector(9 downto 0);                     -- rx_c_startPrb
			rx_c_numPrb                     : out std_logic_vector(7 downto 0);                     -- rx_c_numPrb
			rx_c_udCompHdr                  : out std_logic_vector(7 downto 0);                     -- rx_c_udCompHdr
			rx_sec_hdr_valid                : out std_logic;                                        -- rx_sec_hdr_valid
			rx_sectionType                  : out std_logic_vector(7 downto 0);                     -- rx_sectionType
			rx_ext_sectionType              : out std_logic_vector(7 downto 0);                     -- rx_ext_sectionType
			rx_timeOffset                   : out std_logic_vector(15 downto 0);                    -- rx_timeOffset
			rx_frameStructure               : out std_logic_vector(7 downto 0);                     -- rx_frameStructure
			rx_cpLength                     : out std_logic_vector(15 downto 0);                    -- rx_cpLength
			rx_reMask                       : out std_logic_vector(11 downto 0);                    -- rx_reMask
			rx_numSymbol                    : out std_logic_vector(3 downto 0);                     -- rx_numSymbol
			rx_frequencyOffset              : out std_logic_vector(23 downto 0);                    -- rx_frequencyOffset
			rx_ef                           : out std_logic;                                        -- rx_ef
			rx_beamid                       : out std_logic_vector(14 downto 0);                    -- rx_beamid
			rx_u_dataDirection              : out std_logic;                                        -- rx_u_dataDirection
			rx_u_filterIndex                : out std_logic_vector(3 downto 0);                     -- rx_u_filterIndex
			rx_u_frameId                    : out std_logic_vector(7 downto 0);                     -- rx_u_frameId
			rx_u_subframeId                 : out std_logic_vector(3 downto 0);                     -- rx_u_subframeId
			rx_u_slotID                     : out std_logic_vector(5 downto 0);                     -- rx_u_slotID
			rx_u_symbolid                   : out std_logic_vector(5 downto 0);                     -- rx_u_symbolid
			rx_u_sectionId                  : out std_logic_vector(11 downto 0);                    -- rx_u_sectionId
			rx_u_rb                         : out std_logic;                                        -- rx_u_rb
			rx_u_startPrb                   : out std_logic_vector(9 downto 0);                     -- rx_u_startPrb
			rx_u_numPrb                     : out std_logic_vector(7 downto 0);                     -- rx_u_numPrb
			rx_u_udCompHdr                  : out std_logic_vector(7 downto 0);                     -- rx_u_udCompHdr
			rx_transport_c_u                : in  std_logic                     := 'X';             -- rx_transport_c_u
			rx_time_of_day_96b              : in  std_logic_vector(95 downto 0) := (others => 'X'); -- rx_time_of_day_96b
			tx_c_rtc_id                     : in  std_logic_vector(15 downto 0) := (others => 'X'); -- tx_c_rtc_id
			tx_c_seq_id                     : in  std_logic_vector(15 downto 0) := (others => 'X'); -- tx_c_seq_id
			tx_u_pc_id                      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- tx_u_pc_id
			tx_u_seq_id                     : in  std_logic_vector(15 downto 0) := (others => 'X'); -- tx_u_seq_id
			sink_pc_id                      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- sink_pc_id
			sink_rtc_id                     : in  std_logic_vector(15 downto 0) := (others => 'X'); -- sink_rtc_id
			sink_seq_id                     : in  std_logic_vector(15 downto 0) := (others => 'X'); -- sink_seq_id
			rx_c_rtc_id                     : out std_logic_vector(15 downto 0);                    -- rx_c_rtc_id
			rx_c_seq_id                     : out std_logic_vector(15 downto 0);                    -- rx_c_seq_id
			rx_u_pc_id                      : out std_logic_vector(15 downto 0);                    -- rx_u_pc_id
			rx_u_seq_id                     : out std_logic_vector(15 downto 0);                    -- rx_u_seq_id
			source_pc_id                    : out std_logic_vector(15 downto 0);                    -- source_pc_id
			source_rtc_id                   : out std_logic_vector(15 downto 0);                    -- source_rtc_id
			source_seq_id                   : out std_logic_vector(15 downto 0);                    -- source_seq_id
			source_pkt_size                 : out std_logic_vector(15 downto 0);                    -- source_pkt_size
			tx_lanes_stable                 : in  std_logic                     := 'X';             -- tx_lanes_stable
			rx_pcs_ready                    : in  std_logic                     := 'X'              -- rx_pcs_ready
		);
	end component oran_hwtcl_top;

	u0 : component oran_hwtcl_top
		port map (
			clk_tx                          => CONNECTED_TO_clk_tx,                          --            clk_tx.clk
			clk_rx                          => CONNECTED_TO_clk_rx,                          --            clk_rx.clk
			clk_csr                         => CONNECTED_TO_clk_csr,                         --           clk_csr.clk
			rst_tx_n                        => CONNECTED_TO_rst_tx_n,                        --          rst_tx_n.reset_n
			rst_rx_n                        => CONNECTED_TO_rst_rx_n,                        --          rst_rx_n.reset_n
			rst_csr_n                       => CONNECTED_TO_rst_csr_n,                       --         rst_csr_n.reset_n
			avst_sink_u_valid               => CONNECTED_TO_avst_sink_u_valid,               --       avst_sink_u.valid
			avst_sink_u_data                => CONNECTED_TO_avst_sink_u_data,                --                  .data
			avst_sink_u_startofpacket       => CONNECTED_TO_avst_sink_u_startofpacket,       --                  .startofpacket
			avst_sink_u_endofpacket         => CONNECTED_TO_avst_sink_u_endofpacket,         --                  .endofpacket
			avst_sink_u_ready               => CONNECTED_TO_avst_sink_u_ready,               --                  .ready
			avst_sink_u_empty               => CONNECTED_TO_avst_sink_u_empty,               --                  .empty
			avst_sink_c_valid               => CONNECTED_TO_avst_sink_c_valid,               --       avst_sink_c.valid
			avst_sink_c_startofpacket       => CONNECTED_TO_avst_sink_c_startofpacket,       --                  .startofpacket
			avst_sink_c_endofpacket         => CONNECTED_TO_avst_sink_c_endofpacket,         --                  .endofpacket
			avst_sink_c_ready               => CONNECTED_TO_avst_sink_c_ready,               --                  .ready
			avst_sink_c_ext_valid           => CONNECTED_TO_avst_sink_c_ext_valid,           --   avst_sink_c_ext.valid
			avst_sink_c_ext_data            => CONNECTED_TO_avst_sink_c_ext_data,            --                  .data
			avst_sink_c_ext_startofpacket   => CONNECTED_TO_avst_sink_c_ext_startofpacket,   --                  .startofpacket
			avst_sink_c_ext_endofpacket     => CONNECTED_TO_avst_sink_c_ext_endofpacket,     --                  .endofpacket
			avst_sink_c_ext_empty           => CONNECTED_TO_avst_sink_c_ext_empty,           --                  .empty
			avst_sink_c_ext_ready           => CONNECTED_TO_avst_sink_c_ext_ready,           --                  .ready
			avst_source_valid               => CONNECTED_TO_avst_source_valid,               --       avst_source.valid
			avst_source_data                => CONNECTED_TO_avst_source_data,                --                  .data
			avst_source_startofpacket       => CONNECTED_TO_avst_source_startofpacket,       --                  .startofpacket
			avst_source_endofpacket         => CONNECTED_TO_avst_source_endofpacket,         --                  .endofpacket
			avst_source_empty               => CONNECTED_TO_avst_source_empty,               --                  .empty
			avst_source_ready               => CONNECTED_TO_avst_source_ready,               --                  .ready
			avst_source_u_valid             => CONNECTED_TO_avst_source_u_valid,             --     avst_source_u.valid
			avst_source_u_data              => CONNECTED_TO_avst_source_u_data,              --                  .data
			avst_source_u_startofpacket     => CONNECTED_TO_avst_source_u_startofpacket,     --                  .startofpacket
			avst_source_u_endofpacket       => CONNECTED_TO_avst_source_u_endofpacket,       --                  .endofpacket
			avst_source_u_empty             => CONNECTED_TO_avst_source_u_empty,             --                  .empty
			avst_source_u_error             => CONNECTED_TO_avst_source_u_error,             --                  .error
			avst_source_c_valid             => CONNECTED_TO_avst_source_c_valid,             --     avst_source_c.valid
			avst_source_c_startofpacket     => CONNECTED_TO_avst_source_c_startofpacket,     --                  .startofpacket
			avst_source_c_endofpacket       => CONNECTED_TO_avst_source_c_endofpacket,       --                  .endofpacket
			avst_source_c_error             => CONNECTED_TO_avst_source_c_error,             --                  .error
			avst_source_c_ext_valid         => CONNECTED_TO_avst_source_c_ext_valid,         -- avst_source_c_ext.valid
			avst_source_c_ext_data          => CONNECTED_TO_avst_source_c_ext_data,          --                  .data
			avst_source_c_ext_startofpacket => CONNECTED_TO_avst_source_c_ext_startofpacket, --                  .startofpacket
			avst_source_c_ext_endofpacket   => CONNECTED_TO_avst_source_c_ext_endofpacket,   --                  .endofpacket
			avst_source_c_ext_empty         => CONNECTED_TO_avst_source_c_ext_empty,         --                  .empty
			avst_source_c_ext_error         => CONNECTED_TO_avst_source_c_ext_error,         --                  .error
			avst_sink_valid                 => CONNECTED_TO_avst_sink_valid,                 --         avst_sink.valid
			avst_sink_data                  => CONNECTED_TO_avst_sink_data,                  --                  .data
			avst_sink_startofpacket         => CONNECTED_TO_avst_sink_startofpacket,         --                  .startofpacket
			avst_sink_endofpacket           => CONNECTED_TO_avst_sink_endofpacket,           --                  .endofpacket
			avst_sink_empty                 => CONNECTED_TO_avst_sink_empty,                 --                  .empty
			avst_sink_error                 => CONNECTED_TO_avst_sink_error,                 --                  .error
			csr_address                     => CONNECTED_TO_csr_address,                     --      avalon_slave.address
			csr_write                       => CONNECTED_TO_csr_write,                       --                  .write
			csr_writedata                   => CONNECTED_TO_csr_writedata,                   --                  .writedata
			csr_readdata                    => CONNECTED_TO_csr_readdata,                    --                  .readdata
			csr_read                        => CONNECTED_TO_csr_read,                        --                  .read
			csr_readdatavalid               => CONNECTED_TO_csr_readdatavalid,               --                  .readdatavalid
			csr_waitrequest                 => CONNECTED_TO_csr_waitrequest,                 --                  .waitrequest
			irq                             => CONNECTED_TO_irq,                             --       conduit_end.irq
			tx_c_size                       => CONNECTED_TO_tx_c_size,                       --                  .tx_c_size
			tx_c_dataDirection              => CONNECTED_TO_tx_c_dataDirection,              --                  .tx_c_dataDirection
			tx_c_filterIndex                => CONNECTED_TO_tx_c_filterIndex,                --                  .tx_c_filterIndex
			tx_c_frameId                    => CONNECTED_TO_tx_c_frameId,                    --                  .tx_c_frameId
			tx_c_subframeId                 => CONNECTED_TO_tx_c_subframeId,                 --                  .tx_c_subframeId
			tx_c_slotID                     => CONNECTED_TO_tx_c_slotID,                     --                  .tx_c_slotID
			tx_c_symbolid                   => CONNECTED_TO_tx_c_symbolid,                   --                  .tx_c_symbolid
			tx_c_sectionId                  => CONNECTED_TO_tx_c_sectionId,                  --                  .tx_c_sectionId
			tx_c_rb                         => CONNECTED_TO_tx_c_rb,                         --                  .tx_c_rb
			tx_c_startPrb                   => CONNECTED_TO_tx_c_startPrb,                   --                  .tx_c_startPrb
			tx_c_numPrb                     => CONNECTED_TO_tx_c_numPrb,                     --                  .tx_c_numPrb
			tx_c_udCompHdr                  => CONNECTED_TO_tx_c_udCompHdr,                  --                  .tx_c_udCompHdr
			tx_sectionType                  => CONNECTED_TO_tx_sectionType,                  --                  .tx_sectionType
			tx_ext_sectionType              => CONNECTED_TO_tx_ext_sectionType,              --                  .tx_ext_sectionType
			tx_timeOffset                   => CONNECTED_TO_tx_timeOffset,                   --                  .tx_timeOffset
			tx_frameStructure               => CONNECTED_TO_tx_frameStructure,               --                  .tx_frameStructure
			tx_cpLength                     => CONNECTED_TO_tx_cpLength,                     --                  .tx_cpLength
			tx_reMask                       => CONNECTED_TO_tx_reMask,                       --                  .tx_reMask
			tx_numSymbol                    => CONNECTED_TO_tx_numSymbol,                    --                  .tx_numSymbol
			tx_ef                           => CONNECTED_TO_tx_ef,                           --                  .tx_ef
			tx_frequencyOffset              => CONNECTED_TO_tx_frequencyOffset,              --                  .tx_frequencyOffset
			tx_beamid                       => CONNECTED_TO_tx_beamid,                       --                  .tx_beamid
			tx_u_prbusize                   => CONNECTED_TO_tx_u_prbusize,                   --                  .tx_u_prbusize
			tx_u_numberofsection            => CONNECTED_TO_tx_u_numberofsection,            --                  .tx_u_numberofsection
			tx_u_dataDirection              => CONNECTED_TO_tx_u_dataDirection,              --                  .tx_u_dataDirection
			tx_u_filterIndex                => CONNECTED_TO_tx_u_filterIndex,                --                  .tx_u_filterIndex
			tx_u_frameId                    => CONNECTED_TO_tx_u_frameId,                    --                  .tx_u_frameId
			tx_u_subframeId                 => CONNECTED_TO_tx_u_subframeId,                 --                  .tx_u_subframeId
			tx_u_slotID                     => CONNECTED_TO_tx_u_slotID,                     --                  .tx_u_slotID
			tx_u_symbolid                   => CONNECTED_TO_tx_u_symbolid,                   --                  .tx_u_symbolid
			tx_u_sectionId                  => CONNECTED_TO_tx_u_sectionId,                  --                  .tx_u_sectionId
			tx_u_rb                         => CONNECTED_TO_tx_u_rb,                         --                  .tx_u_rb
			tx_u_startPrb                   => CONNECTED_TO_tx_u_startPrb,                   --                  .tx_u_startPrb
			tx_u_numPrb                     => CONNECTED_TO_tx_u_numPrb,                     --                  .tx_u_numPrb
			tx_u_udCompHdr                  => CONNECTED_TO_tx_u_udCompHdr,                  --                  .tx_u_udCompHdr
			ext_scs_sel                     => CONNECTED_TO_ext_scs_sel,                     --                  .ext_scs_sel
			tx_transport_c_u                => CONNECTED_TO_tx_transport_c_u,                --                  .tx_transport_c_u
			tx_time_of_day_96b              => CONNECTED_TO_tx_time_of_day_96b,              --                  .tx_time_of_day_96b
			rx_c_dataDirection              => CONNECTED_TO_rx_c_dataDirection,              --                  .rx_c_dataDirection
			rx_c_filterIndex                => CONNECTED_TO_rx_c_filterIndex,                --                  .rx_c_filterIndex
			rx_c_frameId                    => CONNECTED_TO_rx_c_frameId,                    --                  .rx_c_frameId
			rx_c_subframeId                 => CONNECTED_TO_rx_c_subframeId,                 --                  .rx_c_subframeId
			rx_c_slotID                     => CONNECTED_TO_rx_c_slotID,                     --                  .rx_c_slotID
			rx_c_symbolid                   => CONNECTED_TO_rx_c_symbolid,                   --                  .rx_c_symbolid
			rx_c_numberOfsections           => CONNECTED_TO_rx_c_numberOfsections,           --                  .rx_c_numberOfsections
			rx_c_sectionId                  => CONNECTED_TO_rx_c_sectionId,                  --                  .rx_c_sectionId
			rx_c_rb                         => CONNECTED_TO_rx_c_rb,                         --                  .rx_c_rb
			rx_c_symInc                     => CONNECTED_TO_rx_c_symInc,                     --                  .rx_c_symInc
			rx_c_startPrb                   => CONNECTED_TO_rx_c_startPrb,                   --                  .rx_c_startPrb
			rx_c_numPrb                     => CONNECTED_TO_rx_c_numPrb,                     --                  .rx_c_numPrb
			rx_c_udCompHdr                  => CONNECTED_TO_rx_c_udCompHdr,                  --                  .rx_c_udCompHdr
			rx_sec_hdr_valid                => CONNECTED_TO_rx_sec_hdr_valid,                --                  .rx_sec_hdr_valid
			rx_sectionType                  => CONNECTED_TO_rx_sectionType,                  --                  .rx_sectionType
			rx_ext_sectionType              => CONNECTED_TO_rx_ext_sectionType,              --                  .rx_ext_sectionType
			rx_timeOffset                   => CONNECTED_TO_rx_timeOffset,                   --                  .rx_timeOffset
			rx_frameStructure               => CONNECTED_TO_rx_frameStructure,               --                  .rx_frameStructure
			rx_cpLength                     => CONNECTED_TO_rx_cpLength,                     --                  .rx_cpLength
			rx_reMask                       => CONNECTED_TO_rx_reMask,                       --                  .rx_reMask
			rx_numSymbol                    => CONNECTED_TO_rx_numSymbol,                    --                  .rx_numSymbol
			rx_frequencyOffset              => CONNECTED_TO_rx_frequencyOffset,              --                  .rx_frequencyOffset
			rx_ef                           => CONNECTED_TO_rx_ef,                           --                  .rx_ef
			rx_beamid                       => CONNECTED_TO_rx_beamid,                       --                  .rx_beamid
			rx_u_dataDirection              => CONNECTED_TO_rx_u_dataDirection,              --                  .rx_u_dataDirection
			rx_u_filterIndex                => CONNECTED_TO_rx_u_filterIndex,                --                  .rx_u_filterIndex
			rx_u_frameId                    => CONNECTED_TO_rx_u_frameId,                    --                  .rx_u_frameId
			rx_u_subframeId                 => CONNECTED_TO_rx_u_subframeId,                 --                  .rx_u_subframeId
			rx_u_slotID                     => CONNECTED_TO_rx_u_slotID,                     --                  .rx_u_slotID
			rx_u_symbolid                   => CONNECTED_TO_rx_u_symbolid,                   --                  .rx_u_symbolid
			rx_u_sectionId                  => CONNECTED_TO_rx_u_sectionId,                  --                  .rx_u_sectionId
			rx_u_rb                         => CONNECTED_TO_rx_u_rb,                         --                  .rx_u_rb
			rx_u_startPrb                   => CONNECTED_TO_rx_u_startPrb,                   --                  .rx_u_startPrb
			rx_u_numPrb                     => CONNECTED_TO_rx_u_numPrb,                     --                  .rx_u_numPrb
			rx_u_udCompHdr                  => CONNECTED_TO_rx_u_udCompHdr,                  --                  .rx_u_udCompHdr
			rx_transport_c_u                => CONNECTED_TO_rx_transport_c_u,                --                  .rx_transport_c_u
			rx_time_of_day_96b              => CONNECTED_TO_rx_time_of_day_96b,              --                  .rx_time_of_day_96b
			tx_c_rtc_id                     => CONNECTED_TO_tx_c_rtc_id,                     --                  .tx_c_rtc_id
			tx_c_seq_id                     => CONNECTED_TO_tx_c_seq_id,                     --                  .tx_c_seq_id
			tx_u_pc_id                      => CONNECTED_TO_tx_u_pc_id,                      --                  .tx_u_pc_id
			tx_u_seq_id                     => CONNECTED_TO_tx_u_seq_id,                     --                  .tx_u_seq_id
			sink_pc_id                      => CONNECTED_TO_sink_pc_id,                      --                  .sink_pc_id
			sink_rtc_id                     => CONNECTED_TO_sink_rtc_id,                     --                  .sink_rtc_id
			sink_seq_id                     => CONNECTED_TO_sink_seq_id,                     --                  .sink_seq_id
			rx_c_rtc_id                     => CONNECTED_TO_rx_c_rtc_id,                     --                  .rx_c_rtc_id
			rx_c_seq_id                     => CONNECTED_TO_rx_c_seq_id,                     --                  .rx_c_seq_id
			rx_u_pc_id                      => CONNECTED_TO_rx_u_pc_id,                      --                  .rx_u_pc_id
			rx_u_seq_id                     => CONNECTED_TO_rx_u_seq_id,                     --                  .rx_u_seq_id
			source_pc_id                    => CONNECTED_TO_source_pc_id,                    --                  .source_pc_id
			source_rtc_id                   => CONNECTED_TO_source_rtc_id,                   --                  .source_rtc_id
			source_seq_id                   => CONNECTED_TO_source_seq_id,                   --                  .source_seq_id
			source_pkt_size                 => CONNECTED_TO_source_pkt_size,                 --                  .source_pkt_size
			tx_lanes_stable                 => CONNECTED_TO_tx_lanes_stable,                 --                  .tx_lanes_stable
			rx_pcs_ready                    => CONNECTED_TO_rx_pcs_ready                     --                  .rx_pcs_ready
		);

