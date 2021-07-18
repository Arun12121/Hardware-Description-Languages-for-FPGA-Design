LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ALU IS
PORT( Op_code : IN STD_LOGIC_VECTOR( 2 DOWNTO 0 );
A, B : IN STD_LOGIC_VECTOR( 31 DOWNTO 0 );
Y : OUT STD_LOGIC_VECTOR( 31 DOWNTO 0 ) );
END ALU;

Architecture ALU_Arch of ALU is 
Begin alu_proc : process(A,B,Op_code)
	begin
		if Op_code = "000" then Y <= A;
		elsif Op_code = "001" then Y <= A+B;
		elsif Op_code = "010" then Y <= A-B;
		elsif Op_code = "011" then Y <= A and B;
		elsif Op_code = "100" then Y <= A or B;
		elsif Op_code = "101" then Y <= A + 1;
		elsif Op_code = "110" then Y <= A - 1;
		elsif Op_code = "111" then Y <= B;
		end if;
	end process;
end ALU_Arch;
