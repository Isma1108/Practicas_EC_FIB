	.data
result: .word 0
num:	.byte '7'

	.text
	.globl main
main:	
	la $t0, num
	lb $t0, 0($t0)
	la $t1, result
	li $t2, 'a'
	blt $t0, $t2, etq1
	li $t2, 'z'
	ble $t0, $t2, cos_if
etq1:
	li $t2, 'A'
	blt $t0, $t2, else
	li $t2, 'Z'
	bgt $t0, $t2, else
cos_if:
	sw $t0, 0($t1)
	b fi_if
else:
	li $t2, '0'
	blt $t0, $t2, else2
	li $t2, '9'
	bgt $t0, $t2, else2
	addiu $t0, $t0, -48
	sw $t0, 0($t1)
	b fi_if
else2:
	li $t0, -1
	sw $t0, 0($t1)
fi_if:	
	jr $ra

