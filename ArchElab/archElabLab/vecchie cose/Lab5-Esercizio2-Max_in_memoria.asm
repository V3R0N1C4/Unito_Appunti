.data
	v1: .word 1
	v2: .word 2
	v3: .word 3
	v4: .word 0
.text
_start:
	la t4, v1 	# get the v1 address
	lw t0, 0(t4) 	# copy the first word
	lw t1, 4(t4)	# copy the second word
	lw t2, 8(t4)	# copy the third word
	
	add t3, zero, t0 	# this will hold the max among the three
	
	bge t3, t1, skip1	# check whether t1 < t0
	add t3, zero, t1	# if t1 > t0, hold t1
skip1:
	bge t3, t2, skip2	# check whether t2 < max(t1, t0)
	add t3, zero, t2 	# if t2 > max(t1, t0), hold t2
skip2:
	sw t3, 12(t4)