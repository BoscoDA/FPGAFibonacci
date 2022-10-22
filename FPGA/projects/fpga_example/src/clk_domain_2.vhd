library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--packages
use work.state_machine_pkg.all;

entity clk_domain_2 is
    port(
        --input
        clk             : in std_logic;
        rst             : in std_logic;

        --control
        state_machine_control   : in state_machine_control_record;
        --status
        state_machine_status    : out state_machine_status_record
    );

end clk_domain_2;

architecture rtl of clk_domain_2 is

    signal enable_ms                            : std_logic;
    signal enable_msh                           : std_logic;
    signal state_machine_control_int            : state_machine_control_record;
    signal start_ms                             : std_logic;
    signal start_msh                            : std_logic;

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
    enable_msh_proc: process(clk, rst)
    begin
        if (rst = '1') then
            enable_ms                           <= '0';
            enable_msh                          <= '0';
            state_machine_control_int.enable    <= c_init_state_machine_control.enable;
        elsif rising_edge(clk) then
            enable_ms                           <= state_machine_control.enable;
            enable_msh                          <= enable_ms;
            state_machine_control_int.enable    <= enable_msh;
        end if;
    end process;

    -- add msh for timer.state_machine_start
    start_msh_proc: process(clk, rst)
    begin
        if (rst = '1') then
            start_ms                            <= '0';
            start_msh                           <= '0';
            state_machine_control_int.start     <= c_init_state_machine_control.start;
        elsif rising_edge(clk) then
            start_ms                            <= state_machine_control.start;
            start_msh                           <= start_ms;
            state_machine_control_int.start     <= start_msh;
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
    state_machine_inst: entity work.state_machine_top(rtl)
    port map(
    clk                         => clk,
    rst                         => rst,
    state_machine_control       => state_machine_control_int,
    state_machine_status        => state_machine_status
    );

end rtl;
