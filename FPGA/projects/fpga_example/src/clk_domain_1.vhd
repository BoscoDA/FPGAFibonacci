library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- packages
use work.timer_pkg.all;

entity clk_domain_1 is
    port(
        --input
        clk             : in std_logic;
        rst             : in std_logic;

        --control
        timer_control   : in timer_control_record;
        --status
        timer_status    : out timer_status_record
    );

end clk_domain_1;

architecture rtl of clk_domain_1 is

    signal timer_enable_ms      : std_logic;
    signal timer_enable_msh     : std_logic;
    signal timer_control_int    : timer_control_record;

begin
----------------------------------------------------------------------
-- -/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\- --
-- -\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/- --
--******************************************************************--
-- metastability hardening of input signals from different domains
--******************************************************************--
-- -/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\- --
-- -\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/- --
----------------------------------------------------------------------

    msh_proc: process(clk, rst)
    begin
        if (rst = '1') then
            timer_enable_ms     <= '0';
            timer_enable_msh    <= '0';
            timer_control_int   <= c_init_timer_control;
        elsif rising_edge(clk) then
            timer_enable_ms                 <= timer_control.timer_enable;
            timer_enable_msh                <= timer_enable_ms;
            timer_control_int.timer_enable  <= timer_enable_msh;
        end if;
    end process;

----------------------------------------------------------------------
-- -/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\- --
-- -\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/- --
--******************************************************************--
-- pulse extending output signals going to different domains
--******************************************************************--
-- -/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\- --
-- -\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/- --
----------------------------------------------------------------------

----------------------------------------------------------------------
-- -/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\- --
-- -\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/- --
--******************************************************************--
-- module instantiations below
--******************************************************************--
-- -/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\--/\- --
-- -\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/--\/- --
----------------------------------------------------------------------

    timer_inst: entity work.timer_top(rtl)
    port map(
    --input
    clk             => clk,                 -- : in std_logic;
    rst             => rst,                 -- : in std_logic;
    timer_control   => timer_control_int,   -- : in timer_control_record
    timer_status    => timer_status         -- : out timer_control_record
    );

end rtl;
