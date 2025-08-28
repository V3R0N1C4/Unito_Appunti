# max tra gli elementi
.globl _start
.data
	size: .word 16
	array: .word 12,2,1,3,5,1,7,1,-1,4,-2,-3,1,9,-6,10
.text

_start:
	la t0,array	# t0 = indirizzo di array
	la t1,size	# t1 = indirizzo si size
	lw t2,0(t1)	# t2 = 16
	lw t3,0(t0)	# max = primo elemento finora
loop:
	lw t4,0(t0)	# prossimo elemento dell'array
	bge t3,t4,skip	# skippo se t3 >= t4
	add t3,t4,zero	# se t4 > t3, max = t4
skip:
	addi t0,t0,4	# passo al prossimo valore dell'array
	addi t2,t2,-1	# size--
	bne t2,zero,loop
end:
 	addi a0,t3,0
	li a7,1
	ecall
	