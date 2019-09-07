LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY teste IS
END teste;
 
ARCHITECTURE behavior OF teste IS 

    COMPONENT rigistrador
    PORT(
         CLK : IN  std_logic;
         CLK_EN : IN  std_logic;
         CLR : IN  std_logic;
         D_IN : IN  std_logic_vector(3 downto 0);
         Q_OUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal CLK_EN : std_logic := '0';
   signal CLR : std_logic := '0';
   signal D_IN : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Q_OUT : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rigistrador PORT MAP (
          CLK => CLK,
          CLK_EN => CLK_EN,
          CLR => CLR,
          D_IN => D_IN,
          Q_OUT => Q_OUT
        );

	D_IN <= "1000";

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
	
	CLR_process :process
   begin
		CLR <= '0';
		wait for 35 ns;
		CLR <= '1';
		wait for 35 ns;
   end process;
	
	CLK_EN_process :process
   begin
		CLK_EN <= '1';
		wait for 35 ns;
		CLK_EN <= '0';
		wait for 35 ns;
   end process;

END;
