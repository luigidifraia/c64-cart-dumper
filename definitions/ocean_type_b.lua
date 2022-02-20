-- Ocean Software Type B ($8000-$9FFF) dumping definition file
-- for the Commodore 64 Cartridge Dumper client
-- (C) 2019-2022 Luigi Di Fraia

-- Supported titles:
--  All Ocean Software titles, excluding "Robocop 2" and "Shadow of the Beast"

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
