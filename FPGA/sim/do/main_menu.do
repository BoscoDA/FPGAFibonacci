alias q     "quit -f"
alias 1     "do do/compile_altera_libs_17_0.do; h"
alias 2     "do do/compile_test_bench.do; h"
alias 3     "do do/compile_fpga.do; h"
alias 4     "do do/compile_all.do; h"
alias c     "do do/clean.do; h"
alias r     "do do/restart.do; h"
alias rn    "echo test_bench_top simulation...; do do/sim_test_bench_top.do"
alias h     "
echo {
Main Menu:
    1  - compile Altera libraries
    2  - compile test bench only
    3  - compile fpga only
    4  - compile all
    c  - clean (remove) all compiled libraries
    r  - restart
    rn - run
    q  - quit
    h  - help (print this menu)
}
"
h
