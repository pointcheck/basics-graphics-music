# User config

set ::env(DESIGN_NAME) asic_top
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.*v]

set ::env(CLOCK_PORT) "clk"

set ::env(FP_SIZING) "absolute"
set ::env(DIE_AREA) {0 0 100 100}

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl

if { [file exists $filename] == 1} {
  source $filename
}