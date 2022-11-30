----------------------------------------------------------------------------------
-- Namn:        registerblock
-- Filnamn:     registerblock.vhd
-- Testbench:   registerblock_tb.vhd
--
-- Insignaler:
--      clk     - klocksignal, all uppdatering av register sker vid stigande flank
--      n_rst   - synkron resetsignal, aktiv låg
--      F       - resultatet från ALU
--      DEST    - bestämmer vilket av registerna R0 och R1 som ska vara aktivt
--      RegEna  - laddsignal till det aktiva registret
--
-- Utsignaler:
--      RegOut  - det aktiva registrets innehåll
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.all;
use work.cpu_pkg.all;

entity registerblock is
    port(
        clk : in std_logic;
        n_rst : in std_logic;
        F : in std_logic_vector(7 downto 0);
        DEST : in std_logic;
        RegEna : in std_logic;
        RegOut : out std_logic_vector(7 downto 0)
    );
end entity;

architecture structural of registerblock is
    signal ena0 : std_logic;
    signal ena1 : std_logic;
    signal Q0 : std_logic_vector(7 downto 0);
    signal Q1 : std_logic_vector(7 downto 0);
    signal output : std_logic_vector(7 downto 0);

begin
    ena0 <= RegEna and not DEST;
        r0 : entity REG8 port map(
        CLK => clk,
        CLR => n_rst,
        ENA => ena0,
        D => F,
        Q => Q0 
    );
    
    ena1 <= RegEna and DEST;
    r1 : entity REG8 port map(
        CLK => clk,
        CLR => n_rst,
        ENA => ena1,
        D => F,
        Q => Q1 
    );
    
    RegOut <= output;
    mux : entity MUX2x8 port map(
        IN0 => Q0,
        IN1 => Q1,
        SEL => DEST,
        O => output
    );
end architecture;