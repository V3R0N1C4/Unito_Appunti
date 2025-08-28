.globl	_start

.data
	v1: .word 1
	v2: .word 2
	v3: .word 3
	v4: .word 0

.text

_start:
	la t0,v1	#carico l'indirizzo di v1 in t0
	lw t1,0(t0)	#carico il valore di v1 in t1
	lw t2,4(t0)	#carico il valore di v2 in t2
	lw t3,8(t0)	#carico il valore di v3 in t3
	
	add t4,zero,t1	#conterà il max
	
	bge t4,t2,skip1	#skippo se t4 > t2
	add t4,zero,t2	#se t2 > t4, t2 è il nuovo max
skip1:
	bge t4,t3,skip2 #skippo se t4 > t3
	add t4,zero,t3	#se t3 > t4, t3 è il nuovo max
skip2:
	sw t4,12(t0)	#salvo il max in v4
end:
	addi a0,t4,0
	li a7,1
	ecall
	
