.globl	_start

.data

.text

_start:
	li a0,1	# a = 1
	li a1,2	# b = 2
	li s1,0	# result

	jal sum
	add s1,a0,zero
sum:
	add a0,a0,a1
	jr ra