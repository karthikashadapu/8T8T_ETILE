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

-- VHDL created from LongPRACH_sim_prach_wrap
-- VHDL created on Fri Dec  6 17:01:04 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity LongPRACH_sim_prach_wrap_atb is
end;

architecture normal of LongPRACH_sim_prach_wrap_atb is

component LongPRACH_sim_prach_wrap is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(1 downto 0);  -- ufix2
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        vin0_s : in std_logic_vector(0 downto 0);  -- ufix1
        chin0_s : in std_logic_vector(7 downto 0);  -- ufix8
        din0_im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din0_re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        RFN_s : in std_logic_vector(11 downto 0);  -- ufix12
        subframe_s : in std_logic_vector(7 downto 0);  -- ufix8
        prach_cfg_idx_s : in std_logic_vector(15 downto 0);  -- ufix16
        cp_len_s : in std_logic_vector(20 downto 0);  -- ufix21
        offset_s : in std_logic_vector(20 downto 0);  -- ufix21
        c_m_plane_sel_s : in std_logic_vector(0 downto 0);  -- ufix1
        prach_tech_s : in std_logic_vector(0 downto 0);  -- ufix1
        filt_flush_en_s : in std_logic_vector(0 downto 0);  -- ufix1
        start_sym_s : in std_logic_vector(3 downto 0);  -- ufix4
        SubFrame_cplane_s : in std_logic_vector(7 downto 0);  -- ufix8
        gain_re_s : in std_logic_vector(15 downto 0);  -- ufix16_en14
        gain_im_s : in std_logic_vector(15 downto 0);  -- ufix16_en14
        ch0_info_s : in std_logic_vector(15 downto 0);  -- ufix16
        ch1_info_s : in std_logic_vector(15 downto 0);  -- ufix16
        ch2_info_s : in std_logic_vector(15 downto 0);  -- ufix16
        ch3_info_s : in std_logic_vector(15 downto 0);  -- ufix16
        RFN_cplane_s : in std_logic_vector(11 downto 0);  -- ufix12
        dout_im : out std_logic_vector(15 downto 0);  -- sfix16_en8
        dout_re : out std_logic_vector(15 downto 0);  -- sfix16_en8
        vout_s : out std_logic_vector(0 downto 0);  -- ufix1
        cout_s : out std_logic_vector(7 downto 0);  -- ufix8
        TimeReference_s : out std_logic_vector(31 downto 0);  -- ufix32
        version_info_s : out std_logic_vector(31 downto 0);  -- ufix32
        ch_info_s : out std_logic_vector(15 downto 0);  -- ufix16
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component LongPRACH_sim_prach_wrap_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(1 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        vin0_s_stm : out std_logic_vector(0 downto 0);
        chin0_s_stm : out std_logic_vector(7 downto 0);
        din0_im_stm : out std_logic_vector(15 downto 0);
        din0_re_stm : out std_logic_vector(15 downto 0);
        RFN_s_stm : out std_logic_vector(11 downto 0);
        subframe_s_stm : out std_logic_vector(7 downto 0);
        prach_cfg_idx_s_stm : out std_logic_vector(15 downto 0);
        cp_len_s_stm : out std_logic_vector(20 downto 0);
        offset_s_stm : out std_logic_vector(20 downto 0);
        c_m_plane_sel_s_stm : out std_logic_vector(0 downto 0);
        prach_tech_s_stm : out std_logic_vector(0 downto 0);
        filt_flush_en_s_stm : out std_logic_vector(0 downto 0);
        start_sym_s_stm : out std_logic_vector(3 downto 0);
        SubFrame_cplane_s_stm : out std_logic_vector(7 downto 0);
        gain_re_s_stm : out std_logic_vector(15 downto 0);
        gain_im_s_stm : out std_logic_vector(15 downto 0);
        ch0_info_s_stm : out std_logic_vector(15 downto 0);
        ch1_info_s_stm : out std_logic_vector(15 downto 0);
        ch2_info_s_stm : out std_logic_vector(15 downto 0);
        ch3_info_s_stm : out std_logic_vector(15 downto 0);
        RFN_cplane_s_stm : out std_logic_vector(11 downto 0);
        dout_im_stm : out std_logic_vector(15 downto 0);
        dout_re_stm : out std_logic_vector(15 downto 0);
        vout_s_stm : out std_logic_vector(0 downto 0);
        cout_s_stm : out std_logic_vector(7 downto 0);
        TimeReference_s_stm : out std_logic_vector(31 downto 0);
        version_info_s_stm : out std_logic_vector(31 downto 0);
        ch_info_s_stm : out std_logic_vector(15 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end component;

signal busIn_writedata_stm : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_stm : STD_LOGIC_VECTOR (1 downto 0);
signal busIn_write_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_stm : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_stm : STD_LOGIC_VECTOR (0 downto 0);
signal vin0_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal chin0_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal din0_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din0_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal RFN_s_stm : STD_LOGIC_VECTOR (11 downto 0);
signal subframe_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal prach_cfg_idx_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal cp_len_s_stm : STD_LOGIC_VECTOR (20 downto 0);
signal offset_s_stm : STD_LOGIC_VECTOR (20 downto 0);
signal c_m_plane_sel_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal prach_tech_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal filt_flush_en_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal start_sym_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal SubFrame_cplane_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal gain_re_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal gain_im_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal ch0_info_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal ch1_info_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal ch2_info_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal ch3_info_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal RFN_cplane_s_stm : STD_LOGIC_VECTOR (11 downto 0);
signal dout_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal vout_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal cout_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal TimeReference_s_stm : STD_LOGIC_VECTOR (31 downto 0);
signal version_info_s_stm : STD_LOGIC_VECTOR (31 downto 0);
signal ch_info_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (1 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal vin0_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal chin0_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal din0_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din0_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal RFN_s_dut : STD_LOGIC_VECTOR (11 downto 0);
signal subframe_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal prach_cfg_idx_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal cp_len_s_dut : STD_LOGIC_VECTOR (20 downto 0);
signal offset_s_dut : STD_LOGIC_VECTOR (20 downto 0);
signal c_m_plane_sel_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal prach_tech_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal filt_flush_en_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal start_sym_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal SubFrame_cplane_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal gain_re_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal gain_im_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal ch0_info_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal ch1_info_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal ch2_info_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal ch3_info_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal RFN_cplane_s_dut : STD_LOGIC_VECTOR (11 downto 0);
signal dout_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal vout_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal cout_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal TimeReference_s_dut : STD_LOGIC_VECTOR (31 downto 0);
signal version_info_s_dut : STD_LOGIC_VECTOR (31 downto 0);
signal ch_info_s_dut : STD_LOGIC_VECTOR (15 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkvin0_s : process (clk, areset, vin0_s_dut, vin0_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkchin0_s : process (clk, areset, chin0_s_dut, chin0_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin0_im : process (clk, areset, din0_im_dut, din0_im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin0_re : process (clk, areset, din0_re_dut, din0_re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkRFN_s : process (clk, areset, RFN_s_dut, RFN_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checksubframe_s : process (clk, areset, subframe_s_dut, subframe_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkprach_cfg_idx_s : process (clk, areset, prach_cfg_idx_s_dut, prach_cfg_idx_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkcp_len_s : process (clk, areset, cp_len_s_dut, cp_len_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkoffset_s : process (clk, areset, offset_s_dut, offset_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkc_m_plane_sel_s : process (clk, areset, c_m_plane_sel_s_dut, c_m_plane_sel_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkprach_tech_s : process (clk, areset, prach_tech_s_dut, prach_tech_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkfilt_flush_en_s : process (clk, areset, filt_flush_en_s_dut, filt_flush_en_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkstart_sym_s : process (clk, areset, start_sym_s_dut, start_sym_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkSubFrame_cplane_s : process (clk, areset, SubFrame_cplane_s_dut, SubFrame_cplane_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkgain_re_s : process (clk, areset, gain_re_s_dut, gain_re_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkgain_im_s : process (clk, areset, gain_im_s_dut, gain_im_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkch0_info_s : process (clk, areset, ch0_info_s_dut, ch0_info_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkch1_info_s : process (clk, areset, ch1_info_s_dut, ch1_info_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkch2_info_s : process (clk, areset, ch2_info_s_dut, ch2_info_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkch3_info_s : process (clk, areset, ch3_info_s_dut, ch3_info_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkRFN_cplane_s : process (clk, areset, RFN_cplane_s_dut, RFN_cplane_s_stm)
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
checkTimeReference_s : process (clk, areset)
variable mismatch_TimeReference_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_TimeReference_s := FALSE;
        IF ( (TimeReference_s_dut /= TimeReference_s_stm)) THEN
            mismatch_TimeReference_s := TRUE;
            report "Mismatch on device output pin TimeReference_s" severity Warning;
        END IF;
        IF (mismatch_TimeReference_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkch_info_s : process (clk, areset)
variable mismatch_ch_info_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_ch_info_s := FALSE;
        IF ( (ch_info_s_dut /= ch_info_s_stm) and vout_s_dut = "1") THEN
            mismatch_ch_info_s := TRUE;
            report "Mismatch on device output pin ch_info_s" severity Warning;
        END IF;
        IF (mismatch_ch_info_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : LongPRACH_sim_prach_wrap port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    vin0_s_stm,
    chin0_s_stm,
    din0_im_stm,
    din0_re_stm,
    RFN_s_stm,
    subframe_s_stm,
    prach_cfg_idx_s_stm,
    cp_len_s_stm,
    offset_s_stm,
    c_m_plane_sel_s_stm,
    prach_tech_s_stm,
    filt_flush_en_s_stm,
    start_sym_s_stm,
    SubFrame_cplane_s_stm,
    gain_re_s_stm,
    gain_im_s_stm,
    ch0_info_s_stm,
    ch1_info_s_stm,
    ch2_info_s_stm,
    ch3_info_s_stm,
    RFN_cplane_s_stm,
    dout_im_dut,
    dout_re_dut,
    vout_s_dut,
    cout_s_dut,
    TimeReference_s_dut,
    version_info_s_dut,
    ch_info_s_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : LongPRACH_sim_prach_wrap_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    vin0_s_stm,
    chin0_s_stm,
    din0_im_stm,
    din0_re_stm,
    RFN_s_stm,
    subframe_s_stm,
    prach_cfg_idx_s_stm,
    cp_len_s_stm,
    offset_s_stm,
    c_m_plane_sel_s_stm,
    prach_tech_s_stm,
    filt_flush_en_s_stm,
    start_sym_s_stm,
    SubFrame_cplane_s_stm,
    gain_re_s_stm,
    gain_im_s_stm,
    ch0_info_s_stm,
    ch1_info_s_stm,
    ch2_info_s_stm,
    ch3_info_s_stm,
    RFN_cplane_s_stm,
    dout_im_stm,
    dout_re_stm,
    vout_s_stm,
    cout_s_stm,
    TimeReference_s_stm,
    version_info_s_stm,
    ch_info_s_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
