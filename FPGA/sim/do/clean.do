echo "Removing all compiled libraries......"

quietly set lib_list [list \
    altera \
    altera_lnsim \
    altera_lnsim_ver \
    altera_mf \
    altera_mf_ver \
    altera_ver \
    cycloneiv_hssi \
    cycloneive \
    cyclonev \
    cyclonev_hssi \
    fiftyfivenm \
    fiftyfivenm_ver \
    lpm \
    lpm_ver \
    sgate \
    sgate_ver \
    fpga_top_lib \
    test_bench_top_lib \
]

foreach lib $lib_list {
    if {[file exists $lib]} {
        vdel -lib $lib -all
        echo "Removed $lib..."
    }
}

if {[file exists coverage]} {
    file delete -force coverage
}
