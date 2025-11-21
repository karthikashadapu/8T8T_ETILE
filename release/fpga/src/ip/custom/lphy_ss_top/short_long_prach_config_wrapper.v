 /*******************************************************************************************
**                                                                                        **
**                                                                                        **
**  Copyright 2016-2017 Intel Corporation.                                                **
**  The source code contained or described herein and all documents related to the        **
**  source code ("Material") are owned by Intel Corporation or its suppliers.             **
**  Title to the Material remains with Intel Corporation, its suppliers, or licensors.    **
**  The Material contains trade secrets and proprietary and confidential information      **
**  of Intel Corporation, its suppliers, and licensors, and is protected by worldwide     **
**  copyright and trade secret laws and treaty provisions. No part of the Material        **
**  may be used, copied, reproduced, modified, published, uploaded, posted,               **
**  transmitted, distributed, or disclosed in any way without Intel's prior express       **
**  written permission.                                                                   **
**  No license under any patent, copyright, trade secret or other intellectual            **
**  property right is granted to or conferred upon you by disclosure or delivery of       **
**  the Materials, either expressly, by implication, inducement, estoppel or otherwise.   **
**  Any license under such intellectual property rights must be express and approved by   **
**  Intel in writing.                                                                     **
**  Unless otherwise agreed by Intel in writing, you may not remove or alter this notice  **
**  or any other notice embedded in Materials by Intel or Intel's suppliers or licensors  **
**  in any way.                                                                           **
**                                                                                        **
**                                                                                        **
*******************************************************************************************/

