echo "compiling fpga..."

# ***************************************************
# delete the old library and re-create it on every compile
# to prevent "stale" library data
# ***************************************************
if [ file exists fpga_top_lib ] {
    vdel -lib fpga_top_lib -all
}
vlib fpga_top_lib

# -------------------------
# -- megacore
# -------------------------
vcom -work fpga_top_lib -2008 -quiet ../projects/fpga_example/mega/pll_main.vhd

# -------------------------
# -- fpga package
# -------------------------
vcom -work fpga_top_lib -2008 -quiet ../projects/fpga_example/src/fpga_pkg.vhd

# -------------------------
# -- fpga clk/reset (megacore)
# -------------------------
vcom -work fpga_top_lib -2008 -quiet ../projects/fpga_example/src/clk_rst_module.vhd

# -------------------------
# -- timer
# -------------------------
vcom -work fpga_top_lib -2008 -quiet ../projects/fpga_example/src/timer/timer_pkg.vhd
vcom -work fpga_top_lib -2008 -quiet ../projects/fpga_example/src/timer/timer_top.vhd

# -------------------------
# -- timer
# -------------------------
vcom -work fpga_top_lib -2008 -quiet ../projects/fpga_example/src/state_machine/state_machine_pkg.vhd
vcom -work fpga_top_lib -2008 -quiet ../projects/fpga_example/src/state_machine/state_machine_top.vhd

# -------------------------
# -- fpga domains
# -------------------------
vcom -work fpga_top_lib -2008 -quiet ../projects/fpga_example/src/clk_domain_1.vhd
vcom -work fpga_top_lib -2008 -quiet ../projects/fpga_example/src/clk_domain_2.vhd

# -------------------------
# -- fpga top level
# -------------------------
vcom -work fpga_top_lib -2008 -quiet ../projects/fpga_example/src/fpga_top.vhd
