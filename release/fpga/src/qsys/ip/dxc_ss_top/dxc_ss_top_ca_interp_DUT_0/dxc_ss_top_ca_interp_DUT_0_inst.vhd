	component dxc_ss_top_ca_interp_DUT_0 is
		port (
			clk                  : in  std_logic                     := 'X';             -- clk
			areset               : in  std_logic                     := 'X';             -- reset
			bus_clk              : in  std_logic                     := 'X';             -- clk
			bus_areset           : in  std_logic                     := 'X';             -- reset
			busIn_address        : in  std_logic_vector(13 downto 0) := (others => 'X'); -- address
			busIn_read           : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- read
			busIn_write          : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- write
			busIn_writedata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			busOut_readdata      : out std_logic_vector(31 downto 0);                    -- readdata
			busOut_readdatavalid : out std_logic_vector(0 downto 0);                     -- readdatavalid
			busOut_waitrequest   : out std_logic_vector(0 downto 0);                     -- waitrequest
			DUC_Valid_l1_s       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- valid_DUC_Valid_l1_s
			DUC_Chan_l1_s        : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- channel_DUC_Chan_l1_s
			DUC_Data_l1_0im      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l1_0im
			DUC_Data_l1_0re      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l1_0re
			DUC_Data_l1_1im      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l1_1im
			DUC_Data_l1_1re      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l1_1re
			DUC_Data_l1_2im      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l1_2im
			DUC_Data_l1_2re      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l1_2re
			DUC_Data_l1_3im      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l1_3im
			DUC_Data_l1_3re      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l1_3re
			DUC_Valid_l2_s       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- valid_DUC_Valid_l2_s
			DUC_Chan_l2_s        : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- channel_DUC_Chan_l2_s
			DUC_Data_l2_0im      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l2_0im
			DUC_Data_l2_0re      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l2_0re
			DUC_Data_l2_1im      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l2_1im
			DUC_Data_l2_1re      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l2_1re
			DUC_Data_l2_2im      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l2_2im
			DUC_Data_l2_2re      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l2_2re
			DUC_Data_l2_3im      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l2_3im
			DUC_Data_l2_3re      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l2_3re
			DUC_Valid_Out_s      : out std_logic_vector(0 downto 0);                     -- valid_DUC_Valid_Out_s
			DUC_Chan_Out_s       : out std_logic_vector(7 downto 0);                     -- channel_DUC_Chan_Out_s
			DUC_Ant_Data_Out_0im : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_0im
			DUC_Ant_Data_Out_0re : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_0re
			DUC_Ant_Data_Out_1im : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_1im
			DUC_Ant_Data_Out_1re : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_1re
			DUC_Ant_Data_Out_2im : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_2im
			DUC_Ant_Data_Out_2re : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_2re
			DUC_Ant_Data_Out_3im : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_3im
			DUC_Ant_Data_Out_3re : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_3re
			DUC_Ant_Data_Out_4im : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_4im
			DUC_Ant_Data_Out_4re : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_4re
			DUC_Ant_Data_Out_5im : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_5im
			DUC_Ant_Data_Out_5re : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_5re
			DUC_Ant_Data_Out_6im : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_6im
			DUC_Ant_Data_Out_6re : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_6re
			DUC_Ant_Data_Out_7im : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_7im
			DUC_Ant_Data_Out_7re : out std_logic_vector(15 downto 0);                    -- data_DUC_Ant_Data_Out_7re
			summer_vout_s        : out std_logic_vector(0 downto 0);                     -- valid_summer_vout_s
			summer_cout_s        : out std_logic_vector(7 downto 0);                     -- channel_summer_cout_s
			summer_dout_0im      : out std_logic_vector(15 downto 0);                    -- data_summer_dout_0im
			summer_dout_0re      : out std_logic_vector(15 downto 0);                    -- data_summer_dout_0re
			summer_dout_1im      : out std_logic_vector(15 downto 0);                    -- data_summer_dout_1im
			summer_dout_1re      : out std_logic_vector(15 downto 0);                    -- data_summer_dout_1re
			summer_dout_2im      : out std_logic_vector(15 downto 0);                    -- data_summer_dout_2im
			summer_dout_2re      : out std_logic_vector(15 downto 0);                    -- data_summer_dout_2re
			summer_dout_3im      : out std_logic_vector(15 downto 0);                    -- data_summer_dout_3im
			summer_dout_3re      : out std_logic_vector(15 downto 0)                     -- data_summer_dout_3re
		);
	end component dxc_ss_top_ca_interp_DUT_0;

	u0 : component dxc_ss_top_ca_interp_DUT_0
		port map (
			clk                  => CONNECTED_TO_clk,                  --           clock.clk
			areset               => CONNECTED_TO_areset,               --     clock_reset.reset
			bus_clk              => CONNECTED_TO_bus_clk,              --       bus_clock.clk
			bus_areset           => CONNECTED_TO_bus_areset,           -- bus_clock_reset.reset
			busIn_address        => CONNECTED_TO_busIn_address,        --             bus.address
			busIn_read           => CONNECTED_TO_busIn_read,           --                .read
			busIn_write          => CONNECTED_TO_busIn_write,          --                .write
			busIn_writedata      => CONNECTED_TO_busIn_writedata,      --                .writedata
			busOut_readdata      => CONNECTED_TO_busOut_readdata,      --                .readdata
			busOut_readdatavalid => CONNECTED_TO_busOut_readdatavalid, --                .readdatavalid
			busOut_waitrequest   => CONNECTED_TO_busOut_waitrequest,   --                .waitrequest
			DUC_Valid_l1_s       => CONNECTED_TO_DUC_Valid_l1_s,       --             exp.valid_DUC_Valid_l1_s
			DUC_Chan_l1_s        => CONNECTED_TO_DUC_Chan_l1_s,        --                .channel_DUC_Chan_l1_s
			DUC_Data_l1_0im      => CONNECTED_TO_DUC_Data_l1_0im,      --                .data_DUC_Data_l1_0im
			DUC_Data_l1_0re      => CONNECTED_TO_DUC_Data_l1_0re,      --                .data_DUC_Data_l1_0re
			DUC_Data_l1_1im      => CONNECTED_TO_DUC_Data_l1_1im,      --                .data_DUC_Data_l1_1im
			DUC_Data_l1_1re      => CONNECTED_TO_DUC_Data_l1_1re,      --                .data_DUC_Data_l1_1re
			DUC_Data_l1_2im      => CONNECTED_TO_DUC_Data_l1_2im,      --                .data_DUC_Data_l1_2im
			DUC_Data_l1_2re      => CONNECTED_TO_DUC_Data_l1_2re,      --                .data_DUC_Data_l1_2re
			DUC_Data_l1_3im      => CONNECTED_TO_DUC_Data_l1_3im,      --                .data_DUC_Data_l1_3im
			DUC_Data_l1_3re      => CONNECTED_TO_DUC_Data_l1_3re,      --                .data_DUC_Data_l1_3re
			DUC_Valid_l2_s       => CONNECTED_TO_DUC_Valid_l2_s,       --                .valid_DUC_Valid_l2_s
			DUC_Chan_l2_s        => CONNECTED_TO_DUC_Chan_l2_s,        --                .channel_DUC_Chan_l2_s
			DUC_Data_l2_0im      => CONNECTED_TO_DUC_Data_l2_0im,      --                .data_DUC_Data_l2_0im
			DUC_Data_l2_0re      => CONNECTED_TO_DUC_Data_l2_0re,      --                .data_DUC_Data_l2_0re
			DUC_Data_l2_1im      => CONNECTED_TO_DUC_Data_l2_1im,      --                .data_DUC_Data_l2_1im
			DUC_Data_l2_1re      => CONNECTED_TO_DUC_Data_l2_1re,      --                .data_DUC_Data_l2_1re
			DUC_Data_l2_2im      => CONNECTED_TO_DUC_Data_l2_2im,      --                .data_DUC_Data_l2_2im
			DUC_Data_l2_2re      => CONNECTED_TO_DUC_Data_l2_2re,      --                .data_DUC_Data_l2_2re
			DUC_Data_l2_3im      => CONNECTED_TO_DUC_Data_l2_3im,      --                .data_DUC_Data_l2_3im
			DUC_Data_l2_3re      => CONNECTED_TO_DUC_Data_l2_3re,      --                .data_DUC_Data_l2_3re
			DUC_Valid_Out_s      => CONNECTED_TO_DUC_Valid_Out_s,      --                .valid_DUC_Valid_Out_s
			DUC_Chan_Out_s       => CONNECTED_TO_DUC_Chan_Out_s,       --                .channel_DUC_Chan_Out_s
			DUC_Ant_Data_Out_0im => CONNECTED_TO_DUC_Ant_Data_Out_0im, --                .data_DUC_Ant_Data_Out_0im
			DUC_Ant_Data_Out_0re => CONNECTED_TO_DUC_Ant_Data_Out_0re, --                .data_DUC_Ant_Data_Out_0re
			DUC_Ant_Data_Out_1im => CONNECTED_TO_DUC_Ant_Data_Out_1im, --                .data_DUC_Ant_Data_Out_1im
			DUC_Ant_Data_Out_1re => CONNECTED_TO_DUC_Ant_Data_Out_1re, --                .data_DUC_Ant_Data_Out_1re
			DUC_Ant_Data_Out_2im => CONNECTED_TO_DUC_Ant_Data_Out_2im, --                .data_DUC_Ant_Data_Out_2im
			DUC_Ant_Data_Out_2re => CONNECTED_TO_DUC_Ant_Data_Out_2re, --                .data_DUC_Ant_Data_Out_2re
			DUC_Ant_Data_Out_3im => CONNECTED_TO_DUC_Ant_Data_Out_3im, --                .data_DUC_Ant_Data_Out_3im
			DUC_Ant_Data_Out_3re => CONNECTED_TO_DUC_Ant_Data_Out_3re, --                .data_DUC_Ant_Data_Out_3re
			DUC_Ant_Data_Out_4im => CONNECTED_TO_DUC_Ant_Data_Out_4im, --                .data_DUC_Ant_Data_Out_4im
			DUC_Ant_Data_Out_4re => CONNECTED_TO_DUC_Ant_Data_Out_4re, --                .data_DUC_Ant_Data_Out_4re
			DUC_Ant_Data_Out_5im => CONNECTED_TO_DUC_Ant_Data_Out_5im, --                .data_DUC_Ant_Data_Out_5im
			DUC_Ant_Data_Out_5re => CONNECTED_TO_DUC_Ant_Data_Out_5re, --                .data_DUC_Ant_Data_Out_5re
			DUC_Ant_Data_Out_6im => CONNECTED_TO_DUC_Ant_Data_Out_6im, --                .data_DUC_Ant_Data_Out_6im
			DUC_Ant_Data_Out_6re => CONNECTED_TO_DUC_Ant_Data_Out_6re, --                .data_DUC_Ant_Data_Out_6re
			DUC_Ant_Data_Out_7im => CONNECTED_TO_DUC_Ant_Data_Out_7im, --                .data_DUC_Ant_Data_Out_7im
			DUC_Ant_Data_Out_7re => CONNECTED_TO_DUC_Ant_Data_Out_7re, --                .data_DUC_Ant_Data_Out_7re
			summer_vout_s        => CONNECTED_TO_summer_vout_s,        --                .valid_summer_vout_s
			summer_cout_s        => CONNECTED_TO_summer_cout_s,        --                .channel_summer_cout_s
			summer_dout_0im      => CONNECTED_TO_summer_dout_0im,      --                .data_summer_dout_0im
			summer_dout_0re      => CONNECTED_TO_summer_dout_0re,      --                .data_summer_dout_0re
			summer_dout_1im      => CONNECTED_TO_summer_dout_1im,      --                .data_summer_dout_1im
			summer_dout_1re      => CONNECTED_TO_summer_dout_1re,      --                .data_summer_dout_1re
			summer_dout_2im      => CONNECTED_TO_summer_dout_2im,      --                .data_summer_dout_2im
			summer_dout_2re      => CONNECTED_TO_summer_dout_2re,      --                .data_summer_dout_2re
			summer_dout_3im      => CONNECTED_TO_summer_dout_3im,      --                .data_summer_dout_3im
			summer_dout_3re      => CONNECTED_TO_summer_dout_3re       --                .data_summer_dout_3re
		);

