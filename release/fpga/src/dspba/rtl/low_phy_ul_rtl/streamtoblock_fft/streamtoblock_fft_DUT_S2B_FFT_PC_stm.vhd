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

-- VHDL created from streamtoblock_fft_DUT_S2B_FFT_PC
-- VHDL created on Thu Jun 12 21:29:54 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.streamtoblock_fft_DUT_safe_path.all;

entity streamtoblock_fft_DUT_S2B_FFT_PC_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        in_1_rx_vin1_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_rx_chin1_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_imag_rx_din1_tpl_stm : out std_logic_vector(15 downto 0);
        in_3_real_rx_din1_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_fft_in1_tpl_stm : out std_logic_vector(3 downto 0);
        in_5_cp_in1_tpl_stm : out std_logic_vector(15 downto 0);
        in_6_nprb1_tpl_stm : out std_logic_vector(15 downto 0);
        in_7_hcs_bypass_l1_tpl_stm : out std_logic_vector(0 downto 0);
        in_8_fft_gain_l1_tpl_stm : out std_logic_vector(15 downto 0);
        in_9_fft_gain_im_l1_tpl_stm : out std_logic_vector(15 downto 0);
        in_10_fft_shift_l1_tpl_stm : out std_logic_vector(3 downto 0);
        in_11_time_ref_in1_tpl_stm : out std_logic_vector(63 downto 0);
        in_12_DC_SC_EN_tpl_stm : out std_logic_vector(0 downto 0);
        in_13_CP_EN1_tpl_stm : out std_logic_vector(0 downto 0);
        in_14_ripple_comp_en_tpl_stm : out std_logic_vector(0 downto 0);
        in_15_rc_bw_sel_tpl_stm : out std_logic_vector(0 downto 0);
        in_16_sym_metadata_in_tpl_stm : out std_logic_vector(63 downto 0);
        in_17_sym_metadata_in_valid_tpl_stm : out std_logic_vector(0 downto 0);
        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl_stm : out std_logic_vector(31 downto 0);
        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl_stm : out std_logic_vector(0 downto 0);
        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl_stm : out std_logic_vector(31 downto 0);
        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl_stm : out std_logic_vector(0 downto 0);
        in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : out std_logic_vector(15 downto 0);
        in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_rx_valid_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_rx_chout_tpl_stm : out std_logic_vector(7 downto 0);
        out_3_imag_rx_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_3_real_rx_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_4_rx_time_out_tpl_stm : out std_logic_vector(63 downto 0);
        out_5_td_fft_in_v_tpl_stm : out std_logic_vector(0 downto 0);
        out_6_td_fft_in_chout_tpl_stm : out std_logic_vector(7 downto 0);
        out_7_imag_td_fft_in_d_tpl_stm : out std_logic_vector(15 downto 0);
        out_7_real_td_fft_in_d_tpl_stm : out std_logic_vector(15 downto 0);
        out_8_nsc_out_tpl_stm : out std_logic_vector(15 downto 0);
        out_9_size_out_tpl_stm : out std_logic_vector(3 downto 0);
        out_10_td_time_out_tpl_stm : out std_logic_vector(63 downto 0);
        out_11_fd_data_v_tpl_stm : out std_logic_vector(0 downto 0);
        out_12_fd_data_c_tpl_stm : out std_logic_vector(7 downto 0);
        out_13_imag_fd_data_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_13_real_fd_data_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_14_eAxCout_tpl_stm : out std_logic_vector(1 downto 0);
        out_15_symmetadataout_tpl_stm : out std_logic_vector(63 downto 0);
        out_16_eop_eAxC_tpl_stm : out std_logic_vector(0 downto 0);
        out_17_eop_sym_tpl_stm : out std_logic_vector(0 downto 0);
        out_18_sop_eAxC_tpl_stm : out std_logic_vector(0 downto 0);
        out_19_sop_sym_tpl_stm : out std_logic_vector(0 downto 0);
        out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : out std_logic_vector(11 downto 0);
        out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : out std_logic_vector(11 downto 0);
        out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : out std_logic_vector(15 downto 0);
        out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : out std_logic_vector(15 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end streamtoblock_fft_DUT_S2B_FFT_PC_stm;

architecture normal of streamtoblock_fft_DUT_S2B_FFT_PC_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';
    signal bus_clk_busIn_stm_sig_stop : std_logic := '0';

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
            file data_file_busIn : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_busIn.stm");
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
        -- Driving gnd for in_1_rx_vin1_tpl signals

        in_1_rx_vin1_tpl_stm <= (others => '0');
        -- Driving gnd for in_2_rx_chin1_tpl signals

        in_2_rx_chin1_tpl_stm <= (others => '0');
        -- Driving gnd for in_3_imag_rx_din1_tpl signals

        in_3_imag_rx_din1_tpl_stm <= (others => '0');
        -- Driving gnd for in_3_real_rx_din1_tpl signals

        in_3_real_rx_din1_tpl_stm <= (others => '0');
        -- Driving gnd for in_4_fft_in1_tpl signals

        in_4_fft_in1_tpl_stm <= (others => '0');
        -- Driving gnd for in_5_cp_in1_tpl signals

        in_5_cp_in1_tpl_stm <= (others => '0');
        -- Driving gnd for in_6_nprb1_tpl signals

        in_6_nprb1_tpl_stm <= (others => '0');
        -- Driving gnd for in_7_hcs_bypass_l1_tpl signals

        in_7_hcs_bypass_l1_tpl_stm <= (others => '0');
        -- Driving gnd for in_8_fft_gain_l1_tpl signals

        in_8_fft_gain_l1_tpl_stm <= (others => '0');
        -- Driving gnd for in_9_fft_gain_im_l1_tpl signals

        in_9_fft_gain_im_l1_tpl_stm <= (others => '0');
        -- Driving gnd for in_10_fft_shift_l1_tpl signals

        in_10_fft_shift_l1_tpl_stm <= (others => '0');
        -- Driving gnd for in_11_time_ref_in1_tpl signals

        in_11_time_ref_in1_tpl_stm <= (others => '0');
        -- Driving gnd for in_12_DC_SC_EN_tpl signals

        in_12_DC_SC_EN_tpl_stm <= (others => '0');
        -- Driving gnd for in_13_CP_EN1_tpl signals

        in_13_CP_EN1_tpl_stm <= (others => '0');
        -- Driving gnd for in_14_ripple_comp_en_tpl signals

        in_14_ripple_comp_en_tpl_stm <= (others => '0');
        -- Driving gnd for in_15_rc_bw_sel_tpl signals

        in_15_rc_bw_sel_tpl_stm <= (others => '0');
        -- Driving gnd for in_16_sym_metadata_in_tpl signals

        in_16_sym_metadata_in_tpl_stm <= (others => '0');
        -- Driving gnd for in_17_sym_metadata_in_valid_tpl signals

        in_17_sym_metadata_in_valid_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl signals

        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl signals

        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl signals

        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl signals

        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl signals

        in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl signals

        in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_rx_valid_tpl signals

        out_1_rx_valid_tpl_stm <= (others => '0');
        -- Driving gnd for out_2_rx_chout_tpl signals

        out_2_rx_chout_tpl_stm <= (others => '0');
        -- Driving gnd for out_3_imag_rx_dout_tpl signals

        out_3_imag_rx_dout_tpl_stm <= (others => '0');
        -- Driving gnd for out_3_real_rx_dout_tpl signals

        out_3_real_rx_dout_tpl_stm <= (others => '0');
        -- Driving gnd for out_4_rx_time_out_tpl signals

        out_4_rx_time_out_tpl_stm <= (others => '0');
        -- Driving gnd for out_5_td_fft_in_v_tpl signals

        out_5_td_fft_in_v_tpl_stm <= (others => '0');
        -- Driving gnd for out_6_td_fft_in_chout_tpl signals

        out_6_td_fft_in_chout_tpl_stm <= (others => '0');
        -- Driving gnd for out_7_imag_td_fft_in_d_tpl signals

        out_7_imag_td_fft_in_d_tpl_stm <= (others => '0');
        -- Driving gnd for out_7_real_td_fft_in_d_tpl signals

        out_7_real_td_fft_in_d_tpl_stm <= (others => '0');
        -- Driving gnd for out_8_nsc_out_tpl signals

        out_8_nsc_out_tpl_stm <= (others => '0');
        -- Driving gnd for out_9_size_out_tpl signals

        out_9_size_out_tpl_stm <= (others => '0');
        -- Driving gnd for out_10_td_time_out_tpl signals

        out_10_td_time_out_tpl_stm <= (others => '0');
        -- Driving gnd for out_11_fd_data_v_tpl signals

        out_11_fd_data_v_tpl_stm <= (others => '0');
        -- Driving gnd for out_12_fd_data_c_tpl signals

        out_12_fd_data_c_tpl_stm <= (others => '0');
        -- Driving gnd for out_13_imag_fd_data_q_tpl signals

        out_13_imag_fd_data_q_tpl_stm <= (others => '0');
        -- Driving gnd for out_13_real_fd_data_q_tpl signals

        out_13_real_fd_data_q_tpl_stm <= (others => '0');
        -- Driving gnd for out_14_eAxCout_tpl signals

        out_14_eAxCout_tpl_stm <= (others => '0');
        -- Driving gnd for out_15_symmetadataout_tpl signals

        out_15_symmetadataout_tpl_stm <= (others => '0');
        -- Driving gnd for out_16_eop_eAxC_tpl signals

        out_16_eop_eAxC_tpl_stm <= (others => '0');
        -- Driving gnd for out_17_eop_sym_tpl signals

        out_17_eop_sym_tpl_stm <= (others => '0');
        -- Driving gnd for out_18_sop_eAxC_tpl signals

        out_18_sop_eAxC_tpl_stm <= (others => '0');
        -- Driving gnd for out_19_sop_sym_tpl signals

        out_19_sop_sym_tpl_stm <= (others => '0');
        -- Driving gnd for out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl signals

        out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm <= (others => '0');
        -- Driving gnd for out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl signals

        out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm <= (others => '0');
        -- Driving gnd for out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl signals

        out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm <= (others => '0');
        -- Driving gnd for out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl signals

        out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm <= (others => '0');

    clk_stm_sig_stop <= '1';
    bus_clk_stm_sig_stop <= bus_clk_busIn_stm_sig_stop OR '0';


    END normal;
