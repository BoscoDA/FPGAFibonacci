echo "compiling test bench..."

# ***************************************************
# delete the old library and re-create it on every compile
# to prevent "stale" library data
# ***************************************************
if [ file exists test_bench_top_lib ] {
    vdel -lib test_bench_top_lib -all
}
vlib test_bench_top_lib

# -------------------------
# -- test bench
# -------------------------
vcom -work test_bench_top_lib -2008 -quiet ./src/test_bench_top.vhd
