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

-- VHDL created from standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate
-- VHDL created on Thu Jun 12 21:17:48 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.ifft_blocktostream_DUT_safe_path.all;

entity standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_stm is
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
        d1_im_stm : out std_logic_vector(15 downto 0);
        d1_re_stm : out std_logic_vector(15 downto 0);
        Tsym1_s_stm : out std_logic_vector(15 downto 0);
        cp_T1_s_stm : out std_logic_vector(15 downto 0);
        CP_EN1_s_stm : out std_logic_vector(0 downto 0);
        fft_size_s_stm : out std_logic_vector(3 downto 0);
        CPLen_s_stm : out std_logic_vector(10 downto 0);
        nsc_s_stm : out std_logic_vector(11 downto 0);
        eAxC_s_stm : out std_logic_vector(0 downto 0);
        sym_metadata_s_stm : out std_logic_vector(0 downto 0);
        ul_timerefin_s_stm : out std_logic_vector(63 downto 0);
        dout1_im_stm : out std_logic_vector(15 downto 0);
        dout1_re_stm : out std_logic_vector(15 downto 0);
        vout_s_stm : out std_logic_vector(0 downto 0);
        cout_s_stm : out std_logic_vector(7 downto 0);
        sin_s_stm : out std_logic_vector(17 downto 0);
        cos_s_stm : out std_logic_vector(17 downto 0);
        fft_size_out_s_stm : out std_logic_vector(3 downto 0);
        CPLenout_s_stm : out std_logic_vector(10 downto 0);
        nsc_out_s_stm : out std_logic_vector(11 downto 0);
        eAxC_out_s_stm : out std_logic_vector(0 downto 0);
        sym_metadata_out_s_stm : out std_logic_vector(0 downto 0);
        ul_timeref_out_s_stm : out std_logic_vector(63 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_stm;

architecture normal of standaloneTopLevel_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';
    signal bus_clk_busIn_stm_sig_stop : std_logic := '0';
    signal clk_v_s_stm_sig_stop : std_logic := '0';
    signal clk_c_s_stm_sig_stop : std_logic := '0';
    signal clk_d1_im_stm_sig_stop : std_logic := '0';
    signal clk_d1_re_stm_sig_stop : std_logic := '0';
    signal clk_Tsym1_s_stm_sig_stop : std_logic := '0';
    signal clk_cp_T1_s_stm_sig_stop : std_logic := '0';
    signal clk_CP_EN1_s_stm_sig_stop : std_logic := '0';
    signal clk_fft_size_s_stm_sig_stop : std_logic := '0';
    signal clk_CPLen_s_stm_sig_stop : std_logic := '0';
    signal clk_nsc_s_stm_sig_stop : std_logic := '0';
    signal clk_eAxC_s_stm_sig_stop : std_logic := '0';
    signal clk_sym_metadata_s_stm_sig_stop : std_logic := '0';
    signal clk_ul_timerefin_s_stm_sig_stop : std_logic := '0';
    signal clk_dout1_im_stm_sig_stop : std_logic := '0';
    signal clk_dout1_re_stm_sig_stop : std_logic := '0';
    signal clk_vout_s_stm_sig_stop : std_logic := '0';
    signal clk_cout_s_stm_sig_stop : std_logic := '0';
    signal clk_sin_s_stm_sig_stop : std_logic := '0';
    signal clk_cos_s_stm_sig_stop : std_logic := '0';
    signal clk_fft_size_out_s_stm_sig_stop : std_logic := '0';
    signal clk_CPLenout_s_stm_sig_stop : std_logic := '0';
    signal clk_nsc_out_s_stm_sig_stop : std_logic := '0';
    signal clk_eAxC_out_s_stm_sig_stop : std_logic := '0';
    signal clk_sym_metadata_out_s_stm_sig_stop : std_logic := '0';
    signal clk_ul_timeref_out_s_stm_sig_stop : std_logic := '0';

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

        -- Generating stimulus for v_s
        v_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
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
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_v_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
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
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
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
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_c_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
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

        -- Generating stimulus for d1_im
        d1_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_3_imag_d1_tpl_int_0 : Integer;
            variable in_3_imag_d1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            d1_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                d1_im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to d1_im)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_d1_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_3_imag_d1_tpl_int_0);
                    in_3_imag_d1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_imag_d1_tpl_int_0, 16));
                    d1_im_stm <= in_3_imag_d1_tpl_temp;
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

        -- Generating stimulus for d1_re
        d1_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_3_real_d1_tpl_int_0 : Integer;
            variable in_3_real_d1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            d1_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                d1_re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to d1_re)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_d1_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_3_real_d1_tpl_int_0);
                    in_3_real_d1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_real_d1_tpl_int_0, 16));
                    d1_re_stm <= in_3_real_d1_tpl_temp;
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

        -- Generating stimulus for Tsym1_s
        Tsym1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_4_Tsym1_tpl_int_0 : Integer;
            variable in_4_Tsym1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            Tsym1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                Tsym1_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to Tsym1_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_Tsym1_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_Tsym1_tpl_int_0);
                    in_4_Tsym1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_4_Tsym1_tpl_int_0, 16));
                    Tsym1_s_stm <= in_4_Tsym1_tpl_temp;
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

        -- Generating stimulus for cp_T1_s
        cp_T1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_5_cp_T1_tpl_int_0 : Integer;
            variable in_5_cp_T1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            cp_T1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                cp_T1_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to cp_T1_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_cp_T1_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_5_cp_T1_tpl_int_0);
                    in_5_cp_T1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_5_cp_T1_tpl_int_0, 16));
                    cp_T1_s_stm <= in_5_cp_T1_tpl_temp;
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

        -- Generating stimulus for fft_size_s
        fft_size_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_7_fft_size_tpl_int_0 : Integer;
            variable in_7_fft_size_tpl_temp : std_logic_vector(3 downto 0);

        begin
            -- initialize all outputs to 0
            fft_size_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                fft_size_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to fft_size_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_fft_size_s_stm_sig_stop <= '1';
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
                    fft_size_s_stm <= in_7_fft_size_tpl_temp;
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

        -- Generating stimulus for CPLen_s
        CPLen_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_8_CPLen_tpl_int_0 : Integer;
            variable in_8_CPLen_tpl_temp : std_logic_vector(10 downto 0);

        begin
            -- initialize all outputs to 0
            CPLen_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                CPLen_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to CPLen_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_CPLen_s_stm_sig_stop <= '1';
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
                    CPLen_s_stm <= in_8_CPLen_tpl_temp;
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

        -- Generating stimulus for nsc_s
        nsc_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_9_nsc_tpl_int_0 : Integer;
            variable in_9_nsc_tpl_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            nsc_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                nsc_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to nsc_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_nsc_s_stm_sig_stop <= '1';
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
                    nsc_s_stm <= in_9_nsc_tpl_temp;
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

        -- Generating stimulus for eAxC_s
        eAxC_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_10_eAxC_tpl_int_0 : Integer;
            variable in_10_eAxC_tpl_temp : std_logic_vector(0 downto 0);

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
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_eAxC_s_stm_sig_stop <= '1';
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
                    read(L, in_10_eAxC_tpl_int_0);
                    in_10_eAxC_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_10_eAxC_tpl_int_0, 1));
                    eAxC_s_stm <= in_10_eAxC_tpl_temp;
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

        -- Generating stimulus for sym_metadata_s
        sym_metadata_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_11_sym_metadata_tpl_int_0 : Integer;
            variable in_11_sym_metadata_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            sym_metadata_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                sym_metadata_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to sym_metadata_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_sym_metadata_s_stm_sig_stop <= '1';
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
                    read(L, in_11_sym_metadata_tpl_int_0);
                    in_11_sym_metadata_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_11_sym_metadata_tpl_int_0, 1));
                    sym_metadata_s_stm <= in_11_sym_metadata_tpl_temp;
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

        -- Generating stimulus for ul_timerefin_s
        ul_timerefin_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelIn_cunroll_x.stm");
            variable in_12_ul_timerefin_tpl_int_0 : Integer;
            variable in_12_ul_timerefin_tpl_int_1 : Integer;
            variable in_12_ul_timerefin_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            ul_timerefin_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                ul_timerefin_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to ul_timerefin_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_ul_timerefin_s_stm_sig_stop <= '1';
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
                    ul_timerefin_s_stm <= in_12_ul_timerefin_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for dout1_im
        dout1_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelOut_cunroll_x.stm");
            variable out_1_imag_dout1_tpl_int_0 : Integer;
            variable out_1_imag_dout1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout1_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout1_im)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_dout1_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_imag_dout1_tpl_int_0);
                    out_1_imag_dout1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_imag_dout1_tpl_int_0, 16));
                    dout1_im_stm <= out_1_imag_dout1_tpl_temp;
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

        -- Generating stimulus for dout1_re
        dout1_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelOut_cunroll_x.stm");
            variable out_1_real_dout1_tpl_int_0 : Integer;
            variable out_1_real_dout1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout1_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout1_re)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_dout1_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_real_dout1_tpl_int_0);
                    out_1_real_dout1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_real_dout1_tpl_int_0, 16));
                    dout1_re_stm <= out_1_real_dout1_tpl_temp;
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

        -- Generating stimulus for vout_s
        vout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelOut_cunroll_x.stm");
            variable out_2_vout_tpl_int_0 : Integer;
            variable out_2_vout_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            vout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to vout_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_vout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, out_2_vout_tpl_int_0);
                    out_2_vout_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_2_vout_tpl_int_0, 1));
                    vout_s_stm <= out_2_vout_tpl_temp;
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

        -- Generating stimulus for cout_s
        cout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelOut_cunroll_x.stm");
            variable out_3_cout_tpl_int_0 : Integer;
            variable out_3_cout_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            cout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to cout_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_cout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, out_3_cout_tpl_int_0);
                    out_3_cout_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_3_cout_tpl_int_0, 8));
                    cout_s_stm <= out_3_cout_tpl_temp;
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

        -- Generating stimulus for sin_s
        sin_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelOut_cunroll_x.stm");
            variable out_4_sin_tpl_int_0 : Integer;
            variable out_4_sin_tpl_temp : std_logic_vector(17 downto 0);

        begin
            -- initialize all outputs to 0
            sin_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to sin_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_sin_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_sin_tpl_int_0);
                    out_4_sin_tpl_temp(17 downto 0) := std_logic_vector(to_unsigned(out_4_sin_tpl_int_0, 18));
                    sin_s_stm <= out_4_sin_tpl_temp;
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

        -- Generating stimulus for cos_s
        cos_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelOut_cunroll_x.stm");
            variable out_5_cos_tpl_int_0 : Integer;
            variable out_5_cos_tpl_temp : std_logic_vector(17 downto 0);

        begin
            -- initialize all outputs to 0
            cos_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to cos_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_cos_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_5_cos_tpl_int_0);
                    out_5_cos_tpl_temp(17 downto 0) := std_logic_vector(to_unsigned(out_5_cos_tpl_int_0, 18));
                    cos_s_stm <= out_5_cos_tpl_temp;
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

        -- Generating stimulus for fft_size_out_s
        fft_size_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelOut_cunroll_x.stm");
            variable out_6_fft_size_out_tpl_int_0 : Integer;
            variable out_6_fft_size_out_tpl_temp : std_logic_vector(3 downto 0);

        begin
            -- initialize all outputs to 0
            fft_size_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to fft_size_out_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_fft_size_out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_6_fft_size_out_tpl_int_0);
                    out_6_fft_size_out_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(out_6_fft_size_out_tpl_int_0, 4));
                    fft_size_out_s_stm <= out_6_fft_size_out_tpl_temp;
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

        -- Generating stimulus for CPLenout_s
        CPLenout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelOut_cunroll_x.stm");
            variable out_7_CPLenout_tpl_int_0 : Integer;
            variable out_7_CPLenout_tpl_temp : std_logic_vector(10 downto 0);

        begin
            -- initialize all outputs to 0
            CPLenout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to CPLenout_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_CPLenout_s_stm_sig_stop <= '1';
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
                    read(L, out_7_CPLenout_tpl_int_0);
                    out_7_CPLenout_tpl_temp(10 downto 0) := std_logic_vector(to_unsigned(out_7_CPLenout_tpl_int_0, 11));
                    CPLenout_s_stm <= out_7_CPLenout_tpl_temp;
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
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelOut_cunroll_x.stm");
            variable out_8_nsc_out_tpl_int_0 : Integer;
            variable out_8_nsc_out_tpl_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            nsc_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to nsc_out_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_nsc_out_s_stm_sig_stop <= '1';
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
                    read(L, out_8_nsc_out_tpl_int_0);
                    out_8_nsc_out_tpl_temp(11 downto 0) := std_logic_vector(to_unsigned(out_8_nsc_out_tpl_int_0, 12));
                    nsc_out_s_stm <= out_8_nsc_out_tpl_temp;
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

        -- Generating stimulus for eAxC_out_s
        eAxC_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelOut_cunroll_x.stm");
            variable out_9_eAxC_out_tpl_int_0 : Integer;
            variable out_9_eAxC_out_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            eAxC_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to eAxC_out_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_eAxC_out_s_stm_sig_stop <= '1';
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
                    read(L, out_9_eAxC_out_tpl_int_0);
                    out_9_eAxC_out_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_9_eAxC_out_tpl_int_0, 1));
                    eAxC_out_s_stm <= out_9_eAxC_out_tpl_temp;
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

        -- Generating stimulus for sym_metadata_out_s
        sym_metadata_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelOut_cunroll_x.stm");
            variable out_10_sym_metadata_out_tpl_int_0 : Integer;
            variable out_10_sym_metadata_out_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            sym_metadata_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to sym_metadata_out_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_sym_metadata_out_s_stm_sig_stop <= '1';
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
                    read(L, dummy_int);
                    read(L, out_10_sym_metadata_out_tpl_int_0);
                    out_10_sym_metadata_out_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_10_sym_metadata_out_tpl_int_0, 1));
                    sym_metadata_out_s_stm <= out_10_sym_metadata_out_tpl_temp;
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

        -- Generating stimulus for ul_timeref_out_s
        ul_timeref_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("ifft_blocktostream/ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_ChannelOut_cunroll_x.stm");
            variable out_11_ul_timeref_out_tpl_int_0 : Integer;
            variable out_11_ul_timeref_out_tpl_int_1 : Integer;
            variable out_11_ul_timeref_out_tpl_temp : std_logic_vector(63 downto 0);

        begin
            -- initialize all outputs to 0
            ul_timeref_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to ul_timeref_out_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_ul_timeref_out_s_stm_sig_stop <= '1';
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
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_11_ul_timeref_out_tpl_int_0);
                    out_11_ul_timeref_out_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_11_ul_timeref_out_tpl_int_0, 32));
                    read(L, out_11_ul_timeref_out_tpl_int_1);
                    out_11_ul_timeref_out_tpl_temp(63 downto 32) := std_logic_vector(to_signed(out_11_ul_timeref_out_tpl_int_1, 32));
                    ul_timeref_out_s_stm <= out_11_ul_timeref_out_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

    clk_stm_sig_stop <= clk_v_s_stm_sig_stop OR clk_c_s_stm_sig_stop OR clk_d1_im_stm_sig_stop OR clk_d1_re_stm_sig_stop OR clk_Tsym1_s_stm_sig_stop OR clk_cp_T1_s_stm_sig_stop OR clk_CP_EN1_s_stm_sig_stop OR clk_fft_size_s_stm_sig_stop OR clk_CPLen_s_stm_sig_stop OR clk_nsc_s_stm_sig_stop OR clk_eAxC_s_stm_sig_stop OR clk_sym_metadata_s_stm_sig_stop OR clk_ul_timerefin_s_stm_sig_stop OR clk_dout1_im_stm_sig_stop OR clk_dout1_re_stm_sig_stop OR clk_vout_s_stm_sig_stop OR clk_cout_s_stm_sig_stop OR clk_sin_s_stm_sig_stop OR clk_cos_s_stm_sig_stop OR clk_fft_size_out_s_stm_sig_stop OR clk_CPLenout_s_stm_sig_stop OR clk_nsc_out_s_stm_sig_stop OR clk_eAxC_out_s_stm_sig_stop OR clk_sym_metadata_out_s_stm_sig_stop OR clk_ul_timeref_out_s_stm_sig_stop OR '0';
    bus_clk_stm_sig_stop <= bus_clk_busIn_stm_sig_stop OR '0';


    END normal;
