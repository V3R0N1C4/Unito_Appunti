_start:
	li a0, 24 
	li a1, 30 
	jal ra, mcd 
	mv t0, a0
print:
	addi a0, t0, 0
	li a7, 1 
	ecall
mcd:
mcd_while:
	beq a0, a1, mcd_end
	bge a1, a0, mcd_else 
	sub a0, a0, a1
	j mcd_while
mcd_else:
	sub a1, a1, a0
	j mcd_while
mcd_end:
	ret