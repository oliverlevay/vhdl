----------------------------------------------------------------------------------
-- Namn:        stack
-- Filnamn:     stack.vhd
-- Testbench:   stack_tb.vhd
--
-- Insignaler:
--      clk     - klocksignal, all uppdatering av register sker vid stigande flank
--      n_rst   - synkron resetsignal, aktiv lï¿½g
--      D       - data in till stacken
--      StackOp - styr stackens beteende
--
-- Utsignaler:
--      ToS     - vï¿½rdet av stackens ï¿½versta element
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.all;
use work.cpu_pkg.all;

entity stack is
    port(
        D : in std_logic_vector(5 downto 0);
        ToS : out std_logic_vector(5 downto 0);
        clk, n_rst : in std_logic;
        StackOp : in std_logic_vector(1 downto 0)
    );
end entity;

architecture structural of stack is
    signal QA0 : std_logic;
    signal QA1 : std_logic;
    signal QA2 : std_logic;
    signal QA3 : std_logic;
    signal QA4 : std_logic;
    signal QA5 : std_logic; 
begin
    -- Tips: för att instansiera en komponent anvï¿½nds fï¿½ljande syntax
    sr4_0: entity SR4 port map(
        CLR => n_rst,
        CLK => clk,
        SR_SER => D(0),
        SL_SER => '0',
        S1 => StackOp(1),
        S0 => StackOp(0),
        QA => QA0
    );
     
    sr4_1: entity SR4 port map(
        CLR => n_rst,
        CLK => clk,
        SR_SER => D(1),
        SL_SER => '0',
        S1 => StackOp(1),
        S0 => StackOp(0),
        QA => QA1
    );
      
    sr4_2: entity SR4 port map(
        CLR => n_rst,
        CLK => clk,
        SR_SER => D(2),
        SL_SER => '0',
        S1 => StackOp(1),
        S0 => StackOp(0),
        QA => QA2
    );

    sr4_3: entity SR4 port map(
        CLR => n_rst,
        CLK => clk,
        SR_SER => D(3),
        SL_SER => '0',
        S1 => StackOp(1),
        S0 => StackOp(0),
        QA => QA3
    );

    sr4_4: entity SR4 port map(
        CLR => n_rst,
        CLK => clk,
        SR_SER => D(4),
        SL_SER => '0',
        S1 => StackOp(1),
        S0 => StackOp(0),
        QA => QA4
    );

    sr4_5: entity SR4 port map(
        CLR => n_rst,
        CLK => clk,
        SR_SER => D(5),
        SL_SER => '0',
        S1 => StackOp(1),
        S0 => StackOp(0),
        QA => QA5
    );
    ToS <= QA5 & QA4 & QA3 & QA2 & QA1 & QA0;
end architecture;