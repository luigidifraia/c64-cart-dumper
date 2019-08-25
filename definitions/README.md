# Dumping definition files

This folder provides the official collection of Lua scripts for the Commodore 64 Cartridge Dumper client.

## Writing new Lua scripts

The available methods for selection banks and dumping Commodore 64 cartridges are:
 - `assert_roml()` - Sets /ROML line low
 - `assert_romh()` - Sets /ROMH line low
 - `deassert_roml()` - Sets /ROML line high
 - `deassert_romh()` - Sets /ROMH line high
 - `io_store(address, value)` - Sets IO address (0xDE00-0xDFFF) to value and pulses /IO1 or /IO2 accordingly
 - `dump_chip()` - Dumps 8kB chip contents currently enabled by /ROML, /ROMH, and /IOn