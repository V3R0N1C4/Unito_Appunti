.globl	_start

.data
	str: .string "my long string"
	char: .string "g"

.text

_start:
	la a0,str	#load address str
	la t1,char	#load address char
	lbu a1,0(t1)	#load primo byte di char in a1
	jal ra,strchr
print:
      	li    a7, 1
     	ecall
exit:
      	li    a7, 10
      	ecall
strchr:
strchr_loop:
	lbu t1,0(a0)		#load primo byte di str in t1
	beq t1,a1,strchr_end	#if str[i] == char, break
	addi a0,a0,1
	bne  t1, zero, strchr_loop # if str != \0 continue
    	add  a0, zero, zero        # return zero
      	ret
strchr_end:                      # a0 has the address of char
     	ret
	