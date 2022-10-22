library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_rst_module is
    generic(
        for_sim : boolean := false
        );
    port(
        -- 20MHz domain
        clk_20m                 : in std_logic;
        -- 80MHz domain
        clk_80m                 : out std_logic;
        rst_80m                 : out std_logic;
        rst_80m_n               : out std_logic;
        -- 100MHz domain
        clk_100m                : out std_logic;
        rst_100m                : out std_logic;
        rst_100m_n              : out std_logic;
        -- pll locked
        pll_locked_debounced    : out std_logic
        );
end clk_rst_module;

architecture rtl of clk_rst_module is

    signal pll_locked           : std_logic;
    signal pll_locked_ms        : std_logic;
    signal pll_locked_msh       : std_logic;
    signal pll_locked_r1        : std_logic;
    signal lock_cnt             : integer range 0 to 4000;
    signal lock_debounce_cnt    : integer range 0 to 4000;
    signal rst_80m_n_ms         : std_logic;
    signal rst_100m_n_ms        : std_logic;
    signal clk_80m_int          : std_logic;
    signal clk_100m_int         : std_logic;

begin
    -- debounce constant for sim/syn
    lock_debounce_cnt <= 3 when (for_sim = true) else 4000;

    ----------------------------------------------------------------------
    -- pll instantiation
    ----------------------------------------------------------------------

    pll_main_inst: entity work.pll_main(SYN)
    port map(
    inclk0  => clk_20m,             --: in std_logic;
    c0      => clk_80m_int,         --: out std_logic;
    c1      => clk_100m_int,        --: out std_logic;
    locked  => pll_locked           --: out std_logic
    );

    clk_80m <= clk_80m_int;
    clk_100m <= clk_100m_int;
    ----------------------------------------------------------------------
    -- msh/debounce pll locked output
    ----------------------------------------------------------------------
    msh_and_debounce_locked_proc: process(clk_20m, pll_locked)
    begin
        if(pll_locked = '0') then
            pll_locked_ms               <= '0';
            pll_locked_msh              <= '0';
            pll_locked_r1               <= '0';
            pll_locked_debounced        <= '0';
            lock_cnt                    <= 0;
        elsif rising_edge(clk_20m)then                  -- msh locked
            pll_locked_ms               <= pll_locked;
            pll_locked_msh              <= pll_locked_ms;
            pll_locked_r1               <= pll_locked_msh;
            if (pll_locked_r1 = '0') then               -- pll not locked
                lock_cnt                <= 0;
                pll_locked_debounced    <= '0';
            elsif (lock_cnt = lock_debounce_cnt) then   -- pll locked
                pll_locked_debounced    <= '1';
            else
                lock_cnt                <= lock_cnt + 1;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------
    -- 80MHz reset
    ----------------------------------------------------------------------
    reset_80m_proc: process(pll_locked_debounced, clk_80m)
        begin

            if(pll_locked_debounced = '0') then
                rst_80m_n_ms    <= '0';
                rst_80m_n       <= '0';
            elsif rising_edge(clk_80m_int) then
                rst_80m_n_ms    <= '1';
                rst_80m_n       <= rst_80m_n_ms;
            end if;
        end process;
    rst_80m     <= not rst_80m_n;
    ----------------------------------------------------------------------
    -- 100MHz reset
    ----------------------------------------------------------------------
    reset_100m_proc: process(pll_locked_debounced, clk_100m)
        begin
            if(pll_locked_debounced = '0') then
                rst_100m_n_ms    <= '0';
                rst_100m_n       <= '0';
            elsif rising_edge(clk_100m_int) then
                rst_100m_n_ms    <= '1';
                rst_100m_n       <= rst_100m_n_ms;
            end if;
        end process;
    rst_100m <= not rst_100m_n;

end rtl;
