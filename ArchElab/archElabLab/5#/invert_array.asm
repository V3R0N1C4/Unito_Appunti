# Invert an array in memory using swap
.globl _start

.data
      size:   .word 16
      array:  .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15

.text
_start:
      la    s1, size

      la    a0, array
      lw    a1, 0(s1)
      jal   ra, print

      la    a0, array
      lw    a1, 0(s1)
      jal   ra, invert

      la    a0, array
      lw    a1, 0(s1)
      jal   ra, print

exit:
      li    a7, 10 #call number 10 = exit
      ecall

swap:
      slli  a1, a1, 2     # calculates offset of x
      slli  a2, a2, 2     # calculates offset of y
      add   t0, a0, a1    # address of v[x]
      add   t1, a0, a2    # address of v[y]

      lw    t2, 0(t0)     # sway the values
      lw    t3, 0(t1)
      sw    t3, 0(t0)
      sw    t2, 0(t1)
      ret                 # return
invert:
      addi  sp, sp, -32
      sd    ra, 0(sp)
      sd    a0, 8(sp)
      sd    s1, 16(sp)
      sd    s2, 24(sp)

      addi  s1, zero, 0         # index of first element
      addi  s2, a1, -1          # index of last element
LOOP_invert:
      blt   s2, s1, END_invert  # if s2 < s1 goto end
      ld    a0, 8(sp)
      add   a1, s1, zero
      add   a2, s2, zero
      jal   ra, swap
      addi  s1, s1, 1
      addi  s2, s2, -1
      j     LOOP_invert
END_invert:
      ld    ra, 0(sp)           # restore the return address
      ld    s1, 16(sp)
      ld    s2, 24(sp)
      addi  sp, sp, 32          # restore the stack pointer
      ret
print:
      addi  sp, sp, -32
      sd    s1, 0(sp)
      sd    a0, 8(sp)
      sd    a1, 16(sp)
      sd    ra, 24(sp)

      li    s1, 0               # index
LOOP_print:
      beq   s1, a1, EXIT_print

      slli  t1, s1, 2           # calculates offset in the array
      add   t1, t1, a0          # t1 has the address of the element
      lw    t0, 0(t1)           # t0 has the number to print

      addi  a0, t0, 0           # print a number
      li    a7, 1
      ecall

      addi  a0, zero, 32      # print space
      li    a7, 11
      ecall

      ld    a0, 8(sp)           # recover the value of a0
      ld    a1, 16(sp)          # recover the value of a1
      addi  s1, s1, 1           # move to the next word
      j     LOOP_print
EXIT_print:
      addi  a0, zero, 0x0A      # print new line
      li    a7, 11
      ecall

      ld    s1, 0(sp)
      ld    ra, 24(sp)
      addi  sp, sp, 32
      ret