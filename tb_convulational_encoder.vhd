library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_convolutional_encoder is

end tb_convolutional_encoder;

architecture Behavioral of tb_convolutional_encoder is

    component convolutional_encoder
        Port ( 
            clk     : in STD_LOGIC;
            clr     : in STD_LOGIC; 
            data_in : in STD_LOGIC;
            C1      : out STD_LOGIC;
            C2      : out STD_LOGIC;
            C3      : out STD_LOGIC
        );
    end component;

    signal clk     : STD_LOGIC := '0';
    signal clr     : STD_LOGIC := '0';
    signal data_in : STD_LOGIC := '0';
    
    signal C1      : STD_LOGIC;
    signal C2      : STD_LOGIC;
    signal C3      : STD_LOGIC;

    constant clk_period : time := 10 ns;

begin

    uut: convolutional_encoder PORT MAP (
        clk => clk,
        clr => clr,
        data_in => data_in,
        C1 => C1,
        C2 => C2,
        C3 => C3
    );

    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2; 
        clk <= '1';
        wait for clk_period/2; 
    end process;

   
    stim_proc: process
    begin		
        clr <= '1';
        data_in <= '0';
        wait for 20 ns;	
        clr <= '0';
        wait for clk_period; 

        data_in <= '1'; wait for clk_period; -- S8
        data_in <= '1'; wait for clk_period; -- S12
        data_in <= '1'; wait for clk_period; -- S14
        data_in <= '1'; wait for clk_period; -- S15 
        data_in <= '0'; wait for clk_period; -- S7
        data_in <= '0'; wait for clk_period; -- S3
        data_in <= '0'; wait for clk_period; -- S1
        data_in <= '0'; wait for clk_period; -- S0
        data_in <= '1'; wait for clk_period; -- S8
        data_in <= '0'; wait for clk_period; -- S4
        data_in <= '1'; wait for clk_period; -- S10
        data_in <= '1'; wait for clk_period; -- S13
        data_in <= '0'; wait for clk_period; -- S6
        data_in <= '1'; wait for clk_period; -- S11
        data_in <= '0'; wait for clk_period; -- S5
        data_in <= '1'; wait for clk_period; -- S10
        data_in <= '0'; wait for clk_period; -- S5
        data_in <= '0'; wait for clk_period; -- S2
        data_in <= '1'; wait for clk_period; -- S9
        
        data_in <= '0'; wait for clk_period; 
        data_in <= '0'; wait for clk_period; 
        data_in <= '0'; wait for clk_period; 

        wait;
    end process;

end Behavioral;