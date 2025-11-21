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

-- VHDL created from ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch
-- VHDL created on Thu Jun 12 21:17:48 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.ifft_blocktostream_DUT_safe_path.all;

entity ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_stm is
    port (
        in_1_valid_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_ch_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_real_data_tpl_stm : out std_logic_vector(15 downto 0);
        in_3_imag_data_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_FFTSize_tpl_stm : out std_logic_vector(3 downto 0);
        in_5_NSubCarr_tpl_stm : out std_logic_vector(11 downto 0);
        in_6_cplen_tpl_stm : out std_logic_vector(10 downto 0);
        in_7_DC_SC_EN1_tpl_stm : out std_logic_vector(0 downto 0);
        in_8_iftgain_real_tpl_stm : out std_logic_vector(15 downto 0);
        in_9_ifftgain_imag_tpl_stm : out std_logic_vector(15 downto 0);
        in_10_ifftshift_tpl_stm : out std_logic_vector(3 downto 0);
        in_11_ifft_mux_const_data_tpl_stm : out std_logic_vector(15 downto 0);
        in_12_muxsel_tpl_stm : out std_logic_vector(0 downto 0);
        in_13_time_in_tpl_stm : out std_logic_vector(63 downto 0);
        out_1_qvalid_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_qchannel_tpl_stm : out std_logic_vector(7 downto 0);
        out_3_real_qdata_tpl_stm : out std_logic_vector(15 downto 0);
        out_3_imag_qdata_tpl_stm : out std_logic_vector(15 downto 0);
        out_4_qfftsize_tpl_stm : out std_logic_vector(3 downto 0);
        out_5_q_nprb_tpl_stm : out std_logic_vector(11 downto 0);
        out_6_qcplen_tpl_stm : out std_logic_vector(10 downto 0);
        out_7_q_dc_sc_en_tpl_stm : out std_logic_vector(0 downto 0);
        out_8_qfft_gain_real_tpl_stm : out std_logic_vector(15 downto 0);
        out_9_qf_ift_gain_imag_tpl_stm : out std_logic_vector(15 downto 0);
        out_10_q_ifftshift_tpl_stm : out std_logic_vector(3 downto 0);
        out_11_q_ifft_mux_const_data_tpl_stm : out std_logic_vector(15 downto 0);
        out_12_q_muxsel_tpl_stm : out std_logic_vector(0 downto 0);
        out_13_time_out_tpl_stm : out std_logic_vector(63 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_stm;

architecture normal of ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal clk_ChannelIn_cunroll_x_stm_sig_stop : std_logic := '0';
    signal clk_ChannelOut_cunroll_x_stm_sig_stop : std_logic := '0';

    function str_to_stdvec(inp: string) return std_logic_vector is
        variable temp: std_logic_vector(inp'range) := (others => 'X');
    begin
        for i in inp'range loop
            IF ((inp(i) = '1')) THEN
                temp(i) := '1';
            elsif (inp(i) = '0') then
                temp(i) := '0';
            END IF;
            end loop;
            return temp;
        end function str_to_stdvec;
        

    begin

    clk <= clk_stm_sig;
    clk_process: process 
    begin
        wait for 200 ps;
        clk_stm_sig <= not clk_stm_sig;
        wait for 817 ps;
        if (clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk clk" severity NOTE;
            wait;
        end if;
        wait for 200 ps;
        clk_stm_sig <= not clk_stm_sig;
        wait for 817 ps;
        if (clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk clk" severity NOTE;
            wait;
        end if;
    end process;

    areset <= areset_stm_sig;
    areset_process: process begin
        areset_stm_sig <= '1';
        wait for 1525 ps;
        wait for 1023*2034 ps; -- additional reset delay
        areset_stm_sig <= '0';
        wait;
    end process;


        -- Generating stimulus for ChannelIn_cunroll_x
        ChannelIn_cunroll_x_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_ChannelIn_cunroll_x.stm");
            variable in_1_valid_tpl_int_0 : Integer;
            variable in_1_valid_tpl_temp : std_logic_vector(0 downto 0);
            variable in_2_ch_tpl_int_0 : Integer;
            variable in_2_ch_tpl_temp : std_logic_vector(7 downto 0);
            variable in_3_real_data_tpl_int_0 : Integer;
            variable in_3_real_data_tpl_temp : std_logic_vector(15 downto 0);
            variable in_3_imag_data_tpl_int_0 : Integer;
            variable in_3_imag_data_tpl_temp : std_logic_vector(15 downto 0);
            variable in_4_FFTSize_tpl_int_0 : Integer;
            variable in_4_FFTSize_tpl_temp : std_logic_vector(3 downto 0);
            variable in_5_NSubCarr_tpl_int_0 : Integer;
            variable in_5_NSubCarr_tpl_temp : std_logic_vector(11 downto 0);
            variable in_6_cplen_tpl_int_0 : Integer;
            variable in_6_cplen_tpl_temp : std_logic_vector(10 downto 0);
            variable in_7_DC_SC_EN1_tpl_int_0 : Integer;
            variable in_7_DC_SC_EN1_tpl_temp : std_logic_vector(0 downto 0);
            variable in_8_iftgain_real_tpl_int_0 : Integer;
            variable in_8_iftgain_real_tpl_temp : std_logic_vector(15 downto 0);
            variable in_9_ifftgain_imag_tpl_int_0 : Integer;
            variable in_9_ifftgain_imag_tpl_temp : std_logic_vector(15 downto 0);
            variable in_10_ifftshift_tpl_int_0 : Integer;
            variable in_10_ifftshift_tpl_temp : std_logic_vector(3 downto 0);
            variable in_11_ifft_mux_const_data_tpl_int_0 : Integer;
            variable in_11_ifft_mux_const_data_tpl_temp : std_logic_vector(15 downto 0);
            variable in_12_muxsel_tpl_int_0 : Integer;
            variable in_12_muxsel_tpl_temp : std_logic_vector(0 downto 0);
            variable in_13_time_in_tpl_int_0 : Integer;
            variable in_13_time_in_tpl_int_1 : Integer;
            variable in_13_time_in_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            in_1_valid_tpl_stm <= (others => '0');
            in_2_ch_tpl_stm <= (others => '0');
            in_3_real_data_tpl_stm <= (others => '0');
            in_3_imag_data_tpl_stm <= (others => '0');
            in_4_FFTSize_tpl_stm <= (others => '0');
            in_5_NSubCarr_tpl_stm <= (others => '0');
            in_6_cplen_tpl_stm <= (others => '0');
            in_7_DC_SC_EN1_tpl_stm <= (others => '0');
            in_8_iftgain_real_tpl_stm <= (others => '0');
            in_9_ifftgain_imag_tpl_stm <= (others => '0');
            in_10_ifftshift_tpl_stm <= (others => '0');
            in_11_ifft_mux_const_data_tpl_stm <= (others => '0');
            in_12_muxsel_tpl_stm <= (others => '0');
            in_13_time_in_tpl_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                in_1_valid_tpl_stm <= (others => '0');
                in_2_ch_tpl_stm <= (others => '0');
                in_3_real_data_tpl_stm <= (others => '0');
                in_3_imag_data_tpl_stm <= (others => '0');
                in_4_FFTSize_tpl_stm <= (others => '0');
                in_5_NSubCarr_tpl_stm <= (others => '0');
                in_6_cplen_tpl_stm <= (others => '0');
                in_7_DC_SC_EN1_tpl_stm <= (others => '0');
                in_8_iftgain_real_tpl_stm <= (others => '0');
                in_9_ifftgain_imag_tpl_stm <= (others => '0');
                in_10_ifftshift_tpl_stm <= (others => '0');
                in_11_ifft_mux_const_data_tpl_stm <= (others => '0');
                in_12_muxsel_tpl_stm <= (others => '0');
                in_13_time_in_tpl_stm <= (others => '0');
            end loop;
            while true loop
            
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_ChannelIn_cunroll_x_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, in_1_valid_tpl_int_0);
                    in_1_valid_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_1_valid_tpl_int_0, 1));
                    in_1_valid_tpl_stm <= in_1_valid_tpl_temp;
                    read(L, in_2_ch_tpl_int_0);
                    in_2_ch_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_2_ch_tpl_int_0, 8));
                    in_2_ch_tpl_stm <= in_2_ch_tpl_temp;
                    read(L, in_3_real_data_tpl_int_0);
                    in_3_real_data_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_real_data_tpl_int_0, 16));
                    in_3_real_data_tpl_stm <= in_3_real_data_tpl_temp;
                    read(L, in_3_imag_data_tpl_int_0);
                    in_3_imag_data_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_imag_data_tpl_int_0, 16));
                    in_3_imag_data_tpl_stm <= in_3_imag_data_tpl_temp;
                    read(L, in_4_FFTSize_tpl_int_0);
                    in_4_FFTSize_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(in_4_FFTSize_tpl_int_0, 4));
                    in_4_FFTSize_tpl_stm <= in_4_FFTSize_tpl_temp;
                    read(L, in_5_NSubCarr_tpl_int_0);
                    in_5_NSubCarr_tpl_temp(11 downto 0) := std_logic_vector(to_unsigned(in_5_NSubCarr_tpl_int_0, 12));
                    in_5_NSubCarr_tpl_stm <= in_5_NSubCarr_tpl_temp;
                    read(L, in_6_cplen_tpl_int_0);
                    in_6_cplen_tpl_temp(10 downto 0) := std_logic_vector(to_unsigned(in_6_cplen_tpl_int_0, 11));
                    in_6_cplen_tpl_stm <= in_6_cplen_tpl_temp;
                    read(L, in_7_DC_SC_EN1_tpl_int_0);
                    in_7_DC_SC_EN1_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_7_DC_SC_EN1_tpl_int_0, 1));
                    in_7_DC_SC_EN1_tpl_stm <= in_7_DC_SC_EN1_tpl_temp;
                    read(L, in_8_iftgain_real_tpl_int_0);
                    in_8_iftgain_real_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_8_iftgain_real_tpl_int_0, 16));
                    in_8_iftgain_real_tpl_stm <= in_8_iftgain_real_tpl_temp;
                    read(L, in_9_ifftgain_imag_tpl_int_0);
                    in_9_ifftgain_imag_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_9_ifftgain_imag_tpl_int_0, 16));
                    in_9_ifftgain_imag_tpl_stm <= in_9_ifftgain_imag_tpl_temp;
                    read(L, in_10_ifftshift_tpl_int_0);
                    in_10_ifftshift_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(in_10_ifftshift_tpl_int_0, 4));
                    in_10_ifftshift_tpl_stm <= in_10_ifftshift_tpl_temp;
                    read(L, in_11_ifft_mux_const_data_tpl_int_0);
                    in_11_ifft_mux_const_data_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_11_ifft_mux_const_data_tpl_int_0, 16));
                    in_11_ifft_mux_const_data_tpl_stm <= in_11_ifft_mux_const_data_tpl_temp;
                    read(L, in_12_muxsel_tpl_int_0);
                    in_12_muxsel_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_12_muxsel_tpl_int_0, 1));
                    in_12_muxsel_tpl_stm <= in_12_muxsel_tpl_temp;
                    read(L, in_13_time_in_tpl_int_0);
                    in_13_time_in_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_13_time_in_tpl_int_0, 32));
                    read(L, in_13_time_in_tpl_int_1);
                    in_13_time_in_tpl_temp(63 downto 32) := std_logic_vector(to_signed(in_13_time_in_tpl_int_1, 32));
                    in_13_time_in_tpl_stm <= in_13_time_in_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for ChannelOut_cunroll_x
        ChannelOut_cunroll_x_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_ChannelOut_cunroll_x.stm");
            variable out_1_qvalid_tpl_int_0 : Integer;
            variable out_1_qvalid_tpl_temp : std_logic_vector(0 downto 0);
            variable out_2_qchannel_tpl_int_0 : Integer;
            variable out_2_qchannel_tpl_temp : std_logic_vector(7 downto 0);
            variable out_3_real_qdata_tpl_int_0 : Integer;
            variable out_3_real_qdata_tpl_temp : std_logic_vector(15 downto 0);
            variable out_3_imag_qdata_tpl_int_0 : Integer;
            variable out_3_imag_qdata_tpl_temp : std_logic_vector(15 downto 0);
            variable out_4_qfftsize_tpl_int_0 : Integer;
            variable out_4_qfftsize_tpl_temp : std_logic_vector(3 downto 0);
            variable out_5_q_nprb_tpl_int_0 : Integer;
            variable out_5_q_nprb_tpl_temp : std_logic_vector(11 downto 0);
            variable out_6_qcplen_tpl_int_0 : Integer;
            variable out_6_qcplen_tpl_temp : std_logic_vector(10 downto 0);
            variable out_7_q_dc_sc_en_tpl_int_0 : Integer;
            variable out_7_q_dc_sc_en_tpl_temp : std_logic_vector(0 downto 0);
            variable out_8_qfft_gain_real_tpl_int_0 : Integer;
            variable out_8_qfft_gain_real_tpl_temp : std_logic_vector(15 downto 0);
            variable out_9_qf_ift_gain_imag_tpl_int_0 : Integer;
            variable out_9_qf_ift_gain_imag_tpl_temp : std_logic_vector(15 downto 0);
            variable out_10_q_ifftshift_tpl_int_0 : Integer;
            variable out_10_q_ifftshift_tpl_temp : std_logic_vector(3 downto 0);
            variable out_11_q_ifft_mux_const_data_tpl_int_0 : Integer;
            variable out_11_q_ifft_mux_const_data_tpl_temp : std_logic_vector(15 downto 0);
            variable out_12_q_muxsel_tpl_int_0 : Integer;
            variable out_12_q_muxsel_tpl_temp : std_logic_vector(0 downto 0);
            variable out_13_time_out_tpl_int_0 : Integer;
            variable out_13_time_out_tpl_int_1 : Integer;
            variable out_13_time_out_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            out_1_qvalid_tpl_stm <= (others => '0');
            out_2_qchannel_tpl_stm <= (others => '0');
            out_3_real_qdata_tpl_stm <= (others => '0');
            out_3_imag_qdata_tpl_stm <= (others => '0');
            out_4_qfftsize_tpl_stm <= (others => '0');
            out_5_q_nprb_tpl_stm <= (others => '0');
            out_6_qcplen_tpl_stm <= (others => '0');
            out_7_q_dc_sc_en_tpl_stm <= (others => '0');
            out_8_qfft_gain_real_tpl_stm <= (others => '0');
            out_9_qf_ift_gain_imag_tpl_stm <= (others => '0');
            out_10_q_ifftshift_tpl_stm <= (others => '0');
            out_11_q_ifft_mux_const_data_tpl_stm <= (others => '0');
            out_12_q_muxsel_tpl_stm <= (others => '0');
            out_13_time_out_tpl_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_ChannelOut_cunroll_x_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, out_1_qvalid_tpl_int_0);
                    out_1_qvalid_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_1_qvalid_tpl_int_0, 1));
                    out_1_qvalid_tpl_stm <= out_1_qvalid_tpl_temp;
                    read(L, out_2_qchannel_tpl_int_0);
                    out_2_qchannel_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_2_qchannel_tpl_int_0, 8));
                    out_2_qchannel_tpl_stm <= out_2_qchannel_tpl_temp;
                    read(L, out_3_real_qdata_tpl_int_0);
                    out_3_real_qdata_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_3_real_qdata_tpl_int_0, 16));
                    out_3_real_qdata_tpl_stm <= out_3_real_qdata_tpl_temp;
                    read(L, out_3_imag_qdata_tpl_int_0);
                    out_3_imag_qdata_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_3_imag_qdata_tpl_int_0, 16));
                    out_3_imag_qdata_tpl_stm <= out_3_imag_qdata_tpl_temp;
                    read(L, out_4_qfftsize_tpl_int_0);
                    out_4_qfftsize_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(out_4_qfftsize_tpl_int_0, 4));
                    out_4_qfftsize_tpl_stm <= out_4_qfftsize_tpl_temp;
                    read(L, out_5_q_nprb_tpl_int_0);
                    out_5_q_nprb_tpl_temp(11 downto 0) := std_logic_vector(to_unsigned(out_5_q_nprb_tpl_int_0, 12));
                    out_5_q_nprb_tpl_stm <= out_5_q_nprb_tpl_temp;
                    read(L, out_6_qcplen_tpl_int_0);
                    out_6_qcplen_tpl_temp(10 downto 0) := std_logic_vector(to_unsigned(out_6_qcplen_tpl_int_0, 11));
                    out_6_qcplen_tpl_stm <= out_6_qcplen_tpl_temp;
                    read(L, out_7_q_dc_sc_en_tpl_int_0);
                    out_7_q_dc_sc_en_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_7_q_dc_sc_en_tpl_int_0, 1));
                    out_7_q_dc_sc_en_tpl_stm <= out_7_q_dc_sc_en_tpl_temp;
                    read(L, out_8_qfft_gain_real_tpl_int_0);
                    out_8_qfft_gain_real_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_8_qfft_gain_real_tpl_int_0, 16));
                    out_8_qfft_gain_real_tpl_stm <= out_8_qfft_gain_real_tpl_temp;
                    read(L, out_9_qf_ift_gain_imag_tpl_int_0);
                    out_9_qf_ift_gain_imag_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_9_qf_ift_gain_imag_tpl_int_0, 16));
                    out_9_qf_ift_gain_imag_tpl_stm <= out_9_qf_ift_gain_imag_tpl_temp;
                    read(L, out_10_q_ifftshift_tpl_int_0);
                    out_10_q_ifftshift_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(out_10_q_ifftshift_tpl_int_0, 4));
                    out_10_q_ifftshift_tpl_stm <= out_10_q_ifftshift_tpl_temp;
                    read(L, out_11_q_ifft_mux_const_data_tpl_int_0);
                    out_11_q_ifft_mux_const_data_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_11_q_ifft_mux_const_data_tpl_int_0, 16));
                    out_11_q_ifft_mux_const_data_tpl_stm <= out_11_q_ifft_mux_const_data_tpl_temp;
                    read(L, out_12_q_muxsel_tpl_int_0);
                    out_12_q_muxsel_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_12_q_muxsel_tpl_int_0, 1));
                    out_12_q_muxsel_tpl_stm <= out_12_q_muxsel_tpl_temp;
                    read(L, out_13_time_out_tpl_int_0);
                    out_13_time_out_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_13_time_out_tpl_int_0, 32));
                    read(L, out_13_time_out_tpl_int_1);
                    out_13_time_out_tpl_temp(63 downto 32) := std_logic_vector(to_signed(out_13_time_out_tpl_int_1, 32));
                    out_13_time_out_tpl_stm <= out_13_time_out_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

    clk_stm_sig_stop <= clk_ChannelIn_cunroll_x_stm_sig_stop OR clk_ChannelOut_cunroll_x_stm_sig_stop OR '0';


    END normal;
