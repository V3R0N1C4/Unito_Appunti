.data
	array: 	.byte 2,1,3,2,3,-6,1,23	 	# the array of bytes
	size: 	.word 8 			# size of the array
	result: .word 0 			# store the result
_start:
.text
	la t5, array	# load the vector address
	la t4, size 	# load the size address
	lw t0, 0(t4) 	# load the actual size
	li t2, 0 	# final number of odd numbers
	li t3, 2	# used on the division
loop:
	lb t1, 0(t5)		# first element of the vector (a byte)
	rem t1, t1, t3 		# get the reminder of the division t1/2
	beq t1, zero, else 	# if zero jump (its even)
	addi t2, t2, 1		# its odd, counts it
else:
	addi t5, t5, 1 		# move to the next byte in the array
	addi t0, t0, -1 	# decrement the counter
	bne t0, zero, loop	# if not done, jump
save:
	la t1, result
	sw t2, 0(t1)