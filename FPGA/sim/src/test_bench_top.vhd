library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- packages
library fpga_top_lib;

entity test_bench_top is
end test_bench_top;

architecture behave of test_bench_top is

    signal tb_clk_20m           : std_logic := '0';
    signal tb_fpga_async_in_1_n : std_logic := '1';
    signal tb_fpga_async_in_2   : std_logic := '0';
    signal tb_led_1_red_n       : std_logic;
    signal tb_led_1_grn_n       : std_logic;
    signal tb_led_2_red_n       : std_logic;
    signal tb_led_2_grn_n       : std_logic;

begin

    -- fpga input clock
    clk_proc: process
    begin
        wait for 25 ns;
        tb_clk_20m  <= not tb_clk_20m;
    end process;

    async_in_1_n_stim_proc: process
    begin
        wait for 200001 ns;
        tb_fpga_async_in_1_n    <= '0';
        wait for 1350 us;
        tb_fpga_async_in_1_n    <= '1';
        wait for 650 us;

    end process;

    async_in_2_stim_proc: process
    begin
    wait for 200001 ns;
        tb_fpga_async_in_2    <= '1';
        wait for 800 us;
        tb_fpga_async_in_2    <= '0';
        wait for 200 us;
        tb_fpga_async_in_2    <= '1';
        wait for 350 us;
        tb_fpga_async_in_2    <= '0';
        wait for 650 us;
    end process;

    -- instantiate fpga
    fpga_top_inst: entity fpga_top_lib.fpga_top
    port map(
        --input
        clk_osc_20_meg      => tb_clk_20m,              --: in std_logic;
        fpga_async_in_1_n   => tb_fpga_async_in_1_n,    --: in std_logic;
        fpga_async_in_2     => tb_fpga_async_in_2,      --: in std_logic;
        --output
        led_1_red_n         => tb_led_1_red_n,          --: out std_logic;
        led_1_grn_n         => tb_led_1_grn_n,          --: out std_logic;
        led_2_red_n         => tb_led_2_red_n,          --: out std_logic;
        led_2_grn_n         => tb_led_2_grn_n           --: out std_logic
        );

end behave;
