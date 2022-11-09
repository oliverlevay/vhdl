library ieee;
use ieee.std_logic_1164.all;

entity TB_flipflop is
--  Port ( );
end TB_flipflop;

architecture Behavioral of TB_flipflop is


component flipflop is
    port(
        D   : in  std_logic;
        clk : in  std_logic;
        Q   : out std_logic;
        Q_p : out std_logic
    );
end component;


constant clk_period : time := 10 ns;

signal sim_done 	: std_logic := '0';

signal s_D		: std_logic;

signal s_clk	: std_logic := '0';
signal s_Q		: std_logic;
signal s_Q_p	: std_logic;




begin

	DUT: flipflop
	port map(
		D   => s_D,
		clk => s_clk,
		Q   => s_Q,
		Q_p => s_Q_p
	);

	clk_gen: process
	begin

		if sim_done = '0' then

			wait for clk_period/2;
			s_clk <= not s_clk;

		else

			wait;

		end if;

	end process clk_gen;

	DUT_stimuli: process
	begin
		s_D <= '0';
		
		-- Short pulse, clk low
		wait for 0.5 ns;
		s_D <= '1';
		wait for 0.5 ns;
		s_D <= '0';
		wait for 0.5 ns;

		-- Two short pulses, clk high
		-- ===============================
		wait until s_clk'event and s_clk = '1';
		wait for 0.5 ns;
		s_D <= '1';
		wait for 0.5 ns;
		s_D <= '0';
		wait for 0.5 ns;
		s_D <= '1';
		wait for 0.5 ns;
		s_D <= '0';
		wait for 2 ns;
		-- ===============================

		-- 2 ns pulse during negative edge (clk)
		-- ===============================
		s_D <= '1';
		wait for 2 ns;

		s_D <= '0';
		wait until s_clk'event and s_clk = '0';
		wait for 4 ns;
		-- ===============================

		-- 3 ns pulse during positive edge (clk)
		-- ===============================
		s_D <= '1';
		wait for 3 ns;

		s_D <= '0';
		
		wait until s_clk'event and s_clk = '0';
		wait for 4 ns;
		-- ===============================

		-- 7 ns pulse start before positive edge and
		-- ends after the sequent negative edge (clk)
		-- ==========================================
		s_D <= '1';
		wait for 7 ns;
		-- ==========================================

		s_D <= '0';
		wait for clk_period;



		sim_done <= '1';
		report "Simulation done! :)" severity note;
		wait;

	end process;


end Behavioral;
