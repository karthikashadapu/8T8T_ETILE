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

-- VHDL created from standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect
-- VHDL created on Wed Nov  6 19:28:32 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb is
end;

architecture normal of standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_atb is

component standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(9 downto 0);  -- ufix10
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        vin_s : in std_logic_vector(0 downto 0);  -- ufix1
        chin_s : in std_logic_vector(7 downto 0);  -- ufix8
        FFTSize_s : in std_logic_vector(3 downto 0);  -- ufix4
        d_im : in std_logic_vector(28 downto 0);  -- sfix29_en15
        d_re : in std_logic_vector(28 downto 0);  -- sfix29_en15
        BWby10_s : in std_logic_vector(7 downto 0);  -- ufix8
        TimeReference_s : in std_logic_vector(28 downto 0);  -- ufix29
        qv_s : out std_logic_vector(0 downto 0);  -- ufix1
        qch_s : out std_logic_vector(7 downto 0);  -- ufix8
        q_im : out std_logic_vector(15 downto 0);  -- sfix16_en15
        q_re : out std_logic_vector(15 downto 0);  -- sfix16_en15
        qv139_s : out std_logic_vector(0 downto 0);  -- ufix1
        FreqBinIdx_s : out std_logic_vector(13 downto 0);  -- sfix14
        vout_FFTshift_s : out std_logic_vector(0 downto 0);  -- ufix1
        cout_FFTshift_s : out std_logic_vector(7 downto 0);  -- ufix8
        dout_FFTshift_im : out std_logic_vector(15 downto 0);  -- sfix16_en15
        dout_FFTshift_re : out std_logic_vector(15 downto 0);  -- sfix16_en15
        Tref_s : out std_logic_vector(28 downto 0);  -- ufix29
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(9 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        vin_s_stm : out std_logic_vector(0 downto 0);
        chin_s_stm : out std_logic_vector(7 downto 0);
        FFTSize_s_stm : out std_logic_vector(3 downto 0);
        d_im_stm : out std_logic_vector(28 downto 0);
        d_re_stm : out std_logic_vector(28 downto 0);
        BWby10_s_stm : out std_logic_vector(7 downto 0);
        TimeReference_s_stm : out std_logic_vector(28 downto 0);
        qv_s_stm : out std_logic_vector(0 downto 0);
        qch_s_stm : out std_logic_vector(7 downto 0);
        q_im_stm : out std_logic_vector(15 downto 0);
        q_re_stm : out std_logic_vector(15 downto 0);
        qv139_s_stm : out std_logic_vector(0 downto 0);
        FreqBinIdx_s_stm : out std_logic_vector(13 downto 0);
        vout_FFTshift_s_stm : out std_logic_vector(0 downto 0);
        cout_FFTshift_s_stm : out std_logic_vector(7 downto 0);
        dout_FFTshift_im_stm : out std_logic_vector(15 downto 0);
        dout_FFTshift_re_stm : out std_logic_vector(15 downto 0);
        Tref_s_stm : out std_logic_vector(28 downto 0);
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
signal vin_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal chin_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal FFTSize_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal d_im_stm : STD_LOGIC_VECTOR (28 downto 0);
signal d_re_stm : STD_LOGIC_VECTOR (28 downto 0);
signal BWby10_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal TimeReference_s_stm : STD_LOGIC_VECTOR (28 downto 0);
signal qv_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal qch_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal q_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal q_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal qv139_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal FreqBinIdx_s_stm : STD_LOGIC_VECTOR (13 downto 0);
signal vout_FFTshift_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal cout_FFTshift_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal dout_FFTshift_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_FFTshift_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal Tref_s_stm : STD_LOGIC_VECTOR (28 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (9 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal vin_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal chin_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal FFTSize_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal d_im_dut : STD_LOGIC_VECTOR (28 downto 0);
signal d_re_dut : STD_LOGIC_VECTOR (28 downto 0);
signal BWby10_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal TimeReference_s_dut : STD_LOGIC_VECTOR (28 downto 0);
signal qv_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal qch_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal q_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal q_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal qv139_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal FreqBinIdx_s_dut : STD_LOGIC_VECTOR (13 downto 0);
signal vout_FFTshift_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal cout_FFTshift_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal dout_FFTshift_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_FFTshift_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal Tref_s_dut : STD_LOGIC_VECTOR (28 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkvin_s : process (clk, areset, vin_s_dut, vin_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkchin_s : process (clk, areset, chin_s_dut, chin_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkFFTSize_s : process (clk, areset, FFTSize_s_dut, FFTSize_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_im : process (clk, areset, d_im_dut, d_im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_re : process (clk, areset, d_re_dut, d_re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkBWby10_s : process (clk, areset, BWby10_s_dut, BWby10_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkTimeReference_s : process (clk, areset, TimeReference_s_dut, TimeReference_s_stm)
begin
END PROCESS;


-- General Purpose data out check
checkqv_s : process (clk, areset)
variable mismatch_qv_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_qv_s := FALSE;
        IF ( (qv_s_dut /= qv_s_stm)) THEN
            mismatch_qv_s := TRUE;
            report "Mismatch on device output pin qv_s" severity Warning;
        END IF;
        IF (mismatch_qv_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkqch_s : process (clk, areset)
variable mismatch_qch_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_qch_s := FALSE;
        IF ( (qch_s_dut /= qch_s_stm) and qv_s_dut = "1") THEN
            mismatch_qch_s := TRUE;
            report "Mismatch on device output pin qch_s" severity Warning;
        END IF;
        IF (mismatch_qch_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq_im : process (clk, areset)
variable mismatch_q_im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q_im := FALSE;
        IF ( (q_im_dut /= q_im_stm) and qv_s_dut = "1") THEN
            mismatch_q_im := TRUE;
            report "Mismatch on device output pin q_im" severity Warning;
        END IF;
        IF (mismatch_q_im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkq_re : process (clk, areset)
variable mismatch_q_re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_q_re := FALSE;
        IF ( (q_re_dut /= q_re_stm) and qv_s_dut = "1") THEN
            mismatch_q_re := TRUE;
            report "Mismatch on device output pin q_re" severity Warning;
        END IF;
        IF (mismatch_q_re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkqv139_s : process (clk, areset)
variable mismatch_qv139_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_qv139_s := FALSE;
        IF ( (qv139_s_dut /= qv139_s_stm) and qv_s_dut = "1") THEN
            mismatch_qv139_s := TRUE;
            report "Mismatch on device output pin qv139_s" severity Warning;
        END IF;
        IF (mismatch_qv139_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkFreqBinIdx_s : process (clk, areset)
variable mismatch_FreqBinIdx_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_FreqBinIdx_s := FALSE;
        IF ( (FreqBinIdx_s_dut /= FreqBinIdx_s_stm) and qv_s_dut = "1") THEN
            mismatch_FreqBinIdx_s := TRUE;
            report "Mismatch on device output pin FreqBinIdx_s" severity Warning;
        END IF;
        IF (mismatch_FreqBinIdx_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkvout_FFTshift_s : process (clk, areset)
variable mismatch_vout_FFTshift_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_vout_FFTshift_s := FALSE;
        IF ( (vout_FFTshift_s_dut /= vout_FFTshift_s_stm)) THEN
            mismatch_vout_FFTshift_s := TRUE;
            report "Mismatch on device output pin vout_FFTshift_s" severity Warning;
        END IF;
        IF (mismatch_vout_FFTshift_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkcout_FFTshift_s : process (clk, areset)
variable mismatch_cout_FFTshift_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_cout_FFTshift_s := FALSE;
        IF ( (cout_FFTshift_s_dut /= cout_FFTshift_s_stm) and vout_FFTshift_s_dut = "1") THEN
            mismatch_cout_FFTshift_s := TRUE;
            report "Mismatch on device output pin cout_FFTshift_s" severity Warning;
        END IF;
        IF (mismatch_cout_FFTshift_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_FFTshift_im : process (clk, areset)
variable mismatch_dout_FFTshift_im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_FFTshift_im := FALSE;
        IF ( (dout_FFTshift_im_dut /= dout_FFTshift_im_stm) and vout_FFTshift_s_dut = "1") THEN
            mismatch_dout_FFTshift_im := TRUE;
            report "Mismatch on device output pin dout_FFTshift_im" severity Warning;
        END IF;
        IF (mismatch_dout_FFTshift_im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_FFTshift_re : process (clk, areset)
variable mismatch_dout_FFTshift_re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_FFTshift_re := FALSE;
        IF ( (dout_FFTshift_re_dut /= dout_FFTshift_re_stm) and vout_FFTshift_s_dut = "1") THEN
            mismatch_dout_FFTshift_re := TRUE;
            report "Mismatch on device output pin dout_FFTshift_re" severity Warning;
        END IF;
        IF (mismatch_dout_FFTshift_re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkTref_s : process (clk, areset)
variable mismatch_Tref_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_Tref_s := FALSE;
        IF ( (Tref_s_dut /= Tref_s_stm) and vout_FFTshift_s_dut = "1") THEN
            mismatch_Tref_s := TRUE;
            report "Mismatch on device output pin Tref_s" severity Warning;
        END IF;
        IF (mismatch_Tref_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    vin_s_stm,
    chin_s_stm,
    FFTSize_s_stm,
    d_im_stm,
    d_re_stm,
    BWby10_s_stm,
    TimeReference_s_stm,
    qv_s_dut,
    qch_s_dut,
    q_im_dut,
    q_re_dut,
    qv139_s_dut,
    FreqBinIdx_s_dut,
    vout_FFTshift_s_dut,
    cout_FFTshift_s_dut,
    dout_FFTshift_im_dut,
    dout_FFTshift_re_dut,
    Tref_s_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    vin_s_stm,
    chin_s_stm,
    FFTSize_s_stm,
    d_im_stm,
    d_re_stm,
    BWby10_s_stm,
    TimeReference_s_stm,
    qv_s_stm,
    qch_s_stm,
    q_im_stm,
    q_re_stm,
    qv139_s_stm,
    FreqBinIdx_s_stm,
    vout_FFTshift_s_stm,
    cout_FFTshift_s_stm,
    dout_FFTshift_im_stm,
    dout_FFTshift_re_stm,
    Tref_s_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
