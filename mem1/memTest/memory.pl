#!/usr/bin/env perl

print `iverilog -o memory memory.v test_memory.v tb_memory.v`;
