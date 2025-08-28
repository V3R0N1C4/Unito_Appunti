.data
	str: .string "my long string"
	char: .string "g"
.text _start:
	la a0, str
	la t1, char 
	lbu a1, 0(t1) 
	jal ra, strchr
strchr:
strchr_loop:
	lbu t1, 0(a0)			# dereference str[i]
	beq t1, a1, strchr_end		# if str[i] == char, break
	addi a0, a0, 1
	bne t1, zero, strchr_loop 	# if str != \0 continue 
	add a0, zero, zero		# return zero
	ret
strchr_end: 		# a0 has the address of char
	ret 