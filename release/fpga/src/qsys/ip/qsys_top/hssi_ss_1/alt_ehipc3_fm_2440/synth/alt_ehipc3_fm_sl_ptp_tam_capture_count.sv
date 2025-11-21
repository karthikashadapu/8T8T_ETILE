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


// (C) 2001-2019 Intel Corporation. All rights reserved.
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



// Kazim
// This block is capturing the TAM value and corresponding counts to adjust the UI value through AVMM writes
`timescale 1ns / 1ns
module alt_ehipc3_fm_sl_ptp_tam_capture_count (    
    input  logic        i_tx_clk,
    input  logic        i_tx_rst_n,
    input  logic [47:0] i_tx_tam,
    input  logic        i_tx_tam_load,
    output logic [47:0] o_tx_tam_capture,
    output logic [15:0] o_tx_tam_count,
    output logic        o_tx_tam_cap_valid,
    
    input  logic        i_rx_clk,
    input  logic        i_rx_rst_n,
    input  logic [47:0] i_rx_tam,
    input  logic        i_rx_tam_load, 
    output logic [47:0] o_rx_tam_capture,
    output logic [15:0] o_rx_tam_count,
    output logic        o_rx_tam_cap_valid
);

reg [47:0] tx_tam_capture;
reg [15:0] tx_tam_count;
reg        tx_tam_cap_valid;
reg        tx_tam_load_r;
reg [47:0] rx_tam_capture;
reg [15:0] rx_tam_count;
reg        rx_tam_cap_valid;
reg        rx_tam_load_r;

wire       tx_tam_load_pulse;
wire       rx_tam_load_pulse;
assign     tx_tam_load_pulse = i_tx_tam_load & ~tx_tam_load_r;
assign     rx_tam_load_pulse = i_rx_tam_load & ~rx_tam_load_r;

// TX TAM 
always @(posedge i_tx_clk) begin
    if(!i_tx_rst_n) begin
        tx_tam_load_r <= 1'b0;
    end
    else  begin
        tx_tam_load_r <= i_tx_tam_load;    
    end
end

always @(posedge i_tx_clk) begin
    if(!i_tx_rst_n) begin
        tx_tam_count   <= 16'h0;
    end
    else if (tx_tam_load_pulse) begin
        tx_tam_count   <= tx_tam_count + 1'b1;      
    end
end

always @(posedge i_tx_clk) begin
    if (tx_tam_load_pulse) begin
        tx_tam_capture <= i_tx_tam;    
    end
end

always @(posedge i_tx_clk) begin
    if(!i_tx_rst_n) begin
        tx_tam_cap_valid <= 1'b0;
    end
    else begin
        tx_tam_cap_valid <= tx_tam_load_pulse;        
    end
end

// RX TAM

always @(posedge i_rx_clk) begin
    if(!i_rx_rst_n) begin
        rx_tam_load_r <= 1'b0;
    end
    else  begin
        rx_tam_load_r <= i_rx_tam_load;    
    end
end

always @(posedge i_rx_clk) begin
    if(!i_rx_rst_n) begin
        rx_tam_count     <= 16'h0;
    end
    else if (rx_tam_load_pulse) begin
        rx_tam_count     <= rx_tam_count + 1'b1;        
    end
end

always @(posedge i_rx_clk) begin
    if (rx_tam_load_pulse) begin
        rx_tam_capture   <= i_rx_tam;      
    end
end

always @(posedge i_rx_clk) begin
    if(!i_rx_rst_n) begin
        rx_tam_cap_valid <= 1'b0;
    end
    else begin 
        rx_tam_cap_valid <= rx_tam_load_pulse;        
    end
end

always @(posedge i_tx_clk) begin
    if(!i_tx_rst_n) begin
        o_tx_tam_cap_valid <= 1'b0; 
    end
    else begin 
        o_tx_tam_cap_valid <= tx_tam_cap_valid;         
    end
end

always @(posedge i_tx_clk) begin
    o_tx_tam_capture   <= tx_tam_capture;
    o_tx_tam_count     <= tx_tam_count;  
end

always @(posedge i_rx_clk) begin
    if(!i_rx_rst_n) begin
        o_rx_tam_cap_valid <= 1'b0; 
    end
    else begin
        o_rx_tam_cap_valid <= rx_tam_cap_valid;         
    end
end

always @(posedge i_rx_clk) begin
    o_rx_tam_capture   <= rx_tam_capture;
    o_rx_tam_count     <= rx_tam_count; 
end

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "zxbEFFp84WYRbJsb0HIMeuWjbOOv1K7QQFpH53Gb3V5p0ZRDdhsMAxwP11nnT9uCTG31WcRFMGv1Y3sp3Jccq/UYKIiEbrkv+dnQkRqN6m6gKWqiXtHiiORyaZNWlpsJ1uOJVOw5+WI+1xrepR1EmwGCsDi2F6K1UWIUsyOHvXTbPREtmL97zvP7WTaw1mXrLe+4BbR/6Dd7pfQ4tTt2P5iQPOMdgtxNDjbWzf8Mv5NBQpg7sJWLKcvdOtTZWJ5FhMVSpChJIHVxNaexV8o6wqbASBM4UNYTmtQSw2wDtfabM0pM9f/6QnlyMiiuVZpUXDOp5vN1AeA3jwLMiKBUCNu3bRz6Z9MThh6HDxfW4W8HE+SiZTsmuDeiFBPnfUUQ+OU4e7AOZHr1QU+UhyOtgN0g6HDS2gciP8/QgWpTlQYUQ8dPKHbut2sHoCqpwBuGxcKvWIdRDqutyiF1jlYqqW3QQq1KC3IGa0kSweSUSA8Pp0PVO3iPvY69BUwgslrmvg6B286b/HWFxJ4USuPw4dCMZIB120U6BxyVk1LO76tP+t+qX9p/41lcDzJu6yG5+vjjIYdpDfIX9p76emMKY65RKX+Sc8kkw/JGSWzipfRwGo1Qs/cDrLmI5jtNPz2WD6P0eLF2RDSlpe1e78ok+ik7F2fgaXXfAnb0BlZe046ANj9o33hioRgLO2lNDYLXxG3MwLI1yu2/s5TES7onr1JaXNOJ2FYDPxO3CmyEbNFh+OZML1kd5VwSnGE4dOgEjcTaVs1dTYupHK7+uF8lb2mEQTe2It4ljMa/h0CZ76HlweArI7/NPXH559xvA6XxAoZg3DlyHi/twuD8WH9F3WdbSWgrEoB1+WufgITcTudNnkn9BNRzSOQW+RKeIzqsphDcgBlOyr5OB3HZXxnOESCny8owG7DXEoTANbO/g9D+qhSqTXlybRv2frjOMn3pZdPBQzcs5wTir9pKz7slpAlPRpgx6Vbaq70Mw0SxNKko+AD5twbSFqlFkeFyjLDk"
`endif