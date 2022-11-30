----------------------------------------------------------------------------------
-- Namn:        berakningsenhet
-- Filnamn:     berakningsenhet.vhd
-- Testbench:   berakningsenhet_tb.vhd
--
-- Insignaler:
--      clk     - klocksignal, all uppdatering av register sker vid stigande flank
--      n_rst   - synkron resetsignal, aktiv l�g
--      DATA    - data fr�n instruktionen
--      INPUT   - insignalen JA synkroniserad i IO-blocket
--      DEST    - v�ljer om R0 eller R1 i registerblocket ska vara aktivt
--      ALUsrc  - v�ljer om det asktiva registret eller insignalen JA fr�n IO-blocket 
--                ska anv�ndas som operand till ALU
--      ALUop   - styr vilken operation ALu ska utf�ra
--      RegEna  - laddsignal till registerblocket, h�gt v�rde medf�r att det aktiva 
--                registret ska uppdateras med resultatet fr�n ALU
--
-- Utsignaler:
--      OUTPUT - data som ska skrivs till signalen JB
--      Z      - zero-flagga, h�g om resultet fr�n ALU �r noll
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.all;
use work.cpu_pkg.all;


entity berakningsenhet is
    port(
        clk, n_rst : in std_logic;
        DATA : in std_logic_vector(7 downto 0);
        INPUT : in std_logic_vector(7 downto 0);
        DEST : in std_logic;
        ALUSrc : in std_logic;
        ALUOp : in std_logic_vector(2 downto 0);
        RegEna : in std_logic;
        OUTPUT : out std_logic_vector(7 downto 0);
        Z : out std_logic
    );
end entity;

architecture structural of berakningsenhet is
    signal ena0 : std_logic;
    signal ena1 : std_logic;
    signal Q0 : std_logic_vector(7 downto 0);
    signal Q1 : std_logic_vector(7 downto 0);
    signal regOut : std_logic_vector(7 downto 0);
    signal f_sig : std_logic_vector(7 downto 0);
    signal B : std_logic_vector(7 downto 0);
begin
    regblock : entity registerblock port map (
        RegEna => RegEna,
        DEST => DEST,
        F => f_sig,
        clk => clk,
        n_rst => n_rst,
        RegOut => regOut
    );
    
    mux : entity MUX2x8 port map(
        IN0 => regOut,
        IN1 => INPUT,
        SEL => ALUSrc,
        O => B
    );
    
    alu : entity ALU8 port map(
        A => DATA,
        B => B,
        S => ALUOp,
        Z => Z,
        F => f_sig    
    );
    
    OUTPUT <= f_sig;
end architecture;