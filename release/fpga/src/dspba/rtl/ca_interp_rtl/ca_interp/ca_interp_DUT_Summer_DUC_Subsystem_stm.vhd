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

-- VHDL created from standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem
-- VHDL created on Tue Jan  7 17:04:25 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.ca_interp_DUT_safe_path.all;

entity standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        din_intp_out_0im_stm : out std_logic_vector(15 downto 0);
        din_intp_out_0re_stm : out std_logic_vector(15 downto 0);
        din_intp_out_1im_stm : out std_logic_vector(15 downto 0);
        din_intp_out_1re_stm : out std_logic_vector(15 downto 0);
        din_intp_out_2im_stm : out std_logic_vector(15 downto 0);
        din_intp_out_2re_stm : out std_logic_vector(15 downto 0);
        din_intp_out_3im_stm : out std_logic_vector(15 downto 0);
        din_intp_out_3re_stm : out std_logic_vector(15 downto 0);
        din_intp_out_4im_stm : out std_logic_vector(15 downto 0);
        din_intp_out_4re_stm : out std_logic_vector(15 downto 0);
        din_intp_out_5im_stm : out std_logic_vector(15 downto 0);
        din_intp_out_5re_stm : out std_logic_vector(15 downto 0);
        din_intp_out_6im_stm : out std_logic_vector(15 downto 0);
        din_intp_out_6re_stm : out std_logic_vector(15 downto 0);
        din_intp_out_7im_stm : out std_logic_vector(15 downto 0);
        din_intp_out_7re_stm : out std_logic_vector(15 downto 0);
        din_intp_in_0im_stm : out std_logic_vector(15 downto 0);
        din_intp_in_0re_stm : out std_logic_vector(15 downto 0);
        din_intp_in_1im_stm : out std_logic_vector(15 downto 0);
        din_intp_in_1re_stm : out std_logic_vector(15 downto 0);
        din_intp_in_2im_stm : out std_logic_vector(15 downto 0);
        din_intp_in_2re_stm : out std_logic_vector(15 downto 0);
        din_intp_in_3im_stm : out std_logic_vector(15 downto 0);
        din_intp_in_3re_stm : out std_logic_vector(15 downto 0);
        vin_intp_out_s_stm : out std_logic_vector(0 downto 0);
        cin_intp_in_s_stm : out std_logic_vector(7 downto 0);
        cin_intp_out_s_stm : out std_logic_vector(7 downto 0);
        vin_intp_in_s_stm : out std_logic_vector(0 downto 0);
        dout_0im_stm : out std_logic_vector(15 downto 0);
        dout_0re_stm : out std_logic_vector(15 downto 0);
        dout_1im_stm : out std_logic_vector(15 downto 0);
        dout_1re_stm : out std_logic_vector(15 downto 0);
        dout_2im_stm : out std_logic_vector(15 downto 0);
        dout_2re_stm : out std_logic_vector(15 downto 0);
        dout_3im_stm : out std_logic_vector(15 downto 0);
        dout_3re_stm : out std_logic_vector(15 downto 0);
        dout_4im_stm : out std_logic_vector(15 downto 0);
        dout_4re_stm : out std_logic_vector(15 downto 0);
        dout_5im_stm : out std_logic_vector(15 downto 0);
        dout_5re_stm : out std_logic_vector(15 downto 0);
        dout_6im_stm : out std_logic_vector(15 downto 0);
        dout_6re_stm : out std_logic_vector(15 downto 0);
        dout_7im_stm : out std_logic_vector(15 downto 0);
        dout_7re_stm : out std_logic_vector(15 downto 0);
        vout_s_stm : out std_logic_vector(0 downto 0);
        cout_s_stm : out std_logic_vector(7 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_stm;

architecture normal of standaloneTopLevel_ca_interp_DUT_Summer_DUC_Subsystem_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';
    signal clk_din_intp_out_0im_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_0re_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_1im_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_1re_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_2im_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_2re_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_3im_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_3re_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_4im_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_4re_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_5im_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_5re_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_6im_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_6re_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_7im_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_out_7re_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_in_0im_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_in_0re_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_in_1im_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_in_1re_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_in_2im_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_in_2re_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_in_3im_stm_sig_stop : std_logic := '0';
    signal clk_din_intp_in_3re_stm_sig_stop : std_logic := '0';
    signal clk_vin_intp_out_s_stm_sig_stop : std_logic := '0';
    signal clk_cin_intp_in_s_stm_sig_stop : std_logic := '0';
    signal clk_cin_intp_out_s_stm_sig_stop : std_logic := '0';
    signal clk_vin_intp_in_s_stm_sig_stop : std_logic := '0';
    signal clk_dout_0im_stm_sig_stop : std_logic := '0';
    signal clk_dout_0re_stm_sig_stop : std_logic := '0';
    signal clk_dout_1im_stm_sig_stop : std_logic := '0';
    signal clk_dout_1re_stm_sig_stop : std_logic := '0';
    signal clk_dout_2im_stm_sig_stop : std_logic := '0';
    signal clk_dout_2re_stm_sig_stop : std_logic := '0';
    signal clk_dout_3im_stm_sig_stop : std_logic := '0';
    signal clk_dout_3re_stm_sig_stop : std_logic := '0';
    signal clk_dout_4im_stm_sig_stop : std_logic := '0';
    signal clk_dout_4re_stm_sig_stop : std_logic := '0';
    signal clk_dout_5im_stm_sig_stop : std_logic := '0';
    signal clk_dout_5re_stm_sig_stop : std_logic := '0';
    signal clk_dout_6im_stm_sig_stop : std_logic := '0';
    signal clk_dout_6re_stm_sig_stop : std_logic := '0';
    signal clk_dout_7im_stm_sig_stop : std_logic := '0';
    signal clk_dout_7re_stm_sig_stop : std_logic := '0';
    signal clk_vout_s_stm_sig_stop : std_logic := '0';
    signal clk_cout_s_stm_sig_stop : std_logic := '0';

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

        -- Generating stimulus for din_intp_out_0im
        din_intp_out_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_0_imag_din_intp_out_tpl_int_0 : Integer;
            variable in_1_0_imag_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_0im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_0im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_0_imag_din_intp_out_tpl_int_0);
                    in_1_0_imag_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_0_imag_din_intp_out_tpl_int_0, 16));
                    din_intp_out_0im_stm <= in_1_0_imag_din_intp_out_tpl_temp;
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
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for din_intp_out_0re
        din_intp_out_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_0_real_din_intp_out_tpl_int_0 : Integer;
            variable in_1_0_real_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_0re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_0re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_0_real_din_intp_out_tpl_int_0);
                    in_1_0_real_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_0_real_din_intp_out_tpl_int_0, 16));
                    din_intp_out_0re_stm <= in_1_0_real_din_intp_out_tpl_temp;
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

        -- Generating stimulus for din_intp_out_1im
        din_intp_out_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_1_imag_din_intp_out_tpl_int_0 : Integer;
            variable in_1_1_imag_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_1im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_1im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_1_imag_din_intp_out_tpl_int_0);
                    in_1_1_imag_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_1_imag_din_intp_out_tpl_int_0, 16));
                    din_intp_out_1im_stm <= in_1_1_imag_din_intp_out_tpl_temp;
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

        -- Generating stimulus for din_intp_out_1re
        din_intp_out_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_1_real_din_intp_out_tpl_int_0 : Integer;
            variable in_1_1_real_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_1re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_1re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_1_real_din_intp_out_tpl_int_0);
                    in_1_1_real_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_1_real_din_intp_out_tpl_int_0, 16));
                    din_intp_out_1re_stm <= in_1_1_real_din_intp_out_tpl_temp;
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

        -- Generating stimulus for din_intp_out_2im
        din_intp_out_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_2_imag_din_intp_out_tpl_int_0 : Integer;
            variable in_1_2_imag_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_2im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_2im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_2im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_2_imag_din_intp_out_tpl_int_0);
                    in_1_2_imag_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_2_imag_din_intp_out_tpl_int_0, 16));
                    din_intp_out_2im_stm <= in_1_2_imag_din_intp_out_tpl_temp;
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

        -- Generating stimulus for din_intp_out_2re
        din_intp_out_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_2_real_din_intp_out_tpl_int_0 : Integer;
            variable in_1_2_real_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_2re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_2re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_2_real_din_intp_out_tpl_int_0);
                    in_1_2_real_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_2_real_din_intp_out_tpl_int_0, 16));
                    din_intp_out_2re_stm <= in_1_2_real_din_intp_out_tpl_temp;
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

        -- Generating stimulus for din_intp_out_3im
        din_intp_out_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_3_imag_din_intp_out_tpl_int_0 : Integer;
            variable in_1_3_imag_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_3im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_3im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_3im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_3_imag_din_intp_out_tpl_int_0);
                    in_1_3_imag_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_3_imag_din_intp_out_tpl_int_0, 16));
                    din_intp_out_3im_stm <= in_1_3_imag_din_intp_out_tpl_temp;
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

        -- Generating stimulus for din_intp_out_3re
        din_intp_out_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_3_real_din_intp_out_tpl_int_0 : Integer;
            variable in_1_3_real_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_3re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_3re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_3re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_3_real_din_intp_out_tpl_int_0);
                    in_1_3_real_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_3_real_din_intp_out_tpl_int_0, 16));
                    din_intp_out_3re_stm <= in_1_3_real_din_intp_out_tpl_temp;
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

        -- Generating stimulus for din_intp_out_4im
        din_intp_out_4im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_4_imag_din_intp_out_tpl_int_0 : Integer;
            variable in_1_4_imag_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_4im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_4im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_4im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_4im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, in_1_4_imag_din_intp_out_tpl_int_0);
                    in_1_4_imag_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_4_imag_din_intp_out_tpl_int_0, 16));
                    din_intp_out_4im_stm <= in_1_4_imag_din_intp_out_tpl_temp;
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

        -- Generating stimulus for din_intp_out_4re
        din_intp_out_4re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_4_real_din_intp_out_tpl_int_0 : Integer;
            variable in_1_4_real_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_4re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_4re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_4re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_4re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, in_1_4_real_din_intp_out_tpl_int_0);
                    in_1_4_real_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_4_real_din_intp_out_tpl_int_0, 16));
                    din_intp_out_4re_stm <= in_1_4_real_din_intp_out_tpl_temp;
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

        -- Generating stimulus for din_intp_out_5im
        din_intp_out_5im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_5_imag_din_intp_out_tpl_int_0 : Integer;
            variable in_1_5_imag_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_5im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_5im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_5im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_5im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, in_1_5_imag_din_intp_out_tpl_int_0);
                    in_1_5_imag_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_5_imag_din_intp_out_tpl_int_0, 16));
                    din_intp_out_5im_stm <= in_1_5_imag_din_intp_out_tpl_temp;
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

        -- Generating stimulus for din_intp_out_5re
        din_intp_out_5re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_5_real_din_intp_out_tpl_int_0 : Integer;
            variable in_1_5_real_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_5re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_5re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_5re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_5re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, in_1_5_real_din_intp_out_tpl_int_0);
                    in_1_5_real_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_5_real_din_intp_out_tpl_int_0, 16));
                    din_intp_out_5re_stm <= in_1_5_real_din_intp_out_tpl_temp;
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

        -- Generating stimulus for din_intp_out_6im
        din_intp_out_6im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_6_imag_din_intp_out_tpl_int_0 : Integer;
            variable in_1_6_imag_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_6im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_6im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_6im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_6im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_6_imag_din_intp_out_tpl_int_0);
                    in_1_6_imag_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_6_imag_din_intp_out_tpl_int_0, 16));
                    din_intp_out_6im_stm <= in_1_6_imag_din_intp_out_tpl_temp;
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

        -- Generating stimulus for din_intp_out_6re
        din_intp_out_6re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_6_real_din_intp_out_tpl_int_0 : Integer;
            variable in_1_6_real_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_6re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_6re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_6re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_6re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, dummy_int);
                    read(L, in_1_6_real_din_intp_out_tpl_int_0);
                    in_1_6_real_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_6_real_din_intp_out_tpl_int_0, 16));
                    din_intp_out_6re_stm <= in_1_6_real_din_intp_out_tpl_temp;
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

        -- Generating stimulus for din_intp_out_7im
        din_intp_out_7im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_7_imag_din_intp_out_tpl_int_0 : Integer;
            variable in_1_7_imag_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_7im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_7im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_7im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_7im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_7_imag_din_intp_out_tpl_int_0);
                    in_1_7_imag_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_7_imag_din_intp_out_tpl_int_0, 16));
                    din_intp_out_7im_stm <= in_1_7_imag_din_intp_out_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for din_intp_out_7re
        din_intp_out_7re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_7_real_din_intp_out_tpl_int_0 : Integer;
            variable in_1_7_real_din_intp_out_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_out_7re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_out_7re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_out_7re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_out_7re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_7_real_din_intp_out_tpl_int_0);
                    in_1_7_real_din_intp_out_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_7_real_din_intp_out_tpl_int_0, 16));
                    din_intp_out_7re_stm <= in_1_7_real_din_intp_out_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for din_intp_in_0im
        din_intp_in_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_0_imag_din_intp_in_tpl_int_0 : Integer;
            variable in_2_0_imag_din_intp_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_in_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_in_0im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_in_0im)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_in_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_0_imag_din_intp_in_tpl_int_0);
                    in_2_0_imag_din_intp_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_0_imag_din_intp_in_tpl_int_0, 16));
                    din_intp_in_0im_stm <= in_2_0_imag_din_intp_in_tpl_temp;
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

        -- Generating stimulus for din_intp_in_0re
        din_intp_in_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_0_real_din_intp_in_tpl_int_0 : Integer;
            variable in_2_0_real_din_intp_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_in_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_in_0re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_in_0re)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_in_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_0_real_din_intp_in_tpl_int_0);
                    in_2_0_real_din_intp_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_0_real_din_intp_in_tpl_int_0, 16));
                    din_intp_in_0re_stm <= in_2_0_real_din_intp_in_tpl_temp;
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

        -- Generating stimulus for din_intp_in_1im
        din_intp_in_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_1_imag_din_intp_in_tpl_int_0 : Integer;
            variable in_2_1_imag_din_intp_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_in_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_in_1im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_in_1im)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_in_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_1_imag_din_intp_in_tpl_int_0);
                    in_2_1_imag_din_intp_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_1_imag_din_intp_in_tpl_int_0, 16));
                    din_intp_in_1im_stm <= in_2_1_imag_din_intp_in_tpl_temp;
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

        -- Generating stimulus for din_intp_in_1re
        din_intp_in_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_1_real_din_intp_in_tpl_int_0 : Integer;
            variable in_2_1_real_din_intp_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_in_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_in_1re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_in_1re)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_in_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_1_real_din_intp_in_tpl_int_0);
                    in_2_1_real_din_intp_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_1_real_din_intp_in_tpl_int_0, 16));
                    din_intp_in_1re_stm <= in_2_1_real_din_intp_in_tpl_temp;
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

        -- Generating stimulus for din_intp_in_2im
        din_intp_in_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_2_imag_din_intp_in_tpl_int_0 : Integer;
            variable in_2_2_imag_din_intp_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_in_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_in_2im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_in_2im)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_in_2im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_2_imag_din_intp_in_tpl_int_0);
                    in_2_2_imag_din_intp_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_2_imag_din_intp_in_tpl_int_0, 16));
                    din_intp_in_2im_stm <= in_2_2_imag_din_intp_in_tpl_temp;
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

        -- Generating stimulus for din_intp_in_2re
        din_intp_in_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_2_real_din_intp_in_tpl_int_0 : Integer;
            variable in_2_2_real_din_intp_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_in_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_in_2re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_in_2re)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_in_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_2_real_din_intp_in_tpl_int_0);
                    in_2_2_real_din_intp_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_2_real_din_intp_in_tpl_int_0, 16));
                    din_intp_in_2re_stm <= in_2_2_real_din_intp_in_tpl_temp;
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

        -- Generating stimulus for din_intp_in_3im
        din_intp_in_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_3_imag_din_intp_in_tpl_int_0 : Integer;
            variable in_2_3_imag_din_intp_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_in_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_in_3im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_in_3im)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_in_3im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_3_imag_din_intp_in_tpl_int_0);
                    in_2_3_imag_din_intp_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_3_imag_din_intp_in_tpl_int_0, 16));
                    din_intp_in_3im_stm <= in_2_3_imag_din_intp_in_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for din_intp_in_3re
        din_intp_in_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_3_real_din_intp_in_tpl_int_0 : Integer;
            variable in_2_3_real_din_intp_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din_intp_in_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din_intp_in_3re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din_intp_in_3re)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_din_intp_in_3re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_3_real_din_intp_in_tpl_int_0);
                    in_2_3_real_din_intp_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_3_real_din_intp_in_tpl_int_0, 16));
                    din_intp_in_3re_stm <= in_2_3_real_din_intp_in_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for vin_intp_out_s
        vin_intp_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_3_vin_intp_out_tpl_int_0 : Integer;
            variable in_3_vin_intp_out_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            vin_intp_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                vin_intp_out_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to vin_intp_out_s)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_vin_intp_out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, in_3_vin_intp_out_tpl_int_0);
                    in_3_vin_intp_out_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_3_vin_intp_out_tpl_int_0, 1));
                    vin_intp_out_s_stm <= in_3_vin_intp_out_tpl_temp;
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

        -- Generating stimulus for cin_intp_in_s
        cin_intp_in_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_4_cin_intp_in_tpl_int_0 : Integer;
            variable in_4_cin_intp_in_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            cin_intp_in_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                cin_intp_in_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to cin_intp_in_s)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_cin_intp_in_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, in_4_cin_intp_in_tpl_int_0);
                    in_4_cin_intp_in_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_4_cin_intp_in_tpl_int_0, 8));
                    cin_intp_in_s_stm <= in_4_cin_intp_in_tpl_temp;
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

        -- Generating stimulus for cin_intp_out_s
        cin_intp_out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_5_cin_intp_out_tpl_int_0 : Integer;
            variable in_5_cin_intp_out_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            cin_intp_out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                cin_intp_out_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to cin_intp_out_s)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_cin_intp_out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, in_5_cin_intp_out_tpl_int_0);
                    in_5_cin_intp_out_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_5_cin_intp_out_tpl_int_0, 8));
                    cin_intp_out_s_stm <= in_5_cin_intp_out_tpl_temp;
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

        -- Generating stimulus for vin_intp_in_s
        vin_intp_in_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_6_vin_intp_in_tpl_int_0 : Integer;
            variable in_6_vin_intp_in_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            vin_intp_in_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                vin_intp_in_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to vin_intp_in_s)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_vin_intp_in_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, in_6_vin_intp_in_tpl_int_0);
                    in_6_vin_intp_in_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_6_vin_intp_in_tpl_int_0, 1));
                    vin_intp_in_s_stm <= in_6_vin_intp_in_tpl_temp;
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

        -- Generating stimulus for dout_0im
        dout_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_0_imag_dout_tpl_int_0 : Integer;
            variable out_1_0_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_0im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_0_imag_dout_tpl_int_0);
                    out_1_0_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_0_imag_dout_tpl_int_0, 16));
                    dout_0im_stm <= out_1_0_imag_dout_tpl_temp;
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
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for dout_0re
        dout_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_0_real_dout_tpl_int_0 : Integer;
            variable out_1_0_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_0re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_0_real_dout_tpl_int_0);
                    out_1_0_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_0_real_dout_tpl_int_0, 16));
                    dout_0re_stm <= out_1_0_real_dout_tpl_temp;
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

        -- Generating stimulus for dout_1im
        dout_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_1_imag_dout_tpl_int_0 : Integer;
            variable out_1_1_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_1im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_1_imag_dout_tpl_int_0);
                    out_1_1_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_1_imag_dout_tpl_int_0, 16));
                    dout_1im_stm <= out_1_1_imag_dout_tpl_temp;
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

        -- Generating stimulus for dout_1re
        dout_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_1_real_dout_tpl_int_0 : Integer;
            variable out_1_1_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_1re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_1_real_dout_tpl_int_0);
                    out_1_1_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_1_real_dout_tpl_int_0, 16));
                    dout_1re_stm <= out_1_1_real_dout_tpl_temp;
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

        -- Generating stimulus for dout_2im
        dout_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_2_imag_dout_tpl_int_0 : Integer;
            variable out_1_2_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_2im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_2im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_2_imag_dout_tpl_int_0);
                    out_1_2_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_2_imag_dout_tpl_int_0, 16));
                    dout_2im_stm <= out_1_2_imag_dout_tpl_temp;
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

        -- Generating stimulus for dout_2re
        dout_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_2_real_dout_tpl_int_0 : Integer;
            variable out_1_2_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_2re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_2_real_dout_tpl_int_0);
                    out_1_2_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_2_real_dout_tpl_int_0, 16));
                    dout_2re_stm <= out_1_2_real_dout_tpl_temp;
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

        -- Generating stimulus for dout_3im
        dout_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_3_imag_dout_tpl_int_0 : Integer;
            variable out_1_3_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_3im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_3im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_3_imag_dout_tpl_int_0);
                    out_1_3_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_3_imag_dout_tpl_int_0, 16));
                    dout_3im_stm <= out_1_3_imag_dout_tpl_temp;
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

        -- Generating stimulus for dout_3re
        dout_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_3_real_dout_tpl_int_0 : Integer;
            variable out_1_3_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_3re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_3re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_3_real_dout_tpl_int_0);
                    out_1_3_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_3_real_dout_tpl_int_0, 16));
                    dout_3re_stm <= out_1_3_real_dout_tpl_temp;
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

        -- Generating stimulus for dout_4im
        dout_4im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_4_imag_dout_tpl_int_0 : Integer;
            variable out_1_4_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_4im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_4im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_4im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, out_1_4_imag_dout_tpl_int_0);
                    out_1_4_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_4_imag_dout_tpl_int_0, 16));
                    dout_4im_stm <= out_1_4_imag_dout_tpl_temp;
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

        -- Generating stimulus for dout_4re
        dout_4re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_4_real_dout_tpl_int_0 : Integer;
            variable out_1_4_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_4re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_4re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_4re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, out_1_4_real_dout_tpl_int_0);
                    out_1_4_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_4_real_dout_tpl_int_0, 16));
                    dout_4re_stm <= out_1_4_real_dout_tpl_temp;
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

        -- Generating stimulus for dout_5im
        dout_5im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_5_imag_dout_tpl_int_0 : Integer;
            variable out_1_5_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_5im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_5im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_5im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, out_1_5_imag_dout_tpl_int_0);
                    out_1_5_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_5_imag_dout_tpl_int_0, 16));
                    dout_5im_stm <= out_1_5_imag_dout_tpl_temp;
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

        -- Generating stimulus for dout_5re
        dout_5re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_5_real_dout_tpl_int_0 : Integer;
            variable out_1_5_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_5re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_5re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_5re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, out_1_5_real_dout_tpl_int_0);
                    out_1_5_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_5_real_dout_tpl_int_0, 16));
                    dout_5re_stm <= out_1_5_real_dout_tpl_temp;
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

        -- Generating stimulus for dout_6im
        dout_6im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_6_imag_dout_tpl_int_0 : Integer;
            variable out_1_6_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_6im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_6im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_6im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_6_imag_dout_tpl_int_0);
                    out_1_6_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_6_imag_dout_tpl_int_0, 16));
                    dout_6im_stm <= out_1_6_imag_dout_tpl_temp;
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

        -- Generating stimulus for dout_6re
        dout_6re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_6_real_dout_tpl_int_0 : Integer;
            variable out_1_6_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_6re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_6re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_6re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, dummy_int);
                    read(L, out_1_6_real_dout_tpl_int_0);
                    out_1_6_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_6_real_dout_tpl_int_0, 16));
                    dout_6re_stm <= out_1_6_real_dout_tpl_temp;
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

        -- Generating stimulus for dout_7im
        dout_7im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_7_imag_dout_tpl_int_0 : Integer;
            variable out_1_7_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_7im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_7im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_7im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_7_imag_dout_tpl_int_0);
                    out_1_7_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_7_imag_dout_tpl_int_0, 16));
                    dout_7im_stm <= out_1_7_imag_dout_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for dout_7re
        dout_7re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_7_real_dout_tpl_int_0 : Integer;
            variable out_1_7_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_7re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_7re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_dout_7re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_7_real_dout_tpl_int_0);
                    out_1_7_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_7_real_dout_tpl_int_0, 16));
                    dout_7re_stm <= out_1_7_real_dout_tpl_temp;
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
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_2_vout_tpl_int_0 : Integer;
            variable out_2_vout_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            vout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to vout_s)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_vout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_3_cout_tpl_int_0 : Integer;
            variable out_3_cout_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            cout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to cout_s)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_cout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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

    clk_stm_sig_stop <= clk_din_intp_out_0im_stm_sig_stop OR clk_din_intp_out_0re_stm_sig_stop OR clk_din_intp_out_1im_stm_sig_stop OR clk_din_intp_out_1re_stm_sig_stop OR clk_din_intp_out_2im_stm_sig_stop OR clk_din_intp_out_2re_stm_sig_stop OR clk_din_intp_out_3im_stm_sig_stop OR clk_din_intp_out_3re_stm_sig_stop OR clk_din_intp_out_4im_stm_sig_stop OR clk_din_intp_out_4re_stm_sig_stop OR clk_din_intp_out_5im_stm_sig_stop OR clk_din_intp_out_5re_stm_sig_stop OR clk_din_intp_out_6im_stm_sig_stop OR clk_din_intp_out_6re_stm_sig_stop OR clk_din_intp_out_7im_stm_sig_stop OR clk_din_intp_out_7re_stm_sig_stop OR clk_din_intp_in_0im_stm_sig_stop OR clk_din_intp_in_0re_stm_sig_stop OR clk_din_intp_in_1im_stm_sig_stop OR clk_din_intp_in_1re_stm_sig_stop OR clk_din_intp_in_2im_stm_sig_stop OR clk_din_intp_in_2re_stm_sig_stop OR clk_din_intp_in_3im_stm_sig_stop OR clk_din_intp_in_3re_stm_sig_stop OR clk_vin_intp_out_s_stm_sig_stop OR clk_cin_intp_in_s_stm_sig_stop OR clk_cin_intp_out_s_stm_sig_stop OR clk_vin_intp_in_s_stm_sig_stop OR clk_dout_0im_stm_sig_stop OR clk_dout_0re_stm_sig_stop OR clk_dout_1im_stm_sig_stop OR clk_dout_1re_stm_sig_stop OR clk_dout_2im_stm_sig_stop OR clk_dout_2re_stm_sig_stop OR clk_dout_3im_stm_sig_stop OR clk_dout_3re_stm_sig_stop OR clk_dout_4im_stm_sig_stop OR clk_dout_4re_stm_sig_stop OR clk_dout_5im_stm_sig_stop OR clk_dout_5re_stm_sig_stop OR clk_dout_6im_stm_sig_stop OR clk_dout_6re_stm_sig_stop OR clk_dout_7im_stm_sig_stop OR clk_dout_7re_stm_sig_stop OR clk_vout_s_stm_sig_stop OR clk_cout_s_stm_sig_stop OR '0';
    bus_clk_stm_sig_stop <= '1';


    END normal;
