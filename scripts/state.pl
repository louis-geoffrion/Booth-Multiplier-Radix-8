#!/usr/bin/perl
print `iverilog -o state tb_state.v testState.v state.v dff.v`;

