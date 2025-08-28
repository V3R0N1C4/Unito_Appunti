.globl _start

.data
  byte: .byte '9'

.text

_start:
  la t0, byte
  lb a0, 0(t0)           # in a0 c'è un BYTE!

  li a1, 48
  li a2, 57
  
  jal isdigit_new
  
  li a7, 1 # stampo risultato {0,1}
  ecall

exit:
  li a7, 10
  ecall
  
isdigit_new:
  blt a0, a1, return_0
  # se no verifico se è anche <=57
  bgt a0, a2, return_0

return_1:
  li a0, 1
  jr ra  

return_0:
  li a0, 0
  jr ra