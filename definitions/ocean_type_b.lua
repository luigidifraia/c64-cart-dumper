-- Ocean Software Type B ($8000-$9FFF) dumping definition file
-- for the Commodore 64 Cartridge Dumper client
-- (C) 2019-2022 Luigi Di Fraia

-- Supported titles:
--  All Ocean Software titles, excluding "Robocop 2" and "Shadow of the Beast"

-- Bank selection circuitry uses:
--  128 KiB cartridges (all known titles):     data bus bits 0-3, /IO1, and /ROML (one 128 KiB chip)
--  256 KiB cartridges (just "Chase H.Q. II"): data bus bits 0-4, /IO1, and /ROML (one 256 KiB chip)
--  512 KiB cartridges (just "Terminator 2"):  data bus bits 0-5, /IO1, and /ROML (one 512 KiB chip)

-- As an example, "Navy Seals" uses a single 128 KiB 28-pin mask ROM chip (A16 on pin 22, rather than the /OE signal):
--  - /CE (Chip Enable) is connected to /ROML,
--  - A13 is set to the output of a 75LS273 that latches bit 0 of the data bus
--  - A14 is set to the output of the same 75LS273 that latches bit 1 of the data bus
--  - A15 is set to the output of the same 75LS273 that latches bit 2 of the data bus
--  - A16 is set to the output of the same 75LS273 that latches bit 3 of the data bus
--  - latching occurs when /IO1 is asserted (i.e. the value on the address bus is in range $DE00-$DEFF)

-- Calculate the number of 8 KiB banks to dump
local banks = size_kb / 8
local b = 0

-- Mapping is at $8000-$9FFF for all banks
assert_roml()
deassert_romh()

while b < banks do
  io_store(0xDE00, b)

  dump_chip()

  b = b + 1
end
