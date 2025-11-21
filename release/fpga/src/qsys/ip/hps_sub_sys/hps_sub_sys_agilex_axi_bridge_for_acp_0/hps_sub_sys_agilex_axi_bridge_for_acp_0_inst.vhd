	component hps_sub_sys_agilex_axi_bridge_for_acp_0 is
		generic (
			WSTRB_WIDTH : integer := 64
		);
		port (
			clk             : in  std_logic                      := 'X';             -- clk
			reset           : in  std_logic                      := 'X';             -- reset
			csr_clk         : in  std_logic                      := 'X';             -- clk
			csr_reset       : in  std_logic                      := 'X';             -- reset
			addr            : in  std_logic                      := 'X';             -- address
			read            : in  std_logic                      := 'X';             -- read
			write           : in  std_logic                      := 'X';             -- write
			writedata       : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			readdata        : out std_logic_vector(31 downto 0);                     -- readdata
			axm_m0_araddr   : out std_logic_vector(36 downto 0);                     -- araddr
			axm_m0_arburst  : out std_logic_vector(1 downto 0);                      -- arburst
			axm_m0_arcache  : out std_logic_vector(3 downto 0);                      -- arcache
			axm_m0_arid     : out std_logic_vector(4 downto 0);                      -- arid
			axm_m0_arlen    : out std_logic_vector(7 downto 0);                      -- arlen
			axm_m0_arlock   : out std_logic;                                         -- arlock
			axm_m0_arprot   : out std_logic_vector(2 downto 0);                      -- arprot
			axm_m0_arqos    : out std_logic_vector(3 downto 0);                      -- arqos
			axm_m0_arready  : in  std_logic                      := 'X';             -- arready
			axm_m0_arsize   : out std_logic_vector(2 downto 0);                      -- arsize
			axm_m0_arvalid  : out std_logic;                                         -- arvalid
			axm_m0_arsnoop  : out std_logic_vector(3 downto 0);                      -- arsnoop
			axm_m0_ardomain : out std_logic_vector(1 downto 0);                      -- ardomain
			axm_m0_arbar    : out std_logic_vector(1 downto 0);                      -- arbar
			axm_m0_aruser   : out std_logic_vector(22 downto 0);                     -- aruser
			axm_m0_awaddr   : out std_logic_vector(36 downto 0);                     -- awaddr
			axm_m0_awburst  : out std_logic_vector(1 downto 0);                      -- awburst
			axm_m0_awcache  : out std_logic_vector(3 downto 0);                      -- awcache
			axm_m0_awid     : out std_logic_vector(4 downto 0);                      -- awid
			axm_m0_awlen    : out std_logic_vector(7 downto 0);                      -- awlen
			axm_m0_awlock   : out std_logic;                                         -- awlock
			axm_m0_awprot   : out std_logic_vector(2 downto 0);                      -- awprot
			axm_m0_awready  : in  std_logic                      := 'X';             -- awready
			axm_m0_awsize   : out std_logic_vector(2 downto 0);                      -- awsize
			axm_m0_awvalid  : out std_logic;                                         -- awvalid
			axm_m0_awqos    : out std_logic_vector(3 downto 0);                      -- awqos
			axm_m0_bid      : in  std_logic_vector(4 downto 0)   := (others => 'X'); -- bid
			axm_m0_bready   : out std_logic;                                         -- bready
			axm_m0_bresp    : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			axm_m0_bvalid   : in  std_logic                      := 'X';             -- bvalid
			axm_m0_rdata    : in  std_logic_vector(511 downto 0) := (others => 'X'); -- rdata
			axm_m0_rid      : in  std_logic_vector(4 downto 0)   := (others => 'X'); -- rid
			axm_m0_rlast    : in  std_logic                      := 'X';             -- rlast
			axm_m0_rready   : out std_logic;                                         -- rready
			axm_m0_rresp    : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			axm_m0_rvalid   : in  std_logic                      := 'X';             -- rvalid
			axm_m0_wdata    : out std_logic_vector(511 downto 0);                    -- wdata
			axm_m0_wlast    : out std_logic;                                         -- wlast
			axm_m0_wready   : in  std_logic                      := 'X';             -- wready
			axm_m0_wstrb    : out std_logic_vector(63 downto 0);                     -- wstrb
			axm_m0_wvalid   : out std_logic;                                         -- wvalid
			axm_m0_awsnoop  : out std_logic_vector(2 downto 0);                      -- awsnoop
			axm_m0_awdomain : out std_logic_vector(1 downto 0);                      -- awdomain
			axm_m0_awbar    : out std_logic_vector(1 downto 0);                      -- awbar
			axm_m0_awuser   : out std_logic_vector(22 downto 0);                     -- awuser
			axs_s0_araddr   : in  std_logic_vector(36 downto 0)  := (others => 'X'); -- araddr
			axs_s0_arburst  : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- arburst
			axs_s0_arcache  : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- arcache
			axs_s0_arid     : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- arid
			axs_s0_arlen    : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- arlen
			axs_s0_arlock   : in  std_logic                      := 'X';             -- arlock
			axs_s0_arprot   : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- arprot
			axs_s0_arready  : out std_logic;                                         -- arready
			axs_s0_arsize   : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- arsize
			axs_s0_arvalid  : in  std_logic                      := 'X';             -- arvalid
			axs_s0_awaddr   : in  std_logic_vector(36 downto 0)  := (others => 'X'); -- awaddr
			axs_s0_awburst  : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- awburst
			axs_s0_awcache  : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- awcache
			axs_s0_awid     : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- awid
			axs_s0_awlen    : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- awlen
			axs_s0_awlock   : in  std_logic                      := 'X';             -- awlock
			axs_s0_awprot   : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- awprot
			axs_s0_awready  : out std_logic;                                         -- awready
			axs_s0_awsize   : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- awsize
			axs_s0_awvalid  : in  std_logic                      := 'X';             -- awvalid
			axs_s0_bid      : out std_logic_vector(3 downto 0);                      -- bid
			axs_s0_bready   : in  std_logic                      := 'X';             -- bready
			axs_s0_bresp    : out std_logic_vector(1 downto 0);                      -- bresp
			axs_s0_bvalid   : out std_logic;                                         -- bvalid
			axs_s0_rdata    : out std_logic_vector(511 downto 0);                    -- rdata
			axs_s0_rid      : out std_logic_vector(3 downto 0);                      -- rid
			axs_s0_rlast    : out std_logic;                                         -- rlast
			axs_s0_rready   : in  std_logic                      := 'X';             -- rready
			axs_s0_rresp    : out std_logic_vector(1 downto 0);                      -- rresp
			axs_s0_rvalid   : out std_logic;                                         -- rvalid
			axs_s0_wdata    : in  std_logic_vector(511 downto 0) := (others => 'X'); -- wdata
			axs_s0_wlast    : in  std_logic                      := 'X';             -- wlast
			axs_s0_wready   : out std_logic;                                         -- wready
			axs_s0_wstrb    : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- wstrb
			axs_s0_wvalid   : in  std_logic                      := 'X'              -- wvalid
		);
	end component hps_sub_sys_agilex_axi_bridge_for_acp_0;

	u0 : component hps_sub_sys_agilex_axi_bridge_for_acp_0
		generic map (
			WSTRB_WIDTH => INTEGER_VALUE_FOR_WSTRB_WIDTH
		)
		port map (
			clk             => CONNECTED_TO_clk,             --     clock.clk
			reset           => CONNECTED_TO_reset,           --     reset.reset
			csr_clk         => CONNECTED_TO_csr_clk,         -- csr_clock.clk
			csr_reset       => CONNECTED_TO_csr_reset,       -- csr_reset.reset
			addr            => CONNECTED_TO_addr,            --       csr.address
			read            => CONNECTED_TO_read,            --          .read
			write           => CONNECTED_TO_write,           --          .write
			writedata       => CONNECTED_TO_writedata,       --          .writedata
			readdata        => CONNECTED_TO_readdata,        --          .readdata
			axm_m0_araddr   => CONNECTED_TO_axm_m0_araddr,   --        m0.araddr
			axm_m0_arburst  => CONNECTED_TO_axm_m0_arburst,  --          .arburst
			axm_m0_arcache  => CONNECTED_TO_axm_m0_arcache,  --          .arcache
			axm_m0_arid     => CONNECTED_TO_axm_m0_arid,     --          .arid
			axm_m0_arlen    => CONNECTED_TO_axm_m0_arlen,    --          .arlen
			axm_m0_arlock   => CONNECTED_TO_axm_m0_arlock,   --          .arlock
			axm_m0_arprot   => CONNECTED_TO_axm_m0_arprot,   --          .arprot
			axm_m0_arqos    => CONNECTED_TO_axm_m0_arqos,    --          .arqos
			axm_m0_arready  => CONNECTED_TO_axm_m0_arready,  --          .arready
			axm_m0_arsize   => CONNECTED_TO_axm_m0_arsize,   --          .arsize
			axm_m0_arvalid  => CONNECTED_TO_axm_m0_arvalid,  --          .arvalid
			axm_m0_arsnoop  => CONNECTED_TO_axm_m0_arsnoop,  --          .arsnoop
			axm_m0_ardomain => CONNECTED_TO_axm_m0_ardomain, --          .ardomain
			axm_m0_arbar    => CONNECTED_TO_axm_m0_arbar,    --          .arbar
			axm_m0_aruser   => CONNECTED_TO_axm_m0_aruser,   --          .aruser
			axm_m0_awaddr   => CONNECTED_TO_axm_m0_awaddr,   --          .awaddr
			axm_m0_awburst  => CONNECTED_TO_axm_m0_awburst,  --          .awburst
			axm_m0_awcache  => CONNECTED_TO_axm_m0_awcache,  --          .awcache
			axm_m0_awid     => CONNECTED_TO_axm_m0_awid,     --          .awid
			axm_m0_awlen    => CONNECTED_TO_axm_m0_awlen,    --          .awlen
			axm_m0_awlock   => CONNECTED_TO_axm_m0_awlock,   --          .awlock
			axm_m0_awprot   => CONNECTED_TO_axm_m0_awprot,   --          .awprot
			axm_m0_awready  => CONNECTED_TO_axm_m0_awready,  --          .awready
			axm_m0_awsize   => CONNECTED_TO_axm_m0_awsize,   --          .awsize
			axm_m0_awvalid  => CONNECTED_TO_axm_m0_awvalid,  --          .awvalid
			axm_m0_awqos    => CONNECTED_TO_axm_m0_awqos,    --          .awqos
			axm_m0_bid      => CONNECTED_TO_axm_m0_bid,      --          .bid
			axm_m0_bready   => CONNECTED_TO_axm_m0_bready,   --          .bready
			axm_m0_bresp    => CONNECTED_TO_axm_m0_bresp,    --          .bresp
			axm_m0_bvalid   => CONNECTED_TO_axm_m0_bvalid,   --          .bvalid
			axm_m0_rdata    => CONNECTED_TO_axm_m0_rdata,    --          .rdata
			axm_m0_rid      => CONNECTED_TO_axm_m0_rid,      --          .rid
			axm_m0_rlast    => CONNECTED_TO_axm_m0_rlast,    --          .rlast
			axm_m0_rready   => CONNECTED_TO_axm_m0_rready,   --          .rready
			axm_m0_rresp    => CONNECTED_TO_axm_m0_rresp,    --          .rresp
			axm_m0_rvalid   => CONNECTED_TO_axm_m0_rvalid,   --          .rvalid
			axm_m0_wdata    => CONNECTED_TO_axm_m0_wdata,    --          .wdata
			axm_m0_wlast    => CONNECTED_TO_axm_m0_wlast,    --          .wlast
			axm_m0_wready   => CONNECTED_TO_axm_m0_wready,   --          .wready
			axm_m0_wstrb    => CONNECTED_TO_axm_m0_wstrb,    --          .wstrb
			axm_m0_wvalid   => CONNECTED_TO_axm_m0_wvalid,   --          .wvalid
			axm_m0_awsnoop  => CONNECTED_TO_axm_m0_awsnoop,  --          .awsnoop
			axm_m0_awdomain => CONNECTED_TO_axm_m0_awdomain, --          .awdomain
			axm_m0_awbar    => CONNECTED_TO_axm_m0_awbar,    --          .awbar
			axm_m0_awuser   => CONNECTED_TO_axm_m0_awuser,   --          .awuser
			axs_s0_araddr   => CONNECTED_TO_axs_s0_araddr,   --        s0.araddr
			axs_s0_arburst  => CONNECTED_TO_axs_s0_arburst,  --          .arburst
			axs_s0_arcache  => CONNECTED_TO_axs_s0_arcache,  --          .arcache
			axs_s0_arid     => CONNECTED_TO_axs_s0_arid,     --          .arid
			axs_s0_arlen    => CONNECTED_TO_axs_s0_arlen,    --          .arlen
			axs_s0_arlock   => CONNECTED_TO_axs_s0_arlock,   --          .arlock
			axs_s0_arprot   => CONNECTED_TO_axs_s0_arprot,   --          .arprot
			axs_s0_arready  => CONNECTED_TO_axs_s0_arready,  --          .arready
			axs_s0_arsize   => CONNECTED_TO_axs_s0_arsize,   --          .arsize
			axs_s0_arvalid  => CONNECTED_TO_axs_s0_arvalid,  --          .arvalid
			axs_s0_awaddr   => CONNECTED_TO_axs_s0_awaddr,   --          .awaddr
			axs_s0_awburst  => CONNECTED_TO_axs_s0_awburst,  --          .awburst
			axs_s0_awcache  => CONNECTED_TO_axs_s0_awcache,  --          .awcache
			axs_s0_awid     => CONNECTED_TO_axs_s0_awid,     --          .awid
			axs_s0_awlen    => CONNECTED_TO_axs_s0_awlen,    --          .awlen
			axs_s0_awlock   => CONNECTED_TO_axs_s0_awlock,   --          .awlock
			axs_s0_awprot   => CONNECTED_TO_axs_s0_awprot,   --          .awprot
			axs_s0_awready  => CONNECTED_TO_axs_s0_awready,  --          .awready
			axs_s0_awsize   => CONNECTED_TO_axs_s0_awsize,   --          .awsize
			axs_s0_awvalid  => CONNECTED_TO_axs_s0_awvalid,  --          .awvalid
			axs_s0_bid      => CONNECTED_TO_axs_s0_bid,      --          .bid
			axs_s0_bready   => CONNECTED_TO_axs_s0_bready,   --          .bready
			axs_s0_bresp    => CONNECTED_TO_axs_s0_bresp,    --          .bresp
			axs_s0_bvalid   => CONNECTED_TO_axs_s0_bvalid,   --          .bvalid
			axs_s0_rdata    => CONNECTED_TO_axs_s0_rdata,    --          .rdata
			axs_s0_rid      => CONNECTED_TO_axs_s0_rid,      --          .rid
			axs_s0_rlast    => CONNECTED_TO_axs_s0_rlast,    --          .rlast
			axs_s0_rready   => CONNECTED_TO_axs_s0_rready,   --          .rready
			axs_s0_rresp    => CONNECTED_TO_axs_s0_rresp,    --          .rresp
			axs_s0_rvalid   => CONNECTED_TO_axs_s0_rvalid,   --          .rvalid
			axs_s0_wdata    => CONNECTED_TO_axs_s0_wdata,    --          .wdata
			axs_s0_wlast    => CONNECTED_TO_axs_s0_wlast,    --          .wlast
			axs_s0_wready   => CONNECTED_TO_axs_s0_wready,   --          .wready
			axs_s0_wstrb    => CONNECTED_TO_axs_s0_wstrb,    --          .wstrb
			axs_s0_wvalid   => CONNECTED_TO_axs_s0_wvalid    --          .wvalid
		);

