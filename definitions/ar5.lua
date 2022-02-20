-- Action Replay 4.x, 5, and 6 ($8000-$9FFF) dumping definition file
-- for the Commodore 64 Cartridge Dumper client
-- (C) 2019-2022 Luigi Di Fraia

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
