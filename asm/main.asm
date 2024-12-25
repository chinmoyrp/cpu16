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

#subruledef source {
    {immediate} => immediate`9 @ 0b0
    mem[{address}] => 0b000 @ address`6 @ 0b1
}

#ruledef {
    ld {rd: register}, {src: source} => src @ rd @ 0x1
}

