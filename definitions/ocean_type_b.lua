-- Ocean type B (single chip) dumping definition file (all Ocean cartridges excluding "Robocop 2", "Shadow of the Beast", "Space Gun")
-- for the Commodore 64 Cartridge Dumper client
-- (C) 2019 Luigi Di Fraia

-- Bank selection circuitry uses:
--  128kB cartridges (all known titles): bits 0-3 at $DE00 and ROML (single 128kB chip with A16 on pin 22, rather than the /OE signal)
--  256kB cartridges (just "Chase H.Q. II"): bits 0-4 at $DE00 and ROML (single 256kB chip)
--  512kB cartridges (just "Terminator 2"):  bits 0-5 at $DE00 and ROML (single 512kB chip)

-- Calculate the number of 8kB banks to dump
local banks = size_kb / 8
local b = 0

-- Load address is $8000-$9FFF for all banks
assert_roml()
--deassert_romh()

while b < banks do
  io_store(0xDE00, b)

  dump_chip()

  b = b + 1
end
