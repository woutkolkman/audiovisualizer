## Generated SDC file "audiovisualizer.out.sdc"

## Copyright (C) 2017  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Intel and sold by Intel or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 16.1.2 Build 203 01/18/2017 SJ Lite Edition"

## DATE    "Mon May 11 16:13:06 2020"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out} -period 100.000 -waveform { 0.000 50.000 } [get_registers { matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out }]
create_clock -name {CLOCK_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports { CLOCK_50 }]
create_clock -name {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|state.SRAMADDR} -period 100.000 -waveform { 0.000 50.000 } [get_registers { matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|state.SRAMADDR }]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {CLOCK_50}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {CLOCK_50}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {CLOCK_50}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {CLOCK_50}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -rise_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50}] -fall_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}] -rise_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}] -fall_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}] -rise_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|state.SRAMADDR}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}] -fall_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|state.SRAMADDR}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}] -rise_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}] -fall_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}] -rise_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|state.SRAMADDR}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}] -fall_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|state.SRAMADDR}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|state.SRAMADDR}] -rise_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|state.SRAMADDR}] -fall_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|state.SRAMADDR}] -rise_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|state.SRAMADDR}] -fall_to [get_clocks {matrix_driver_top:matrixdriver|matrix_ledcontrol:matrix|matrix_clkdivider:clock|clk_out}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************
