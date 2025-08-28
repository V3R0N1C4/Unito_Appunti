.globl _start
.data

.text

_start:
	li t0,1		# x = 1
	li t1,2		# y = 2
	
	addi t0,t0,-2	# x = x - 2
	add t0,t0,t1	# x = x + y
	bge t0,t1,else		# if!(x < y) jump -> vai all'etichetta else
	addi t0,t0,1		# x = x + 1
else:
	addi t1,t1,1	# y = y + 1