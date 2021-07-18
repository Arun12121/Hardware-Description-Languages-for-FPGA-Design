library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity FIFO8x9 is 
  port(
    clk, rst : in std_logic;
    RdPtrClr, WrPtrClr: in std_logic;
    RdInc, WrInc: in std_logic;
    DataIn : in std_logic_vector(8 downto 0);
    DataOut : out std_logic_vector(8 downto 0);
    rden, wren : in std_logic);
end entity FIFO8x9;

architecture Arch_FIFO8x9 of FIFO8x9 is 
  type fifo_array is array(7 downto 0) of std_logic_vector(8 downto 0);
  signal fifo : fifo_array := (others => (others => '0'));
  signal wrptr, rdptr : unsigned(2 downto 0);
  signal en : std_logic_vector(7 downto 0);
  signal dmxout : std_logic_vector(8 downto 0);

begin
data_write: process(clk,rst)
begin
	if rst = '1' then
		for I in 0 to 7 loop
			fifo(I) <= (others => '0');
		end loop;
		wrptr <= (others => '0');
		rdptr <= (others => '0');
	elsif rising_edge(clk) then
		if wren = '1' then
			fifo(to_integer(wrptr)) <= DataIn;
		end if;
		if WrPtrClr = '1' then
			wrptr <= (others => '0');
		elsif WrInc = '1' then
			wrptr <= wrptr + 1;
		end if;
		if RdPtrClr = '1' then
			rdptr <= (others => '0');
		elsif RdInc = '1' then
			rdptr <= rdptr + 1;
		end if;
	end if;
end process;
data_read: process(rden, rdptr)
begin
	if rden = '1' then
		DataOut <= fifo(to_integer(rdptr));
	else
		DataOut <= (others => 'Z');
	end if;
end process;

end architecture Arch_FIFO8x9;

