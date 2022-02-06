-- Ocean type A (two memory chips) dumping definition file
-- for the Commodore 64 Cartridge Dumper client
-- (C) 2019-2021 Luigi Di Fraia

-- Supported titles:
--  - "Robocop 2" (tested)
--  - "Shadow of the Beast" (tested)

-- Bank selection circuitry uses:
--  256 KiB cartridges (all known titles): bits 0-3 at $DE00, /ROML, and /ROMH (two 128 KiB chips)

-- Calculate the number of 8 KiB banks to dump
local banks = size_kb / 8
local hstart = banks / 2
local b = 0

-- Mapping is at $8000-$9FFF for banks in the first chip
assert_roml()
deassert_romh()

while b < banks do
  -- Mapping is at $A000-$BFFF for banks in the second chip
  if b == hstart then
    deassert_roml()
    assert_romh()
  end

  io_store(0xDE00, b)

  dump_chip()

  b = b + 1
end
