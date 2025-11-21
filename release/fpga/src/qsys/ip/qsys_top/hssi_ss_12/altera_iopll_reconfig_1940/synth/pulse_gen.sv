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


// =================================================================================
// Creates a pulsed signal from an input signal
// =================================================================================

module pulse_gen (
    input  logic clk,            // the DPS clock
    input  logic rst,            // active high reset
    input  logic signal,         // the user's pulsed_signal signal
    output logic pulsed_signal  // the pulsed_signal signal for the IOPLL atom
 );
 
    //-------------------------------------------------------------------------
    // States
    localparam IDLE        = 0,  // Idle state: signal = 0, pulsed_signal = 0
               PULSE       = 1,  // Activate state: pulsed_signal = 1
               WAIT        = 2;  // Wait for signal to go low

    //-------------------------------------------------------------------------
    // FSM current and next states
    logic [1:0] state, next;     
    
    // State update
    always @(posedge clk) begin
        if (rst)    state <= IDLE;
        else        state <= next; 
    end  

    //-------------------------------------------------------------------------    
    // Next-state and output logic
    always @(*) begin
        next          = IDLE;  // Default next state 
        pulsed_signal = 1'b0;  // Default output
        
        case (state)
            IDLE :  begin
                        if (signal)  next = PULSE;
                        else         next = IDLE;
                    end     
                         
            PULSE : begin
                        pulsed_signal = 1'b1;
                        next          = WAIT;
                    end
                         
            WAIT :  begin         
                        if (~signal) next = IDLE;
                        else         next = WAIT;                  
                    end  
        endcase
    end
     
 endmodule




`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "/1LncPXBazoK+fGTWAurOKtT7jFAhDnUNtIbG3zqp0Q2OTOB4gRH5BbKv0zjFxjugZ85WLF1cCEC11Fs/mBIz/Z2s5fS+5kod5W7Ceuxj1WwPJwjhDwh2d5Cxk1KWRFbItt8/KiLTnobJNBec821qwz4sC0xxoBXAXnizMwPYrZP9JxTueXFiTPjw0n0puUGyslY++A7KJuBjcKRgbejqL9OUKmwYDGv2a8Ps0CHMnhi16T2aOY7xqHRjtCSHl1stuzJNlVAZqUKIzSQcevGJ3VH7vZ3IXrJ6F2bAJMRAeheb+zUmxA/o8sraIXF9Nphkwq1L12mYS+0G38B8fFh5eaZauaLcry0zdslTuJ7oGHvU7cNfkxLFU5z2j5V3tBjNq9eA6JlpRZJGcpfoV+rGO7BeZ+GSrrazcP35DZwH3t20ncAX/Cj1QrVLOLjirWuyVF7qSfJIQp9bR91fOnxzDE04JEpxF9iDsY2hJ40gvieR4bpf4+c07O/ec6FiEuhWQOIL+0hnawmDjSXvMmEQhpA885QTPRBGTj/XRAnFbxMnYaj79CDB9svZSQuhOz1Od1+X4JndBsbtngH5JqQP5q7sMXwrprckkzo16xeh8MHX01QB0O9CZRkX6JrefLvnEDdPfPGQd2lMMjxImo5GHoHfbzLGalD+D6E/EZ5bbSn9Yuc95o9M+FesGirxPdzGtKj2TUxVbEnJgr+DZrtPqS/OFpQSuxnAzpGmjB3Gqtr0gMeZIhkLBzQFOBNcEPqIMO9Q+DNxPT6rbPDZYI/JC5tu5Z09IRhfWft+uYlbANmKs+Xwo/RUy8kwn/J5WcicPghWBAMZFdiQ9ssmXsonUu7T/jJtaVrkIewypt1vXO9O63EmvejcI9CUjeu1enwWnLIfKhNKeztZnYJYf/roE4eEkwAsuUzARgNRrVDijTADEE50P2nPu8xduUo7Yg8ji5yu/l9uT5M+O2ioxDV9NF5NiHsOq0vUHZmR5Cgz6MgEel9bawaIJE/qOgi5KP8"
`endif