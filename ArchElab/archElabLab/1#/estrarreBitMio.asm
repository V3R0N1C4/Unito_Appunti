.globl _start
.data

.text

_start:
	li x5,0
	li x6,0xffffffffffffffff
	
	addi x7,x0,0x3		#creo una bit mask da 3 bit   0x3 = 0b11
	slli x7,x7,2		#shift la mask verso i bit [4-3]
	and x28,x5,x7		#x28 ha i bit [4-3] uguala a x5 (altri=0)
	
	slli x7,x7,4		#sposta la maschea "sopra" i bit 8-7
	xori x7,x7,-1		#inverte i bit (NOT bit a bit)
	and x6,x6,x7		#"Zero out" bit [8-7] di x6
	
	slli x28,x28,15		#sposto i bit da x5 salvati in x28
	or x6,x6,x28		#carico i bit nelle posizioni [8-7]