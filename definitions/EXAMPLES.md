# Commodore 64 Cartridge Dumper Examples

Note: throughout the below examples, it is assumed that the Commodore 64 Cartridge Dumper enumerates as virtual COM port 4, i.e. COM4. Replace such value according to the COM port it enumerates as in your setup.
Note: the `cartconv` tool is part of [VICE](https://vice-emu.sourceforge.io/)'s distribution packages.

## Ultimax

### Jupiter Lander

cart-dumper.exe -o "Jupiter Lander (1983)(Commodore).bin" COM4
cartconv.exe -t ulti -i "Jupiter Lander (1983)(Commodore).bin" -o "Jupiter Lander (1983)(Commodore).crt" -n "JUPITER LANDER"

## Action Replay

### Action Replay MK VI Professional

cart-dumper.exe -f ar5.lua -o "Action Replay MK VI Professional (1990)(Datel Electronics).bin" COM4
cartconv.exe -t ar5 -i "Action Replay MK VI Professional (1990)(Datel Electronics).bin" -o "Action Replay MK VI Professional (1990)(Datel Electronics).crt" -n "AR MK VI PROFESSIONAL"

## Ocean Type A (two 128 KiB memory chips)

### Robocop 2

cart-dumper.exe -f ocean_type_a.lua -o "Robocop 2 (1990)(Ocean Software).bin" -s 256 COM4
cartconv.exe -t ocean -i "Robocop 2 (1990)(Ocean Software).bin" -o "Robocop 2 (1990)(Ocean Software).crt" -n "ROBOCOP 2"

### Shadow of the Beast

cart-dumper.exe -f ocean_type_a.lua -o "Shadow of the Beast (1990)(Ocean Software).bin" -s 256 COM4
cartconv.exe -t ocean -i "Shadow of the Beast (1990)(Ocean Software).bin" -o "Shadow of the Beast (1990)(Ocean Software).crt" -n "SHADOW OF THE BEAST"

## Ocean Type B (one memory chip)

### Navy Seals

cart-dumper.exe -f ocean_type_b.lua -o "Navy Seals (1990)(Ocean Software).bin" -s 128 COM4
cartconv.exe -t ocean -i "Navy Seals (1990)(Ocean Software).bin" -o "Navy Seals (1990)(Ocean Software).crt" -n "NAVY SEALS"

### Chase H.Q. II

cart-dumper.exe -f ocean_type_b.lua -o "Chase H.Q. II (1990)(Ocean Software).bin" -s 256 COM4
cartconv.exe -t ocean -i "Chase H.Q. II (1990)(Ocean Software).bin" -o "Chase H.Q. II (1990)(Ocean Software).crt" -n "CHASE HQ 2"

### Terminator 2

cart-dumper.exe -f ocean_type_b.lua -o "Terminator 2 (1991)(Ocean Software).bin" -s 512 COM4
cartconv.exe -t ocean -i "Terminator 2 (1991)(Ocean Software).bin" -o "Terminator 2 (1991)(Ocean Software).crt" -n "TERMINATOR 2"
