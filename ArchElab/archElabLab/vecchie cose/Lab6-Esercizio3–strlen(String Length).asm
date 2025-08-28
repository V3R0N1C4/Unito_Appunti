.globl _start
.data
	src: .string "This is the source string."
.text 
_start:
	# call strlen 
	la a0, src 
	jal ra, strlen
	
	# print size, ret in a0 
	li a7, 1
	ecall
strlen:
	add t0,zero,zero  # i = 0
			  # Start of for loop
strlen_loop:
	add t1, t0, a0		 # Add the byte offset for str[i]
	lbu t1, 0(t1)		 # Dereference str[i]
	beq t1, zero, strlen_end # if str[i] == 0, break for loop
	addi t0, t0, 1		 # i++
	j strlen_loop		 # loop
strlen_end:
	addi a0, t0, 0	  # Move t0 into a0 to return
	ret