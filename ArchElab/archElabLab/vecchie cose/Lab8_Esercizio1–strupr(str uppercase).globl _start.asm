.globl _start
.data
	str: .string "architettura"
.text
_start: 
	la a0, str # a0 contiene l’indirizzo della stringa
	jal strupr
exit:
	li a7, 10 
	ecall

strupr: # ciclo sui caratteri
	lbu t0, 0(a0) 			# dereferenzio puntatore e carico carattere della stringa 
	beq t0, zero, exit 	# t0 contiene il carattere
	addi t1, t0, -32 		# per convertirlo in uppercase sottraggo 32
	sb t1, 0(a0)
	addi a0, a0, 1 			# sposto il puntatore a0 prossimo carattere
	j strupr
	jr ra