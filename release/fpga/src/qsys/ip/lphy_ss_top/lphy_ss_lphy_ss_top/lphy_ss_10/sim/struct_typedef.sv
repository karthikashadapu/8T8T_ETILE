package typedef_struct ;
//***********************************************************************************************************************
//dl_eaxc_id format:
//   |dl_eaxc_id0|dl_eaxc_id1|dl_eaxc_id2|dl_eaxc_id3 | dl_eaxc_id4 |dl_eaxc_id5 | dl_eaxc_id6 | dl_eaxc_id7 |          //Packet format
//   |255    240 |239     224|223     208|207     194 | 193     178 |177     160 | 159    144  | 143     128 |          //Bit indices
//   |  16 bit   |  16 bit   |   16 bit  |   16 bit   |   15 bit    |  16 bit    |   16 bit    |   16 bit    |           //No. of bits
//***********************************************************************************************************************

typedef struct packed{

logic [15:0]		dl_eaxc_id0			 ;
logic [15:0]		dl_eaxc_id1			 ;
logic [15:0]		dl_eaxc_id2			 ;
logic [15:0]		dl_eaxc_id3			 ;
logic [15:0]		dl_eaxc_id4			 ;
logic [15:0]		dl_eaxc_id5			 ;
logic [15:0]		dl_eaxc_id6			 ;
logic [15:0]		dl_eaxc_id7			 ;

} dl_eaxc_id;


//***********************************************************************************************************************
//ul_eaxc_id format:
//   |ul_eaxc_id0|ul_eaxc_id1|ul_eaxc_id2|ul_eaxc_id3 | ul_eaxc_id4 |ul_eaxc_id5 | ul_eaxc_id6 | ul_eaxc_id7 | ul_eaxc_id8|ul_eaxc_id9|ul_eaxc_id10|ul_eaxc_id11 | ul_eaxc_id12 |ul_eaxc_id13  | ul_eaxc_id14   | ul_eaxc_id15    |   //Packet format
//   |255    240 |239     224|223     208|207     194 | 193     178 |177     160 | 159    144  | 143     128 | 255    240 |239     224|223     208 |207     194  | 193     178  |177     160   | 159    144     | 143     128     |   //Bit indices
//   |  16 bit   |  16 bit   |   16 bit  |   16 bit   |   15 bit    |  16 bit    |   16 bit    |   16 bit    |   16 bit   |  16 bit   |   16 bit   |   16 bit    |   15 bit     |  16 bit      |   16 bit       |   16 bit        |   //No. of bits
//***********************************************************************************************************************


typedef struct packed{

logic [15:0]		ul_eaxc_id0			 ;
logic [15:0]		ul_eaxc_id1			 ;
logic [15:0]		ul_eaxc_id2			 ;
logic [15:0]		ul_eaxc_id3			 ;
logic [15:0]		ul_eaxc_id4			 ;
logic [15:0]		ul_eaxc_id5			 ;
logic [15:0]		ul_eaxc_id6			 ;
logic [15:0]		ul_eaxc_id7			 ;
logic [15:0]		ul_eaxc_id8			 ;
logic [15:0]		ul_eaxc_id9			 ;
logic [15:0]		ul_eaxc_id10		 ;
logic [15:0]		ul_eaxc_id11		 ;
logic [15:0]		ul_eaxc_id12		 ;
logic [15:0]		ul_eaxc_id13		 ;
logic [15:0]		ul_eaxc_id14		 ;
logic [15:0]		ul_eaxc_id15		 ;

} ul_eaxc_id;

//***********************************************************************************************************************
//dspba_config_param format:
//   |cp_len   | fft size | ifft gain l1 | ifft_shift_l1  | ifft_mux_const_l1 | ifft_mux_const_l2 | ifft_mux_const_l2 |                
//   |293  283 | 282  279 |  278     247 | 246       243  | 242           211 | 210           179 | 210           179 |                
//   |  11 bit |  4 bit   |     32 bit   |     4 bits     |  32 bits          |  32 bits          |  32 bits          |                
//***********************************************************************************************************************

//***********************************************************************************************************************
//dspba_config_param format:
//| ifft_mux_const_l2 | ifft_mux_const_l2 | ifft_mux_const_l2 | ifft_mux_const_l2 | ifft_mux_const_l2 | ifft_mux_const_l2 |
//| 178           178 | 177           177 | 176           176 | 175           175 | 174           174 | 173          173  |
//|  1 bits           |  1 bits           |  1 bits           |  1 bits           |  1 bits           |  1 bits           |
//***********************************************************************************************************************

