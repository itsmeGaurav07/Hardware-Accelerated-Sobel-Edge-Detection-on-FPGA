################################
# CLOCK (100 MHz)
################################
set_property PACKAGE_PIN H16 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.0 [get_ports clk]

################################
# RESET BUTTON (BTN0)
################################
set_property PACKAGE_PIN D19 [get_ports rst_btn]
set_property IOSTANDARD LVCMOS33 [get_ports rst_btn]

################################
# SWITCHES (SW0-SW7)  CORRECT
################################
set_property PACKAGE_PIN V17 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {sw[2]}]
set_property PACKAGE_PIN W15 [get_ports {sw[3]}]
set_property PACKAGE_PIN U14 [get_ports {sw[4]}]
set_property PACKAGE_PIN U15 [get_ports {sw[5]}]
set_property PACKAGE_PIN T11 [get_ports {sw[6]}]
set_property PACKAGE_PIN T10 [get_ports {sw[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports sw[*]]

################################
# LEDs (LD0-LD3)  CORRECT
################################
set_property PACKAGE_PIN R14 [get_ports {led[0]}]
set_property PACKAGE_PIN P14 [get_ports {led[1]}]
set_property PACKAGE_PIN N16 [get_ports {led[2]}]
set_property PACKAGE_PIN M14 [get_ports {led[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports led[*]]
