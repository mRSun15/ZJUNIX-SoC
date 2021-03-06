#
# Vivado (TM) v2016.2 (64-bit)
#
# SoC.tcl: Tcl script for re-creating project 'SoC_rev3'
#
# Generated by Vivado on Thu Mar 29 20:45:13 +0800 2018
# IP Build 1577682 on Fri Jun  3 12:00:54 MDT 2016
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "../src"

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

source fileset.tcl

variable script_file
set script_file "SoC.tcl"

# Help information for this script
proc help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < [llength $::argc]} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir" { incr i; set origin_dir [lindex $::argv $i] }
      "--help"       { help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/"]"

# Create project
create_project SoC_rev3 ./SoC_SWORD4 -part xc7k325tffg676-1

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Reconstruct message rules
# None

# Set project properties
set obj [get_projects SoC_rev3]
set_property "compxlib.activehdl_compiled_library_dir" "$proj_dir/SoC_rev3.cache/compile_simlib/activehdl" $obj
set_property "compxlib.ies_compiled_library_dir" "$proj_dir/SoC_rev3.cache/compile_simlib/ies" $obj
set_property "compxlib.modelsim_compiled_library_dir" "$proj_dir/SoC_rev3.cache/compile_simlib/modelsim" $obj
set_property "compxlib.questa_compiled_library_dir" "$proj_dir/SoC_rev3.cache/compile_simlib/questa" $obj
set_property "compxlib.riviera_compiled_library_dir" "$proj_dir/SoC_rev3.cache/compile_simlib/riviera" $obj
set_property "compxlib.vcs_compiled_library_dir" "$proj_dir/SoC_rev3.cache/compile_simlib/vcs" $obj
set_property "default_lib" "xil_defaultlib" $obj
set_property "generate_ip_upgrade_log" "0" $obj
set_property "part" "xc7k325tffg676-1" $obj
set_property "sim.ip.auto_export_scripts" "1" $obj
set_property "simulator_language" "Mixed" $obj
set_property "source_mgmt_mode" "DisplayOnly" $obj
set_property "xpm_libraries" "XPM_CDC XPM_MEMORY" $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
add_files -norecurse -fileset $obj $rtl_common
add_files -norecurse -fileset $obj $rtl_SWORD4

# Set 'sources_1' fileset file properties for remote files
set_property "file_type" "Verilog Header" [get_files -of_objects [get_filesets sources_1] $header_common]

# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
set_property "top" "Top" [get_filesets sources_1]

# Create 'SwordV4' fileset (if not found)
if {[string equal [get_filesets -quiet SwordV4] ""]} {
  create_fileset -constrset SwordV4
}

# Set 'SwordV4' fileset object
set obj [get_filesets SwordV4]

# Add/Import constrs file and set constrs file properties
set file_added [add_files -norecurse -fileset $obj $constr_SWORD4]
set file_obj [get_files -of_objects $obj $constr_SWORD4]
set_property "file_type" "XDC" $file_obj
set_property "used_in" "implementation" $file_obj
set_property "used_in_synthesis" "0" $file_obj

# Set 'SwordV4' fileset properties
set_property "target_constrs_file" $constr_SWORD4_target $obj

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
# None

# Set 'sim_1' fileset file properties for remote files
# None

# Set 'sim_1' fileset file properties for local files
# None

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property "top" "Top" $obj
set_property "transport_int_delay" "0" $obj
set_property "transport_path_delay" "0" $obj
set_property "xelab.nosort" "1" $obj
set_property "xelab.unifast" "" $obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
  create_run -name synth_1 -part xc7k325tffg676-1 -flow {Vivado Synthesis 2016} -strategy "Vivado Synthesis Defaults" -constrset SwordV4
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2016" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property "constrset" "SwordV4" $obj
set_property "needs_refresh" "1" $obj
set_property "part" "xc7k325tffg676-1" $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
  create_run -name impl_1 -part xc7k325tffg676-1 -flow {Vivado Implementation 2016} -strategy "Vivado Implementation Defaults" -constrset SwordV4 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2016" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property "constrset" "SwordV4" $obj
set_property "needs_refresh" "1" $obj
set_property "part" "xc7k325tffg676-1" $obj
set_property "steps.write_bitstream.args.readback_file" "0" $obj
set_property "steps.write_bitstream.args.verbose" "0" $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

puts "INFO: Project created:SoC_rev3"
