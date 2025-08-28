invert:
	addi sp, sp, -32
	sd ra, 0(sp) 
	sd a0, 8(sp) 
	sd s1, 16(sp) 
	sd s2, 24(sp)
	addi s1, zero, 0	# index of first element
	addi s2, a1, -1 	# index of last element
LOOP_invert:
	blt s2, s1, END_invert 	# if s2 < s1 goto end
	
	ld a0, 8(sp) 
	add a1, s1, zero 
	add a2, s2, zero 
	jal ra, swap 
	addi s1, s1, 1 
	addi s2, s2, -1 
	j LOOP_invert
END_invert:
	ld ra, 0(sp)	# restore the return address
	ld s1, 16(sp) 
	ld s2, 24(sp) 
	addi sp, sp, 32 # restore the stack pointer
	ret

# Procedure swap(v, x, y)
# a0 -> address of v
# a1 -> index x
# a2 -> index y
swap:
	slli a1, a1, 2 	# calculates offset of x
	slli a2, a2, 2 	# calculates offset of y
	add t0, a0, a1 	# address of v[x]
	add t1, a0, a2	# address of v[y]
	
	lw t2, 0(t0) 	# swap the values
	lw t3, 0(t1) 
	sw t3, 0(t0) 
	sw t2, 0(t1) 
	ret		# return
	
# Procedure print(v) 
# a0 -> v address
# a1 -> v size 
print:
	addi sp, sp, -32 
	sd s1, 0(sp) 
	sd a0, 8(sp) 
	sd a1, 16(sp) 
	sd ra, 24(sp)
	li s1, 0
LOOP_print:
	beq s1, a1, EXIT_print
	slli t1, s1, 2 
	add t1, t1, a0 
	lw t0, 0(t1)
	
	addi a0, t0, 0 
	li a7, 1 
	ecall
	
	addi a0, zero, 0x20 
	li a7, 11
	ecall
	
	ld a0, 8(sp) 
	ld a1, 16(sp) 
	addi s1, s1, 1 
	j LOOP_print
EXIT_print:
	addi a0, zero, 0x0A # new line
	li a7, 11 
	ecall
	ld s1, 0(sp) 
	ld ra, 24(sp) 
	addi sp, sp, 32 
	ret