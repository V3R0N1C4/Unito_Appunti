.globl _start
.data 

.text

_start:
	li t0,37	# N = 37
	li t1,1		# M = 1
	li t2,0		# R = 0
	li t3,64	# i = 64
loop:
	and t4,t0,t1	# N & M
	add t2,t2,t4	# R = R + N & M
	srli t0,t0,1	# N = N >> 1	>> -> shift verso destra
	
	addi t3,t3,-1	# i = i - 1
	ble t3,zero,end # if(i <= 0) salta ad end
	j loop		# altrimenti continua
end:
	addi a0,t2,0
	li a7,1
	ecall