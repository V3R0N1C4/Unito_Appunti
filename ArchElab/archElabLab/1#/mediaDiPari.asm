.globl _start
.data

.text 	

_start: 
	li x5,12
	li x6,4
	add x7,x5,x6
	srai x7,x7,1
exit:
	addi x17,x0,10		#call number 10=exit
	ecall