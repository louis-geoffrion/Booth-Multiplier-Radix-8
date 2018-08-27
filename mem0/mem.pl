#!/usr/bin/env perl
print `iverilog -o mem mem.v memory.v test_mem.v`;
