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

-- VHDL created from ddc_model_DUT
-- VHDL created on Thu Jan  9 15:36:33 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.ddc_model_DUT_safe_path.all;

entity ddc_model_DUT_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        DDC_Valid_In_s_stm : out std_logic_vector(0 downto 0);
        DDC_Chan_In_s_stm : out std_logic_vector(7 downto 0);
        DDC_Ant_Data_In_0im_stm : out std_logic_vector(31 downto 0);
        DDC_Ant_Data_In_0re_stm : out std_logic_vector(31 downto 0);
        DDC_Ant_Data_In_1im_stm : out std_logic_vector(31 downto 0);
        DDC_Ant_Data_In_1re_stm : out std_logic_vector(31 downto 0);
        DDC_Ant_Data_In_2im_stm : out std_logic_vector(31 downto 0);
        DDC_Ant_Data_In_2re_stm : out std_logic_vector(31 downto 0);
        DDC_Ant_Data_In_3im_stm : out std_logic_vector(31 downto 0);
        DDC_Ant_Data_In_3re_stm : out std_logic_vector(31 downto 0);
        DDC_NCO_sync_0_stm : out std_logic_vector(0 downto 0);
        DDC_NCO_sync_1_stm : out std_logic_vector(0 downto 0);
        DDC_NCO_sync_2_stm : out std_logic_vector(0 downto 0);
        DDC_NCO_sync_3_stm : out std_logic_vector(0 downto 0);
        BW_Config_CC1_s_stm : out std_logic_vector(7 downto 0);
        DDC_Const_Data_In_0im_stm : out std_logic_vector(31 downto 0);
        DDC_Const_Data_In_0re_stm : out std_logic_vector(31 downto 0);
        DDC_Const_Data_In_1im_stm : out std_logic_vector(31 downto 0);
        DDC_Const_Data_In_1re_stm : out std_logic_vector(31 downto 0);
        DDC_Const_Data_In_2im_stm : out std_logic_vector(31 downto 0);
        DDC_Const_Data_In_2re_stm : out std_logic_vector(31 downto 0);
        DDC_Const_Data_In_3im_stm : out std_logic_vector(31 downto 0);
        DDC_Const_Data_In_3re_stm : out std_logic_vector(31 downto 0);
        DDC_Const_Data_sel_s_stm : out std_logic_vector(0 downto 0);
        ddc_l1_dout_im_stm : out std_logic_vector(15 downto 0);
        ddc_l1_dout_re_stm : out std_logic_vector(15 downto 0);
        ddc_l1_vout_s_stm : out std_logic_vector(0 downto 0);
        ddc_l1_cout_s_stm : out std_logic_vector(7 downto 0);
        mixer_l1_dout_0im_stm : out std_logic_vector(15 downto 0);
        mixer_l1_dout_0re_stm : out std_logic_vector(15 downto 0);
        mixer_l1_dout_1im_stm : out std_logic_vector(15 downto 0);
        mixer_l1_dout_1re_stm : out std_logic_vector(15 downto 0);
        mixer_l1_dout_2im_stm : out std_logic_vector(15 downto 0);
        mixer_l1_dout_2re_stm : out std_logic_vector(15 downto 0);
        mixer_l1_dout_3im_stm : out std_logic_vector(15 downto 0);
        mixer_l1_dout_3re_stm : out std_logic_vector(15 downto 0);
        mixer_l1_vout_s_stm : out std_logic_vector(0 downto 0);
        mixer_l1_cout_s_stm : out std_logic_vector(7 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end ddc_model_DUT_stm;

architecture normal of ddc_model_DUT_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';
    signal clk_DDC_Valid_In_s_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Chan_In_s_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Ant_Data_In_0im_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Ant_Data_In_0re_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Ant_Data_In_1im_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Ant_Data_In_1re_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Ant_Data_In_2im_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Ant_Data_In_2re_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Ant_Data_In_3im_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Ant_Data_In_3re_stm_sig_stop : std_logic := '0';
    signal clk_DDC_NCO_sync_0_stm_sig_stop : std_logic := '0';
    signal clk_DDC_NCO_sync_1_stm_sig_stop : std_logic := '0';
    signal clk_DDC_NCO_sync_2_stm_sig_stop : std_logic := '0';
    signal clk_DDC_NCO_sync_3_stm_sig_stop : std_logic := '0';
    signal clk_BW_Config_CC1_s_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Const_Data_In_0im_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Const_Data_In_0re_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Const_Data_In_1im_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Const_Data_In_1re_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Const_Data_In_2im_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Const_Data_In_2re_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Const_Data_In_3im_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Const_Data_In_3re_stm_sig_stop : std_logic := '0';
    signal clk_DDC_Const_Data_sel_s_stm_sig_stop : std_logic := '0';
    signal clk_ddc_l1_dout_im_stm_sig_stop : std_logic := '0';
    signal clk_ddc_l1_dout_re_stm_sig_stop : std_logic := '0';
    signal clk_ddc_l1_vout_s_stm_sig_stop : std_logic := '0';
    signal clk_ddc_l1_cout_s_stm_sig_stop : std_logic := '0';
    signal clk_mixer_l1_dout_0im_stm_sig_stop : std_logic := '0';
    signal clk_mixer_l1_dout_0re_stm_sig_stop : std_logic := '0';
    signal clk_mixer_l1_dout_1im_stm_sig_stop : std_logic := '0';
    signal clk_mixer_l1_dout_1re_stm_sig_stop : std_logic := '0';
    signal clk_mixer_l1_dout_2im_stm_sig_stop : std_logic := '0';
    signal clk_mixer_l1_dout_2re_stm_sig_stop : std_logic := '0';
    signal clk_mixer_l1_dout_3im_stm_sig_stop : std_logic := '0';
    signal clk_mixer_l1_dout_3re_stm_sig_stop : std_logic := '0';
    signal clk_mixer_l1_vout_s_stm_sig_stop : std_logic := '0';
    signal clk_mixer_l1_cout_s_stm_sig_stop : std_logic := '0';

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

        -- Generating stimulus for DDC_Valid_In_s
        DDC_Valid_In_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_3_vin_d1_tpl_int_0 : Integer;
            variable in_3_vin_d1_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Valid_In_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Valid_In_s_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Valid_In_s)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Valid_In_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, in_3_vin_d1_tpl_int_0);
                    in_3_vin_d1_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_3_vin_d1_tpl_int_0, 1));
                    DDC_Valid_In_s_stm <= in_3_vin_d1_tpl_temp;
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
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for DDC_Chan_In_s
        DDC_Chan_In_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_4_cin_d1_tpl_int_0 : Integer;
            variable in_4_cin_d1_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Chan_In_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Chan_In_s_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Chan_In_s)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Chan_In_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, in_4_cin_d1_tpl_int_0);
                    in_4_cin_d1_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_4_cin_d1_tpl_int_0, 8));
                    DDC_Chan_In_s_stm <= in_4_cin_d1_tpl_temp;
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

        -- Generating stimulus for DDC_Ant_Data_In_0im
        DDC_Ant_Data_In_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_0_imag_din_d1_tpl_int_0 : Integer;
            variable in_1_0_imag_din_d1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Ant_Data_In_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Ant_Data_In_0im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Ant_Data_In_0im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Ant_Data_In_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_0_imag_din_d1_tpl_int_0);
                    in_1_0_imag_din_d1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_1_0_imag_din_d1_tpl_int_0, 32));
                    DDC_Ant_Data_In_0im_stm <= in_1_0_imag_din_d1_tpl_temp;
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

        -- Generating stimulus for DDC_Ant_Data_In_0re
        DDC_Ant_Data_In_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_0_real_din_d1_tpl_int_0 : Integer;
            variable in_1_0_real_din_d1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Ant_Data_In_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Ant_Data_In_0re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Ant_Data_In_0re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Ant_Data_In_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_0_real_din_d1_tpl_int_0);
                    in_1_0_real_din_d1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_1_0_real_din_d1_tpl_int_0, 32));
                    DDC_Ant_Data_In_0re_stm <= in_1_0_real_din_d1_tpl_temp;
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

        -- Generating stimulus for DDC_Ant_Data_In_1im
        DDC_Ant_Data_In_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_1_imag_din_d1_tpl_int_0 : Integer;
            variable in_1_1_imag_din_d1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Ant_Data_In_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Ant_Data_In_1im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Ant_Data_In_1im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Ant_Data_In_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_1_imag_din_d1_tpl_int_0);
                    in_1_1_imag_din_d1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_1_1_imag_din_d1_tpl_int_0, 32));
                    DDC_Ant_Data_In_1im_stm <= in_1_1_imag_din_d1_tpl_temp;
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

        -- Generating stimulus for DDC_Ant_Data_In_1re
        DDC_Ant_Data_In_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_1_real_din_d1_tpl_int_0 : Integer;
            variable in_1_1_real_din_d1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Ant_Data_In_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Ant_Data_In_1re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Ant_Data_In_1re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Ant_Data_In_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_1_real_din_d1_tpl_int_0);
                    in_1_1_real_din_d1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_1_1_real_din_d1_tpl_int_0, 32));
                    DDC_Ant_Data_In_1re_stm <= in_1_1_real_din_d1_tpl_temp;
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

        -- Generating stimulus for DDC_Ant_Data_In_2im
        DDC_Ant_Data_In_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_2_imag_din_d1_tpl_int_0 : Integer;
            variable in_1_2_imag_din_d1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Ant_Data_In_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Ant_Data_In_2im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Ant_Data_In_2im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Ant_Data_In_2im_stm_sig_stop <= '1';
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
                    read(L, in_1_2_imag_din_d1_tpl_int_0);
                    in_1_2_imag_din_d1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_1_2_imag_din_d1_tpl_int_0, 32));
                    DDC_Ant_Data_In_2im_stm <= in_1_2_imag_din_d1_tpl_temp;
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

        -- Generating stimulus for DDC_Ant_Data_In_2re
        DDC_Ant_Data_In_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_2_real_din_d1_tpl_int_0 : Integer;
            variable in_1_2_real_din_d1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Ant_Data_In_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Ant_Data_In_2re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Ant_Data_In_2re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Ant_Data_In_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_2_real_din_d1_tpl_int_0);
                    in_1_2_real_din_d1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_1_2_real_din_d1_tpl_int_0, 32));
                    DDC_Ant_Data_In_2re_stm <= in_1_2_real_din_d1_tpl_temp;
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

        -- Generating stimulus for DDC_Ant_Data_In_3im
        DDC_Ant_Data_In_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_3_imag_din_d1_tpl_int_0 : Integer;
            variable in_1_3_imag_din_d1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Ant_Data_In_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Ant_Data_In_3im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Ant_Data_In_3im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Ant_Data_In_3im_stm_sig_stop <= '1';
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
                    read(L, in_1_3_imag_din_d1_tpl_int_0);
                    in_1_3_imag_din_d1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_1_3_imag_din_d1_tpl_int_0, 32));
                    DDC_Ant_Data_In_3im_stm <= in_1_3_imag_din_d1_tpl_temp;
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

        -- Generating stimulus for DDC_Ant_Data_In_3re
        DDC_Ant_Data_In_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_1_3_real_din_d1_tpl_int_0 : Integer;
            variable in_1_3_real_din_d1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Ant_Data_In_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Ant_Data_In_3re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Ant_Data_In_3re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Ant_Data_In_3re_stm_sig_stop <= '1';
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
                    read(L, in_1_3_real_din_d1_tpl_int_0);
                    in_1_3_real_din_d1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_1_3_real_din_d1_tpl_int_0, 32));
                    DDC_Ant_Data_In_3re_stm <= in_1_3_real_din_d1_tpl_temp;
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

        -- Generating stimulus for DDC_NCO_sync_0
        DDC_NCO_sync_0_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xIn : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO_xIn.stm");
            variable xIn_s_0_int_0 : Integer;
            variable xIn_s_0_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_NCO_sync_0_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_NCO_sync_0_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_NCO_sync_0)
                IF (endfile(data_file_xIn)) THEN
                    clk_DDC_NCO_sync_0_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_xIn, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, xIn_s_0_int_0);
                    xIn_s_0_temp(0 downto 0) := std_logic_vector(to_unsigned(xIn_s_0_int_0, 1));
                    DDC_NCO_sync_0_stm <= xIn_s_0_temp;
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

        -- Generating stimulus for DDC_NCO_sync_1
        DDC_NCO_sync_1_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xIn : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO_xIn.stm");
            variable xIn_s_1_int_0 : Integer;
            variable xIn_s_1_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_NCO_sync_1_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_NCO_sync_1_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_NCO_sync_1)
                IF (endfile(data_file_xIn)) THEN
                    clk_DDC_NCO_sync_1_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_xIn, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, xIn_s_1_int_0);
                    xIn_s_1_temp(0 downto 0) := std_logic_vector(to_unsigned(xIn_s_1_int_0, 1));
                    DDC_NCO_sync_1_stm <= xIn_s_1_temp;
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

        -- Generating stimulus for DDC_NCO_sync_2
        DDC_NCO_sync_2_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xIn : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO_xIn.stm");
            variable xIn_s_2_int_0 : Integer;
            variable xIn_s_2_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_NCO_sync_2_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_NCO_sync_2_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_NCO_sync_2)
                IF (endfile(data_file_xIn)) THEN
                    clk_DDC_NCO_sync_2_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_xIn, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, xIn_s_2_int_0);
                    xIn_s_2_temp(0 downto 0) := std_logic_vector(to_unsigned(xIn_s_2_int_0, 1));
                    DDC_NCO_sync_2_stm <= xIn_s_2_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for DDC_NCO_sync_3
        DDC_NCO_sync_3_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xIn : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_Complex_NCO_xIn.stm");
            variable xIn_s_3_int_0 : Integer;
            variable xIn_s_3_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_NCO_sync_3_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_NCO_sync_3_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_NCO_sync_3)
                IF (endfile(data_file_xIn)) THEN
                    clk_DDC_NCO_sync_3_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_xIn, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, xIn_s_3_int_0);
                    xIn_s_3_temp(0 downto 0) := std_logic_vector(to_unsigned(xIn_s_3_int_0, 1));
                    DDC_NCO_sync_3_stm <= xIn_s_3_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for BW_Config_CC1_s
        BW_Config_CC1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1_Filter_Reconfig_ChannelIn_cunroll_x.stm");
            variable in_4_BWconfig_C1_tpl_int_0 : Integer;
            variable in_4_BWconfig_C1_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            BW_Config_CC1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                BW_Config_CC1_s_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to BW_Config_CC1_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_BW_Config_CC1_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_BWconfig_C1_tpl_int_0);
                    in_4_BWconfig_C1_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_4_BWconfig_C1_tpl_int_0, 8));
                    BW_Config_CC1_s_stm <= in_4_BWconfig_C1_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for DDC_Const_Data_In_0im
        DDC_Const_Data_In_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_0_imag_din_d2_tpl_int_0 : Integer;
            variable in_2_0_imag_din_d2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Const_Data_In_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Const_Data_In_0im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Const_Data_In_0im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Const_Data_In_0im_stm_sig_stop <= '1';
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
                    read(L, in_2_0_imag_din_d2_tpl_int_0);
                    in_2_0_imag_din_d2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_2_0_imag_din_d2_tpl_int_0, 32));
                    DDC_Const_Data_In_0im_stm <= in_2_0_imag_din_d2_tpl_temp;
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

        -- Generating stimulus for DDC_Const_Data_In_0re
        DDC_Const_Data_In_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_0_real_din_d2_tpl_int_0 : Integer;
            variable in_2_0_real_din_d2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Const_Data_In_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Const_Data_In_0re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Const_Data_In_0re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Const_Data_In_0re_stm_sig_stop <= '1';
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
                    read(L, in_2_0_real_din_d2_tpl_int_0);
                    in_2_0_real_din_d2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_2_0_real_din_d2_tpl_int_0, 32));
                    DDC_Const_Data_In_0re_stm <= in_2_0_real_din_d2_tpl_temp;
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

        -- Generating stimulus for DDC_Const_Data_In_1im
        DDC_Const_Data_In_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_1_imag_din_d2_tpl_int_0 : Integer;
            variable in_2_1_imag_din_d2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Const_Data_In_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Const_Data_In_1im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Const_Data_In_1im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Const_Data_In_1im_stm_sig_stop <= '1';
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
                    read(L, in_2_1_imag_din_d2_tpl_int_0);
                    in_2_1_imag_din_d2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_2_1_imag_din_d2_tpl_int_0, 32));
                    DDC_Const_Data_In_1im_stm <= in_2_1_imag_din_d2_tpl_temp;
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

        -- Generating stimulus for DDC_Const_Data_In_1re
        DDC_Const_Data_In_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_1_real_din_d2_tpl_int_0 : Integer;
            variable in_2_1_real_din_d2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Const_Data_In_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Const_Data_In_1re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Const_Data_In_1re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Const_Data_In_1re_stm_sig_stop <= '1';
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
                    read(L, in_2_1_real_din_d2_tpl_int_0);
                    in_2_1_real_din_d2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_2_1_real_din_d2_tpl_int_0, 32));
                    DDC_Const_Data_In_1re_stm <= in_2_1_real_din_d2_tpl_temp;
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

        -- Generating stimulus for DDC_Const_Data_In_2im
        DDC_Const_Data_In_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_2_imag_din_d2_tpl_int_0 : Integer;
            variable in_2_2_imag_din_d2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Const_Data_In_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Const_Data_In_2im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Const_Data_In_2im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Const_Data_In_2im_stm_sig_stop <= '1';
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
                    read(L, in_2_2_imag_din_d2_tpl_int_0);
                    in_2_2_imag_din_d2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_2_2_imag_din_d2_tpl_int_0, 32));
                    DDC_Const_Data_In_2im_stm <= in_2_2_imag_din_d2_tpl_temp;
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

        -- Generating stimulus for DDC_Const_Data_In_2re
        DDC_Const_Data_In_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_2_real_din_d2_tpl_int_0 : Integer;
            variable in_2_2_real_din_d2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Const_Data_In_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Const_Data_In_2re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Const_Data_In_2re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Const_Data_In_2re_stm_sig_stop <= '1';
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
                    read(L, in_2_2_real_din_d2_tpl_int_0);
                    in_2_2_real_din_d2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_2_2_real_din_d2_tpl_int_0, 32));
                    DDC_Const_Data_In_2re_stm <= in_2_2_real_din_d2_tpl_temp;
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

        -- Generating stimulus for DDC_Const_Data_In_3im
        DDC_Const_Data_In_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_3_imag_din_d2_tpl_int_0 : Integer;
            variable in_2_3_imag_din_d2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Const_Data_In_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Const_Data_In_3im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Const_Data_In_3im)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Const_Data_In_3im_stm_sig_stop <= '1';
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
                    read(L, dummy_int);
                    read(L, in_2_3_imag_din_d2_tpl_int_0);
                    in_2_3_imag_din_d2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_2_3_imag_din_d2_tpl_int_0, 32));
                    DDC_Const_Data_In_3im_stm <= in_2_3_imag_din_d2_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for DDC_Const_Data_In_3re
        DDC_Const_Data_In_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_3_real_din_d2_tpl_int_0 : Integer;
            variable in_2_3_real_din_d2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Const_Data_In_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Const_Data_In_3re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Const_Data_In_3re)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Const_Data_In_3re_stm_sig_stop <= '1';
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
                    read(L, in_2_3_real_din_d2_tpl_int_0);
                    in_2_3_real_din_d2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(in_2_3_real_din_d2_tpl_int_0, 32));
                    DDC_Const_Data_In_3re_stm <= in_2_3_real_din_d2_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for DDC_Const_Data_sel_s
        DDC_Const_Data_sel_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Const_sel_Channel_In_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_5_mux_sel_tpl_int_0 : Integer;
            variable in_5_mux_sel_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            DDC_Const_Data_sel_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DDC_Const_Data_sel_s_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DDC_Const_Data_sel_s)
                IF (endfile(data_file_Channel_In_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_DDC_Const_Data_sel_s_stm_sig_stop <= '1';
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
                    read(L, in_5_mux_sel_tpl_int_0);
                    in_5_mux_sel_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_5_mux_sel_tpl_int_0, 1));
                    DDC_Const_Data_sel_s_stm <= in_5_mux_sel_tpl_temp;
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

        -- Generating stimulus for ddc_l1_dout_im
        ddc_l1_dout_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_chan_filter_Scaleim_qOut.stm");
            variable qOut_0_int_0 : Integer;
            variable qOut_0_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            ddc_l1_dout_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to ddc_l1_dout_im)
                IF (endfile(data_file_qOut)) THEN
                    clk_ddc_l1_dout_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_0_int_0);
                    qOut_0_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_0_int_0, 16));
                    ddc_l1_dout_im_stm <= qOut_0_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for ddc_l1_dout_re
        ddc_l1_dout_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_chan_filter_Scale_re_qOut.stm");
            variable qOut_0_int_0 : Integer;
            variable qOut_0_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            ddc_l1_dout_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to ddc_l1_dout_re)
                IF (endfile(data_file_qOut)) THEN
                    clk_ddc_l1_dout_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_0_int_0);
                    qOut_0_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_0_int_0, 16));
                    ddc_l1_dout_re_stm <= qOut_0_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for ddc_l1_vout_s
        ddc_l1_vout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_chan_filter_Scale_re_qOut.stm");
            variable qOut_v_int_0 : Integer;
            variable qOut_v_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            ddc_l1_vout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to ddc_l1_vout_s)
                IF (endfile(data_file_qOut)) THEN
                    clk_ddc_l1_vout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, qOut_v_int_0);
                    qOut_v_temp(0 downto 0) := std_logic_vector(to_unsigned(qOut_v_int_0, 1));
                    ddc_l1_vout_s_stm <= qOut_v_temp;
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

        -- Generating stimulus for ddc_l1_cout_s
        ddc_l1_cout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_Chan_Filter_l1_Chan_Filter_chan_filter_Scale_re_qOut.stm");
            variable qOut_c_int_0 : Integer;
            variable qOut_c_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            ddc_l1_cout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to ddc_l1_cout_s)
                IF (endfile(data_file_qOut)) THEN
                    clk_ddc_l1_cout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, qOut_c_int_0);
                    qOut_c_temp(7 downto 0) := std_logic_vector(to_unsigned(qOut_c_int_0, 8));
                    ddc_l1_cout_s_stm <= qOut_c_temp;
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

        -- Generating stimulus for mixer_l1_dout_0im
        mixer_l1_dout_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_Scale_qOut.stm");
            variable qOut_4_int_0 : Integer;
            variable qOut_4_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            mixer_l1_dout_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to mixer_l1_dout_0im)
                IF (endfile(data_file_qOut)) THEN
                    clk_mixer_l1_dout_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_4_int_0);
                    qOut_4_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_4_int_0, 16));
                    mixer_l1_dout_0im_stm <= qOut_4_temp;
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

        -- Generating stimulus for mixer_l1_dout_0re
        mixer_l1_dout_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_Scale_qOut.stm");
            variable qOut_0_int_0 : Integer;
            variable qOut_0_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            mixer_l1_dout_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to mixer_l1_dout_0re)
                IF (endfile(data_file_qOut)) THEN
                    clk_mixer_l1_dout_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_0_int_0);
                    qOut_0_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_0_int_0, 16));
                    mixer_l1_dout_0re_stm <= qOut_0_temp;
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

        -- Generating stimulus for mixer_l1_dout_1im
        mixer_l1_dout_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_Scale_qOut.stm");
            variable qOut_5_int_0 : Integer;
            variable qOut_5_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            mixer_l1_dout_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to mixer_l1_dout_1im)
                IF (endfile(data_file_qOut)) THEN
                    clk_mixer_l1_dout_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_5_int_0);
                    qOut_5_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_5_int_0, 16));
                    mixer_l1_dout_1im_stm <= qOut_5_temp;
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

        -- Generating stimulus for mixer_l1_dout_1re
        mixer_l1_dout_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_Scale_qOut.stm");
            variable qOut_1_int_0 : Integer;
            variable qOut_1_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            mixer_l1_dout_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to mixer_l1_dout_1re)
                IF (endfile(data_file_qOut)) THEN
                    clk_mixer_l1_dout_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_1_int_0);
                    qOut_1_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_1_int_0, 16));
                    mixer_l1_dout_1re_stm <= qOut_1_temp;
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

        -- Generating stimulus for mixer_l1_dout_2im
        mixer_l1_dout_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_Scale_qOut.stm");
            variable qOut_6_int_0 : Integer;
            variable qOut_6_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            mixer_l1_dout_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to mixer_l1_dout_2im)
                IF (endfile(data_file_qOut)) THEN
                    clk_mixer_l1_dout_2im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_6_int_0);
                    qOut_6_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_6_int_0, 16));
                    mixer_l1_dout_2im_stm <= qOut_6_temp;
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

        -- Generating stimulus for mixer_l1_dout_2re
        mixer_l1_dout_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_Scale_qOut.stm");
            variable qOut_2_int_0 : Integer;
            variable qOut_2_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            mixer_l1_dout_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to mixer_l1_dout_2re)
                IF (endfile(data_file_qOut)) THEN
                    clk_mixer_l1_dout_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_2_int_0);
                    qOut_2_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_2_int_0, 16));
                    mixer_l1_dout_2re_stm <= qOut_2_temp;
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

        -- Generating stimulus for mixer_l1_dout_3im
        mixer_l1_dout_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_Scale_qOut.stm");
            variable qOut_7_int_0 : Integer;
            variable qOut_7_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            mixer_l1_dout_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to mixer_l1_dout_3im)
                IF (endfile(data_file_qOut)) THEN
                    clk_mixer_l1_dout_3im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_7_int_0);
                    qOut_7_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_7_int_0, 16));
                    mixer_l1_dout_3im_stm <= qOut_7_temp;
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

        -- Generating stimulus for mixer_l1_dout_3re
        mixer_l1_dout_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_Scale_qOut.stm");
            variable qOut_3_int_0 : Integer;
            variable qOut_3_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            mixer_l1_dout_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to mixer_l1_dout_3re)
                IF (endfile(data_file_qOut)) THEN
                    clk_mixer_l1_dout_3re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_3_int_0);
                    qOut_3_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_3_int_0, 16));
                    mixer_l1_dout_3re_stm <= qOut_3_temp;
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

        -- Generating stimulus for mixer_l1_vout_s
        mixer_l1_vout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_Scale_qOut.stm");
            variable qOut_v_int_0 : Integer;
            variable qOut_v_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            mixer_l1_vout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to mixer_l1_vout_s)
                IF (endfile(data_file_qOut)) THEN
                    clk_mixer_l1_vout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, qOut_v_int_0);
                    qOut_v_temp(0 downto 0) := std_logic_vector(to_unsigned(qOut_v_int_0, 1));
                    mixer_l1_vout_s_stm <= qOut_v_temp;
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

        -- Generating stimulus for mixer_l1_cout_s
        mixer_l1_cout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_Scale_qOut.stm");
            variable qOut_c_int_0 : Integer;
            variable qOut_c_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            mixer_l1_cout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to mixer_l1_cout_s)
                IF (endfile(data_file_qOut)) THEN
                    clk_mixer_l1_cout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, qOut_c_int_0);
                    qOut_c_temp(7 downto 0) := std_logic_vector(to_unsigned(qOut_c_int_0, 8));
                    mixer_l1_cout_s_stm <= qOut_c_temp;
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

    clk_stm_sig_stop <= clk_DDC_Valid_In_s_stm_sig_stop OR clk_DDC_Chan_In_s_stm_sig_stop OR clk_DDC_Ant_Data_In_0im_stm_sig_stop OR clk_DDC_Ant_Data_In_0re_stm_sig_stop OR clk_DDC_Ant_Data_In_1im_stm_sig_stop OR clk_DDC_Ant_Data_In_1re_stm_sig_stop OR clk_DDC_Ant_Data_In_2im_stm_sig_stop OR clk_DDC_Ant_Data_In_2re_stm_sig_stop OR clk_DDC_Ant_Data_In_3im_stm_sig_stop OR clk_DDC_Ant_Data_In_3re_stm_sig_stop OR clk_DDC_NCO_sync_0_stm_sig_stop OR clk_DDC_NCO_sync_1_stm_sig_stop OR clk_DDC_NCO_sync_2_stm_sig_stop OR clk_DDC_NCO_sync_3_stm_sig_stop OR clk_BW_Config_CC1_s_stm_sig_stop OR clk_DDC_Const_Data_In_0im_stm_sig_stop OR clk_DDC_Const_Data_In_0re_stm_sig_stop OR clk_DDC_Const_Data_In_1im_stm_sig_stop OR clk_DDC_Const_Data_In_1re_stm_sig_stop OR clk_DDC_Const_Data_In_2im_stm_sig_stop OR clk_DDC_Const_Data_In_2re_stm_sig_stop OR clk_DDC_Const_Data_In_3im_stm_sig_stop OR clk_DDC_Const_Data_In_3re_stm_sig_stop OR clk_DDC_Const_Data_sel_s_stm_sig_stop OR clk_ddc_l1_dout_im_stm_sig_stop OR clk_ddc_l1_dout_re_stm_sig_stop OR clk_ddc_l1_vout_s_stm_sig_stop OR clk_ddc_l1_cout_s_stm_sig_stop OR clk_mixer_l1_dout_0im_stm_sig_stop OR clk_mixer_l1_dout_0re_stm_sig_stop OR clk_mixer_l1_dout_1im_stm_sig_stop OR clk_mixer_l1_dout_1re_stm_sig_stop OR clk_mixer_l1_dout_2im_stm_sig_stop OR clk_mixer_l1_dout_2re_stm_sig_stop OR clk_mixer_l1_dout_3im_stm_sig_stop OR clk_mixer_l1_dout_3re_stm_sig_stop OR clk_mixer_l1_vout_s_stm_sig_stop OR clk_mixer_l1_cout_s_stm_sig_stop OR '0';
    bus_clk_stm_sig_stop <= '1';


    END normal;
