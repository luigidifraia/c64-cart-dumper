-- Action Replay 4.x, 5, and 6 dumping definition file
-- for the Commodore 64 Cartridge Dumper client
-- (C) 2019-2021 Luigi Di Fraia

-- Bank selection circuitry uses:
--  Bits 3 and 4 at $DE00 are used to set address lines A13 and A14 of the memory chip

-- 4 banks of 8 KiB each
local banks = 4
local b = 0

-- Mapping is at $8000-$9FFF for all banks
assert_roml()
deassert_romh()

while b < banks do
  io_store(0xDE00, b << 3)

  dump_chip()

  b = b + 1
end
