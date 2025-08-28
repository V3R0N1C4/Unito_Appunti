.globl _start

.data
	v1: .word 1
	v2: .word 2
	v3: .word 3
	v4: .word 4
	v5: .word 0
.text

_start:
	la t1,v1	#carico l'indirizzo di v1 in t1
	lw t2,0(t1)	#copio v1 in t2
	lw t3,4(t1)	#copio v2 in t3
	add t4,t2,t3	#sommo le word e salvo nel registro t4
	lw t3,8(t1)	#copio v3 in t3
	add t4,t4,t3	#sommo a t4 la v3
	lw t3,12(t1)	#copio v4 in t3
	add t4,t4,t3	#sommo a t4 la v4
	srli t4,t4,2	#shift a destra di 2 posizioni, divido per 4
	sw t4,16(t1)	#salvo t4 in v5
end:
	addi a0,t4,0
	li a7,1
	ecall
	
