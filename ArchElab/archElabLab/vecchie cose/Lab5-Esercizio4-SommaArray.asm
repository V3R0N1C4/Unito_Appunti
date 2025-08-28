# sum the elements of an array (without considering overflow)
.globl _start
.data
	size:   .word 16
	array:  .word 12, 2, 1, 3, 5, 1, 7, 1, -1, 4, -2, -3, 1, 9, -6, 10
	result: .word 0
.text
_start:
	la t5, array 	# load the vector address
	la t4, size 	# load the size address
	lw t0, 0(t4) 	# load the actual size
	li t2, 0 	# final sum
loop:
	lw t1, 0(t5) # first element of the vector
	add t2, t2, t1 # sum the element
	addi t5, t5, 4 # move to the next word in the array
	addi t0, t0, -1 # decrement the counter controlling the number of elements to be checked
	bne t0, zero, loop # if not done, jump
save:
	la t1, result
	sw t2, 0(t1)