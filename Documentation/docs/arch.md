# Architecture
The FPGC consists of four main parts: the CPU, GPU, MU and APU, where the APU still has to be implemented

The CPU, called the B32P, is the main part that executes all instructions. It reads from and writes to the MU.
 
The GPU, called the FSX2, is completely separate from the CPU. It contains the logic for generating a video signal and for creating an image on this signal based on the contents of VRAM. The GPU has its own read port with clock on the VRAM, since all of it is true dual port SRAM, allowing it to run on a completely different clock domain than the rest of the FPGC.

The MU, or memory unit, handles all memory access between the CPU and all the different memories used in the FPGC. These memories includes: SDRAM, SPI flash, internal ROM, 8 bit VRAM, 9 bit VRAM, 32 bit VRAM and a lot of I/O like UART and SPI ports and a PS/2 keyboard register. The MU makes use of a memory map to allow the CPU to access these memories. The goal of the MU is to have the CPU access all memories without the CPU having to care about the type or timing of the memory, making an easy memory interface for the CPU. This is achieved using a bus protocol. However, this does cost one cycle of overhead per operation on the MU in most cases.

The APU, or audio processing unit, still has to be implemented, and will be using an I2S DAC to generate the analog audio.

Block diagram of FPGC:

``` text
                  +---------------------+
                  |                     |
                  |        B32P         |
                  |         CPU         |
                  |                     |
                  |                     |
                  +---------------------+
                             ^
                             |
                             v
+---------+       +---------------------+       +---------+       +---------+
|         |       |                     |       |         |       |         |
|  SDRAM  |<----->|                     |       |         |       |         |
|         |       |                     |       |         |       |         |
+---------+       |                     |       |         |       |  FSX2   |
                  |       Memory        |<----->|  VRAM   |<----->|   GPU   |
+---------+       |        Unit         |       |         |       |         |
|         |       |                     |       |         |       |         |
|   ROM   |<----->|                     |       |         |       |         |
|         |       |                     |       |         |       |         |
+---------+       +---------------------+       +---------+       +---------+
                        ^          ^
                        |          |
                        v          v
                    +-------+  +-------+
                    |       |  |       |
                    |  SPI  |  |  I/O  |
                    | flash |  |       |
                    |       |  +-------+
                    +-------+ 
```