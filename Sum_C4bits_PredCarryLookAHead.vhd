----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:15:37 06/10/2018 
-- Design Name: 
-- Module Name:    Sum_C4bits_PredCarryLookAHead - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sum_C4bits_PredCarryLookAHead is

	port(
	g, p: in std_logic_vector(3 downto 0);
	c_0: in std_logic;
	c   : out std_logic_vector(4 downto 1));
	
end Sum_C4bits_PredCarryLookAHead;

architecture Behavioral of Sum_C4bits_PredCarryLookAHead is

begin
	
	c(1) <= g(0) or (p(0) and c_0);
	c(2) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and c_0);
	c(3) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and c_0);
	c(4) <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0))
				or (p(3) and p(2) and p(1) and p(0) and c_0);

end Behavioral;

