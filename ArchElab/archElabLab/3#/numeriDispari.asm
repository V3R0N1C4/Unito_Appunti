.globl	_start

.data
	array: .byte 2,1,3,2,3,-6,1,23 	# the array of bytes
	size: .word 8 			# size of the array
	result: .word 0 		# store the result
	
.text

_start:
	la t5, array	# t5 = indirizzo di array
	la t1,size	# t1 = indirizzo di size
	lw t2,0(t1)	# t2 = 8
	li t2, 0	# n° dispari
	li t3, 2 	# t3 = 2
loop:
	lb t1, 0(t5)	# primo elemento dell'array
	rem t1, t1, t3	# resto dell divisione t1/2
	beq t1, zero, else	# if zero jump (its even)
	addi t2, t2, 1	# è dispari lo aggiungo a t2
else:
	addi t5, t5, 1	# passo al prossimo bytr nell'array
	addi t0, t0, -1 # size--
	bne t0, zero, loop # se size != 0 -> loop
save:
	la t1, result
	sw t2, 0(t1)