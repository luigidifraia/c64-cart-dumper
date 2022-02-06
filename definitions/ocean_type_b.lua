-- Ocean Software Type B (one memory chip) dumping definition file
-- for the Commodore 64 Cartridge Dumper client
-- (C) 2019-2022 Luigi Di Fraia

-- Supported titles:
--  All titles, excluding "Robocop 2" and "Shadow of the Beast"

-- Bank selection circuitry uses:
--  128 KiB cartridges (all known titles): bits 0-3 at $DE00 and /ROML (one 128 KiB chip with A16 on pin 22, rather than the /OE signal)
--  256 KiB cartridges (just "Chase H.Q. II"): bits 0-4 at $DE00 and /ROML (one 256 KiB chip)
--  512 KiB cartridges (just "Terminator 2"):  bits 0-5 at $DE00 and /ROML (one 512 KiB chip)

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
