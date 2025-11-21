// (C) 2001-2024 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

package alt_ehipc3_dr_package;
    typedef enum logic [3:0] {
        IDLE,
        CTRL_CSR_ASSERT,
        CTRL_CSR_DEASSERT,
        CTRL_TX_ASSERT,
        CTRL_TX_DEASSERT,
        CTRL_RX_ASSERT,
        CTRL_RX_DEASSERT,
        CTRL_LTD_ASSERT,
        CTRL_LTD_DEASSERT,
        CTRL_KR_ASSERT,
        CTRL_KR_DEASSERT
    } ctrl_code_t;
    
endpackage
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "JpPS8d6tPDp/2zT9ezT5MHqWEof2ccw6arnPkL05qvBYILf/xc8QxaAKufyl0nkqAcPJp2KG/liWG1fiXI4qE23zuFhk2+VvLyr2m4vU7JXZ6awKLccaAqeGltTS2IM9y88NfQ69EA86+hrvgmu/I935RfsBv/Udtht2JNj6HTSmEctaWKVQemKdw0HCATHy3pRoZQq/gd/ZpEU5lQIKfq1kXVil77XMGpLwPylY0hdGd5jcSnZTHBoHUss261D3AOqahZmGdJTa12zLJLQTanKSzdyQWzEpShjnwTU3Fk1K2mYvbJB8/XtYpPOHamdCCbOKjA+w8mUb9Zm0JJuTITOHaZeRQif3TJ4x3rwlsvr7XkJgOEOecFmai9NnOczLC4211zg1+We+xIpwMqXO2h+Vm0UzQffnZMRJIASs2vx9GQlIgVsnaKhGcOk+a1bLYjsF7Psr3uXqLsfkVORmKh/nj9hCO61DuFpdSkPDttQUODZq4QbbEaeutnMtyfYBX3Yg0x0ATCGssD/LR/3JqmM7CKF8sH+OG9gPpvD7R8cOO4CODlf4rpbAQbmxxJ8gmZX4BFW0B/oa88qQlzfAA28UJhmjUbdiNTwpHTN+xuBAh98G/pATv6Lx9Qmd6xzZFL4CIiCNYVD4cso0adf+8zW46+6Xzj9Pi58kF7oSxJ8N3c/bZ7zHmZIgdKc6wvSQqAHy/+TZaZOCfklBaudcop73n4Aok0GLQbbzSMoAseErVRl7YcFCmN08HZFyoqCFg/q0fDZFnICR7o8r2QpwGGq+x22Cv28oI1DE3NyrvsnoEvkbaI5FFL+0m3CyKQ2mqX3Y5MzQAf0SoQq/I6NzJKNdUqu5Awbe11RvuW9vgh3Z5C9TVVCuCkiN9C/jSnnQYXOicTUZ3TOFabRkyeDZWcKRuuhGHbRfXhKustP9ax3r3Ahs/Ck1wvj4l0JlOhnWKJlGNeSUBOw1KZbEbEGcn8ox26o0AiOojCxulTLRi8v3Y06UU4tblgFQuVuqvdKH"
`endif