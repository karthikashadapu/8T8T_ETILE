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

// File:        pusch_fdv_read_state_machine.v
// Author:      Boobathi Selvaraj
// Description: Sub block of ul_cplane_fdv_buffer. 
//              This State Machine is for discreate read pattern. Read address will keep switch based on No of sections / No of Axcs / No of Symbols / Slots    




`timescale 1ns/1ns

module pusch_fdv_read_state_machine(

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
       start_sym,
       rd_memory_location,
       read_address_clr,
       last_sym_arrived,       
       next_slot_arrived,
       last_sym_arrived_latch_clr,       
       next_slot_arrived_latch_clr,
       state, 
       cc1_enable,
       cc2_enable,
       blank_eaxc_sym,
       sym_eaxc_map_latch_clr,
       sym_eaxc_map_flat  
);

localparam NUM_OF_ANT         =    8         ;
localparam NUM_OF_SYM         =    14        ;
localparam NUM_OF_SEC         =    64        ; 
localparam NUM_OF_SLOT        =    2         ;


//States
localparam IDLE              =    1         ;
localparam READ_MAPPING_TABLE=    2         ;
localparam MAP_TABLE_DECODE  =    3         ;
localparam SEC_READ          =    4         ;
localparam NO_OF_SEC_DECODE  =    5         ;
localparam NEXT_SEC          =    6         ;
localparam BLANK_CPLANE      =    7         ;
localparam AXC_INCREMENT     =    8         ;
localparam SYM_INCREMENT     =    9         ;
localparam SLOT_INCREMENT    =    10        ;

//Wait cycles
localparam WAIT_CYCLES       =    14        ; // 12 clock cycles to read no of sections from C plane header            
localparam WAIT_BLANK_CYCLES =    12        ; // 12 clock cycle delay before processing blank packet.                  


localparam CC2_EAXC_LAST     =    7         ;
localparam CC1_EAXC_LAST     =    6         ;

input                                                           clk_in                                       ;
input                                                           rst_in_n                                     ;
input                                                           read_req                                     ;
input                                                           last_sym_arrived                             ;
input                                                           next_slot_arrived                            ;
input                                                           cc1_enable                                   ;
input                                                           cc2_enable                                   ;
input  [((NUM_OF_SYM*4)*(NUM_OF_ANT * NUM_OF_SLOT))-1:0]       sym_eaxc_map_flat                            ;
reg    [(NUM_OF_SYM*4)-1:0]                                     sym_eaxc_map[(NUM_OF_ANT*NUM_OF_SLOT)-1:0]  ;
input  [$clog2(NUM_OF_SEC)-1:0]                                 numberOfsections                             ;
output  reg [$clog2(NUM_OF_ANT)-1:0]                            axc_number                                   ;
reg         [$clog2(NUM_OF_SYM)-1:0]                            symbol_number                                ;
output  reg [$clog2(NUM_OF_SYM)-1:0]                            start_sym                                    ;
output  reg                                                     rd_memory_location                           ; 
output  reg                                                     read_address_clr                             ;
output  reg [7:0]                                               section_count                                ;
output  reg                                                     read_grant                                   ;
output  reg                                                     next_slot_arrived_latch_clr                  ;
output  reg                                                     last_sym_arrived_latch_clr                   ;
output  reg [3:0]                                               state                                        ;
output  reg                                                     blank_eaxc_sym                               ;
reg [$clog2(NUM_OF_SEC)-1:0]                                    numberOfsections_decode                      ;
reg [$clog2(NUM_OF_SYM)-1:0]                                    symbol_count                                 ;
reg [7:0]                                                       wait_count                                   ;
reg                                                             section_decode                               ;
reg                                                             symbol_last                                  ;
reg                                                             axc_last                                     ;
reg                                                             section_last                                 ;
reg                                                             wait_count_last                              ;
reg [3:0]                                                       eaxc_id_last                                 ;
reg                                                             start_eaxc_read_flag                         ;
reg [7:0]                                                       sym_addr_start                               ;
output reg                                                      sym_eaxc_map_latch_clr                       ;
reg                                                             map_table_read_done                          ;
reg                                                             map_read_data                                ;
reg                                                             map_read_blank                               ;
reg  [3:0]                                                      blank_wait                                   ;
reg                                                             blank_wait_last                              ;

//Configure the last EAXC ID based on component carrier setting in dl_ul_bw_config.
//IF CC1 Enabled and CC2 Enabled: 2 carrier mode: LAST EAXC_ID = 7
//IF CC1 Enabled and CC2 Disabled:1 carrier mode: LAST_EAXC_ID = 6
//IF CC1 Disabled and CC2 Enabled:1 Carrier mode: LAST_EAXC_ID = 7
always @ (posedge clk_in)
begin
    if(~rst_in_n)
    begin
        eaxc_id_last <= CC2_EAXC_LAST;        
    end  
    else if(cc1_enable & ~cc2_enable)
    begin
        eaxc_id_last <= CC1_EAXC_LAST;       //Single Carrier mode, CC1 enabled CC2 disabled, POSSIBLE EAXCS = 0,2,4,6
    end
    else
    begin
        eaxc_id_last <= CC2_EAXC_LAST;       //Single Carrier mode, CC1 disabled CC2 enabled, POSSIBLE EAXCS = 1,3,5,7
                                             //IF both carriers are enabled: EAXC = 0,1,2,3,4,5,6,7
    end
end


//State machine transitions block
always @ (posedge clk_in)
begin  
    if (rst_in_n == 1'b0)
        state   <=  IDLE  ; 
    else
        case (state)
            IDLE  :   //1
            begin
                if(read_req)
                    state   <= READ_MAPPING_TABLE  ;                 
                else
                    state   <= IDLE  ;
            end

            READ_MAPPING_TABLE: //2
            begin
                if(read_req & map_table_read_done)
                    state <= MAP_TABLE_DECODE;
                else
                    state <= READ_MAPPING_TABLE;

            end

            MAP_TABLE_DECODE: //3
            begin
                if(read_req & map_read_data & ~map_read_blank)
                    state   <= SEC_READ;
                else if(read_req & map_read_blank & ~map_read_data)
                    state   <= BLANK_CPLANE;
                else
                    state <= MAP_TABLE_DECODE;
            end

            SEC_READ :  //4
            begin
                if(read_req & section_decode)
                    state   <=  NEXT_SEC ; 
                else if(read_req)
                    state   <=  NO_OF_SEC_DECODE ; 
                else    
                    state   <=  SEC_READ ;    
                
            end        

            NO_OF_SEC_DECODE:  //5
            begin
                if (read_req & wait_count_last)    // 12 clock cycles to read no of sections                               
                    state   <=  NEXT_SEC  ;               
                else
                    state   <=  NO_OF_SEC_DECODE ;
            end    
            
            NEXT_SEC :   //6
            begin
                if(read_req & symbol_last & axc_last & section_last)
                    state   <=  SLOT_INCREMENT  ;                     
                else if (read_req & axc_last & section_last)
                    state   <=  SYM_INCREMENT  ;
                else if(read_req & section_last)
                    state   <=  AXC_INCREMENT  ;
                else if(read_req)
                    state   <=  SEC_READ  ;    
                else    
                    state   <=  NEXT_SEC  ; 
            end

            BLANK_CPLANE: //7
            begin
                if(read_req & blank_wait_last)
                    state <= NEXT_SEC;
                else
                    state <= BLANK_CPLANE;

            end
            
            AXC_INCREMENT: //8
            begin
                    state   <=  IDLE ;    
            end
            
            SYM_INCREMENT: //9
            begin
                    state   <=  IDLE ;    
            end
            
            SLOT_INCREMENT: //10
            begin                
                    if(last_sym_arrived & next_slot_arrived)
                        state   <=  IDLE ;  
                    else    
                        state   <=  SLOT_INCREMENT ;  
            end
            
        default : state   <=  state  ; 
        endcase
end


//Flags and registers that change over multiple states
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
        blank_wait    <= 'd0;
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
                blank_wait     <= 'd0;
                if(start_eaxc_read_flag)
                begin
                    if(cc2_enable & ~cc1_enable) //START EAXC ID is 1 if CC2 Enabled, CC1 disabled
                        axc_number <= 'd1;
                    else
                        axc_number <= 'd0; 
                end
            end 
            
            SEC_READ  : //4
            begin                                 
                if(read_req)
                    read_grant    <= 'd1;    
                else            
                    read_grant    <= 'd0;                                                    
            end                      
                
            NO_OF_SEC_DECODE : //5
            begin 
                read_grant    <= 'd0;
                wait_count    <= wait_count + 1'b1 ; 
                section_decode<= 'd1;                
            end
            
             NEXT_SEC: //6
            begin
                read_grant     <= 'd0;
                wait_count     <= 'd0;
                if(read_req)
                    section_count  <=  section_count + 1'b1;                    
            end

            BLANK_CPLANE:
            begin
                blank_wait <= blank_wait + 'd1;
            end  
            
            AXC_INCREMENT: //8
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
            
            SYM_INCREMENT: //9  
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
            
            SLOT_INCREMENT: //10
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


//Decode the flattened 1D array of sym_eaxc_map_flat:
integer i;
always @ (posedge clk_in)
begin
for (i = 0; i < (NUM_OF_ANT*NUM_OF_SLOT); i = i+1)
    sym_eaxc_map[i] = sym_eaxc_map_flat[(NUM_OF_SYM*4)*i +: (NUM_OF_SYM * 4)];
end


//Fetch the address of the current start_sym:
//Example: If symbol_count = 'd10['b1010]
//         sym_eaxc_map[{slot_id,eaxc_id}] = 56'h123456789ABCD;  -> 14 symbols * 4 bits per symbol = 56 bits.
//         sym_address_start   =  'hA['b1010] * 4 = 'b101000 = 'd40
//         sym_address_start+4 =  'hA['b1010] * 4 + 3 = 'b101011 = 'd43
//         sym_eaxc_map[{slot_id,eaxc_id}][sym_addr_start+:4] = 4'h4
//         In this example we have extracted start_symbol as 4 at current symbol_id 10 for a given slot id and eaxc_id 
always @ (posedge clk_in)
begin: SYM_MAP_ADDRESS
    if(rst_in_n == 1'b0)
    begin
        sym_addr_start <= 'd0;
    end
    else if(state == IDLE)
    begin
         sym_addr_start <= symbol_count << 2;
    end
end


// READ the 4 bit start symbol information from the sym_eaxc_map register. 
always @ (posedge clk_in)
begin: READ_MAP_REGISTER
    if(rst_in_n == 1'b0)
    begin
        symbol_number <= 4'd0;
        map_table_read_done <= 'd0;
    end
    else if(state == READ_MAPPING_TABLE)
    begin
        symbol_number <= sym_eaxc_map[{rd_memory_location,axc_number}][sym_addr_start+:4];
        map_table_read_done <= 'd1;
    end
    else if(state == MAP_TABLE_DECODE)
    begin
        map_table_read_done <= 'd0;
    end
end


//Set map_read_blank to 1 if start_symbol in sym_eaxc_map = 0. Switch the state to BLANK_CPLANE
//Set map_read_data to 1 if start_symbol in sym_eaxc_map != 0. The value of start_sym = start_sym-1. Switch the state to SEC_READ.
always @ (posedge clk_in)
begin: BLANK_DECISION
    if(rst_in_n == 1'b0)
    begin
        map_read_blank <= 'd0 ;
        map_read_data  <= 'd0 ;
        start_sym      <= 4'd0;
    end
    else if(state == READ_MAPPING_TABLE)
    begin
        map_read_blank <= 'd0 ;
        map_read_data  <= 'd0 ;
        start_sym      <= 4'd0;
    end
    else if(state == MAP_TABLE_DECODE)
    begin
        if(symbol_number == 'd0)
        begin
            map_read_blank <= 'd1 ;
            map_read_data  <= 'd0 ;
            start_sym      <= 4'd0;
        end
        else
        begin
            map_read_blank <= 'd0 ;
            map_read_data  <= 'd1 ;
            start_sym      <= symbol_number - 4'd1;
        end
    end
end


//If state is BLANK_CPLANE: Set the output blank_eaxc_sym = 1 for 1 clock cycle. 
//This signal is used in cplane_fdv_buffer to create one blank cplane packet with value: 128'd1.
always @ (posedge clk_in)
begin: BLANK_OUT
    if(rst_in_n == 1'b0)
        blank_eaxc_sym <= 'd0;
    else if((state == BLANK_CPLANE) & blank_wait_last)
        blank_eaxc_sym <= 'd1;
    else if(state == NEXT_SEC)
        blank_eaxc_sym <= 'd0;
end


//Check if last symbolid is reached(13) and reset to 0.
always @ (posedge clk_in)
begin  
    if (rst_in_n == 1'b0)
        symbol_last <= 'b0  ;
    else if(state == SLOT_INCREMENT)  
        symbol_last <= 'b0;        
    else if(symbol_count == NUM_OF_SYM-1)  
        symbol_last <= 'b1;
end        


//Check if last AXC ID is reached(7) and reset to 0
always @ (posedge clk_in)
begin  
    if (rst_in_n == 1'b0)
        axc_last   <= 'b0;
    else if( (state==SYM_INCREMENT) || (state==SLOT_INCREMENT) )  
        axc_last   <= 'b0;        
    else if(axc_number == eaxc_id_last)  
        axc_last   <= 'b1;
end    


//Check if last section is reached and reset to 0.
always @ (posedge clk_in)
begin  
    if (rst_in_n == 1'b0)
        section_last   <= 'b0; 
    else if( (state==AXC_INCREMENT) || (state==SYM_INCREMENT) || (state==SLOT_INCREMENT) )
        section_last   <= 'b0;    
    else if(state == BLANK_CPLANE)
        section_last   <= 'b1;
    else if( (state==NO_OF_SEC_DECODE) && (wait_count_last) )
        section_last = (section_count == numberOfsections) ;
    else if( (state==SEC_READ) && (section_decode) )    
        section_last = (section_count == numberOfsections) ;
end     


//Section read wait time.
always @ (posedge clk_in)
begin  
    if (rst_in_n == 1'b0)
        wait_count_last   <= 'b0; 
    else if(state == NEXT_SEC)  
        wait_count_last   <= 'b0;    
    else if(wait_count == WAIT_CYCLES-1)  
        wait_count_last   <= 'b1;
end       

//Wait for 10 clock cycles before sending out blank cplane output.
//This ensures previous meta_data_out packet is sent out before we generate a new packet.
always @ (posedge clk_in)
begin  
    if (rst_in_n == 1'b0)
        blank_wait_last   <= 'b0; 
    else if(state == NEXT_SEC)  
        blank_wait_last   <= 'b0;    
    else if(blank_wait == WAIT_BLANK_CYCLES-1)  
        blank_wait_last   <= 'b1;
end 


//Toggle the read memory location on completion of 1 slot of cplane messages. Reset the sym_eaxc_map.
always @ (posedge clk_in) 
begin  
    if (rst_in_n == 1'b0)
    begin
        rd_memory_location             <=  1'b0;
        next_slot_arrived_latch_clr    <=  1'b0;
        last_sym_arrived_latch_clr     <=  1'b0;
        sym_eaxc_map_latch_clr         <=  1'b0;
    end    
    else if(state == IDLE)
    begin
        rd_memory_location             <=  rd_memory_location;      // maintain the same rd memory locaton 
        next_slot_arrived_latch_clr    <=  1'b0;                    // release the next slot arrival latch
        last_sym_arrived_latch_clr     <=  1'b0;
        sym_eaxc_map_latch_clr         <=  1'b0;
    end    
    else if( (state == SLOT_INCREMENT) & last_sym_arrived & next_slot_arrived)
    begin
        rd_memory_location             <=  ~rd_memory_location;     // Change the double memory read location 
        next_slot_arrived_latch_clr    <=  1'b1;                    // clear the next slot arrival latch
        last_sym_arrived_latch_clr     <=  1'b1;
        sym_eaxc_map_latch_clr         <=  1'b1;
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

