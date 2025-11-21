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

-- VHDL created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb
-- VHDL created on Thu Jun 12 21:29:54 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.streamtoblock_fft_DUT_safe_path.all;

entity streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb_stm is
    port (
        in_1_v_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_c_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_sop_tpl_stm : out std_logic_vector(0 downto 0);
        in_6_size_tpl_stm : out std_logic_vector(3 downto 0);
        in_4_real_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_imag_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_5_nsc_tpl_stm : out std_logic_vector(15 downto 0);
        in_7_time_in_tpl_stm : out std_logic_vector(63 downto 0);
        in_8_eAxC_no_tpl_stm : out std_logic_vector(1 downto 0);
        in_9_sym_metadata_tpl_stm : out std_logic_vector(63 downto 0);
        out_1_qv_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_qc_tpl_stm : out std_logic_vector(7 downto 0);
        out_3_qsop_tpl_stm : out std_logic_vector(0 downto 0);
        out_4_qeop_tpl_stm : out std_logic_vector(0 downto 0);
        out_5_qsize_tpl_stm : out std_logic_vector(3 downto 0);
        out_6_real_q_tpl_stm : out std_logic_vector(28 downto 0);
        out_6_imag_q_tpl_stm : out std_logic_vector(28 downto 0);
        out_7_qnsc_tpl_stm : out std_logic_vector(15 downto 0);
        out_8_time_out_tpl_stm : out std_logic_vector(63 downto 0);
        out_9_eAxC_tpl_stm : out std_logic_vector(1 downto 0);
        out_10_metadata_sym_tpl_stm : out std_logic_vector(63 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb_stm;

architecture normal of streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal clk_channel_FFT1_in_cunroll_x_stm_sig_stop : std_logic := '0';
    signal clk_channel_FFT1_out_cunroll_x_stm_sig_stop : std_logic := '0';

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


        -- Generating stimulus for channel_FFT1_in_cunroll_x
        channel_FFT1_in_cunroll_x_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_FFT1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb_channel_FFT1_in_cunroll_x.stm");
            variable in_1_v_tpl_int_0 : Integer;
            variable in_1_v_tpl_temp : std_logic_vector(0 downto 0);
            variable in_2_c_tpl_int_0 : Integer;
            variable in_2_c_tpl_temp : std_logic_vector(7 downto 0);
            variable in_3_sop_tpl_int_0 : Integer;
            variable in_3_sop_tpl_temp : std_logic_vector(0 downto 0);
            variable in_6_size_tpl_int_0 : Integer;
            variable in_6_size_tpl_temp : std_logic_vector(3 downto 0);
            variable in_4_real_d_tpl_int_0 : Integer;
            variable in_4_real_d_tpl_temp : std_logic_vector(15 downto 0);
            variable in_4_imag_d_tpl_int_0 : Integer;
            variable in_4_imag_d_tpl_temp : std_logic_vector(15 downto 0);
            variable in_5_nsc_tpl_int_0 : Integer;
            variable in_5_nsc_tpl_temp : std_logic_vector(15 downto 0);
            variable in_7_time_in_tpl_int_0 : Integer;
            variable in_7_time_in_tpl_int_1 : Integer;
            variable in_7_time_in_tpl_temp : std_logic_vector(63 downto 0);
            variable in_8_eAxC_no_tpl_int_0 : Integer;
            variable in_8_eAxC_no_tpl_temp : std_logic_vector(1 downto 0);
            variable in_9_sym_metadata_tpl_int_0 : Integer;
            variable in_9_sym_metadata_tpl_int_1 : Integer;
            variable in_9_sym_metadata_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            in_1_v_tpl_stm <= (others => '0');
            in_2_c_tpl_stm <= (others => '0');
            in_3_sop_tpl_stm <= (others => '0');
            in_6_size_tpl_stm <= (others => '0');
            in_4_real_d_tpl_stm <= (others => '0');
            in_4_imag_d_tpl_stm <= (others => '0');
            in_5_nsc_tpl_stm <= (others => '0');
            in_7_time_in_tpl_stm <= (others => '0');
            in_8_eAxC_no_tpl_stm <= (others => '0');
            in_9_sym_metadata_tpl_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                in_1_v_tpl_stm <= (others => '0');
                in_2_c_tpl_stm <= (others => '0');
                in_3_sop_tpl_stm <= (others => '0');
                in_6_size_tpl_stm <= (others => '0');
                in_4_real_d_tpl_stm <= (others => '0');
                in_4_imag_d_tpl_stm <= (others => '0');
                in_5_nsc_tpl_stm <= (others => '0');
                in_7_time_in_tpl_stm <= (others => '0');
                in_8_eAxC_no_tpl_stm <= (others => '0');
                in_9_sym_metadata_tpl_stm <= (others => '0');
            end loop;
            while true loop
            
                IF (endfile(data_file_channel_FFT1_in_cunroll_x)) THEN
                    clk_channel_FFT1_in_cunroll_x_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_FFT1_in_cunroll_x, L);
                    
                    read(L, in_1_v_tpl_int_0);
                    in_1_v_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_1_v_tpl_int_0, 1));
                    in_1_v_tpl_stm <= in_1_v_tpl_temp;
                    read(L, in_2_c_tpl_int_0);
                    in_2_c_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_2_c_tpl_int_0, 8));
                    in_2_c_tpl_stm <= in_2_c_tpl_temp;
                    read(L, in_3_sop_tpl_int_0);
                    in_3_sop_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_3_sop_tpl_int_0, 1));
                    in_3_sop_tpl_stm <= in_3_sop_tpl_temp;
                    read(L, in_6_size_tpl_int_0);
                    in_6_size_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(in_6_size_tpl_int_0, 4));
                    in_6_size_tpl_stm <= in_6_size_tpl_temp;
                    read(L, in_4_real_d_tpl_int_0);
                    in_4_real_d_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_4_real_d_tpl_int_0, 16));
                    in_4_real_d_tpl_stm <= in_4_real_d_tpl_temp;
                    read(L, in_4_imag_d_tpl_int_0);
                    in_4_imag_d_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_4_imag_d_tpl_int_0, 16));
                    in_4_imag_d_tpl_stm <= in_4_imag_d_tpl_temp;
                    read(L, in_5_nsc_tpl_int_0);
                    in_5_nsc_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_5_nsc_tpl_int_0, 16));
                    in_5_nsc_tpl_stm <= in_5_nsc_tpl_temp;
                    read(L, in_7_time_in_tpl_int_0);
                    in_7_time_in_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_7_time_in_tpl_int_0, 32));
                    read(L, in_7_time_in_tpl_int_1);
                    in_7_time_in_tpl_temp(63 downto 32) := std_logic_vector(to_signed(in_7_time_in_tpl_int_1, 32));
                    in_7_time_in_tpl_stm <= in_7_time_in_tpl_temp;
                    read(L, in_8_eAxC_no_tpl_int_0);
                    in_8_eAxC_no_tpl_temp(1 downto 0) := std_logic_vector(to_unsigned(in_8_eAxC_no_tpl_int_0, 2));
                    in_8_eAxC_no_tpl_stm <= in_8_eAxC_no_tpl_temp;
                    read(L, in_9_sym_metadata_tpl_int_0);
                    in_9_sym_metadata_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_9_sym_metadata_tpl_int_0, 32));
                    read(L, in_9_sym_metadata_tpl_int_1);
                    in_9_sym_metadata_tpl_temp(63 downto 32) := std_logic_vector(to_signed(in_9_sym_metadata_tpl_int_1, 32));
                    in_9_sym_metadata_tpl_stm <= in_9_sym_metadata_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for channel_FFT1_out_cunroll_x
        channel_FFT1_out_cunroll_x_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_FFT1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb_channel_FFT1_out_cunroll_x.stm");
            variable out_1_qv_tpl_int_0 : Integer;
            variable out_1_qv_tpl_temp : std_logic_vector(0 downto 0);
            variable out_2_qc_tpl_int_0 : Integer;
            variable out_2_qc_tpl_temp : std_logic_vector(7 downto 0);
            variable out_3_qsop_tpl_int_0 : Integer;
            variable out_3_qsop_tpl_temp : std_logic_vector(0 downto 0);
            variable out_4_qeop_tpl_int_0 : Integer;
            variable out_4_qeop_tpl_temp : std_logic_vector(0 downto 0);
            variable out_5_qsize_tpl_int_0 : Integer;
            variable out_5_qsize_tpl_temp : std_logic_vector(3 downto 0);
            variable out_6_real_q_tpl_int_0 : Integer;
            variable out_6_real_q_tpl_temp : std_logic_vector(28 downto 0);
            variable out_6_imag_q_tpl_int_0 : Integer;
            variable out_6_imag_q_tpl_temp : std_logic_vector(28 downto 0);
            variable out_7_qnsc_tpl_int_0 : Integer;
            variable out_7_qnsc_tpl_temp : std_logic_vector(15 downto 0);
            variable out_8_time_out_tpl_int_0 : Integer;
            variable out_8_time_out_tpl_int_1 : Integer;
            variable out_8_time_out_tpl_temp : std_logic_vector(63 downto 0);
            variable out_9_eAxC_tpl_int_0 : Integer;
            variable out_9_eAxC_tpl_temp : std_logic_vector(1 downto 0);
            variable out_10_metadata_sym_tpl_int_0 : Integer;
            variable out_10_metadata_sym_tpl_int_1 : Integer;
            variable out_10_metadata_sym_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            out_1_qv_tpl_stm <= (others => '0');
            out_2_qc_tpl_stm <= (others => '0');
            out_3_qsop_tpl_stm <= (others => '0');
            out_4_qeop_tpl_stm <= (others => '0');
            out_5_qsize_tpl_stm <= (others => '0');
            out_6_real_q_tpl_stm <= (others => '0');
            out_6_imag_q_tpl_stm <= (others => '0');
            out_7_qnsc_tpl_stm <= (others => '0');
            out_8_time_out_tpl_stm <= (others => '0');
            out_9_eAxC_tpl_stm <= (others => '0');
            out_10_metadata_sym_tpl_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                IF (endfile(data_file_channel_FFT1_out_cunroll_x)) THEN
                    clk_channel_FFT1_out_cunroll_x_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_FFT1_out_cunroll_x, L);
                    
                    read(L, out_1_qv_tpl_int_0);
                    out_1_qv_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_1_qv_tpl_int_0, 1));
                    out_1_qv_tpl_stm <= out_1_qv_tpl_temp;
                    read(L, out_2_qc_tpl_int_0);
                    out_2_qc_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_2_qc_tpl_int_0, 8));
                    out_2_qc_tpl_stm <= out_2_qc_tpl_temp;
                    read(L, out_3_qsop_tpl_int_0);
                    out_3_qsop_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_3_qsop_tpl_int_0, 1));
                    out_3_qsop_tpl_stm <= out_3_qsop_tpl_temp;
                    read(L, out_4_qeop_tpl_int_0);
                    out_4_qeop_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_4_qeop_tpl_int_0, 1));
                    out_4_qeop_tpl_stm <= out_4_qeop_tpl_temp;
                    read(L, out_5_qsize_tpl_int_0);
                    out_5_qsize_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(out_5_qsize_tpl_int_0, 4));
                    out_5_qsize_tpl_stm <= out_5_qsize_tpl_temp;
                    read(L, out_6_real_q_tpl_int_0);
                    out_6_real_q_tpl_temp(28 downto 0) := std_logic_vector(to_unsigned(out_6_real_q_tpl_int_0, 29));
                    out_6_real_q_tpl_stm <= out_6_real_q_tpl_temp;
                    read(L, out_6_imag_q_tpl_int_0);
                    out_6_imag_q_tpl_temp(28 downto 0) := std_logic_vector(to_unsigned(out_6_imag_q_tpl_int_0, 29));
                    out_6_imag_q_tpl_stm <= out_6_imag_q_tpl_temp;
                    read(L, out_7_qnsc_tpl_int_0);
                    out_7_qnsc_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_7_qnsc_tpl_int_0, 16));
                    out_7_qnsc_tpl_stm <= out_7_qnsc_tpl_temp;
                    read(L, out_8_time_out_tpl_int_0);
                    out_8_time_out_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_8_time_out_tpl_int_0, 32));
                    read(L, out_8_time_out_tpl_int_1);
                    out_8_time_out_tpl_temp(63 downto 32) := std_logic_vector(to_signed(out_8_time_out_tpl_int_1, 32));
                    out_8_time_out_tpl_stm <= out_8_time_out_tpl_temp;
                    read(L, out_9_eAxC_tpl_int_0);
                    out_9_eAxC_tpl_temp(1 downto 0) := std_logic_vector(to_unsigned(out_9_eAxC_tpl_int_0, 2));
                    out_9_eAxC_tpl_stm <= out_9_eAxC_tpl_temp;
                    read(L, out_10_metadata_sym_tpl_int_0);
                    out_10_metadata_sym_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_10_metadata_sym_tpl_int_0, 32));
                    read(L, out_10_metadata_sym_tpl_int_1);
                    out_10_metadata_sym_tpl_temp(63 downto 32) := std_logic_vector(to_signed(out_10_metadata_sym_tpl_int_1, 32));
                    out_10_metadata_sym_tpl_stm <= out_10_metadata_sym_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

    clk_stm_sig_stop <= clk_channel_FFT1_in_cunroll_x_stm_sig_stop OR clk_channel_FFT1_out_cunroll_x_stm_sig_stop OR '0';


    END normal;
