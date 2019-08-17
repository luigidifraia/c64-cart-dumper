-- Standard (8/16 kB Normal or Ultimax) cartridge dumping definition file
-- for the Commodore 64 Cartridge Dumper client
-- (C) 2019 Luigi Di Fraia

-- Don't dump ROML if it's an 8kB Ultimax cartridge
if exrom == 0 then
  assert_roml()
  deassert_romh()

  dump_chip()
end

-- Dump ROMH if it's a 16kB cartridge, either Normal ($A000-$BFFF) or Ultimax ($E000-$FFFF)
if game == 0 then
  deassert_roml()
  assert_romh()

  dump_chip()
end
