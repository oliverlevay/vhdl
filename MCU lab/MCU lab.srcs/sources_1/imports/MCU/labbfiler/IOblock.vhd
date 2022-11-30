----------------------------------------------------------------------------------
-- Namn:        IOblock
-- Filnamn:     IOblock.vhd
-- Testbench:   *ingen*
--
-- Beskrivning:
--      Kretsen l�ser in v�rdet fr�n JA vid varje klockflank. V�rdet synkroniseras
--      i ett register vars v�rde l�sas fr�n utsignalen INPUT. 
--
--      Insignalen OUTPUT �r ansluten till ett register som styrs med signalen 
--      OutEna. D� OutEna �r h�g laddas registret med OUTPUT vid n�sta klockflank.
--      Registrets v�rde l�ses fr�n JB.
--
-- Insignaler:
--      clk     - klocksignal, all uppdatering av register sker vid stigande flank
--      n_rst   - synkron resetsignal, aktiv l�g
--      OutEna  - laddsignal till utsignalsregistret
--      JA      - data in till Nexys4, ansluts til kontakten JA p� Nexys4
--      OUTPUT  - data som ska skrivs till JB
--
-- Utsignaler:
--      JB      - data ut fr�n Nexys4, ansluts till kontakten JB p� Nexys4
--      INPUT   - JA synkroniserad
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.all;

entity IOblock is
    port(
        clk : in std_logic;
        n_rst : in std_logic;
        OutEna : in std_logic;
        JA : in std_logic_vector(7 downto 0);
        OUTPUT : in std_logic_vector(7 downto 0);
        JB : out std_logic_vector(7 downto 0);
        INPUT : out std_logic_vector(7 downto 0)
    );
end entity;

architecture structural of IOblock is

begin
    
    input_buffer_i: entity REG8 port map(
        D => JA,
        Q => INPUT,
        CLK => clk,
        CLR => n_rst,
        ENA => '1'
    );
    
    output_buffer_i: entity REG8 port map(
        D => OUTPUT,
        Q => JB,
        CLK => clk,
        CLR => n_rst,
        ENA => OutEna
    );

end architecture;