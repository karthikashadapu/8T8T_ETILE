	component subsys_jtg_mst is
		port (
			fpga_m_master_address          : out std_logic_vector(31 downto 0);                     -- address
			fpga_m_master_readdata         : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- readdata
			fpga_m_master_read             : out std_logic;                                         -- read
			fpga_m_master_write            : out std_logic;                                         -- write
			fpga_m_master_writedata        : out std_logic_vector(31 downto 0);                     -- writedata
			fpga_m_master_waitrequest      : in  std_logic                      := 'X';             -- waitrequest
			fpga_m_master_readdatavalid    : in  std_logic                      := 'X';             -- readdatavalid
			fpga_m_master_byteenable       : out std_logic_vector(3 downto 0);                      -- byteenable
			fpga_m2ocm_pb_s0_waitrequest   : out std_logic;                                         -- waitrequest
			fpga_m2ocm_pb_s0_readdata      : out std_logic_vector(127 downto 0);                    -- readdata
			fpga_m2ocm_pb_s0_readdatavalid : out std_logic;                                         -- readdatavalid
			fpga_m2ocm_pb_s0_burstcount    : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			fpga_m2ocm_pb_s0_writedata     : in  std_logic_vector(127 downto 0) := (others => 'X'); -- writedata
			fpga_m2ocm_pb_s0_address       : in  std_logic_vector(17 downto 0)  := (others => 'X'); -- address
			fpga_m2ocm_pb_s0_write         : in  std_logic                      := 'X';             -- write
			fpga_m2ocm_pb_s0_read          : in  std_logic                      := 'X';             -- read
			fpga_m2ocm_pb_s0_byteenable    : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- byteenable
			fpga_m2ocm_pb_s0_debugaccess   : in  std_logic                      := 'X';             -- debugaccess
			fpga_m2ocm_pb_m0_waitrequest   : in  std_logic                      := 'X';             -- waitrequest
			fpga_m2ocm_pb_m0_readdata      : in  std_logic_vector(127 downto 0) := (others => 'X'); -- readdata
			fpga_m2ocm_pb_m0_readdatavalid : in  std_logic                      := 'X';             -- readdatavalid
			fpga_m2ocm_pb_m0_burstcount    : out std_logic_vector(0 downto 0);                      -- burstcount
			fpga_m2ocm_pb_m0_writedata     : out std_logic_vector(127 downto 0);                    -- writedata
			fpga_m2ocm_pb_m0_address       : out std_logic_vector(17 downto 0);                     -- address
			fpga_m2ocm_pb_m0_write         : out std_logic;                                         -- write
			fpga_m2ocm_pb_m0_read          : out std_logic;                                         -- read
			fpga_m2ocm_pb_m0_byteenable    : out std_logic_vector(15 downto 0);                     -- byteenable
			fpga_m2ocm_pb_m0_debugaccess   : out std_logic;                                         -- debugaccess
			hps_m_master_address           : out std_logic_vector(31 downto 0);                     -- address
			hps_m_master_readdata          : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- readdata
			hps_m_master_read              : out std_logic;                                         -- read
			hps_m_master_write             : out std_logic;                                         -- write
			hps_m_master_writedata         : out std_logic_vector(31 downto 0);                     -- writedata
			hps_m_master_waitrequest       : in  std_logic                      := 'X';             -- waitrequest
			hps_m_master_readdatavalid     : in  std_logic                      := 'X';             -- readdatavalid
			hps_m_master_byteenable        : out std_logic_vector(3 downto 0);                      -- byteenable
			clk_clk                        : in  std_logic                      := 'X';             -- clk
			reset_reset_n                  : in  std_logic                      := 'X'              -- reset_n
		);
	end component subsys_jtg_mst;

	u0 : component subsys_jtg_mst
		port map (
			fpga_m_master_address          => CONNECTED_TO_fpga_m_master_address,          --    fpga_m_master.address
			fpga_m_master_readdata         => CONNECTED_TO_fpga_m_master_readdata,         --                 .readdata
			fpga_m_master_read             => CONNECTED_TO_fpga_m_master_read,             --                 .read
			fpga_m_master_write            => CONNECTED_TO_fpga_m_master_write,            --                 .write
			fpga_m_master_writedata        => CONNECTED_TO_fpga_m_master_writedata,        --                 .writedata
			fpga_m_master_waitrequest      => CONNECTED_TO_fpga_m_master_waitrequest,      --                 .waitrequest
			fpga_m_master_readdatavalid    => CONNECTED_TO_fpga_m_master_readdatavalid,    --                 .readdatavalid
			fpga_m_master_byteenable       => CONNECTED_TO_fpga_m_master_byteenable,       --                 .byteenable
			fpga_m2ocm_pb_s0_waitrequest   => CONNECTED_TO_fpga_m2ocm_pb_s0_waitrequest,   -- fpga_m2ocm_pb_s0.waitrequest
			fpga_m2ocm_pb_s0_readdata      => CONNECTED_TO_fpga_m2ocm_pb_s0_readdata,      --                 .readdata
			fpga_m2ocm_pb_s0_readdatavalid => CONNECTED_TO_fpga_m2ocm_pb_s0_readdatavalid, --                 .readdatavalid
			fpga_m2ocm_pb_s0_burstcount    => CONNECTED_TO_fpga_m2ocm_pb_s0_burstcount,    --                 .burstcount
			fpga_m2ocm_pb_s0_writedata     => CONNECTED_TO_fpga_m2ocm_pb_s0_writedata,     --                 .writedata
			fpga_m2ocm_pb_s0_address       => CONNECTED_TO_fpga_m2ocm_pb_s0_address,       --                 .address
			fpga_m2ocm_pb_s0_write         => CONNECTED_TO_fpga_m2ocm_pb_s0_write,         --                 .write
			fpga_m2ocm_pb_s0_read          => CONNECTED_TO_fpga_m2ocm_pb_s0_read,          --                 .read
			fpga_m2ocm_pb_s0_byteenable    => CONNECTED_TO_fpga_m2ocm_pb_s0_byteenable,    --                 .byteenable
			fpga_m2ocm_pb_s0_debugaccess   => CONNECTED_TO_fpga_m2ocm_pb_s0_debugaccess,   --                 .debugaccess
			fpga_m2ocm_pb_m0_waitrequest   => CONNECTED_TO_fpga_m2ocm_pb_m0_waitrequest,   -- fpga_m2ocm_pb_m0.waitrequest
			fpga_m2ocm_pb_m0_readdata      => CONNECTED_TO_fpga_m2ocm_pb_m0_readdata,      --                 .readdata
			fpga_m2ocm_pb_m0_readdatavalid => CONNECTED_TO_fpga_m2ocm_pb_m0_readdatavalid, --                 .readdatavalid
			fpga_m2ocm_pb_m0_burstcount    => CONNECTED_TO_fpga_m2ocm_pb_m0_burstcount,    --                 .burstcount
			fpga_m2ocm_pb_m0_writedata     => CONNECTED_TO_fpga_m2ocm_pb_m0_writedata,     --                 .writedata
			fpga_m2ocm_pb_m0_address       => CONNECTED_TO_fpga_m2ocm_pb_m0_address,       --                 .address
			fpga_m2ocm_pb_m0_write         => CONNECTED_TO_fpga_m2ocm_pb_m0_write,         --                 .write
			fpga_m2ocm_pb_m0_read          => CONNECTED_TO_fpga_m2ocm_pb_m0_read,          --                 .read
			fpga_m2ocm_pb_m0_byteenable    => CONNECTED_TO_fpga_m2ocm_pb_m0_byteenable,    --                 .byteenable
			fpga_m2ocm_pb_m0_debugaccess   => CONNECTED_TO_fpga_m2ocm_pb_m0_debugaccess,   --                 .debugaccess
			hps_m_master_address           => CONNECTED_TO_hps_m_master_address,           --     hps_m_master.address
			hps_m_master_readdata          => CONNECTED_TO_hps_m_master_readdata,          --                 .readdata
			hps_m_master_read              => CONNECTED_TO_hps_m_master_read,              --                 .read
			hps_m_master_write             => CONNECTED_TO_hps_m_master_write,             --                 .write
			hps_m_master_writedata         => CONNECTED_TO_hps_m_master_writedata,         --                 .writedata
			hps_m_master_waitrequest       => CONNECTED_TO_hps_m_master_waitrequest,       --                 .waitrequest
			hps_m_master_readdatavalid     => CONNECTED_TO_hps_m_master_readdatavalid,     --                 .readdatavalid
			hps_m_master_byteenable        => CONNECTED_TO_hps_m_master_byteenable,        --                 .byteenable
			clk_clk                        => CONNECTED_TO_clk_clk,                        --              clk.clk
			reset_reset_n                  => CONNECTED_TO_reset_reset_n                   --            reset.reset_n
		);

