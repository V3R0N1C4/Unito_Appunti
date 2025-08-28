.globl _start
.data
	str1: .string "first."
	str2: .string "second." 
.text
_start:
	# call strcmp 
	la a0, str1 	
	la a1, str2 	
	jal ra, strcmp
strcmp:
strcmp_loop:
	lbu t1, 0(a0)	# dereference str1[i]
	lbu t2, 0(a1)	# dereference str2[i]
	
	bne t1, t2, strcmp_end		# if str2 != str1, break
	bne t1, zero, strcmp_cont 	# if str2 == str1 && str1 == \0 return 0
	add a0, zero, zero
	ret				# return 0
strcmp_cont:
	addi a0, a0, 1
	addi a1, a1, 1
	j strcmp_loop			# loop
strcmp_end:
	addi a0, zero, 1		# return 1
	ret