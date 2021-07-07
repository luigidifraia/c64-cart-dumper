-- Standard (8/16 KiB Normal or 8 KiB Ultimax) cartridge dumping definition file
-- for the Commodore 64 Cartridge Dumper client
-- (C) 2019-2021 Luigi Di Fraia

-- A somewhat simplified logic is implemented here, assuming 8 KiB Ultimax

-- Dump ROML unless it's an 8 KiB Ultimax cartridge
if exrom == 0 then
  assert_roml()
  deassert_romh()

  dump_chip()
end

-- Dump ROMH (mapped at $A000-$BFFF for Normal and at $E000-$FFFF for Ultimax)
if game == 0 then
  deassert_roml()
  assert_romh()

  dump_chip()
end
