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

-- VHDL created from standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x
-- VHDL created on Tue Jan  7 17:04:25 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb is
end;

architecture normal of standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_atb is

component standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(13 downto 0);  -- ufix14
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        din_a1_0im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a1_0re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a1_1im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a1_1re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a1_2im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a1_2re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a1_3im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a1_3re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        vin_a1_s : in std_logic_vector(0 downto 0);  -- ufix1
        cin_a1_s : in std_logic_vector(7 downto 0);  -- ufix8
        din_a2_0im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a2_0re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a2_1im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a2_1re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a2_2im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a2_2re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a2_3im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a2_3re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        altq_0im : out std_logic_vector(32 downto 0);  -- sfix33_en27
        altq_0re : out std_logic_vector(32 downto 0);  -- sfix33_en27
        altq_1im : out std_logic_vector(32 downto 0);  -- sfix33_en27
        altq_1re : out std_logic_vector(32 downto 0);  -- sfix33_en27
        altq_2im : out std_logic_vector(32 downto 0);  -- sfix33_en27
        altq_2re : out std_logic_vector(32 downto 0);  -- sfix33_en27
        altq_3im : out std_logic_vector(32 downto 0);  -- sfix33_en27
        altq_3re : out std_logic_vector(32 downto 0);  -- sfix33_en27
        altv_s : out std_logic_vector(0 downto 0);  -- ufix1
        altc_s : out std_logic_vector(7 downto 0);  -- ufix8
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        din_a1_0im_stm : out std_logic_vector(15 downto 0);
        din_a1_0re_stm : out std_logic_vector(15 downto 0);
        din_a1_1im_stm : out std_logic_vector(15 downto 0);
        din_a1_1re_stm : out std_logic_vector(15 downto 0);
        din_a1_2im_stm : out std_logic_vector(15 downto 0);
        din_a1_2re_stm : out std_logic_vector(15 downto 0);
        din_a1_3im_stm : out std_logic_vector(15 downto 0);
        din_a1_3re_stm : out std_logic_vector(15 downto 0);
        vin_a1_s_stm : out std_logic_vector(0 downto 0);
        cin_a1_s_stm : out std_logic_vector(7 downto 0);
        din_a2_0im_stm : out std_logic_vector(15 downto 0);
        din_a2_0re_stm : out std_logic_vector(15 downto 0);
        din_a2_1im_stm : out std_logic_vector(15 downto 0);
        din_a2_1re_stm : out std_logic_vector(15 downto 0);
        din_a2_2im_stm : out std_logic_vector(15 downto 0);
        din_a2_2re_stm : out std_logic_vector(15 downto 0);
        din_a2_3im_stm : out std_logic_vector(15 downto 0);
        din_a2_3re_stm : out std_logic_vector(15 downto 0);
        altq_0im_stm : out std_logic_vector(32 downto 0);
        altq_0re_stm : out std_logic_vector(32 downto 0);
        altq_1im_stm : out std_logic_vector(32 downto 0);
        altq_1re_stm : out std_logic_vector(32 downto 0);
        altq_2im_stm : out std_logic_vector(32 downto 0);
        altq_2re_stm : out std_logic_vector(32 downto 0);
        altq_3im_stm : out std_logic_vector(32 downto 0);
        altq_3re_stm : out std_logic_vector(32 downto 0);
        altv_s_stm : out std_logic_vector(0 downto 0);
        altc_s_stm : out std_logic_vector(7 downto 0);
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
signal din_a1_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal vin_a1_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal cin_a1_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal din_a2_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a2_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a2_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a2_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a2_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a2_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a2_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a2_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal altq_0im_stm : STD_LOGIC_VECTOR (32 downto 0);
signal altq_0re_stm : STD_LOGIC_VECTOR (32 downto 0);
signal altq_1im_stm : STD_LOGIC_VECTOR (32 downto 0);
signal altq_1re_stm : STD_LOGIC_VECTOR (32 downto 0);
signal altq_2im_stm : STD_LOGIC_VECTOR (32 downto 0);
signal altq_2re_stm : STD_LOGIC_VECTOR (32 downto 0);
signal altq_3im_stm : STD_LOGIC_VECTOR (32 downto 0);
signal altq_3re_stm : STD_LOGIC_VECTOR (32 downto 0);
signal altv_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal altc_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal din_a1_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal vin_a1_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal cin_a1_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal din_a2_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a2_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a2_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a2_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a2_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a2_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a2_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a2_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal altq_0im_dut : STD_LOGIC_VECTOR (32 downto 0);
signal altq_0re_dut : STD_LOGIC_VECTOR (32 downto 0);
signal altq_1im_dut : STD_LOGIC_VECTOR (32 downto 0);
signal altq_1re_dut : STD_LOGIC_VECTOR (32 downto 0);
signal altq_2im_dut : STD_LOGIC_VECTOR (32 downto 0);
signal altq_2re_dut : STD_LOGIC_VECTOR (32 downto 0);
signal altq_3im_dut : STD_LOGIC_VECTOR (32 downto 0);
signal altq_3re_dut : STD_LOGIC_VECTOR (32 downto 0);
signal altv_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal altc_s_dut : STD_LOGIC_VECTOR (7 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkdin_a1_0im : process (clk, areset, din_a1_0im_dut, din_a1_0im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a1_0re : process (clk, areset, din_a1_0re_dut, din_a1_0re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a1_1im : process (clk, areset, din_a1_1im_dut, din_a1_1im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a1_1re : process (clk, areset, din_a1_1re_dut, din_a1_1re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a1_2im : process (clk, areset, din_a1_2im_dut, din_a1_2im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a1_2re : process (clk, areset, din_a1_2re_dut, din_a1_2re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a1_3im : process (clk, areset, din_a1_3im_dut, din_a1_3im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a1_3re : process (clk, areset, din_a1_3re_dut, din_a1_3re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkvin_a1_s : process (clk, areset, vin_a1_s_dut, vin_a1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkcin_a1_s : process (clk, areset, cin_a1_s_dut, cin_a1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a2_0im : process (clk, areset, din_a2_0im_dut, din_a2_0im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a2_0re : process (clk, areset, din_a2_0re_dut, din_a2_0re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a2_1im : process (clk, areset, din_a2_1im_dut, din_a2_1im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a2_1re : process (clk, areset, din_a2_1re_dut, din_a2_1re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a2_2im : process (clk, areset, din_a2_2im_dut, din_a2_2im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a2_2re : process (clk, areset, din_a2_2re_dut, din_a2_2re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a2_3im : process (clk, areset, din_a2_3im_dut, din_a2_3im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_a2_3re : process (clk, areset, din_a2_3re_dut, din_a2_3re_stm)
begin
END PROCESS;


-- General Purpose data out check
checkaltq_0im : process (clk, areset)
variable mismatch_altq_0im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_altq_0im := FALSE;
        IF ( (altq_0im_dut /= altq_0im_stm) and altv_s_dut = "1") THEN
            mismatch_altq_0im := TRUE;
            report "Mismatch on device output pin altq_0im" severity Warning;
        END IF;
        IF (mismatch_altq_0im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkaltq_0re : process (clk, areset)
variable mismatch_altq_0re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_altq_0re := FALSE;
        IF ( (altq_0re_dut /= altq_0re_stm) and altv_s_dut = "1") THEN
            mismatch_altq_0re := TRUE;
            report "Mismatch on device output pin altq_0re" severity Warning;
        END IF;
        IF (mismatch_altq_0re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkaltq_1im : process (clk, areset)
variable mismatch_altq_1im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_altq_1im := FALSE;
        IF ( (altq_1im_dut /= altq_1im_stm) and altv_s_dut = "1") THEN
            mismatch_altq_1im := TRUE;
            report "Mismatch on device output pin altq_1im" severity Warning;
        END IF;
        IF (mismatch_altq_1im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkaltq_1re : process (clk, areset)
variable mismatch_altq_1re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_altq_1re := FALSE;
        IF ( (altq_1re_dut /= altq_1re_stm) and altv_s_dut = "1") THEN
            mismatch_altq_1re := TRUE;
            report "Mismatch on device output pin altq_1re" severity Warning;
        END IF;
        IF (mismatch_altq_1re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkaltq_2im : process (clk, areset)
variable mismatch_altq_2im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_altq_2im := FALSE;
        IF ( (altq_2im_dut /= altq_2im_stm) and altv_s_dut = "1") THEN
            mismatch_altq_2im := TRUE;
            report "Mismatch on device output pin altq_2im" severity Warning;
        END IF;
        IF (mismatch_altq_2im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkaltq_2re : process (clk, areset)
variable mismatch_altq_2re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_altq_2re := FALSE;
        IF ( (altq_2re_dut /= altq_2re_stm) and altv_s_dut = "1") THEN
            mismatch_altq_2re := TRUE;
            report "Mismatch on device output pin altq_2re" severity Warning;
        END IF;
        IF (mismatch_altq_2re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkaltq_3im : process (clk, areset)
variable mismatch_altq_3im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_altq_3im := FALSE;
        IF ( (altq_3im_dut /= altq_3im_stm) and altv_s_dut = "1") THEN
            mismatch_altq_3im := TRUE;
            report "Mismatch on device output pin altq_3im" severity Warning;
        END IF;
        IF (mismatch_altq_3im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkaltq_3re : process (clk, areset)
variable mismatch_altq_3re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_altq_3re := FALSE;
        IF ( (altq_3re_dut /= altq_3re_stm) and altv_s_dut = "1") THEN
            mismatch_altq_3re := TRUE;
            report "Mismatch on device output pin altq_3re" severity Warning;
        END IF;
        IF (mismatch_altq_3re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkaltv_s : process (clk, areset)
variable mismatch_altv_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_altv_s := FALSE;
        IF ( (altv_s_dut /= altv_s_stm)) THEN
            mismatch_altv_s := TRUE;
            report "Mismatch on device output pin altv_s" severity Warning;
        END IF;
        IF (mismatch_altv_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkaltc_s : process (clk, areset)
variable mismatch_altc_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_altc_s := FALSE;
        IF ( (altc_s_dut /= altc_s_stm) and altv_s_dut = "1") THEN
            mismatch_altc_s := TRUE;
            report "Mismatch on device output pin altc_s" severity Warning;
        END IF;
        IF (mismatch_altc_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    din_a1_0im_stm,
    din_a1_0re_stm,
    din_a1_1im_stm,
    din_a1_1re_stm,
    din_a1_2im_stm,
    din_a1_2re_stm,
    din_a1_3im_stm,
    din_a1_3re_stm,
    vin_a1_s_stm,
    cin_a1_s_stm,
    din_a2_0im_stm,
    din_a2_0re_stm,
    din_a2_1im_stm,
    din_a2_1re_stm,
    din_a2_2im_stm,
    din_a2_2re_stm,
    din_a2_3im_stm,
    din_a2_3re_stm,
    altq_0im_dut,
    altq_0re_dut,
    altq_1im_dut,
    altq_1re_dut,
    altq_2im_dut,
    altq_2re_dut,
    altq_3im_dut,
    altq_3re_dut,
    altv_s_dut,
    altc_s_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : standaloneTopLevel_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_x_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    din_a1_0im_stm,
    din_a1_0re_stm,
    din_a1_1im_stm,
    din_a1_1re_stm,
    din_a1_2im_stm,
    din_a1_2re_stm,
    din_a1_3im_stm,
    din_a1_3re_stm,
    vin_a1_s_stm,
    cin_a1_s_stm,
    din_a2_0im_stm,
    din_a2_0re_stm,
    din_a2_1im_stm,
    din_a2_1re_stm,
    din_a2_2im_stm,
    din_a2_2re_stm,
    din_a2_3im_stm,
    din_a2_3re_stm,
    altq_0im_stm,
    altq_0re_stm,
    altq_1im_stm,
    altq_1re_stm,
    altq_2im_stm,
    altq_2re_stm,
    altq_3im_stm,
    altq_3re_stm,
    altv_s_stm,
    altc_s_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
