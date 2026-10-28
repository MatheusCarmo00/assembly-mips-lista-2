
.data
msg1: .asciiz "Digite o primeiro numero: "
msg2: .asciiz "Digite o segundo numero: "
msg3: .asciiz "\nOs numeros sao iguais."
msg4: .asciiz "\nOs numeros sao diferentes."
msg5: .asciiz "\nMaior: "
msg6: .asciiz "\nMenor: "

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

    # Verificar se sao iguais
    beq $t0, $t1, iguais

    # Se forem diferentes
    li $v0, 4
    la $a0, msg4
    syscall

    # Identificar maior e menor
    bgt $t0, $t1, primeiro_maior

    move $t2, $t1
    move $t3, $t0
    j mostrar

primeiro_maior:
    move $t2, $t0
    move $t3, $t1

mostrar:
    li $v0, 4
    la $a0, msg5
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, msg6
    syscall
    li $v0, 1
    move $a0, $t3
    syscall
    j fim

iguais:
    li $v0, 4
    la $a0, msg3
    syscall

fim:
    li $v0, 10
    syscall
