# Commodore 64 Cartridge Dumper Examples

Note: throughout the below examples, it is assumed that the Commodore 64 Cartridge Dumper enumerates as virtual COM port 4, i.e. COM4. Replace such value according to the COM port it enumerates as in your setup.  
Note: the `cartconv` tool is part of [VICE](https://vice-emu.sourceforge.io/)'s distribution packages.

## Normal

### Dragon's Den

Hardware configuration:
- /GAME: pulled down (by the cartridge)
- /EXROM: pulled down (by the cartridge)

```
cart-dumper.exe -o "Dragon's Den (1983)(Commodore).bin" COM4
cartconv.exe -t normal -i "Dragon's Den (1983)(Commodore).bin" -o "Dragon's Den (1983)(Commodore).crt" -n "DRAGONS DEN"
```

### International Soccer

Hardware configuration:
- /GAME: pulled down (by the cartridge)
- /EXROM: pulled down (by the cartridge)

```
cart-dumper.exe -o "International Soccer (1983)(Commodore).bin" COM4
cartconv.exe -t normal -i "International Soccer (1983)(Commodore).bin" -o "International Soccer (1983)(Commodore).crt" -n "INTERNATIONAL SOCCER"
```

### Lazarian

Hardware configuration:
- /GAME: pulled down (by the cartridge)
- /EXROM: pulled down (by the cartridge)

```
cart-dumper.exe -o "Lazarian (1983)(Commodore).bin" COM4
cartconv.exe -t normal -i "Lazarian (1983)(Commodore).bin" -o "Lazarian (1983)(Commodore).crt" -n "LAZARIAN"
```

### Robotron: 2084

Hardware configuration:
- /GAME: pulled down (by the cartridge)
- /EXROM: pulled down (by the cartridge)

```
cart-dumper.exe -o "Robotron 2084 (1983)(Atari).bin" COM4
cartconv.exe -t normal -i "Robotron 2084 (1983)(Atari).bin" -o "Robotron 2084 (1983)(Atari).crt" -n "ROBOTRON 2084"
```

### Tooth Invaders

Hardware configuration:
- /GAME: pulled down (by the cartridge)
- /EXROM: pulled down (by the cartridge)

```
cart-dumper.exe -o "Tooth Invaders (1982)(Commodore).bin" COM4
cartconv.exe -t normal -i "Tooth Invaders (1982)(Commodore).bin" -o "Tooth Invaders (1982)(Commodore).crt" -n "TOOTH INVADERS"
```

### Wizard of Wor

Hardware configuration:
- /GAME: pulled down (by the cartridge)
- /EXROM: pulled down (by the cartridge)

```
cart-dumper.exe -o "Wizard of Wor (1982)(Commodore).bin" COM4
cartconv.exe -t normal -i "Wizard of Wor (1982)(Commodore).bin" -o "Wizard of Wor (1982)(Commodore).crt" -n "WIZARD OF WOR"
```
---

## 8 KiB Ultimax

### Jupiter Lander

Hardware configuration:
- /GAME: pulled down (by the cartridge)
- /EXROM: pulled up (by the C64)

```
cart-dumper.exe -o "Jupiter Lander (1983)(Commodore).bin" COM4
cartconv.exe -t ulti -i "Jupiter Lander (1983)(Commodore).bin" -o "Jupiter Lander (1983)(Commodore).crt" -n "JUPITER LANDER"
```

### Le Mans

Hardware configuration:
- /GAME: pulled down (by the cartridge)
- /EXROM: pulled up (by the C64)

```
cart-dumper.exe -o "Le Mans (1982)(Commodore).bin" COM4
cartconv.exe -t ulti -i "Le Mans (1982)(Commodore).bin" -o "Le Mans (1982)(Commodore).crt" -n "LE MANS"
```

### Radar Rat Race

Hardware configuration:
- /GAME: pulled down (by the cartridge)
- /EXROM: pulled up (by the C64)

```
cart-dumper.exe -o "Radar Rat Race (1982)(Commodore).bin" COM4
cartconv.exe -t ulti -i "Radar Rat Race (1982)(Commodore).bin" -o "Radar Rat Race (1982)(Commodore).crt" -n "RADAR RAT RACE"
```

---

## 16 KiB Ultimax

### Pinball Spectacular

Hardware configuration:
- /GAME: pulled down (by the cartridge)
- /EXROM: pulled up (by the C64)

```
cart-dumper.exe -f ultimax_16k.lua -o "Pinball Spectacular (1983)(Commodore).bin" COM4
cartconv.exe -t ulti -i "Pinball Spectacular (1983)(Commodore).bin" -o "Pinball Spectacular (1983)(Commodore).crt" -n "PINBALL SPECTACULAR"
```

---

## Action Replay

### Action Replay v5

Hardware configuration:
- /GAME: pulled up (by the C64)
- /EXROM: pulled down (by the cartridge)

```
cart-dumper.exe -f ar5.lua -o "Action Replay v5 (1988)(Datel Electronics).bin" COM4
cartconv.exe -t ar5 -i "Action Replay v5 (1988)(Datel Electronics).bin" -o "Action Replay v5 (1988)(Datel Electronics).crt" -n "ACTION REPLAY V5"
```

### Action Replay v6

Hardware configuration:
- /GAME: pulled up (by the C64)
- /EXROM: pulled down (by the cartridge)

```
cart-dumper.exe -f ar5.lua -o "Action Replay v6 (1989)(Datel Electronics).bin" COM4
cartconv.exe -t ar5 -i "Action Replay v6 (1989)(Datel Electronics).bin" -o "Action Replay v6 (1989)(Datel Electronics).crt" -n "ACTION REPLAY V6"
```

---

## Ocean Type A (two 128 KiB memory chips)

### Robocop 2

Hardware configuration:
- /GAME: pulled down (by the cartridge)
- /EXROM: pulled down (by the cartridge)

```
cart-dumper.exe -f ocean_type_a.lua -o "Robocop 2 (1990)(Ocean Software).bin" -s 256 COM4
cartconv.exe -t ocean -i "Robocop 2 (1990)(Ocean Software).bin" -o "Robocop 2 (1990)(Ocean Software).crt" -n "ROBOCOP 2"
```

### Shadow of the Beast

Hardware configuration:
- /GAME: pulled down (by the cartridge)
- /EXROM: pulled down (by the cartridge)

```
cart-dumper.exe -f ocean_type_a.lua -o "Shadow of the Beast (1990)(Ocean Software).bin" -s 256 COM4
cartconv.exe -t ocean -i "Shadow of the Beast (1990)(Ocean Software).bin" -o "Shadow of the Beast (1990)(Ocean Software).crt" -n "SHADOW OF THE BEAST"
```

---

## Ocean Type B (one memory chip)

### Navy Seals

Hardware configuration:
- /GAME: pulled down (by the cartridge)
- /EXROM: pulled down (by the cartridge)

```
cart-dumper.exe -f ocean_type_b.lua -o "Navy Seals (1990)(Ocean Software).bin" -s 128 COM4
cartconv.exe -t ocean -i "Navy Seals (1990)(Ocean Software).bin" -o "Navy Seals (1990)(Ocean Software).crt" -n "NAVY SEALS"
```

### Chase H.Q. II

Hardware configuration:
- /GAME: pulled down (by the cartridge)
- /EXROM: pulled down (by the cartridge)

```
cart-dumper.exe -f ocean_type_b.lua -o "Chase H.Q. II (1990)(Ocean Software).bin" -s 256 COM4
cartconv.exe -t ocean -i "Chase H.Q. II (1990)(Ocean Software).bin" -o "Chase H.Q. II (1990)(Ocean Software).crt" -n "CHASE HQ 2"
```
