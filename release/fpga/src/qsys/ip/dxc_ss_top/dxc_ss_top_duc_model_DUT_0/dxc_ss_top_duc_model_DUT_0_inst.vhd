	component dxc_ss_top_duc_model_DUT_0 is
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
			DUC_Data_l1_im       : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l1_im
			DUC_Data_l1_re       : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_DUC_Data_l1_re
			DUC_NCO_sync_0       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_DUC_NCO_sync_0
			DUC_NCO_sync_1       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_DUC_NCO_sync_1
			DUC_NCO_sync_2       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_DUC_NCO_sync_2
			DUC_NCO_sync_3       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_DUC_NCO_sync_3
			BW_Config_CC1_s      : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_BW_Config_CC1_s
			DUC_Valid_Out_s      : out std_logic_vector(0 downto 0);                     -- valid_DUC_Valid_Out_s
			DUC_Chan_Out_s       : out std_logic_vector(7 downto 0);                     -- channel_DUC_Chan_Out_s
			DUC_Data_Out_0im     : out std_logic_vector(15 downto 0);                    -- data_DUC_Data_Out_0im
			DUC_Data_Out_0re     : out std_logic_vector(15 downto 0);                    -- data_DUC_Data_Out_0re
			DUC_Data_Out_1im     : out std_logic_vector(15 downto 0);                    -- data_DUC_Data_Out_1im
			DUC_Data_Out_1re     : out std_logic_vector(15 downto 0);                    -- data_DUC_Data_Out_1re
			DUC_Data_Out_2im     : out std_logic_vector(15 downto 0);                    -- data_DUC_Data_Out_2im
			DUC_Data_Out_2re     : out std_logic_vector(15 downto 0);                    -- data_DUC_Data_Out_2re
			DUC_Data_Out_3im     : out std_logic_vector(15 downto 0);                    -- data_DUC_Data_Out_3im
			DUC_Data_Out_3re     : out std_logic_vector(15 downto 0);                    -- data_DUC_Data_Out_3re
			duc_l1_vout_s        : out std_logic_vector(0 downto 0);                     -- valid_duc_l1_vout_s
			duc_l1_cout_s        : out std_logic_vector(7 downto 0);                     -- channel_duc_l1_cout_s
			duc_l1_dout_0im      : out std_logic_vector(15 downto 0);                    -- data_duc_l1_dout_0im
			duc_l1_dout_0re      : out std_logic_vector(15 downto 0);                    -- data_duc_l1_dout_0re
			duc_l1_dout_1im      : out std_logic_vector(15 downto 0);                    -- data_duc_l1_dout_1im
			duc_l1_dout_1re      : out std_logic_vector(15 downto 0);                    -- data_duc_l1_dout_1re
			duc_l1_dout_2im      : out std_logic_vector(15 downto 0);                    -- data_duc_l1_dout_2im
			duc_l1_dout_2re      : out std_logic_vector(15 downto 0);                    -- data_duc_l1_dout_2re
			duc_l1_dout_3im      : out std_logic_vector(15 downto 0);                    -- data_duc_l1_dout_3im
			duc_l1_dout_3re      : out std_logic_vector(15 downto 0)                     -- data_duc_l1_dout_3re
		);
	end component dxc_ss_top_duc_model_DUT_0;

	u0 : component dxc_ss_top_duc_model_DUT_0
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
			DUC_Data_l1_im       => CONNECTED_TO_DUC_Data_l1_im,       --                .data_DUC_Data_l1_im
			DUC_Data_l1_re       => CONNECTED_TO_DUC_Data_l1_re,       --                .data_DUC_Data_l1_re
			DUC_NCO_sync_0       => CONNECTED_TO_DUC_NCO_sync_0,       --                .data_DUC_NCO_sync_0
			DUC_NCO_sync_1       => CONNECTED_TO_DUC_NCO_sync_1,       --                .data_DUC_NCO_sync_1
			DUC_NCO_sync_2       => CONNECTED_TO_DUC_NCO_sync_2,       --                .data_DUC_NCO_sync_2
			DUC_NCO_sync_3       => CONNECTED_TO_DUC_NCO_sync_3,       --                .data_DUC_NCO_sync_3
			BW_Config_CC1_s      => CONNECTED_TO_BW_Config_CC1_s,      --                .data_BW_Config_CC1_s
			DUC_Valid_Out_s      => CONNECTED_TO_DUC_Valid_Out_s,      --                .valid_DUC_Valid_Out_s
			DUC_Chan_Out_s       => CONNECTED_TO_DUC_Chan_Out_s,       --                .channel_DUC_Chan_Out_s
			DUC_Data_Out_0im     => CONNECTED_TO_DUC_Data_Out_0im,     --                .data_DUC_Data_Out_0im
			DUC_Data_Out_0re     => CONNECTED_TO_DUC_Data_Out_0re,     --                .data_DUC_Data_Out_0re
			DUC_Data_Out_1im     => CONNECTED_TO_DUC_Data_Out_1im,     --                .data_DUC_Data_Out_1im
			DUC_Data_Out_1re     => CONNECTED_TO_DUC_Data_Out_1re,     --                .data_DUC_Data_Out_1re
			DUC_Data_Out_2im     => CONNECTED_TO_DUC_Data_Out_2im,     --                .data_DUC_Data_Out_2im
			DUC_Data_Out_2re     => CONNECTED_TO_DUC_Data_Out_2re,     --                .data_DUC_Data_Out_2re
			DUC_Data_Out_3im     => CONNECTED_TO_DUC_Data_Out_3im,     --                .data_DUC_Data_Out_3im
			DUC_Data_Out_3re     => CONNECTED_TO_DUC_Data_Out_3re,     --                .data_DUC_Data_Out_3re
			duc_l1_vout_s        => CONNECTED_TO_duc_l1_vout_s,        --                .valid_duc_l1_vout_s
			duc_l1_cout_s        => CONNECTED_TO_duc_l1_cout_s,        --                .channel_duc_l1_cout_s
			duc_l1_dout_0im      => CONNECTED_TO_duc_l1_dout_0im,      --                .data_duc_l1_dout_0im
			duc_l1_dout_0re      => CONNECTED_TO_duc_l1_dout_0re,      --                .data_duc_l1_dout_0re
			duc_l1_dout_1im      => CONNECTED_TO_duc_l1_dout_1im,      --                .data_duc_l1_dout_1im
			duc_l1_dout_1re      => CONNECTED_TO_duc_l1_dout_1re,      --                .data_duc_l1_dout_1re
			duc_l1_dout_2im      => CONNECTED_TO_duc_l1_dout_2im,      --                .data_duc_l1_dout_2im
			duc_l1_dout_2re      => CONNECTED_TO_duc_l1_dout_2re,      --                .data_duc_l1_dout_2re
			duc_l1_dout_3im      => CONNECTED_TO_duc_l1_dout_3im,      --                .data_duc_l1_dout_3im
			duc_l1_dout_3re      => CONNECTED_TO_duc_l1_dout_3re       --                .data_duc_l1_dout_3re
		);

