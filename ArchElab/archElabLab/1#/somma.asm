.globl _start
.data

.text

_start:
	addi x5,x0,41		#oppure		li x5,41
	li x6,43		#oppure		addi x6,x0,43
	li x7,47
	add x28,x5,x6
	add x28,x28,x7
	
exit:
	addi x17,x0,10		#call numper 10 = exit
	ecall