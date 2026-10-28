
.data
msg1: .asciiz "Digite o valor em dolares: "
msg2: .asciiz "Valor em reais: R$ "

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # Multiplicar por 5
    li $t1, 5
    mul $t2, $t0, $t1

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
