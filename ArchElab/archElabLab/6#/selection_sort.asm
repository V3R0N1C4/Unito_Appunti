.globl _start

.data
  size:   .word 4
  array:  .word 3, 2, 7, 1

.text
_start:
  la a0, array      # load the vector address
  la a1, size       # indirizzo array[0]
  lw a3, 0(a1)      # a3 size dell'array
  addi a2, a1, 4    # indirizzo array[1]

  jal selection_sort

  # li a7, 1
  # ecall

exit:
  li a7, 10
  ecall

selection_sort:
  addi sp, sp, -8
  sd ra, 0(sp)

  li t6, 4
  li t1, 0           # i = 0
  
  addi a4, a3, -1  # a4 --> size-1
  outer_loop:      
    mv t3, t1        # min_idx = i;
    beq t1, a4, end_outer_loop
    # j after_inner_loop
    addi t2, t1, 1   # j = i+1;
  inner_loop:
    beq t2, a3, end_inner_loop  # j < size;
    
    # if (array[j] < array[min_idx])
    mul t4, t2, t6
    mul t5, t3, t6
    
    add t4, a0, t4   # &array[j]
    lw a5, 0(t4)
    add t5, a0, t5   # &array[min_idx]
    lw a6, 0(t5)

    bge a5, a6, step_on
    mv t3, t2        # min_idx = j;
    
    step_on:
    addi t2, t2, 1   # j++
    j inner_loop

  end_inner_loop:
    beq t1, t3, after_inner_loop # se indici uguali evitiamo swap

    mul t5, t3, t6   # indice min_idx
    mul t4, t1, t6   # indice i
    add a1, a0, t5   # &array[min_idx]
    add a2, a0, t4   # &array[i]
    
    # swap(&array[min_idx], &array[i]); 
    jal swap         # passa ptr tramite a1 e a2
      
  after_inner_loop:
    addi t1, t1, 1   # ++i;
    j outer_loop

  end_outer_loop:
    ld ra, 0(sp)
    addi sp, sp, 8
    jr ra

swap:
  addi sp, sp, -24    # save
  sd ra, 0(sp)        # save
  sw t1, 8(sp)        # save
  sw t2, 12(sp)       # save
  
  lw t1, 0(a1)        # load
  lw t2, 0(a2)        # load
  
  sw t1, 0(a2)        # store
  sw t2, 0(a1)        # store
  
  ld ra, 0(sp)        # restore
  lw t1, 8(sp)        # save
  lw t2, 12(sp)       # save
  addi sp, sp, 24     # restore
  jr ra