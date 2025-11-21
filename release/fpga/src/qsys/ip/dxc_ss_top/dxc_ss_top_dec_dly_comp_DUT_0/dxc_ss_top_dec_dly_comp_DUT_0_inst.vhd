	component dxc_ss_top_dec_dly_comp_DUT_0 is
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
			DDC_Valid_In_s       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- valid_DDC_Valid_In_s
			DDC_Chan_In_s        : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- channel_DDC_Chan_In_s
			DDC_Ant_Data_In_0im  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_0im
			DDC_Ant_Data_In_0re  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_0re
			DDC_Ant_Data_In_1im  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_1im
			DDC_Ant_Data_In_1re  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_1re
			DDC_Ant_Data_In_2im  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_2im
			DDC_Ant_Data_In_2re  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_2re
			DDC_Ant_Data_In_3im  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_3im
			DDC_Ant_Data_In_3re  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_3re
			DDC_Ant_Data_In_4im  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_4im
			DDC_Ant_Data_In_4re  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_4re
			DDC_Ant_Data_In_5im  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_5im
			DDC_Ant_Data_In_5re  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_5re
			DDC_Ant_Data_In_6im  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_6im
			DDC_Ant_Data_In_6re  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_6re
			DDC_Ant_Data_In_7im  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_7im
			DDC_Ant_Data_In_7re  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DDC_Ant_Data_In_7re
			alq_l1_dout_0im      : out std_logic_vector(31 downto 0);                    -- data_alq_l1_dout_0im
			alq_l1_dout_0re      : out std_logic_vector(31 downto 0);                    -- data_alq_l1_dout_0re
			alq_l1_dout_1im      : out std_logic_vector(31 downto 0);                    -- data_alq_l1_dout_1im
			alq_l1_dout_1re      : out std_logic_vector(31 downto 0);                    -- data_alq_l1_dout_1re
			alq_l1_dout_2im      : out std_logic_vector(31 downto 0);                    -- data_alq_l1_dout_2im
			alq_l1_dout_2re      : out std_logic_vector(31 downto 0);                    -- data_alq_l1_dout_2re
			alq_l1_dout_3im      : out std_logic_vector(31 downto 0);                    -- data_alq_l1_dout_3im
			alq_l1_dout_3re      : out std_logic_vector(31 downto 0);                    -- data_alq_l1_dout_3re
			alq_l1_vout_s        : out std_logic_vector(0 downto 0);                     -- valid_alq_l1_vout_s
			alq_l1_cout_s        : out std_logic_vector(7 downto 0);                     -- channel_alq_l1_cout_s
			alq_l2_dout_0im      : out std_logic_vector(31 downto 0);                    -- data_alq_l2_dout_0im
			alq_l2_dout_0re      : out std_logic_vector(31 downto 0);                    -- data_alq_l2_dout_0re
			alq_l2_dout_1im      : out std_logic_vector(31 downto 0);                    -- data_alq_l2_dout_1im
			alq_l2_dout_1re      : out std_logic_vector(31 downto 0);                    -- data_alq_l2_dout_1re
			alq_l2_dout_2im      : out std_logic_vector(31 downto 0);                    -- data_alq_l2_dout_2im
			alq_l2_dout_2re      : out std_logic_vector(31 downto 0);                    -- data_alq_l2_dout_2re
			alq_l2_dout_3im      : out std_logic_vector(31 downto 0);                    -- data_alq_l2_dout_3im
			alq_l2_dout_3re      : out std_logic_vector(31 downto 0);                    -- data_alq_l2_dout_3re
			alq_l2_vout_s        : out std_logic_vector(0 downto 0);                     -- valid_alq_l2_vout_s
			alq_l2_cout_s        : out std_logic_vector(7 downto 0)                      -- channel_alq_l2_cout_s
		);
	end component dxc_ss_top_dec_dly_comp_DUT_0;

	u0 : component dxc_ss_top_dec_dly_comp_DUT_0
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
			DDC_Valid_In_s       => CONNECTED_TO_DDC_Valid_In_s,       --             exp.valid_DDC_Valid_In_s
			DDC_Chan_In_s        => CONNECTED_TO_DDC_Chan_In_s,        --                .channel_DDC_Chan_In_s
			DDC_Ant_Data_In_0im  => CONNECTED_TO_DDC_Ant_Data_In_0im,  --                .data_DDC_Ant_Data_In_0im
			DDC_Ant_Data_In_0re  => CONNECTED_TO_DDC_Ant_Data_In_0re,  --                .data_DDC_Ant_Data_In_0re
			DDC_Ant_Data_In_1im  => CONNECTED_TO_DDC_Ant_Data_In_1im,  --                .data_DDC_Ant_Data_In_1im
			DDC_Ant_Data_In_1re  => CONNECTED_TO_DDC_Ant_Data_In_1re,  --                .data_DDC_Ant_Data_In_1re
			DDC_Ant_Data_In_2im  => CONNECTED_TO_DDC_Ant_Data_In_2im,  --                .data_DDC_Ant_Data_In_2im
			DDC_Ant_Data_In_2re  => CONNECTED_TO_DDC_Ant_Data_In_2re,  --                .data_DDC_Ant_Data_In_2re
			DDC_Ant_Data_In_3im  => CONNECTED_TO_DDC_Ant_Data_In_3im,  --                .data_DDC_Ant_Data_In_3im
			DDC_Ant_Data_In_3re  => CONNECTED_TO_DDC_Ant_Data_In_3re,  --                .data_DDC_Ant_Data_In_3re
			DDC_Ant_Data_In_4im  => CONNECTED_TO_DDC_Ant_Data_In_4im,  --                .data_DDC_Ant_Data_In_4im
			DDC_Ant_Data_In_4re  => CONNECTED_TO_DDC_Ant_Data_In_4re,  --                .data_DDC_Ant_Data_In_4re
			DDC_Ant_Data_In_5im  => CONNECTED_TO_DDC_Ant_Data_In_5im,  --                .data_DDC_Ant_Data_In_5im
			DDC_Ant_Data_In_5re  => CONNECTED_TO_DDC_Ant_Data_In_5re,  --                .data_DDC_Ant_Data_In_5re
			DDC_Ant_Data_In_6im  => CONNECTED_TO_DDC_Ant_Data_In_6im,  --                .data_DDC_Ant_Data_In_6im
			DDC_Ant_Data_In_6re  => CONNECTED_TO_DDC_Ant_Data_In_6re,  --                .data_DDC_Ant_Data_In_6re
			DDC_Ant_Data_In_7im  => CONNECTED_TO_DDC_Ant_Data_In_7im,  --                .data_DDC_Ant_Data_In_7im
			DDC_Ant_Data_In_7re  => CONNECTED_TO_DDC_Ant_Data_In_7re,  --                .data_DDC_Ant_Data_In_7re
			alq_l1_dout_0im      => CONNECTED_TO_alq_l1_dout_0im,      --                .data_alq_l1_dout_0im
			alq_l1_dout_0re      => CONNECTED_TO_alq_l1_dout_0re,      --                .data_alq_l1_dout_0re
			alq_l1_dout_1im      => CONNECTED_TO_alq_l1_dout_1im,      --                .data_alq_l1_dout_1im
			alq_l1_dout_1re      => CONNECTED_TO_alq_l1_dout_1re,      --                .data_alq_l1_dout_1re
			alq_l1_dout_2im      => CONNECTED_TO_alq_l1_dout_2im,      --                .data_alq_l1_dout_2im
			alq_l1_dout_2re      => CONNECTED_TO_alq_l1_dout_2re,      --                .data_alq_l1_dout_2re
			alq_l1_dout_3im      => CONNECTED_TO_alq_l1_dout_3im,      --                .data_alq_l1_dout_3im
			alq_l1_dout_3re      => CONNECTED_TO_alq_l1_dout_3re,      --                .data_alq_l1_dout_3re
			alq_l1_vout_s        => CONNECTED_TO_alq_l1_vout_s,        --                .valid_alq_l1_vout_s
			alq_l1_cout_s        => CONNECTED_TO_alq_l1_cout_s,        --                .channel_alq_l1_cout_s
			alq_l2_dout_0im      => CONNECTED_TO_alq_l2_dout_0im,      --                .data_alq_l2_dout_0im
			alq_l2_dout_0re      => CONNECTED_TO_alq_l2_dout_0re,      --                .data_alq_l2_dout_0re
			alq_l2_dout_1im      => CONNECTED_TO_alq_l2_dout_1im,      --                .data_alq_l2_dout_1im
			alq_l2_dout_1re      => CONNECTED_TO_alq_l2_dout_1re,      --                .data_alq_l2_dout_1re
			alq_l2_dout_2im      => CONNECTED_TO_alq_l2_dout_2im,      --                .data_alq_l2_dout_2im
			alq_l2_dout_2re      => CONNECTED_TO_alq_l2_dout_2re,      --                .data_alq_l2_dout_2re
			alq_l2_dout_3im      => CONNECTED_TO_alq_l2_dout_3im,      --                .data_alq_l2_dout_3im
			alq_l2_dout_3re      => CONNECTED_TO_alq_l2_dout_3re,      --                .data_alq_l2_dout_3re
			alq_l2_vout_s        => CONNECTED_TO_alq_l2_vout_s,        --                .valid_alq_l2_vout_s
			alq_l2_cout_s        => CONNECTED_TO_alq_l2_cout_s         --                .channel_alq_l2_cout_s
		);

