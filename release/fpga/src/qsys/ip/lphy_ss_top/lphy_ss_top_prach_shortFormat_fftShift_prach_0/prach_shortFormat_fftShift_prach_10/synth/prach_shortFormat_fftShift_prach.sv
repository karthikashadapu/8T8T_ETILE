// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.3 (Release Build #f9894c94f4)
// Quartus Prime development tool and MATLAB/Simulink Interface
// 
// Legal Notice: Copyright 2023 Intel Corporation.  All rights reserved.
// Your use of  Intel Corporation's design tools,  logic functions and other
// software and  tools, and its AMPP partner logic functions, and any output
// files any  of the foregoing (including  device programming  or simulation
// files), and  any associated  documentation  or information  are expressly
// subject  to the terms and  conditions of the  Intel FPGA Software License
// Agreement, Intel MegaCore Function License Agreement, or other applicable
// license agreement,  including,  without limitation,  that your use is for
// the  sole  purpose of  programming  logic devices  manufactured by  Intel
// and  sold by Intel  or its authorized  distributors. Please refer  to the
// applicable agreement for further details.
// ---------------------------------------------------------------------------

// SystemVerilog created from prach_shortFormat_fftShift_prach
// SystemVerilog created on Wed Nov  6 19:28:33 2024


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module prach_shortFormat_fftShift_prach (
    input wire [31:0] busIn_writedata,
    input wire [9:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [31:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [0:0] vin1_s,
    input wire [7:0] chin1_s,
    input wire [15:0] din1_im,
    input wire [15:0] din1_re,
    input wire [11:0] SFN_s,
    input wire [7:0] SubFN_s,
    input wire [1:0] SCSby15_s,
    input wire [7:0] BWby10_s,
    input wire [22:0] CPLen_cplane_s,
    input wire [22:0] timeoffset_cplane_s,
    input wire [3:0] numsym_cplane_s,
    input wire [1:0] slotID_cplane_s,
    input wire [3:0] startsym_cplane_s,
    input wire [28:0] timerefin_cplane_s,
    input wire [1:0] cur_slot_s,
    input wire [7:0] SubFN_cplane_s,
    input wire [0:0] cbar_mplane_s,
    input wire [22:0] timeoffset_bias_cplane_s,
    input wire [22:0] startsym_bias_cplane_s,
    input wire [15:0] gain_in_re_s,
    input wire [15:0] gain_in_imag_s,
    output wire [0:0] fftShift_v_s,
    output wire [7:0] fftShift_c_s,
    output wire [15:0] fftShift_d_im,
    output wire [15:0] fftShift_d_re,
    output wire [28:0] TimeReference_s,
    input wire clk,
    input wire areset,
    input wire bus_clk,
    input wire bus_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [31:0] busFabric_busOut_readdata;
    wire [0:0] busFabric_busOut_readdatavalid;
    wire [7:0] busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl;
    wire [2:0] busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl;
    wire [0:0] busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl;
    wire [0:0] busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl;
    wire [7:0] busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl;
    wire [11:0] busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl;
    wire [0:0] PRACH_CC_cunroll_x_out_6_fftShift_v_tpl;
    wire [7:0] PRACH_CC_cunroll_x_out_7_fftShift_c_tpl;
    wire [15:0] PRACH_CC_cunroll_x_out_8_imag_fftShift_d_tpl;
    wire [15:0] PRACH_CC_cunroll_x_out_8_real_fftShift_d_tpl;
    wire [28:0] PRACH_CC_cunroll_x_out_9_TimeReference_tpl;
    reg [0:0] prach_shortFormat_fftShift_prach_readDelayed_q;
    wire [0:0] prach_shortFormat_fftShift_prach_readDataValid_q;

    import prach_shortFormat_fftShift_prach_safe_path_ver::safe_path_ver;

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // busFabric(BLACKBOX,2)
    busFabric_prach_shortFormat_fftShift_prach_3i06i3ib0063663c63o60160760uq5ux5gubo0u thebusFabric (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .busOut_readdata(busFabric_busOut_readdata),
        .busOut_readdatavalid(busFabric_busOut_readdatavalid),
        .out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl(busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl),
        .out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl(busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl),
        .out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl(busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl),
        .out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl(busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl),
        .out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl(busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl),
        .out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl(busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl),
        .clk(clk),
        .areset(areset),
        .bus_clk(bus_clk),
        .bus_areset(bus_areset)
    );

    // prach_shortFormat_fftShift_prach_readDelayed(DELAY,39)
    always @ (posedge bus_clk)
    begin
        if (bus_areset)
        begin
            prach_shortFormat_fftShift_prach_readDelayed_q <= '0;
        end
        else
        begin
            prach_shortFormat_fftShift_prach_readDelayed_q <= $unsigned(busIn_read);
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // prach_shortFormat_fftShift_prach_readDataValid(LOGICAL,40)
    assign prach_shortFormat_fftShift_prach_readDataValid_q = busFabric_busOut_readdatavalid | prach_shortFormat_fftShift_prach_readDelayed_q;

    // busOut(BUSOUT,4)
    assign busOut_readdatavalid = prach_shortFormat_fftShift_prach_readDataValid_q;
    assign busOut_readdata = busFabric_busOut_readdata;
    assign busOut_waitrequest = GND_q;

    // PRACH_CC_cunroll_x(BLACKBOX,6)
    prach_shortFormat_fftShift_prach_PRACH_CC thePRACH_CC_cunroll_x (
        .in_1_imag_din0_tpl(din1_im),
        .in_1_real_din0_tpl(din1_re),
        .in_2_vin0_tpl(vin1_s),
        .in_3_chin0_tpl(chin1_s),
        .in_4_SFN_tpl(SFN_s),
        .in_5_SubFN_tpl(SubFN_s),
        .in_6_SCSby15_tpl(SCSby15_s),
        .in_7_BWby10_tpl(BWby10_s),
        .in_8_CPLen_cplane_tpl(CPLen_cplane_s),
        .in_9_timeoffset_cplane_tpl(timeoffset_cplane_s),
        .in_10_numsym_cplane_tpl(numsym_cplane_s),
        .in_11_slotID_cplane_tpl(slotID_cplane_s),
        .in_12_startsym_cplane_tpl(startsym_cplane_s),
        .in_13_timerefin_cplane_tpl(timerefin_cplane_s),
        .in_14_cur_slot_tpl(cur_slot_s),
        .in_15_SubFN_cplane_tpl(SubFN_cplane_s),
        .in_16_cbar_mplane_sel_tpl(cbar_mplane_s),
        .in_17_time_offset_bias_tpl(timeoffset_bias_cplane_s),
        .in_18_startsym_bias_tpl(startsym_bias_cplane_s),
        .in_19_gain_in_re_tpl(gain_in_re_s),
        .in_20_gain_in_im_tpl(gain_in_imag_s),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl(busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl(busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl(busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl(busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl(busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl),
        .in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl(busFabric_out_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl),
        .out_1_qv_tpl(),
        .out_2_qch_tpl(),
        .out_3_imag_q_tpl(),
        .out_3_real_q_tpl(),
        .out_4_qv139_tpl(),
        .out_5_qFreqBinIdx_tpl(),
        .out_6_fftShift_v_tpl(PRACH_CC_cunroll_x_out_6_fftShift_v_tpl),
        .out_7_fftShift_c_tpl(PRACH_CC_cunroll_x_out_7_fftShift_c_tpl),
        .out_8_imag_fftShift_d_tpl(PRACH_CC_cunroll_x_out_8_imag_fftShift_d_tpl),
        .out_8_real_fftShift_d_tpl(PRACH_CC_cunroll_x_out_8_real_fftShift_d_tpl),
        .out_9_TimeReference_tpl(PRACH_CC_cunroll_x_out_9_TimeReference_tpl),
        .clk(clk),
        .areset(areset)
    );

    // fftShift_v_s(GPOUT,30)
    assign fftShift_v_s = PRACH_CC_cunroll_x_out_6_fftShift_v_tpl;

    // fftShift_c_s(GPOUT,31)
    assign fftShift_c_s = PRACH_CC_cunroll_x_out_7_fftShift_c_tpl;

    // fftShift_d_im(GPOUT,32)
    assign fftShift_d_im = PRACH_CC_cunroll_x_out_8_imag_fftShift_d_tpl;

    // fftShift_d_re(GPOUT,33)
    assign fftShift_d_re = PRACH_CC_cunroll_x_out_8_real_fftShift_d_tpl;

    // TimeReference_s(GPOUT,34)
    assign TimeReference_s = PRACH_CC_cunroll_x_out_9_TimeReference_tpl;

endmodule
