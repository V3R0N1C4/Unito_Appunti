# sum the elements of an array (without considering overflow)
.globl _start
.data
	size: .word 16
	array: .word 12, 2, 1, 3, 5, 1, 7, 1, -1, 4, -2, -3, 1, 9, -6, 10
	result: .word 0

.text

_start:
	la t5, array	#carico in t5 l'indirizzo dell'arry
	la t4, size	#carico in t4 l'indirizzo della size
	lw t0, 0(t4)	#carico il valore della siza
	li t2, 0	#somma finale
loop:
	lw t1, 0(t5)	#primo elemento del vettore
	add t2, t2, t1	#sommo gli elementi
	addi t5, t5, 4	#mi muovo vero il prossimo elemento dell'arry
	addi t0, t0, -1 #size--
	bne t0, zero, loop # if not done, jump
save:
	la t1, result
	sw t2, 0(t1)
end:
 	addi a0,t2,0
	li a7,1
	ecall