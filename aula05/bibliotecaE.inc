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

segment .text

;--------------------------------
; Saída do terminal 
;--------------------------------

mst_saida:
    call tamStr
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    int SYS_CALL
    ret


;--------------------------------
; Calcular o tamanho da string
;--------------------------------
; Entrada: valor da string em ecx 
; Saída: tamanho da string em edx

tamStr:
    mov edx, ecx
    proxchar:
        cmp byte[edx], NULL
        jz terminei
        inc edx
        jmp proxchar
    terminei:
        sub edx, ecx
        ret 
