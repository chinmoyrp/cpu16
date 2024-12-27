#bankdef mybank {
  #outp 0x0
  #bits 16
}

#bank mybank

#subruledef register {
    r0   => 0`2
    r1   => 1`2
    r2   => 2`2
    r3   => 3`2
}

#subruledef ld_source {
    {immediate} => immediate`9 @ 0b0
    mem[{address}] => 0b000 @ address`6 @ 0b1
}

#subruledef st_source {
    {immediate} => immediate`4 @ 0b0
    {rs: register} => 0b00 @ rs @ 0b1
}

#ruledef {
    ld {rd: register}, {src: ld_source} => src @ rd @ 0x1
    st mem[{address}], {src: st_source} => src @ address`6 @ 0`1 @ 0x2
    st mem[{rs :register}], {src: st_source} => src @ 0`4 @ rs @ 1`1 @ 0x2
	mov {rd: register}, {rs: register} =>  0`8 @ rs @ rd @ 0x3
    add {rd: register}, {immediate} => immediate`10 @ rd @ 0x4
    addr {rd: register}, {rs: register} => 0`8 @ rs @ rd @ 0x5
    sub {rd: register}, {immediate} => immediate`10 @ rd @ 0x6
    subr {rd: register}, {rs: register} => 0`8 @ rs @ rd @ 0x7
    mul {rd: register}, {immediate} => 0`2 @ immediate`8 @ rd @ 0x8
    mulr {rd: register}, {rs: register} => 0`8 @ rs @ rd @ 0x9
    jmp {address} => 0`6 @ address`6 @ 0xA
    jeq {address} => 0`6 @ address`6 @ 0xB
    jlt {address} => 0`6 @ address`6 @ 0xC
    jgt {address} => 0`6 @ address`6 @ 0xD
    cmp {a: register}, {immediate} => immediate`10 @ a @ 0xE
    halt => 0xF`16
}


fibonacci:
	ld r0, 1
	ld r1, 1
	st mem[0x20], r0
	st mem[0x21], r1
	ld r2, 0
	ld r3, 1
	.loop:
		addr r0, r1
		mov r3, r0
		st mem[0x23], r3
		mov r0, r1
		mov r1, r3
		add r2, 1
		cmp r2, 5
		jlt .loop
	halt