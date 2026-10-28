
.data
msg1: .asciiz "Mes de nascimento (1-12): "
msg2: .asciiz "Ano de nascimento: "
msg3: .asciiz "Mes atual (1-12): "
msg4: .asciiz "Ano atual: "
msg5: .asciiz "Idade em meses: "

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 5
    syscall
    move $t3, $v0

    # Diferenca entre os anos
    sub $t4, $t3, $t1

    # Converter anos em meses
    li $t5, 12
    mul $t4, $t4, $t5

    # Somar a diferenca entre os meses
    sub $t6, $t2, $t0
    add $t4, $t4, $t6

    li $v0, 4
    la $a0, msg5
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall
