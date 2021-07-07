# Dumping definition files

This folder provides the official collection of Lua scripts for the Commodore 64 Cartridge Dumper client.<br>
Lua revision 5.3.5 is Copyright (C) 1994-2019 Lua.org, PUC-Rio.

## Writing new definition files

Everybody should feel free to contribute their definition files and patches to this folder. In order to do so, existing definition files along with the information below should be a good starting point.

### Global variables

The global variables available to Lua scripts are:
 - `game` - State of the /GAME line, as read by the hardware
 - `exrom` - State of the /EXROM line, as read by the hardware
 - `size_kb` - Size in KiB of the whole EPROM (defaults to 8; use the `-s` option of the client software to override)
 - `slot` - Slot number (defaults to 0; use the `-l` option of the client software to override)

Note: The `size_kb` variable is meant to be used for same-format cartridges that use a different EPROM size, such as Ocean type B cartridges. The `slot` variable is meant to set an EF3 slot to dump.<br>
Lua scripts can use the values of `size_kb` and `slot` but are not obliged to do so. As example, [ar5.lua](ar5.lua) doesn't use the value of `size_kb` as it is designed to dump 32 KiB cartridges, which is the standard for AR 5 and 6, thus ignoring the value of `size_kb`.

### Global methods

The methods available to Lua scripts for selecting chips and banks, and dumping Commodore 64 cartridges are:
 - `assert_roml()` - Sets the /ROML line to GND
 - `assert_romh()` - Sets the /ROMH line to GND
 - `deassert_roml()` - Sets the /ROML line to VCC
 - `deassert_romh()` - Sets the /ROMH line to VCC
 - `io_store(address, value)` - Sets I/O `address` (0xDE00-0xDFFF) to `value` and pulses /IO1 or /IO2 accordingly
 - `dump_chip()` - Dumps the 8 KiB bank currently enabled by /ROML, /ROMH, /IO1, and /IO2
