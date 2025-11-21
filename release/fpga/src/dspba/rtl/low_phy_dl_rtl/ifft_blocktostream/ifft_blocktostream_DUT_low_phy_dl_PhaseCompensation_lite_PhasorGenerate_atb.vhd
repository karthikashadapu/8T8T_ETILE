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

-- VHDL created from standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate
-- VHDL created on Thu Jun 12 21:17:48 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb is
end;

architecture normal of standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_atb is

component standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(13 downto 0);  -- ufix14
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        v_s : in std_logic_vector(0 downto 0);  -- ufix1
        c_s : in std_logic_vector(7 downto 0);  -- ufix8
        d1_im : in std_logic_vector(15 downto 0);  -- sfix16_en15
        d1_re : in std_logic_vector(15 downto 0);  -- sfix16_en15
        Tsym1_s : in std_logic_vector(15 downto 0);  -- sfix16_en15
        cp_T1_s : in std_logic_vector(15 downto 0);  -- sfix16_en15
        CP_EN1_s : in std_logic_vector(0 downto 0);  -- ufix1
        fft_size_s : in std_logic_vector(3 downto 0);  -- ufix4
        CPLen_s : in std_logic_vector(10 downto 0);  -- ufix11
        nsc_s : in std_logic_vector(11 downto 0);  -- ufix12
        eAxC_s : in std_logic_vector(0 downto 0);  -- ufix1
        sym_metadata_s : in std_logic_vector(0 downto 0);  -- ufix1
        ul_timerefin_s : in std_logic_vector(63 downto 0);  -- ufix64
        dout1_im : out std_logic_vector(15 downto 0);  -- sfix16_en15
        dout1_re : out std_logic_vector(15 downto 0);  -- sfix16_en15
        vout_s : out std_logic_vector(0 downto 0);  -- ufix1
        cout_s : out std_logic_vector(7 downto 0);  -- ufix8
        sin_s : out std_logic_vector(17 downto 0);  -- sfix18_en15
        cos_s : out std_logic_vector(17 downto 0);  -- sfix18_en15
        fft_size_out_s : out std_logic_vector(3 downto 0);  -- ufix4
        CPLenout_s : out std_logic_vector(10 downto 0);  -- ufix11
        nsc_out_s : out std_logic_vector(11 downto 0);  -- ufix12
        eAxC_out_s : out std_logic_vector(0 downto 0);  -- ufix1
        sym_metadata_out_s : out std_logic_vector(0 downto 0);  -- ufix1
        ul_timeref_out_s : out std_logic_vector(63 downto 0);  -- ufix64
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        v_s_stm : out std_logic_vector(0 downto 0);
        c_s_stm : out std_logic_vector(7 downto 0);
        d1_im_stm : out std_logic_vector(15 downto 0);
        d1_re_stm : out std_logic_vector(15 downto 0);
        Tsym1_s_stm : out std_logic_vector(15 downto 0);
        cp_T1_s_stm : out std_logic_vector(15 downto 0);
        CP_EN1_s_stm : out std_logic_vector(0 downto 0);
        fft_size_s_stm : out std_logic_vector(3 downto 0);
        CPLen_s_stm : out std_logic_vector(10 downto 0);
        nsc_s_stm : out std_logic_vector(11 downto 0);
        eAxC_s_stm : out std_logic_vector(0 downto 0);
        sym_metadata_s_stm : out std_logic_vector(0 downto 0);
        ul_timerefin_s_stm : out std_logic_vector(63 downto 0);
        dout1_im_stm : out std_logic_vector(15 downto 0);
        dout1_re_stm : out std_logic_vector(15 downto 0);
        vout_s_stm : out std_logic_vector(0 downto 0);
        cout_s_stm : out std_logic_vector(7 downto 0);
        sin_s_stm : out std_logic_vector(17 downto 0);
        cos_s_stm : out std_logic_vector(17 downto 0);
        fft_size_out_s_stm : out std_logic_vector(3 downto 0);
        CPLenout_s_stm : out std_logic_vector(10 downto 0);
        nsc_out_s_stm : out std_logic_vector(11 downto 0);
        eAxC_out_s_stm : out std_logic_vector(0 downto 0);
        sym_metadata_out_s_stm : out std_logic_vector(0 downto 0);
        ul_timeref_out_s_stm : out std_logic_vector(63 downto 0);
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
signal v_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal c_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal d1_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d1_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal Tsym1_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal cp_T1_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal CP_EN1_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal fft_size_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal CPLen_s_stm : STD_LOGIC_VECTOR (10 downto 0);
signal nsc_s_stm : STD_LOGIC_VECTOR (11 downto 0);
signal eAxC_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal sym_metadata_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal ul_timerefin_s_stm : STD_LOGIC_VECTOR (63 downto 0);
signal dout1_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout1_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal vout_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal cout_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal sin_s_stm : STD_LOGIC_VECTOR (17 downto 0);
signal cos_s_stm : STD_LOGIC_VECTOR (17 downto 0);
signal fft_size_out_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal CPLenout_s_stm : STD_LOGIC_VECTOR (10 downto 0);
signal nsc_out_s_stm : STD_LOGIC_VECTOR (11 downto 0);
signal eAxC_out_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal sym_metadata_out_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal ul_timeref_out_s_stm : STD_LOGIC_VECTOR (63 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal v_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal c_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal d1_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d1_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal Tsym1_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal cp_T1_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal CP_EN1_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal fft_size_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal CPLen_s_dut : STD_LOGIC_VECTOR (10 downto 0);
signal nsc_s_dut : STD_LOGIC_VECTOR (11 downto 0);
signal eAxC_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal sym_metadata_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal ul_timerefin_s_dut : STD_LOGIC_VECTOR (63 downto 0);
signal dout1_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout1_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal vout_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal cout_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal sin_s_dut : STD_LOGIC_VECTOR (17 downto 0);
signal cos_s_dut : STD_LOGIC_VECTOR (17 downto 0);
signal fft_size_out_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal CPLenout_s_dut : STD_LOGIC_VECTOR (10 downto 0);
signal nsc_out_s_dut : STD_LOGIC_VECTOR (11 downto 0);
signal eAxC_out_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal sym_metadata_out_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal ul_timeref_out_s_dut : STD_LOGIC_VECTOR (63 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkv_s : process (clk, areset, v_s_dut, v_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkc_s : process (clk, areset, c_s_dut, c_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd1_im : process (clk, areset, d1_im_dut, d1_im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd1_re : process (clk, areset, d1_re_dut, d1_re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkTsym1_s : process (clk, areset, Tsym1_s_dut, Tsym1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkcp_T1_s : process (clk, areset, cp_T1_s_dut, cp_T1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkCP_EN1_s : process (clk, areset, CP_EN1_s_dut, CP_EN1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkfft_size_s : process (clk, areset, fft_size_s_dut, fft_size_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkCPLen_s : process (clk, areset, CPLen_s_dut, CPLen_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checknsc_s : process (clk, areset, nsc_s_dut, nsc_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkeAxC_s : process (clk, areset, eAxC_s_dut, eAxC_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checksym_metadata_s : process (clk, areset, sym_metadata_s_dut, sym_metadata_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkul_timerefin_s : process (clk, areset, ul_timerefin_s_dut, ul_timerefin_s_stm)
begin
END PROCESS;


-- General Purpose data out check
checkdout1_im : process (clk, areset)
variable mismatch_dout1_im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout1_im := FALSE;
        IF ( (dout1_im_dut /= dout1_im_stm) and vout_s_dut = "1") THEN
            mismatch_dout1_im := TRUE;
            report "Mismatch on device output pin dout1_im" severity Warning;
        END IF;
        IF (mismatch_dout1_im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout1_re : process (clk, areset)
variable mismatch_dout1_re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout1_re := FALSE;
        IF ( (dout1_re_dut /= dout1_re_stm) and vout_s_dut = "1") THEN
            mismatch_dout1_re := TRUE;
            report "Mismatch on device output pin dout1_re" severity Warning;
        END IF;
        IF (mismatch_dout1_re = TRUE) THEN
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
checksin_s : process (clk, areset)
variable mismatch_sin_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_sin_s := FALSE;
        IF ( (sin_s_dut /= sin_s_stm) and vout_s_dut = "1") THEN
            mismatch_sin_s := TRUE;
            report "Mismatch on device output pin sin_s" severity Warning;
        END IF;
        IF (mismatch_sin_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkcos_s : process (clk, areset)
variable mismatch_cos_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_cos_s := FALSE;
        IF ( (cos_s_dut /= cos_s_stm) and vout_s_dut = "1") THEN
            mismatch_cos_s := TRUE;
            report "Mismatch on device output pin cos_s" severity Warning;
        END IF;
        IF (mismatch_cos_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkfft_size_out_s : process (clk, areset)
variable mismatch_fft_size_out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_fft_size_out_s := FALSE;
        IF ( (fft_size_out_s_dut /= fft_size_out_s_stm) and vout_s_dut = "1") THEN
            mismatch_fft_size_out_s := TRUE;
            report "Mismatch on device output pin fft_size_out_s" severity Warning;
        END IF;
        IF (mismatch_fft_size_out_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkCPLenout_s : process (clk, areset)
variable mismatch_CPLenout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_CPLenout_s := FALSE;
        IF ( (CPLenout_s_dut /= CPLenout_s_stm) and vout_s_dut = "1") THEN
            mismatch_CPLenout_s := TRUE;
            report "Mismatch on device output pin CPLenout_s" severity Warning;
        END IF;
        IF (mismatch_CPLenout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checknsc_out_s : process (clk, areset)
variable mismatch_nsc_out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_nsc_out_s := FALSE;
        IF ( (nsc_out_s_dut /= nsc_out_s_stm) and vout_s_dut = "1") THEN
            mismatch_nsc_out_s := TRUE;
            report "Mismatch on device output pin nsc_out_s" severity Warning;
        END IF;
        IF (mismatch_nsc_out_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkeAxC_out_s : process (clk, areset)
variable mismatch_eAxC_out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_eAxC_out_s := FALSE;
        IF ( (eAxC_out_s_dut /= eAxC_out_s_stm) and vout_s_dut = "1") THEN
            mismatch_eAxC_out_s := TRUE;
            report "Mismatch on device output pin eAxC_out_s" severity Warning;
        END IF;
        IF (mismatch_eAxC_out_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksym_metadata_out_s : process (clk, areset)
variable mismatch_sym_metadata_out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_sym_metadata_out_s := FALSE;
        IF ( (sym_metadata_out_s_dut /= sym_metadata_out_s_stm) and vout_s_dut = "1") THEN
            mismatch_sym_metadata_out_s := TRUE;
            report "Mismatch on device output pin sym_metadata_out_s" severity Warning;
        END IF;
        IF (mismatch_sym_metadata_out_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkul_timeref_out_s : process (clk, areset)
variable mismatch_ul_timeref_out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_ul_timeref_out_s := FALSE;
        IF ( (ul_timeref_out_s_dut /= ul_timeref_out_s_stm) and vout_s_dut = "1") THEN
            mismatch_ul_timeref_out_s := TRUE;
            report "Mismatch on device output pin ul_timeref_out_s" severity Warning;
        END IF;
        IF (mismatch_ul_timeref_out_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    v_s_stm,
    c_s_stm,
    d1_im_stm,
    d1_re_stm,
    Tsym1_s_stm,
    cp_T1_s_stm,
    CP_EN1_s_stm,
    fft_size_s_stm,
    CPLen_s_stm,
    nsc_s_stm,
    eAxC_s_stm,
    sym_metadata_s_stm,
    ul_timerefin_s_stm,
    dout1_im_dut,
    dout1_re_dut,
    vout_s_dut,
    cout_s_dut,
    sin_s_dut,
    cos_s_dut,
    fft_size_out_s_dut,
    CPLenout_s_dut,
    nsc_out_s_dut,
    eAxC_out_s_dut,
    sym_metadata_out_s_dut,
    ul_timeref_out_s_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    v_s_stm,
    c_s_stm,
    d1_im_stm,
    d1_re_stm,
    Tsym1_s_stm,
    cp_T1_s_stm,
    CP_EN1_s_stm,
    fft_size_s_stm,
    CPLen_s_stm,
    nsc_s_stm,
    eAxC_s_stm,
    sym_metadata_s_stm,
    ul_timerefin_s_stm,
    dout1_im_stm,
    dout1_re_stm,
    vout_s_stm,
    cout_s_stm,
    sin_s_stm,
    cos_s_stm,
    fft_size_out_s_stm,
    CPLenout_s_stm,
    nsc_out_s_stm,
    eAxC_out_s_stm,
    sym_metadata_out_s_stm,
    ul_timeref_out_s_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
