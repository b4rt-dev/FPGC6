# SPI
The SPI module allows for hardware SPI communication, removing the need for bit-banging using GPIO. The chip select pin is not part of this module and should be used by writing to a separate memory address so transferring multiple bytes per SPI transfer is possible. Most SPI modules run on 25MHz, except for the CH376T, since these cannot handle such speeds. Speed of the SPI module can be set while designing the FPGA by changing the CLKS_PER_HALF_BIT value.