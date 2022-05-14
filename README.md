# ZX81-ASM-model
Base model to compile ASM in shortest code on a ZX81

This file is a base to make the shortest Z80-code on a ZX81
The file holds all necessary systemvariables and will auto start your machinecode.
The start in BASIC is cleverly placed over the systemvariables and the screen on a ZX81
will be set to it smallest form. For every not used line the ZX81 uses a LF but that can be replaced by a 
single JP (HL)

THIS FILE IS OPTIMIZED FOR 1K! Compiling with a larger file can go wrong when screen is on a place where highbyte bit 6 is not set.
