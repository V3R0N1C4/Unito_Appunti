.text
_start:
	li t3, 0 		# i = 0
	li t0, 10
	li t1, 5
LOOPI:
	bge t3, t0, ENDI 	# when (i>=a) jump
	li t4,0 		# j = 0
LOOPJ:
	bge t4, t1, ENDJ	# when (j>=b) jump
	add t2, t2, t2 		# R = 2R
	add t5, t3, t4 		# i+j  
	add t2, t2, t5 		# R += i+j
	addi t4, t4, 1 		# j++
	j LOOPJ
ENDJ:
	addi t3, t3, 1 		# i++
	j LOOPI
ENDI: