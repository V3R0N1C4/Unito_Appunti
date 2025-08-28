.globl _start
.data
	n:   .dword 56
        
.text
_start:
        # chiama tetrahedral
        la   a0, n
        ld   a0, 0(a0)
        jal  ra, tetrahedral

        # Risultato atteso su a0: 1
        
        #exit
        li   a7, 10
        ecall

################################################################################
# Procedure tetrahedral(n)
# a0 -> N
# return 1 if N is tetrahedral, 0 otherwise
################################################################################
tetrahedral:
    li  t0, 1 # t0 => i
    li  t1, 0 # t1 => t
    li  a1, 6

tetrahedral_loop:
    bge  t1, a0, tetrahedral_exit
    addi t2, t0, 1 # t2 => i + 1 
    addi t1, t0, 2 # t1 => t => i + 2
    mul  t1, t1, t0 # t => i * (i + 2)
    mul  t1, t1, t2 # t => i * (i + 1) * (i + 2)
    div  t1, t1, a1
    addi t0, t0, 1
    j tetrahedral_loop

tetrahedral_exit:
    bne t1, a0, tetrahedral_false
    li  a0, 1
    ret
tetrahedral_false:
    li a0, 0
    ret