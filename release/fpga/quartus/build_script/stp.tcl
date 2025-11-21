# Get the argument passed from the shell script
project_open "../ag_esom_top.qpf"

# Function to process user choice
proc process_choice {user_choice} {
    if {[string equal -nocase $user_choice "stp_enabled"]} {
        set_global_assignment -name ENABLE_SIGNALTAP ON
        puts "SignalTap enabled."
        puts "Available STP files:"
        set stp_files [glob -nocomplain -directory stp *.stp]
        set num_files [llength $stp_files]

        if {$num_files == 0} {
            puts "No STP files found in the current directory."
        } else {
            for {set i 0} {$i < $num_files} {incr i} {
                puts "$i. [lindex $stp_files $i]"
            }
            
            puts "Enter the number corresponding to the STP file you want to use:"
            set stp_index [gets stdin]
            set selected_stp [lindex $stp_files $stp_index]
            set_global_assignment -name USE_SIGNALTAP_FILE $selected_stp
            puts "Selected STP file: $selected_stp"
        }
    } elseif {[string equal -nocase $user_choice "stp_disabled"]} {
        set_global_assignment -name ENABLE_SIGNALTAP OFF
        puts "SignalTap disabled."
    } else {
        return 0
    }
    return 1
}

# Loop until the user provides a valid argument
set valid 0
if {[llength $argv] > 0} {
    set user_choice [lindex $argv 0]
} else {
    puts "Please provide an argument ('stp_enabled' or 'stp_disabled'):"
}

while {!$valid} {
    if {![info exists user_choice] || $user_choice eq ""} {
        set user_choice [gets stdin]
    }
    
    set valid [process_choice $user_choice]
    
    if {!$valid} {
        puts "Invalid argument. Use 'stp_enabled' or 'stp_disabled':"
        unset user_choice ;# Clear the variable to ensure the user is prompted again
    }
}

project_close

