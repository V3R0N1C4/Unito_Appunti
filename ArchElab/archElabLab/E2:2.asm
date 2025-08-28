.globl _start
.data
	array: .word 8,5,3,7,2,6,4,1
        size:  .word 8
        
.text
_start:
        # chiama bar_odd
        la   a0, array
        la   a1, size
        lw   a1, 0(a1)
        jal  ra, bar_odd

        # Risultato atteso su a0: 38
        
        #exit
        li   a7, 10
        ecall
#******************************************************
# Implementazione di bar: Non incollarla nella risposta
#******************************************************
bar: 
        li  t0, 2
        mul a0, a0, t0 
        ret     
################################################################################
# Procedure bar_odd(array, size)
# a0 -> address of array
# a1 -> size
# apply bar to all elements in odd positions of the array, return the sum
################################################################################
bar_odd:
    addi sp, sp, -40
    sd   ra, 0(sp)
    sd   s1, 8(sp)
    sd   s2, 16(sp)
    sd   s3, 24(sp)
    sd   s4, 32(sp)

    li   s1, 1     # i
    mv   s2, a0    # address
    mv   s3, a1    # size
    li   s4, 0     # sum

bar_odd_loop:    
    bge  s1, s3, bar_odd_return
    slli a0, s1, 2
    add  a0, a0, s2
    lw   a0, 0(a0)
    jal  ra, bar
    add  s4, s4, a0
    addi s1, s1, 2
    j    bar_odd_loop

bar_odd_return:
    mv   a0, s4
    ld   ra, 0(sp)
    ld   s1, 8(sp)
    ld   s2, 16(sp)
    ld   s3, 24(sp)
    ld   s4, 32(sp)
    addi sp, sp, 40
    jr   ra
