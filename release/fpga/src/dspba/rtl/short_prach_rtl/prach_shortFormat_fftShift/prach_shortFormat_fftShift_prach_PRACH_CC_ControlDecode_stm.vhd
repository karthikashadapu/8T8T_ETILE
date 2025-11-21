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

-- VHDL created from standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode
-- VHDL created on Wed Nov  6 19:28:32 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.prach_shortFormat_fftShift_prach_safe_path.all;

entity standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(9 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        din_im_stm : out std_logic_vector(15 downto 0);
        din_re_stm : out std_logic_vector(15 downto 0);
        vin_s_stm : out std_logic_vector(0 downto 0);
        chin_s_stm : out std_logic_vector(7 downto 0);
        SFN_s_stm : out std_logic_vector(11 downto 0);
        SubFN_s_stm : out std_logic_vector(7 downto 0);
        SCSby15_s_stm : out std_logic_vector(1 downto 0);
        BWby10_s_stm : out std_logic_vector(7 downto 0);
        dout_im_stm : out std_logic_vector(15 downto 0);
        dout_re_stm : out std_logic_vector(15 downto 0);
        vout_s_stm : out std_logic_vector(0 downto 0);
        cout_s_stm : out std_logic_vector(7 downto 0);
        CPLen_s_stm : out std_logic_vector(22 downto 0);
        FFTSize_s_stm : out std_logic_vector(3 downto 0);
        NFFTs_s_stm : out std_logic_vector(3 downto 0);
        SOP_s_stm : out std_logic_vector(0 downto 0);
        qBWby10_s_stm : out std_logic_vector(7 downto 0);
        TimeReference_s_stm : out std_logic_vector(28 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_stm;

architecture normal of standaloneTopLevel_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';
    signal clk_din_im_stm_sig_stop : std_logic := '0';
    signal clk_din_re_stm_sig_stop : std_logic := '0';
    signal clk_vin_s_stm_sig_stop : std_logic := '0';
    signal clk_chin_s_stm_sig_stop : std_logic := '0';
    signal clk_SFN_s_stm_sig_stop : std_logic := '0';
    signal clk_SubFN_s_stm_sig_stop : std_logic := '0';
    signal clk_SCSby15_s_stm_sig_stop : std_logic := '0';
    signal clk_BWby10_s_stm_sig_stop : std_logic := '0';
    signal clk_dout_im_stm_sig_stop : std_logic := '0';
    signal clk_dout_re_stm_sig_stop : std_logic := '0';
    signal clk_vout_s_stm_sig_stop : std_logic := '0';
    signal clk_cout_s_stm_sig_stop : std_logic := '0';
    signal clk_CPLen_s_stm_sig_stop : std_logic := '0';
    signal clk_FFTSize_s_stm_sig_stop : std_logic := '0';
    signal clk_NFFTs_s_stm_sig_stop : std_logic := '0';
    signal clk_SOP_s_stm_sig_stop : std_logic := '0';
    signal clk_qBWby10_s_stm_sig_stop : std_logic := '0';
    signal clk_TimeReference_s_stm_sig_stop : std_logic := '0';

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

        -- Driving gnd for busIn signals

        busIn_writedata_stm <= (others => '0');
        busIn_address_stm <= (others => '0');
        busIn_write_stm <= (others => '0');
        busIn_read_stm <= (others => '0');

        -- Generating stub busOut - no stimulus
        -- initialize all outputs to 0
        busOut_readdatavalid_stm <= (others => '0');
        busOut_readdata_stm <= (others => '0');
        busOut_waitrequest_stm <= (others => '0');

        -- Generating stimulus for din_im
        din_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelI3n_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelI3n_cunroll_x.stm");
            variable in_1_imag_din_tpl_int_0 : Integer;
            variable in_1_imag_din_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_im)
                IF (endfile(data_file_ChannelI3n_cunroll_x)) THEN
                    clk_din_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelI3n_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_imag_din_tpl_int_0);
                    in_1_imag_din_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_imag_din_tpl_int_0, 16));
                    din_im_stm <= in_1_imag_din_tpl_temp;
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

        -- Generating stimulus for din_re
        din_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelI3n_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelI3n_cunroll_x.stm");
            variable in_1_real_din_tpl_int_0 : Integer;
            variable in_1_real_din_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_re)
                IF (endfile(data_file_ChannelI3n_cunroll_x)) THEN
                    clk_din_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelI3n_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_real_din_tpl_int_0);
                    in_1_real_din_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_real_din_tpl_int_0, 16));
                    din_re_stm <= in_1_real_din_tpl_temp;
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

        -- Generating stimulus for vin_s
        vin_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelI3n_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelI3n_cunroll_x.stm");
            variable in_2_vin_tpl_int_0 : Integer;
            variable in_2_vin_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            vin_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                vin_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to vin_s)
                IF (endfile(data_file_ChannelI3n_cunroll_x)) THEN
                    clk_vin_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelI3n_cunroll_x, L);
                    
                    read(L, in_2_vin_tpl_int_0);
                    in_2_vin_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_2_vin_tpl_int_0, 1));
                    vin_s_stm <= in_2_vin_tpl_temp;
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

        -- Generating stimulus for chin_s
        chin_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelI3n_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelI3n_cunroll_x.stm");
            variable in_3_chin_tpl_int_0 : Integer;
            variable in_3_chin_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            chin_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                chin_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to chin_s)
                IF (endfile(data_file_ChannelI3n_cunroll_x)) THEN
                    clk_chin_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelI3n_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, in_3_chin_tpl_int_0);
                    in_3_chin_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_3_chin_tpl_int_0, 8));
                    chin_s_stm <= in_3_chin_tpl_temp;
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

        -- Generating stimulus for SFN_s
        SFN_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelI3n_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelI3n_cunroll_x.stm");
            variable in_4_SFN_tpl_int_0 : Integer;
            variable in_4_SFN_tpl_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            SFN_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                SFN_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to SFN_s)
                IF (endfile(data_file_ChannelI3n_cunroll_x)) THEN
                    clk_SFN_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelI3n_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_SFN_tpl_int_0);
                    in_4_SFN_tpl_temp(11 downto 0) := std_logic_vector(to_unsigned(in_4_SFN_tpl_int_0, 12));
                    SFN_s_stm <= in_4_SFN_tpl_temp;
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

        -- Generating stimulus for SubFN_s
        SubFN_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelI3n_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelI3n_cunroll_x.stm");
            variable in_5_SubFN_tpl_int_0 : Integer;
            variable in_5_SubFN_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            SubFN_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                SubFN_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to SubFN_s)
                IF (endfile(data_file_ChannelI3n_cunroll_x)) THEN
                    clk_SubFN_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelI3n_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_5_SubFN_tpl_int_0);
                    in_5_SubFN_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_5_SubFN_tpl_int_0, 8));
                    SubFN_s_stm <= in_5_SubFN_tpl_temp;
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

        -- Generating stimulus for SCSby15_s
        SCSby15_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelI3n_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelI3n_cunroll_x.stm");
            variable in_6_SCSby15_tpl_int_0 : Integer;
            variable in_6_SCSby15_tpl_temp : std_logic_vector(1 downto 0);

        begin
            -- initialize all outputs to 0
            SCSby15_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                SCSby15_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to SCSby15_s)
                IF (endfile(data_file_ChannelI3n_cunroll_x)) THEN
                    clk_SCSby15_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelI3n_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_6_SCSby15_tpl_int_0);
                    in_6_SCSby15_tpl_temp(1 downto 0) := std_logic_vector(to_unsigned(in_6_SCSby15_tpl_int_0, 2));
                    SCSby15_s_stm <= in_6_SCSby15_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for BWby10_s
        BWby10_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelI3n_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelI3n_cunroll_x.stm");
            variable in_7_BWby10_tpl_int_0 : Integer;
            variable in_7_BWby10_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            BWby10_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                BWby10_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to BWby10_s)
                IF (endfile(data_file_ChannelI3n_cunroll_x)) THEN
                    clk_BWby10_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelI3n_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_7_BWby10_tpl_int_0);
                    in_7_BWby10_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_7_BWby10_tpl_int_0, 8));
                    BWby10_s_stm <= in_7_BWby10_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for dout_im
        dout_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOu3t_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelOu3t_cunroll_x.stm");
            variable out_1_imag_dout_tpl_int_0 : Integer;
            variable out_1_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_im)
                IF (endfile(data_file_ChannelOu3t_cunroll_x)) THEN
                    clk_dout_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOu3t_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_imag_dout_tpl_int_0);
                    out_1_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_imag_dout_tpl_int_0, 16));
                    dout_im_stm <= out_1_imag_dout_tpl_temp;
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

        -- Generating stimulus for dout_re
        dout_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOu3t_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelOu3t_cunroll_x.stm");
            variable out_1_real_dout_tpl_int_0 : Integer;
            variable out_1_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_re)
                IF (endfile(data_file_ChannelOu3t_cunroll_x)) THEN
                    clk_dout_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOu3t_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_real_dout_tpl_int_0);
                    out_1_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_real_dout_tpl_int_0, 16));
                    dout_re_stm <= out_1_real_dout_tpl_temp;
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
            file data_file_ChannelOu3t_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelOu3t_cunroll_x.stm");
            variable out_2_vout_tpl_int_0 : Integer;
            variable out_2_vout_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            vout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to vout_s)
                IF (endfile(data_file_ChannelOu3t_cunroll_x)) THEN
                    clk_vout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOu3t_cunroll_x, L);
                    
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
            file data_file_ChannelOu3t_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelOu3t_cunroll_x.stm");
            variable out_3_cout_tpl_int_0 : Integer;
            variable out_3_cout_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            cout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to cout_s)
                IF (endfile(data_file_ChannelOu3t_cunroll_x)) THEN
                    clk_cout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOu3t_cunroll_x, L);
                    
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
            file data_file_ChannelOu3t_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelOu3t_cunroll_x.stm");
            variable out_4_CPLen_tpl_int_0 : Integer;
            variable out_4_CPLen_tpl_temp : std_logic_vector(22 downto 0);

        begin
            -- initialize all outputs to 0
            CPLen_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to CPLen_s)
                IF (endfile(data_file_ChannelOu3t_cunroll_x)) THEN
                    clk_CPLen_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOu3t_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_CPLen_tpl_int_0);
                    out_4_CPLen_tpl_temp(22 downto 0) := std_logic_vector(to_unsigned(out_4_CPLen_tpl_int_0, 23));
                    CPLen_s_stm <= out_4_CPLen_tpl_temp;
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
            file data_file_ChannelOu3t_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelOu3t_cunroll_x.stm");
            variable out_5_FFTSize_tpl_int_0 : Integer;
            variable out_5_FFTSize_tpl_temp : std_logic_vector(3 downto 0);

        begin
            -- initialize all outputs to 0
            FFTSize_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to FFTSize_s)
                IF (endfile(data_file_ChannelOu3t_cunroll_x)) THEN
                    clk_FFTSize_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOu3t_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_5_FFTSize_tpl_int_0);
                    out_5_FFTSize_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(out_5_FFTSize_tpl_int_0, 4));
                    FFTSize_s_stm <= out_5_FFTSize_tpl_temp;
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

        -- Generating stimulus for NFFTs_s
        NFFTs_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOu3t_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelOu3t_cunroll_x.stm");
            variable out_6_NFFTs_tpl_int_0 : Integer;
            variable out_6_NFFTs_tpl_temp : std_logic_vector(3 downto 0);

        begin
            -- initialize all outputs to 0
            NFFTs_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to NFFTs_s)
                IF (endfile(data_file_ChannelOu3t_cunroll_x)) THEN
                    clk_NFFTs_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOu3t_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_6_NFFTs_tpl_int_0);
                    out_6_NFFTs_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(out_6_NFFTs_tpl_int_0, 4));
                    NFFTs_s_stm <= out_6_NFFTs_tpl_temp;
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

        -- Generating stimulus for SOP_s
        SOP_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOu3t_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelOu3t_cunroll_x.stm");
            variable out_7_SOP_tpl_int_0 : Integer;
            variable out_7_SOP_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            SOP_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to SOP_s)
                IF (endfile(data_file_ChannelOu3t_cunroll_x)) THEN
                    clk_SOP_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOu3t_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_7_SOP_tpl_int_0);
                    out_7_SOP_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_7_SOP_tpl_int_0, 1));
                    SOP_s_stm <= out_7_SOP_tpl_temp;
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

        -- Generating stimulus for qBWby10_s
        qBWby10_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOu3t_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelOu3t_cunroll_x.stm");
            variable out_8_qBWby10_tpl_int_0 : Integer;
            variable out_8_qBWby10_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            qBWby10_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to qBWby10_s)
                IF (endfile(data_file_ChannelOu3t_cunroll_x)) THEN
                    clk_qBWby10_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOu3t_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_8_qBWby10_tpl_int_0);
                    out_8_qBWby10_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_8_qBWby10_tpl_int_0, 8));
                    qBWby10_s_stm <= out_8_qBWby10_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for TimeReference_s
        TimeReference_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOu3t_cunroll_x : text open read_mode is safe_path("prach_shortFormat_fftShift/prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_ChannelOu3t_cunroll_x.stm");
            variable out_9_TimeReference_tpl_int_0 : Integer;
            variable out_9_TimeReference_tpl_temp : std_logic_vector(28 downto 0);

        begin
            -- initialize all outputs to 0
            TimeReference_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to TimeReference_s)
                IF (endfile(data_file_ChannelOu3t_cunroll_x)) THEN
                    clk_TimeReference_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOu3t_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_9_TimeReference_tpl_int_0);
                    out_9_TimeReference_tpl_temp(28 downto 0) := std_logic_vector(to_unsigned(out_9_TimeReference_tpl_int_0, 29));
                    TimeReference_s_stm <= out_9_TimeReference_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

    clk_stm_sig_stop <= clk_din_im_stm_sig_stop OR clk_din_re_stm_sig_stop OR clk_vin_s_stm_sig_stop OR clk_chin_s_stm_sig_stop OR clk_SFN_s_stm_sig_stop OR clk_SubFN_s_stm_sig_stop OR clk_SCSby15_s_stm_sig_stop OR clk_BWby10_s_stm_sig_stop OR clk_dout_im_stm_sig_stop OR clk_dout_re_stm_sig_stop OR clk_vout_s_stm_sig_stop OR clk_cout_s_stm_sig_stop OR clk_CPLen_s_stm_sig_stop OR clk_FFTSize_s_stm_sig_stop OR clk_NFFTs_s_stm_sig_stop OR clk_SOP_s_stm_sig_stop OR clk_qBWby10_s_stm_sig_stop OR clk_TimeReference_s_stm_sig_stop OR '0';
    bus_clk_stm_sig_stop <= '1';


    END normal;
