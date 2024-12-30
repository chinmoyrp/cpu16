# cpu16
An attempt at creating a 16-bit CPU

## GOAL #1
- Perform arithmetic operations (except division) on integers
- Branching
- Looping
- Generate fibonacci sequence
- Sort an array using bubble sort

## ISA
- System Ops 
    - NOP:  0x0
- Data Ops
    - LD:   0x1
    - ST:   0x2
- ALU Ops
    - ADD:  0x4
    - ADDR: 0x5
    - SUB:  0x6
    - SUBR: 0x7
    - MUL:  0x8
    - MULR: 0x9
- Jumps Ops
    - JMP:  0xA
    - JEQ:  0xB
    - JLT:  0xC
    - JGT:  0xD
- Misc
    - MOV:  0x3
    - CMP:  0xE

Installation:
2. Install Java
1. Open `frontpanel.dig` in Digital: [https://github.com/hneemann/Digital]
    Download link: [https://github.com/hneemann/Digital/releases/latest/download/Digital.zip]
