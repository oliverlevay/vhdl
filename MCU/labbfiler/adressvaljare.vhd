----------------------------------------------------------------------------------
-- Namn:        adressvaljare
-- Filnamn:     adressvaljare.vhd
-- Testbench:   adressvaljare_tb.vhd
--
-- Insignaler:
--      clk     - klocksignal, all uppdatering av register sker vid stigande flank
--      n_rst   - synkron resetsignal, aktiv l�g
--      DATA    - de 6 minst signifikanta bitarna fr�n instruktionen, anv�nds d� 
--                n�sta adress anges av instruktionen
--      AddrSrc - best�mmer varifr�n n�sta adress ska h�mtas
--      StackOp - styr stacken i adressv�ljaren
--
-- Utsignaler:
--      A           - n�sta adress
--      pc_debug    - nuvarande adress, anv�nds f�r att visa adressen p� 
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
   
begin
    
end architecture;