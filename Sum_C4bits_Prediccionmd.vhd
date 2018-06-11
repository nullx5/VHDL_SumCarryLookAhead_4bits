----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:09:02 06/10/2018 
-- Design Name: 
-- Module Name:    Sum_C4bits_Prediccionmd - Behavioral 
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

entity Sum_C4bits_Prediccionmd is
	port(
		a_i, b_i, c_i: in std_logic;
		s_i, p_i, g_i: out std_logic);
	
end Sum_C4bits_Prediccionmd;
	
	

architecture Behavioral of Sum_C4bits_Prediccionmd is

begin
	
	s_i <= c_i xor (a_i xor b_i);
	p_i <= a_i xor b_i;
	g_i <= a_i and b_i;
	
	

end Behavioral;

