.data
V:	.word 0,3,2,1,4,5,6,7,8,9
k:	.word 0

	.text
	.globl main
main:
	addiu $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)
	la $t0, k
	sw $zero, 0($t0)
	li $s0, 0
for:
	la $a0, V
	move $a1, $s0
	addiu $a2, $s0, 2
	jal subr
	la $t0, k
	lw $t1, 0($t0)
	addu $t1, $t1, $v0
	sw $t1, 0($t0)
	addiu $s0, $s0, 1
	li $t0, 8
	blt $s0, $t0, for
fi:
	addiu $sp, $sp, 8
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	jr $ra
	
subr2:
	andi $v0, $a0, 3
	jr $ra

subr:
	addiu $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	move $s0, $a0
	move $s1, $a1
	sll $t0, $s1, 2
	sll $t1, $a1, 2
	addu $t0, $t0, $s0
	addu $t1, $t1, $s0
	lw $t0, 0($t0)
	lw $t1, 0($t1)
	bge $t0, $t1, else
	bge $s1, $a2, else
if:
	move $a0, $a2
	jal subr2
	sll $t0, $t3, 2
	sll $t1, $s1, 2
	addu $t0, $s0, $t0
	addu $t1, $s0, $t1
	lw $t1, 0($t1)
	sw $t1, 0($t0)
	li $v0, 1
	
else:
	li $v0, 0

fi_subr:
	addiu $sp, $sp, 12
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	jr $ra