section .data
    msg db 'Hello, WORLD!', 0xA    ;Isso não é uma variavel, é um apontamento.
    tam equ $- msg ; igual aos caracters (Hello, WORLD!)= 13
section .text

global _start

_start:

    mov rax, 0x4
    mov rbx, 0x1 ;saida padrão, poderia ser para impressora
    mov rcx, msg ;filhos dos de cima
    mov rdx, tam ;filho
    int 0x80


    mov rax, 0x1
    mov rbx, 0x10
    int 0x80