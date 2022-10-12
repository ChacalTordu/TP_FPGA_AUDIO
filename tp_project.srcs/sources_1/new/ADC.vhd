----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.09.2022 14:34:13
-- Design Name: 
-- Module Name: ADC - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity ADC is
port(   RESET: in std_logic;
		ADC_SCLK: in std_logic;
		ADC_LRCK: in std_logic;
		SDATA : in integer;
		ADC_SDOUT: out std_logic_VECTOR(23 downto 0));
end ADC;

architecture Behavioral of ADC is
signal INTER_SDATA : std_logic_vector(23 downto 0);
begin
    process
        begin
        INTER_SDATA <= std_logic_vector(to_unsigned(SDATA,ADC_SDOUT'length));
        if RESET = '0' then
            ADC_SDOUT(23 downto 0) <= (others=>'0');
        end if;
        wait until falling_edge(ADC_LRCK);
        wait until falling_edge(ADC_SCLK);
                for i in 24 downto 0 loop
                    ADC_SDOUT(i) <= INTER_SDATA(i);
                    wait for 10ns;
                    wait until rising_edge(ADC_SCLK);
                    wait for 40ns;
                end loop;
        wait until rising_edge(ADC_LRCK);
        wait until falling_edge(ADC_SCLK);
                for i in 24 downto 0 loop
                    ADC_SDOUT(i) <= INTER_SDATA(i);
                    wait for 10ns;
                    wait until rising_edge(ADC_SCLK);
                    wait for 40ns;
                end loop;
    end process;
end Behavioral;