//dspba_config_param format:
//| ifft_gain_l2 | ifft_shift_l2 | dps_value_l1 | dps_value_l2 | hcs_bypass | fft_gain_l1 | fft_shift_l1 | fft_gain_l2 | fft_shift_l2 |
//| 172      141 | 140      137  | 136      105 | 104      73  | 72    72   | 71      40  | 39      36   | 35      4   | 3      0     |
//|  1 bits      |  1 bits       |  1 bits      |  1 bits      |  1 bits    |  32 bits    |  32 bits     |  32 bits    |  4 bits      |
//***********************************************************************************************************************

typedef struct packed{

logic [10:0] 		cp_len 				;	
logic [3:0]		    fft_size 			;		
logic [31:0] 		ifft_gain_l1 		;		
logic [3:0] 		ifft_shift_l1 		;		
logic [31:0] 		ifft_mux_const_l1	;
logic [31:0] 		ifft_mux_const_l2	;
logic 		 		ifft_muxsel_l1		;
logic 		 		ifft_muxsel_l2		;		
logic 		 		ifft_dc_sc_en_l1 	;
logic 		 		ifft_dc_sc_en_l2 	;
logic 		 		fft_dc_sc_en_l1  	;
logic 		 		fft_dc_sc_en_l2  	;
logic [31:0] 		ifft_gain_l2 		;		
logic [3:0] 		ifft_shift_l2 		;
logic [31:0]		dps_value_l1		;
logic [31:0]		dps_value_l2		;							
logic 			 	hcs_bypass			;
logic [31:0]		fft_gain_l1 		;	
logic [3:0] 		fft_shift_l1 		;
logic [31:0]		fft_gain_l2 		;	
logic [3:0] 		fft_shift_l2 		;

} dspba_config_param;




typedef struct packed{

logic       rx_c_dataDirection       ;
logic [3:0] rx_c_filterIndex     	 ;
logic [7:0] rx_c_frameId         	 ;
logic [3:0] rx_c_subframeId      	 ;
logic [5:0] rx_c_slotID          	 ;
logic [5:0] rx_c_symbolid            ;
logic [7:0] rx_c_numberOfsections    ;
logic [11:0]rx_c_sectionId           ;
logic       rx_c_rb              	 ;
logic       rx_c_symInc			     ;
logic [9:0] rx_c_startPrb            ;
logic [7:0] rx_c_numPrb              ;
logic [7:0] rx_c_udCompHdr           ;
logic       rx_sec_hdr_valid         ;
logic [7:0] rx_sectionType       	 ;
logic [7:0] rx_ext_sectionType       ;
logic [15:0]rx_timeOffset            ;
logic [7:0] rx_frameStructure    	 ;					
logic [15:0]rx_cpLength              ;
logic [11:0]rx_reMask            	 ;
logic [3:0] rx_numSymbol             ;
logic [23:0]rx_frequencyOffset   	 ;
logic       rx_ef                    ;
logic [14:0]rx_beamid                ;
            
} oran_rx_cplane_conduit;

typedef struct packed{

logic         rx_u_dataDirection; 
logic [3:0]   rx_u_filterIndex  ;   
logic [7:0]   rx_u_frameId      ;       
logic [3:0]   rx_u_subframeId   ;    
logic [5:0]   rx_u_slotID       ;        
logic [5:0]   rx_u_symbolid     ;      
logic [11:0]  rx_u_sectionId    ;     
logic         rx_u_rb		    ;            
logic [9:0]   rx_u_startPrb     ;      
logic [7:0]   rx_u_numPrb       ;        
logic [7:0]   rx_u_udCompHdr    ;     
            
} oran_rx_uplane_conduit;

typedef struct packed{

logic 		   prach_ant_mux_output_fifo_full      ;
logic  [1:0]   prach_ant_mux_sc_fifo_full          ;
logic  [1:0]   prach_ant_mux_sc_fifo_full_time_ref ;
          
} prach_fifo_full ;

typedef struct packed{

logic [31:0] 							blank_prb_flag 					    ;
logic 									blank_prb_intr					    ;
logic [23:0]                            longprach_freqoffset                ;
logic                                   blanking_dis                    	;
logic                                   c_hps                           	;
logic [7:0] 							hps_framestructure   				;
logic [15:0]							hps_cplength        				;
logic [23:0]							hps_freqoffset                  	;
logic                                   hps_valid                       	;
logic [1:0]                             filt_flush_en                       ;

         
} lphy_ss_conduit ;

endpackage


