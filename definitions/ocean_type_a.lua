-- Ocean type A dumping definition file (all Ocean cartridges excluding "Chase H.Q. II" and "Terminator 2")
-- for the Commodore 64 Cartridge Dumper client
-- (C) 2019 Luigi Di Fraia

-- Bank selection circuitry uses:
--  128kB cartridges: TBD
--  256kB cartridges: bits 0-3 at $DE00 and ROML/H (two 128kB chips)

-- Calculate the number of 8kB banks to dump
local banks = size_kb / 8
local b = 0

-- Load address is $8000-$9FFF for banks 0-15
assert_roml()
deassert_romh()

while b < banks do
  -- Load address is $A000-$BFFF for banks 16-31
  if b == 16 then
    deassert_roml()
    assert_romh()
  end

  io_store(0xDE00, b)

  dump_chip()

  b = b + 1
end
