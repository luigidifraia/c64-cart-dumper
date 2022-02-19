-- Dinamic Software ($8000-$9FFF) dumping definition file
-- for the Commodore 64 Cartridge Dumper client
-- (C) 2022 Luigi Di Fraia

-- Supported titles:
--  All Dinamic Software titles

-- Bank selection circuitry uses:
--  128 KiB cartridges (all known titles): address bus bits 0-3, /IO1, and /ROML

-- As an example, "Astro Marine Corps" uses two 64 KiB 28-pin EPROM chips in a piggyback configuration:
--  - for both, /OE (Output Enable) is connected to /ROML,
--  - for both, A13 is set to the output of a 75LS175 that latches bit 0 of the address bus
--  - for both, A14 is set to the output of the same 75LS175 that latches bit 1 of the address bus
--  - for both, A15 is set to the output of the same 75LS175 that latches bit 2 of the address bus
--  - for one chip (lower 64 KiB), /CE (Chip Enable) is set to the output of the same 75LS175 that latches bit 3 of the address bus
--  - for the other chip (upper 64 KiB), /CE is connected to the inverted output of the same 75LS175 that latches bit 3 of the address bus
--  - latching occurs when /IO1 is asserted (i.e. the value on the address bus is in range $DE00-$DEFF) and PHI2 is asserted

-- Calculate the number of 8 KiB banks to dump
local banks = size_kb / 8
local b = 0

-- Mapping is at $8000-$9FFF for all banks
assert_roml()
deassert_romh()

while b < banks do
  io_load(0xDE00 + b)

  dump_chip()

  b = b + 1
end
