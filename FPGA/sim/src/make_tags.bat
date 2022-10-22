ECHO OFF
if exist del tags
make_vtags_win.pl .\test_bench_top.vhd
make_vtags_win.pl ..\..\projects\fpga_example\src\
make_vtags_win.pl ..\..\projects\fpga_example\mega\
