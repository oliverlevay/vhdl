----------------------------------------------------------------------------------
-- Namn:        adressvaljare
-- Filnamn:     adressvaljare.vhd
-- Testbench:   adressvaljare_tb.vhd
--
-- Insignaler:
--      clk     - klocksignal, all uppdatering av register sker vid stigande flank
--      n_rst   - synkron resetsignal, aktiv låg
--      DATA    - de 6 minst signifikanta bitarna från instruktionen, används då 
--                nästa adress anges av instruktionen
--      AddrSrc - bestämmer varifrån nästa adress ska hämtas
--      StackOp - styr stacken i adressväljaren
--
-- Utsignaler:
--      A           - nästa adress
--      pc_debug    - nuvarande adress, används för att visa adressen på 
--                    Nexys4 display
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.all;
use work.cpu_pkg.all;

entity adressvaljare is
    port(
        clk, n_rst : in std_logic;
        DATA : in std_logic_vector(5 downto 0);
        A : out std_logic_vector(5 downto 0);
        AddrSrc : in std_logic_vector(1 downto 0);
        StackOp : in std_logic_vector(1 downto 0);
        pc_debug : out std_logic_vector(5 downto 0)
    );
end entity;

architecture structural of adressvaljare is
   signal pc : std_logic_vector(5 downto 0);
   signal pc_eight : std_logic_vector(7 downto 0);
   signal pc_plus_one : std_logic_vector(5 downto 0);
   signal ToS : std_logic_vector(5 downto 0);
   signal A_S : std_logic_vector(5 downto 0);
   signal trash: std_logic_vector(1 downto 0);
begin
    my_stack: entity stack port map(
        D => pc_plus_one,
        clk => clk,
        n_rst => n_rst,
        StackOp => StackOp,
        ToS => ToS
    );
    
    mux: entity MUX3x6 port map(
        IN0 => pc_plus_one,
        IN1 => ToS,
        IN2 => DATA,
        SEL => AddrSrc,
        O => A_S
    );
    A <= A_S;
    
    reg: entity REG6 port map(
        CLR => n_rst,
        ENA => '1',
        D => A_S,
        CLK => clk,
        Q => pc
    );
    
    pc_eight <= "00" & pc;
    pc_debug <= pc;
    
    alu: entity ALU8 port map(
        A => "00000001",
        B => pc_eight,
        S => "010",
        F(5 downto 0) => pc_plus_one,
        F(7 downto 6) => trash,
        Z => open
    );
end architecture;