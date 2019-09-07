library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rigistrador is
		port(CLK,CLK_EN,CLR: in std_logic;
			  D_IN : in std_logic_vector(3 downto 0);
			  Q_OUT : out std_logic_vector(3 downto 0));		
end rigistrador;

architecture Behavioral of rigistrador is

begin

	process(CLK)
	begin
		if CLK' event and CLK='1' then
			if CLR = '1' then
				Q_OUT <= "0000";	
			elsif CLK_EN = '1' then
				Q_OUT <= D_IN;
			end if;
		end if;
	end process;

end Behavioral;