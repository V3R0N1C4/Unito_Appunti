.globl _start
.data

.text

_start:
	li x5,0x00000000aaaaaaaa
	li x6,0x1234567812345678
	
	slli x7,x5,4	#1
	or x7,x7,x6
	
	slli x7,x6,4	#2
	
	srli x7,x5,3	#3
	andi x7,x7,0xff