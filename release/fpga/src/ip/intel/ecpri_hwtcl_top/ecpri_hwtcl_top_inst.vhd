	component ecpri_hwtcl_top is
		port (
			mac_clk_tx                                     : in  std_logic                     := 'X';             -- clk
			mac_clk_rx                                     : in  std_logic                     := 'X';             -- clk
			clk_tx                                         : in  std_logic                     := 'X';             -- clk
			clk_rx                                         : in  std_logic                     := 'X';             -- clk
			clk_csr                                        : in  std_logic                     := 'X';             -- clk
			ext_sink_clk                                   : in  std_logic                     := 'X';             -- clk
			rst_tx_n                                       : in  std_logic                     := 'X';             -- reset_n
			rst_rx_n                                       : in  std_logic                     := 'X';             -- reset_n
			rst_csr_n                                      : in  std_logic                     := 'X';             -- reset_n
			csr_address                                    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- address
			csr_write                                      : in  std_logic                     := 'X';             -- write
			csr_writedata                                  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			csr_read                                       : in  std_logic                     := 'X';             -- read
			csr_readdata                                   : out std_logic_vector(31 downto 0);                    -- readdata
			csr_readdatavalid                              : out std_logic;                                        -- readdatavalid
			csr_waitrequest                                : out std_logic;                                        -- waitrequest
			mac_source_valid                               : out std_logic;                                        -- valid
			mac_source_data                                : out std_logic_vector(63 downto 0);                    -- data
			mac_source_sop                                 : out std_logic;                                        -- startofpacket
			mac_source_eop                                 : out std_logic;                                        -- endofpacket
			mac_source_empty                               : out std_logic_vector(2 downto 0);                     -- empty
			mac_source_error                               : out std_logic;                                        -- error
			mac_source_ready                               : in  std_logic                     := 'X';             -- ready
			avst_sink_valid                                : in  std_logic                     := 'X';             -- valid
			avst_sink_data                                 : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			avst_sink_sop                                  : in  std_logic                     := 'X';             -- startofpacket
			avst_sink_eop                                  : in  std_logic                     := 'X';             -- endofpacket
			avst_sink_empty                                : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- empty
			avst_sink_error                                : in  std_logic                     := 'X';             -- error
			avst_sink_ready                                : out std_logic;                                        -- ready
			avst_source_valid                              : out std_logic;                                        -- valid
			avst_source_data                               : out std_logic_vector(63 downto 0);                    -- data
			avst_source_sop                                : out std_logic;                                        -- startofpacket
			avst_source_eop                                : out std_logic;                                        -- endofpacket
			avst_source_empty                              : out std_logic_vector(2 downto 0);                     -- empty
			avst_source_error                              : out std_logic;                                        -- error
			mac_sink_valid                                 : in  std_logic                     := 'X';             -- valid
			mac_sink_data                                  : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			mac_sink_sop                                   : in  std_logic                     := 'X';             -- startofpacket
			mac_sink_eop                                   : in  std_logic                     := 'X';             -- endofpacket
			mac_sink_empty                                 : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- empty
			mac_sink_error                                 : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- error
			mac_sink_ready                                 : out std_logic;                                        -- ready
			ext_sink_0_valid                               : in  std_logic                     := 'X';             -- valid
			ext_sink_0_data                                : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			ext_sink_0_sop                                 : in  std_logic                     := 'X';             -- startofpacket
			ext_sink_0_eop                                 : in  std_logic                     := 'X';             -- endofpacket
			ext_sink_0_empty                               : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- empty
			ext_sink_0_error                               : in  std_logic                     := 'X';             -- error
			ext_sink_0_ready                               : out std_logic;                                        -- ready
			ext_source_valid                               : out std_logic;                                        -- valid
			ext_source_data                                : out std_logic_vector(63 downto 0);                    -- data
			ext_source_sop                                 : out std_logic;                                        -- startofpacket
			ext_source_eop                                 : out std_logic;                                        -- endofpacket
			ext_source_empty                               : out std_logic_vector(2 downto 0);                     -- empty
			ext_source_error                               : out std_logic_vector(5 downto 0);                     -- error
			ext_source_pkt_type                            : out std_logic_vector(2 downto 0);                     -- conduit
			err_interrupt                                  : out std_logic;                                        -- conduit
			source_pc_id                                   : out std_logic_vector(31 downto 0);                    -- conduit
			source_seq_id                                  : out std_logic_vector(31 downto 0);                    -- conduit
			source_rtc_id                                  : out std_logic_vector(15 downto 0);                    -- conduit
			source_msg_type                                : out std_logic_vector(7 downto 0);                     -- conduit
			source_mem_acc_id                              : out std_logic_vector(7 downto 0);                     -- conduit
			source_op_type                                 : out std_logic_vector(7 downto 0);                     -- conduit
			source_element_id                              : out std_logic_vector(15 downto 0);                    -- conduit
			source_address                                 : out std_logic_vector(47 downto 0);                    -- conduit
			source_length                                  : out std_logic_vector(15 downto 0);                    -- conduit
			source_reset_id                                : out std_logic_vector(15 downto 0);                    -- conduit
			source_reset_op                                : out std_logic_vector(7 downto 0);                     -- conduit
			source_event_id                                : out std_logic_vector(7 downto 0);                     -- conduit
			source_event_type                              : out std_logic_vector(7 downto 0);                     -- conduit
			source_notif                                   : out std_logic_vector(7 downto 0);                     -- conduit
			source_concatenation                           : out std_logic;                                        -- conduit
			sink_pc_id                                     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- conduit
			sink_seq_id                                    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- conduit
			sink_rtc_id                                    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- conduit
			sink_concatenation                             : in  std_logic                     := 'X';             -- conduit
			sink_msg_type                                  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- conduit
			sink_mem_acc_id                                : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- conduit
			sink_op_type                                   : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- conduit
			sink_element_id                                : in  std_logic_vector(15 downto 0) := (others => 'X'); -- conduit
			sink_address                                   : in  std_logic_vector(47 downto 0) := (others => 'X'); -- conduit
			sink_length                                    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- conduit
			sink_reset_id                                  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- conduit
			sink_reset_op                                  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- conduit
			sink_event_id                                  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- conduit
			sink_event_type                                : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- conduit
			tx_lanes_stable                                : in  std_logic                     := 'X';             -- conduit
			rx_pcs_ready                                   : in  std_logic                     := 'X';             -- conduit
			ptp_offset_timestamp                           : out std_logic_vector(15 downto 0);                    -- conduit
			ptp_offset_correction_field                    : out std_logic_vector(15 downto 0);                    -- conduit
			ptp_timestamp_insert                           : out std_logic;                                        -- conduit
			ptp_tx_etstamp_ins_ctrl_residence_time_update  : out std_logic;                                        -- conduit
			ptp_timestamp_request_fingerprint              : out std_logic_vector(7 downto 0);                     -- conduit
			ptp_timestamp_request_valid                    : out std_logic;                                        -- conduit
			tx_etstamp_ins_ctrl_timestamp_format           : out std_logic;                                        -- conduit
			tx_etstamp_ins_ctrl_residence_time_calc_format : out std_logic;                                        -- conduit
			tx_etstamp_ins_ctrl_offset_checksum_field      : out std_logic_vector(15 downto 0);                    -- conduit
			tx_etstamp_ins_ctrl_offset_checksum_correction : out std_logic_vector(15 downto 0);                    -- conduit
			tx_etstamp_ins_ctrl_ingress_timestamp_96b      : out std_logic_vector(95 downto 0);                    -- conduit
			tx_etstamp_ins_ctrl_checksum_zero              : out std_logic;                                        -- conduit
			tx_etstamp_ins_ctrl_checksum_correct           : out std_logic;                                        -- conduit
			tx_egress_timestamp_96b_valid                  : in  std_logic                     := 'X';             -- conduit
			tx_egress_timestamp_96b_data                   : in  std_logic_vector(95 downto 0) := (others => 'X'); -- conduit
			tx_egress_timestamp_96b_fingerprint            : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- conduit
			rx_ingress_timestamp_96b_valid                 : in  std_logic                     := 'X';             -- conduit
			rx_ingress_timestamp_96b_data                  : in  std_logic_vector(95 downto 0) := (others => 'X'); -- conduit
			ext_sink_0_tx_egress_timestamp_96b_valid       : out std_logic;                                        -- conduit
			ext_sink_0_tx_egress_timestamp_96b_data        : out std_logic_vector(95 downto 0);                    -- conduit
			ext_rx_ingress_timestamp_96b_data              : out std_logic_vector(95 downto 0);                    -- conduit
			ext_sink_0_tx_ingress_timestamp_96b_data       : in  std_logic_vector(95 downto 0) := (others => 'X'); -- conduit
			ptp_tx_ingress_timestamp_96b_data              : out std_logic_vector(95 downto 0);                    -- conduit
			rx_tod_time_of_day_96b_data                    : in  std_logic_vector(95 downto 0) := (others => 'X'); -- conduit
			tx_tod_time_of_day_96b_data                    : in  std_logic_vector(95 downto 0) := (others => 'X'); -- conduit
			tx_transport_c_u                               : in  std_logic                     := 'X';             -- conduit
			rx_transport_c_u                               : out std_logic;                                        -- conduit
			sink_pkt_size                                  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- conduit
			sink_pkt_checksum                              : in  std_logic_vector(15 downto 0) := (others => 'X'); -- conduit
			ext_sink_0_tx_egress_timestamp_96b_fingerprint : out std_logic_vector(5 downto 0);                     -- conduit
			ext_sink_0_timestamp_request_fingerprint       : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- conduit
			ext_sink_0_timestamp_request_valid             : in  std_logic                     := 'X'              -- conduit
		);
	end component ecpri_hwtcl_top;

	u0 : component ecpri_hwtcl_top
		port map (
			mac_clk_tx                                     => CONNECTED_TO_mac_clk_tx,                                     --                                     mac_clk_tx.clk
			mac_clk_rx                                     => CONNECTED_TO_mac_clk_rx,                                     --                                     mac_clk_rx.clk
			clk_tx                                         => CONNECTED_TO_clk_tx,                                         --                                         clk_tx.clk
			clk_rx                                         => CONNECTED_TO_clk_rx,                                         --                                         clk_rx.clk
			clk_csr                                        => CONNECTED_TO_clk_csr,                                        --                                        clk_csr.clk
			ext_sink_clk                                   => CONNECTED_TO_ext_sink_clk,                                   --                                   ext_sink_clk.clk
			rst_tx_n                                       => CONNECTED_TO_rst_tx_n,                                       --                                       rst_tx_n.reset_n
			rst_rx_n                                       => CONNECTED_TO_rst_rx_n,                                       --                                       rst_rx_n.reset_n
			rst_csr_n                                      => CONNECTED_TO_rst_csr_n,                                      --                                      rst_csr_n.reset_n
			csr_address                                    => CONNECTED_TO_csr_address,                                    --                                            csr.address
			csr_write                                      => CONNECTED_TO_csr_write,                                      --                                               .write
			csr_writedata                                  => CONNECTED_TO_csr_writedata,                                  --                                               .writedata
			csr_read                                       => CONNECTED_TO_csr_read,                                       --                                               .read
			csr_readdata                                   => CONNECTED_TO_csr_readdata,                                   --                                               .readdata
			csr_readdatavalid                              => CONNECTED_TO_csr_readdatavalid,                              --                                               .readdatavalid
			csr_waitrequest                                => CONNECTED_TO_csr_waitrequest,                                --                                               .waitrequest
			mac_source_valid                               => CONNECTED_TO_mac_source_valid,                               --                                     mac_source.valid
			mac_source_data                                => CONNECTED_TO_mac_source_data,                                --                                               .data
			mac_source_sop                                 => CONNECTED_TO_mac_source_sop,                                 --                                               .startofpacket
			mac_source_eop                                 => CONNECTED_TO_mac_source_eop,                                 --                                               .endofpacket
			mac_source_empty                               => CONNECTED_TO_mac_source_empty,                               --                                               .empty
			mac_source_error                               => CONNECTED_TO_mac_source_error,                               --                                               .error
			mac_source_ready                               => CONNECTED_TO_mac_source_ready,                               --                                               .ready
			avst_sink_valid                                => CONNECTED_TO_avst_sink_valid,                                --                                      avst_sink.valid
			avst_sink_data                                 => CONNECTED_TO_avst_sink_data,                                 --                                               .data
			avst_sink_sop                                  => CONNECTED_TO_avst_sink_sop,                                  --                                               .startofpacket
			avst_sink_eop                                  => CONNECTED_TO_avst_sink_eop,                                  --                                               .endofpacket
			avst_sink_empty                                => CONNECTED_TO_avst_sink_empty,                                --                                               .empty
			avst_sink_error                                => CONNECTED_TO_avst_sink_error,                                --                                               .error
			avst_sink_ready                                => CONNECTED_TO_avst_sink_ready,                                --                                               .ready
			avst_source_valid                              => CONNECTED_TO_avst_source_valid,                              --                                    avst_source.valid
			avst_source_data                               => CONNECTED_TO_avst_source_data,                               --                                               .data
			avst_source_sop                                => CONNECTED_TO_avst_source_sop,                                --                                               .startofpacket
			avst_source_eop                                => CONNECTED_TO_avst_source_eop,                                --                                               .endofpacket
			avst_source_empty                              => CONNECTED_TO_avst_source_empty,                              --                                               .empty
			avst_source_error                              => CONNECTED_TO_avst_source_error,                              --                                               .error
			mac_sink_valid                                 => CONNECTED_TO_mac_sink_valid,                                 --                                       mac_sink.valid
			mac_sink_data                                  => CONNECTED_TO_mac_sink_data,                                  --                                               .data
			mac_sink_sop                                   => CONNECTED_TO_mac_sink_sop,                                   --                                               .startofpacket
			mac_sink_eop                                   => CONNECTED_TO_mac_sink_eop,                                   --                                               .endofpacket
			mac_sink_empty                                 => CONNECTED_TO_mac_sink_empty,                                 --                                               .empty
			mac_sink_error                                 => CONNECTED_TO_mac_sink_error,                                 --                                               .error
			mac_sink_ready                                 => CONNECTED_TO_mac_sink_ready,                                 --                                               .ready
			ext_sink_0_valid                               => CONNECTED_TO_ext_sink_0_valid,                               --                                     ext_sink_0.valid
			ext_sink_0_data                                => CONNECTED_TO_ext_sink_0_data,                                --                                               .data
			ext_sink_0_sop                                 => CONNECTED_TO_ext_sink_0_sop,                                 --                                               .startofpacket
			ext_sink_0_eop                                 => CONNECTED_TO_ext_sink_0_eop,                                 --                                               .endofpacket
			ext_sink_0_empty                               => CONNECTED_TO_ext_sink_0_empty,                               --                                               .empty
			ext_sink_0_error                               => CONNECTED_TO_ext_sink_0_error,                               --                                               .error
			ext_sink_0_ready                               => CONNECTED_TO_ext_sink_0_ready,                               --                                               .ready
			ext_source_valid                               => CONNECTED_TO_ext_source_valid,                               --                                     ext_source.valid
			ext_source_data                                => CONNECTED_TO_ext_source_data,                                --                                               .data
			ext_source_sop                                 => CONNECTED_TO_ext_source_sop,                                 --                                               .startofpacket
			ext_source_eop                                 => CONNECTED_TO_ext_source_eop,                                 --                                               .endofpacket
			ext_source_empty                               => CONNECTED_TO_ext_source_empty,                               --                                               .empty
			ext_source_error                               => CONNECTED_TO_ext_source_error,                               --                                               .error
			ext_source_pkt_type                            => CONNECTED_TO_ext_source_pkt_type,                            --                            ext_source_pkt_type.conduit
			err_interrupt                                  => CONNECTED_TO_err_interrupt,                                  --                                  err_interrupt.conduit
			source_pc_id                                   => CONNECTED_TO_source_pc_id,                                   --                                   source_pc_id.conduit
			source_seq_id                                  => CONNECTED_TO_source_seq_id,                                  --                                  source_seq_id.conduit
			source_rtc_id                                  => CONNECTED_TO_source_rtc_id,                                  --                                  source_rtc_id.conduit
			source_msg_type                                => CONNECTED_TO_source_msg_type,                                --                                source_msg_type.conduit
			source_mem_acc_id                              => CONNECTED_TO_source_mem_acc_id,                              --                              source_mem_acc_id.conduit
			source_op_type                                 => CONNECTED_TO_source_op_type,                                 --                                 source_op_type.conduit
			source_element_id                              => CONNECTED_TO_source_element_id,                              --                              source_element_id.conduit
			source_address                                 => CONNECTED_TO_source_address,                                 --                                 source_address.conduit
			source_length                                  => CONNECTED_TO_source_length,                                  --                                  source_length.conduit
			source_reset_id                                => CONNECTED_TO_source_reset_id,                                --                                source_reset_id.conduit
			source_reset_op                                => CONNECTED_TO_source_reset_op,                                --                                source_reset_op.conduit
			source_event_id                                => CONNECTED_TO_source_event_id,                                --                                source_event_id.conduit
			source_event_type                              => CONNECTED_TO_source_event_type,                              --                              source_event_type.conduit
			source_notif                                   => CONNECTED_TO_source_notif,                                   --                                   source_notif.conduit
			source_concatenation                           => CONNECTED_TO_source_concatenation,                           --                           source_concatenation.conduit
			sink_pc_id                                     => CONNECTED_TO_sink_pc_id,                                     --                                     sink_pc_id.conduit
			sink_seq_id                                    => CONNECTED_TO_sink_seq_id,                                    --                                    sink_seq_id.conduit
			sink_rtc_id                                    => CONNECTED_TO_sink_rtc_id,                                    --                                    sink_rtc_id.conduit
			sink_concatenation                             => CONNECTED_TO_sink_concatenation,                             --                             sink_concatenation.conduit
			sink_msg_type                                  => CONNECTED_TO_sink_msg_type,                                  --                                  sink_msg_type.conduit
			sink_mem_acc_id                                => CONNECTED_TO_sink_mem_acc_id,                                --                                sink_mem_acc_id.conduit
			sink_op_type                                   => CONNECTED_TO_sink_op_type,                                   --                                   sink_op_type.conduit
			sink_element_id                                => CONNECTED_TO_sink_element_id,                                --                                sink_element_id.conduit
			sink_address                                   => CONNECTED_TO_sink_address,                                   --                                   sink_address.conduit
			sink_length                                    => CONNECTED_TO_sink_length,                                    --                                    sink_length.conduit
			sink_reset_id                                  => CONNECTED_TO_sink_reset_id,                                  --                                  sink_reset_id.conduit
			sink_reset_op                                  => CONNECTED_TO_sink_reset_op,                                  --                                  sink_reset_op.conduit
			sink_event_id                                  => CONNECTED_TO_sink_event_id,                                  --                                  sink_event_id.conduit
			sink_event_type                                => CONNECTED_TO_sink_event_type,                                --                                sink_event_type.conduit
			tx_lanes_stable                                => CONNECTED_TO_tx_lanes_stable,                                --                                tx_lanes_stable.conduit
			rx_pcs_ready                                   => CONNECTED_TO_rx_pcs_ready,                                   --                                   rx_pcs_ready.conduit
			ptp_offset_timestamp                           => CONNECTED_TO_ptp_offset_timestamp,                           --                           ptp_offset_timestamp.conduit
			ptp_offset_correction_field                    => CONNECTED_TO_ptp_offset_correction_field,                    --                    ptp_offset_correction_field.conduit
			ptp_timestamp_insert                           => CONNECTED_TO_ptp_timestamp_insert,                           --                           ptp_timestamp_insert.conduit
			ptp_tx_etstamp_ins_ctrl_residence_time_update  => CONNECTED_TO_ptp_tx_etstamp_ins_ctrl_residence_time_update,  --  ptp_tx_etstamp_ins_ctrl_residence_time_update.conduit
			ptp_timestamp_request_fingerprint              => CONNECTED_TO_ptp_timestamp_request_fingerprint,              --              ptp_timestamp_request_fingerprint.conduit
			ptp_timestamp_request_valid                    => CONNECTED_TO_ptp_timestamp_request_valid,                    --                    ptp_timestamp_request_valid.conduit
			tx_etstamp_ins_ctrl_timestamp_format           => CONNECTED_TO_tx_etstamp_ins_ctrl_timestamp_format,           --           tx_etstamp_ins_ctrl_timestamp_format.conduit
			tx_etstamp_ins_ctrl_residence_time_calc_format => CONNECTED_TO_tx_etstamp_ins_ctrl_residence_time_calc_format, -- tx_etstamp_ins_ctrl_residence_time_calc_format.conduit
			tx_etstamp_ins_ctrl_offset_checksum_field      => CONNECTED_TO_tx_etstamp_ins_ctrl_offset_checksum_field,      --      tx_etstamp_ins_ctrl_offset_checksum_field.conduit
			tx_etstamp_ins_ctrl_offset_checksum_correction => CONNECTED_TO_tx_etstamp_ins_ctrl_offset_checksum_correction, -- tx_etstamp_ins_ctrl_offset_checksum_correction.conduit
			tx_etstamp_ins_ctrl_ingress_timestamp_96b      => CONNECTED_TO_tx_etstamp_ins_ctrl_ingress_timestamp_96b,      --      tx_etstamp_ins_ctrl_ingress_timestamp_96b.conduit
			tx_etstamp_ins_ctrl_checksum_zero              => CONNECTED_TO_tx_etstamp_ins_ctrl_checksum_zero,              --              tx_etstamp_ins_ctrl_checksum_zero.conduit
			tx_etstamp_ins_ctrl_checksum_correct           => CONNECTED_TO_tx_etstamp_ins_ctrl_checksum_correct,           --           tx_etstamp_ins_ctrl_checksum_correct.conduit
			tx_egress_timestamp_96b_valid                  => CONNECTED_TO_tx_egress_timestamp_96b_valid,                  --                  tx_egress_timestamp_96b_valid.conduit
			tx_egress_timestamp_96b_data                   => CONNECTED_TO_tx_egress_timestamp_96b_data,                   --                   tx_egress_timestamp_96b_data.conduit
			tx_egress_timestamp_96b_fingerprint            => CONNECTED_TO_tx_egress_timestamp_96b_fingerprint,            --            tx_egress_timestamp_96b_fingerprint.conduit
			rx_ingress_timestamp_96b_valid                 => CONNECTED_TO_rx_ingress_timestamp_96b_valid,                 --                 rx_ingress_timestamp_96b_valid.conduit
			rx_ingress_timestamp_96b_data                  => CONNECTED_TO_rx_ingress_timestamp_96b_data,                  --                  rx_ingress_timestamp_96b_data.conduit
			ext_sink_0_tx_egress_timestamp_96b_valid       => CONNECTED_TO_ext_sink_0_tx_egress_timestamp_96b_valid,       --       ext_sink_0_tx_egress_timestamp_96b_valid.conduit
			ext_sink_0_tx_egress_timestamp_96b_data        => CONNECTED_TO_ext_sink_0_tx_egress_timestamp_96b_data,        --        ext_sink_0_tx_egress_timestamp_96b_data.conduit
			ext_rx_ingress_timestamp_96b_data              => CONNECTED_TO_ext_rx_ingress_timestamp_96b_data,              --              ext_rx_ingress_timestamp_96b_data.conduit
			ext_sink_0_tx_ingress_timestamp_96b_data       => CONNECTED_TO_ext_sink_0_tx_ingress_timestamp_96b_data,       --       ext_sink_0_tx_ingress_timestamp_96b_data.conduit
			ptp_tx_ingress_timestamp_96b_data              => CONNECTED_TO_ptp_tx_ingress_timestamp_96b_data,              --              ptp_tx_ingress_timestamp_96b_data.conduit
			rx_tod_time_of_day_96b_data                    => CONNECTED_TO_rx_tod_time_of_day_96b_data,                    --                    rx_tod_time_of_day_96b_data.conduit
			tx_tod_time_of_day_96b_data                    => CONNECTED_TO_tx_tod_time_of_day_96b_data,                    --                    tx_tod_time_of_day_96b_data.conduit
			tx_transport_c_u                               => CONNECTED_TO_tx_transport_c_u,                               --                               tx_transport_c_u.conduit
			rx_transport_c_u                               => CONNECTED_TO_rx_transport_c_u,                               --                               rx_transport_c_u.conduit
			sink_pkt_size                                  => CONNECTED_TO_sink_pkt_size,                                  --                                  sink_pkt_size.conduit
			sink_pkt_checksum                              => CONNECTED_TO_sink_pkt_checksum,                              --                              sink_pkt_checksum.conduit
			ext_sink_0_tx_egress_timestamp_96b_fingerprint => CONNECTED_TO_ext_sink_0_tx_egress_timestamp_96b_fingerprint, -- ext_sink_0_tx_egress_timestamp_96b_fingerprint.conduit
			ext_sink_0_timestamp_request_fingerprint       => CONNECTED_TO_ext_sink_0_timestamp_request_fingerprint,       --       ext_sink_0_timestamp_request_fingerprint.conduit
			ext_sink_0_timestamp_request_valid             => CONNECTED_TO_ext_sink_0_timestamp_request_valid              --             ext_sink_0_timestamp_request_valid.conduit
		);

