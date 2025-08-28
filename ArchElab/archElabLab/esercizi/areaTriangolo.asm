#sbagliato
.globl	_start
.data
.text 

_start:
	li a0, 20	#salvo la base in a0
	li a1, 23	#salvo l'altezza in a1
	
	#chiama area(base, altezza)
	jal ra, area		#altezza in a0, base in a1
	add t0, a0, zero	#salva il risultato in t0
	
	#stampa messaggio per il risultato
	add a0, t0, zero
	addi a7, zero, 1
	ecall
	
	#exit
	addi a7, zero, 10
	ecall
	
	
area:
#crea il call frame sullo stack (24 byte = ra + fp + rst)
#lo stack cresce verso il basso
	addi sp, sp, -24	#allocazione dell call frame nello stack
	sd ra, 8(sp)		#salvataggio dell'indirizzo di ritorno
	sd fp, 0(sp)		#salvataggio del precedente frame pointer
	addi fp, sp, 16
	
#calcolo dell'area
	jal ra moltiplicazione 
	sd a0, 0(fp)	#salva il risultato della moltiplicazione nella variabile locale rst
	srai a0, a0, 1
	
#uscita dalla funzione 
	ld fp, 0(sp)	#recupera il frame pointer
	ld ra, 8(sp)	#recuper l'indirizzo di ritorno
	addi sp, sp, 24	#elimina il call frame dallo stack
	jr ra		#ritorna al chiamante, pseudoistruzione
	
moltiplicazione:
	addi sp, sp, -16	#allocazione dell call frame nello stack
	sd fp, 0(sp)		#salvataggio del precedente frame pointer
	addi fp, sp, 8		#aggiornamento del frame pointer
	sd a0, 0(fp) 		#salvataggio variabile locale
	
	ld t2, 0(fp)
	li t0, 1
for:
	bgt t0, a1, endfor
	add t1, t1, t2
	addi t0, t0, 1
	j for	#pseudoistruzione
endfor:
	ld fp, 0(sp)		#recupera il frame pointer
	addi sp, sp, 16 	#elimina il call frame dallo stack
	add a0, t1, zero	#valore di ritorno in a0
	jr ra			#ritorna al chiamante, pseudoistruzione