.globl _start

.data
  size:   .word 5
  array:  .word 1, 2, 4, 5, 7

.text
_start:
  la a0, array      # load the vector address
  la a1, size       # load the size address
  lw a1, 0(a1)      # load the actual size

  jal issorted

  li a7, 1
  ecall

exit:
  li a7, 10
  ecall

issorted:
  li t0, 1                # idx
  lw t1, 0(a0)            # t1 contiene last
  
  loop:
    beq t0, a1, endloop
    addi a0, a0, 4
    lw a2, 0(a0)          # prelevo l'iesimo elemento dall'array
    blt a2, t1, return_0  #
    lw t1, 0(a0)          # aggiorno last
    addi t0, t0, 1       # ++idx;
    j loop
  
  endloop: # se non sono ancora uscito, ritorno TRUE, 1
    li a0, 1
    jr ra

  return_0:
    li a0, 0
    jr ra