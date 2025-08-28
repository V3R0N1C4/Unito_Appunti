.globl _start
.data

.text

_start:
	li t0,8		# N = 8
	li t1,1		# R = 1
	li t2,0		# A = 0
	li t3,1		# B = 1
loop:
	ble t0,zero,end	# while(N > 0)
	
	add t1,t2,t3	# R = A + B
	addi t2,t3,0	# A = B
	addi t3,t1,0	# B = R
	addi t0,t0,-1	# N = N - 1
	j loop
end:
	addi a0,t2,0
	li a7,1
	ecall