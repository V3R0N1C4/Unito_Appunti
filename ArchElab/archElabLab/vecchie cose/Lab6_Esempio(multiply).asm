_start:
	li a0, 3	# a in a0
	li a1, 4 	# b in a1
	
	li s1, 10
	li t0, 13
	
	jal multiply
	add t1, a0, zero # result t1
multiply:
	addi sp, sp, -8
	sd s1, 0(sp)
	li s1, 0 	 # acc
	li t0, 0	 # i
whileloop:
	beq t0, a1, endwhile 
	add s1, s1, a0
	addi t0, t0, 1
	j whileloop
endwhile:
	add a0, s1, zero 
	ld s1, 0(sp) 
	addi sp, sp, 8
	jr ra