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
use std.TextIO.all;
USE work.ifft_blocktostream_DUT_safe_path.all;

entity standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_stm is
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
end standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_stm;

architecture normal of standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';
    signal bus_clk_busIn_stm_sig_stop : std_logic := '0';
    signal clk_valid1_s_stm_sig_stop : std_logic := '0';
    signal clk_ifft_gain_re_l1_s_stm_sig_stop : std_logic := '0';
    signal clk_ifft_gain_im_l1_s_stm_sig_stop : std_logic := '0';
    signal clk_ifft_shift_l1_s_stm_sig_stop : std_logic := '0';
    signal clk_ifft_mux_const_l1_s_stm_sig_stop : std_logic := '0';
    signal clk_muxsel_l1_s_stm_sig_stop : std_logic := '0';
    signal clk_DC_SC_EN_s_stm_sig_stop : std_logic := '0';
    signal clk_data1_im_stm_sig_stop : std_logic := '0';
    signal clk_data1_re_stm_sig_stop : std_logic := '0';
    signal clk_channel1_s_stm_sig_stop : std_logic := '0';
    signal clk_size1_s_stm_sig_stop : std_logic := '0';
    signal clk_nsc1_s_stm_sig_stop : std_logic := '0';
    signal clk_cplen1_s_stm_sig_stop : std_logic := '0';
    signal clk_CP_EN1_s_stm_sig_stop : std_logic := '0';
    signal clk_ripple_comp_en_s_stm_sig_stop : std_logic := '0';
    signal clk_rc_bw_sel_s_stm_sig_stop : std_logic := '0';
    signal clk_timeref_in_s_stm_sig_stop : std_logic := '0';
    signal clk_vout2_s_stm_sig_stop : std_logic := '0';
    signal clk_cout2_s_stm_sig_stop : std_logic := '0';
    signal clk_dout2_im_stm_sig_stop : std_logic := '0';
    signal clk_dout2_re_stm_sig_stop : std_logic := '0';
    signal clk_td_ifft_out_d_im_stm_sig_stop : std_logic := '0';
    signal clk_td_ifft_out_d_re_stm_sig_stop : std_logic := '0';
    signal clk_td_ifft_out_ch_s_stm_sig_stop : std_logic := '0';
    signal clk_td_ifft_out_v_s_stm_sig_stop : std_logic := '0';
    signal clk_ifft_size_out_s_stm_sig_stop : std_logic := '0';
    signal clk_ifft_nprb_out_s_stm_sig_stop : std_logic := '0';
    signal clk_ifft_cp_out_s_stm_sig_stop : std_logic := '0';
    signal clk_fd_data_v_s_stm_sig_stop : std_logic := '0';
    signal clk_fd_data_c_s_stm_sig_stop : std_logic := '0';
    signal clk_fd_data_q_im_stm_sig_stop : std_logic := '0';
    signal clk_fd_data_q_re_stm_sig_stop : std_logic := '0';
    signal clk_fd_timeref_out_s_stm_sig_stop : std_logic := '0';

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
            file data_file_busIn : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_busIn.stm");
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

        -- Generating stimulus for valid1_s
        valid1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_1_v_tpl_int_0 : Integer;
            variable in_1_v_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            valid1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                valid1_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to valid1_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_valid1_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, in_1_v_tpl_int_0);
                    in_1_v_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_1_v_tpl_int_0, 1));
                    valid1_s_stm <= in_1_v_tpl_temp;
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

        -- Generating stimulus for ifft_gain_re_l1_s
        ifft_gain_re_l1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_ChannelIn_cunroll_x.stm");
            variable in_8_iftgain_real_tpl_int_0 : Integer;
            variable in_8_iftgain_real_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            ifft_gain_re_l1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                ifft_gain_re_l1_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to ifft_gain_re_l1_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_ifft_gain_re_l1_s_stm_sig_stop <= '1';
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
                    read(L, in_8_iftgain_real_tpl_int_0);
                    in_8_iftgain_real_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_8_iftgain_real_tpl_int_0, 16));
                    ifft_gain_re_l1_s_stm <= in_8_iftgain_real_tpl_temp;
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

        -- Generating stimulus for ifft_gain_im_l1_s
        ifft_gain_im_l1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_ChannelIn_cunroll_x.stm");
            variable in_9_ifftgain_imag_tpl_int_0 : Integer;
            variable in_9_ifftgain_imag_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            ifft_gain_im_l1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                ifft_gain_im_l1_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to ifft_gain_im_l1_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_ifft_gain_im_l1_s_stm_sig_stop <= '1';
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
                    read(L, in_9_ifftgain_imag_tpl_int_0);
                    in_9_ifftgain_imag_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_9_ifftgain_imag_tpl_int_0, 16));
                    ifft_gain_im_l1_s_stm <= in_9_ifftgain_imag_tpl_temp;
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

        -- Generating stimulus for ifft_shift_l1_s
        ifft_shift_l1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_ChannelIn_cunroll_x.stm");
            variable in_10_ifftshift_tpl_int_0 : Integer;
            variable in_10_ifftshift_tpl_temp : std_logic_vector(3 downto 0);

        begin
            -- initialize all outputs to 0
            ifft_shift_l1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                ifft_shift_l1_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to ifft_shift_l1_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_ifft_shift_l1_s_stm_sig_stop <= '1';
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
                    read(L, in_10_ifftshift_tpl_int_0);
                    in_10_ifftshift_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(in_10_ifftshift_tpl_int_0, 4));
                    ifft_shift_l1_s_stm <= in_10_ifftshift_tpl_temp;
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

        -- Generating stimulus for ifft_mux_const_l1_s
        ifft_mux_const_l1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_ChannelIn_cunroll_x.stm");
            variable in_11_ifft_mux_const_data_tpl_int_0 : Integer;
            variable in_11_ifft_mux_const_data_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            ifft_mux_const_l1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                ifft_mux_const_l1_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to ifft_mux_const_l1_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_ifft_mux_const_l1_s_stm_sig_stop <= '1';
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
                    read(L, in_11_ifft_mux_const_data_tpl_int_0);
                    in_11_ifft_mux_const_data_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_11_ifft_mux_const_data_tpl_int_0, 16));
                    ifft_mux_const_l1_s_stm <= in_11_ifft_mux_const_data_tpl_temp;
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

        -- Generating stimulus for muxsel_l1_s
        muxsel_l1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_ChannelIn_cunroll_x.stm");
            variable in_12_muxsel_tpl_int_0 : Integer;
            variable in_12_muxsel_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            muxsel_l1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                muxsel_l1_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to muxsel_l1_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_muxsel_l1_s_stm_sig_stop <= '1';
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
                    read(L, in_12_muxsel_tpl_int_0);
                    in_12_muxsel_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_12_muxsel_tpl_int_0, 1));
                    muxsel_l1_s_stm <= in_12_muxsel_tpl_temp;
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
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_ChannelIn_cunroll_x.stm");
            variable in_7_DC_SC_EN1_tpl_int_0 : Integer;
            variable in_7_DC_SC_EN1_tpl_temp : std_logic_vector(0 downto 0);

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
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_DC_SC_EN_s_stm_sig_stop <= '1';
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
                    read(L, in_7_DC_SC_EN1_tpl_int_0);
                    in_7_DC_SC_EN1_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_7_DC_SC_EN1_tpl_int_0, 1));
                    DC_SC_EN_s_stm <= in_7_DC_SC_EN1_tpl_temp;
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

        -- Generating stimulus for data1_im
        data1_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_3_imag_d1_tpl_int_0 : Integer;
            variable in_3_imag_d1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            data1_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                data1_im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to data1_im)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_data1_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_3_imag_d1_tpl_int_0);
                    in_3_imag_d1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_imag_d1_tpl_int_0, 16));
                    data1_im_stm <= in_3_imag_d1_tpl_temp;
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

        -- Generating stimulus for data1_re
        data1_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_3_real_d1_tpl_int_0 : Integer;
            variable in_3_real_d1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            data1_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                data1_re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to data1_re)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_data1_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_3_real_d1_tpl_int_0);
                    in_3_real_d1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_real_d1_tpl_int_0, 16));
                    data1_re_stm <= in_3_real_d1_tpl_temp;
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

        -- Generating stimulus for channel1_s
        channel1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_2_c_tpl_int_0 : Integer;
            variable in_2_c_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            channel1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                channel1_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to channel1_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_channel1_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, in_2_c_tpl_int_0);
                    in_2_c_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_2_c_tpl_int_0, 8));
                    channel1_s_stm <= in_2_c_tpl_temp;
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

        -- Generating stimulus for size1_s
        size1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_7_fft_size_tpl_int_0 : Integer;
            variable in_7_fft_size_tpl_temp : std_logic_vector(3 downto 0);

        begin
            -- initialize all outputs to 0
            size1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                size1_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to size1_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_size1_s_stm_sig_stop <= '1';
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
                    read(L, in_7_fft_size_tpl_int_0);
                    in_7_fft_size_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(in_7_fft_size_tpl_int_0, 4));
                    size1_s_stm <= in_7_fft_size_tpl_temp;
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

        -- Generating stimulus for nsc1_s
        nsc1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_9_nsc_tpl_int_0 : Integer;
            variable in_9_nsc_tpl_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            nsc1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                nsc1_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to nsc1_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_nsc1_s_stm_sig_stop <= '1';
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
                    read(L, in_9_nsc_tpl_int_0);
                    in_9_nsc_tpl_temp(11 downto 0) := std_logic_vector(to_unsigned(in_9_nsc_tpl_int_0, 12));
                    nsc1_s_stm <= in_9_nsc_tpl_temp;
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

        -- Generating stimulus for cplen1_s
        cplen1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_8_CPLen_tpl_int_0 : Integer;
            variable in_8_CPLen_tpl_temp : std_logic_vector(10 downto 0);

        begin
            -- initialize all outputs to 0
            cplen1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                cplen1_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to cplen1_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_cplen1_s_stm_sig_stop <= '1';
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
                    read(L, in_8_CPLen_tpl_int_0);
                    in_8_CPLen_tpl_temp(10 downto 0) := std_logic_vector(to_unsigned(in_8_CPLen_tpl_int_0, 11));
                    cplen1_s_stm <= in_8_CPLen_tpl_temp;
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

        -- Generating stimulus for CP_EN1_s
        CP_EN1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_6_CP_EN1_tpl_int_0 : Integer;
            variable in_6_CP_EN1_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            CP_EN1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                CP_EN1_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to CP_EN1_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_CP_EN1_s_stm_sig_stop <= '1';
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
                    CP_EN1_s_stm <= in_6_CP_EN1_tpl_temp;
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
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ChannelIn_cunroll_x.stm");
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
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_ripple_comp_en_s_stm_sig_stop <= '1';
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
                    read(L, in_8_ripple_comp_en_tpl_int_0);
                    in_8_ripple_comp_en_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_8_ripple_comp_en_tpl_int_0, 1));
                    ripple_comp_en_s_stm <= in_8_ripple_comp_en_tpl_temp;
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
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ChannelIn_cunroll_x.stm");
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
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_rc_bw_sel_s_stm_sig_stop <= '1';
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
                    read(L, in_9_rc_bw_sel_tpl_int_0);
                    in_9_rc_bw_sel_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_9_rc_bw_sel_tpl_int_0, 1));
                    rc_bw_sel_s_stm <= in_9_rc_bw_sel_tpl_temp;
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

        -- Generating stimulus for timeref_in_s
        timeref_in_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_12_ul_timerefin_tpl_int_0 : Integer;
            variable in_12_ul_timerefin_tpl_int_1 : Integer;
            variable in_12_ul_timerefin_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            timeref_in_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                timeref_in_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to timeref_in_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_timeref_in_s_stm_sig_stop <= '1';
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
                    read(L, in_12_ul_timerefin_tpl_int_0);
                    in_12_ul_timerefin_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_12_ul_timerefin_tpl_int_0, 32));
                    read(L, in_12_ul_timerefin_tpl_int_1);
                    in_12_ul_timerefin_tpl_temp(63 downto 32) := std_logic_vector(to_signed(in_12_ul_timerefin_tpl_int_1, 32));
                    timeref_in_s_stm <= in_12_ul_timerefin_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for vout2_s
        vout2_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_GPOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_GPOut_cunroll_x.stm");
            variable out_1_vout_tpl_int_0 : Integer;
            variable out_1_vout_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            vout2_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to vout2_s)
                IF (endfile(data_file_GPOut_cunroll_x)) THEN
                    clk_vout2_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_GPOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_vout_tpl_int_0);
                    out_1_vout_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_1_vout_tpl_int_0, 1));
                    vout2_s_stm <= out_1_vout_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for cout2_s
        cout2_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_GPOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_GPOut_cunroll_x.stm");
            variable out_2_cout_tpl_int_0 : Integer;
            variable out_2_cout_tpl_temp : std_logic_vector(1 downto 0);

        begin
            -- initialize all outputs to 0
            cout2_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to cout2_s)
                IF (endfile(data_file_GPOut_cunroll_x)) THEN
                    clk_cout2_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_GPOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_2_cout_tpl_int_0);
                    out_2_cout_tpl_temp(1 downto 0) := std_logic_vector(to_unsigned(out_2_cout_tpl_int_0, 2));
                    cout2_s_stm <= out_2_cout_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for dout2_im
        dout2_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_GPOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_GPOut_cunroll_x.stm");
            variable out_3_imag_q_tpl_int_0 : Integer;
            variable out_3_imag_q_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout2_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout2_im)
                IF (endfile(data_file_GPOut_cunroll_x)) THEN
                    clk_dout2_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_GPOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, out_3_imag_q_tpl_int_0);
                    out_3_imag_q_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_3_imag_q_tpl_int_0, 16));
                    dout2_im_stm <= out_3_imag_q_tpl_temp;
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

        -- Generating stimulus for dout2_re
        dout2_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_GPOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_GPOut_cunroll_x.stm");
            variable out_3_real_q_tpl_int_0 : Integer;
            variable out_3_real_q_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout2_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout2_re)
                IF (endfile(data_file_GPOut_cunroll_x)) THEN
                    clk_dout2_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_GPOut_cunroll_x, L);
                    
                    read(L, out_3_real_q_tpl_int_0);
                    out_3_real_q_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_3_real_q_tpl_int_0, 16));
                    dout2_re_stm <= out_3_real_q_tpl_temp;
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

        -- Generating stimulus for td_ifft_out_d_im
        td_ifft_out_d_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp_ChannelOut_cunroll_x.stm");
            variable out_3_imag_dout_tpl_int_0 : Integer;
            variable out_3_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            td_ifft_out_d_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to td_ifft_out_d_im)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_td_ifft_out_d_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_3_imag_dout_tpl_int_0);
                    out_3_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_3_imag_dout_tpl_int_0, 16));
                    td_ifft_out_d_im_stm <= out_3_imag_dout_tpl_temp;
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

        -- Generating stimulus for td_ifft_out_d_re
        td_ifft_out_d_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp_ChannelOut_cunroll_x.stm");
            variable out_3_real_dout_tpl_int_0 : Integer;
            variable out_3_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            td_ifft_out_d_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to td_ifft_out_d_re)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_td_ifft_out_d_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_3_real_dout_tpl_int_0);
                    out_3_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_3_real_dout_tpl_int_0, 16));
                    td_ifft_out_d_re_stm <= out_3_real_dout_tpl_temp;
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

        -- Generating stimulus for td_ifft_out_ch_s
        td_ifft_out_ch_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp_ChannelOut_cunroll_x.stm");
            variable out_2_chout_tpl_int_0 : Integer;
            variable out_2_chout_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            td_ifft_out_ch_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to td_ifft_out_ch_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_td_ifft_out_ch_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, out_2_chout_tpl_int_0);
                    out_2_chout_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_2_chout_tpl_int_0, 8));
                    td_ifft_out_ch_s_stm <= out_2_chout_tpl_temp;
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

        -- Generating stimulus for td_ifft_out_v_s
        td_ifft_out_v_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp_ChannelOut_cunroll_x.stm");
            variable out_1_vout_tpl_int_0 : Integer;
            variable out_1_vout_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            td_ifft_out_v_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to td_ifft_out_v_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_td_ifft_out_v_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, out_1_vout_tpl_int_0);
                    out_1_vout_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_1_vout_tpl_int_0, 1));
                    td_ifft_out_v_s_stm <= out_1_vout_tpl_temp;
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

        -- Generating stimulus for ifft_size_out_s
        ifft_size_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp_ChannelOut_cunroll_x.stm");
            variable out_4_size_out_tpl_int_0 : Integer;
            variable out_4_size_out_tpl_temp : std_logic_vector(3 downto 0);

        begin
            -- initialize all outputs to 0
            ifft_size_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to ifft_size_out_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_ifft_size_out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_size_out_tpl_int_0);
                    out_4_size_out_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(out_4_size_out_tpl_int_0, 4));
                    ifft_size_out_s_stm <= out_4_size_out_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for ifft_nprb_out_s
        ifft_nprb_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_ChannelOut_cunroll_x.stm");
            variable out_5_q_nprb_tpl_int_0 : Integer;
            variable out_5_q_nprb_tpl_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            ifft_nprb_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to ifft_nprb_out_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_ifft_nprb_out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_5_q_nprb_tpl_int_0);
                    out_5_q_nprb_tpl_temp(11 downto 0) := std_logic_vector(to_unsigned(out_5_q_nprb_tpl_int_0, 12));
                    ifft_nprb_out_s_stm <= out_5_q_nprb_tpl_temp;
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

        -- Generating stimulus for ifft_cp_out_s
        ifft_cp_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp_ChannelOut_cunroll_x.stm");
            variable out_5_cplen_out_tpl_int_0 : Integer;
            variable out_5_cplen_out_tpl_temp : std_logic_vector(10 downto 0);

        begin
            -- initialize all outputs to 0
            ifft_cp_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to ifft_cp_out_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_ifft_cp_out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_5_cplen_out_tpl_int_0);
                    out_5_cplen_out_tpl_temp(10 downto 0) := std_logic_vector(to_unsigned(out_5_cplen_out_tpl_int_0, 11));
                    ifft_cp_out_s_stm <= out_5_cplen_out_tpl_temp;

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
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ChannelOut_cunroll_x.stm");
            variable out_1_qv_tpl_int_0 : Integer;
            variable out_1_qv_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            fd_data_v_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to fd_data_v_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_fd_data_v_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, out_1_qv_tpl_int_0);
                    out_1_qv_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_1_qv_tpl_int_0, 1));
                    fd_data_v_s_stm <= out_1_qv_tpl_temp;
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
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ChannelOut_cunroll_x.stm");
            variable out_2_qc_tpl_int_0 : Integer;
            variable out_2_qc_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            fd_data_c_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to fd_data_c_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_fd_data_c_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, out_2_qc_tpl_int_0);
                    out_2_qc_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_2_qc_tpl_int_0, 8));
                    fd_data_c_s_stm <= out_2_qc_tpl_temp;
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
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ChannelOut_cunroll_x.stm");
            variable out_7_imag_q_rc_off_tpl_int_0 : Integer;
            variable out_7_imag_q_rc_off_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            fd_data_q_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to fd_data_q_im)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_fd_data_q_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_7_imag_q_rc_off_tpl_int_0);
                    out_7_imag_q_rc_off_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_7_imag_q_rc_off_tpl_int_0, 16));
                    fd_data_q_im_stm <= out_7_imag_q_rc_off_tpl_temp;
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
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ChannelOut_cunroll_x.stm");
            variable out_7_real_q_rc_off_tpl_int_0 : Integer;
            variable out_7_real_q_rc_off_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            fd_data_q_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to fd_data_q_re)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_fd_data_q_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_7_real_q_rc_off_tpl_int_0);
                    out_7_real_q_rc_off_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_7_real_q_rc_off_tpl_int_0, 16));
                    fd_data_q_re_stm <= out_7_real_q_rc_off_tpl_temp;
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

        -- Generating stimulus for fd_timeref_out_s
        fd_timeref_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ChannelOut_cunroll_x.stm");
            variable out_8_fd_time_out_tpl_int_0 : Integer;
            variable out_8_fd_time_out_tpl_int_1 : Integer;
            variable out_8_fd_time_out_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            fd_timeref_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to fd_timeref_out_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_fd_timeref_out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_8_fd_time_out_tpl_int_0);
                    out_8_fd_time_out_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_8_fd_time_out_tpl_int_0, 32));
                    read(L, out_8_fd_time_out_tpl_int_1);
                    out_8_fd_time_out_tpl_temp(63 downto 32) := std_logic_vector(to_signed(out_8_fd_time_out_tpl_int_1, 32));
                    fd_timeref_out_s_stm <= out_8_fd_time_out_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Driving gnd for version_out_s signals

        version_out_s_stm <= (others => '0');

    clk_stm_sig_stop <= clk_valid1_s_stm_sig_stop OR clk_ifft_gain_re_l1_s_stm_sig_stop OR clk_ifft_gain_im_l1_s_stm_sig_stop OR clk_ifft_shift_l1_s_stm_sig_stop OR clk_ifft_mux_const_l1_s_stm_sig_stop OR clk_muxsel_l1_s_stm_sig_stop OR clk_DC_SC_EN_s_stm_sig_stop OR clk_data1_im_stm_sig_stop OR clk_data1_re_stm_sig_stop OR clk_channel1_s_stm_sig_stop OR clk_size1_s_stm_sig_stop OR clk_nsc1_s_stm_sig_stop OR clk_cplen1_s_stm_sig_stop OR clk_CP_EN1_s_stm_sig_stop OR clk_ripple_comp_en_s_stm_sig_stop OR clk_rc_bw_sel_s_stm_sig_stop OR clk_timeref_in_s_stm_sig_stop OR clk_vout2_s_stm_sig_stop OR clk_cout2_s_stm_sig_stop OR clk_dout2_im_stm_sig_stop OR clk_dout2_re_stm_sig_stop OR clk_td_ifft_out_d_im_stm_sig_stop OR clk_td_ifft_out_d_re_stm_sig_stop OR clk_td_ifft_out_ch_s_stm_sig_stop OR clk_td_ifft_out_v_s_stm_sig_stop OR clk_ifft_size_out_s_stm_sig_stop OR clk_ifft_nprb_out_s_stm_sig_stop OR clk_ifft_cp_out_s_stm_sig_stop OR clk_fd_data_v_s_stm_sig_stop OR clk_fd_data_c_s_stm_sig_stop OR clk_fd_data_q_im_stm_sig_stop OR clk_fd_data_q_re_stm_sig_stop OR clk_fd_timeref_out_s_stm_sig_stop OR '0';
    bus_clk_stm_sig_stop <= bus_clk_busIn_stm_sig_stop OR '0';


    END normal;
