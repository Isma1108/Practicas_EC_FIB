	.data
A:	.word 3, 5, 7
punter:	.word 0

	.text
	.globl main
	
main:
	la $t0, A
	addiu $t0, $t0, 8
	la $t1, punter
	sw $t0, 0($t1)
	
	la $t0, punter
	lw $t0, 0($t0)
	lw $t0, 0($t0)
	addiu $s0, $t0, 2
	
	la $t0, punter
	lw $t0, 0($t0)
	addiu $t0, $t0, -8
	lw $t0, 0($t0)
	addu $s0, $s0, $t0
	
	la $t0, A+4
	sw $s0, 0($t0)
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	jr $ra
