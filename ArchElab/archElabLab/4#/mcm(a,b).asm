.globl	_start

.text

_start:
	li a0,9		#a
	li a1,12	#b
	jal ra,mcm
	mv t0, a0
print:
        addi  a0, t0, 0	#print the result
        li    a7, 1
        ecall
exit:
        li    a7, 10	#call number 10 = exit
        ecall
        
###################################
# Procedure MCM(a,b)
# a0 -> a
# a1 -> b
# return MCM in a0
###################################
mcm:
        addi    sp, sp, -16
        sd      ra, 0(sp)
        sd      s1, 8(sp)

        mul     s1, a0, a1
        jal     ra, mcd         # after this, a0 has mcd
        div     a0, s1, a0

	ld	ra, 0(sp)
        ld      s1, 8(sp)
        addi    sp, sp, 16      # restore the stack pointer
        ret
mcd:
mcd_while:
        beq     a0, a1, mcd_end
        bge     a1, a0, mcd_else
        sub     a0, a0, a1
        j       mcd_while
mcd_else:
        sub     a1, a1, a0
        j       mcd_while
mcd_end:
        ret