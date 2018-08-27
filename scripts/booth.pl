#!/usr/bin/env perl
#

print `iverilog -o ../exe/booth  ../test_benches/tb_booth.v ../source/booth.v ../source/mem.v  ../source/memory.v ../source/counter.v ../source/memblock.v ../source/dff.v ../source/state.v`;
