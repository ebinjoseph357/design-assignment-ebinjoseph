<img width="1127" height="408" alt="image" src="https://github.com/user-attachments/assets/dadfd68a-9dea-4a8d-844e-3c49175a7e03" />

Design and Top-Level Files :

1.design.sv: This file has the Register Transfer Level code for the APB design we are testing.

2.testbench.sv: This is the testbench module. It creates the APB design, the physical interface and the clock and reset signals. It is also where EDA Playground starts.

Verification Environment Components:

1.interface.sv: This file defines the APB protocol signals, clocking blocks and modports. These are used to connect the testbench parts to the APB design.

2.transaction.sv: This file defines what an APB transaction looks like. It has fields for the address, data and read/write control.

3.generator.sv: This part creates transactions and sends them to the driver.

4.driver.sv: The driver gets transactions from the generator. Sends them to the APB interface.

5.monitor.sv: The monitor watches the APB interface. Turns the activity into transactions. It then sends these transactions to the scoreboard.

6.scoreboard.sv: The scoreboard gets the transactions from the monitor. Checks if they are correct. It does this by comparing the expected results with the output from the APB design.

7.environment.sv: This is the container that creates and connects the generator, driver, monitor and scoreboard.

8.test.sv: This is the test case layer. It creates the environment sets up the test and starts the simulation.
