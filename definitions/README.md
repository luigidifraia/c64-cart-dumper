# Dumping definition files

This folder provides the official collection of Lua scripts for the Commodore 64 Cartridge Dumper client.<br>
Lua revision 5.3.5 is Copyright (C) 1994-2019 Lua.org, PUC-Rio.

## Writing new definition files

The key to writing new definition files for dumping cartridges that use more than 16 KiB of ROM is to understand how the cartridge's internal hardware drives lines A13 and above of the ROM itself. In fact, A0-A12 are necessary for addressing each byte in an 8 KiB block, while A13 and above select which 8 KiB block is currently accessed.

Everybody should feel free to contribute their definition files and patches to this folder. In order to do so, existing definition files along with the information below should be a good starting point.

### Global variables

Global variables available to Lua scripts are:
 - `game` - State of the /GAME line, as read by the hardware
 - `exrom` - State of the /EXROM line, as read by the hardware
 - `size_kb` - Size in KiB of the whole ROM (defaults to 8; use the `-s` option of the client software to override)
 - `slot` - Slot number (defaults to 0; use the `-l` option of the client software to override)

Note: The `size_kb` variable is meant to be used for same-format cartridges that use a different ROM size, such as "Ocean Software Type B" cartridges. The `slot` variable is meant to set an EF3 slot to dump.  
Lua scripts can use the values of `size_kb` and `slot` but are not obliged to do so. As an example, [ar5.lua](ar5.lua) doesn't use the value of `size_kb` as it is designed to dump 32 KiB cartridges, which is the standard for AR 5 and 6.

### Global methods

The methods available to Lua scripts for selecting chips and banks, and dumping Commodore 64 cartridges are:
 - `assert_roml()` - Sets the /ROML line to GND
 - `assert_romh()` - Sets the /ROMH line to GND
 - `deassert_roml()` - Sets the /ROML line to VCC
 - `deassert_romh()` - Sets the /ROMH line to VCC
 - `io_load(address)` - Reads from I/O `address` (0xDE00-0xDFFF) and pulses /IO1 or /IO2 accordingly
 - `io_store(address, value)` - Writes `value` to I/O `address` (0xDE00-0xDFFF) and pulses /IO1 or /IO2 accordingly
 - `dump_chip()` - Dumps the 8 KiB bank currently enabled by /ROML, /ROMH, /IO1, and /IO2

## Supported bank switching schemes

### Action Replay

The bank selection circuitry uses:
- for 32 KiB cartridges (all known titles): data bus bits 3 and 4, /IO1, and /ROML

Data bus bits 3 and 4 are latched to set A13 and A14, respectively, when /IO1 is asserted.

### Dinamic Software

The bank selection circuitry uses:
- for 128 KiB cartridges (all known titles): address bus bits 0-3, /IO1, and /ROML

As an example, "Astro Marine Corps" uses two 64 KiB 28-pin EPROM chips in a piggyback configuration:
- for both, /OE (Output Enable) is connected to /ROML,
- for both, A13 is set to the output of a 75LS175 that latches bit 0 of the address bus
- for both, A14 is set to the output of the same 75LS175 that latches bit 1 of the address bus
- for both, A15 is set to the output of the same 75LS175 that latches bit 2 of the address bus
- for one chip (lower 64 KiB), /CE (Chip Enable) is set to the output of the same 75LS175 that latches bit 3 of the address bus
- for the other chip (upper 64 KiB), /CE is connected to the inverted output of the same 75LS175 that latches bit 3 of the address bus
- latching occurs when /IO1 is asserted (i.e. the value on the address bus is in range $DE00-$DEFF) and PHI2 is asserted

### Ocean Software Type A

The bank selection circuitry uses:
- for 256 KiB cartridges (all known titles): data bus bits 0-3, /IO1, /ROML, and /ROMH (two 128 KiB chips)

As an example, "Robocop 2" uses two 128 KiB 28-pin mask ROM chips:
- for both, A13 is set to the output of a 75LS273 that latches bit 0 of the data bus
- for both, A14 is set to the output of the same 75LS273 that latches bit 1 of the data bus
- for both, A15 is set to the output of the same 75LS273 that latches bit 2 of the data bus
- for both, A16 is set to the output of the same 75LS273 that latches bit 3 of the data bus
- for one chip (lower 128 KiB), /CE (Chip Enable) is connected to /ROML
- for the other chip (upper 128 KiB), /CE is connected to /ROMH
- latching occurs when /IO1 is asserted (i.e. the value on the address bus is in range $DE00-$DEFF) and PHI2 is asserted

### Ocean Software Type B

The bank selection circuitry uses:
- for 128 KiB cartridges (all known titles):     data bus bits 0-3, /IO1, and /ROML (one 128 KiB chip)
- for 256 KiB cartridges (just "Chase H.Q. II"): data bus bits 0-4, /IO1, and /ROML (one 256 KiB chip)
- for 512 KiB cartridges (just "Terminator 2"):  data bus bits 0-5, /IO1, and /ROML (one 512 KiB chip)

As an example, "Navy Seals" uses a single 128 KiB 28-pin mask ROM chip (A16 on pin 22, rather than the /OE signal):
- /CE (Chip Enable) is connected to /ROML,
- A13 is set to the output of a 75LS273 that latches bit 0 of the data bus
- A14 is set to the output of the same 75LS273 that latches bit 1 of the data bus
- A15 is set to the output of the same 75LS273 that latches bit 2 of the data bus
- A16 is set to the output of the same 75LS273 that latches bit 3 of the data bus
- latching occurs when /IO1 is asserted (i.e. the value on the address bus is in range $DE00-$DEFF) and PHI2 is asserted

## Acknowledgements

Some of the research and reverse engineering required for supporting non-standard cartridge formats has been contributed by Richard B, who also tested the Commodore 64 Cartridge Dumper with his collection of cartridges.
