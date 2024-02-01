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

    TAM_BUFFER equ 0xA

segment .bss
    BUFFER resb 0x1

segment .text

saidaResultado:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, BUFFER
    mov EDX, TAM_BUFFER
    int SYS_CALL
    ret