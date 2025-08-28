sumi:
	addi sp, sp, -8
	sd ra, 0(sp)
	
	li t0, 0 		# final sum
LOOP_sumi:
	ble a1, zero, END_sumi  # if s1 <= 0 goto end
	lw t1, 0(a0)		# first element of the vector
	add t0, t0, t1		# sum the element
	addi a1, a1, -1		# decrement the counter
	addi a0, a0, 4 		# move to the next word in the array
	j LOOP_sumi
END_sumi:
	mv a0, t0		# load the result
	ld ra, 0(sp) 		# restore the return address
	addi sp, sp, 8 		# restore the stack pointer
	ret