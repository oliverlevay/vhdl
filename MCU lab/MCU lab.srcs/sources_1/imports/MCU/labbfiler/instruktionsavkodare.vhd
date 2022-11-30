----------------------------------------------------------------------------------
-- Namn:        instruktionsavkodare
-- Filnamn:     instruktionsavkodare.vhd
-- Testbench:   instruktionsavkodare_tb.vhd
--
-- Insignaler:
--      OPCODE - operationskod fr�n instruktionen
--      Z      - zero-flagga fr�n ber�kningsenhet
--
-- Utsignaler:
--      StackOp - styr stacken i adressv�ljaren
--      AddrSrc - styr varifr�n n�sta adress ska h�mtas
--      ALUOp   - best�mmer operatinen f�r ALU i ber�kningsenhet
--      ALUSrc  - v�ljer om ett register eller insignalen fr�n IO-blocket ska 
--                vara operand till ALU
--      RegEna  - laddsignal till registerblocket
--      OutEna  - laddsignal till utsignalsregistret i IO-blocket
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.all;
use work.cpu_pkg.all;

entity instruktionsavkodare is
    port(
        OPCODE : in std_logic_vector(3 downto 0);
        Z : in std_logic;
        StackOp : out std_logic_vector(1 downto 0);
        AddrSrc : out std_logic_vector(1 downto 0);
        ALUOp : out std_logic_vector(2 downto 0);
        ALUSrc : out std_logic;
        RegEna : out std_logic;
        OutEna : out std_logic
    );
end entity;

architecture behaviour of instruktionsavkodare is

begin

    process(OPCODE, Z) is
    begin
        case OPCODE is
            when OPCODE_CALL =>
                StackOp <= STACK_OP_PUSH;
                AddrSrc <= ADDR_DATA;
                OutEna <= '0';
                RegEna <= '0';    
            when OPCODE_RET =>
                StackOp <= STACK_OP_POP;
                AddrSrc <= ADDR_TOS;
                OutEna <= '0';
                RegEna <= '0';
            when OPCODE_BZ =>
                StackOp <= STACK_OP_HOLD;
                ALUOp <= "001";
                ALUSrc <= '0';
                OutEna <= '0';
                RegEna <= '0';
                if Z = '0' then
                    AddrSrc <= ADDR_PC_PLUS_ONE;
                else 
                    AddrSrc <= ADDR_DATA;
                    
            when OPCODE_B =>
                StackOp <= STACK_OP_HOLD;
                AddrSrc <= ADDR_DATA;
                OutEna <= '0';
                RegEna <= '0';
            when OPCODE_ADD =>
                StackOp <= STACK_OP_HOLD;
                AddrSrc <= ADDR_DATA;
                OutEna <= '0';
                RegEna <= '0';
            when OPCODE_SUB =>
                StackOp <= STACK_OP_HOLD;
                AddrSrc <= ADDR_DATA;
                OutEna <= '0';
                RegEna <= '0';
            when OPCODE_LD =>
                StackOp <= STACK_OP_HOLD;
                AddrSrc <= ADDR_DATA;
                OutEna <= '0';
                RegEna <= '0';
            when OPCODE_IN =>
                StackOp <= STACK_OP_HOLD;
                AddrSrc <= ADDR_DATA;
                OutEna <= '0';
                RegEna <= '0';
            when OPCODE_OUT =>
                StackOp <= STACK_OP_HOLD;
                AddrSrc <= ADDR_DATA;
                OutEna <= '0';
                RegEna <= '0';
            when OPCODE_AND =>
                StackOp <= STACK_OP_HOLD;
                AddrSrc <= ADDR_DATA;
                OutEna <= '0';
                RegEna <= '0';                                                                                                                                                                                         
        end case;
    end process;

end architecture;