echo "Compiling Altera 17.0 libraries..."

# ***************************************************
# Delete the old library and re-create it on every compile
# to prevent "stale" library data
# ***************************************************
if [ file exists lpm ] {
    vdel -lib lpm -all
}
vlib lpm
vcom -work lpm -2008 -quiet src/altera_17.0/220pack.vhd src/altera_17.0/220model.vhd

if [ file exists altera_mf ] {
    vdel -lib altera_mf -all
}
vlib altera_mf
vcom -work altera_mf -2008 -quiet src/altera_17.0/altera_mf_components.vhd src/altera_17.0/altera_mf.vhd

if [ file exists sgate ] {
    vdel -lib sgate -all
}
vlib sgate
vcom -work sgate -2008 -quiet src/altera_17.0/sgate_pack.vhd src/altera_17.0/sgate.vhd

if [ file exists stratixiigx_hssi ] {
    vdel -lib stratixiigx_hssi -all
}
#vlib stratixiigx_hssi
#vcom -work stratixiigx_hssi -2008 -quiet src/altera_17.0/stratixiigx_hssi_components.vhd
#vcom -work stratixiigx_hssi -2008 -quiet src/altera_17.0/stratixiigx_hssi_atoms.vhd

if [ file exists altera ] {
    vdel -lib altera -all
}
vlib altera
vcom -work altera -2008 -quiet src/altera_17.0/altera_standard_functions.vhd
vcom -work altera -2008 -quiet src/altera_17.0/altera_syn_attributes.vhd
vcom -work altera -2008 -quiet src/altera_17.0/alt_dspbuilder_package.vhd
vcom -work altera -2008 -quiet src/altera_17.0/altera_europa_support_lib.vhd
vcom -work altera -2008 -quiet src/altera_17.0/altera_primitives_components.vhd
vcom -work altera -2008 -quiet src/altera_17.0/altera_primitives.vhd

if [ file exists altera_lnsim ] {
    vdel -lib altera_lnsim -all
}
vlib altera_lnsim
vcom -work altera_lnsim -2008 -quiet src/altera_17.0/altera_lnsim_components.vhd


if [ file exists cycloneiv_hssi ] {
    vdel -lib cycloneiv_hssi -all
}
vlib cycloneiv_hssi
vcom -work cycloneiv_hssi -2008 -quiet src/altera_17.0/cycloneiv_hssi_components.vhd
vcom -work cycloneiv_hssi -2008 -quiet src/altera_17.0/cycloneiv_hssi_atoms.vhd

# Map the support library from the example_top file
#vmap altera work
vcom -work altera -2008 -quiet src/altera_17.0/altera_europa_support_lib.vhd

# Cyclone iV E Lib
if [ file exists cycloneive ] {
    vdel -lib cycloneive -all
}
vlib cycloneive
vcom -work cycloneive -2008 -quiet src/altera_17.0/cycloneive_atoms.vhd
vcom -work cycloneive -2008 -quiet src/altera_17.0/cycloneive_components.vhd

# Cyclone V HSSI lib
if [ file exists cyclonev_hssi ] {
    vdel -lib cyclonev_hssi -all
}
vlib cyclonev_hssi
vcom -work cyclonev_hssi -2008 -quiet src/altera_17.0/cyclonev_hssi_components.vhd
vcom -work cyclonev_hssi -2008 -quiet src/altera_17.0/cyclonev_hssi_atoms.vhd

# Cyclone V Lib
if [ file exists cyclonev ] {
    vdel -lib cyclonev -all
}
vlib cyclonev
vlog -work cycloneV -quiet src/altera_17.0/cyclonev_atoms_ncrypt.v
vcom -work cyclonev -2008 -quiet src/altera_17.0/cyclonev_atoms.vhd
vcom -work cyclonev -2008 -quiet src/altera_17.0/cyclonev_components.vhd

if [ file exists fiftyfivenm ] {
    vdel -lib fiftyfivenm -all
}
vlib fiftyfivenm
vcom -work fiftyfivenm -2008 -quiet src/altera_17.0/fiftyfivenm_atoms.vhd
vcom -work fiftyfivenm -2008 -quiet src/altera_17.0/fiftyfivenm_components.vhd

if [ file exists altera_ver ] {
    vdel -lib altera_ver -all
}
vlib altera_ver
vlog  -work altera_ver -quiet src/altera_17.0/altera_primitives.v

if [ file exists lpm_ver ] {
    vdel -lib lpm_ver -all
}
vlib lpm_ver
vlog  -work lpm_ver -quiet src/altera_17.0/220model.v


if [ file exists sgate_ver ] {
    vdel -lib sgate_ver -all
}
vlib sgate_ver
vlog  -work sgate_ver -quiet src/altera_17.0/sgate.v

if [ file exists altera_mf_ver ] {
    vdel -lib altera_mf_ver -all
}
vlib altera_mf_ver
vlog  -work altera_mf_ver -quiet src/altera_17.0/altera_mf.v

if [ file exists altera_lnsim_ver ] {
    vdel -lib altera_lnsim_ver -all
}
vlib altera_lnsim_ver
vlog  -sv -work altera_lnsim_ver -quiet src/altera_17.0/altera_lnsim_for_vhdl.sv

if [ file exists fiftyfivenm_ver ] {
    vdel -lib fiftyfivenm_ver -all
}
vlib fiftyfivenm_ver
vlog  -work fiftyfivenm_ver -quiet src/altera_17.0/fiftyfivenm_atoms_for_vhdl.v
vlog  -work fiftyfivenm_ver -quiet src/altera_17.0/fiftyfivenm_atoms_ncrypt.v
