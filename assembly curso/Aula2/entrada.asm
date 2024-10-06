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
    msg db "Qual seu nome?", LF, NULL
    tam equ $- msg

section .bss ;Em tese, "var"
    nome resb 1

section .text

;                                               Programa começa aqui:  
global _start:

_start:
    mov RAX, SYS_WRITE ; CONST 0X4
    mov RBX, STD_OUT   ;CONST 0X1
    mov RCX, msg
    mov RDX, tam 
    int SYS_CALL       ;const:= 0X80

entrada:
    mov RAX, SYS_READ ; aqui não é escrita, e sim lida. Entrada precisa ser lida
    mov RBX, STD_IN   ; Saida não, entrada!
    mov RCX, nome
    mov RDX, 0X10     ; Precisa-se definir o tamanho de caracteres
    int SYS_CALL      ;CONST = 0X80


finalização:
    mov RAX, SYS_EXIT
    mov RBX, RET_EXIT
    int SYS_CALL
