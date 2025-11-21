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

-- VHDL created from prach_shortFormat_fftShift_prach
-- VHDL created on Wed Nov  6 19:28:33 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity prach_shortFormat_fftShift_prach_atb is
end;

architecture normal of prach_shortFormat_fftShift_prach_atb is

component prach_shortFormat_fftShift_prach is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(9 downto 0);  -- ufix10
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        vin1_s : in std_logic_vector(0 downto 0);  -- ufix1
        chin1_s : in std_logic_vector(7 downto 0);  -- ufix8
        din1_im : in std_logic_vector(15 downto 0);  -- sfix16_en15
        din1_re : in std_logic_vector(15 downto 0);  -- sfix16_en15
        SFN_s : in std_logic_vector(11 downto 0);  -- ufix12
        SubFN_s : in std_logic_vector(7 downto 0);  -- ufix8
        SCSby15_s : in std_logic_vector(1 downto 0);  -- ufix2
        BWby10_s : in std_logic_vector(7 downto 0);  -- ufix8
        CPLen_cplane_s : in std_logic_vector(22 downto 0);  -- ufix23
        timeoffset_cplane_s : in std_logic_vector(22 downto 0);  -- ufix23
        numsym_cplane_s : in std_logic_vector(3 downto 0);  -- ufix4
        slotID_cplane_s : in std_logic_vector(1 downto 0);  -- ufix2
        startsym_cplane_s : in std_logic_vector(3 downto 0);  -- ufix4
        timerefin_cplane_s : in std_logic_vector(28 downto 0);  -- ufix29
        cur_slot_s : in std_logic_vector(1 downto 0);  -- ufix2
        SubFN_cplane_s : in std_logic_vector(7 downto 0);  -- ufix8
        cbar_mplane_s : in std_logic_vector(0 downto 0);  -- ufix1
        timeoffset_bias_cplane_s : in std_logic_vector(22 downto 0);  -- ufix23
        startsym_bias_cplane_s : in std_logic_vector(22 downto 0);  -- ufix23
        gain_in_re_s : in std_logic_vector(15 downto 0);  -- ufix16_en14
        gain_in_imag_s : in std_logic_vector(15 downto 0);  -- ufix16_en14
        fftShift_v_s : out std_logic_vector(0 downto 0);  -- ufix1
        fftShift_c_s : out std_logic_vector(7 downto 0);  -- ufix8
        fftShift_d_im : out std_logic_vector(15 downto 0);  -- sfix16_en15
        fftShift_d_re : out std_logic_vector(15 downto 0);  -- sfix16_en15
        TimeReference_s : out std_logic_vector(28 downto 0);  -- ufix29
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component prach_shortFormat_fftShift_prach_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(9 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        vin1_s_stm : out std_logic_vector(0 downto 0);
        chin1_s_stm : out std_logic_vector(7 downto 0);
        din1_im_stm : out std_logic_vector(15 downto 0);
        din1_re_stm : out std_logic_vector(15 downto 0);
        SFN_s_stm : out std_logic_vector(11 downto 0);
        SubFN_s_stm : out std_logic_vector(7 downto 0);
        SCSby15_s_stm : out std_logic_vector(1 downto 0);
        BWby10_s_stm : out std_logic_vector(7 downto 0);
        CPLen_cplane_s_stm : out std_logic_vector(22 downto 0);
        timeoffset_cplane_s_stm : out std_logic_vector(22 downto 0);
        numsym_cplane_s_stm : out std_logic_vector(3 downto 0);
        slotID_cplane_s_stm : out std_logic_vector(1 downto 0);
        startsym_cplane_s_stm : out std_logic_vector(3 downto 0);
        timerefin_cplane_s_stm : out std_logic_vector(28 downto 0);
        cur_slot_s_stm : out std_logic_vector(1 downto 0);
        SubFN_cplane_s_stm : out std_logic_vector(7 downto 0);
        cbar_mplane_s_stm : out std_logic_vector(0 downto 0);
        timeoffset_bias_cplane_s_stm : out std_logic_vector(22 downto 0);
        startsym_bias_cplane_s_stm : out std_logic_vector(22 downto 0);
        gain_in_re_s_stm : out std_logic_vector(15 downto 0);
        gain_in_imag_s_stm : out std_logic_vector(15 downto 0);
        fftShift_v_s_stm : out std_logic_vector(0 downto 0);
        fftShift_c_s_stm : out std_logic_vector(7 downto 0);
        fftShift_d_im_stm : out std_logic_vector(15 downto 0);
        fftShift_d_re_stm : out std_logic_vector(15 downto 0);
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
signal vin1_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal chin1_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal din1_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din1_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal SFN_s_stm : STD_LOGIC_VECTOR (11 downto 0);
signal SubFN_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal SCSby15_s_stm : STD_LOGIC_VECTOR (1 downto 0);
signal BWby10_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal CPLen_cplane_s_stm : STD_LOGIC_VECTOR (22 downto 0);
signal timeoffset_cplane_s_stm : STD_LOGIC_VECTOR (22 downto 0);
signal numsym_cplane_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal slotID_cplane_s_stm : STD_LOGIC_VECTOR (1 downto 0);
signal startsym_cplane_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal timerefin_cplane_s_stm : STD_LOGIC_VECTOR (28 downto 0);
signal cur_slot_s_stm : STD_LOGIC_VECTOR (1 downto 0);
signal SubFN_cplane_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal cbar_mplane_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal timeoffset_bias_cplane_s_stm : STD_LOGIC_VECTOR (22 downto 0);
signal startsym_bias_cplane_s_stm : STD_LOGIC_VECTOR (22 downto 0);
signal gain_in_re_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal gain_in_imag_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal fftShift_v_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal fftShift_c_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal fftShift_d_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal fftShift_d_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal TimeReference_s_stm : STD_LOGIC_VECTOR (28 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (9 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal vin1_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal chin1_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal din1_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din1_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal SFN_s_dut : STD_LOGIC_VECTOR (11 downto 0);
signal SubFN_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal SCSby15_s_dut : STD_LOGIC_VECTOR (1 downto 0);
signal BWby10_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal CPLen_cplane_s_dut : STD_LOGIC_VECTOR (22 downto 0);
signal timeoffset_cplane_s_dut : STD_LOGIC_VECTOR (22 downto 0);
signal numsym_cplane_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal slotID_cplane_s_dut : STD_LOGIC_VECTOR (1 downto 0);
signal startsym_cplane_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal timerefin_cplane_s_dut : STD_LOGIC_VECTOR (28 downto 0);
signal cur_slot_s_dut : STD_LOGIC_VECTOR (1 downto 0);
signal SubFN_cplane_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal cbar_mplane_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal timeoffset_bias_cplane_s_dut : STD_LOGIC_VECTOR (22 downto 0);
signal startsym_bias_cplane_s_dut : STD_LOGIC_VECTOR (22 downto 0);
signal gain_in_re_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal gain_in_imag_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal fftShift_v_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal fftShift_c_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal fftShift_d_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal fftShift_d_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal TimeReference_s_dut : STD_LOGIC_VECTOR (28 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkvin1_s : process (clk, areset, vin1_s_dut, vin1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkchin1_s : process (clk, areset, chin1_s_dut, chin1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin1_im : process (clk, areset, din1_im_dut, din1_im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin1_re : process (clk, areset, din1_re_dut, din1_re_stm)
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


-- General Purpose data in real output
checkCPLen_cplane_s : process (clk, areset, CPLen_cplane_s_dut, CPLen_cplane_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checktimeoffset_cplane_s : process (clk, areset, timeoffset_cplane_s_dut, timeoffset_cplane_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checknumsym_cplane_s : process (clk, areset, numsym_cplane_s_dut, numsym_cplane_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkslotID_cplane_s : process (clk, areset, slotID_cplane_s_dut, slotID_cplane_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkstartsym_cplane_s : process (clk, areset, startsym_cplane_s_dut, startsym_cplane_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checktimerefin_cplane_s : process (clk, areset, timerefin_cplane_s_dut, timerefin_cplane_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkcur_slot_s : process (clk, areset, cur_slot_s_dut, cur_slot_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkSubFN_cplane_s : process (clk, areset, SubFN_cplane_s_dut, SubFN_cplane_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkcbar_mplane_s : process (clk, areset, cbar_mplane_s_dut, cbar_mplane_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checktimeoffset_bias_cplane_s : process (clk, areset, timeoffset_bias_cplane_s_dut, timeoffset_bias_cplane_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkstartsym_bias_cplane_s : process (clk, areset, startsym_bias_cplane_s_dut, startsym_bias_cplane_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkgain_in_re_s : process (clk, areset, gain_in_re_s_dut, gain_in_re_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkgain_in_imag_s : process (clk, areset, gain_in_imag_s_dut, gain_in_imag_s_stm)
begin
END PROCESS;


-- General Purpose data out check
checkfftShift_v_s : process (clk, areset)
variable mismatch_fftShift_v_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_fftShift_v_s := FALSE;
        IF ( (fftShift_v_s_dut /= fftShift_v_s_stm)) THEN
            mismatch_fftShift_v_s := TRUE;
            report "Mismatch on device output pin fftShift_v_s" severity Warning;
        END IF;
        IF (mismatch_fftShift_v_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkfftShift_c_s : process (clk, areset)
variable mismatch_fftShift_c_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_fftShift_c_s := FALSE;
        IF ( (fftShift_c_s_dut /= fftShift_c_s_stm) and fftShift_v_s_dut = "1") THEN
            mismatch_fftShift_c_s := TRUE;
            report "Mismatch on device output pin fftShift_c_s" severity Warning;
        END IF;
        IF (mismatch_fftShift_c_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkfftShift_d_im : process (clk, areset)
variable mismatch_fftShift_d_im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_fftShift_d_im := FALSE;
        IF ( (fftShift_d_im_dut /= fftShift_d_im_stm) and fftShift_v_s_dut = "1") THEN
            mismatch_fftShift_d_im := TRUE;
            report "Mismatch on device output pin fftShift_d_im" severity Warning;
        END IF;
        IF (mismatch_fftShift_d_im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkfftShift_d_re : process (clk, areset)
variable mismatch_fftShift_d_re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_fftShift_d_re := FALSE;
        IF ( (fftShift_d_re_dut /= fftShift_d_re_stm) and fftShift_v_s_dut = "1") THEN
            mismatch_fftShift_d_re := TRUE;
            report "Mismatch on device output pin fftShift_d_re" severity Warning;
        END IF;
        IF (mismatch_fftShift_d_re = TRUE) THEN
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
        IF ( (TimeReference_s_dut /= TimeReference_s_stm) and fftShift_v_s_dut = "1") THEN
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


dut : prach_shortFormat_fftShift_prach port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    vin1_s_stm,
    chin1_s_stm,
    din1_im_stm,
    din1_re_stm,
    SFN_s_stm,
    SubFN_s_stm,
    SCSby15_s_stm,
    BWby10_s_stm,
    CPLen_cplane_s_stm,
    timeoffset_cplane_s_stm,
    numsym_cplane_s_stm,
    slotID_cplane_s_stm,
    startsym_cplane_s_stm,
    timerefin_cplane_s_stm,
    cur_slot_s_stm,
    SubFN_cplane_s_stm,
    cbar_mplane_s_stm,
    timeoffset_bias_cplane_s_stm,
    startsym_bias_cplane_s_stm,
    gain_in_re_s_stm,
    gain_in_imag_s_stm,
    fftShift_v_s_dut,
    fftShift_c_s_dut,
    fftShift_d_im_dut,
    fftShift_d_re_dut,
    TimeReference_s_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : prach_shortFormat_fftShift_prach_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    vin1_s_stm,
    chin1_s_stm,
    din1_im_stm,
    din1_re_stm,
    SFN_s_stm,
    SubFN_s_stm,
    SCSby15_s_stm,
    BWby10_s_stm,
    CPLen_cplane_s_stm,
    timeoffset_cplane_s_stm,
    numsym_cplane_s_stm,
    slotID_cplane_s_stm,
    startsym_cplane_s_stm,
    timerefin_cplane_s_stm,
    cur_slot_s_stm,
    SubFN_cplane_s_stm,
    cbar_mplane_s_stm,
    timeoffset_bias_cplane_s_stm,
    startsym_bias_cplane_s_stm,
    gain_in_re_s_stm,
    gain_in_imag_s_stm,
    fftShift_v_s_stm,
    fftShift_c_s_stm,
    fftShift_d_im_stm,
    fftShift_d_re_stm,
    TimeReference_s_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
