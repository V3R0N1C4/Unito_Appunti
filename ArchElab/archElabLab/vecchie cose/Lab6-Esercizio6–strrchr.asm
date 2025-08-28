.data
	str: .string "my long string"
	char: .string "g"
.text _start:
	la a0, str
	la t1, char 
	lbu a1, 0(t1) 
	jal ra, strrchr
strrchr:
	add t2, zero, zero	# return address
strrchr_loop:
	lbu t1, 0(a0)			# dereference str[i] 
	beq t1, zero, strrchr_end 	# if str == \0 done
	bne t1, a1, strrchr_cont
	add t2, a0, zero 		# if str[i] == char, update t2
strrchr_cont:
	addi a0, a0, 1
	j strrchr_loop
strrchr_end:
	add a0, t2, zero	# return t2
	ret