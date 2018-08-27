#!/usr/bin/env perl
#

print `iverilog -o unit mem1/tb_unit.v test_unit.v state.v dff.v mem1/memory.v mem1/mem.v counter.v adders/FA.v adders/RCA8B.v`;
