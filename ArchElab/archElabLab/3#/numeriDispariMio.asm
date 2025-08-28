# contare i numei diapri nell'array
.globl _start
.data
	size: .word 8
	array: .byte 2,1,3,2,3,-6,1,23
	result: .word 0
.text

_start:
	la t0,array	# t0 = indirizzo di array
	la t1,size	# t1 = indirizzo di size
	lw t2,0(t1)	# t2 = 8
	li t6,1		# t6 = 1
loop:
	lb t3,0(t0)	# primo elemento dell'array
	andi t4,t3,1	# controllo che l'ultimo bit sia 1
	bne t4,t6,pari	# se t4 != 1 vado a pari
	add t5,t5,t4	# t5 = n° dispari
pari:
	addi t0,t0,1	# passo al prossimo valore nell'array
	addi t2,t2,-1	# size--
	bne t2,zero,loop
save:
	la t1, result	# t1 = indirizzo di result 
	sw t5, 0(t1)	# carico in result t5 
end:
 	addi a0,t5,0
	li a7,1
	ecall