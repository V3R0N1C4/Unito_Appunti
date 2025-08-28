.globl _start
.data
    num1: .dword 5
    num2: .dword 6
.text
_start:
    # call MCD
    la    a0, num1
    la    a1, num2
    ld    a0, 0(a0)
    ld    a1, 0(a1)     
    jal   ra, mcm

    #exit
    li    a7, 10
    ecall
mcm:
    addi sp,sp,-16
    sd ra, 0(sp)
    sd s1, 8(sp)
    mul s1,a0,a1
    jal ra,mcd
    div a0,s1,a0
    ld ra,0(sp)
    ld s1,8(sp)
    addi sp,sp,16
mcd:
	beq a0,a1,fine
	bge a1,a0,else
	sub a0,a0,a1
	j mcd
else:
	sub a1,a1,a0
	j mcd
fine:
	ret	
			 		