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
    addr {rd: register}, {rs: register} => rs @ rd @ 0x5
}

