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
use std.TextIO.all;
USE work.streamtoblock_fft_DUT_safe_path.all;

entity streamtoblock_fft_DUT_stm is
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
end streamtoblock_fft_DUT_stm;

architecture normal of streamtoblock_fft_DUT_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';
    signal bus_clk_busIn_stm_sig_stop : std_logic := '0';
    signal bus_clk_busOut_stm_sig_stop : std_logic := '0';
    signal clk_rx_vin_s_stm_sig_stop : std_logic := '0';
    signal clk_rx_chin_s_stm_sig_stop : std_logic := '0';
    signal clk_rx_din_im_stm_sig_stop : std_logic := '0';
    signal clk_rx_din_re_stm_sig_stop : std_logic := '0';
    signal clk_fft_in_s_stm_sig_stop : std_logic := '0';
    signal clk_cp_in_s_stm_sig_stop : std_logic := '0';
    signal clk_nprb_s_stm_sig_stop : std_logic := '0';
    signal clk_hcs_bypass_s_stm_sig_stop : std_logic := '0';
    signal clk_fft_gain_s_stm_sig_stop : std_logic := '0';
    signal clk_fft_gain_im_s_stm_sig_stop : std_logic := '0';
    signal clk_fft_shift_s_stm_sig_stop : std_logic := '0';
    signal clk_time_ref_in_s_stm_sig_stop : std_logic := '0';
    signal clk_DC_SC_EN_s_stm_sig_stop : std_logic := '0';
    signal clk_CP_EN_s_stm_sig_stop : std_logic := '0';
    signal clk_ripple_comp_en_s_stm_sig_stop : std_logic := '0';
    signal clk_rc_bw_sel_s_stm_sig_stop : std_logic := '0';
    signal clk_sym_metadata_in_s_stm_sig_stop : std_logic := '0';
    signal clk_sym_metadata_in_valid_s_stm_sig_stop : std_logic := '0';
    signal clk_rx_valid_s_stm_sig_stop : std_logic := '0';
    signal clk_rx_chout_s_stm_sig_stop : std_logic := '0';
    signal clk_rx_dout_im_stm_sig_stop : std_logic := '0';
    signal clk_rx_dout_re_stm_sig_stop : std_logic := '0';
    signal clk_fft_vout_s_stm_sig_stop : std_logic := '0';
    signal clk_fft_chout_s_stm_sig_stop : std_logic := '0';
    signal clk_fft_dout_im_stm_sig_stop : std_logic := '0';
    signal clk_fft_dout_re_stm_sig_stop : std_logic := '0';
    signal clk_nsc_out_s_stm_sig_stop : std_logic := '0';
    signal clk_size_out_s_stm_sig_stop : std_logic := '0';
    signal clk_td_time_out_s_stm_sig_stop : std_logic := '0';
    signal clk_fd_data_v_s_stm_sig_stop : std_logic := '0';
    signal clk_fd_data_c_s_stm_sig_stop : std_logic := '0';
    signal clk_fd_data_q_im_stm_sig_stop : std_logic := '0';
    signal clk_fd_data_q_re_stm_sig_stop : std_logic := '0';
    signal clk_eAxCout_s_stm_sig_stop : std_logic := '0';
    signal clk_eop_eAxC_s_stm_sig_stop : std_logic := '0';
    signal clk_eop_sym_s_stm_sig_stop : std_logic := '0';
    signal clk_sop_eAxC_s_stm_sig_stop : std_logic := '0';
    signal clk_sop_sym_s_stm_sig_stop : std_logic := '0';

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

        -- Generating stimulus for busOut
        busOut_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_busOut : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_busOut.stm");
            variable busOut_readdatavalid_int_0 : Integer;
            variable busOut_readdatavalid_temp : std_logic_vector(0 downto 0);
            variable busOut_readdata_int_0 : Integer;
            variable busOut_readdata_temp : std_logic_vector(31 downto 0);
            variable busOut_waitrequest_int_0 : Integer;
            variable busOut_waitrequest_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            busOut_readdatavalid_stm <= (others => '0');
            busOut_readdata_stm <= (others => '0');
            busOut_waitrequest_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                IF (endfile(data_file_busOut)) THEN
                    bus_clk_busOut_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_busOut, L);
                    
                    read(L, busOut_readdatavalid_int_0);
                    busOut_readdatavalid_temp(0 downto 0) := std_logic_vector(to_unsigned(busOut_readdatavalid_int_0, 1));
                    busOut_readdatavalid_stm <= busOut_readdatavalid_temp;
                    read(L, busOut_readdata_int_0);
                    busOut_readdata_temp(31 downto 0) := std_logic_vector(to_signed(busOut_readdata_int_0, 32));
                    busOut_readdata_stm <= busOut_readdata_temp;
                    read(L, busOut_waitrequest_int_0);
                    busOut_waitrequest_temp(0 downto 0) := std_logic_vector(to_unsigned(busOut_waitrequest_int_0, 1));
                    busOut_waitrequest_stm <= busOut_waitrequest_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until bus_clk_stm_sig'EVENT and bus_clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for rx_vin_s
        rx_vin_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_ChannelIn_cunroll_x.stm");
            variable in_2_vin_tpl_int_0 : Integer;
            variable in_2_vin_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            rx_vin_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                rx_vin_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to rx_vin_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_rx_vin_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, in_2_vin_tpl_int_0);
                    in_2_vin_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_2_vin_tpl_int_0, 1));
                    rx_vin_s_stm <= in_2_vin_tpl_temp;
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

        -- Generating stimulus for rx_chin_s
        rx_chin_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_ChannelIn_cunroll_x.stm");
            variable in_3_cin_tpl_int_0 : Integer;
            variable in_3_cin_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            rx_chin_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                rx_chin_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to rx_chin_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_rx_chin_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, in_3_cin_tpl_int_0);
                    in_3_cin_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_3_cin_tpl_int_0, 8));
                    rx_chin_s_stm <= in_3_cin_tpl_temp;
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

        -- Generating stimulus for rx_din_im
        rx_din_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_ChannelIn_cunroll_x.stm");
            variable in_1_imag_datain_tpl_int_0 : Integer;
            variable in_1_imag_datain_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            rx_din_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                rx_din_im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to rx_din_im)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_rx_din_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_imag_datain_tpl_int_0);
                    in_1_imag_datain_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_imag_datain_tpl_int_0, 16));
                    rx_din_im_stm <= in_1_imag_datain_tpl_temp;
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

        -- Generating stimulus for rx_din_re
        rx_din_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_ChannelIn_cunroll_x.stm");
            variable in_1_real_datain_tpl_int_0 : Integer;
            variable in_1_real_datain_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            rx_din_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                rx_din_re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to rx_din_re)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_rx_din_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_real_datain_tpl_int_0);
                    in_1_real_datain_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_real_datain_tpl_int_0, 16));
                    rx_din_re_stm <= in_1_real_datain_tpl_temp;
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

        -- Generating stimulus for fft_in_s
        fft_in_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_ChannelIn_cunroll_x.stm");
            variable in_5_fftlen_tpl_int_0 : Integer;
            variable in_5_fftlen_tpl_temp : std_logic_vector(3 downto 0);

        begin
            -- initialize all outputs to 0
            fft_in_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                fft_in_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to fft_in_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_fft_in_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_5_fftlen_tpl_int_0);
                    in_5_fftlen_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(in_5_fftlen_tpl_int_0, 4));
                    fft_in_s_stm <= in_5_fftlen_tpl_temp;
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

        -- Generating stimulus for cp_in_s
        cp_in_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_ChannelIn_cunroll_x.stm");
            variable in_4_CPlen_tpl_int_0 : Integer;
            variable in_4_CPlen_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            cp_in_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                cp_in_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to cp_in_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_cp_in_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_CPlen_tpl_int_0);
                    in_4_CPlen_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_4_CPlen_tpl_int_0, 16));
                    cp_in_s_stm <= in_4_CPlen_tpl_temp;
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

        -- Generating stimulus for nprb_s
        nprb_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_ChannelIn_cunroll_x.stm");
            variable in_8_nprb_in_tpl_int_0 : Integer;
            variable in_8_nprb_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            nprb_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                nprb_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to nprb_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_nprb_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_8_nprb_in_tpl_int_0);
                    in_8_nprb_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_8_nprb_in_tpl_int_0, 16));
                    nprb_s_stm <= in_8_nprb_in_tpl_temp;
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

        -- Generating stimulus for hcs_bypass_s
        hcs_bypass_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_HSC1_1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_Subsystem_channel_HSC1_1_in_cunroll_x.stm");
            variable in_9_hcs_bypass_tpl_int_0 : Integer;
            variable in_9_hcs_bypass_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            hcs_bypass_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                hcs_bypass_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to hcs_bypass_s)
                IF (endfile(data_file_channel_HSC1_1_in_cunroll_x)) THEN
                    clk_hcs_bypass_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_HSC1_1_in_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_9_hcs_bypass_tpl_int_0);
                    in_9_hcs_bypass_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_9_hcs_bypass_tpl_int_0, 1));
                    hcs_bypass_s_stm <= in_9_hcs_bypass_tpl_temp;
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

        -- Generating stimulus for fft_gain_s
        fft_gain_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXGainComp_channel_RXG1_in_cunroll_x.stm");
            variable in_6_fft_gain_re_tpl_int_0 : Integer;
            variable in_6_fft_gain_re_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            fft_gain_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                fft_gain_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to fft_gain_s)
                IF (endfile(data_file_channel_RXG1_in_cunroll_x)) THEN
                    clk_fft_gain_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_in_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_6_fft_gain_re_tpl_int_0);
                    in_6_fft_gain_re_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_6_fft_gain_re_tpl_int_0, 16));
                    fft_gain_s_stm <= in_6_fft_gain_re_tpl_temp;
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

        -- Generating stimulus for fft_gain_im_s
        fft_gain_im_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_in_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXGainComp_channel_RXG1_in_cunroll_x.stm");
            variable in_7_fft_gain_im_tpl_int_0 : Integer;
            variable in_7_fft_gain_im_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            fft_gain_im_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                fft_gain_im_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to fft_gain_im_s)
                IF (endfile(data_file_channel_RXG1_in_cunroll_x)) THEN
                    clk_fft_gain_im_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_in_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_7_fft_gain_im_tpl_int_0);
                    in_7_fft_gain_im_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_7_fft_gain_im_tpl_int_0, 16));
                    fft_gain_im_s_stm <= in_7_fft_gain_im_tpl_temp;
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

        -- Generating stimulus for fft_shift_s
        fft_shift_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXS1_in : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_channel_RXS1_in.stm");
            variable in_6_fft_shift_tpl_int_0 : Integer;
            variable in_6_fft_shift_tpl_temp : std_logic_vector(3 downto 0);

        begin
            -- initialize all outputs to 0
            fft_shift_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                fft_shift_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to fft_shift_s)
                IF (endfile(data_file_channel_RXS1_in)) THEN
                    clk_fft_shift_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXS1_in, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_6_fft_shift_tpl_int_0);
                    in_6_fft_shift_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(in_6_fft_shift_tpl_int_0, 4));
                    fft_shift_s_stm <= in_6_fft_shift_tpl_temp;
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

        -- Generating stimulus for time_ref_in_s
        time_ref_in_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_ChannelIn_cunroll_x.stm");
            variable in_7_time_in_tpl_int_0 : Integer;
            variable in_7_time_in_tpl_int_1 : Integer;
            variable in_7_time_in_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            time_ref_in_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                time_ref_in_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to time_ref_in_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_time_ref_in_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_7_time_in_tpl_int_0);
                    in_7_time_in_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_7_time_in_tpl_int_0, 32));
                    read(L, in_7_time_in_tpl_int_1);
                    in_7_time_in_tpl_temp(63 downto 32) := std_logic_vector(to_signed(in_7_time_in_tpl_int_1, 32));
                    time_ref_in_s_stm <= in_7_time_in_tpl_temp;
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

        -- Generating stimulus for CP_EN_s
        CP_EN_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_6_CP_EN1_tpl_int_0 : Integer;
            variable in_6_CP_EN1_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            CP_EN_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                CP_EN_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to CP_EN_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_CP_EN_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_6_CP_EN1_tpl_int_0);
                    in_6_CP_EN1_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_6_CP_EN1_tpl_int_0, 1));
                    CP_EN_s_stm <= in_6_CP_EN1_tpl_temp;
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

        -- Generating stimulus for sym_metadata_in_s
        sym_metadata_in_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_ChannelIn_cunroll_x.stm");
            variable in_9_sym_metadata_in_tpl_int_0 : Integer;
            variable in_9_sym_metadata_in_tpl_int_1 : Integer;
            variable in_9_sym_metadata_in_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            sym_metadata_in_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                sym_metadata_in_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to sym_metadata_in_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_sym_metadata_in_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
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
                    read(L, in_9_sym_metadata_in_tpl_int_0);
                    in_9_sym_metadata_in_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_9_sym_metadata_in_tpl_int_0, 32));
                    read(L, in_9_sym_metadata_in_tpl_int_1);
                    in_9_sym_metadata_in_tpl_temp(63 downto 32) := std_logic_vector(to_signed(in_9_sym_metadata_in_tpl_int_1, 32));
                    sym_metadata_in_s_stm <= in_9_sym_metadata_in_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for sym_metadata_in_valid_s
        sym_metadata_in_valid_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_ChannelIn_cunroll_x.stm");
            variable in_10_sym_metadata_in_valid_tpl_int_0 : Integer;
            variable in_10_sym_metadata_in_valid_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            sym_metadata_in_valid_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                sym_metadata_in_valid_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to sym_metadata_in_valid_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_sym_metadata_in_valid_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
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
                    read(L, in_10_sym_metadata_in_valid_tpl_int_0);
                    in_10_sym_metadata_in_valid_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_10_sym_metadata_in_valid_tpl_int_0, 1));
                    sym_metadata_in_valid_s_stm <= in_10_sym_metadata_in_valid_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for rx_valid_s
        rx_valid_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen_channel_RXG1_out_cunroll_x.stm");
            variable out_1_vout_tpl_int_0 : Integer;
            variable out_1_vout_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            rx_valid_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to rx_valid_s)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_rx_valid_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, out_1_vout_tpl_int_0);
                    out_1_vout_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_1_vout_tpl_int_0, 1));
                    rx_valid_s_stm <= out_1_vout_tpl_temp;
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

        -- Generating stimulus for rx_chout_s
        rx_chout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen_channel_RXG1_out_cunroll_x.stm");
            variable out_2_chout_tpl_int_0 : Integer;
            variable out_2_chout_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            rx_chout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to rx_chout_s)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_rx_chout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, out_2_chout_tpl_int_0);
                    out_2_chout_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_2_chout_tpl_int_0, 8));
                    rx_chout_s_stm <= out_2_chout_tpl_temp;
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

        -- Generating stimulus for rx_dout_im
        rx_dout_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen_channel_RXG1_out_cunroll_x.stm");
            variable out_3_imag_dout_tpl_int_0 : Integer;
            variable out_3_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            rx_dout_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to rx_dout_im)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_rx_dout_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_3_imag_dout_tpl_int_0);
                    out_3_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_3_imag_dout_tpl_int_0, 16));
                    rx_dout_im_stm <= out_3_imag_dout_tpl_temp;
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

        -- Generating stimulus for rx_dout_re
        rx_dout_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen_channel_RXG1_out_cunroll_x.stm");
            variable out_3_real_dout_tpl_int_0 : Integer;
            variable out_3_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            rx_dout_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to rx_dout_re)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_rx_dout_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_3_real_dout_tpl_int_0);
                    out_3_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_3_real_dout_tpl_int_0, 16));
                    rx_dout_re_stm <= out_3_real_dout_tpl_temp;
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
        -- Driving gnd for rx_time_out_s signals

        rx_time_out_s_stm <= (others => '0');

        -- Generating stimulus for fft_vout_s
        fft_vout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXGainComp_channel_RXG1_out_cunroll_x.stm");
            variable out_1_vout_tpl_int_0 : Integer;
            variable out_1_vout_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            fft_vout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to fft_vout_s)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_fft_vout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, out_1_vout_tpl_int_0);
                    out_1_vout_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_1_vout_tpl_int_0, 1));
                    fft_vout_s_stm <= out_1_vout_tpl_temp;
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

        -- Generating stimulus for fft_chout_s
        fft_chout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXGainComp_channel_RXG1_out_cunroll_x.stm");
            variable out_2_chout_tpl_int_0 : Integer;
            variable out_2_chout_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            fft_chout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to fft_chout_s)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_fft_chout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, out_2_chout_tpl_int_0);
                    out_2_chout_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_2_chout_tpl_int_0, 8));
                    fft_chout_s_stm <= out_2_chout_tpl_temp;
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

        -- Generating stimulus for fft_dout_im
        fft_dout_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXGainComp_channel_RXG1_out_cunroll_x.stm");
            variable out_3_imag_dout_tpl_int_0 : Integer;
            variable out_3_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            fft_dout_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to fft_dout_im)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_fft_dout_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_3_imag_dout_tpl_int_0);
                    out_3_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_3_imag_dout_tpl_int_0, 16));
                    fft_dout_im_stm <= out_3_imag_dout_tpl_temp;
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

        -- Generating stimulus for fft_dout_re
        fft_dout_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXGainComp_channel_RXG1_out_cunroll_x.stm");
            variable out_3_real_dout_tpl_int_0 : Integer;
            variable out_3_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            fft_dout_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to fft_dout_re)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_fft_dout_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_3_real_dout_tpl_int_0);
                    out_3_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_3_real_dout_tpl_int_0, 16));
                    fft_dout_re_stm <= out_3_real_dout_tpl_temp;
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

        -- Generating stimulus for nsc_out_s
        nsc_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXGainComp_channel_RXG1_out_cunroll_x.stm");
            variable out_4_nsc_out_tpl_int_0 : Integer;
            variable out_4_nsc_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            nsc_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to nsc_out_s)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_nsc_out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_nsc_out_tpl_int_0);
                    out_4_nsc_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_4_nsc_out_tpl_int_0, 16));
                    nsc_out_s_stm <= out_4_nsc_out_tpl_temp;
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

        -- Generating stimulus for size_out_s
        size_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXGainComp_channel_RXG1_out_cunroll_x.stm");
            variable out_5_size_out_tpl_int_0 : Integer;
            variable out_5_size_out_tpl_temp : std_logic_vector(3 downto 0);

        begin
            -- initialize all outputs to 0
            size_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to size_out_s)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_size_out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_5_size_out_tpl_int_0);
                    out_5_size_out_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(out_5_size_out_tpl_int_0, 4));
                    size_out_s_stm <= out_5_size_out_tpl_temp;
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

        -- Generating stimulus for td_time_out_s
        td_time_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXGainComp_channel_RXG1_out_cunroll_x.stm");
            variable out_6_time_out_tpl_int_0 : Integer;
            variable out_6_time_out_tpl_int_1 : Integer;
            variable out_6_time_out_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            td_time_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to td_time_out_s)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_td_time_out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_6_time_out_tpl_int_0);
                    out_6_time_out_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_6_time_out_tpl_int_0, 32));
                    read(L, out_6_time_out_tpl_int_1);
                    out_6_time_out_tpl_temp(63 downto 32) := std_logic_vector(to_signed(out_6_time_out_tpl_int_1, 32));
                    td_time_out_s_stm <= out_6_time_out_tpl_temp;
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

        -- Generating stimulus for fd_data_v_s
        fd_data_v_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXS1_out : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_channel_RXS1_out.stm");
            variable out_1_vout_tpl_int_0 : Integer;
            variable out_1_vout_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            fd_data_v_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to fd_data_v_s)
                IF (endfile(data_file_channel_RXS1_out)) THEN
                    clk_fd_data_v_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXS1_out, L);
                    
                    read(L, out_1_vout_tpl_int_0);
                    out_1_vout_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_1_vout_tpl_int_0, 1));
                    fd_data_v_s_stm <= out_1_vout_tpl_temp;
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

        -- Generating stimulus for fd_data_c_s
        fd_data_c_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXS1_out : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_channel_RXS1_out.stm");
            variable out_2_chout_tpl_int_0 : Integer;
            variable out_2_chout_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            fd_data_c_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to fd_data_c_s)
                IF (endfile(data_file_channel_RXS1_out)) THEN
                    clk_fd_data_c_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXS1_out, L);
                    
                    read(L, dummy_int);
                    read(L, out_2_chout_tpl_int_0);
                    out_2_chout_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_2_chout_tpl_int_0, 8));
                    fd_data_c_s_stm <= out_2_chout_tpl_temp;
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

        -- Generating stimulus for fd_data_q_im
        fd_data_q_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXS1_out : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_channel_RXS1_out.stm");
            variable out_3_imag_dout_tpl_int_0 : Integer;
            variable out_3_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            fd_data_q_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to fd_data_q_im)
                IF (endfile(data_file_channel_RXS1_out)) THEN
                    clk_fd_data_q_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXS1_out, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_3_imag_dout_tpl_int_0);
                    out_3_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_3_imag_dout_tpl_int_0, 16));
                    fd_data_q_im_stm <= out_3_imag_dout_tpl_temp;
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

        -- Generating stimulus for fd_data_q_re
        fd_data_q_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXS1_out : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_RXScaling_channel_RXS1_out.stm");
            variable out_3_real_dout_tpl_int_0 : Integer;
            variable out_3_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            fd_data_q_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to fd_data_q_re)
                IF (endfile(data_file_channel_RXS1_out)) THEN
                    clk_fd_data_q_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXS1_out, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_3_real_dout_tpl_int_0);
                    out_3_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_3_real_dout_tpl_int_0, 16));
                    fd_data_q_re_stm <= out_3_real_dout_tpl_temp;
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

        -- Generating stimulus for eAxCout_s
        eAxCout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen_channel_RXG1_out_cunroll_x.stm");
            variable out_4_eAxC_out_tpl_int_0 : Integer;
            variable out_4_eAxC_out_tpl_temp : std_logic_vector(1 downto 0);

        begin
            -- initialize all outputs to 0
            eAxCout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to eAxCout_s)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_eAxCout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_eAxC_out_tpl_int_0);
                    out_4_eAxC_out_tpl_temp(1 downto 0) := std_logic_vector(to_unsigned(out_4_eAxC_out_tpl_int_0, 2));
                    eAxCout_s_stm <= out_4_eAxC_out_tpl_temp;
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
        -- Driving gnd for symmetadataout_s signals

        symmetadataout_s_stm <= (others => '0');

        -- Generating stimulus for eop_eAxC_s
        eop_eAxC_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen_channel_RXG1_out_cunroll_x.stm");
            variable out_5_eop_eAxC_tpl_int_0 : Integer;
            variable out_5_eop_eAxC_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            eop_eAxC_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to eop_eAxC_s)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_eop_eAxC_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_5_eop_eAxC_tpl_int_0);
                    out_5_eop_eAxC_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_5_eop_eAxC_tpl_int_0, 1));
                    eop_eAxC_s_stm <= out_5_eop_eAxC_tpl_temp;
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

        -- Generating stimulus for eop_sym_s
        eop_sym_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen_channel_RXG1_out_cunroll_x.stm");
            variable out_6_eop_sym_tpl_int_0 : Integer;
            variable out_6_eop_sym_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            eop_sym_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to eop_sym_s)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_eop_sym_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_6_eop_sym_tpl_int_0);
                    out_6_eop_sym_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_6_eop_sym_tpl_int_0, 1));
                    eop_sym_s_stm <= out_6_eop_sym_tpl_temp;
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

        -- Generating stimulus for sop_eAxC_s
        sop_eAxC_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen_channel_RXG1_out_cunroll_x.stm");
            variable out_7_sop_eAxC_tpl_int_0 : Integer;
            variable out_7_sop_eAxC_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            sop_eAxC_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to sop_eAxC_s)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_sop_eAxC_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_7_sop_eAxC_tpl_int_0);
                    out_7_sop_eAxC_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_7_sop_eAxC_tpl_int_0, 1));
                    sop_eAxC_s_stm <= out_7_sop_eAxC_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for sop_sym_s
        sop_sym_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_channel_RXG1_out_cunroll_x : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_SOP_EOP_gen_channel_RXG1_out_cunroll_x.stm");
            variable out_8_sop_sym_tpl_int_0 : Integer;
            variable out_8_sop_sym_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            sop_sym_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to sop_sym_s)
                IF (endfile(data_file_channel_RXG1_out_cunroll_x)) THEN
                    clk_sop_sym_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_channel_RXG1_out_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_8_sop_sym_tpl_int_0);
                    out_8_sop_sym_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_8_sop_sym_tpl_int_0, 1));
                    sop_sym_s_stm <= out_8_sop_sym_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Driving gnd for version_out1_s signals

        version_out1_s_stm <= (others => '0');

    clk_stm_sig_stop <= clk_rx_vin_s_stm_sig_stop OR clk_rx_chin_s_stm_sig_stop OR clk_rx_din_im_stm_sig_stop OR clk_rx_din_re_stm_sig_stop OR clk_fft_in_s_stm_sig_stop OR clk_cp_in_s_stm_sig_stop OR clk_nprb_s_stm_sig_stop OR clk_hcs_bypass_s_stm_sig_stop OR clk_fft_gain_s_stm_sig_stop OR clk_fft_gain_im_s_stm_sig_stop OR clk_fft_shift_s_stm_sig_stop OR clk_time_ref_in_s_stm_sig_stop OR clk_DC_SC_EN_s_stm_sig_stop OR clk_CP_EN_s_stm_sig_stop OR clk_ripple_comp_en_s_stm_sig_stop OR clk_rc_bw_sel_s_stm_sig_stop OR clk_sym_metadata_in_s_stm_sig_stop OR clk_sym_metadata_in_valid_s_stm_sig_stop OR clk_rx_valid_s_stm_sig_stop OR clk_rx_chout_s_stm_sig_stop OR clk_rx_dout_im_stm_sig_stop OR clk_rx_dout_re_stm_sig_stop OR clk_fft_vout_s_stm_sig_stop OR clk_fft_chout_s_stm_sig_stop OR clk_fft_dout_im_stm_sig_stop OR clk_fft_dout_re_stm_sig_stop OR clk_nsc_out_s_stm_sig_stop OR clk_size_out_s_stm_sig_stop OR clk_td_time_out_s_stm_sig_stop OR clk_fd_data_v_s_stm_sig_stop OR clk_fd_data_c_s_stm_sig_stop OR clk_fd_data_q_im_stm_sig_stop OR clk_fd_data_q_re_stm_sig_stop OR clk_eAxCout_s_stm_sig_stop OR clk_eop_eAxC_s_stm_sig_stop OR clk_eop_sym_s_stm_sig_stop OR clk_sop_eAxC_s_stm_sig_stop OR clk_sop_sym_s_stm_sig_stop OR '0';
    bus_clk_stm_sig_stop <= bus_clk_busIn_stm_sig_stop OR bus_clk_busOut_stm_sig_stop OR '0';


    END normal;
