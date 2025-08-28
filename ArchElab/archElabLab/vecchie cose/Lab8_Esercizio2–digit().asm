.globl _start 
.data
byte:	
	.byte '7'	# oppure byte: .string "d" che, però, aggiunge anche il terminatore di stringa
.text
# inizio main
_start:
	la t0, byte 	# in t0 c'è l'indirizzo corrispondente all'etichetta byte
	lbu a0, 0(t0) 	# in a0 c'è un byte ora
	jal digit	# restituisce in a0 il risultato
	li a7, 1	# stampo risultato {0,1} e in a0 c'è il risultato da stampare
	ecall
exit:	
	li a7, 10 	# uscita "pulita"
	ecall
# Inizio procedura digit
digit:
	li t0, 48
	li t1, 57
	blt a0, t0, return_0 
	bgt a0, t1, return_0
return_1:
	li a0, 1 
	jr ra		# oppure ret
return_0:
	li a0, 0 
	jr ra		# oppure ret


