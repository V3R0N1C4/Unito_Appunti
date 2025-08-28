# 	Supponiamo che i registri x5 e x6 contengano i numeri 0x8000000000000000 e 0xD000000000000000. 
# 	Usare il simulatore RARS per rispondere alle domande.
# 	● Quale sarà il contenuto di x30 dopo l’esecuzione di questa istruzione
#              add x30, x5, x6
#         Il contenuto di x30 è corretto, o si è verificato un overflow?
#	● Quale sarà il contenuto di x30 dopo l’esecuzione di questa istruzione:
#              sub x30, x5, x6
#	  Il contenuto di x30 è corretto o si è verificato un overflow?
#	● Quale sarà il contenuto di x30 dopo l’esecuzione di queste due istruzioni:
#              add x30, x5, x6
#              add x30, x30, x5
#	  Il contenuto di x30 è corretto o si è verificato un overflow?

.globl _start

.text

_start:
	li x5, 0x8000000000000000
	li x6, 0xD000000000000000
	
	add x30, x5, x6 #overflow
	
	sub x30, x5, x6 #senza overflow
	
	add x30, x5, x6
        add x30, x30, x5 #overflow