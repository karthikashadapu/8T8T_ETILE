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

-- VHDL created from standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x
-- VHDL created on Tue Jan  7 17:06:25 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb is
end;

architecture normal of standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_atb is

component standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(13 downto 0);  -- ufix14
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        In1_s : in std_logic_vector(0 downto 0);  -- ufix1
        In2_s : in std_logic_vector(7 downto 0);  -- ufix8
        In3_0im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In3_0re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In3_1im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In3_1re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In3_2im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In3_2re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In3_3im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        In3_3re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        dout1_0im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        dout1_0re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        dout1_1im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        dout1_1re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        dout1_2im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        dout1_2re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        dout1_3im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        dout1_3re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        vout1_s : out std_logic_vector(0 downto 0);  -- ufix1
        cout1_s : out std_logic_vector(7 downto 0);  -- ufix8
        dout2_0im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        dout2_0re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        dout2_1im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        dout2_1re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        dout2_2im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        dout2_2re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        dout2_3im : out std_logic_vector(31 downto 0);  -- sfix32_en27
        dout2_3re : out std_logic_vector(31 downto 0);  -- sfix32_en27
        vout2_s : out std_logic_vector(0 downto 0);  -- ufix1
        cout2_s : out std_logic_vector(7 downto 0);  -- ufix8
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        In1_s_stm : out std_logic_vector(0 downto 0);
        In2_s_stm : out std_logic_vector(7 downto 0);
        In3_0im_stm : out std_logic_vector(15 downto 0);
        In3_0re_stm : out std_logic_vector(15 downto 0);
        In3_1im_stm : out std_logic_vector(15 downto 0);
        In3_1re_stm : out std_logic_vector(15 downto 0);
        In3_2im_stm : out std_logic_vector(15 downto 0);
        In3_2re_stm : out std_logic_vector(15 downto 0);
        In3_3im_stm : out std_logic_vector(15 downto 0);
        In3_3re_stm : out std_logic_vector(15 downto 0);
        dout1_0im_stm : out std_logic_vector(31 downto 0);
        dout1_0re_stm : out std_logic_vector(31 downto 0);
        dout1_1im_stm : out std_logic_vector(31 downto 0);
        dout1_1re_stm : out std_logic_vector(31 downto 0);
        dout1_2im_stm : out std_logic_vector(31 downto 0);
        dout1_2re_stm : out std_logic_vector(31 downto 0);
        dout1_3im_stm : out std_logic_vector(31 downto 0);
        dout1_3re_stm : out std_logic_vector(31 downto 0);
        vout1_s_stm : out std_logic_vector(0 downto 0);
        cout1_s_stm : out std_logic_vector(7 downto 0);
        dout2_0im_stm : out std_logic_vector(31 downto 0);
        dout2_0re_stm : out std_logic_vector(31 downto 0);
        dout2_1im_stm : out std_logic_vector(31 downto 0);
        dout2_1re_stm : out std_logic_vector(31 downto 0);
        dout2_2im_stm : out std_logic_vector(31 downto 0);
        dout2_2re_stm : out std_logic_vector(31 downto 0);
        dout2_3im_stm : out std_logic_vector(31 downto 0);
        dout2_3re_stm : out std_logic_vector(31 downto 0);
        vout2_s_stm : out std_logic_vector(0 downto 0);
        cout2_s_stm : out std_logic_vector(7 downto 0);
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
signal In1_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal In2_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal In3_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In3_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In3_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In3_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In3_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In3_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In3_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal In3_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout1_0im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal dout1_0re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal dout1_1im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal dout1_1re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal dout1_2im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal dout1_2re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal dout1_3im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal dout1_3re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal vout1_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal cout1_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal dout2_0im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal dout2_0re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal dout2_1im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal dout2_1re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal dout2_2im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal dout2_2re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal dout2_3im_stm : STD_LOGIC_VECTOR (31 downto 0);
signal dout2_3re_stm : STD_LOGIC_VECTOR (31 downto 0);
signal vout2_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal cout2_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal In1_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal In2_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal In3_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In3_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In3_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In3_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In3_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In3_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In3_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal In3_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout1_0im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal dout1_0re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal dout1_1im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal dout1_1re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal dout1_2im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal dout1_2re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal dout1_3im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal dout1_3re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal vout1_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal cout1_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal dout2_0im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal dout2_0re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal dout2_1im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal dout2_1re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal dout2_2im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal dout2_2re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal dout2_3im_dut : STD_LOGIC_VECTOR (31 downto 0);
signal dout2_3re_dut : STD_LOGIC_VECTOR (31 downto 0);
signal vout2_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal cout2_s_dut : STD_LOGIC_VECTOR (7 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkIn1_s : process (clk, areset, In1_s_dut, In1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn2_s : process (clk, areset, In2_s_dut, In2_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn3_0im : process (clk, areset, In3_0im_dut, In3_0im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn3_0re : process (clk, areset, In3_0re_dut, In3_0re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn3_1im : process (clk, areset, In3_1im_dut, In3_1im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn3_1re : process (clk, areset, In3_1re_dut, In3_1re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn3_2im : process (clk, areset, In3_2im_dut, In3_2im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn3_2re : process (clk, areset, In3_2re_dut, In3_2re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn3_3im : process (clk, areset, In3_3im_dut, In3_3im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkIn3_3re : process (clk, areset, In3_3re_dut, In3_3re_stm)
begin
END PROCESS;


-- General Purpose data out check
checkdout1_0im : process (clk, areset)
variable mismatch_dout1_0im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout1_0im := FALSE;
        IF ( (dout1_0im_dut /= dout1_0im_stm) and vout1_s_dut = "1") THEN
            mismatch_dout1_0im := TRUE;
            report "Mismatch on device output pin dout1_0im" severity Warning;
        END IF;
        IF (mismatch_dout1_0im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout1_0re : process (clk, areset)
variable mismatch_dout1_0re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout1_0re := FALSE;
        IF ( (dout1_0re_dut /= dout1_0re_stm) and vout1_s_dut = "1") THEN
            mismatch_dout1_0re := TRUE;
            report "Mismatch on device output pin dout1_0re" severity Warning;
        END IF;
        IF (mismatch_dout1_0re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout1_1im : process (clk, areset)
variable mismatch_dout1_1im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout1_1im := FALSE;
        IF ( (dout1_1im_dut /= dout1_1im_stm) and vout1_s_dut = "1") THEN
            mismatch_dout1_1im := TRUE;
            report "Mismatch on device output pin dout1_1im" severity Warning;
        END IF;
        IF (mismatch_dout1_1im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout1_1re : process (clk, areset)
variable mismatch_dout1_1re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout1_1re := FALSE;
        IF ( (dout1_1re_dut /= dout1_1re_stm) and vout1_s_dut = "1") THEN
            mismatch_dout1_1re := TRUE;
            report "Mismatch on device output pin dout1_1re" severity Warning;
        END IF;
        IF (mismatch_dout1_1re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout1_2im : process (clk, areset)
variable mismatch_dout1_2im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout1_2im := FALSE;
        IF ( (dout1_2im_dut /= dout1_2im_stm) and vout1_s_dut = "1") THEN
            mismatch_dout1_2im := TRUE;
            report "Mismatch on device output pin dout1_2im" severity Warning;
        END IF;
        IF (mismatch_dout1_2im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout1_2re : process (clk, areset)
variable mismatch_dout1_2re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout1_2re := FALSE;
        IF ( (dout1_2re_dut /= dout1_2re_stm) and vout1_s_dut = "1") THEN
            mismatch_dout1_2re := TRUE;
            report "Mismatch on device output pin dout1_2re" severity Warning;
        END IF;
        IF (mismatch_dout1_2re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout1_3im : process (clk, areset)
variable mismatch_dout1_3im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout1_3im := FALSE;
        IF ( (dout1_3im_dut /= dout1_3im_stm) and vout1_s_dut = "1") THEN
            mismatch_dout1_3im := TRUE;
            report "Mismatch on device output pin dout1_3im" severity Warning;
        END IF;
        IF (mismatch_dout1_3im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout1_3re : process (clk, areset)
variable mismatch_dout1_3re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout1_3re := FALSE;
        IF ( (dout1_3re_dut /= dout1_3re_stm) and vout1_s_dut = "1") THEN
            mismatch_dout1_3re := TRUE;
            report "Mismatch on device output pin dout1_3re" severity Warning;
        END IF;
        IF (mismatch_dout1_3re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkvout1_s : process (clk, areset)
variable mismatch_vout1_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_vout1_s := FALSE;
        IF ( (vout1_s_dut /= vout1_s_stm)) THEN
            mismatch_vout1_s := TRUE;
            report "Mismatch on device output pin vout1_s" severity Warning;
        END IF;
        IF (mismatch_vout1_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkcout1_s : process (clk, areset)
variable mismatch_cout1_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_cout1_s := FALSE;
        IF ( (cout1_s_dut /= cout1_s_stm) and vout1_s_dut = "1") THEN
            mismatch_cout1_s := TRUE;
            report "Mismatch on device output pin cout1_s" severity Warning;
        END IF;
        IF (mismatch_cout1_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout2_0im : process (clk, areset)
variable mismatch_dout2_0im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout2_0im := FALSE;
        IF ( (dout2_0im_dut /= dout2_0im_stm) and vout2_s_dut = "1") THEN
            mismatch_dout2_0im := TRUE;
            report "Mismatch on device output pin dout2_0im" severity Warning;
        END IF;
        IF (mismatch_dout2_0im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout2_0re : process (clk, areset)
variable mismatch_dout2_0re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout2_0re := FALSE;
        IF ( (dout2_0re_dut /= dout2_0re_stm) and vout2_s_dut = "1") THEN
            mismatch_dout2_0re := TRUE;
            report "Mismatch on device output pin dout2_0re" severity Warning;
        END IF;
        IF (mismatch_dout2_0re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout2_1im : process (clk, areset)
variable mismatch_dout2_1im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout2_1im := FALSE;
        IF ( (dout2_1im_dut /= dout2_1im_stm) and vout2_s_dut = "1") THEN
            mismatch_dout2_1im := TRUE;
            report "Mismatch on device output pin dout2_1im" severity Warning;
        END IF;
        IF (mismatch_dout2_1im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout2_1re : process (clk, areset)
variable mismatch_dout2_1re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout2_1re := FALSE;
        IF ( (dout2_1re_dut /= dout2_1re_stm) and vout2_s_dut = "1") THEN
            mismatch_dout2_1re := TRUE;
            report "Mismatch on device output pin dout2_1re" severity Warning;
        END IF;
        IF (mismatch_dout2_1re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout2_2im : process (clk, areset)
variable mismatch_dout2_2im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout2_2im := FALSE;
        IF ( (dout2_2im_dut /= dout2_2im_stm) and vout2_s_dut = "1") THEN
            mismatch_dout2_2im := TRUE;
            report "Mismatch on device output pin dout2_2im" severity Warning;
        END IF;
        IF (mismatch_dout2_2im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout2_2re : process (clk, areset)
variable mismatch_dout2_2re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout2_2re := FALSE;
        IF ( (dout2_2re_dut /= dout2_2re_stm) and vout2_s_dut = "1") THEN
            mismatch_dout2_2re := TRUE;
            report "Mismatch on device output pin dout2_2re" severity Warning;
        END IF;
        IF (mismatch_dout2_2re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout2_3im : process (clk, areset)
variable mismatch_dout2_3im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout2_3im := FALSE;
        IF ( (dout2_3im_dut /= dout2_3im_stm) and vout2_s_dut = "1") THEN
            mismatch_dout2_3im := TRUE;
            report "Mismatch on device output pin dout2_3im" severity Warning;
        END IF;
        IF (mismatch_dout2_3im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout2_3re : process (clk, areset)
variable mismatch_dout2_3re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout2_3re := FALSE;
        IF ( (dout2_3re_dut /= dout2_3re_stm) and vout2_s_dut = "1") THEN
            mismatch_dout2_3re := TRUE;
            report "Mismatch on device output pin dout2_3re" severity Warning;
        END IF;
        IF (mismatch_dout2_3re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkvout2_s : process (clk, areset)
variable mismatch_vout2_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_vout2_s := FALSE;
        IF ( (vout2_s_dut /= vout2_s_stm)) THEN
            mismatch_vout2_s := TRUE;
            report "Mismatch on device output pin vout2_s" severity Warning;
        END IF;
        IF (mismatch_vout2_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkcout2_s : process (clk, areset)
variable mismatch_cout2_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_cout2_s := FALSE;
        IF ( (cout2_s_dut /= cout2_s_stm) and vout2_s_dut = "1") THEN
            mismatch_cout2_s := TRUE;
            report "Mismatch on device output pin cout2_s" severity Warning;
        END IF;
        IF (mismatch_cout2_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    In1_s_stm,
    In2_s_stm,
    In3_0im_stm,
    In3_0re_stm,
    In3_1im_stm,
    In3_1re_stm,
    In3_2im_stm,
    In3_2re_stm,
    In3_3im_stm,
    In3_3re_stm,
    dout1_0im_dut,
    dout1_0re_dut,
    dout1_1im_dut,
    dout1_1re_dut,
    dout1_2im_dut,
    dout1_2re_dut,
    dout1_3im_dut,
    dout1_3re_dut,
    vout1_s_dut,
    cout1_s_dut,
    dout2_0im_dut,
    dout2_0re_dut,
    dout2_1im_dut,
    dout2_1re_dut,
    dout2_2im_dut,
    dout2_2re_dut,
    dout2_3im_dut,
    dout2_3re_dut,
    vout2_s_dut,
    cout2_s_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    In1_s_stm,
    In2_s_stm,
    In3_0im_stm,
    In3_0re_stm,
    In3_1im_stm,
    In3_1re_stm,
    In3_2im_stm,
    In3_2re_stm,
    In3_3im_stm,
    In3_3re_stm,
    dout1_0im_stm,
    dout1_0re_stm,
    dout1_1im_stm,
    dout1_1re_stm,
    dout1_2im_stm,
    dout1_2re_stm,
    dout1_3im_stm,
    dout1_3re_stm,
    vout1_s_stm,
    cout1_s_stm,
    dout2_0im_stm,
    dout2_0re_stm,
    dout2_1im_stm,
    dout2_1re_stm,
    dout2_2im_stm,
    dout2_2re_stm,
    dout2_3im_stm,
    dout2_3re_stm,
    vout2_s_stm,
    cout2_s_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
