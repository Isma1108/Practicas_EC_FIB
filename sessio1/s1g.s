	.data
	.align 2
fib: 	.space 40

	.text
	.globl main
	
main:
	li $s0, 2
	la $t0, fib
	sw $zero, 0($t0)
	li $t1, 1
	sw $t1, 4($t0)
	
while:
	slti $t0, $s0, 10
	beq $t0, $zero, fi
	la $t0, fib
	sll $t1, $s0, 2
	addu $t1, $t0, $t1
	lw $t2, -4($t1)
	lw $t3, -8($t1)
	addu $t2, $t2, $t3
	sw $t2, 0($t1)
	addiu $s0, $s0, 1
	b while

fi:
	jr $ra