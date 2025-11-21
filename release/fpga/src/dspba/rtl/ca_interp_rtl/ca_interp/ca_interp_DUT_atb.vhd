-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 23.3 (Release Build #f9894c94f4)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2023 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from ca_interp_DUT
-- VHDL created on Tue Jan  7 17:04:26 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity ca_interp_DUT_atb is
end;

architecture normal of ca_interp_DUT_atb is

component ca_interp_DUT is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(13 downto 0);  -- ufix14
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        DUC_Valid_l1_s : in std_logic_vector(0 downto 0);  -- ufix1
        DUC_Chan_l1_s : in std_logic_vector(7 downto 0);  -- ufix8
        DUC_Data_l1_0im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l1_0re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l1_1im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l1_1re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l1_2im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l1_2re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l1_3im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l1_3re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Valid_l2_s : in std_logic_vector(0 downto 0);  -- ufix1
        DUC_Chan_l2_s : in std_logic_vector(7 downto 0);  -- ufix8
        DUC_Data_l2_0im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l2_0re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l2_1im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l2_1re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l2_2im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l2_2re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l2_3im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l2_3re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Valid_Out_s : out std_logic_vector(0 downto 0);  -- ufix1
        DUC_Chan_Out_s : out std_logic_vector(7 downto 0);  -- ufix8
        DUC_Ant_Data_Out_0im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_0re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_1im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_1re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_2im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_2re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_3im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_3re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_4im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_4re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_5im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_5re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_6im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_6re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_7im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Ant_Data_Out_7re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_vout_s : out std_logic_vector(0 downto 0);  -- ufix1
        summer_cout_s : out std_logic_vector(7 downto 0);  -- ufix8
        summer_dout_0im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_0re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_1im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_1re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_2im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_2re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_3im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_3re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component ca_interp_DUT_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        DUC_Valid_l1_s_stm : out std_logic_vector(0 downto 0);
        DUC_Chan_l1_s_stm : out std_logic_vector(7 downto 0);
        DUC_Data_l1_0im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_0re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_1im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_1re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_2im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_2re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_3im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_3re_stm : out std_logic_vector(15 downto 0);
        DUC_Valid_l2_s_stm : out std_logic_vector(0 downto 0);
        DUC_Chan_l2_s_stm : out std_logic_vector(7 downto 0);
        DUC_Data_l2_0im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l2_0re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l2_1im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l2_1re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l2_2im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l2_2re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l2_3im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l2_3re_stm : out std_logic_vector(15 downto 0);
        DUC_Valid_Out_s_stm : out std_logic_vector(0 downto 0);
        DUC_Chan_Out_s_stm : out std_logic_vector(7 downto 0);
        DUC_Ant_Data_Out_0im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_0re_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_1im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_1re_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_2im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_2re_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_3im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_3re_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_4im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_4re_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_5im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_5re_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_6im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_6re_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_7im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_7re_stm : out std_logic_vector(15 downto 0);
        summer_vout_s_stm : out std_logic_vector(0 downto 0);
        summer_cout_s_stm : out std_logic_vector(7 downto 0);
        summer_dout_0im_stm : out std_logic_vector(15 downto 0);
        summer_dout_0re_stm : out std_logic_vector(15 downto 0);
        summer_dout_1im_stm : out std_logic_vector(15 downto 0);
        summer_dout_1re_stm : out std_logic_vector(15 downto 0);
        summer_dout_2im_stm : out std_logic_vector(15 downto 0);
        summer_dout_2re_stm : out std_logic_vector(15 downto 0);
        summer_dout_3im_stm : out std_logic_vector(15 downto 0);
        summer_dout_3re_stm : out std_logic_vector(15 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end component;

signal busIn_writedata_stm : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_stm : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_stm : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_stm : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_Valid_l1_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_Chan_l1_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal DUC_Data_l1_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Valid_l2_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_Chan_l2_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal DUC_Data_l2_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l2_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l2_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l2_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l2_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l2_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l2_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l2_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Valid_Out_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_Chan_Out_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal DUC_Ant_Data_Out_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_4im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_4re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_5im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_5re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_6im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_6re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_7im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_7re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_vout_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal summer_cout_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal summer_dout_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_Valid_l1_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_Chan_l1_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal DUC_Data_l1_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Valid_l2_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_Chan_l2_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal DUC_Data_l2_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l2_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l2_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l2_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l2_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l2_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l2_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l2_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Valid_Out_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_Chan_Out_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal DUC_Ant_Data_Out_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_4im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_4re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_5im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_5re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_6im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_6re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_7im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Ant_Data_Out_7re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_vout_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal summer_cout_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal summer_dout_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkDUC_Valid_l1_s : process (clk, areset, DUC_Valid_l1_s_dut, DUC_Valid_l1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Chan_l1_s : process (clk, areset, DUC_Chan_l1_s_dut, DUC_Chan_l1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l1_0im : process (clk, areset, DUC_Data_l1_0im_dut, DUC_Data_l1_0im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l1_0re : process (clk, areset, DUC_Data_l1_0re_dut, DUC_Data_l1_0re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l1_1im : process (clk, areset, DUC_Data_l1_1im_dut, DUC_Data_l1_1im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l1_1re : process (clk, areset, DUC_Data_l1_1re_dut, DUC_Data_l1_1re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l1_2im : process (clk, areset, DUC_Data_l1_2im_dut, DUC_Data_l1_2im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l1_2re : process (clk, areset, DUC_Data_l1_2re_dut, DUC_Data_l1_2re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l1_3im : process (clk, areset, DUC_Data_l1_3im_dut, DUC_Data_l1_3im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l1_3re : process (clk, areset, DUC_Data_l1_3re_dut, DUC_Data_l1_3re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Valid_l2_s : process (clk, areset, DUC_Valid_l2_s_dut, DUC_Valid_l2_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Chan_l2_s : process (clk, areset, DUC_Chan_l2_s_dut, DUC_Chan_l2_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l2_0im : process (clk, areset, DUC_Data_l2_0im_dut, DUC_Data_l2_0im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l2_0re : process (clk, areset, DUC_Data_l2_0re_dut, DUC_Data_l2_0re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l2_1im : process (clk, areset, DUC_Data_l2_1im_dut, DUC_Data_l2_1im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l2_1re : process (clk, areset, DUC_Data_l2_1re_dut, DUC_Data_l2_1re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l2_2im : process (clk, areset, DUC_Data_l2_2im_dut, DUC_Data_l2_2im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l2_2re : process (clk, areset, DUC_Data_l2_2re_dut, DUC_Data_l2_2re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l2_3im : process (clk, areset, DUC_Data_l2_3im_dut, DUC_Data_l2_3im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l2_3re : process (clk, areset, DUC_Data_l2_3re_dut, DUC_Data_l2_3re_stm)
begin
END PROCESS;


-- General Purpose data out check
checkDUC_Valid_Out_s : process (clk, areset)
variable mismatch_DUC_Valid_Out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Valid_Out_s := FALSE;
        IF ( (DUC_Valid_Out_s_dut /= DUC_Valid_Out_s_stm)) THEN
            mismatch_DUC_Valid_Out_s := TRUE;
            report "Mismatch on device output pin DUC_Valid_Out_s" severity Warning;
        END IF;
        IF (mismatch_DUC_Valid_Out_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Chan_Out_s : process (clk, areset)
variable mismatch_DUC_Chan_Out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Chan_Out_s := FALSE;
        IF ( (DUC_Chan_Out_s_dut /= DUC_Chan_Out_s_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Chan_Out_s := TRUE;
            report "Mismatch on device output pin DUC_Chan_Out_s" severity Warning;
        END IF;
        IF (mismatch_DUC_Chan_Out_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_0im : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_0im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_0im := FALSE;
        IF ( (DUC_Ant_Data_Out_0im_dut /= DUC_Ant_Data_Out_0im_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_0im := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_0im" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_0im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_0re : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_0re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_0re := FALSE;
        IF ( (DUC_Ant_Data_Out_0re_dut /= DUC_Ant_Data_Out_0re_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_0re := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_0re" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_0re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_1im : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_1im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_1im := FALSE;
        IF ( (DUC_Ant_Data_Out_1im_dut /= DUC_Ant_Data_Out_1im_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_1im := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_1im" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_1im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_1re : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_1re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_1re := FALSE;
        IF ( (DUC_Ant_Data_Out_1re_dut /= DUC_Ant_Data_Out_1re_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_1re := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_1re" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_1re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_2im : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_2im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_2im := FALSE;
        IF ( (DUC_Ant_Data_Out_2im_dut /= DUC_Ant_Data_Out_2im_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_2im := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_2im" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_2im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_2re : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_2re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_2re := FALSE;
        IF ( (DUC_Ant_Data_Out_2re_dut /= DUC_Ant_Data_Out_2re_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_2re := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_2re" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_2re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_3im : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_3im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_3im := FALSE;
        IF ( (DUC_Ant_Data_Out_3im_dut /= DUC_Ant_Data_Out_3im_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_3im := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_3im" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_3im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_3re : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_3re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_3re := FALSE;
        IF ( (DUC_Ant_Data_Out_3re_dut /= DUC_Ant_Data_Out_3re_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_3re := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_3re" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_3re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_4im : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_4im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_4im := FALSE;
        IF ( (DUC_Ant_Data_Out_4im_dut /= DUC_Ant_Data_Out_4im_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_4im := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_4im" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_4im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_4re : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_4re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_4re := FALSE;
        IF ( (DUC_Ant_Data_Out_4re_dut /= DUC_Ant_Data_Out_4re_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_4re := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_4re" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_4re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_5im : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_5im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_5im := FALSE;
        IF ( (DUC_Ant_Data_Out_5im_dut /= DUC_Ant_Data_Out_5im_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_5im := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_5im" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_5im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_5re : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_5re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_5re := FALSE;
        IF ( (DUC_Ant_Data_Out_5re_dut /= DUC_Ant_Data_Out_5re_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_5re := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_5re" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_5re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_6im : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_6im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_6im := FALSE;
        IF ( (DUC_Ant_Data_Out_6im_dut /= DUC_Ant_Data_Out_6im_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_6im := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_6im" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_6im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_6re : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_6re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_6re := FALSE;
        IF ( (DUC_Ant_Data_Out_6re_dut /= DUC_Ant_Data_Out_6re_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_6re := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_6re" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_6re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_7im : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_7im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_7im := FALSE;
        IF ( (DUC_Ant_Data_Out_7im_dut /= DUC_Ant_Data_Out_7im_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_7im := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_7im" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_7im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Ant_Data_Out_7re : process (clk, areset)
variable mismatch_DUC_Ant_Data_Out_7re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Ant_Data_Out_7re := FALSE;
        IF ( (DUC_Ant_Data_Out_7re_dut /= DUC_Ant_Data_Out_7re_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Ant_Data_Out_7re := TRUE;
            report "Mismatch on device output pin DUC_Ant_Data_Out_7re" severity Warning;
        END IF;
        IF (mismatch_DUC_Ant_Data_Out_7re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_vout_s : process (clk, areset)
variable mismatch_summer_vout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_vout_s := FALSE;
        IF ( (summer_vout_s_dut /= summer_vout_s_stm)) THEN
            mismatch_summer_vout_s := TRUE;
            report "Mismatch on device output pin summer_vout_s" severity Warning;
        END IF;
        IF (mismatch_summer_vout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_cout_s : process (clk, areset)
variable mismatch_summer_cout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_cout_s := FALSE;
        IF ( (summer_cout_s_dut /= summer_cout_s_stm) and summer_vout_s_dut = "1") THEN
            mismatch_summer_cout_s := TRUE;
            report "Mismatch on device output pin summer_cout_s" severity Warning;
        END IF;
        IF (mismatch_summer_cout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_0im : process (clk, areset)
variable mismatch_summer_dout_0im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_0im := FALSE;
        IF ( (summer_dout_0im_dut /= summer_dout_0im_stm)) THEN
            mismatch_summer_dout_0im := TRUE;
            report "Mismatch on device output pin summer_dout_0im" severity Warning;
        END IF;
        IF (mismatch_summer_dout_0im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_0re : process (clk, areset)
variable mismatch_summer_dout_0re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_0re := FALSE;
        IF ( (summer_dout_0re_dut /= summer_dout_0re_stm) and summer_vout_s_dut = "1") THEN
            mismatch_summer_dout_0re := TRUE;
            report "Mismatch on device output pin summer_dout_0re" severity Warning;
        END IF;
        IF (mismatch_summer_dout_0re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_1im : process (clk, areset)
variable mismatch_summer_dout_1im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_1im := FALSE;
        IF ( (summer_dout_1im_dut /= summer_dout_1im_stm)) THEN
            mismatch_summer_dout_1im := TRUE;
            report "Mismatch on device output pin summer_dout_1im" severity Warning;
        END IF;
        IF (mismatch_summer_dout_1im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_1re : process (clk, areset)
variable mismatch_summer_dout_1re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_1re := FALSE;
        IF ( (summer_dout_1re_dut /= summer_dout_1re_stm) and summer_vout_s_dut = "1") THEN
            mismatch_summer_dout_1re := TRUE;
            report "Mismatch on device output pin summer_dout_1re" severity Warning;
        END IF;
        IF (mismatch_summer_dout_1re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_2im : process (clk, areset)
variable mismatch_summer_dout_2im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_2im := FALSE;
        IF ( (summer_dout_2im_dut /= summer_dout_2im_stm)) THEN
            mismatch_summer_dout_2im := TRUE;
            report "Mismatch on device output pin summer_dout_2im" severity Warning;
        END IF;
        IF (mismatch_summer_dout_2im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_2re : process (clk, areset)
variable mismatch_summer_dout_2re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_2re := FALSE;
        IF ( (summer_dout_2re_dut /= summer_dout_2re_stm) and summer_vout_s_dut = "1") THEN
            mismatch_summer_dout_2re := TRUE;
            report "Mismatch on device output pin summer_dout_2re" severity Warning;
        END IF;
        IF (mismatch_summer_dout_2re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_3im : process (clk, areset)
variable mismatch_summer_dout_3im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_3im := FALSE;
        IF ( (summer_dout_3im_dut /= summer_dout_3im_stm)) THEN
            mismatch_summer_dout_3im := TRUE;
            report "Mismatch on device output pin summer_dout_3im" severity Warning;
        END IF;
        IF (mismatch_summer_dout_3im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_3re : process (clk, areset)
variable mismatch_summer_dout_3re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_3re := FALSE;
        IF ( (summer_dout_3re_dut /= summer_dout_3re_stm) and summer_vout_s_dut = "1") THEN
            mismatch_summer_dout_3re := TRUE;
            report "Mismatch on device output pin summer_dout_3re" severity Warning;
        END IF;
        IF (mismatch_summer_dout_3re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : ca_interp_DUT port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    DUC_Valid_l1_s_stm,
    DUC_Chan_l1_s_stm,
    DUC_Data_l1_0im_stm,
    DUC_Data_l1_0re_stm,
    DUC_Data_l1_1im_stm,
    DUC_Data_l1_1re_stm,
    DUC_Data_l1_2im_stm,
    DUC_Data_l1_2re_stm,
    DUC_Data_l1_3im_stm,
    DUC_Data_l1_3re_stm,
    DUC_Valid_l2_s_stm,
    DUC_Chan_l2_s_stm,
    DUC_Data_l2_0im_stm,
    DUC_Data_l2_0re_stm,
    DUC_Data_l2_1im_stm,
    DUC_Data_l2_1re_stm,
    DUC_Data_l2_2im_stm,
    DUC_Data_l2_2re_stm,
    DUC_Data_l2_3im_stm,
    DUC_Data_l2_3re_stm,
    DUC_Valid_Out_s_dut,
    DUC_Chan_Out_s_dut,
    DUC_Ant_Data_Out_0im_dut,
    DUC_Ant_Data_Out_0re_dut,
    DUC_Ant_Data_Out_1im_dut,
    DUC_Ant_Data_Out_1re_dut,
    DUC_Ant_Data_Out_2im_dut,
    DUC_Ant_Data_Out_2re_dut,
    DUC_Ant_Data_Out_3im_dut,
    DUC_Ant_Data_Out_3re_dut,
    DUC_Ant_Data_Out_4im_dut,
    DUC_Ant_Data_Out_4re_dut,
    DUC_Ant_Data_Out_5im_dut,
    DUC_Ant_Data_Out_5re_dut,
    DUC_Ant_Data_Out_6im_dut,
    DUC_Ant_Data_Out_6re_dut,
    DUC_Ant_Data_Out_7im_dut,
    DUC_Ant_Data_Out_7re_dut,
    summer_vout_s_dut,
    summer_cout_s_dut,
    summer_dout_0im_dut,
    summer_dout_0re_dut,
    summer_dout_1im_dut,
    summer_dout_1re_dut,
    summer_dout_2im_dut,
    summer_dout_2re_dut,
    summer_dout_3im_dut,
    summer_dout_3re_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : ca_interp_DUT_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    DUC_Valid_l1_s_stm,
    DUC_Chan_l1_s_stm,
    DUC_Data_l1_0im_stm,
    DUC_Data_l1_0re_stm,
    DUC_Data_l1_1im_stm,
    DUC_Data_l1_1re_stm,
    DUC_Data_l1_2im_stm,
    DUC_Data_l1_2re_stm,
    DUC_Data_l1_3im_stm,
    DUC_Data_l1_3re_stm,
    DUC_Valid_l2_s_stm,
    DUC_Chan_l2_s_stm,
    DUC_Data_l2_0im_stm,
    DUC_Data_l2_0re_stm,
    DUC_Data_l2_1im_stm,
    DUC_Data_l2_1re_stm,
    DUC_Data_l2_2im_stm,
    DUC_Data_l2_2re_stm,
    DUC_Data_l2_3im_stm,
    DUC_Data_l2_3re_stm,
    DUC_Valid_Out_s_stm,
    DUC_Chan_Out_s_stm,
    DUC_Ant_Data_Out_0im_stm,
    DUC_Ant_Data_Out_0re_stm,
    DUC_Ant_Data_Out_1im_stm,
    DUC_Ant_Data_Out_1re_stm,
    DUC_Ant_Data_Out_2im_stm,
    DUC_Ant_Data_Out_2re_stm,
    DUC_Ant_Data_Out_3im_stm,
    DUC_Ant_Data_Out_3re_stm,
    DUC_Ant_Data_Out_4im_stm,
    DUC_Ant_Data_Out_4re_stm,
    DUC_Ant_Data_Out_5im_stm,
    DUC_Ant_Data_Out_5re_stm,
    DUC_Ant_Data_Out_6im_stm,
    DUC_Ant_Data_Out_6re_stm,
    DUC_Ant_Data_Out_7im_stm,
    DUC_Ant_Data_Out_7re_stm,
    summer_vout_s_stm,
    summer_cout_s_stm,
    summer_dout_0im_stm,
    summer_dout_0re_stm,
    summer_dout_1im_stm,
    summer_dout_1re_stm,
    summer_dout_2im_stm,
    summer_dout_2re_stm,
    summer_dout_3im_stm,
    summer_dout_3re_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
