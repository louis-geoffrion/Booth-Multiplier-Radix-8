#!/usr/bin/env perl
#
print `iverilog -o mem memory.v mem.v test_mem.v tb_mem.v`;
