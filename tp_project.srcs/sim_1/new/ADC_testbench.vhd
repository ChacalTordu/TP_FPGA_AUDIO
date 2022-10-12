----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.09.2022 14:04:22
-- Design Name: 
-- Module Name: ADC_testbench - Behavioral
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



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADC_testbench is
--  Port ( );
end ADC_testbench;

architecture Behavioral of ADC_testbench is

component ADC is
port(   RESET: in std_logic;
		ADC_SCLK: in std_logic;
		ADC_LRCK: in std_logic;
		SDATA : in integer;
		ADC_SDOUT: out std_logic_VECTOR(23 downto 0));
end component;

    CONSTANT T_MCLK : TIME := 80 ns;
    CONSTANT T_SCLK : TIME := 320 ns;
    CONSTANT T_LRCK : TIME := 20.48 us;
    constant FILE_IN : string := "\ADC_input.txt";

    signal ADC_SCLK : std_logic :='0';
    signal RESET : std_logic:='0';
    
    signal SDATA : integer;
    signal ADC_MCLK : std_logic :='0';
    signal ADC_LRCK : std_logic :='0';
    signal INTER_SDATA : std_logic_vector(23 downto 0);

begin

    reset_process : process
    BEGIN
        ADC_SCLK <= '0';
        wait for T_SCLK/2;
        ADC_SCLK <= '1';
        wait for T_SCLK/2;
    END PROCESS;
    
    clock_process : process
        BEGIN
        RESET <= '0';
        wait for 100ns;
        RESET <= '1';
        wait for 500ns;
    END PROCESS;
    
    ADC_LRCK_process : process
    BEGIN
        ADC_LRCK <= '0';
        wait for T_LRCK;
        ADC_LRCK <= '1';
        wait for T_LRCK;
    END PROCESS;
    
    ADC_MCLK_process : process
    BEGIN
        ADC_MCLK <= '0';
        wait for T_MCLK;
        ADC_MCLK <= '1';
        wait for T_MCLK;
    END PROCESS;
    

    reading_file : process
        file stimuli_file : text open read_mode is FILE_in;
        variable Line_in : line;
        variable data : integer;
        begin
        --hold reset state for 100ns
        wait for 100 ns;
        wait for T_SCLK*10;
            while ((not endfile(stimuli_file))) loop
                wait until rising_edge(ADC_SCLK);
                readline(stimuli_file, Line_in);
                read(Line_in,data);
                INTER_SDATA <= std_logic_vector(to_unsigned(data,INTER_SDATA'length));
            end loop;
        file_close(stimuli_file);
    end process;
    
    dataout_process: process -- écriture des valeurs de sortie du filtre
        
        file ofile : text open write_mode is "\dataout.txt";
        variable Line_out : line;
        variable data_out : std_logic_vector(17 downto 0);
        
        begin
        --hold reset state for 100ns
        wait for 100 ns;
        wait for T_SCLK*10;
            while (true) loop
                wait until falling_edge(ADC_SCLK);
                data_out := INTER_SDATA;
                write(Line_out,data_out);
                writeline(ofile, Line_out);
            end loop;
            file_close(ofile);
end process;
   
   instance_ADC : ADC port map(
        RESET=>RESET,
		ADC_SCLK=>ADC_SCLK,
		ADC_LRCK=>ADC_LRCK,
		SDATA=>SDATA,
		ADC_SDOUT=>INTER_SDATA
   );
   
end Behavioral;
