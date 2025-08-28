.data
	MemVett: .dword -12, 2, 1, 3, 5, 1, 7, 1, -1, 4
.text
	la t2, MemVett 
	addi t0, zero, 0 	# Oppure, li t0,0
	addi t1, zero, 0 	# Oppure, li t1,0
	addi t3, zero, 10
CICLO:
	ld t4, 0(t2)		# somma array
	add t0, t0, t4 		# long Ris = 0;
	addi t2, t2, 8		# for(i = 0, i < 10; i++)
	addi t1,t1,1		# Ris += MemVett[i];
	blt t1, t3, CICLO