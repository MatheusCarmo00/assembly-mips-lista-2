
.data
msg1: .asciiz "Valor da compra em centavos (100000 a 999999): "
msg2: .asciiz "Valor da parcela em centavos (10000 a 50000): "
msg3: .asciiz "Quantidade de parcelas: "

.text
.globl main
main:
ler_compra:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # Validar compra
    blt $t0, 100000, ler_compra
    bgt $t0, 999999, ler_compra

ler_parcela:
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    # Validar parcela
    blt $t1, 10000, ler_parcela
    bgt $t1, 50000, ler_parcela

    # Dividir compra pelo valor da parcela
    div $t0, $t1
    mflo $t2
    mfhi $t3

    # Se houver resto, acrescentar uma parcela
    beq $t3, $zero, mostrar
    addi $t2, $t2, 1

mostrar:
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
