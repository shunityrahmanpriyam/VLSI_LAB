LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY OR_GATE_TEST_BENCH IS
END OR_GATE_TEST_BENCH;

ARCHITECTURE behavior OF OR_GATE_TEST_BENCH IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT OR_GATE
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Y : OUT std_logic
        );
    END COMPONENT;

    -- Inputs (initialized to '0')
    signal A : std_logic := '0';
    signal B : std_logic := '0';

    -- Outputs
    signal Y : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: OR_GATE PORT MAP (
          A => A,
          B => B,
          Y => Y
        );

    -- Stimulus process
    stim_proc: process
    begin		
        -- Initial reset / hold state
        wait for 100 ns;	

        -- Test Case 1: A = 0, B = 0 -> Expected Y = 0
        A <= '0'; B <= '0';
        wait for 20 ns;

        -- Test Case 2: A = 0, B = 1 -> Expected Y = 1
        A <= '0'; B <= '1';
        wait for 20 ns;

        -- Test Case 3: A = 1, B = 0 -> Expected Y = 1
        A <= '1'; B <= '0';
        wait for 20 ns;

        -- Test Case 4: A = 1, B = 1 -> Expected Y = 1
        A <= '1'; B <= '1';
        wait for 20 ns;

        -- End simulation
        wait;
    end process;

END behavior;