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

// Author 1:      Boobathi
// Author 2:      Rohan
// File:          pusch_fifo_read_state_machine.v
// Description:   Sub block of pusch_raw_packet_formation. 

// This State machaine to fetch Next header based on current NUMPRB. 
// The Same C plane headers need to be maintained for that corresponding U plane upto the NumPRB of that U plane. Then Next C plane header is read. 
// This State Machine enabled the discreate read based on the NUMPRB feild. 

// Added PRB Blanking mechanism. The statemachine generates sop, eop and active_prb based on PRB Blanking metadata.
// ================================================================================ 

`timescale 1ns/1ns

module pusch_fifo_read_state_machine(

       clk_in,
       rst_in_n,
       //INPUT  
       //FDV Read Request
       valid,
       //FDV Read Grant
       read_req,
       numprb,
       startprb,
       first_section,
       last_section,
       no_of_blank_prbs,
       active_prb,
       prb_sop,
       prb_eop,
       in_eop,
       max_prb,
       state,
       section_sop,
       blank_eaxc_sym,
       last_prb_id
);

localparam IDLE           = 1  ;
localparam NUMPRB_READ    = 2  ;
localparam COMPARATOR     = 3  ;
localparam BLANK_PRB      = 4  ;
localparam EOP_BLANK      = 5  ;
localparam BLANK_EAXC_SYM = 6  ;

input            clk_in              ;
input            rst_in_n            ;
input            valid               ;
input [7:0]      numprb              ;
   
input [8:0]      no_of_blank_prbs    ;
input            first_section       ;
input            last_section        ;
input [9:0]      startprb            ;
input            in_eop              ;
input [8:0]      max_prb             ; 
input            blank_eaxc_sym      ; 
input [10:0]     last_prb_id         ;

output reg       read_req            ;
   
output reg       active_prb          ;
output reg       prb_sop             ;
output reg       prb_eop             ;

output reg       section_sop         ;   

output reg [2:0] state               ;
   
reg [9:0]        wait_count          ;
reg [9:0]        NUMPRB_Mul_by3      ;

reg              match_prb           ;


reg [9:0]        blank_prb_wait_count;
reg [9:0]        no_of_blank_prbs_cycles;

reg              eop_prb_wait        ;
reg              blank_wait_done     ;
reg [9:0]        active_prb_cycles   ;


always @ (posedge clk_in)
begin  
    if (rst_in_n == 1'b0)
        state   <=  NUMPRB_READ  ; 
    else
        case (state)
            NUMPRB_READ  :   
            begin
                if(valid & (~(|no_of_blank_prbs)) & (~blank_eaxc_sym))
                    state   <= COMPARATOR   ;                 
                else if(valid & (|no_of_blank_prbs) & (~blank_eaxc_sym))
                    state   <= BLANK_PRB;
                else if(valid & blank_eaxc_sym)
                    state   <= BLANK_EAXC_SYM;
                else
                    state   <= NUMPRB_READ  ;
            end    
             
            BLANK_PRB :
            begin
                if(valid & blank_wait_done)
                    state   <= COMPARATOR;
                else
                    state   <= BLANK_PRB ;
            end

            COMPARATOR:  
            begin                
                if (valid & (wait_count == NUMPRB_Mul_by3) & ~eop_prb_wait)                                   
                    state   <=  NUMPRB_READ  ;               
                else if(valid & (wait_count == NUMPRB_Mul_by3) & eop_prb_wait)
                    state   <=  EOP_BLANK    ;
                else
                    state   <=  COMPARATOR ;
            end       
            
            EOP_BLANK:
            begin
            if(valid & in_eop)
                state <= NUMPRB_READ ;
            else
                state <= EOP_BLANK  ;
            end

            BLANK_EAXC_SYM:
            begin
            if(valid & in_eop)
                state <= NUMPRB_READ ;
            else
                state <= BLANK_EAXC_SYM;
            end

            default : 
            begin
            state <=  state  ;
            end

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
                if(valid)
                begin
                    wait_count     <= wait_count + 1'b1 ;     
                    if(numprb > 0)
                        NUMPRB_Mul_by3 <= (numprb << 1 ) + numprb - 1'd1;     // NUMPRB * 3 - 1                    
                    else    
                        NUMPRB_Mul_by3 <= 'd 818 ; // 273*3 - 1 ; // NUMPRB Zero means that is more than 255
                end    
            end         
                     
                
            COMPARATOR :
            begin
                if (valid)
                begin
                    if(wait_count == NUMPRB_Mul_by3)
                    begin
                        wait_count <= 'd0;
                    end    
                    else 
                    begin
                        wait_count    <= wait_count + 1'b1 ;    
                    end   
                end
            end
            
            BLANK_EAXC_SYM :
            begin
                wait_count <= 'd0;
            end

            default :   
            begin         
                    wait_count    <= wait_count ;        
            end
            
            endcase
        end
end

//read_req for new cplane packet
always @ (posedge clk_in)
begin
    if(rst_in_n == 'd0)
        read_req <= 'd0;
    else
    begin
        case(state)
        
        NUMPRB_READ:
        begin
            read_req <= 'd0;
        end
        
        COMPARATOR:
        begin
            if(valid)
            begin
                if((wait_count == NUMPRB_Mul_by3) & (~eop_prb_wait))
                    read_req <= 'd1;
            end
        end
        
        EOP_BLANK:
        begin
            if(valid & in_eop)
                read_req <= 'd1;
        end

        BLANK_EAXC_SYM:
        begin
            if(valid & in_eop)
                read_req <= 'd1;
        end

        default:
            read_req <= 'd0;
        endcase
    end
end

//Generate Active PRB Valid Cycles. This valid prb is the input to the timing adapter.
always @ (posedge clk_in)
begin
    if(rst_in_n == 'd0)
    begin
        active_prb <= 'd0;
        active_prb_cycles <= 'd0;
    end
    else
    begin
        case(state)
        NUMPRB_READ:
        begin
            if(valid & (~(|no_of_blank_prbs)))
            begin
                active_prb <= 'd1;
                active_prb_cycles <= active_prb_cycles + 'd1;
            end
            else
            begin
                active_prb <= 'd0;
                active_prb_cycles <= 'd0;
            end
        end
        BLANK_PRB:
        begin
            if(valid & blank_wait_done)
            begin
                active_prb <= 'd1;
                active_prb_cycles <= wait_count;
            end
            else
            begin
                active_prb <= 'd0;
                active_prb_cycles <= 'd0;
            end
        end
        COMPARATOR:
        begin
            if(valid)
            begin
                active_prb <= 'd1;
                active_prb_cycles <= active_prb_cycles + 'd1;
            end
            else
            begin
                active_prb <= 'd0;
                active_prb_cycles <= active_prb_cycles;
            end
        end
        default:
        begin
            active_prb <= 'd0;
            active_prb_cycles <= 'd0;
        end
        endcase
    end
end



//Match the last prb with 273(BW = 100Mhz) or 162 (BW = 60Mhz)
always @ (posedge clk_in)
begin
    if(rst_in_n == 'd0)
        match_prb <= 'd0;
    else if(last_section)
    begin
        if(last_prb_id[8:0] == max_prb)
            match_prb <= 'd1;
        else
            match_prb <= 'd0;
    end
    else
        match_prb <= 'd0;
end


//If last prb is not 273, 162 or 0, then enter EOP Blank state. Wait in EOP_BLANK until all the Uplane PRBs(273/162) are flushed out from input fifo.
always @ (posedge clk_in)
begin
    if(rst_in_n == 'd0)
    begin
        eop_prb_wait <=  'd0;
    end
    else 
    begin
        case(state)
        COMPARATOR:
        begin
            if(last_section & valid)
            begin
                if((~(|last_prb_id)) | match_prb)
                begin
                    eop_prb_wait <= 'd0;
                end
                else
                begin
                    eop_prb_wait <= 'd1;
                end
            end
        end

        NUMPRB_READ:
        begin
            eop_prb_wait <= 'd0; 
        end

        EOP_BLANK:
        begin
            eop_prb_wait <= 'd0; 
        end

        BLANK_PRB:
        begin
            eop_prb_wait <= 'd0; 
        end
        endcase
    end
end


//Increment the Blank prb wait count every clock cycle
always @ (posedge clk_in)
begin
    if(rst_in_n == 'd0)
    begin
        blank_prb_wait_count <= 'd0;
    end
    else
    begin
        case(state)
            NUMPRB_READ:
            begin
                if( valid & (|no_of_blank_prbs))
                    blank_prb_wait_count <= blank_prb_wait_count + 'd1;
            end
            BLANK_PRB:
            begin
                if(valid)
                    blank_prb_wait_count <= blank_prb_wait_count + 'd1;
            end

            COMPARATOR:
            begin
                blank_prb_wait_count <= 'd0;
            end
        endcase
    end
end


//no of blank prb clock cycles = no of blank prbs * 12 (REs) * (32)/128 = no of blank prbs * 3
always @ (posedge clk_in)
begin
    if(rst_in_n == 'd0)
    begin
        no_of_blank_prbs_cycles <= 'd0 ;
    end
    else
    begin
        no_of_blank_prbs_cycles <= (no_of_blank_prbs<<1) + no_of_blank_prbs - 1'd1; 
    end
end


//Switch to comparator state when prb wait count reaches no of blank prbs
always @ (posedge clk_in)
begin
    if(rst_in_n == 'd0)
    begin
        blank_wait_done <= 'd0 ;
    end
    else
    begin
        case(state)
            BLANK_PRB:
            begin
                if(valid & (no_of_blank_prbs_cycles == blank_prb_wait_count))
                    blank_wait_done <= 'd1;
            end
            COMPARATOR:
            begin
                blank_wait_done <= 'd0;
            end
            default:
            begin
                blank_wait_done <= 'd0;
            end
        endcase
    end
end

//Generate SOP on last prb of last section
always @ (posedge clk_in)
begin
    if(rst_in_n == 'd0)
    begin
        prb_sop <= 'd0;
    end
    else if(valid)
    begin
        case(state)
            NUMPRB_READ:
            begin
                if(valid & first_section & (~(|active_prb_cycles)) & (~(|no_of_blank_prbs)))
                    prb_sop <= 'd1;
            end
            BLANK_PRB:
            begin
                if(valid & first_section & blank_wait_done)
                    prb_sop <= 'd1;
            end
            default:
                prb_sop <= 'd0;
        endcase
    end
    else
    begin
        prb_sop <= 'd0;
    end
end


//Generate EOP on last prb of last section
always @ (posedge clk_in)
begin
    if(rst_in_n == 'd0)
    begin
        prb_eop <= 'd0;
    end
    else if(valid & last_section & (state==COMPARATOR)& (wait_count == NUMPRB_Mul_by3))
    begin
        prb_eop <= 'd1;
    end
    else
    begin
        prb_eop <= 'd0;
    end
end


//Generate a new Section SOP for accumulating Total no of prbs per packet
always @ (posedge clk_in)
begin
    if(rst_in_n == 'd0)
    begin
        section_sop <= 'd0;
    end
    else
    begin
        case(state)
        NUMPRB_READ:
        begin
            if(valid & (~(|no_of_blank_prbs)))
                section_sop <= 'd1;
            else
                section_sop <= 'd0;
        end
        BLANK_PRB:
        begin
            if(valid & blank_wait_done)
                section_sop <= 'd1;
            else
                section_sop <= 'd0;
        end
        default:
            section_sop <= 'd0;
        endcase
    end
end

endmodule

