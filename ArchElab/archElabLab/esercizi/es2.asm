.globl _start
.data
    buffer: .string  "test string"
    low:    .byte  'A'
    high:   .byte  'Z'

.text
_start:
    # call contains
    la   a0, buffer
    la   a1, low
    la   a2, high
    lbu  a1, 0(a1)
    lbu  a2, 0(a2)
    jal  ra, contains

    # exit
    li   a7, 10
    ecall
contains:
    lbu t0,0(a0)
    blt t0,a1,increm
    bgt t0,a2,increm
return1:
    li a0,1
    jr ra
return0:
    li a0,0
    jr ra    
increm:
    addi a0,a0,1
    j contains