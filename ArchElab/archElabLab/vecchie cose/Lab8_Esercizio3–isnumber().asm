.globl _start 
.data 
	in_str:		.string "12"
.text

# inizio main
_start: 
	la a0, in_str 
	jal isnumber
print:
	li a7, 1	# stampo risultato {0,1}
	ecall
exit:
	li a7, 10 
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
	
# inizio procedura isnumber
isnumber:
	addi sp, sp, -24 
	sd ra, 0(sp)
	sd a0, 8(sp)
	sd s1, 16(sp)
	li s1, 0	# int i (cursore su a0)
loop_on_string:
	lbu a0, 0(a0)			# dereferenzio e carico il char
	beq a0, zero, isnum_return_1 	# se sono a fine stringa e se non sono uscito prima, restituisco 1
	jal digit			# digit riceve in input a0 (contiene il byte che rappresenta il carattere)
	beq a0, zero, isnum_return_0 	# a0 contiene il risultato di digit
	ld a0, 8(sp)			# ripristina a0 (sovrascritto da digit): a0 contiene di nuovo un indirizzo
	addi s1, s1, 1			# i++
	add a0, a0, s1
	j loop_on_string
isnum_return_0:
	li a0, 0	# set a0 to 0
	j return 
isnum_return_1:
	li a0, 1	# set a0 to 1
return:
	ld ra, 0(sp)		# restore ra
	ld s1, 16(sp) 		# restore s1
	addi sp, sp, 24 	# restore sp
	jr ra			# return