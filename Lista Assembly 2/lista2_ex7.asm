
.data
msg1: .asciiz "Digite um numero entre 100 e 999: "
msg2: .asciiz "CENTENA = "
msg3: .asciiz "\nDEZENA = "
msg4: .asciiz "\nUNIDADE = "

.text
.globl main
main:
ler:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # Validar intervalo
    blt $t0, 100, ler
    bgt $t0, 999, ler

    # Separar centena
    li $t1, 100
    div $t0, $t1
    mflo $t2

    # Obter o resto
    mfhi $t3

    # Separar dezena
    li $t1, 10
    div $t3, $t1
    mflo $t4
    mfhi $t5

    # Mostrar centena
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    # Mostrar dezena
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    move $a0, $t4
    syscall

    # Mostrar unidade
    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 10
    syscall
