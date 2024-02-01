%include 'bibliotecaE.inc'

section .data
    tit db LF, '+-------------+', LF, '| CALCULADORA |', LF,'+-------------+', LF, NULL
    obVal1 db LF, 'VALOR 1: ', NULL
    obVal2 db LF, 'VALOR 2: ', NULL
    opc1 db LF, '1. ADICIONAR', NULL
    opc2 db LF, '2. SUBTRAIR', NULL
    opc3 db LF, '3. MULTIPLICAR', NULL
    opc4 db LF, '4. DIVIDIR', NULL
    msgOpc db LF, 'DESEJA REALIZAR? ', NULL
    msgErro db LF, 'VALOR DE OPCAO INVALIDA', NULL
    p1 db LF, 'PROCESSO DE ADICIONAR', NULL
    p2 db LF , 'PROCESSO DE SUBTRAIR', NULL
    p3 db LF, 'PROCESSO DE MULTIPLICAR', NULL
    p4 db LF, 'PROCESSO DE DIVIDIR', NULL
    msgFim db LF 'TERMINEI', NULL

section .bss
    opc resb 1
    num1 resb 1
    num2 resb 1
     
section .text

global _start

_start:
    mov ecx, tit
    call mst_saida

    mov ECX, obVal1
    call mst_saida
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, num1
    mov edx, 0x3
    int SYS_CALL

    mov ECX, obVal2
    call mst_saida
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, num2
    mov edx, 0x3
    int SYS_CALL

    mov ecx, opc1
    call mst_saida

    mov ecx, opc2
    call mst_saida

    mov ecx, opc3
    call mst_saida

    mov ecx, opc4
    call mst_saida    

    mov ECX, msgOpc
    call mst_saida
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, opc
    mov edx, 0x2
    int SYS_CALL

    mov ah, [opc]
    sub ah, '0'

    cmp ah, 1
    je adicionar

    cmp ah, 2
    je subtrair

    cmp ah, 3
    je multiplicar

    cmp ah, 4
    je dividir

    mov ecx, msgErro
    call mst_saida
    jmp saida

adicionar:
    mov ecx, p1
    call mst_saida
    jmp saida
subtrair:
    mov ecx, p2
    call mst_saida
    jmp saida
multiplicar:
    mov ecx, p3
    call mst_saida
    jmp saida

dividir:
    mov ecx, p4
    call mst_saida
    jmp saida

saida:

    call msgFim
    jmp saida

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL
