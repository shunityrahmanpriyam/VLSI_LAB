LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY FULL_ADDER_TEST_BENCH IS
END FULL_ADDER_TEST_BENCH;

ARCHITECTURE behavior OF FULL_ADDER_TEST_BENCH IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT FULL_ADDER
    PORT(
         A    : IN  std_logic;
         B    : IN  std_logic;
         Cin  : IN  std_logic;
         Sum  : OUT std_logic;
         Cout : OUT std_logic
        );
    END COMPONENT;

    -- Inputs (initialized to '0')
    signal A   : std_logic := '0';
    signal B   : std_logic := '0';
    signal Cin : std_logic := '0';

    -- Outputs
    signal Sum  : std_logic;
    signal Cout : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: FULL_ADDER PORT MAP (
          A    => A,
          B    => B,
          Cin  => Cin,
          Sum  => Sum,
          Cout => Cout
        );

    -- Stimulus process
    stim_proc: process
    begin		
        -- Initial reset / hold state
        wait for 100 ns;	

        -- Test Case 1: 0 + 0 + 0 = 0 (Sum = 0, Cout = 0)
        A <= '0'; B <= '0'; Cin <= '0';
        wait for 20 ns;

        -- Test Case 2: 0 + 0 + 1 = 1 (Sum = 1, Cout = 0)
        A <= '0'; B <= '0'; Cin <= '1';
        wait for 20 ns;

        -- Test Case 3: 0 + 1 + 0 = 1 (Sum = 1, Cout = 0)
        A <= '0'; B <= '1'; Cin <= '0';
        wait for 20 ns;

        -- Test Case 4: 0 + 1 + 1 = 2 (Sum = 0, Cout = 1)
        A <= '0'; B <= '1'; Cin <= '1';
        wait for 20 ns;

        -- Test Case 5: 1 + 0 + 0 = 1 (Sum = 1, Cout = 0)
        A <= '1'; B <= '0'; Cin <= '0';
        wait for 20 ns;

        -- Test Case 6: 1 + 0 + 1 = 2 (Sum = 0, Cout = 1)
        A <= '1'; B <= '0'; Cin <= '1';
        wait for 20 ns;

        -- Test Case 7: 1 + 1 + 0 = 2 (Sum = 0, Cout = 1)
        A <= '1'; B <= '1'; Cin <= '0';
        wait for 20 ns;

        -- Test Case 8: 1 + 1 + 1 = 3 (Sum = 1, Cout = 1)
        A <= '1'; B <= '1'; Cin <= '1';
        wait for 20 ns;

        -- End simulation
        wait;
    end process;

END behavior;