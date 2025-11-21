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

-- VHDL created from dec_dly_comp_DUT
-- VHDL created on Tue Jan  7 17:06:26 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity dec_dly_comp_DUT_atb is
end;

architecture normal of dec_dly_comp_DUT_atb is

component dec_dly_comp_DUT is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(13 downto 0);  -- ufix14
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        DDC_Valid_In_s : in std_logic_vector(0 downto 0);  -- ufix1
        DDC_Chan_In_s : in std_logic_vector(7 downto 0);  -- ufix8
        DDC_Ant_Data_In_0im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_0re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_1im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_1re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_2im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_2re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_3im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_3re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_4im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_4re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_5im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_5re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_6im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_6re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_7im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DDC_Ant_Data_In_7re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        alq_l1_dout_0im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l1_dout_0re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l1_dout_1im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l1_dout_1re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l1_dout_2im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l1_dout_2re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l1_dout_3im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l1_dout_3re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l1_vout_s : out std_logic_vector(0 downto 0);  -- ufix1
        alq_l1_cout_s : out std_logic_vector(7 downto 0);  -- ufix8
        alq_l2_dout_0im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l2_dout_0re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l2_dout_1im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l2_dout_1re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l2_dout_2im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l2_dout_2re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l2_dout_3im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l2_dout_3re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        alq_l2_vout_s : out std_logic_vector(0 downto 0);  -- ufix1
        alq_l2_cout_s : out std_logic_vector(7 downto 0);  -- ufix8
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component dec_dly_comp_DUT_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        DDC_Valid_In_s_stm : out std_logic_vector(0 downto 0);
        DDC_Chan_In_s_stm : out std_logic_vector(7 downto 0);
        DDC_Ant_Data_In_0im_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_0re_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_1im_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_1re_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_2im_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_2re_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_3im_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_3re_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_4im_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_4re_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_5im_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_5re_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_6im_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_6re_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_7im_stm : out std_logic_vector(15 downto 0);
        DDC_Ant_Data_In_7re_stm : out std_logic_vector(15 downto 0);
        alq_l1_dout_0im_stm : out std_logic_vector(31 downto 0);
        alq_l1_dout_0re_stm : out std_logic_vector(31 downto 0);
        alq_l1_dout_1im_stm : out std_logic_vector(31 downto 0);
        alq_l1_dout_1re_stm : out std_logic_vector(31 downto 0);
        alq_l1_dout_2im_stm : out std_logic_vector(31 downto 0);
        alq_l1_dout_2re_stm : out std_logic_vector(31 downto 0);
        alq_l1_dout_3im_stm : out std_logic_vector(31 downto 0);
        alq_l1_dout_3re_stm : out std_logic_vector(31 downto 0);
        alq_l1_vout_s_stm : out std_logic_vector(0 downto 0);
        alq_l1_cout_s_stm : out std_logic_vector(7 downto 0);
        alq_l2_dout_0im_stm : out std_logic_vector(31 downto 0);
        alq_l2_dout_0re_stm : out std_logic_vector(31 downto 0);
        alq_l2_dout_1im_stm : out std_logic_vector(31 downto 0);
        alq_l2_dout_1re_stm : out std_logic_vector(31 downto 0);
        alq_l2_dout_2im_stm : out std_logic_vector(31 downto 0);
        alq_l2_dout_2re_stm : out std_logic_vector(31 downto 0);
        alq_l2_dout_3im_stm : out std_logic_vector(31 downto 0);
        alq_l2_dout_3re_stm : out std_logic_vector(31 downto 0);
        alq_l2_vout_s_stm : out std_logic_vector(0 downto 0);
        alq_l2_cout_s_stm : out std_logic_vector(7 downto 0);
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
signal DDC_Valid_In_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal DDC_Chan_In_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal DDC_Ant_Data_In_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_4im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_4re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_5im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_5re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_6im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_6re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_7im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_7re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal alq_l1_dout_0im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_dout_0re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_dout_1im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_dout_1re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_dout_2im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_dout_2re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_dout_3im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_dout_3re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_vout_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal alq_l1_cout_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal alq_l2_dout_0im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_dout_0re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_dout_1im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_dout_1re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_dout_2im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_dout_2re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_dout_3im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_dout_3re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_vout_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal alq_l2_cout_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal DDC_Valid_In_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal DDC_Chan_In_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal DDC_Ant_Data_In_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_4im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_4re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_5im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_5re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_6im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_6re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_7im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DDC_Ant_Data_In_7re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal alq_l1_dout_0im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_dout_0re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_dout_1im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_dout_1re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_dout_2im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_dout_2re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_dout_3im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_dout_3re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l1_vout_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal alq_l1_cout_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal alq_l2_dout_0im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_dout_0re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_dout_1im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_dout_1re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_dout_2im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_dout_2re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_dout_3im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_dout_3re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal alq_l2_vout_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal alq_l2_cout_s_dut : STD_LOGIC_VECTOR (7 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkDDC_Valid_In_s : process (clk, areset, DDC_Valid_In_s_dut, DDC_Valid_In_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Chan_In_s : process (clk, areset, DDC_Chan_In_s_dut, DDC_Chan_In_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_0im : process (clk, areset, DDC_Ant_Data_In_0im_dut, DDC_Ant_Data_In_0im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_0re : process (clk, areset, DDC_Ant_Data_In_0re_dut, DDC_Ant_Data_In_0re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_1im : process (clk, areset, DDC_Ant_Data_In_1im_dut, DDC_Ant_Data_In_1im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_1re : process (clk, areset, DDC_Ant_Data_In_1re_dut, DDC_Ant_Data_In_1re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_2im : process (clk, areset, DDC_Ant_Data_In_2im_dut, DDC_Ant_Data_In_2im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_2re : process (clk, areset, DDC_Ant_Data_In_2re_dut, DDC_Ant_Data_In_2re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_3im : process (clk, areset, DDC_Ant_Data_In_3im_dut, DDC_Ant_Data_In_3im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_3re : process (clk, areset, DDC_Ant_Data_In_3re_dut, DDC_Ant_Data_In_3re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_4im : process (clk, areset, DDC_Ant_Data_In_4im_dut, DDC_Ant_Data_In_4im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_4re : process (clk, areset, DDC_Ant_Data_In_4re_dut, DDC_Ant_Data_In_4re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_5im : process (clk, areset, DDC_Ant_Data_In_5im_dut, DDC_Ant_Data_In_5im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_5re : process (clk, areset, DDC_Ant_Data_In_5re_dut, DDC_Ant_Data_In_5re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_6im : process (clk, areset, DDC_Ant_Data_In_6im_dut, DDC_Ant_Data_In_6im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_6re : process (clk, areset, DDC_Ant_Data_In_6re_dut, DDC_Ant_Data_In_6re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_7im : process (clk, areset, DDC_Ant_Data_In_7im_dut, DDC_Ant_Data_In_7im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDDC_Ant_Data_In_7re : process (clk, areset, DDC_Ant_Data_In_7re_dut, DDC_Ant_Data_In_7re_stm)
begin
END PROCESS;


-- General Purpose data out check
checkalq_l1_dout_0im : process (clk, areset)
variable mismatch_alq_l1_dout_0im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l1_dout_0im := FALSE;
        IF ( (alq_l1_dout_0im_dut /= alq_l1_dout_0im_stm) and alq_l1_vout_s_dut = "1") THEN
            mismatch_alq_l1_dout_0im := TRUE;
            report "Mismatch on device output pin alq_l1_dout_0im" severity Warning;
        END IF;
        IF (mismatch_alq_l1_dout_0im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l1_dout_0re : process (clk, areset)
variable mismatch_alq_l1_dout_0re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l1_dout_0re := FALSE;
        IF ( (alq_l1_dout_0re_dut /= alq_l1_dout_0re_stm) and alq_l1_vout_s_dut = "1") THEN
            mismatch_alq_l1_dout_0re := TRUE;
            report "Mismatch on device output pin alq_l1_dout_0re" severity Warning;
        END IF;
        IF (mismatch_alq_l1_dout_0re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l1_dout_1im : process (clk, areset)
variable mismatch_alq_l1_dout_1im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l1_dout_1im := FALSE;
        IF ( (alq_l1_dout_1im_dut /= alq_l1_dout_1im_stm) and alq_l1_vout_s_dut = "1") THEN
            mismatch_alq_l1_dout_1im := TRUE;
            report "Mismatch on device output pin alq_l1_dout_1im" severity Warning;
        END IF;
        IF (mismatch_alq_l1_dout_1im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l1_dout_1re : process (clk, areset)
variable mismatch_alq_l1_dout_1re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l1_dout_1re := FALSE;
        IF ( (alq_l1_dout_1re_dut /= alq_l1_dout_1re_stm) and alq_l1_vout_s_dut = "1") THEN
            mismatch_alq_l1_dout_1re := TRUE;
            report "Mismatch on device output pin alq_l1_dout_1re" severity Warning;
        END IF;
        IF (mismatch_alq_l1_dout_1re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l1_dout_2im : process (clk, areset)
variable mismatch_alq_l1_dout_2im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l1_dout_2im := FALSE;
        IF ( (alq_l1_dout_2im_dut /= alq_l1_dout_2im_stm) and alq_l1_vout_s_dut = "1") THEN
            mismatch_alq_l1_dout_2im := TRUE;
            report "Mismatch on device output pin alq_l1_dout_2im" severity Warning;
        END IF;
        IF (mismatch_alq_l1_dout_2im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l1_dout_2re : process (clk, areset)
variable mismatch_alq_l1_dout_2re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l1_dout_2re := FALSE;
        IF ( (alq_l1_dout_2re_dut /= alq_l1_dout_2re_stm) and alq_l1_vout_s_dut = "1") THEN
            mismatch_alq_l1_dout_2re := TRUE;
            report "Mismatch on device output pin alq_l1_dout_2re" severity Warning;
        END IF;
        IF (mismatch_alq_l1_dout_2re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l1_dout_3im : process (clk, areset)
variable mismatch_alq_l1_dout_3im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l1_dout_3im := FALSE;
        IF ( (alq_l1_dout_3im_dut /= alq_l1_dout_3im_stm) and alq_l1_vout_s_dut = "1") THEN
            mismatch_alq_l1_dout_3im := TRUE;
            report "Mismatch on device output pin alq_l1_dout_3im" severity Warning;
        END IF;
        IF (mismatch_alq_l1_dout_3im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l1_dout_3re : process (clk, areset)
variable mismatch_alq_l1_dout_3re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l1_dout_3re := FALSE;
        IF ( (alq_l1_dout_3re_dut /= alq_l1_dout_3re_stm) and alq_l1_vout_s_dut = "1") THEN
            mismatch_alq_l1_dout_3re := TRUE;
            report "Mismatch on device output pin alq_l1_dout_3re" severity Warning;
        END IF;
        IF (mismatch_alq_l1_dout_3re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l1_vout_s : process (clk, areset)
variable mismatch_alq_l1_vout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l1_vout_s := FALSE;
        IF ( (alq_l1_vout_s_dut /= alq_l1_vout_s_stm)) THEN
            mismatch_alq_l1_vout_s := TRUE;
            report "Mismatch on device output pin alq_l1_vout_s" severity Warning;
        END IF;
        IF (mismatch_alq_l1_vout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l1_cout_s : process (clk, areset)
variable mismatch_alq_l1_cout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l1_cout_s := FALSE;
        IF ( (alq_l1_cout_s_dut /= alq_l1_cout_s_stm) and alq_l1_vout_s_dut = "1") THEN
            mismatch_alq_l1_cout_s := TRUE;
            report "Mismatch on device output pin alq_l1_cout_s" severity Warning;
        END IF;
        IF (mismatch_alq_l1_cout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l2_dout_0im : process (clk, areset)
variable mismatch_alq_l2_dout_0im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l2_dout_0im := FALSE;
        IF ( (alq_l2_dout_0im_dut /= alq_l2_dout_0im_stm) and alq_l2_vout_s_dut = "1") THEN
            mismatch_alq_l2_dout_0im := TRUE;
            report "Mismatch on device output pin alq_l2_dout_0im" severity Warning;
        END IF;
        IF (mismatch_alq_l2_dout_0im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l2_dout_0re : process (clk, areset)
variable mismatch_alq_l2_dout_0re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l2_dout_0re := FALSE;
        IF ( (alq_l2_dout_0re_dut /= alq_l2_dout_0re_stm) and alq_l2_vout_s_dut = "1") THEN
            mismatch_alq_l2_dout_0re := TRUE;
            report "Mismatch on device output pin alq_l2_dout_0re" severity Warning;
        END IF;
        IF (mismatch_alq_l2_dout_0re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l2_dout_1im : process (clk, areset)
variable mismatch_alq_l2_dout_1im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l2_dout_1im := FALSE;
        IF ( (alq_l2_dout_1im_dut /= alq_l2_dout_1im_stm) and alq_l2_vout_s_dut = "1") THEN
            mismatch_alq_l2_dout_1im := TRUE;
            report "Mismatch on device output pin alq_l2_dout_1im" severity Warning;
        END IF;
        IF (mismatch_alq_l2_dout_1im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l2_dout_1re : process (clk, areset)
variable mismatch_alq_l2_dout_1re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l2_dout_1re := FALSE;
        IF ( (alq_l2_dout_1re_dut /= alq_l2_dout_1re_stm) and alq_l2_vout_s_dut = "1") THEN
            mismatch_alq_l2_dout_1re := TRUE;
            report "Mismatch on device output pin alq_l2_dout_1re" severity Warning;
        END IF;
        IF (mismatch_alq_l2_dout_1re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l2_dout_2im : process (clk, areset)
variable mismatch_alq_l2_dout_2im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l2_dout_2im := FALSE;
        IF ( (alq_l2_dout_2im_dut /= alq_l2_dout_2im_stm) and alq_l2_vout_s_dut = "1") THEN
            mismatch_alq_l2_dout_2im := TRUE;
            report "Mismatch on device output pin alq_l2_dout_2im" severity Warning;
        END IF;
        IF (mismatch_alq_l2_dout_2im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l2_dout_2re : process (clk, areset)
variable mismatch_alq_l2_dout_2re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l2_dout_2re := FALSE;
        IF ( (alq_l2_dout_2re_dut /= alq_l2_dout_2re_stm) and alq_l2_vout_s_dut = "1") THEN
            mismatch_alq_l2_dout_2re := TRUE;
            report "Mismatch on device output pin alq_l2_dout_2re" severity Warning;
        END IF;
        IF (mismatch_alq_l2_dout_2re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l2_dout_3im : process (clk, areset)
variable mismatch_alq_l2_dout_3im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l2_dout_3im := FALSE;
        IF ( (alq_l2_dout_3im_dut /= alq_l2_dout_3im_stm) and alq_l2_vout_s_dut = "1") THEN
            mismatch_alq_l2_dout_3im := TRUE;
            report "Mismatch on device output pin alq_l2_dout_3im" severity Warning;
        END IF;
        IF (mismatch_alq_l2_dout_3im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l2_dout_3re : process (clk, areset)
variable mismatch_alq_l2_dout_3re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l2_dout_3re := FALSE;
        IF ( (alq_l2_dout_3re_dut /= alq_l2_dout_3re_stm) and alq_l2_vout_s_dut = "1") THEN
            mismatch_alq_l2_dout_3re := TRUE;
            report "Mismatch on device output pin alq_l2_dout_3re" severity Warning;
        END IF;
        IF (mismatch_alq_l2_dout_3re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l2_vout_s : process (clk, areset)
variable mismatch_alq_l2_vout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l2_vout_s := FALSE;
        IF ( (alq_l2_vout_s_dut /= alq_l2_vout_s_stm)) THEN
            mismatch_alq_l2_vout_s := TRUE;
            report "Mismatch on device output pin alq_l2_vout_s" severity Warning;
        END IF;
        IF (mismatch_alq_l2_vout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkalq_l2_cout_s : process (clk, areset)
variable mismatch_alq_l2_cout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_alq_l2_cout_s := FALSE;
        IF ( (alq_l2_cout_s_dut /= alq_l2_cout_s_stm) and alq_l2_vout_s_dut = "1") THEN
            mismatch_alq_l2_cout_s := TRUE;
            report "Mismatch on device output pin alq_l2_cout_s" severity Warning;
        END IF;
        IF (mismatch_alq_l2_cout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : dec_dly_comp_DUT port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    DDC_Valid_In_s_stm,
    DDC_Chan_In_s_stm,
    DDC_Ant_Data_In_0im_stm,
    DDC_Ant_Data_In_0re_stm,
    DDC_Ant_Data_In_1im_stm,
    DDC_Ant_Data_In_1re_stm,
    DDC_Ant_Data_In_2im_stm,
    DDC_Ant_Data_In_2re_stm,
    DDC_Ant_Data_In_3im_stm,
    DDC_Ant_Data_In_3re_stm,
    DDC_Ant_Data_In_4im_stm,
    DDC_Ant_Data_In_4re_stm,
    DDC_Ant_Data_In_5im_stm,
    DDC_Ant_Data_In_5re_stm,
    DDC_Ant_Data_In_6im_stm,
    DDC_Ant_Data_In_6re_stm,
    DDC_Ant_Data_In_7im_stm,
    DDC_Ant_Data_In_7re_stm,
    alq_l1_dout_0im_dut,
    alq_l1_dout_0re_dut,
    alq_l1_dout_1im_dut,
    alq_l1_dout_1re_dut,
    alq_l1_dout_2im_dut,
    alq_l1_dout_2re_dut,
    alq_l1_dout_3im_dut,
    alq_l1_dout_3re_dut,
    alq_l1_vout_s_dut,
    alq_l1_cout_s_dut,
    alq_l2_dout_0im_dut,
    alq_l2_dout_0re_dut,
    alq_l2_dout_1im_dut,
    alq_l2_dout_1re_dut,
    alq_l2_dout_2im_dut,
    alq_l2_dout_2re_dut,
    alq_l2_dout_3im_dut,
    alq_l2_dout_3re_dut,
    alq_l2_vout_s_dut,
    alq_l2_cout_s_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : dec_dly_comp_DUT_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    DDC_Valid_In_s_stm,
    DDC_Chan_In_s_stm,
    DDC_Ant_Data_In_0im_stm,
    DDC_Ant_Data_In_0re_stm,
    DDC_Ant_Data_In_1im_stm,
    DDC_Ant_Data_In_1re_stm,
    DDC_Ant_Data_In_2im_stm,
    DDC_Ant_Data_In_2re_stm,
    DDC_Ant_Data_In_3im_stm,
    DDC_Ant_Data_In_3re_stm,
    DDC_Ant_Data_In_4im_stm,
    DDC_Ant_Data_In_4re_stm,
    DDC_Ant_Data_In_5im_stm,
    DDC_Ant_Data_In_5re_stm,
    DDC_Ant_Data_In_6im_stm,
    DDC_Ant_Data_In_6re_stm,
    DDC_Ant_Data_In_7im_stm,
    DDC_Ant_Data_In_7re_stm,
    alq_l1_dout_0im_stm,
    alq_l1_dout_0re_stm,
    alq_l1_dout_1im_stm,
    alq_l1_dout_1re_stm,
    alq_l1_dout_2im_stm,
    alq_l1_dout_2re_stm,
    alq_l1_dout_3im_stm,
    alq_l1_dout_3re_stm,
    alq_l1_vout_s_stm,
    alq_l1_cout_s_stm,
    alq_l2_dout_0im_stm,
    alq_l2_dout_0re_stm,
    alq_l2_dout_1im_stm,
    alq_l2_dout_1re_stm,
    alq_l2_dout_2im_stm,
    alq_l2_dout_2re_stm,
    alq_l2_dout_3im_stm,
    alq_l2_dout_3re_stm,
    alq_l2_vout_s_stm,
    alq_l2_cout_s_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
