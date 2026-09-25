LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY HALF_ADDER_TEST_BENCH IS
END HALF_ADDER_TEST_BENCH;

ARCHITECTURE behavior OF HALF_ADDER_TEST_BENCH IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT HALF_ADDER
    PORT(
         A     : IN  std_logic;
         B     : IN  std_logic;
         Sum   : OUT std_logic;
         Carry : OUT std_logic
        );
    END COMPONENT;

    -- Inputs (initialized to '0')
    signal A : std_logic := '0';
    signal B : std_logic := '0';

    -- Outputs
    signal Sum   : std_logic;
    signal Carry : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: HALF_ADDER PORT MAP (
          A     => A,
          B     => B,
          Sum   => Sum,
          Carry => Carry
        );

    -- Stimulus process
    stim_proc: process
    begin		
        -- Initial reset / hold state
        wait for 100 ns;	

        -- Test Case 1: 0 + 0 = 0 (Sum = 0, Carry = 0)
        A <= '0'; B <= '0';
        wait for 20 ns;

        -- Test Case 2: 0 + 1 = 1 (Sum = 1, Carry = 0)
        A <= '0'; B <= '1';
        wait for 20 ns;

        -- Test Case 3: 1 + 0 = 1 (Sum = 1, Carry = 0)
        A <= '1'; B <= '0';
        wait for 20 ns;

        -- Test Case 4: 1 + 1 = 2 (Sum = 0, Carry = 1)
        A <= '1'; B <= '1';
        wait for 20 ns;

        -- End simulation
        wait;
    end process;

END behavior;