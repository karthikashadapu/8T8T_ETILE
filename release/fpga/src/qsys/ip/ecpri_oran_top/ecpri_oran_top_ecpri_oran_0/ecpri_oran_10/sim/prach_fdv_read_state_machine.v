// ================================================================================
// Copyright (c) <2017>, Intel Corporation
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provIDLEd that the following conditions are met:
//
//     * Redistributions of source code must retain the above copyright notice,
//       this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provIDLEd with the distribution.
//     * Neither the name of Intel Corporation nor the names of its contributors
//       may be used to endorse or promote products derived from this software
//       without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDLED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDLENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ================================================================================


// ================================================================================ 

// File:        prach_fdv_read_state_machine.v
// Author:      Boobathi Selvaraj
// Description: Sub block of ul_cplane_fdv_buffer. 
//              This State Machine is for discreate read pattern. Read address will keep switch based on No of sections / No of Axcs / No of Symbols / Slots    




`timescale 1ns/1ns

module prach_fdv_read_state_machine(

       clk_in,
       rst_in_n,
       //INPUT  
       //FDV Read Request
       read_req,
       //FDV Read Grant
       read_grant,
       section_count,
       numberOfsections,
       axc_number,
       symbol_number,
       start_symbol,
       rd_memory_location,
       read_address_clr,
       num_symbol,
       last_sym_arrived,       
       next_sf_arrived,       
       last_sym_arrived_latch_clr,
       next_sf_arrived_latch_clr,
       state    ,
       cc1_enable,
       cc2_enable   
       
       
);

parameter NUM_OF_ANT         =    8         ;
parameter NUM_OF_SYM         =    14        ;
parameter NUM_OF_SEC         =    64        ; 

localparam IDLE              =    1         ;
localparam SEC_READ          =    2         ;
localparam NO_OF_SEC_DECODE  =    3         ;
localparam NEXT_SEC          =    4         ;
localparam AXC_INCREMENT     =    5         ;
localparam SYM_INCREMENT     =    6         ;
localparam SF_INCREMENT      =    7         ;
localparam WAIT_CYCLES       =    14        ;  // 12 clock cycles to read no of sections from C plane header                               


input                                clk_in                     ;
input                                rst_in_n                   ;
input                                read_req                   ;
input                                last_sym_arrived           ;
input                                next_sf_arrived            ;
input  [3:0]                         num_symbol                 ;
input  [5:0]                         start_symbol               ;
input                                cc1_enable                 ;
input                                cc2_enable                 ;
          
input  [$clog2(NUM_OF_SEC)-1:0]      numberOfsections           ;
          
output  reg [$clog2(NUM_OF_ANT)-1:0] axc_number                 ;
output  reg [$clog2(NUM_OF_SYM)-1:0] symbol_number              ;

output  reg                          rd_memory_location         ; 
output  reg                          read_address_clr           ;
output  reg [7:0]                    section_count              ;
output  reg                          read_grant                 ;
output  reg                          next_sf_arrived_latch_clr  ; 
output  reg                          last_sym_arrived_latch_clr ;
output  reg [3:0]                    state                      ;
       
reg [$clog2(NUM_OF_SEC)-1:0]         numberOfsections_decode    ;
reg [$clog2(NUM_OF_SYM)-1:0]         symbol_count               ;
reg [7:0]                            wait_count                 ;
       
reg                                  section_decode             ;
                           
reg                                  symbol_last                ;
reg                                  axc_last                   ;
reg                                  section_last               ;
reg                                  wait_count_last            ;
                           
reg [3:0]                            eaxc_id_last               ;
reg                                  start_eaxc_read_flag       ;

//Configure the last EAXC ID based on component carrier setting in dl_ul_bw_config.
//IF CC1 Enabled and CC2 Enabled: 2 carrier mode: LAST EAXC_ID = 7
//IF CC1 Enabled and CC2 Disabled:1 carrier mode: LAST_EAXC_ID = 6
//IF CC1 Disabled and CC2 Enabled:1 Carrier mode: LAST_EAXC_ID = 7
always @ (posedge clk_in)
begin
    if(~rst_in_n)
    begin
        eaxc_id_last <= 'd7;        
    end  
    else if(cc1_enable & ~cc2_enable)
    begin
        eaxc_id_last <= 'd6;       //Single Carrier mode, CC1 enabled CC2 disabled, POSSIBLE EAXCS = 0,2,4,6
    end
    else
    begin
        eaxc_id_last <= 'd7;       //Single Carrier mode, CC1 disabled CC2 enabled, POSSIBLE EAXCS = 1,3,5,7
                                   //IF both carriers are enabled: EAXC = 0,1,2,3,4,5,6,7
    end
end

always @ (posedge clk_in)
begin  
    if (rst_in_n == 1'b0)
        state   <=  IDLE  ; 
    else
        case (state)
            IDLE  :   //1
            begin
                if(read_req)
                    state   <= SEC_READ  ;                 
                else
                    state   <= IDLE  ;
            end
            
            SEC_READ :  //2 
            begin
                if(read_req & section_decode)
                    state   <=  NEXT_SEC ; 
                else if(read_req)
                    state   <=  NO_OF_SEC_DECODE ; 
                else    
                    state   <=  SEC_READ ;    
                
            end        
                
            NO_OF_SEC_DECODE:  //3
            begin
                if (read_req & wait_count_last)    // 12 clock cycles to read no of sections                               
                    state   <=  NEXT_SEC  ;               
                else
                    state   <=  NO_OF_SEC_DECODE ;
            end    
            
            NEXT_SEC :   //4
            begin
                if(read_req & symbol_last & axc_last & section_last)
                    state   <=  SF_INCREMENT  ;                     
                else if (read_req & axc_last & section_last)
                    state   <=  SYM_INCREMENT  ;
                else if(read_req & section_last)
                    state   <=  AXC_INCREMENT  ;
                else if(read_req)
                    state   <=  SEC_READ  ;    
                else    
                    state   <=  NEXT_SEC  ; 
            end
            
            AXC_INCREMENT: //5
            begin
                    state   <=  IDLE ;    
            end
            
            SYM_INCREMENT: //6
            begin
                    state   <=  IDLE ;    
            end
            
            SF_INCREMENT: //7
            begin                
                    if(last_sym_arrived & next_sf_arrived)
                        state   <=  IDLE ;  
                    else    
                        state   <=  SF_INCREMENT ;  
            end
            
        default : state   <=  state  ; 
        endcase
end


always @ (posedge clk_in)
begin 
    if (rst_in_n == 1'b0)
        begin        
        read_grant    <= 'd0;
        section_count <= 'd0;
        wait_count    <= 'd0;
        section_decode<= 'd0;
        axc_number     <= 'd0;        
        symbol_count   <= 'd0;
        start_eaxc_read_flag <= 'd1;        
        end    
    else
        begin        
            case (state)
            IDLE  : //1
            begin 
                read_grant     <= 'd0;    
                section_count  <= 'd0;
                wait_count     <= 'd0;
                section_decode <= 'd0;
                if(start_eaxc_read_flag)
                begin
                    if(cc2_enable & ~cc1_enable) //START EAXC ID is 1 if CC2 Enabled, CC1 disabled
                        axc_number <= 'd1;
                    else
                        axc_number <= 'd0; 
                end
            end 
            
            SEC_READ  : //2
            begin                                 
                if(read_req)
                    read_grant    <= 'd1;    
                else            
                    read_grant    <= 'd0;                                                    
            end                      
                
            NO_OF_SEC_DECODE : //3
            begin 
                read_grant    <= 'd0;
                wait_count    <= wait_count + 1'b1 ; 
                section_decode<= 'd1;                
            end
            
             NEXT_SEC: //4
            begin
                read_grant     <= 'd0;
                wait_count     <= 'd0;
                if(read_req)
                    section_count  <=  section_count + 1'b1;                    
            end  
            
            AXC_INCREMENT: //5
            begin
                read_grant     <= 'd0;    
                section_count  <= 'd0;
                start_eaxc_read_flag <= 'd0;
                if(~cc1_enable | ~cc2_enable) //Single Carrier mode
                begin
                    axc_number     <= axc_number + 2'd2;
                end
                else if(cc1_enable & cc2_enable) // 2 Carrier mode
                begin
                    axc_number     <= axc_number + 2'd1;                        
                end
            end
            
            SYM_INCREMENT: //6  
            begin
                read_grant     <= 'd0;
                section_count  <= 'd0;                
                if(~cc1_enable & cc2_enable)
                begin
                    axc_number     <= 'd1;     
                end
                else
                begin
                    axc_number <= 'd0;
                end
                symbol_count   <= symbol_count + 1'b1 ;// symbol_count represents an iteration                
            end
            
            SF_INCREMENT: //7
            begin
                read_grant     <= 'd0;    
                section_count  <= 'd0;    
                if(~cc1_enable & cc2_enable)
                begin
                    axc_number     <= 'd1;     
                end
                else
                begin
                    axc_number <= 'd0;
                end
                symbol_count   <= 'd0;    
            end 
                        
            default :
            begin 
                read_grant    <= 'd0;
            end
            
            endcase
        end
end

always @ (posedge clk_in)
begin  
    if (rst_in_n == 1'b0)
        symbol_last <= 'b0  ;
    else if(state == SF_INCREMENT)  
        symbol_last <= 'b0;        
    else if(symbol_count == num_symbol-1)  // num_symbol from Cplane
        symbol_last <= 'b1;
end        

always @ (posedge clk_in)
begin  
    if (rst_in_n == 1'b0)
        axc_last   <= 'b0;
    else if( (state==SYM_INCREMENT) || (state==SF_INCREMENT) )  
        axc_last   <= 'b0;        
    else if(axc_number == eaxc_id_last)
        axc_last   <= 'b1;
end    

always @ (posedge clk_in)
begin  
    if (rst_in_n == 1'b0)
        section_last   <= 'b0; 
    else if( (state==AXC_INCREMENT) || (state==SYM_INCREMENT) || (state==SF_INCREMENT) )
        section_last   <= 'b0;    
    else if( (state==NO_OF_SEC_DECODE) && (wait_count_last) )
        section_last = (section_count == numberOfsections) ;
    else if( (state==SEC_READ) && (section_decode) )    
        section_last = (section_count == numberOfsections) ;
end     


always @ (posedge clk_in)
begin  
    if (rst_in_n == 1'b0)
        wait_count_last   <= 'b0; 
    else if(state == NEXT_SEC)  
        wait_count_last   <= 'b0;    
    else if(wait_count == WAIT_CYCLES-1)  
        wait_count_last   <= 'b1;
end       

always @ (posedge clk_in) // Symbol number RAM location
begin  
    if (rst_in_n == 1'b0)
        symbol_number   <= 'b0;
    else if(state == SF_INCREMENT)
        symbol_number   <= 'b0;
    else if(state == SYM_INCREMENT)                
        begin    
            if(symbol_count < (start_symbol + num_symbol - 1'b1))
                symbol_number  <= start_symbol; // Read Same RAM Location upto num_symbol
            else 
                symbol_number  <= start_symbol + num_symbol; // Jump to new location based on num_symbol    
        end
end

always @ (posedge clk_in) 
begin  
    if (rst_in_n == 1'b0)
    begin
        rd_memory_location           <=  1'b0;
        next_sf_arrived_latch_clr    <=  1'b0;
        last_sym_arrived_latch_clr   <=  1'b0;                 // release last symbol arrival latch
    end    
    else if(state == IDLE)
    begin
        rd_memory_location           <=  rd_memory_location;   // maintain the same rd memory locaton 
        next_sf_arrived_latch_clr    <=  1'b0;                 // release the next slot arrival latch
        last_sym_arrived_latch_clr   <=  1'b0;                 // release the last symbol arrival latch
    end    
    else if( (state == SF_INCREMENT) & last_sym_arrived & next_sf_arrived)
    begin
        rd_memory_location           <=  ~rd_memory_location;  // Change the double memory read location 
        next_sf_arrived_latch_clr    <=  1'b1;                 // clear the next slot arrival latch
        last_sym_arrived_latch_clr   <=  1'b1;                 // release the last symbol arrival latch
    end    
end

always @ (posedge clk_in)
begin  
    if (rst_in_n == 1'b0)
        read_address_clr <= 'd0;    
    else if(state == IDLE)  
        read_address_clr <= 'd1;    
    else 
        read_address_clr <= 'd0;
end    

endmodule

