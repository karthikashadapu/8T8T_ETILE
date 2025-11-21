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

-- VHDL created from standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode
-- VHDL created on Wed Nov  6 19:28:32 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb is
end;

architecture normal of standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_atb is

component standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(9 downto 0);  -- ufix10
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        din_im : in std_logic_vector(15 downto 0);  -- sfix16_en15
        din_re : in std_logic_vector(15 downto 0);  -- sfix16_en15
        vin_s : in std_logic_vector(0 downto 0);  -- ufix1
        chin_s : in std_logic_vector(7 downto 0);  -- ufix8
        SFN_s : in std_logic_vector(11 downto 0);  -- ufix12
        SubFN_s : in std_logic_vector(7 downto 0);  -- ufix8
        SCSby15_s : in std_logic_vector(1 downto 0);  -- ufix2
        BWby10_s : in std_logic_vector(7 downto 0);  -- ufix8
        dout_im : out std_logic_vector(15 downto 0);  -- sfix16_en15
        dout_re : out std_logic_vector(15 downto 0);  -- sfix16_en15
        vout_s : out std_logic_vector(0 downto 0);  -- ufix1
        cout_s : out std_logic_vector(7 downto 0);  -- ufix8
        CPLen_s : out std_logic_vector(22 downto 0);  -- ufix23
        FFTSize_s : out std_logic_vector(3 downto 0);  -- ufix4
        NFFTs_s : out std_logic_vector(3 downto 0);  -- ufix4
        SOP_s : out std_logic_vector(0 downto 0);  -- ufix1
        qBWby10_s : out std_logic_vector(7 downto 0);  -- ufix8
        TimeReference_s : out std_logic_vector(28 downto 0);  -- ufix29
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(9 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        din_im_stm : out std_logic_vector(15 downto 0);
        din_re_stm : out std_logic_vector(15 downto 0);
        vin_s_stm : out std_logic_vector(0 downto 0);
        chin_s_stm : out std_logic_vector(7 downto 0);
        SFN_s_stm : out std_logic_vector(11 downto 0);
        SubFN_s_stm : out std_logic_vector(7 downto 0);
        SCSby15_s_stm : out std_logic_vector(1 downto 0);
        BWby10_s_stm : out std_logic_vector(7 downto 0);
        dout_im_stm : out std_logic_vector(15 downto 0);
        dout_re_stm : out std_logic_vector(15 downto 0);
        vout_s_stm : out std_logic_vector(0 downto 0);
        cout_s_stm : out std_logic_vector(7 downto 0);
        CPLen_s_stm : out std_logic_vector(22 downto 0);
        FFTSize_s_stm : out std_logic_vector(3 downto 0);
        NFFTs_s_stm : out std_logic_vector(3 downto 0);
        SOP_s_stm : out std_logic_vector(0 downto 0);
        qBWby10_s_stm : out std_logic_vector(7 downto 0);
        TimeReference_s_stm : out std_logic_vector(28 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end component;

signal busIn_writedata_stm : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_stm : STD_LOGIC_VECTOR (9 downto 0);
signal busIn_write_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_stm : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_stm : STD_LOGIC_VECTOR (0 downto 0);
signal din_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal vin_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal chin_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal SFN_s_stm : STD_LOGIC_VECTOR (11 downto 0);
signal SubFN_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal SCSby15_s_stm : STD_LOGIC_VECTOR (1 downto 0);
signal BWby10_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal dout_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal vout_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal cout_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal CPLen_s_stm : STD_LOGIC_VECTOR (22 downto 0);
signal FFTSize_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal NFFTs_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal SOP_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal qBWby10_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal TimeReference_s_stm : STD_LOGIC_VECTOR (28 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (9 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal din_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal vin_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal chin_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal SFN_s_dut : STD_LOGIC_VECTOR (11 downto 0);
signal SubFN_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal SCSby15_s_dut : STD_LOGIC_VECTOR (1 downto 0);
signal BWby10_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal dout_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal vout_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal cout_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal CPLen_s_dut : STD_LOGIC_VECTOR (22 downto 0);
signal FFTSize_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal NFFTs_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal SOP_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal qBWby10_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal TimeReference_s_dut : STD_LOGIC_VECTOR (28 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkdin_im : process (clk, areset, din_im_dut, din_im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_re : process (clk, areset, din_re_dut, din_re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkvin_s : process (clk, areset, vin_s_dut, vin_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkchin_s : process (clk, areset, chin_s_dut, chin_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkSFN_s : process (clk, areset, SFN_s_dut, SFN_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkSubFN_s : process (clk, areset, SubFN_s_dut, SubFN_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkSCSby15_s : process (clk, areset, SCSby15_s_dut, SCSby15_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkBWby10_s : process (clk, areset, BWby10_s_dut, BWby10_s_stm)
begin
END PROCESS;


-- General Purpose data out check
checkdout_im : process (clk, areset)
variable mismatch_dout_im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_im := FALSE;
        IF ( (dout_im_dut /= dout_im_stm) and vout_s_dut = "1") THEN
            mismatch_dout_im := TRUE;
            report "Mismatch on device output pin dout_im" severity Warning;
        END IF;
        IF (mismatch_dout_im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_re : process (clk, areset)
variable mismatch_dout_re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_re := FALSE;
        IF ( (dout_re_dut /= dout_re_stm) and vout_s_dut = "1") THEN
            mismatch_dout_re := TRUE;
            report "Mismatch on device output pin dout_re" severity Warning;
        END IF;
        IF (mismatch_dout_re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkvout_s : process (clk, areset)
variable mismatch_vout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_vout_s := FALSE;
        IF ( (vout_s_dut /= vout_s_stm)) THEN
            mismatch_vout_s := TRUE;
            report "Mismatch on device output pin vout_s" severity Warning;
        END IF;
        IF (mismatch_vout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkcout_s : process (clk, areset)
variable mismatch_cout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_cout_s := FALSE;
        IF ( (cout_s_dut /= cout_s_stm) and vout_s_dut = "1") THEN
            mismatch_cout_s := TRUE;
            report "Mismatch on device output pin cout_s" severity Warning;
        END IF;
        IF (mismatch_cout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkCPLen_s : process (clk, areset)
variable mismatch_CPLen_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_CPLen_s := FALSE;
        IF ( (CPLen_s_dut /= CPLen_s_stm) and vout_s_dut = "1") THEN
            mismatch_CPLen_s := TRUE;
            report "Mismatch on device output pin CPLen_s" severity Warning;
        END IF;
        IF (mismatch_CPLen_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkFFTSize_s : process (clk, areset)
variable mismatch_FFTSize_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_FFTSize_s := FALSE;
        IF ( (FFTSize_s_dut /= FFTSize_s_stm) and vout_s_dut = "1") THEN
            mismatch_FFTSize_s := TRUE;
            report "Mismatch on device output pin FFTSize_s" severity Warning;
        END IF;
        IF (mismatch_FFTSize_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkNFFTs_s : process (clk, areset)
variable mismatch_NFFTs_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_NFFTs_s := FALSE;
        IF ( (NFFTs_s_dut /= NFFTs_s_stm) and vout_s_dut = "1") THEN
            mismatch_NFFTs_s := TRUE;
            report "Mismatch on device output pin NFFTs_s" severity Warning;
        END IF;
        IF (mismatch_NFFTs_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkSOP_s : process (clk, areset)
variable mismatch_SOP_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_SOP_s := FALSE;
        IF ( (SOP_s_dut /= SOP_s_stm) and vout_s_dut = "1") THEN
            mismatch_SOP_s := TRUE;
            report "Mismatch on device output pin SOP_s" severity Warning;
        END IF;
        IF (mismatch_SOP_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkqBWby10_s : process (clk, areset)
variable mismatch_qBWby10_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_qBWby10_s := FALSE;
        IF ( (qBWby10_s_dut /= qBWby10_s_stm) and vout_s_dut = "1") THEN
            mismatch_qBWby10_s := TRUE;
            report "Mismatch on device output pin qBWby10_s" severity Warning;
        END IF;
        IF (mismatch_qBWby10_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkTimeReference_s : process (clk, areset)
variable mismatch_TimeReference_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_TimeReference_s := FALSE;
        IF ( (TimeReference_s_dut /= TimeReference_s_stm) and vout_s_dut = "1") THEN
            mismatch_TimeReference_s := TRUE;
            report "Mismatch on device output pin TimeReference_s" severity Warning;
        END IF;
        IF (mismatch_TimeReference_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    din_im_stm,
    din_re_stm,
    vin_s_stm,
    chin_s_stm,
    SFN_s_stm,
    SubFN_s_stm,
    SCSby15_s_stm,
    BWby10_s_stm,
    dout_im_dut,
    dout_re_dut,
    vout_s_dut,
    cout_s_dut,
    CPLen_s_dut,
    FFTSize_s_dut,
    NFFTs_s_dut,
    SOP_s_dut,
    qBWby10_s_dut,
    TimeReference_s_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    din_im_stm,
    din_re_stm,
    vin_s_stm,
    chin_s_stm,
    SFN_s_stm,
    SubFN_s_stm,
    SCSby15_s_stm,
    BWby10_s_stm,
    dout_im_stm,
    dout_re_stm,
    vout_s_stm,
    cout_s_stm,
    CPLen_s_stm,
    FFTSize_s_stm,
    NFFTs_s_stm,
    SOP_s_stm,
    qBWby10_s_stm,
    TimeReference_s_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
