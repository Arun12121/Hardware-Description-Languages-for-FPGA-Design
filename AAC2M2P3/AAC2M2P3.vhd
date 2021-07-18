library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;

architecture FSM_arch of FSM is
signal current_state: std_logic_vector(1 downto 0);
begin Finite_state_machine : process(CLK, RST)
	begin
	if RST = '1' then
		current_state <= "00";
		Out1 <= '0';
	end if;
	if current_state = "10" then --B
		Out1 <= '1';
	else
		Out1 <= '0';
	end if;
	if(rising_edge(CLK)) then
		case current_state is
		when "00" => --A
			if In1 = '1' then
				current_state <= "01";
			end if;
		when "01" => --B
			if In1 = '0' then
				current_state <= "10";
			end if;
		when "10" => --C
			if In1 = '1' then
				current_state <= "00";
			end if;
		when others =>
			current_state <= "00";
		end case;
	end if;
	end process;
end architecture;
