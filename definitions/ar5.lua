-- Action Replay 4.x, 5, and 6 dumping definition file
-- for the Commodore 64 Cartridge Dumper client
-- (C) 2019 Luigi Di Fraia

-- 4 banks of 8kB each
local banks = 4
local b = 0

-- Load address is $8000-$9FFF for all banks
assert_roml()
deassert_romh()

while b < banks do
  -- Bank selection circuitry uses bits 3 and 4 at $DE00
  io_store(0xDE00, b << 3)

  dump_chip()

  b = b + 1
end