// ================================================================================ 
// File:        short_long_prach_config_wrapper.v
// Author:      Boobathi Selvaraj
// Description: It decodes the incoming Sec type 3 C plane packet from ORAN IP and extracts the freq offset and caculates the 
// NCO value and configures the PRACH IP NCO at SF Boundary.
// It also has a MUX to select whether to configure the NCO from M plane or C plane. 
// ================================================================================ 

 module short_long_prach_config_wrapper(
		// Light Weight clock
		clk_csr                   	,
		rst_csr_n                 	,

		// HPS Interface	
		lw_bridge_waitrequest_l1  	,
		lw_bridge_readdata_l1     	,
		lw_bridge_writedata_l1    	,
		lw_bridge_address_l1      	,
		lw_bridge_write_l1        	,
		lw_bridge_read_l1         	,
		lw_bridge_readdatavalid_l1	,

		lw_bridge_waitrequest_l2  	,
		lw_bridge_readdata_l2     	,
		lw_bridge_writedata_l2    	,
		lw_bridge_address_l2      	,
		lw_bridge_write_l2        	,
		lw_bridge_read_l2         	,
		lw_bridge_readdatavalid_l2	,

		SF				            ,
		c_m_plane_sel				,

		prach_nco_ant0_l1				,
		prach_nco_ant1_l1				,
		prach_nco_ant2_l1				,
		prach_nco_ant3_l1				,
		prach_nco_ant0_l2				,
		prach_nco_ant1_l2				,
		prach_nco_ant2_l2				,
		prach_nco_ant3_l2				,

		frequencyOffset_ant0_l1		,
		frequencyOffset_ant0_l2		,
		frequencyOffset_ant1_l1		,
		frequencyOffset_ant1_l2		,
		frequencyOffset_ant2_l1		,
		frequencyOffset_ant2_l2		,
		frequencyOffset_ant3_l1		,
		frequencyOffset_ant3_l2     ,

        sprach_c_freq_offset	    ,
        sprach_c_fft_size        	,
        sprach_m_freq_offset	    ,
        sprach_m_fft_size	    	,
        sprach_cfg_idx_l1		    ,
        sprach_cfg_time_idx_l1	    ,
        n_sprach_slot_l1		    ,
        active_sprach_slot_l1	    ,
        sprach_freq_idx_l1          ,
        sprach_cfg_idx_l2		    ,
        sprach_cfg_time_idx_l2	    ,
        n_sprach_slot_l2		    ,
        active_sprach_slot_l2	    ,
		sprach_freq_idx_l2			,
		ul_start_pulse_latch		
		
	);
	`include "../common/def_param.vh"
	
	input clk_csr;
	input rst_csr_n;

	// Light Weight Configuration 
	output [3:0]      	lw_bridge_address_l1    		;
	output            	lw_bridge_write_l1      		;
	output            	lw_bridge_read_l1       		;
	input  [31:0]     	lw_bridge_readdata_l1   		;
	output [31:0]     	lw_bridge_writedata_l1  		;
	input             	lw_bridge_waitrequest_l1		;
	input             	lw_bridge_readdatavalid_l1		;

	// Light Weight Configuration 
	output [3:0]      	lw_bridge_address_l2    		;
	output            	lw_bridge_write_l2      		;
	output            	lw_bridge_read_l2       		;
	input  [31:0]     	lw_bridge_readdata_l2   		;
	output [31:0]     	lw_bridge_writedata_l2  		;
	input             	lw_bridge_waitrequest_l2		;
	input             	lw_bridge_readdatavalid_l2		;

	input				SF								;
	input				c_m_plane_sel					;

	input wire [31:0]	prach_nco_ant0_l1					;
	input wire [31:0]	prach_nco_ant1_l1					;
	input wire [31:0]	prach_nco_ant2_l1					;
	input wire [31:0]	prach_nco_ant3_l1					;
	input wire [31:0]	prach_nco_ant0_l2					;
	input wire [31:0]	prach_nco_ant1_l2					;
	input wire [31:0]	prach_nco_ant2_l2					;
	input wire [31:0]	prach_nco_ant3_l2					;	
	
	input signed  [31:0]	frequencyOffset_ant0_l1					;
	input signed  [31:0]	frequencyOffset_ant0_l2					;
	input signed  [31:0]	frequencyOffset_ant1_l1					;
	input signed  [31:0]	frequencyOffset_ant1_l2					;
	input signed  [31:0]	frequencyOffset_ant2_l1					;
	input signed  [31:0]	frequencyOffset_ant2_l2					;
	input signed  [31:0]	frequencyOffset_ant3_l1					;
	input signed  [31:0]	frequencyOffset_ant3_l2					;

    input [23:0]		sprach_c_freq_offset         ;	
	input [3:0]			sprach_c_fft_size            ; 
	input [23:0]		sprach_m_freq_offset         ;	
	input [3:0]			sprach_m_fft_size            ; 
	
    input [7:0]  		sprach_cfg_idx_l1			;
    input [31:0]    	sprach_cfg_time_idx_l1		;
    input [31:0]  		n_sprach_slot_l1		    ;
    input [31:0] 		active_sprach_slot_l1		;
    input [31:0]    	sprach_freq_idx_l1			;
 
	
    input [7:0]  		sprach_cfg_idx_l2 			;
    input [31:0]    	sprach_cfg_time_idx_l2 		;
    input [31:0]  		n_sprach_slot_l2 		    ;
    input [31:0] 		active_sprach_slot_l2 		;
    input [31:0]    	sprach_freq_idx_l2 			;	
	
	input wire ul_start_pulse_latch;
	
`ifndef SHORT_PRACH_FORMAT 
 long_prach_nco_config u_long_prach_nco_config_l1(
		//CSR Clock
		.clk_csr               		(clk_csr					),
		.rst_csr_n             		(rst_csr_n					),
		// HPS Interface       		
		.lw_bridge_waitrequest 		(lw_bridge_waitrequest_l1	),
		.lw_bridge_readdata    		(lw_bridge_readdata_l1		),
		.lw_bridge_readdatavalid	(lw_bridge_readdatavalid_l1	),
		.lw_bridge_writedata   		(lw_bridge_writedata_l1		),
		.lw_bridge_address     		(lw_bridge_address_l1		),
		.lw_bridge_write       		(lw_bridge_write_l1			),
		.lw_bridge_read        		(lw_bridge_read_l1			),

		.SF        	   				(SF							),
		.c_m_plane_sel        	   	(c_m_plane_sel				),
		
		.prach_nco_ant0             (prach_nco_ant0_l1             ),
		.prach_nco_ant1             (prach_nco_ant1_l1             ),
		.prach_nco_ant2             (prach_nco_ant2_l1             ),
		.prach_nco_ant3             (prach_nco_ant3_l1             ),
		
		.frequencyOffset_ant0       (frequencyOffset_ant0_l1		),
		.frequencyOffset_ant1       (frequencyOffset_ant1_l1		),
		.frequencyOffset_ant2       (frequencyOffset_ant2_l1		),
		.frequencyOffset_ant3       (frequencyOffset_ant3_l1		),
		.ul_start_pulse_latch 		(ul_start_pulse_latch			)
		
	);
	  
