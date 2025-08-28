.globl _start
.data

.text

_start:
	li t0,2		# x = 2
	li t1,1		# y = 1 
	
	sub t0,t0,t1		# x = x - y
	bge t0,zero,else	# if!(x < 0) jump -> vai all'etichetta else
	li t0,0			# x = 0
else:
	addi t1,t1,-1	# y = y - 1