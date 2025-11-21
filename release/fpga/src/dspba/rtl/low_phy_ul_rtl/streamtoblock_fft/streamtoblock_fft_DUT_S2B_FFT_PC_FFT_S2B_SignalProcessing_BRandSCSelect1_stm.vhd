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
use std.TextIO.all;
USE work.streamtoblock_fft_DUT_safe_path.all;

entity standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_stm is
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
end standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_stm;

architecture normal of standaloneTopLevel_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';
    signal bus_clk_busIn_stm_sig_stop : std_logic := '0';
    signal clk_v_s_stm_sig_stop : std_logic := '0';
    signal clk_c_s_stm_sig_stop : std_logic := '0';
    signal clk_x_im_stm_sig_stop : std_logic := '0';
    signal clk_x_re_stm_sig_stop : std_logic := '0';
    signal clk_FFTSize_s_stm_sig_stop : std_logic := '0';
    signal clk_NSubCarr_s_stm_sig_stop : std_logic := '0';
    signal clk_time_in_s_stm_sig_stop : std_logic := '0';
    signal clk_DC_SC_EN_s_stm_sig_stop : std_logic := '0';
    signal clk_ripple_comp_en_s_stm_sig_stop : std_logic := '0';
    signal clk_rc_bw_sel_s_stm_sig_stop : std_logic := '0';
    signal clk_eAxC_s_stm_sig_stop : std_logic := '0';
    signal clk_metadata_in_s_stm_sig_stop : std_logic := '0';
    signal clk_qv_s_stm_sig_stop : std_logic := '0';
    signal clk_qc_s_stm_sig_stop : std_logic := '0';
    signal clk_q_im_stm_sig_stop : std_logic := '0';
    signal clk_q_re_stm_sig_stop : std_logic := '0';
    signal clk_qsizeout_s_stm_sig_stop : std_logic := '0';
    signal clk_time_out_s_stm_sig_stop : std_logic := '0';
    signal clk_eAxC_out_s_stm_sig_stop : std_logic := '0';
    signal clk_meatadata_sym_out_s_stm_sig_stop : std_logic := '0';

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

    bus_clk <= bus_clk_stm_sig;
    bus_clk_process: process 
    begin
        wait for 200 ps;
        bus_clk_stm_sig <= not bus_clk_stm_sig;
        wait for 4800 ps;
        if (bus_clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk bus_clk" severity NOTE;
            wait;
        end if;
        wait for 200 ps;
        bus_clk_stm_sig <= not bus_clk_stm_sig;
        wait for 4800 ps;
        if (bus_clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk bus_clk" severity NOTE;
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

    bus_areset <= bus_areset_stm_sig;
    bus_areset_process: process begin
        bus_areset_stm_sig <= '1';
        wait for 7500 ps;
        wait for 1023*2034 ps; -- additional reset delay
        bus_areset_stm_sig <= '0';
        wait;
    end process;


        -- Generating stimulus for busIn
        busIn_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_busIn : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_busIn.stm");
            variable busIn_writedata_int_0 : Integer;
            variable busIn_writedata_temp : std_logic_vector(31 downto 0);
            variable busIn_address_int_0 : Integer;
            variable busIn_address_temp : std_logic_vector(13 downto 0);
            variable busIn_write_int_0 : Integer;
            variable busIn_write_temp : std_logic_vector(0 downto 0);
            variable busIn_read_int_0 : Integer;
            variable busIn_read_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            busIn_writedata_stm <= (others => '0');
            busIn_address_stm <= (others => '0');
            busIn_write_stm <= (others => '0');
            busIn_read_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                IF (endfile(data_file_busIn)) THEN
                    bus_clk_busIn_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_busIn, L);
                    
                    read(L, busIn_writedata_int_0);
                    busIn_writedata_temp(31 downto 0) := std_logic_vector(to_signed(busIn_writedata_int_0, 32));
                    busIn_writedata_stm <= busIn_writedata_temp;
                    read(L, busIn_address_int_0);
                    busIn_address_temp(13 downto 0) := std_logic_vector(to_unsigned(busIn_address_int_0, 14));
                    busIn_address_stm <= busIn_address_temp;
                    read(L, busIn_write_int_0);
                    busIn_write_temp(0 downto 0) := std_logic_vector(to_unsigned(busIn_write_int_0, 1));
                    busIn_write_stm <= busIn_write_temp;
                    read(L, busIn_read_int_0);
                    busIn_read_temp(0 downto 0) := std_logic_vector(to_unsigned(busIn_read_int_0, 1));
                    busIn_read_stm <= busIn_read_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until bus_clk_stm_sig'EVENT and bus_clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stub busOut - no stimulus
        -- initialize all outputs to 0
        busOut_readdatavalid_stm <= (others => '0');
        busOut_readdata_stm <= (others => '0');
        busOut_waitrequest_stm <= (others => '0');

        -- Generating stimulus for v_s
        v_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_in_cunroll_x.stm");
            variable in_1_v_tpl_int_0 : Integer;
            variable in_1_v_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            v_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                v_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to v_s)
                IF (endfile(data_file_channel_BRSC1_in_cunroll_x)) THEN
                    clk_v_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_in_cunroll_x, L);
                    
                    read(L, in_1_v_tpl_int_0);
                    in_1_v_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_1_v_tpl_int_0, 1));
                    v_s_stm <= in_1_v_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for c_s
        c_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_in_cunroll_x.stm");
            variable in_2_c_tpl_int_0 : Integer;
            variable in_2_c_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            c_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                c_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to c_s)
                IF (endfile(data_file_channel_BRSC1_in_cunroll_x)) THEN
                    clk_c_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_in_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, in_2_c_tpl_int_0);
                    in_2_c_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_2_c_tpl_int_0, 8));
                    c_s_stm <= in_2_c_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for x_im
        x_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_in_cunroll_x.stm");
            variable in_3_imag_x_tpl_int_0 : Integer;
            variable in_3_imag_x_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            x_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                x_im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to x_im)
                IF (endfile(data_file_channel_BRSC1_in_cunroll_x)) THEN
                    clk_x_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_in_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_3_imag_x_tpl_int_0);
                    in_3_imag_x_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_imag_x_tpl_int_0, 16));
                    x_im_stm <= in_3_imag_x_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for x_re
        x_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_in_cunroll_x.stm");
            variable in_3_real_x_tpl_int_0 : Integer;
            variable in_3_real_x_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            x_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                x_re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to x_re)
                IF (endfile(data_file_channel_BRSC1_in_cunroll_x)) THEN
                    clk_x_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_in_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_3_real_x_tpl_int_0);
                    in_3_real_x_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_real_x_tpl_int_0, 16));
                    x_re_stm <= in_3_real_x_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for FFTSize_s
        FFTSize_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_in_cunroll_x.stm");
            variable in_4_FFTSize_tpl_int_0 : Integer;
            variable in_4_FFTSize_tpl_temp : std_logic_vector(3 downto 0);

        begin
            -- initialize all outputs to 0
            FFTSize_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                FFTSize_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to FFTSize_s)
                IF (endfile(data_file_channel_BRSC1_in_cunroll_x)) THEN
                    clk_FFTSize_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_in_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_FFTSize_tpl_int_0);
                    in_4_FFTSize_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(in_4_FFTSize_tpl_int_0, 4));
                    FFTSize_s_stm <= in_4_FFTSize_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for NSubCarr_s
        NSubCarr_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_in_cunroll_x.stm");
            variable in_5_NSubCarr_tpl_int_0 : Integer;
            variable in_5_NSubCarr_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            NSubCarr_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                NSubCarr_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to NSubCarr_s)
                IF (endfile(data_file_channel_BRSC1_in_cunroll_x)) THEN
                    clk_NSubCarr_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_in_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_5_NSubCarr_tpl_int_0);
                    in_5_NSubCarr_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_5_NSubCarr_tpl_int_0, 16));
                    NSubCarr_s_stm <= in_5_NSubCarr_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for time_in_s
        time_in_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_in_cunroll_x.stm");
            variable in_6_time_in_tpl_int_0 : Integer;
            variable in_6_time_in_tpl_int_1 : Integer;
            variable in_6_time_in_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            time_in_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                time_in_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to time_in_s)
                IF (endfile(data_file_channel_BRSC1_in_cunroll_x)) THEN
                    clk_time_in_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_in_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_6_time_in_tpl_int_0);
                    in_6_time_in_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_6_time_in_tpl_int_0, 32));
                    read(L, in_6_time_in_tpl_int_1);
                    in_6_time_in_tpl_temp(63 downto 32) := std_logic_vector(to_signed(in_6_time_in_tpl_int_1, 32));
                    time_in_s_stm <= in_6_time_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for DC_SC_EN_s
        DC_SC_EN_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_in_cunroll_x.stm");
            variable in_7_DC_SC_EN_tpl_int_0 : Integer;
            variable in_7_DC_SC_EN_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            DC_SC_EN_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DC_SC_EN_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to DC_SC_EN_s)
                IF (endfile(data_file_channel_BRSC1_in_cunroll_x)) THEN
                    clk_DC_SC_EN_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_in_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_7_DC_SC_EN_tpl_int_0);
                    in_7_DC_SC_EN_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_7_DC_SC_EN_tpl_int_0, 1));
                    DC_SC_EN_s_stm <= in_7_DC_SC_EN_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for ripple_comp_en_s
        ripple_comp_en_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_in_cunroll_x.stm");
            variable in_8_ripple_comp_en_tpl_int_0 : Integer;
            variable in_8_ripple_comp_en_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            ripple_comp_en_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                ripple_comp_en_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to ripple_comp_en_s)
                IF (endfile(data_file_channel_BRSC1_in_cunroll_x)) THEN
                    clk_ripple_comp_en_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_in_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_8_ripple_comp_en_tpl_int_0);
                    in_8_ripple_comp_en_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_8_ripple_comp_en_tpl_int_0, 1));
                    ripple_comp_en_s_stm <= in_8_ripple_comp_en_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for rc_bw_sel_s
        rc_bw_sel_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_in_cunroll_x.stm");
            variable in_9_rc_bw_sel_tpl_int_0 : Integer;
            variable in_9_rc_bw_sel_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            rc_bw_sel_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                rc_bw_sel_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to rc_bw_sel_s)
                IF (endfile(data_file_channel_BRSC1_in_cunroll_x)) THEN
                    clk_rc_bw_sel_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_in_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_9_rc_bw_sel_tpl_int_0);
                    in_9_rc_bw_sel_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_9_rc_bw_sel_tpl_int_0, 1));
                    rc_bw_sel_s_stm <= in_9_rc_bw_sel_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for eAxC_s
        eAxC_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_in_cunroll_x.stm");
            variable in_10_eAxC_tpl_int_0 : Integer;
            variable in_10_eAxC_tpl_temp : std_logic_vector(1 downto 0);

        begin
            -- initialize all outputs to 0
            eAxC_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                eAxC_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to eAxC_s)
                IF (endfile(data_file_channel_BRSC1_in_cunroll_x)) THEN
                    clk_eAxC_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_in_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_10_eAxC_tpl_int_0);
                    in_10_eAxC_tpl_temp(1 downto 0) := std_logic_vector(to_unsigned(in_10_eAxC_tpl_int_0, 2));
                    eAxC_s_stm <= in_10_eAxC_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for metadata_in_s
        metadata_in_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_in_cunroll_x.stm");
            variable in_11_metadata_in_tpl_int_0 : Integer;
            variable in_11_metadata_in_tpl_int_1 : Integer;
            variable in_11_metadata_in_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            metadata_in_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                metadata_in_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to metadata_in_s)
                IF (endfile(data_file_channel_BRSC1_in_cunroll_x)) THEN
                    clk_metadata_in_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_in_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_11_metadata_in_tpl_int_0);
                    in_11_metadata_in_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_11_metadata_in_tpl_int_0, 32));
                    read(L, in_11_metadata_in_tpl_int_1);
                    in_11_metadata_in_tpl_temp(63 downto 32) := std_logic_vector(to_signed(in_11_metadata_in_tpl_int_1, 32));
                    metadata_in_s_stm <= in_11_metadata_in_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for qv_s
        qv_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_out_cunroll_x.stm");
            variable out_1_qv_tpl_int_0 : Integer;
            variable out_1_qv_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            qv_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to qv_s)
                IF (endfile(data_file_channel_BRSC1_out_cunroll_x)) THEN
                    clk_qv_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_out_cunroll_x, L);
                    
                    read(L, out_1_qv_tpl_int_0);
                    out_1_qv_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_1_qv_tpl_int_0, 1));
                    qv_s_stm <= out_1_qv_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for qc_s
        qc_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_out_cunroll_x.stm");
            variable out_2_qc_tpl_int_0 : Integer;
            variable out_2_qc_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            qc_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to qc_s)
                IF (endfile(data_file_channel_BRSC1_out_cunroll_x)) THEN
                    clk_qc_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, out_2_qc_tpl_int_0);
                    out_2_qc_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_2_qc_tpl_int_0, 8));
                    qc_s_stm <= out_2_qc_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q_im
        q_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_out_cunroll_x.stm");
            variable out_3_imag_q_tpl_int_0 : Integer;
            variable out_3_imag_q_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            q_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to q_im)
                IF (endfile(data_file_channel_BRSC1_out_cunroll_x)) THEN
                    clk_q_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_3_imag_q_tpl_int_0);
                    out_3_imag_q_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_3_imag_q_tpl_int_0, 16));
                    q_im_stm <= out_3_imag_q_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q_re
        q_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_out_cunroll_x.stm");
            variable out_3_real_q_tpl_int_0 : Integer;
            variable out_3_real_q_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            q_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to q_re)
                IF (endfile(data_file_channel_BRSC1_out_cunroll_x)) THEN
                    clk_q_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_3_real_q_tpl_int_0);
                    out_3_real_q_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_3_real_q_tpl_int_0, 16));
                    q_re_stm <= out_3_real_q_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for qsizeout_s
        qsizeout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_out_cunroll_x.stm");
            variable out_4_qsizeout_tpl_int_0 : Integer;
            variable out_4_qsizeout_tpl_temp : std_logic_vector(3 downto 0);

        begin
            -- initialize all outputs to 0
            qsizeout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to qsizeout_s)
                IF (endfile(data_file_channel_BRSC1_out_cunroll_x)) THEN
                    clk_qsizeout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_qsizeout_tpl_int_0);
                    out_4_qsizeout_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(out_4_qsizeout_tpl_int_0, 4));
                    qsizeout_s_stm <= out_4_qsizeout_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for time_out_s
        time_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_out_cunroll_x.stm");
            variable out_5_time_out_tpl_int_0 : Integer;
            variable out_5_time_out_tpl_int_1 : Integer;
            variable out_5_time_out_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            time_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to time_out_s)
                IF (endfile(data_file_channel_BRSC1_out_cunroll_x)) THEN
                    clk_time_out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_5_time_out_tpl_int_0);
                    out_5_time_out_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_5_time_out_tpl_int_0, 32));
                    read(L, out_5_time_out_tpl_int_1);
                    out_5_time_out_tpl_temp(63 downto 32) := std_logic_vector(to_signed(out_5_time_out_tpl_int_1, 32));
                    time_out_s_stm <= out_5_time_out_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for eAxC_out_s
        eAxC_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_out_cunroll_x.stm");
            variable out_6_eAxC_out_tpl_int_0 : Integer;
            variable out_6_eAxC_out_tpl_temp : std_logic_vector(1 downto 0);

        begin
            -- initialize all outputs to 0
            eAxC_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to eAxC_out_s)
                IF (endfile(data_file_channel_BRSC1_out_cunroll_x)) THEN
                    clk_eAxC_out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_6_eAxC_out_tpl_int_0);
                    out_6_eAxC_out_tpl_temp(1 downto 0) := std_logic_vector(to_unsigned(out_6_eAxC_out_tpl_int_0, 2));
                    eAxC_out_s_stm <= out_6_eAxC_out_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for meatadata_sym_out_s
        meatadata_sym_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_BRSC1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_channel_BRSC1_out_cunroll_x.stm");
            variable out_7_meatadata_sym_out_tpl_int_0 : Integer;
            variable out_7_meatadata_sym_out_tpl_int_1 : Integer;
            variable out_7_meatadata_sym_out_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            meatadata_sym_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to meatadata_sym_out_s)
                IF (endfile(data_file_channel_BRSC1_out_cunroll_x)) THEN
                    clk_meatadata_sym_out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_BRSC1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_7_meatadata_sym_out_tpl_int_0);
                    out_7_meatadata_sym_out_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_7_meatadata_sym_out_tpl_int_0, 32));
                    read(L, out_7_meatadata_sym_out_tpl_int_1);
                    out_7_meatadata_sym_out_tpl_temp(63 downto 32) := std_logic_vector(to_signed(out_7_meatadata_sym_out_tpl_int_1, 32));
                    meatadata_sym_out_s_stm <= out_7_meatadata_sym_out_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

    clk_stm_sig_stop <= clk_v_s_stm_sig_stop OR clk_c_s_stm_sig_stop OR clk_x_im_stm_sig_stop OR clk_x_re_stm_sig_stop OR clk_FFTSize_s_stm_sig_stop OR clk_NSubCarr_s_stm_sig_stop OR clk_time_in_s_stm_sig_stop OR clk_DC_SC_EN_s_stm_sig_stop OR clk_ripple_comp_en_s_stm_sig_stop OR clk_rc_bw_sel_s_stm_sig_stop OR clk_eAxC_s_stm_sig_stop OR clk_metadata_in_s_stm_sig_stop OR clk_qv_s_stm_sig_stop OR clk_qc_s_stm_sig_stop OR clk_q_im_stm_sig_stop OR clk_q_re_stm_sig_stop OR clk_qsizeout_s_stm_sig_stop OR clk_time_out_s_stm_sig_stop OR clk_eAxC_out_s_stm_sig_stop OR clk_meatadata_sym_out_s_stm_sig_stop OR '0';
    bus_clk_stm_sig_stop <= bus_clk_busIn_stm_sig_stop OR '0';


    END normal;
