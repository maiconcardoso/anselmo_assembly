// nasm -f elf64 hello.asm 

section .data

section .text

global _start

_start:
    mov eax, 0x1 
    mov ebx, 0x0
    int 0x80