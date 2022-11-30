library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity edge_det is

  port (
    clk, n_rst : in  std_logic;
    inp        : in  std_logic;
    det_edge   : out std_logic);

end entity edge_det;

architecture edge_det_arch of edge_det is
  --signal reg_q : std_logic;
  type state_type is (s0, s1);
  signal current_state, next_state : state_type;
begin  -- architecture edge_det_arch
  reg : process (clk, n_rst) is
  begin
    if n_rst = '0' then
      current_state <= s0;
    elsif rising_edge(clk) then
      current_state <= next_state;
    end if;
  end process reg;
  
  process (inp, current_state, n_rst)
  begin
    next_state <= current_state;
    case current_state is
        when s0 =>
            if inp = '0' then
                det_edge <= '0';
            elsif n_rst = '1' then
                next_state <= s1;
                det_edge <= '1';
            else 
                next_state <= s0;
                det_edge <= '0';
            end if;
        when s1 =>
            if inp = '0' then
                next_state <= s0;
                det_edge <= '0';
            else
                det_edge <= '0';
            end if;
    end case;
  end process;
end architecture edge_det_arch;
