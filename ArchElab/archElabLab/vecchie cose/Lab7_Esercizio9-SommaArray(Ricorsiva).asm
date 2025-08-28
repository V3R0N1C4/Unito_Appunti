sumr:
	addi sp, sp, -24
	sd ra, 0(sp) 
	sd a0, 8(sp) 
	sd s1, 16(sp)
	
	mv s1, zero
	
	# if size <= 0 end
	ble a1, zero, END_SUMR
	
	# otherwise recursively call sumr 
	addi a0, a0, 4
	addi a1, a1, -1
	jal ra, sumr
	
	# a0 has the sum of the tail of the list ù
	add s1, a0, zero
	ld a0, 8(sp) 		# recover the saved a0
	ld t0, 0(a0) 		# value in the head of the list
	add s1, s1, t0		# sum head with sumr(tail)
END_SUMR:
	mv a0, s1		# load the result
	ld s1, 16(sp) 		# restore the saved register
	ld ra, 0(sp) 		# restore the return address
	addi sp, sp, 24 	# restore the stack pointer
	ret