// ================================================================================
// Copyright (c) <2017>, Intel Corporation
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//     * Redistributions of source code must retain the above copyright notice,
//       this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Intel Corporation nor the names of its contributors
//       may be used to endorse or promote products derived from this software
//       without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ================================================================================

// Author:      Boobathi Selvaraj
// File:        fifo_read_state_machine.v
// Description: Sub block of pusch_raw_packet_formation. 

// This State machaine to fetch Next header based on current NUMPRB. 
// The Same C plane headers need to be maintained for that corresponding U plane upto the NumPRB of that U plane. Then Next C plane header is read. 
// This State Machine enabled the discreate read based on the NUMPRB feild. 

// ================================================================================ 

`timescale 1ns/1ns

module prach_fifo_read_state_machine(

       clk_in,
       rst_in_n,
       //INPUT  
       //FDV Read Request
       valid,
       //FDV Read Grant
       read_req,
       NUMPRB 
       
);

localparam IDLE        = 1  ;
localparam NUMPRB_READ = 2  ;
localparam COMPARATOR  = 3  ;



input              clk_in;
input              rst_in_n;
input              valid;
input        [7:0] NUMPRB;

output reg read_req;

reg [2:0] state;

reg [9:0] wait_count;
reg [9:0] NUMPRB_Mul_by3;

always @ (posedge clk_in)
begin  
    if (rst_in_n == 1'b0)
        state   <=  NUMPRB_READ  ; 
    else
        case (state)
            NUMPRB_READ  :   
            begin
                if(valid)
                    state   <= COMPARATOR  ;                 
                else
                    state   <= NUMPRB_READ  ;
            end    
        
            COMPARATOR:  
            begin                
                if (valid & (wait_count == NUMPRB_Mul_by3))                                   
                    state   <=  NUMPRB_READ  ;               
                else
                    state   <=  COMPARATOR ;
            end       
            
            default : state <=  state  ; 
        endcase
end


always @ (posedge clk_in)
begin 
    if (rst_in_n == 1'b0)
        begin                
        NUMPRB_Mul_by3 <= 'd0;
        wait_count     <= 'd0;    
        end    
    else
        begin        
            case (state)
            NUMPRB_READ  :
            begin                 
                NUMPRB_Mul_by3  <= 'd0;
                wait_count      <= 'd0;
                read_req        <= 'd0;    
                
                if(valid)
                begin
                    wait_count     <= wait_count + 1'b1 ;     
                    if(NUMPRB > 0)
                        NUMPRB_Mul_by3 <= (NUMPRB << 1 ) + NUMPRB - 1'd1;     // NUMPRB * 3 - 1                    
                    else    
                        NUMPRB_Mul_by3 <= 'd 818 ; // 273*3 - 1 ; // NUMPRB Zero means that is more than 255
                end    
            end         
                     
                
            COMPARATOR :
            begin
                if (valid)
                    if(wait_count == NUMPRB_Mul_by3)
                    begin
                        wait_count <= 'd0;
                        read_req   <= 'd1;
                    end    
                    else 
                    begin
                        wait_count    <= wait_count + 1'b1 ;
                        read_req   <= 'd0;        
                    end    
            end
            
            default :            
                    wait_count    <= wait_count ;            
            
            endcase
        end
end

endmodule

