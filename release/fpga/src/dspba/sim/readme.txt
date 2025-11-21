---------------------------------------------------------------------------------------------------
Version info
---------------------------------------------------------------------------------------------------
    Version 1.0: Added seven testcases with functionality of data logging.
    Version 2.0: Added funcionality of both 1CC and 2CC simulation with change in parameter CC_run
    Version 2.1: Parametrization of expected vectors folder inside each formatter script using this readme file
    Version 2.2: Additional inputs like CC_run and NumSym also made to be inserted in user prompt (For PP D1 drop)
    Version 3.0: Ripple compensation added for 129(DL)+311(UL) taps
    Version 3.1: Ripple compensation added for 129(DL)+311(UL) taps with testvector size reduced in formatter scripts (For PP D2 drop)
---------------------------------------------------------------------------------------------------
Files
---------------------------------------------------------------------------------------------------
    Top file to run        : top.m
    Description            : Triggers a script for expected vectors generation for all subsystems, then runs each subsystem one by one, feeding output of previous subsystem to the input of next.
    
    Other files:
        <subsystem-name>_input_formatter : For providing data to the <subsystem-name> module input
        func_data_log                    : Function to log data
        display_constellation            : Function to display constellation
        display_msgbox                   : Function to display NMSE after each subsystem runs
        b2b_<CC>cc_log.txt               : log of the Simulation run
        locate_testvector.txt            : Contains location of testvectors. Will be read by conversion scripts.

---------------------------------------------------------------------------------------------------
Settings
---------------------------------------------------------------------------------------------------
    After triggering run, a pop-up window asks for 

    Parameters             : CC_run
                             NumSym (a minimum of 4 required)
    
    Testcase selection     : Selection of testcase.

---------------------------------------------------------------------------------------------------
Abstract
---------------------------------------------------------------------------------------------------
    This is a MATLAB based simulation package which runs the low-phy DSPBA modules in back to back fashion. The output of one module goes to the input of next module and so on. This helps to verify the complte low-phy chain in a single run.The modules included are iFFT, DUC and carrier aggregator+interpolator in DL path, decimator+delay compensation, DDC, and FFT in UL path.The data output from DL path is looped back to UL path. Each module requires input in specific formats. This job is done by the formatter scripts written for each of these 6 modules. These formatter scripts take inputs from various places (data output from previous module, settings(like BW, etc), expected I/O), package them and give to DSPBA modules. NMSE is calculated at the end of each DSPBA module's execution.
    Component carriers supported: The simulation can run for either 1 CC or 2 CC where each CC has 4 AxCs. 
    Bandwidths supported        : The simulation supports following bandwidths (in MHz) : 100+100, 100+60, 60+60.
    Simulation length           : Number of Symbols to simulate can be configured via NumSym variable.
    Clock frequency             : 491.52MHz