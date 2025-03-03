a quick little program that I wrote from the bottom up in order to play around with syscalls and strings in ASM, also the first "complete" program I've written


steps to assemble and run the program (for linux devices with x86-64 architecture):

nasm -f elf64 lowercase.asm -o lowercase.o  
ld lowercase.o -o lowercase
./lowercase
