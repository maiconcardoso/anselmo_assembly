%include 'bibliotecaE.inc'

section .data
    msg1 db 'Parte 1', 0xA, 0xD
    msg2 db 'Parte 2', 0xA, 0xD
    msg3 db 'Parte 3', 0xA, 0xD
    msg4 db 'Parte 4', 0xA, 0xD
section .text

global _start

_start:
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg1
    mov edx, 0x9
    int 0x80

    mov eax, 0x1
    mov ebx, 0x0
    int 0x80
