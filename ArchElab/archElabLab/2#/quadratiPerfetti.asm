.globl _start
.data

.text

_start:
	li t0,10	# N = 10
	li t1,0		# S = 0
	li t2,1		# i = 1
loop:
	bgt t2,t0,end	# if(i > N) salta ad end
	mul t3,t2,t2	# i * i
	add t1,t1,t3	# S = S + i * 1
	addi t2,t2,1	# i++
	j loop		# salta ad loop
end:
	addi a0,t1,0
	li a7,1
	ecall
	
	