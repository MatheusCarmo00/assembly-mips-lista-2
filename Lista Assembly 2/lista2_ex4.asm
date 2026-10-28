
.data
msg1: .asciiz "Digite o salario atual (em reais inteiros): "
msg2: .asciiz "Novo salario: R$ "

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # Calcular 25% do salario
    mul $t1, $t0, 25
    div $t1, $t1, 100

    # Somar o aumento ao salario
    add $t2, $t0, $t1

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
