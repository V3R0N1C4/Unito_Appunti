.text 
_start: 
	li t0, 10 	# N
	li t1, 0 	# S

	li t2, 1	# i = 1
loop1:
	bgt t2, t0, end1	# if (i > N) jump to end
	
	mul t3, t2, t2 		# t3 = i*i
	add t1, t1, t3 		# S = S + t3;
	addi t2, t2, 1 		# i++
	j loop1 		# jump for
end1: