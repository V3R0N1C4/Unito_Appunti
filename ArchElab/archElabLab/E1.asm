.globl _start
.data
.text
_start:
	addi t0, zero, -4 
	addi t1, zero, -4 
	xor t0, t0, t1
	blt t0, zero, cont1 
	addi t0, zero, 0 
	jal zero, cont0
cont1:
	addi t0, zero, 1
cont0:
	nop
