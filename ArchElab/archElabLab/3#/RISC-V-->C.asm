.globl	CICLO

.data
	MemVett: .dword -12,2,1,3,5,1,7,1,-1,4
.text
	la t2,MemVett	#carico in t2 l'indirizzo di MemVett
	addi t0,t0,0	# t0 = Risultato della somma del vettore
	addi t1,t1,0	# i = 0
	addi t3,zero,10 # t3 = 10
CICLO:
	ld t4,0(t2)	# t4 = 0(t2)
	add t0,t0,t4	# t0 = 0(t2)
	addi t2,t2,8	# t2 = t2 + 8, mi dà l'indirizzo del valore sucessivo nel vettore
	addi t1,t1,1	# i++
	blt t1,t3,CICLO #se i < 10 continuo il cilco
 end:
 	addi a0,t0,0
	li a7,1
	ecall