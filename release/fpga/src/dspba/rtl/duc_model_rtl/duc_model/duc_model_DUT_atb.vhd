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

-- VHDL created from duc_model_DUT
-- VHDL created on Thu Jan  9 15:34:39 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity duc_model_DUT_atb is
end;

architecture normal of duc_model_DUT_atb is

component duc_model_DUT is
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
        DUC_Data_l1_im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_l1_re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_NCO_sync_0 : in std_logic_vector(0 downto 0);  -- ufix1
        DUC_NCO_sync_1 : in std_logic_vector(0 downto 0);  -- ufix1
        DUC_NCO_sync_2 : in std_logic_vector(0 downto 0);  -- ufix1
        DUC_NCO_sync_3 : in std_logic_vector(0 downto 0);  -- ufix1
        BW_Config_CC1_s : in std_logic_vector(7 downto 0);  -- ufix8
        DUC_Valid_Out_s : out std_logic_vector(0 downto 0);  -- ufix1
        DUC_Chan_Out_s : out std_logic_vector(7 downto 0);  -- ufix8
        DUC_Data_Out_0im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_Out_0re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_Out_1im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_Out_1re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_Out_2im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_Out_2re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_Out_3im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        DUC_Data_Out_3re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        duc_l1_vout_s : out std_logic_vector(0 downto 0);  -- ufix1
        duc_l1_cout_s : out std_logic_vector(7 downto 0);  -- ufix8
        duc_l1_dout_0im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        duc_l1_dout_0re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        duc_l1_dout_1im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        duc_l1_dout_1re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        duc_l1_dout_2im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        duc_l1_dout_2re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        duc_l1_dout_3im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        duc_l1_dout_3re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component duc_model_DUT_stm is
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
        DUC_Data_l1_im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_re_stm : out std_logic_vector(15 downto 0);
        DUC_NCO_sync_0_stm : out std_logic_vector(0 downto 0);
        DUC_NCO_sync_1_stm : out std_logic_vector(0 downto 0);
        DUC_NCO_sync_2_stm : out std_logic_vector(0 downto 0);
        DUC_NCO_sync_3_stm : out std_logic_vector(0 downto 0);
        BW_Config_CC1_s_stm : out std_logic_vector(7 downto 0);
        DUC_Valid_Out_s_stm : out std_logic_vector(0 downto 0);
        DUC_Chan_Out_s_stm : out std_logic_vector(7 downto 0);
        DUC_Data_Out_0im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_Out_0re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_Out_1im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_Out_1re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_Out_2im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_Out_2re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_Out_3im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_Out_3re_stm : out std_logic_vector(15 downto 0);
        duc_l1_vout_s_stm : out std_logic_vector(0 downto 0);
        duc_l1_cout_s_stm : out std_logic_vector(7 downto 0);
        duc_l1_dout_0im_stm : out std_logic_vector(15 downto 0);
        duc_l1_dout_0re_stm : out std_logic_vector(15 downto 0);
        duc_l1_dout_1im_stm : out std_logic_vector(15 downto 0);
        duc_l1_dout_1re_stm : out std_logic_vector(15 downto 0);
        duc_l1_dout_2im_stm : out std_logic_vector(15 downto 0);
        duc_l1_dout_2re_stm : out std_logic_vector(15 downto 0);
        duc_l1_dout_3im_stm : out std_logic_vector(15 downto 0);
        duc_l1_dout_3re_stm : out std_logic_vector(15 downto 0);
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
signal DUC_Data_l1_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_NCO_sync_0_stm : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_NCO_sync_1_stm : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_NCO_sync_2_stm : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_NCO_sync_3_stm : STD_LOGIC_VECTOR (0 downto 0);
signal BW_Config_CC1_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal DUC_Valid_Out_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_Chan_Out_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal DUC_Data_Out_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_Out_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_Out_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_Out_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_Out_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_Out_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_Out_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_Out_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_vout_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal duc_l1_cout_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal duc_l1_dout_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_dout_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_dout_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_dout_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_dout_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_dout_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_dout_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_dout_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_Valid_l1_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_Chan_l1_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal DUC_Data_l1_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_l1_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_NCO_sync_0_dut : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_NCO_sync_1_dut : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_NCO_sync_2_dut : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_NCO_sync_3_dut : STD_LOGIC_VECTOR (0 downto 0);
signal BW_Config_CC1_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal DUC_Valid_Out_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal DUC_Chan_Out_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal DUC_Data_Out_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_Out_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_Out_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_Out_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_Out_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_Out_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_Out_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal DUC_Data_Out_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_vout_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal duc_l1_cout_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal duc_l1_dout_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_dout_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_dout_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_dout_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_dout_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_dout_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_dout_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal duc_l1_dout_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
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
checkDUC_Data_l1_im : process (clk, areset, DUC_Data_l1_im_dut, DUC_Data_l1_im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_Data_l1_re : process (clk, areset, DUC_Data_l1_re_dut, DUC_Data_l1_re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_NCO_sync_0 : process (clk, areset, DUC_NCO_sync_0_dut, DUC_NCO_sync_0_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_NCO_sync_1 : process (clk, areset, DUC_NCO_sync_1_dut, DUC_NCO_sync_1_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_NCO_sync_2 : process (clk, areset, DUC_NCO_sync_2_dut, DUC_NCO_sync_2_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDUC_NCO_sync_3 : process (clk, areset, DUC_NCO_sync_3_dut, DUC_NCO_sync_3_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkBW_Config_CC1_s : process (clk, areset, BW_Config_CC1_s_dut, BW_Config_CC1_s_stm)
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
checkDUC_Data_Out_0im : process (clk, areset)
variable mismatch_DUC_Data_Out_0im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Data_Out_0im := FALSE;
        IF ( (DUC_Data_Out_0im_dut /= DUC_Data_Out_0im_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Data_Out_0im := TRUE;
            report "Mismatch on device output pin DUC_Data_Out_0im" severity Warning;
        END IF;
        IF (mismatch_DUC_Data_Out_0im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Data_Out_0re : process (clk, areset)
variable mismatch_DUC_Data_Out_0re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Data_Out_0re := FALSE;
        IF ( (DUC_Data_Out_0re_dut /= DUC_Data_Out_0re_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Data_Out_0re := TRUE;
            report "Mismatch on device output pin DUC_Data_Out_0re" severity Warning;
        END IF;
        IF (mismatch_DUC_Data_Out_0re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Data_Out_1im : process (clk, areset)
variable mismatch_DUC_Data_Out_1im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Data_Out_1im := FALSE;
        IF ( (DUC_Data_Out_1im_dut /= DUC_Data_Out_1im_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Data_Out_1im := TRUE;
            report "Mismatch on device output pin DUC_Data_Out_1im" severity Warning;
        END IF;
        IF (mismatch_DUC_Data_Out_1im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Data_Out_1re : process (clk, areset)
variable mismatch_DUC_Data_Out_1re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Data_Out_1re := FALSE;
        IF ( (DUC_Data_Out_1re_dut /= DUC_Data_Out_1re_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Data_Out_1re := TRUE;
            report "Mismatch on device output pin DUC_Data_Out_1re" severity Warning;
        END IF;
        IF (mismatch_DUC_Data_Out_1re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Data_Out_2im : process (clk, areset)
variable mismatch_DUC_Data_Out_2im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Data_Out_2im := FALSE;
        IF ( (DUC_Data_Out_2im_dut /= DUC_Data_Out_2im_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Data_Out_2im := TRUE;
            report "Mismatch on device output pin DUC_Data_Out_2im" severity Warning;
        END IF;
        IF (mismatch_DUC_Data_Out_2im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Data_Out_2re : process (clk, areset)
variable mismatch_DUC_Data_Out_2re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Data_Out_2re := FALSE;
        IF ( (DUC_Data_Out_2re_dut /= DUC_Data_Out_2re_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Data_Out_2re := TRUE;
            report "Mismatch on device output pin DUC_Data_Out_2re" severity Warning;
        END IF;
        IF (mismatch_DUC_Data_Out_2re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Data_Out_3im : process (clk, areset)
variable mismatch_DUC_Data_Out_3im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Data_Out_3im := FALSE;
        IF ( (DUC_Data_Out_3im_dut /= DUC_Data_Out_3im_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Data_Out_3im := TRUE;
            report "Mismatch on device output pin DUC_Data_Out_3im" severity Warning;
        END IF;
        IF (mismatch_DUC_Data_Out_3im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDUC_Data_Out_3re : process (clk, areset)
variable mismatch_DUC_Data_Out_3re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DUC_Data_Out_3re := FALSE;
        IF ( (DUC_Data_Out_3re_dut /= DUC_Data_Out_3re_stm) and DUC_Valid_Out_s_dut = "1") THEN
            mismatch_DUC_Data_Out_3re := TRUE;
            report "Mismatch on device output pin DUC_Data_Out_3re" severity Warning;
        END IF;
        IF (mismatch_DUC_Data_Out_3re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkduc_l1_vout_s : process (clk, areset)
variable mismatch_duc_l1_vout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_duc_l1_vout_s := FALSE;
        IF ( (duc_l1_vout_s_dut /= duc_l1_vout_s_stm)) THEN
            mismatch_duc_l1_vout_s := TRUE;
            report "Mismatch on device output pin duc_l1_vout_s" severity Warning;
        END IF;
        IF (mismatch_duc_l1_vout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkduc_l1_cout_s : process (clk, areset)
variable mismatch_duc_l1_cout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_duc_l1_cout_s := FALSE;
        IF ( (duc_l1_cout_s_dut /= duc_l1_cout_s_stm) and duc_l1_vout_s_dut = "1") THEN
            mismatch_duc_l1_cout_s := TRUE;
            report "Mismatch on device output pin duc_l1_cout_s" severity Warning;
        END IF;
        IF (mismatch_duc_l1_cout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkduc_l1_dout_0im : process (clk, areset)
variable mismatch_duc_l1_dout_0im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_duc_l1_dout_0im := FALSE;
        IF ( (duc_l1_dout_0im_dut /= duc_l1_dout_0im_stm)) THEN
            mismatch_duc_l1_dout_0im := TRUE;
            report "Mismatch on device output pin duc_l1_dout_0im" severity Warning;
        END IF;
        IF (mismatch_duc_l1_dout_0im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkduc_l1_dout_0re : process (clk, areset)
variable mismatch_duc_l1_dout_0re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_duc_l1_dout_0re := FALSE;
        IF ( (duc_l1_dout_0re_dut /= duc_l1_dout_0re_stm) and duc_l1_vout_s_dut = "1") THEN
            mismatch_duc_l1_dout_0re := TRUE;
            report "Mismatch on device output pin duc_l1_dout_0re" severity Warning;
        END IF;
        IF (mismatch_duc_l1_dout_0re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkduc_l1_dout_1im : process (clk, areset)
variable mismatch_duc_l1_dout_1im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_duc_l1_dout_1im := FALSE;
        IF ( (duc_l1_dout_1im_dut /= duc_l1_dout_1im_stm)) THEN
            mismatch_duc_l1_dout_1im := TRUE;
            report "Mismatch on device output pin duc_l1_dout_1im" severity Warning;
        END IF;
        IF (mismatch_duc_l1_dout_1im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkduc_l1_dout_1re : process (clk, areset)
variable mismatch_duc_l1_dout_1re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_duc_l1_dout_1re := FALSE;
        IF ( (duc_l1_dout_1re_dut /= duc_l1_dout_1re_stm) and duc_l1_vout_s_dut = "1") THEN
            mismatch_duc_l1_dout_1re := TRUE;
            report "Mismatch on device output pin duc_l1_dout_1re" severity Warning;
        END IF;
        IF (mismatch_duc_l1_dout_1re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkduc_l1_dout_2im : process (clk, areset)
variable mismatch_duc_l1_dout_2im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_duc_l1_dout_2im := FALSE;
        IF ( (duc_l1_dout_2im_dut /= duc_l1_dout_2im_stm)) THEN
            mismatch_duc_l1_dout_2im := TRUE;
            report "Mismatch on device output pin duc_l1_dout_2im" severity Warning;
        END IF;
        IF (mismatch_duc_l1_dout_2im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkduc_l1_dout_2re : process (clk, areset)
variable mismatch_duc_l1_dout_2re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_duc_l1_dout_2re := FALSE;
        IF ( (duc_l1_dout_2re_dut /= duc_l1_dout_2re_stm) and duc_l1_vout_s_dut = "1") THEN
            mismatch_duc_l1_dout_2re := TRUE;
            report "Mismatch on device output pin duc_l1_dout_2re" severity Warning;
        END IF;
        IF (mismatch_duc_l1_dout_2re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkduc_l1_dout_3im : process (clk, areset)
variable mismatch_duc_l1_dout_3im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_duc_l1_dout_3im := FALSE;
        IF ( (duc_l1_dout_3im_dut /= duc_l1_dout_3im_stm)) THEN
            mismatch_duc_l1_dout_3im := TRUE;
            report "Mismatch on device output pin duc_l1_dout_3im" severity Warning;
        END IF;
        IF (mismatch_duc_l1_dout_3im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkduc_l1_dout_3re : process (clk, areset)
variable mismatch_duc_l1_dout_3re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_duc_l1_dout_3re := FALSE;
        IF ( (duc_l1_dout_3re_dut /= duc_l1_dout_3re_stm) and duc_l1_vout_s_dut = "1") THEN
            mismatch_duc_l1_dout_3re := TRUE;
            report "Mismatch on device output pin duc_l1_dout_3re" severity Warning;
        END IF;
        IF (mismatch_duc_l1_dout_3re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : duc_model_DUT port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    DUC_Valid_l1_s_stm,
    DUC_Chan_l1_s_stm,
    DUC_Data_l1_im_stm,
    DUC_Data_l1_re_stm,
    DUC_NCO_sync_0_stm,
    DUC_NCO_sync_1_stm,
    DUC_NCO_sync_2_stm,
    DUC_NCO_sync_3_stm,
    BW_Config_CC1_s_stm,
    DUC_Valid_Out_s_dut,
    DUC_Chan_Out_s_dut,
    DUC_Data_Out_0im_dut,
    DUC_Data_Out_0re_dut,
    DUC_Data_Out_1im_dut,
    DUC_Data_Out_1re_dut,
    DUC_Data_Out_2im_dut,
    DUC_Data_Out_2re_dut,
    DUC_Data_Out_3im_dut,
    DUC_Data_Out_3re_dut,
    duc_l1_vout_s_dut,
    duc_l1_cout_s_dut,
    duc_l1_dout_0im_dut,
    duc_l1_dout_0re_dut,
    duc_l1_dout_1im_dut,
    duc_l1_dout_1re_dut,
    duc_l1_dout_2im_dut,
    duc_l1_dout_2re_dut,
    duc_l1_dout_3im_dut,
    duc_l1_dout_3re_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : duc_model_DUT_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    DUC_Valid_l1_s_stm,
    DUC_Chan_l1_s_stm,
    DUC_Data_l1_im_stm,
    DUC_Data_l1_re_stm,
    DUC_NCO_sync_0_stm,
    DUC_NCO_sync_1_stm,
    DUC_NCO_sync_2_stm,
    DUC_NCO_sync_3_stm,
    BW_Config_CC1_s_stm,
    DUC_Valid_Out_s_stm,
    DUC_Chan_Out_s_stm,
    DUC_Data_Out_0im_stm,
    DUC_Data_Out_0re_stm,
    DUC_Data_Out_1im_stm,
    DUC_Data_Out_1re_stm,
    DUC_Data_Out_2im_stm,
    DUC_Data_Out_2re_stm,
    DUC_Data_Out_3im_stm,
    DUC_Data_Out_3re_stm,
    duc_l1_vout_s_stm,
    duc_l1_cout_s_stm,
    duc_l1_dout_0im_stm,
    duc_l1_dout_0re_stm,
    duc_l1_dout_1im_stm,
    duc_l1_dout_1re_stm,
    duc_l1_dout_2im_stm,
    duc_l1_dout_2re_stm,
    duc_l1_dout_3im_stm,
    duc_l1_dout_3re_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
