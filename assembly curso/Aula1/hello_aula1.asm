section .data
;                           Colocamos as constantes

;                           section .bss Todas variaveis

section .text

global _start
;                           sempre precisa existir

_start:

;                           apenas esse precisa ser "_start:"
        ; 0 1 2 3 4 5 6 7 8 9 A(10) B(11) C(12) D(13) E(14) F(15 10(16
        ;        mov é mover para destino origem
                    ;        pode em letra maiscula ou minuscula, pode dar tab
 
    mov RAX, 0x1 ; SO estou terminando o programa
    mov RBX, 0X0 ; SO o valor de retorno é 0x0 = 0.
    int 0x80     ;0x80 voce manda o so processar

;nasm -f elf64 programa.asm                 ||compilando  == compilada para linguagem de maquina                     
;ld -s -o hello hello_aula1.o               ||linkeditar é transformar um programa de linguagem de maquina em exec.




