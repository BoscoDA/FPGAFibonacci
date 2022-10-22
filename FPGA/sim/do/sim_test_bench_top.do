# Now run the simulation
#

vsim -gui -Gfor_sim=true -voptargs=+acc=npr -t ps test_bench_top_lib.test_bench_top
do wave.do
log * -r
run 2000 us
