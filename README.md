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
    - HALT: 0x1
- Data Ops
    - LD:   0x2
    - ST:   0x3
- ALU Ops
    - ADD:  0x4
    - ADDR: 0x5
    - SUB:  0x6
    - SUBR: 0x7
    - MUL:  0x8
    - MULR: 0x9
- Jumps Ops
    - JMP:  0x9
    - JEQ:  0xA
    - JLT:  0xB
    - JGT:  0xC
- Misc
    - INC:  0xD