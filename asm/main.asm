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
    {immediate} => immediate`5 @ 0b0
    {rs: register} => 0b000 @ rs @ 0b1
}

#ruledef {
    ld {rd: register}, {src: ld_source} => src @ rd @ 0x1
    st mem[{address}], {src: st_source} => src @ address`6 @ 0x2
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
