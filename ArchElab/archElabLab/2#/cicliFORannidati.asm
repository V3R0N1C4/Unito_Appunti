.globl	_start
.data

.text

_start:
	li t0,10	# a = 10
	li t1,5		# b = 5
	li t2,0		# R = 0
	
	li t3,0		# i = 0
loopi:
	bge t3,t0,endi	# quando (i >= a) vai ad endi
	li t4,0		# j = 0
loopj:
	bge t4,t1,endj	# quando (j >= b) vai ad endj
	slli t5,t2,1	# t5 = R * 2
	add t6,t3,t4	# t6 = i + j
	add t2,t5,t6	# R = R * 2 + i + j
	addi t4,t4,1	# j++
	j loopj
endj:	
	addi t3,t3,1	# i++
	j loopi
endi:
	addi a0,t2,0
	li a7,1
	ecall
	
	

