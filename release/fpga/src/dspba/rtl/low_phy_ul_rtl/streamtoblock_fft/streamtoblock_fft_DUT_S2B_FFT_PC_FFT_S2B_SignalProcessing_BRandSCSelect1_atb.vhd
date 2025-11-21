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

-- VHDL created from standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1
-- VHDL created on Thu Jun 12 21:29:54 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb is
end;

architecture normal of standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_atb is

component standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1 is
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
        x_im : in std_logic_vector(15 downto 0);  -- sfix16_en12
        x_re : in std_logic_vector(15 downto 0);  -- sfix16_en12
        FFTSize_s : in std_logic_vector(3 downto 0);  -- ufix4
        NSubCarr_s : in std_logic_vector(15 downto 0);  -- ufix16
        time_in_s : in std_logic_vector(63 downto 0);  -- ufix64
        DC_SC_EN_s : in std_logic_vector(0 downto 0);  -- ufix1
        ripple_comp_en_s : in std_logic_vector(0 downto 0);  -- ufix1
        rc_bw_sel_s : in std_logic_vector(0 downto 0);  -- ufix1
        eAxC_s : in std_logic_vector(1 downto 0);  -- ufix2
        metadata_in_s : in std_logic_vector(63 downto 0);  -- ufix64
        qv_s : out std_logic_vector(0 downto 0);  -- ufix1
        qc_s : out std_logic_vector(7 downto 0);  -- ufix8
        q_im : out std_logic_vector(15 downto 0);  -- sfix16_en11
        q_re : out std_logic_vector(15 downto 0);  -- sfix16_en11
        qsizeout_s : out std_logic_vector(3 downto 0);  -- ufix4
        time_out_s : out std_logic_vector(63 downto 0);  -- ufix64
        eAxC_out_s : out std_logic_vector(1 downto 0);  -- ufix2
        meatadata_sym_out_s : out std_logic_vector(63 downto 0);  -- ufix64
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_stm is
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
        x_im_stm : out std_logic_vector(15 downto 0);
        x_re_stm : out std_logic_vector(15 downto 0);
        FFTSize_s_stm : out std_logic_vector(3 downto 0);
        NSubCarr_s_stm : out std_logic_vector(15 downto 0);
        time_in_s_stm : out std_logic_vector(63 downto 0);
        DC_SC_EN_s_stm : out std_logic_vector(0 downto 0);
        ripple_comp_en_s_stm : out std_logic_vector(0 downto 0);
        rc_bw_sel_s_stm : out std_logic_vector(0 downto 0);
        eAxC_s_stm : out std_logic_vector(1 downto 0);
        metadata_in_s_stm : out std_logic_vector(63 downto 0);
        qv_s_stm : out std_logic_vector(0 downto 0);
        qc_s_stm : out std_logic_vector(7 downto 0);
        q_im_stm : out std_logic_vector(15 downto 0);
        q_re_stm : out std_logic_vector(15 downto 0);
        qsizeout_s_stm : out std_logic_vector(3 downto 0);
        time_out_s_stm : out std_logic_vector(63 downto 0);
        eAxC_out_s_stm : out std_logic_vector(1 downto 0);
        meatadata_sym_out_s_stm : out std_logic_vector(63 downto 0);
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
signal x_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal x_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal FFTSize_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal NSubCarr_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal time_in_s_stm : STD_LOGIC_VECTOR (63 downto 0);
signal DC_SC_EN_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal ripple_comp_en_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal rc_bw_sel_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal eAxC_s_stm : STD_LOGIC_VECTOR (1 downto 0);
signal metadata_in_s_stm : STD_LOGIC_VECTOR (63 downto 0);
signal qv_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal qc_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal q_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal q_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal qsizeout_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal time_out_s_stm : STD_LOGIC_VECTOR (63 downto 0);
signal eAxC_out_s_stm : STD_LOGIC_VECTOR (1 downto 0);
signal meatadata_sym_out_s_stm : STD_LOGIC_VECTOR (63 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal v_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal c_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal x_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal x_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal FFTSize_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal NSubCarr_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal time_in_s_dut : STD_LOGIC_VECTOR (63 downto 0);
signal DC_SC_EN_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal ripple_comp_en_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal rc_bw_sel_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal eAxC_s_dut : STD_LOGIC_VECTOR (1 downto 0);
signal metadata_in_s_dut : STD_LOGIC_VECTOR (63 downto 0);
signal qv_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal qc_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal q_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal q_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal qsizeout_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal time_out_s_dut : STD_LOGIC_VECTOR (63 downto 0);
signal eAxC_out_s_dut : STD_LOGIC_VECTOR (1 downto 0);
signal meatadata_sym_out_s_dut : STD_LOGIC_VECTOR (63 downto 0);
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
checkx_im : process (clk, areset, x_im_dut, x_im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkx_re : process (clk, areset, x_re_dut, x_re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkFFTSize_s : process (clk, areset, FFTSize_s_dut, FFTSize_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkNSubCarr_s : process (clk, areset, NSubCarr_s_dut, NSubCarr_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checktime_in_s : process (clk, areset, time_in_s_dut, time_in_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDC_SC_EN_s : process (clk, areset, DC_SC_EN_s_dut, DC_SC_EN_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkripple_comp_en_s : process (clk, areset, ripple_comp_en_s_dut, ripple_comp_en_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkrc_bw_sel_s : process (clk, areset, rc_bw_sel_s_dut, rc_bw_sel_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkeAxC_s : process (clk, areset, eAxC_s_dut, eAxC_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkmetadata_in_s : process (clk, areset, metadata_in_s_dut, metadata_in_s_stm)
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
checkqc_s : process (clk, areset)
variable mismatch_qc_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_qc_s := FALSE;
        IF ( (qc_s_dut /= qc_s_stm) and qv_s_dut = "1") THEN
            mismatch_qc_s := TRUE;
            report "Mismatch on device output pin qc_s" severity Warning;
        END IF;
        IF (mismatch_qc_s = TRUE) THEN
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
checkqsizeout_s : process (clk, areset)
variable mismatch_qsizeout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_qsizeout_s := FALSE;
        IF ( (qsizeout_s_dut /= qsizeout_s_stm) and qv_s_dut = "1") THEN
            mismatch_qsizeout_s := TRUE;
            report "Mismatch on device output pin qsizeout_s" severity Warning;
        END IF;
        IF (mismatch_qsizeout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checktime_out_s : process (clk, areset)
variable mismatch_time_out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_time_out_s := FALSE;
        IF ( (time_out_s_dut /= time_out_s_stm) and qv_s_dut = "1") THEN
            mismatch_time_out_s := TRUE;
            report "Mismatch on device output pin time_out_s" severity Warning;
        END IF;
        IF (mismatch_time_out_s = TRUE) THEN
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
        IF ( (eAxC_out_s_dut /= eAxC_out_s_stm) and qv_s_dut = "1") THEN
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
checkmeatadata_sym_out_s : process (clk, areset)
variable mismatch_meatadata_sym_out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_meatadata_sym_out_s := FALSE;
        IF ( (meatadata_sym_out_s_dut /= meatadata_sym_out_s_stm) and qv_s_dut = "1") THEN
            mismatch_meatadata_sym_out_s := TRUE;
            report "Mismatch on device output pin meatadata_sym_out_s" severity Warning;
        END IF;
        IF (mismatch_meatadata_sym_out_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1 port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    v_s_stm,
    c_s_stm,
    x_im_stm,
    x_re_stm,
    FFTSize_s_stm,
    NSubCarr_s_stm,
    time_in_s_stm,
    DC_SC_EN_s_stm,
    ripple_comp_en_s_stm,
    rc_bw_sel_s_stm,
    eAxC_s_stm,
    metadata_in_s_stm,
    qv_s_dut,
    qc_s_dut,
    q_im_dut,
    q_re_dut,
    qsizeout_s_dut,
    time_out_s_dut,
    eAxC_out_s_dut,
    meatadata_sym_out_s_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    v_s_stm,
    c_s_stm,
    x_im_stm,
    x_re_stm,
    FFTSize_s_stm,
    NSubCarr_s_stm,
    time_in_s_stm,
    DC_SC_EN_s_stm,
    ripple_comp_en_s_stm,
    rc_bw_sel_s_stm,
    eAxC_s_stm,
    metadata_in_s_stm,
    qv_s_stm,
    qc_s_stm,
    q_im_stm,
    q_re_stm,
    qsizeout_s_stm,
    time_out_s_stm,
    eAxC_out_s_stm,
    meatadata_sym_out_s_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
