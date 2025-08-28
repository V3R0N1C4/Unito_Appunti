.globl _start

.data
  size:   .word 5
  array:  .word 3, 2, 3, 1, 7

.text
_start:
  la a0, array      # load the vector address
  la a1, size       # load the size address
  lw a1, 0(a1)      # load the actual size

  jal minarray

  li a7, 1
  ecall

exit:
  li a7, 10
  ecall

minarray:
  li t0, 0        # int min_idx = 0;
  lw a2, 0(a0)    # int min_val (primo elemento del vettore)
  li t1, 1        # i, cursore sull'array
  addi a0, a0, 4  # sposto il puntatore alla prossima word
  
  loop:
    beq t1, a1, endloop    # while(i < size)
    lw t2, 0(a0)           # array[i]
    
    bge t2, a2, carryon    # if(array[i] < min_val)
    mv t0, t1              # min_idx = i;
    mv a2, t2              # min_val = array[i];
        
  carryon:  
    addi a0, a0, 4         # sposto il puntatore alla prossima word
    addi t1, t1, 1         # ++i;
    j loop
  
  endloop: 
    mv a0, t0
    jr ra