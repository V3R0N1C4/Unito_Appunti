.text
_start: 
	li t0, 8	# int N = 8;
	li t1, 1	# int N = 1;
	li t2, 0	# int N = 0;
	li t3, 1	# int N = 1;
loop1:
	ble t0, zero, end1 	# while (N > 0) {
	
	add t1, t2, t3		# R = A + B;
	add t2, t3, zero	# A = B;
	add t3, t1, zero 	# B = R;
	addi t0, t0, -1		# N = N - 1;
	j loop1			# }
end1: