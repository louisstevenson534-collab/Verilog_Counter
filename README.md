# Verilog_Counter
A counter written in Verilog that counts to a defined terminal_count

The counter uses the last 4 bits of terminal_count input (inclusing the lsb) to count a ones place.
Once the those 4 bits reach a decimal 9, the counter flips the last 4 bits of the terminal_count input (including the msb) to create the tens place.
The terminal_count is instantiated two different times in the test bench in order to achieve this flip from the ones to tens place.
