library ieee;
use ieee.std_logic_1164.all;

entity TB_mirandas_state_machine is
--  Port ( );
end TB_mirandas_state_machine;

architecture Behavioral of TB_mirandas_state_machine is

component mirandas_state_machine is
    port(
        clk     : in  std_logic;
        n_rst   : in  std_logic;
        i       : in  std_logic;
        o       : out std_logic
    );
end component;

    signal s_clk     : std_logic := '1';
    signal s_n_rst   : std_logic := '0';
    signal s_i       : std_logic := '0';
    signal s_o       : std_logic;

    signal s_vector  : std_logic_vector(0 to 19) := "01001010010010011100";

    signal sim_done     : std_logic := '0'; -- signal som används för att avsluta simuleringen
    constant clk_period : time := 100 ns;   -- Konstant för en klockperiod

    procedure bitstream(signal clk     : in  std_logic;
                        signal n_rst   : in  std_logic;
                        signal vector  : in  std_logic_vector; 
                        signal stream  : out std_logic) is 

        variable index   : integer;
		
	begin

        index := 0;

        for J in vector'range loop

            stream <= vector(index);
            wait until rising_edge(clk);
            index := index + 1;

        
        end loop;
		
	end bitstream;

begin

    ex_machina: mirandas_state_machine
    port map(
        clk     => s_clk,
        n_rst   => s_n_rst,
        i       => s_i,
        o       => s_o
    );


    clk: process
    begin
        if sim_done  = '0' then
            wait for clk_period / 2;
            s_clk <= not s_clk;     
        else
            wait;
        end if;
    end process;

    DUT_stimuli: process
    begin

    wait for 79 ns;     -- random value!

    s_n_rst <= '1';

    bitstream(s_clk,s_n_rst, s_vector, s_i);

    sim_done <= '1';
    report "Simulation of state machine done! :)" severity note; -- Skriver ut en trevlig kommentar i terminalen!
    wait;

    end process;

end Behavioral;
