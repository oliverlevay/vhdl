library ieee;
use ieee.std_logic_1164.all;

entity TB_control is
--  Port ( );
end TB_control;

architecture Behavioral of TB_control is

    component control is
        port(
            clk : in  std_logic;
            phi1 : out std_logic;
            phi2 : out std_logic
        );
    end component;

signal s_clk : std_logic := '0';
signal s_phi1 : std_logic;
signal s_phi2 : std_logic;



begin


    DUT_control: control
    port map(
        clk => s_clk,
        phi1 => s_phi1,
        phi2 => s_phi2
    );


    DUT_stimuli: process
    begin

    s_clk <= not s_clk;
    wait for 10 us;

    s_clk <= not s_clk;
    wait for 10 us;

    s_clk <= not s_clk;
    wait for 10 us;

    s_clk <= not s_clk;
    wait for 10 us;

    wait;

    end process;


end Behavioral;
