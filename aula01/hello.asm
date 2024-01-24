; Compilar - Transformar um programa em linguagem de máquina
    ; nasm -f elf64 hello.asm 
; Linkeditar - Transformar um programa em linguagem de máquina em um executável
    ; ld -s -o nomedoarquivo nomedoarquivo.o

section .data
    msg db 'Hello World!', 0xA
    tam equ $- msg

section .text

global _start

_start:
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg
    mov edx, tam
    int 0x80

    mov eax, 0x1 
    mov ebx, 0x0
    int 0x80