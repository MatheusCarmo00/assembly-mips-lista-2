
.data
msg1: .asciiz "Digite o primeiro valor: "
msg2: .asciiz "Digite o segundo valor: "
msg3: .asciiz "\nValores apos a troca:\nPrimeiro: "
msg4: .asciiz "\nSegundo: "

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

    # Guardar o primeiro valor temporariamente
    move $t2, $t0

    # Efetuar a troca
    move $t0, $t1
    move $t1, $t2

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall
