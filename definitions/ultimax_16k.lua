-- 16 KiB Ultimax cartridge dumping definition file
-- for the Commodore 64 Cartridge Dumper client
-- (C) 2022 Luigi Di Fraia

-- Supported titles:
--  "Pinball Spectacular" (tested)

-- Dump ROML (mapped at $8000-9FFF)
assert_roml()
deassert_romh()

dump_chip()

-- Dump ROMH (mapped at $E000-$FFFF)
deassert_roml()
assert_romh()

dump_chip()
