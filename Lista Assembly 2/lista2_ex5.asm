
.data
msgA: .asciiz "Digite A: "
msgB: .asciiz "Digite B: "
msgC: .asciiz "Digite C: "
msg1: .asciiz "\nDUAS RAIZES REAIS"
msg2: .asciiz "\nUMA RAIZ REAL"
msg3: .asciiz "\nNAO EXISTEM RAIZES REAIS"

.text
.globl main
main:
    li $v0, 4
    la $a0, msgA
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, msgB
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, msgC
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    # Calcular B * B
    mul $t3, $t1, $t1

    # Calcular 4 * A * C
    mul $t4, $t0, $t2
    li $t5, 4
    mul $t4, $t4, $t5

    # Delta = B^2 - 4AC
    sub $t6, $t3, $t4

    # Verificar delta
    bgt $t6, $zero, duas
    beq $t6, $zero, uma
    j nenhuma

duas:
    li $v0, 4
    la $a0, msg1
    syscall
    j fim

uma:
    li $v0, 4
    la $a0, msg2
    syscall
    j fim

nenhuma:
    li $v0, 4
    la $a0, msg3
    syscall

fim:
    li $v0, 10
    syscall
