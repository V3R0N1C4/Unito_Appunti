# marking where execution starts (main)
.globl _start
.data

.text 	# assembly code comes in the '.text' section

_start: # the label provided to .globl above is declared here

	#assembler code here
	
# env call to terminate the program (explained later)	
exit:
	addi x17,x0,10		#call number 10=exit
	ecall