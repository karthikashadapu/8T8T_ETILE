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

-- VHDL created from standaloneTopLevel_dec_dly_comp_DUT_DUT
-- VHDL created on Tue Jan  7 17:06:25 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity standaloneTopLevel_dec_dly_comp_DUT_DUT_atb is
end;

architecture normal of standaloneTopLevel_dec_dly_comp_DUT_DUT_atb is

component standaloneTopLevel_dec_dly_comp_DUT_DUT is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(13 downto 0);  -- ufix14
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        In_v_s : in std_logic_vector(0 downto 0);  -- ufix1
        In_c_s : in std_logic_vector(7 downto 0);  -- ufix8
        In_d_0im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_0re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_1im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_1re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_2im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_2re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_3im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_3re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_4im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_4re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_5im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_5re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_6im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_6re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_7im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In_d_7re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        q1_0im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q1_0re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q1_1im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q1_1re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q1_2im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q1_2re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q1_3im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q1_3re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q_v1_s : out std_logic_vector(0 downto 0);  -- ufix1
        q_c1_s : out std_logic_vector(7 downto 0);  -- ufix8
        q2_0im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q2_0re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q2_1im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q2_1re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q2_2im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q2_2re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q2_3im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q2_3re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        q_v2_s : out std_logic_vector(0 downto 0);  -- ufix1
        q_c2_s : out std_logic_vector(7 downto 0);  -- ufix8
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component standaloneTopLevel_dec_dly_comp_DUT_DUT_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        In_v_s_stm : out std_logic_vector(0 downto 0);
        In_c_s_stm : out std_logic_vector(7 downto 0);
        In_d_0im_stm : out std_logic_vector(15 downto 0);
        In_d_0re_stm : out std_logic_vector(15 downto 0);
        In_d_1im_stm : out std_logic_vector(15 downto 0);
        In_d_1re_stm : out std_logic_vector(15 downto 0);
        In_d_2im_stm : out std_logic_vector(15 downto 0);
        In_d_2re_stm : out std_logic_vector(15 downto 0);
        In_d_3im_stm : out std_logic_vector(15 downto 0);
        In_d_3re_stm : out std_logic_vector(15 downto 0);
        In_d_4im_stm : out std_logic_vector(15 downto 0);
        In_d_4re_stm : out std_logic_vector(15 downto 0);
        In_d_5im_stm : out std_logic_vector(15 downto 0);
        In_d_5re_stm : out std_logic_vector(15 downto 0);
        In_d_6im_stm : out std_logic_vector(15 downto 0);
        In_d_6re_stm : out std_logic_vector(15 downto 0);
        In_d_7im_stm : out std_logic_vector(15 downto 0);
        In_d_7re_stm : out std_logic_vector(15 downto 0);
        q1_0im_stm : out std_logic_vector(31 downto 0);
        q1_0re_stm : out std_logic_vector(31 downto 0);
        q1_1im_stm : out std_logic_vector(31 downto 0);
        q1_1re_stm : out std_logic_vector(31 downto 0);
        q1_2im_stm : out std_logic_vector(31 downto 0);
        q1_2re_stm : out std_logic_vector(31 downto 0);
        q1_3im_stm : out std_logic_vector(31 downto 0);
        q1_3re_stm : out std_logic_vector(31 downto 0);
        q_v1_s_stm : out std_logic_vector(0 downto 0);
        q_c1_s_stm : out std_logic_vector(7 downto 0);
        q2_0im_stm : out std_logic_vector(31 downto 0);
        q2_0re_stm : out std_logic_vector(31 downto 0);
        q2_1im_stm : out std_logic_vector(31 downto 0);
        q2_1re_stm : out std_logic_vector(31 downto 0);
        q2_2im_stm : out std_logic_vector(31 downto 0);
        q2_2re_stm : out std_logic_vector(31 downto 0);
        q2_3im_stm : out std_logic_vector(31 downto 0);
        q2_3re_stm : out std_logic_vector(31 downto 0);
        q_v2_s_stm : out std_logic_vector(0 downto 0);
        q_c2_s_stm : out std_logic_vector(7 downto 0);
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
signal In_v_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal In_c_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal In_d_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_4im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_4re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_5im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_5re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_6im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_6re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_7im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_7re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal q1_0im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q1_0re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q1_1im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q1_1re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q1_2im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q1_2re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q1_3im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q1_3re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q_v1_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal q_c1_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal q2_0im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q2_0re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q2_1im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q2_1re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q2_2im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q2_2re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q2_3im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q2_3re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal q_v2_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal q_c2_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal In_v_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal In_c_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal In_d_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_4im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_4re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_5im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_5re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_6im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_6re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_7im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In_d_7re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal q1_0im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q1_0re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q1_1im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q1_1re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q1_2im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q1_2re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q1_3im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q1_3re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q_v1_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal q_c1_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal q2_0im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q2_0re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q2_1im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q2_1re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q2_2im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q2_2re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q2_3im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q2_3re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal q_v2_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal q_c2_s_dut : STD_LOGIC_VECTOR (7 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkIn_v_s : process (clk, areset, In_v_s_dut, In_v_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_c_s : process (clk, areset, In_c_s_dut, In_c_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_0im : process (clk, areset, In_d_0im_dut, In_d_0im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_0re : process (clk, areset, In_d_0re_dut, In_d_0re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_1im : process (clk, areset, In_d_1im_dut, In_d_1im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_1re : process (clk, areset, In_d_1re_dut, In_d_1re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_2im : process (clk, areset, In_d_2im_dut, In_d_2im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_2re : process (clk, areset, In_d_2re_dut, In_d_2re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_3im : process (clk, areset, In_d_3im_dut, In_d_3im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_3re : process (clk, areset, In_d_3re_dut, In_d_3re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_4im : process (clk, areset, In_d_4im_dut, In_d_4im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_4re : process (clk, areset, In_d_4re_dut, In_d_4re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_5im : process (clk, areset, In_d_5im_dut, In_d_5im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_5re : process (clk, areset, In_d_5re_dut, In_d_5re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_6im : process (clk, areset, In_d_6im_dut, In_d_6im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_6re : process (clk, areset, In_d_6re_dut, In_d_6re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_7im : process (clk, areset, In_d_7im_dut, In_d_7im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn_d_7re : process (clk, areset, In_d_7re_dut, In_d_7re_stm)
begin
END PROCESS;


-- General Purpose data out check
checkq1_0im : process (clk, areset)
variable mismatch_q1_0im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q1_0im := FALSE;
        IF ( (q1_0im_dut /= q1_0im_stm) and q_v1_s_dut = "1") THEN
            mismatch_q1_0im := TRUE;
            report "Mismatch on device output pin q1_0im" severity Warning;
        END IF;
        IF (mismatch_q1_0im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq1_0re : process (clk, areset)
variable mismatch_q1_0re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q1_0re := FALSE;
        IF ( (q1_0re_dut /= q1_0re_stm) and q_v1_s_dut = "1") THEN
            mismatch_q1_0re := TRUE;
            report "Mismatch on device output pin q1_0re" severity Warning;
        END IF;
        IF (mismatch_q1_0re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq1_1im : process (clk, areset)
variable mismatch_q1_1im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q1_1im := FALSE;
        IF ( (q1_1im_dut /= q1_1im_stm) and q_v1_s_dut = "1") THEN
            mismatch_q1_1im := TRUE;
            report "Mismatch on device output pin q1_1im" severity Warning;
        END IF;
        IF (mismatch_q1_1im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq1_1re : process (clk, areset)
variable mismatch_q1_1re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q1_1re := FALSE;
        IF ( (q1_1re_dut /= q1_1re_stm) and q_v1_s_dut = "1") THEN
            mismatch_q1_1re := TRUE;
            report "Mismatch on device output pin q1_1re" severity Warning;
        END IF;
        IF (mismatch_q1_1re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq1_2im : process (clk, areset)
variable mismatch_q1_2im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q1_2im := FALSE;
        IF ( (q1_2im_dut /= q1_2im_stm) and q_v1_s_dut = "1") THEN
            mismatch_q1_2im := TRUE;
            report "Mismatch on device output pin q1_2im" severity Warning;
        END IF;
        IF (mismatch_q1_2im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq1_2re : process (clk, areset)
variable mismatch_q1_2re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q1_2re := FALSE;
        IF ( (q1_2re_dut /= q1_2re_stm) and q_v1_s_dut = "1") THEN
            mismatch_q1_2re := TRUE;
            report "Mismatch on device output pin q1_2re" severity Warning;
        END IF;
        IF (mismatch_q1_2re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq1_3im : process (clk, areset)
variable mismatch_q1_3im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q1_3im := FALSE;
        IF ( (q1_3im_dut /= q1_3im_stm) and q_v1_s_dut = "1") THEN
            mismatch_q1_3im := TRUE;
            report "Mismatch on device output pin q1_3im" severity Warning;
        END IF;
        IF (mismatch_q1_3im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq1_3re : process (clk, areset)
variable mismatch_q1_3re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q1_3re := FALSE;
        IF ( (q1_3re_dut /= q1_3re_stm) and q_v1_s_dut = "1") THEN
            mismatch_q1_3re := TRUE;
            report "Mismatch on device output pin q1_3re" severity Warning;
        END IF;
        IF (mismatch_q1_3re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq_v1_s : process (clk, areset)
variable mismatch_q_v1_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q_v1_s := FALSE;
        IF ( (q_v1_s_dut /= q_v1_s_stm)) THEN
            mismatch_q_v1_s := TRUE;
            report "Mismatch on device output pin q_v1_s" severity Warning;
        END IF;
        IF (mismatch_q_v1_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq_c1_s : process (clk, areset)
variable mismatch_q_c1_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q_c1_s := FALSE;
        IF ( (q_c1_s_dut /= q_c1_s_stm) and q_v1_s_dut = "1") THEN
            mismatch_q_c1_s := TRUE;
            report "Mismatch on device output pin q_c1_s" severity Warning;
        END IF;
        IF (mismatch_q_c1_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq2_0im : process (clk, areset)
variable mismatch_q2_0im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q2_0im := FALSE;
        IF ( (q2_0im_dut /= q2_0im_stm) and q_v2_s_dut = "1") THEN
            mismatch_q2_0im := TRUE;
            report "Mismatch on device output pin q2_0im" severity Warning;
        END IF;
        IF (mismatch_q2_0im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq2_0re : process (clk, areset)
variable mismatch_q2_0re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q2_0re := FALSE;
        IF ( (q2_0re_dut /= q2_0re_stm) and q_v2_s_dut = "1") THEN
            mismatch_q2_0re := TRUE;
            report "Mismatch on device output pin q2_0re" severity Warning;
        END IF;
        IF (mismatch_q2_0re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq2_1im : process (clk, areset)
variable mismatch_q2_1im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q2_1im := FALSE;
        IF ( (q2_1im_dut /= q2_1im_stm) and q_v2_s_dut = "1") THEN
            mismatch_q2_1im := TRUE;
            report "Mismatch on device output pin q2_1im" severity Warning;
        END IF;
        IF (mismatch_q2_1im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq2_1re : process (clk, areset)
variable mismatch_q2_1re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q2_1re := FALSE;
        IF ( (q2_1re_dut /= q2_1re_stm) and q_v2_s_dut = "1") THEN
            mismatch_q2_1re := TRUE;
            report "Mismatch on device output pin q2_1re" severity Warning;
        END IF;
        IF (mismatch_q2_1re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq2_2im : process (clk, areset)
variable mismatch_q2_2im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q2_2im := FALSE;
        IF ( (q2_2im_dut /= q2_2im_stm) and q_v2_s_dut = "1") THEN
            mismatch_q2_2im := TRUE;
            report "Mismatch on device output pin q2_2im" severity Warning;
        END IF;
        IF (mismatch_q2_2im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq2_2re : process (clk, areset)
variable mismatch_q2_2re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q2_2re := FALSE;
        IF ( (q2_2re_dut /= q2_2re_stm) and q_v2_s_dut = "1") THEN
            mismatch_q2_2re := TRUE;
            report "Mismatch on device output pin q2_2re" severity Warning;
        END IF;
        IF (mismatch_q2_2re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq2_3im : process (clk, areset)
variable mismatch_q2_3im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q2_3im := FALSE;
        IF ( (q2_3im_dut /= q2_3im_stm) and q_v2_s_dut = "1") THEN
            mismatch_q2_3im := TRUE;
            report "Mismatch on device output pin q2_3im" severity Warning;
        END IF;
        IF (mismatch_q2_3im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq2_3re : process (clk, areset)
variable mismatch_q2_3re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q2_3re := FALSE;
        IF ( (q2_3re_dut /= q2_3re_stm) and q_v2_s_dut = "1") THEN
            mismatch_q2_3re := TRUE;
            report "Mismatch on device output pin q2_3re" severity Warning;
        END IF;
        IF (mismatch_q2_3re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq_v2_s : process (clk, areset)
variable mismatch_q_v2_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q_v2_s := FALSE;
        IF ( (q_v2_s_dut /= q_v2_s_stm)) THEN
            mismatch_q_v2_s := TRUE;
            report "Mismatch on device output pin q_v2_s" severity Warning;
        END IF;
        IF (mismatch_q_v2_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq_c2_s : process (clk, areset)
variable mismatch_q_c2_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q_c2_s := FALSE;
        IF ( (q_c2_s_dut /= q_c2_s_stm) and q_v2_s_dut = "1") THEN
            mismatch_q_c2_s := TRUE;
            report "Mismatch on device output pin q_c2_s" severity Warning;
        END IF;
        IF (mismatch_q_c2_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : standaloneTopLevel_dec_dly_comp_DUT_DUT port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    In_v_s_stm,
    In_c_s_stm,
    In_d_0im_stm,
    In_d_0re_stm,
    In_d_1im_stm,
    In_d_1re_stm,
    In_d_2im_stm,
    In_d_2re_stm,
    In_d_3im_stm,
    In_d_3re_stm,
    In_d_4im_stm,
    In_d_4re_stm,
    In_d_5im_stm,
    In_d_5re_stm,
    In_d_6im_stm,
    In_d_6re_stm,
    In_d_7im_stm,
    In_d_7re_stm,
    q1_0im_dut,
    q1_0re_dut,
    q1_1im_dut,
    q1_1re_dut,
    q1_2im_dut,
    q1_2re_dut,
    q1_3im_dut,
    q1_3re_dut,
    q_v1_s_dut,
    q_c1_s_dut,
    q2_0im_dut,
    q2_0re_dut,
    q2_1im_dut,
    q2_1re_dut,
    q2_2im_dut,
    q2_2re_dut,
    q2_3im_dut,
    q2_3re_dut,
    q_v2_s_dut,
    q_c2_s_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : standaloneTopLevel_dec_dly_comp_DUT_DUT_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    In_v_s_stm,
    In_c_s_stm,
    In_d_0im_stm,
    In_d_0re_stm,
    In_d_1im_stm,
    In_d_1re_stm,
    In_d_2im_stm,
    In_d_2re_stm,
    In_d_3im_stm,
    In_d_3re_stm,
    In_d_4im_stm,
    In_d_4re_stm,
    In_d_5im_stm,
    In_d_5re_stm,
    In_d_6im_stm,
    In_d_6re_stm,
    In_d_7im_stm,
    In_d_7re_stm,
    q1_0im_stm,
    q1_0re_stm,
    q1_1im_stm,
    q1_1re_stm,
    q1_2im_stm,
    q1_2re_stm,
    q1_3im_stm,
    q1_3re_stm,
    q_v1_s_stm,
    q_c1_s_stm,
    q2_0im_stm,
    q2_0re_stm,
    q2_1im_stm,
    q2_1re_stm,
    q2_2im_stm,
    q2_2re_stm,
    q2_3im_stm,
    q2_3re_stm,
    q_v2_s_stm,
    q_c2_s_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