long_prach_nco_config u_long_prach_nco_config_l2(
		//CSR Clock
		.clk_csr               		(clk_csr					),
		.rst_csr_n             		(rst_csr_n					),
		// HPS Interface       		
		.lw_bridge_waitrequest 		(lw_bridge_waitrequest_l2	),
		.lw_bridge_readdata    		(lw_bridge_readdata_l2		),
		.lw_bridge_readdatavalid	(lw_bridge_readdatavalid_l2	),
		.lw_bridge_writedata   		(lw_bridge_writedata_l2		),
		.lw_bridge_address     		(lw_bridge_address_l2		),
		.lw_bridge_write       		(lw_bridge_write_l2			),
		.lw_bridge_read        		(lw_bridge_read_l2			),

		.SF        	   				(SF							),
		.c_m_plane_sel        	   	(c_m_plane_sel				),
		
		.prach_nco_ant0             (prach_nco_ant0_l2             ),
		.prach_nco_ant1             (prach_nco_ant1_l2             ),
		.prach_nco_ant2             (prach_nco_ant2_l2             ),
		.prach_nco_ant3             (prach_nco_ant3_l2             ),
		
		.frequencyOffset_ant0       (frequencyOffset_ant0_l2		),
		.frequencyOffset_ant1       (frequencyOffset_ant1_l2		),
		.frequencyOffset_ant2       (frequencyOffset_ant2_l2		),
		.frequencyOffset_ant3       (frequencyOffset_ant3_l2		),
		.ul_start_pulse_latch 		(ul_start_pulse_latch			)		
		
	);
	
	
`else

	short_prach_c_m_config u_short_prach_config_l1
	(
	
	    .clk_csr                   (clk_csr                 	 ),         					
		.rst_csr_n				   (rst_csr_n				     ),
		.lw_bridge_waitrequest     (lw_bridge_waitrequest_l1     ),
		.lw_bridge_readdata        (lw_bridge_readdata_l1        ),
		.lw_bridge_readdatavalid   (lw_bridge_readdatavalid_l1   ),
		.lw_bridge_writedata       (lw_bridge_writedata_l1       ),
		.lw_bridge_address         (lw_bridge_address_l1         ),
		.lw_bridge_write           (lw_bridge_write_l1           ),
		.lw_bridge_read            (lw_bridge_read_l1            ),
		.SF         		       (SF         		     		 ),
		.c_m_plane_sel 			   (c_m_plane_sel 			 	 ),
		.prach_c_freq_offset	   (sprach_c_freq_offset	 	 ),
		.prach_c_fft_size          (sprach_c_fft_size            ),
        .prach_m_freq_offset	   (sprach_m_freq_offset		 ),
		.prach_m_fft_size	       (sprach_m_fft_size	         ),
        .prach_cfg_idx			   (sprach_cfg_idx_l1			 ),
        .prach_cfg_time_idx		   (sprach_cfg_time_idx_l1		 ),
        .n_prach_slot			   (n_sprach_slot_l1			 ),
        .active_prach_slot		   (active_sprach_slot_l1		 ),
        .prach_freq_idx	           (sprach_freq_idx_l1	         ),
		.ul_start_pulse_latch	   (ul_start_pulse_latch	     )
	); 

    short_prach_c_m_config u_short_prach_config_l2
	(
	
	    .clk_csr                   (clk_csr                 	 ),         					
		.rst_csr_n				   (rst_csr_n				     ),
		.lw_bridge_waitrequest     (lw_bridge_waitrequest_l2     ),
		.lw_bridge_readdata        (lw_bridge_readdata_l2        ),
		.lw_bridge_readdatavalid   (lw_bridge_readdatavalid_l2   ),
		.lw_bridge_writedata       (lw_bridge_writedata_l2       ),
		.lw_bridge_address         (lw_bridge_address_l2         ),
		.lw_bridge_write           (lw_bridge_write_l2           ),
		.lw_bridge_read            (lw_bridge_read_l2            ),
		.SF         		       (SF         		     		 ),
		.c_m_plane_sel 			   (c_m_plane_sel 			 	 ),
		.prach_c_freq_offset	   (sprach_c_freq_offset	 	 ),
		.prach_c_fft_size          (sprach_c_fft_size         	 ),
        .prach_m_freq_offset	   (sprach_m_freq_offset		 ),
		.prach_m_fft_size	       (sprach_m_fft_size	     	 ),
        .prach_cfg_idx			   (sprach_cfg_idx_l2			 ),
        .prach_cfg_time_idx		   (sprach_cfg_time_idx_l2		 ),
        .n_prach_slot			   (n_sprach_slot_l2			 ),
        .active_prach_slot		   (active_sprach_slot_l2		 ),
        .prach_freq_idx	           (sprach_freq_idx_l2	         ),
		.ul_start_pulse_latch	   (ul_start_pulse_latch	     )
	); 	
`endif
								   
	  endmodule                    
