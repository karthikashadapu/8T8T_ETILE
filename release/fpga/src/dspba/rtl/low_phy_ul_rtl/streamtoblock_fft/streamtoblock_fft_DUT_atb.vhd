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

-- VHDL created from streamtoblock_fft_DUT
-- VHDL created on Thu Jun 12 21:29:54 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity streamtoblock_fft_DUT_atb is
end;

architecture normal of streamtoblock_fft_DUT_atb is

component streamtoblock_fft_DUT is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(13 downto 0);  -- ufix14
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        rx_vin_s : in std_logic_vector(0 downto 0);  -- ufix1
        rx_chin_s : in std_logic_vector(7 downto 0);  -- ufix8
        rx_din_im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        rx_din_re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        fft_in_s : in std_logic_vector(3 downto 0);  -- ufix4
        cp_in_s : in std_logic_vector(15 downto 0);  -- ufix16
        nprb_s : in std_logic_vector(15 downto 0);  -- ufix16
        hcs_bypass_s : in std_logic_vector(0 downto 0);  -- ufix1
        fft_gain_s : in std_logic_vector(15 downto 0);  -- ufix16_en14
        fft_gain_im_s : in std_logic_vector(15 downto 0);  -- ufix16_en14
        fft_shift_s : in std_logic_vector(3 downto 0);  -- ufix4
        time_ref_in_s : in std_logic_vector(63 downto 0);  -- ufix64
        DC_SC_EN_s : in std_logic_vector(0 downto 0);  -- ufix1
        CP_EN_s : in std_logic_vector(0 downto 0);  -- ufix1
        ripple_comp_en_s : in std_logic_vector(0 downto 0);  -- ufix1
        rc_bw_sel_s : in std_logic_vector(0 downto 0);  -- ufix1
        sym_metadata_in_s : in std_logic_vector(63 downto 0);  -- ufix64
        sym_metadata_in_valid_s : in std_logic_vector(0 downto 0);  -- ufix1
        rx_valid_s : out std_logic_vector(0 downto 0);  -- ufix1
        rx_chout_s : out std_logic_vector(7 downto 0);  -- ufix8
        rx_dout_im : out std_logic_vector(15 downto 0);  -- sfix16_en11
        rx_dout_re : out std_logic_vector(15 downto 0);  -- sfix16_en11
        rx_time_out_s : out std_logic_vector(63 downto 0);  -- ufix64
        fft_vout_s : out std_logic_vector(0 downto 0);  -- ufix1
        fft_chout_s : out std_logic_vector(7 downto 0);  -- ufix8
        fft_dout_im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        fft_dout_re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        nsc_out_s : out std_logic_vector(15 downto 0);  -- ufix16
        size_out_s : out std_logic_vector(3 downto 0);  -- ufix4
        td_time_out_s : out std_logic_vector(63 downto 0);  -- ufix64
        fd_data_v_s : out std_logic_vector(0 downto 0);  -- ufix1
        fd_data_c_s : out std_logic_vector(7 downto 0);  -- ufix8
        fd_data_q_im : out std_logic_vector(15 downto 0);  -- sfix16_en12
        fd_data_q_re : out std_logic_vector(15 downto 0);  -- sfix16_en12
        eAxCout_s : out std_logic_vector(1 downto 0);  -- ufix2
        symmetadataout_s : out std_logic_vector(63 downto 0);  -- ufix64
        eop_eAxC_s : out std_logic_vector(0 downto 0);  -- ufix1
        eop_sym_s : out std_logic_vector(0 downto 0);  -- ufix1
        sop_eAxC_s : out std_logic_vector(0 downto 0);  -- ufix1
        sop_sym_s : out std_logic_vector(0 downto 0);  -- ufix1
        version_out1_s : out std_logic_vector(31 downto 0);  -- ufix32
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component streamtoblock_fft_DUT_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        rx_vin_s_stm : out std_logic_vector(0 downto 0);
        rx_chin_s_stm : out std_logic_vector(7 downto 0);
        rx_din_im_stm : out std_logic_vector(15 downto 0);
        rx_din_re_stm : out std_logic_vector(15 downto 0);
        fft_in_s_stm : out std_logic_vector(3 downto 0);
        cp_in_s_stm : out std_logic_vector(15 downto 0);
        nprb_s_stm : out std_logic_vector(15 downto 0);
        hcs_bypass_s_stm : out std_logic_vector(0 downto 0);
        fft_gain_s_stm : out std_logic_vector(15 downto 0);
        fft_gain_im_s_stm : out std_logic_vector(15 downto 0);
        fft_shift_s_stm : out std_logic_vector(3 downto 0);
        time_ref_in_s_stm : out std_logic_vector(63 downto 0);
        DC_SC_EN_s_stm : out std_logic_vector(0 downto 0);
        CP_EN_s_stm : out std_logic_vector(0 downto 0);
        ripple_comp_en_s_stm : out std_logic_vector(0 downto 0);
        rc_bw_sel_s_stm : out std_logic_vector(0 downto 0);
        sym_metadata_in_s_stm : out std_logic_vector(63 downto 0);
        sym_metadata_in_valid_s_stm : out std_logic_vector(0 downto 0);
        rx_valid_s_stm : out std_logic_vector(0 downto 0);
        rx_chout_s_stm : out std_logic_vector(7 downto 0);
        rx_dout_im_stm : out std_logic_vector(15 downto 0);
        rx_dout_re_stm : out std_logic_vector(15 downto 0);
        rx_time_out_s_stm : out std_logic_vector(63 downto 0);
        fft_vout_s_stm : out std_logic_vector(0 downto 0);
        fft_chout_s_stm : out std_logic_vector(7 downto 0);
        fft_dout_im_stm : out std_logic_vector(15 downto 0);
        fft_dout_re_stm : out std_logic_vector(15 downto 0);
        nsc_out_s_stm : out std_logic_vector(15 downto 0);
        size_out_s_stm : out std_logic_vector(3 downto 0);
        td_time_out_s_stm : out std_logic_vector(63 downto 0);
        fd_data_v_s_stm : out std_logic_vector(0 downto 0);
        fd_data_c_s_stm : out std_logic_vector(7 downto 0);
        fd_data_q_im_stm : out std_logic_vector(15 downto 0);
        fd_data_q_re_stm : out std_logic_vector(15 downto 0);
        eAxCout_s_stm : out std_logic_vector(1 downto 0);
        symmetadataout_s_stm : out std_logic_vector(63 downto 0);
        eop_eAxC_s_stm : out std_logic_vector(0 downto 0);
        eop_sym_s_stm : out std_logic_vector(0 downto 0);
        sop_eAxC_s_stm : out std_logic_vector(0 downto 0);
        sop_sym_s_stm : out std_logic_vector(0 downto 0);
        version_out1_s_stm : out std_logic_vector(31 downto 0);
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
signal rx_vin_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal rx_chin_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal rx_din_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal rx_din_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal fft_in_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal cp_in_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal nprb_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal hcs_bypass_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal fft_gain_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal fft_gain_im_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal fft_shift_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal time_ref_in_s_stm : STD_LOGIC_VECTOR (63 downto 0);
signal DC_SC_EN_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal CP_EN_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal ripple_comp_en_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal rc_bw_sel_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal sym_metadata_in_s_stm : STD_LOGIC_VECTOR (63 downto 0);
signal sym_metadata_in_valid_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal rx_valid_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal rx_chout_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal rx_dout_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal rx_dout_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal rx_time_out_s_stm : STD_LOGIC_VECTOR (63 downto 0);
signal fft_vout_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal fft_chout_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal fft_dout_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal fft_dout_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal nsc_out_s_stm : STD_LOGIC_VECTOR (15 downto 0);
signal size_out_s_stm : STD_LOGIC_VECTOR (3 downto 0);
signal td_time_out_s_stm : STD_LOGIC_VECTOR (63 downto 0);
signal fd_data_v_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal fd_data_c_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal fd_data_q_im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal fd_data_q_re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal eAxCout_s_stm : STD_LOGIC_VECTOR (1 downto 0);
signal symmetadataout_s_stm : STD_LOGIC_VECTOR (63 downto 0);
signal eop_eAxC_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal eop_sym_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal sop_eAxC_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal sop_sym_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal version_out1_s_stm : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal rx_vin_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal rx_chin_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal rx_din_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal rx_din_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal fft_in_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal cp_in_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal nprb_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal hcs_bypass_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal fft_gain_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal fft_gain_im_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal fft_shift_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal time_ref_in_s_dut : STD_LOGIC_VECTOR (63 downto 0);
signal DC_SC_EN_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal CP_EN_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal ripple_comp_en_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal rc_bw_sel_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal sym_metadata_in_s_dut : STD_LOGIC_VECTOR (63 downto 0);
signal sym_metadata_in_valid_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal rx_valid_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal rx_chout_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal rx_dout_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal rx_dout_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal rx_time_out_s_dut : STD_LOGIC_VECTOR (63 downto 0);
signal fft_vout_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal fft_chout_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal fft_dout_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal fft_dout_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal nsc_out_s_dut : STD_LOGIC_VECTOR (15 downto 0);
signal size_out_s_dut : STD_LOGIC_VECTOR (3 downto 0);
signal td_time_out_s_dut : STD_LOGIC_VECTOR (63 downto 0);
signal fd_data_v_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal fd_data_c_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal fd_data_q_im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal fd_data_q_re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal eAxCout_s_dut : STD_LOGIC_VECTOR (1 downto 0);
signal symmetadataout_s_dut : STD_LOGIC_VECTOR (63 downto 0);
signal eop_eAxC_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal eop_sym_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal sop_eAxC_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal sop_sym_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal version_out1_s_dut : STD_LOGIC_VECTOR (31 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
checkbusOut : process (bus_clk, bus_areset)
variable mismatch_busOut_readdatavalid : BOOLEAN := FALSE;
variable mismatch_busOut_readdata : BOOLEAN := FALSE;
variable mismatch_busOut_waitrequest : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((bus_areset = '1')) THEN
        -- do nothing during reset
    ELSIF (bus_clk'EVENT AND bus_clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_busOut_readdatavalid := FALSE;
        mismatch_busOut_readdata := FALSE;
        mismatch_busOut_waitrequest := FALSE;
        IF ( (busOut_readdatavalid_dut /= busOut_readdatavalid_stm)) THEN
            mismatch_busOut_readdatavalid := TRUE;
            report "mismatch in busOut_readdatavalid signal" severity Warning;
        END IF;
        IF ((busOut_readdatavalid_dut = "1")) THEN
            IF ( (busOut_readdata_dut /= busOut_readdata_stm)) THEN
                mismatch_busOut_readdata := TRUE;
                report "mismatch in busOut_readdata signal" severity Warning;
            END IF;
            IF ( (busOut_waitrequest_dut /= busOut_waitrequest_stm)) THEN
                mismatch_busOut_waitrequest := TRUE;
                report "mismatch in busOut_waitrequest signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_busOut_readdatavalid = TRUE or mismatch_busOut_readdata = TRUE or mismatch_busOut_waitrequest = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Warning;
        END IF;
    END IF;
END PROCESS;


-- General Purpose data in real output
checkrx_vin_s : process (clk, areset, rx_vin_s_dut, rx_vin_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkrx_chin_s : process (clk, areset, rx_chin_s_dut, rx_chin_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkrx_din_im : process (clk, areset, rx_din_im_dut, rx_din_im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkrx_din_re : process (clk, areset, rx_din_re_dut, rx_din_re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkfft_in_s : process (clk, areset, fft_in_s_dut, fft_in_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkcp_in_s : process (clk, areset, cp_in_s_dut, cp_in_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checknprb_s : process (clk, areset, nprb_s_dut, nprb_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkhcs_bypass_s : process (clk, areset, hcs_bypass_s_dut, hcs_bypass_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkfft_gain_s : process (clk, areset, fft_gain_s_dut, fft_gain_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkfft_gain_im_s : process (clk, areset, fft_gain_im_s_dut, fft_gain_im_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkfft_shift_s : process (clk, areset, fft_shift_s_dut, fft_shift_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checktime_ref_in_s : process (clk, areset, time_ref_in_s_dut, time_ref_in_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkDC_SC_EN_s : process (clk, areset, DC_SC_EN_s_dut, DC_SC_EN_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkCP_EN_s : process (clk, areset, CP_EN_s_dut, CP_EN_s_stm)
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
checksym_metadata_in_s : process (clk, areset, sym_metadata_in_s_dut, sym_metadata_in_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checksym_metadata_in_valid_s : process (clk, areset, sym_metadata_in_valid_s_dut, sym_metadata_in_valid_s_stm)
begin
END PROCESS;


-- General Purpose data out check
checkrx_valid_s : process (clk, areset)
variable mismatch_rx_valid_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_rx_valid_s := FALSE;
        IF ( (rx_valid_s_dut /= rx_valid_s_stm)) THEN
            mismatch_rx_valid_s := TRUE;
            report "Mismatch on device output pin rx_valid_s" severity Warning;
        END IF;
        IF (mismatch_rx_valid_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkrx_chout_s : process (clk, areset)
variable mismatch_rx_chout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_rx_chout_s := FALSE;
        IF ( (rx_chout_s_dut /= rx_chout_s_stm) and rx_valid_s_dut = "1") THEN
            mismatch_rx_chout_s := TRUE;
            report "Mismatch on device output pin rx_chout_s" severity Warning;
        END IF;
        IF (mismatch_rx_chout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkrx_dout_im : process (clk, areset)
variable mismatch_rx_dout_im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_rx_dout_im := FALSE;
        IF ( (rx_dout_im_dut /= rx_dout_im_stm) and rx_valid_s_dut = "1") THEN
            mismatch_rx_dout_im := TRUE;
            report "Mismatch on device output pin rx_dout_im" severity Warning;
        END IF;
        IF (mismatch_rx_dout_im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkrx_dout_re : process (clk, areset)
variable mismatch_rx_dout_re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_rx_dout_re := FALSE;
        IF ( (rx_dout_re_dut /= rx_dout_re_stm) and rx_valid_s_dut = "1") THEN
            mismatch_rx_dout_re := TRUE;
            report "Mismatch on device output pin rx_dout_re" severity Warning;
        END IF;
        IF (mismatch_rx_dout_re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkfft_vout_s : process (clk, areset)
variable mismatch_fft_vout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_fft_vout_s := FALSE;
        IF ( (fft_vout_s_dut /= fft_vout_s_stm)) THEN
            mismatch_fft_vout_s := TRUE;
            report "Mismatch on device output pin fft_vout_s" severity Warning;
        END IF;
        IF (mismatch_fft_vout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkfft_chout_s : process (clk, areset)
variable mismatch_fft_chout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_fft_chout_s := FALSE;
        IF ( (fft_chout_s_dut /= fft_chout_s_stm) and fft_vout_s_dut = "1") THEN
            mismatch_fft_chout_s := TRUE;
            report "Mismatch on device output pin fft_chout_s" severity Warning;
        END IF;
        IF (mismatch_fft_chout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkfft_dout_im : process (clk, areset)
variable mismatch_fft_dout_im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_fft_dout_im := FALSE;
        IF ( (fft_dout_im_dut /= fft_dout_im_stm) and fft_vout_s_dut = "1") THEN
            mismatch_fft_dout_im := TRUE;
            report "Mismatch on device output pin fft_dout_im" severity Warning;
        END IF;
        IF (mismatch_fft_dout_im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkfft_dout_re : process (clk, areset)
variable mismatch_fft_dout_re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_fft_dout_re := FALSE;
        IF ( (fft_dout_re_dut /= fft_dout_re_stm) and fft_vout_s_dut = "1") THEN
            mismatch_fft_dout_re := TRUE;
            report "Mismatch on device output pin fft_dout_re" severity Warning;
        END IF;
        IF (mismatch_fft_dout_re = TRUE) THEN
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
        IF ( (nsc_out_s_dut /= nsc_out_s_stm) and fft_vout_s_dut = "1") THEN
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
checksize_out_s : process (clk, areset)
variable mismatch_size_out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_size_out_s := FALSE;
        IF ( (size_out_s_dut /= size_out_s_stm) and fft_vout_s_dut = "1") THEN
            mismatch_size_out_s := TRUE;
            report "Mismatch on device output pin size_out_s" severity Warning;
        END IF;
        IF (mismatch_size_out_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checktd_time_out_s : process (clk, areset)
variable mismatch_td_time_out_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_td_time_out_s := FALSE;
        IF ( (td_time_out_s_dut /= td_time_out_s_stm) and fft_vout_s_dut = "1") THEN
            mismatch_td_time_out_s := TRUE;
            report "Mismatch on device output pin td_time_out_s" severity Warning;
        END IF;
        IF (mismatch_td_time_out_s = TRUE) THEN
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
checkeAxCout_s : process (clk, areset)
variable mismatch_eAxCout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_eAxCout_s := FALSE;
        IF ( (eAxCout_s_dut /= eAxCout_s_stm) and rx_valid_s_dut = "1") THEN
            mismatch_eAxCout_s := TRUE;
            report "Mismatch on device output pin eAxCout_s" severity Warning;
        END IF;
        IF (mismatch_eAxCout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkeop_eAxC_s : process (clk, areset)
variable mismatch_eop_eAxC_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_eop_eAxC_s := FALSE;
        IF ( (eop_eAxC_s_dut /= eop_eAxC_s_stm) and rx_valid_s_dut = "1") THEN
            mismatch_eop_eAxC_s := TRUE;
            report "Mismatch on device output pin eop_eAxC_s" severity Warning;
        END IF;
        IF (mismatch_eop_eAxC_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkeop_sym_s : process (clk, areset)
variable mismatch_eop_sym_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_eop_sym_s := FALSE;
        IF ( (eop_sym_s_dut /= eop_sym_s_stm) and rx_valid_s_dut = "1") THEN
            mismatch_eop_sym_s := TRUE;
            report "Mismatch on device output pin eop_sym_s" severity Warning;
        END IF;
        IF (mismatch_eop_sym_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksop_eAxC_s : process (clk, areset)
variable mismatch_sop_eAxC_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_sop_eAxC_s := FALSE;
        IF ( (sop_eAxC_s_dut /= sop_eAxC_s_stm) and rx_valid_s_dut = "1") THEN
            mismatch_sop_eAxC_s := TRUE;
            report "Mismatch on device output pin sop_eAxC_s" severity Warning;
        END IF;
        IF (mismatch_sop_eAxC_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksop_sym_s : process (clk, areset)
variable mismatch_sop_sym_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_sop_sym_s := FALSE;
        IF ( (sop_sym_s_dut /= sop_sym_s_stm) and rx_valid_s_dut = "1") THEN
            mismatch_sop_sym_s := TRUE;
            report "Mismatch on device output pin sop_sym_s" severity Warning;
        END IF;
        IF (mismatch_sop_sym_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : streamtoblock_fft_DUT port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    rx_vin_s_stm,
    rx_chin_s_stm,
    rx_din_im_stm,
    rx_din_re_stm,
    fft_in_s_stm,
    cp_in_s_stm,
    nprb_s_stm,
    hcs_bypass_s_stm,
    fft_gain_s_stm,
    fft_gain_im_s_stm,
    fft_shift_s_stm,
    time_ref_in_s_stm,
    DC_SC_EN_s_stm,
    CP_EN_s_stm,
    ripple_comp_en_s_stm,
    rc_bw_sel_s_stm,
    sym_metadata_in_s_stm,
    sym_metadata_in_valid_s_stm,
    rx_valid_s_dut,
    rx_chout_s_dut,
    rx_dout_im_dut,
    rx_dout_re_dut,
    rx_time_out_s_dut,
    fft_vout_s_dut,
    fft_chout_s_dut,
    fft_dout_im_dut,
    fft_dout_re_dut,
    nsc_out_s_dut,
    size_out_s_dut,
    td_time_out_s_dut,
    fd_data_v_s_dut,
    fd_data_c_s_dut,
    fd_data_q_im_dut,
    fd_data_q_re_dut,
    eAxCout_s_dut,
    symmetadataout_s_dut,
    eop_eAxC_s_dut,
    eop_sym_s_dut,
    sop_eAxC_s_dut,
    sop_sym_s_dut,
    version_out1_s_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : streamtoblock_fft_DUT_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    rx_vin_s_stm,
    rx_chin_s_stm,
    rx_din_im_stm,
    rx_din_re_stm,
    fft_in_s_stm,
    cp_in_s_stm,
    nprb_s_stm,
    hcs_bypass_s_stm,
    fft_gain_s_stm,
    fft_gain_im_s_stm,
    fft_shift_s_stm,
    time_ref_in_s_stm,
    DC_SC_EN_s_stm,
    CP_EN_s_stm,
    ripple_comp_en_s_stm,
    rc_bw_sel_s_stm,
    sym_metadata_in_s_stm,
    sym_metadata_in_valid_s_stm,
    rx_valid_s_stm,
    rx_chout_s_stm,
    rx_dout_im_stm,
    rx_dout_re_stm,
    rx_time_out_s_stm,
    fft_vout_s_stm,
    fft_chout_s_stm,
    fft_dout_im_stm,
    fft_dout_re_stm,
    nsc_out_s_stm,
    size_out_s_stm,
    td_time_out_s_stm,
    fd_data_v_s_stm,
    fd_data_c_s_stm,
    fd_data_q_im_stm,
    fd_data_q_re_stm,
    eAxCout_s_stm,
    symmetadataout_s_stm,
    eop_eAxC_s_stm,
    eop_sym_s_stm,
    sop_eAxC_s_stm,
    sop_sym_s_stm,
    version_out1_s_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
