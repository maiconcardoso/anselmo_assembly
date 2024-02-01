%include 'bibliotecaE.inc'

section .data
    array: dd 10, 22, 15, 16, 56
section .text

global _start

_start:
    mov eax, [array + 4]
    call saidaResultado

    mov eax, 0x1
    mov ebx, 0x0
    int 0x80;