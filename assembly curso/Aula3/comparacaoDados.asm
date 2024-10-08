segment .data
    LF          equ 0xA ; Line Feed
    NULL        equ 0xD ; Final de String
    SYS_CALL equ 0x80   ; Envia Informações ao SO

        ;RAX
    SYS_EXIT    equ 0x1 ; Finalizar
    SYS_READ    equ 0x3 ; Operação de leitura 3 = Leiturax
    SYS_WRITE   equ 0x4 ; Operação de escrita 4 = write
        ;RBX 
    RET_EXIT    equ 0x0 ; Operação realizada, exibir erros = 0 (OK)
    STD_IN      equ 0x0 ; Entrada Padrão
    STD_OUT     equ 0x1 ; Saida Padrão

section .data

         ;     DB - Define Byte. 8 bits
            ;     DW - Define Word. Generally 2 bytes on a typical x86 32-bit system                   (char em java por ex)
            ;     DD - Define double word. Generally 4 bytes on a typical x86 32-bit system            (xorg)
            ;     DQ - Define quad word. 8 bytes
            ;     DT - Define ten word 10 bytes
    x dd 50
    y dd 10
    msg1 db 'X é maior que Y', LF, NULL
    tam1 equ $ - msg1
    msg2 db 'Y é menor que X', LF, NULL
    tam2 equ $ - msg2

section .text

global _start

_start:
    mov RAX, [x]
    mov RBX, [y] ; com comparaor EBX EAX, USO DO DWORDS

    cmp RAX, RBX 
    jge maior
    mov RCX, msg2
    mov RDX, tam2
    
    
    ; IF= COMPARAÇÃO = salto condicional

    ; je = ; jg > ; jg >= ; jl < ; jle <= ; jne !=; jumper ;

    jmp final
    ; salto incodicional = jmp = goto


maior:
    mov RCX, msg1
    mov RDX, tam1

final:

    mov RAX, SYS_WRITE
    mov RBX, STD_OUT
    int SYS_CALL

    mov RAX, SYS_EXIT
    xor RBX, RET_EXIT       
    int SYS_CALL


    ; FUNCIONAMENTO SE TEMOS 7 A CONSTRUNÇÃO SE DÁ POR:  n X 2 partindo de 1
    ;        bytes:                    |8|4|2|1
    ;                   7 pegamos os byes para somar 8?false / 4 true / 2/ true /1 true = 4+2+1 (del 8) = 7 
    ;ou seja 0(8desligado) e o restante ligado 1
    ;     AND        OR          XORG
    ;7    0111      0111        0111
    ;5    0101      0101        0101
    ;     0101      0111        0010
    ;       7       5           2