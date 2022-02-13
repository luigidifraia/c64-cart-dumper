-- Ocean Software Type A ($8000-$9FFF and $A000-$BFFF) dumping definition file
-- for the Commodore 64 Cartridge Dumper client
-- (C) 2019-2022 Luigi Di Fraia

-- Supported titles:
--  - "Robocop 2" (tested)
--  - "Shadow of the Beast" (tested)

-- Bank selection circuitry uses:
--  256 KiB cartridges (all known titles): data bus bits 0-3, /IO1, /ROML, and /ROMH (two 128 KiB chips)

-- As an example, "Robocop 2" uses two 128 KiB 28-pin mask ROM chips:
--  - for both, A13 is set to the output of a 75LS273 that latches bit 0 of the data bus
--  - for both, A14 is set to the output of the same 75LS273 that latches bit 1 of the data bus
--  - for both, A15 is set to the output of the same 75LS273 that latches bit 2 of the data bus
--  - for both, A16 is set to the output of the same 75LS273 that latches bit 3 of the data bus
--  - for one chip (lower 128 KiB), /CE (Chip Enable) is connected /ROML
--  - for the other chip (upper 128 KiB), /CE is connected to /ROMH
--  - latching occurs when /IO1 is asserted (i.e. the value on the address bus is in range $DE00-$DEFF)


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
