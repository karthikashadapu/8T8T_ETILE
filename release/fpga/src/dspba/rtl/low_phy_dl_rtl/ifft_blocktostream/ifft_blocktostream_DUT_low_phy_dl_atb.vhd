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

-- VHDL created from standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl
-- VHDL created on Thu Jun 12 21:17:48 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb is
end;

architecture normal of standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_atb is

component standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(13 downto 0);  -- ufix14
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        valid1_s : in std_logic_vector(0 downto 0);  -- ufix1
        ifft_gain_re_l1_s : in std_logic_vector(15 downto 0);  -- ufix16_en14
        ifft_gain_im_l1_s : in std_logic_vector(15 downto 0);  -- ufix16_en14
        ifft_shift_l1_s : in std_logic_vector(3 downto 0);  -- ufix4
        ifft_mux_const_l1_s : in std_logic_vector(15 downto 0);  -- sfix16_en15
        muxsel_l1_s : in std_logic_vector(0 downto 0);  -- ufix1
        DC_SC_EN_s : in std_logic_vector(0 downto 0);  -- ufix1
        data1_im : in std_logic_vector(15 downto 0);  -- sfix16_en15
        data1_re : in std_logic_vector(15 downto 0);  -- sfix16_en15
        channel1_s : in std_logic_vector(7 downto 0);  -- ufix8
        size1_s : in std_logic_vector(3 downto 0);  -- ufix4
        nsc1_s : in std_logic_vector(11 downto 0);  -- ufix12
        cplen1_s : in std_logic_vector(10 downto 0);  -- ufix11
        CP_EN1_s : in std_logic_vector(0 downto 0);  -- ufix1
        ripple_comp_en_s : in std_logic_vector(0 downto 0);  -- ufix1
        rc_bw_sel_s : in std_logic_vector(0 downto 0);  -- ufix1
        timeref_in_s : in std_logic_vector(63 downto 0);  -- ufix64
        vout2_s : out std_logic_vector(0 downto 0);  -- ufix1
        cout2_s : out std_logic_vector(1 downto 0);  -- ufix2
        dout2_im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout2_re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        td_ifft_out_d_im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        td_ifft_out_d_re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        td_ifft_out_ch_s : out std_logic_vector(7 downto 0);  -- ufix8
        td_ifft_out_v_s : out std_logic_vector(0 downto 0);  -- ufix1
        ifft_size_out_s : out std_logic_vector(3 downto 0);  -- ufix4
        ifft_nprb_out_s : out std_logic_vector(11 downto 0);  -- ufix12
        ifft_cp_out_s : out std_logic_vector(10 downto 0);  -- ufix11
        fd_data_v_s : out std_logic_vector(0 downto 0);  -- ufix1
        fd_data_c_s : out std_logic_vector(7 downto 0);  -- ufix8
        fd_data_q_im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        fd_data_q_re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        fd_timeref_out_s : out std_logic_vector(63 downto 0);  -- ufix64
        version_out_s : out std_logic_vector(31 downto 0);  -- ufix32
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        valid1_s_stm : out std_logic_vector(0 downto 0);
        ifft_gain_re_l1_s_stm : out std_logic_vector(15 downto 0);
        ifft_gain_im_l1_s_stm : out std_logic_vector(15 downto 0);
        ifft_shift_l1_s_stm : out std_logic_vector(3 downto 0);
        ifft_mux_const_l1_s_stm : out std_logic_vector(15 downto 0);
        muxsel_l1_s_stm : out std_logic_vector(0 downto 0);
        DC_SC_EN_s_stm : out std_logic_vector(0 downto 0);
        data1_im_stm : out std_logic_vector(15 downto 0);
        data1_re_stm : out std_logic_vector(15 downto 0);
        channel1_s_stm : out std_logic_vector(7 downto 0);
        size1_s_stm : out std_logic_vector(3 downto 0);
        nsc1_s_stm : out std_logic_vector(11 downto 0);
        cplen1_s_stm : out std_logic_vector(10 downto 0);
        CP_EN1_s_stm : out std_logic_vector(0 downto 0);
        ripple_comp_en_s_stm : out std_logic_vector(0 downto 0);
        rc_bw_sel_s_stm : out std_logic_vector(0 downto 0);
        timeref_in_s_stm : out std_logic_vector(63 downto 0);
        vout2_s_stm : out std_logic_vector(0 downto 0);
        cout2_s_stm : out std_logic_vector(1 downto 0);
        dout2_im_stm : out std_logic_vector(15 downto 0);
        dout2_re_stm : out std_logic_vector(15 downto 0);
        td_ifft_out_d_im_stm : out std_logic_vector(15 downto 0);
        td_ifft_out_d_re_stm : out std_logic_vector(15 downto 0);
        td_ifft_out_ch_s_stm : out std_logic_vector(7 downto 0);
        td_ifft_out_v_s_stm : out std_logic_vector(0 downto 0);
        ifft_size_out_s_stm : out std_logic_vector(3 downto 0);
        ifft_nprb_out_s_stm : out std_logic_vector(11 downto 0);
        ifft_cp_out_s_stm : out std_logic_vector(10 downto 0);
        fd_data_v_s_stm : out std_logic_vector(0 downto 0);
        fd_data_c_s_stm : out std_logic_vector(7 downto 0);
        fd_data_q_im_stm : out std_logic_vector(15 downto 0);
        fd_data_q_re_stm : out std_logic_vector(15 downto 0);
        fd_timeref_out_s_stm : out std_logic_vector(63 downto 0);
        version_out_s_stm : out std_logic_vector(31 downto 0);
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
signal valid1_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal ifft_gain_re_l1_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal ifft_gain_im_l1_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal ifft_shift_l1_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal ifft_mux_const_l1_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal muxsel_l1_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal DC_SC_EN_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal data1_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal data1_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal channel1_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal size1_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal nsc1_s_stm : STD_LOGIC_VECTOR (11 downto 0);
signal cplen1_s_stm : STD_LOGIC_VECTOR (10 downto 0);
signal CP_EN1_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal ripple_comp_en_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal rc_bw_sel_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal timeref_in_s_stm : STD_LOGIC_VECTOR (63 downto 0);
signal vout2_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal cout2_s_stm : STD_LOGIC_VECTOR (1 downto 0);
signal dout2_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout2_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal td_ifft_out_d_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal td_ifft_out_d_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal td_ifft_out_ch_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal td_ifft_out_v_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal ifft_size_out_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal ifft_nprb_out_s_stm : STD_LOGIC_VECTOR (11 downto 0);
signal ifft_cp_out_s_stm : STD_LOGIC_VECTOR (10 downto 0);
signal fd_data_v_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal fd_data_c_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal fd_data_q_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal fd_data_q_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal fd_timeref_out_s_stm : STD_LOGIC_VECTOR (63 downto 0);
signal version_out_s_stm : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal valid1_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal ifft_gain_re_l1_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal ifft_gain_im_l1_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal ifft_shift_l1_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal ifft_mux_const_l1_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal muxsel_l1_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal DC_SC_EN_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal data1_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal data1_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal channel1_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal size1_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal nsc1_s_dut : STD_LOGIC_VECTOR (11 downto 0);
signal cplen1_s_dut : STD_LOGIC_VECTOR (10 downto 0);
signal CP_EN1_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal ripple_comp_en_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal rc_bw_sel_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal timeref_in_s_dut : STD_LOGIC_VECTOR (63 downto 0);
signal vout2_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal cout2_s_dut : STD_LOGIC_VECTOR (1 downto 0);
signal dout2_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout2_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal td_ifft_out_d_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal td_ifft_out_d_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal td_ifft_out_ch_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal td_ifft_out_v_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal ifft_size_out_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal ifft_nprb_out_s_dut : STD_LOGIC_VECTOR (11 downto 0);
signal ifft_cp_out_s_dut : STD_LOGIC_VECTOR (10 downto 0);
signal fd_data_v_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal fd_data_c_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal fd_data_q_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal fd_data_q_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal fd_timeref_out_s_dut : STD_LOGIC_VECTOR (63 downto 0);
signal version_out_s_dut : STD_LOGIC_VECTOR (31 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkvalid1_s : process (clk, areset, valid1_s_dut, valid1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkifft_gain_re_l1_s : process (clk, areset, ifft_gain_re_l1_s_dut, ifft_gain_re_l1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkifft_gain_im_l1_s : process (clk, areset, ifft_gain_im_l1_s_dut, ifft_gain_im_l1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkifft_shift_l1_s : process (clk, areset, ifft_shift_l1_s_dut, ifft_shift_l1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkifft_mux_const_l1_s : process (clk, areset, ifft_mux_const_l1_s_dut, ifft_mux_const_l1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkmuxsel_l1_s : process (clk, areset, muxsel_l1_s_dut, muxsel_l1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDC_SC_EN_s : process (clk, areset, DC_SC_EN_s_dut, DC_SC_EN_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdata1_im : process (clk, areset, data1_im_dut, data1_im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdata1_re : process (clk, areset, data1_re_dut, data1_re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkchannel1_s : process (clk, areset, channel1_s_dut, channel1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checksize1_s : process (clk, areset, size1_s_dut, size1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checknsc1_s : process (clk, areset, nsc1_s_dut, nsc1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkcplen1_s : process (clk, areset, cplen1_s_dut, cplen1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkCP_EN1_s : process (clk, areset, CP_EN1_s_dut, CP_EN1_s_stm)
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
checktimeref_in_s : process (clk, areset, timeref_in_s_dut, timeref_in_s_stm)
begin
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
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
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
        IF ( (cout2_s_dut /= cout2_s_stm)) THEN
            mismatch_cout2_s := TRUE;
            report "Mismatch on device output pin cout2_s" severity Warning;
        END IF;
        IF (mismatch_cout2_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout2_im : process (clk, areset)
variable mismatch_dout2_im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout2_im := FALSE;
        IF ( (dout2_im_dut /= dout2_im_stm)) THEN
            mismatch_dout2_im := TRUE;
            report "Mismatch on device output pin dout2_im" severity Warning;
        END IF;
        IF (mismatch_dout2_im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout2_re : process (clk, areset)
variable mismatch_dout2_re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout2_re := FALSE;
        IF ( (dout2_re_dut /= dout2_re_stm)) THEN
            mismatch_dout2_re := TRUE;
            report "Mismatch on device output pin dout2_re" severity Warning;
        END IF;
        IF (mismatch_dout2_re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checktd_ifft_out_d_im : process (clk, areset)
variable mismatch_td_ifft_out_d_im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_td_ifft_out_d_im := FALSE;
        IF ( (td_ifft_out_d_im_dut /= td_ifft_out_d_im_stm) and td_ifft_out_v_s_dut = "1") THEN
            mismatch_td_ifft_out_d_im := TRUE;
            report "Mismatch on device output pin td_ifft_out_d_im" severity Warning;
        END IF;
        IF (mismatch_td_ifft_out_d_im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checktd_ifft_out_d_re : process (clk, areset)
variable mismatch_td_ifft_out_d_re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_td_ifft_out_d_re := FALSE;
        IF ( (td_ifft_out_d_re_dut /= td_ifft_out_d_re_stm) and td_ifft_out_v_s_dut = "1") THEN
            mismatch_td_ifft_out_d_re := TRUE;
            report "Mismatch on device output pin td_ifft_out_d_re" severity Warning;
        END IF;
        IF (mismatch_td_ifft_out_d_re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checktd_ifft_out_ch_s : process (clk, areset)
variable mismatch_td_ifft_out_ch_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_td_ifft_out_ch_s := FALSE;
        IF ( (td_ifft_out_ch_s_dut /= td_ifft_out_ch_s_stm) and td_ifft_out_v_s_dut = "1") THEN
            mismatch_td_ifft_out_ch_s := TRUE;
            report "Mismatch on device output pin td_ifft_out_ch_s" severity Warning;
        END IF;
        IF (mismatch_td_ifft_out_ch_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checktd_ifft_out_v_s : process (clk, areset)
variable mismatch_td_ifft_out_v_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_td_ifft_out_v_s := FALSE;
        IF ( (td_ifft_out_v_s_dut /= td_ifft_out_v_s_stm)) THEN
            mismatch_td_ifft_out_v_s := TRUE;
            report "Mismatch on device output pin td_ifft_out_v_s" severity Warning;
        END IF;
        IF (mismatch_td_ifft_out_v_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkifft_size_out_s : process (clk, areset)
variable mismatch_ifft_size_out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_ifft_size_out_s := FALSE;
        IF ( (ifft_size_out_s_dut /= ifft_size_out_s_stm) and td_ifft_out_v_s_dut = "1") THEN
            mismatch_ifft_size_out_s := TRUE;
            report "Mismatch on device output pin ifft_size_out_s" severity Warning;
        END IF;
        IF (mismatch_ifft_size_out_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkifft_nprb_out_s : process (clk, areset)
variable mismatch_ifft_nprb_out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_ifft_nprb_out_s := FALSE;
        IF ( (ifft_nprb_out_s_dut /= ifft_nprb_out_s_stm)) THEN
            mismatch_ifft_nprb_out_s := TRUE;
            report "Mismatch on device output pin ifft_nprb_out_s" severity Warning;
        END IF;
        IF (mismatch_ifft_nprb_out_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkifft_cp_out_s : process (clk, areset)
variable mismatch_ifft_cp_out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_ifft_cp_out_s := FALSE;
        IF ( (ifft_cp_out_s_dut /= ifft_cp_out_s_stm) and td_ifft_out_v_s_dut = "1") THEN
            mismatch_ifft_cp_out_s := TRUE;
            report "Mismatch on device output pin ifft_cp_out_s" severity Warning;
        END IF;
        IF (mismatch_ifft_cp_out_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkfd_data_v_s : process (clk, areset)
variable mismatch_fd_data_v_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_fd_data_v_s := FALSE;
        IF ( (fd_data_v_s_dut /= fd_data_v_s_stm)) THEN
            mismatch_fd_data_v_s := TRUE;
            report "Mismatch on device output pin fd_data_v_s" severity Warning;
        END IF;
        IF (mismatch_fd_data_v_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkfd_data_c_s : process (clk, areset)
variable mismatch_fd_data_c_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_fd_data_c_s := FALSE;
        IF ( (fd_data_c_s_dut /= fd_data_c_s_stm) and fd_data_v_s_dut = "1") THEN
            mismatch_fd_data_c_s := TRUE;
            report "Mismatch on device output pin fd_data_c_s" severity Warning;
        END IF;
        IF (mismatch_fd_data_c_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkfd_data_q_im : process (clk, areset)
variable mismatch_fd_data_q_im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_fd_data_q_im := FALSE;
        IF ( (fd_data_q_im_dut /= fd_data_q_im_stm) and fd_data_v_s_dut = "1") THEN
            mismatch_fd_data_q_im := TRUE;
            report "Mismatch on device output pin fd_data_q_im" severity Warning;
        END IF;
        IF (mismatch_fd_data_q_im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkfd_data_q_re : process (clk, areset)
variable mismatch_fd_data_q_re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_fd_data_q_re := FALSE;
        IF ( (fd_data_q_re_dut /= fd_data_q_re_stm) and fd_data_v_s_dut = "1") THEN
            mismatch_fd_data_q_re := TRUE;
            report "Mismatch on device output pin fd_data_q_re" severity Warning;
        END IF;
        IF (mismatch_fd_data_q_re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkfd_timeref_out_s : process (clk, areset)
variable mismatch_fd_timeref_out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_fd_timeref_out_s := FALSE;
        IF ( (fd_timeref_out_s_dut /= fd_timeref_out_s_stm) and fd_data_v_s_dut = "1") THEN
            mismatch_fd_timeref_out_s := TRUE;
            report "Mismatch on device output pin fd_timeref_out_s" severity Warning;
        END IF;
        IF (mismatch_fd_timeref_out_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    valid1_s_stm,
    ifft_gain_re_l1_s_stm,
    ifft_gain_im_l1_s_stm,
    ifft_shift_l1_s_stm,
    ifft_mux_const_l1_s_stm,
    muxsel_l1_s_stm,
    DC_SC_EN_s_stm,
    data1_im_stm,
    data1_re_stm,
    channel1_s_stm,
    size1_s_stm,
    nsc1_s_stm,
    cplen1_s_stm,
    CP_EN1_s_stm,
    ripple_comp_en_s_stm,
    rc_bw_sel_s_stm,
    timeref_in_s_stm,
    vout2_s_dut,
    cout2_s_dut,
    dout2_im_dut,
    dout2_re_dut,
    td_ifft_out_d_im_dut,
    td_ifft_out_d_re_dut,
    td_ifft_out_ch_s_dut,
    td_ifft_out_v_s_dut,
    ifft_size_out_s_dut,
    ifft_nprb_out_s_dut,
    ifft_cp_out_s_dut,
    fd_data_v_s_dut,
    fd_data_c_s_dut,
    fd_data_q_im_dut,
    fd_data_q_re_dut,
    fd_timeref_out_s_dut,
    version_out_s_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    valid1_s_stm,
    ifft_gain_re_l1_s_stm,
    ifft_gain_im_l1_s_stm,
    ifft_shift_l1_s_stm,
    ifft_mux_const_l1_s_stm,
    muxsel_l1_s_stm,
    DC_SC_EN_s_stm,
    data1_im_stm,
    data1_re_stm,
    channel1_s_stm,
    size1_s_stm,
    nsc1_s_stm,
    cplen1_s_stm,
    CP_EN1_s_stm,
    ripple_comp_en_s_stm,
    rc_bw_sel_s_stm,
    timeref_in_s_stm,
    vout2_s_stm,
    cout2_s_stm,
    dout2_im_stm,
    dout2_re_stm,
    td_ifft_out_d_im_stm,
    td_ifft_out_d_re_stm,
    td_ifft_out_ch_s_stm,
    td_ifft_out_v_s_stm,
    ifft_size_out_s_stm,
    ifft_nprb_out_s_stm,
    ifft_cp_out_s_stm,
    fd_data_v_s_stm,
    fd_data_c_s_stm,
    fd_data_q_im_stm,
    fd_data_q_re_stm,
    fd_timeref_out_s_stm,
    version_out_s_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
