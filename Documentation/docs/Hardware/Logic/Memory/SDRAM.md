# SDRAM
The SDRAM is used as the main memory for the FPGC. It has a size of 32MiB. Since it is SDRAM, it requires a controller that handles all access and refreshes. The MU contains such controller to interface with the SDRAM. During initialization, the chip is set to a CAS latency of 2 and a programmable burst length of 2 (since we have 32 bit words, and the chip uses 16 bit data). The controller also handles refreshes. To reduce the amount of latency, the MU sets its busy flag low right after the read data is available or the written data is sent to the SDRAM chip. This way the CPU does not have to wait for row closing operations to be performed. If the MU gets a request from the CPU to read from or write to SDRAM, while the SDRAM controller is busy (for example with a refresh or row closing operations), then the MU will wait until the SDRAM controller is ready. While the SDRAM chip uses 16 bit addresses internally, the controller is addressed by 32 bit words. The data of the SDRAM at power up is undefined, but probably zero. Note that during a reset (soft or hard) of the FPGC, the contents of the SDRAM will stay. To clear the contents of the SDRAM, you can either write all addresses with zeros, or power down the FPGC for several seconds.

## SDRAM controller implementation
The current SDRAM controller implementation is very basic, and uses a burst of 2 to read/write a 32bit word, after which it shuts down and returns to idle. Because of the huge memory bottleneck of the FPGC, there is a lot to gain here by creating a more complex controller. This will be attempted after upgrading to the Cyclone V board with double the SDRAM bandwidth and capacity. So for now no detailed description of the currently used SDRAM controller.

## Simulation
I also added a simulation model of the SDRAM to the project. The currently used SDRAM chip is the Winbond W9825G6KH-6 (an older revision of the FPGA development board uses the Micron MT48LC16M16A2 chip. I originally started with this chip and it also works. The Verilog SDRAM simulation model is a model of the Micron chip).