segment .data
    LF equ 0xA ; Line Feed
    NULL equ 0xD ; Final da cadeia de caracteres
    SYS_CALL equ 0x80 ; Envia informações ao Sistema Operacional

    ;EAX
    SYS_EXIT equ 0x1 ; Código de chamada para finalizar
    SYS_READ equ 0x3 ; Operação de Leitura
    SYS_WRITE equ 0x4 ; Operação de escrita

    ;EBX
    RET_EXIT equ 0x0 ; Operação Realizada com Sucesso
    STD_IN equ 0x0 ; Entrada padrão
    STD_OUT equ 0x1 ; Saída padrão

section .data
    x dd 50
    y dd 10
    msg1 db 'X maior que y', LF, NULL
    tam1 equ $ - msg1
    msg2 db 'Y maior que x', LF, NULL
    tam2 equ $ - msg2

section .text

global _start

_start:
    mov eax, dword[x]
    mov ebx, dword[y]

    cmp eax, ebx
    jge maior 
    mov ecx, msg2
    mov edx, tam2

    jmp final

maior:
    mov ecx, msg1
    mov edx, tam1

final:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    int SYS_CALL

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL