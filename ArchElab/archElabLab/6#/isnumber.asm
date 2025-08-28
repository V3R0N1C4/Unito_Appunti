.globl _start

.data
  in_str: .string "1w23" 

.text

_start:
  la a0, in_str

  jal isnumber
  
  li a7, 1 # stampo risultato {0,1}
  ecall

exit:
  li a7, 10
  ecall

isnumber:
  addi sp, sp, -16
  sd ra, 0(sp)         # salvo ra
  sd a0, 8(sp)         # salvo a0  
  
  li t0, 0             # int i (cursore su a0)
  li a3, 48
  li a4, 57
  
  loop_on_string:
    lbu a1, 0(a0)      # dereferenzio e carico il char

    beq a1, zero, isnum_return_1 # se sono a fine stringa 
                       # e SE non sono uscito prima, restituisco 1
    jal isdigit_new    # isdigit_new riceve in input a0 che contiene indirizzo 
                       # del char, e setta a0 con il valore di ritorno {0,1}
    beq a0 zero, isnum_return_0 # a0 è stato settato da isdigit_new
                       # se questo char non è digit, ritorno 0
                       # se no vado avanti a scorrere la stringa

    ld a0, 8(sp)       # restore a0 (sovrascritto da isdigit_new)
                       # a0 contiene di nuovo indirizzo
    addi t0, t0, 1     # ++i
    add a0, a0, t0     # sposto ptr al prossimo byte
    j loop_on_string


isnum_return_0:
  li a0, 0             # set a0 to 0
  ld ra, 0(sp)         # restore ra
  addi sp, sp, 16      # restore sp
  jr ra                # return
  

isnum_return_1:
  li a0, 1             # set a0 to 1
  ld ra, 0(sp)         # restore ra
  addi sp, sp, 16      # restore sp
  jr ra                # return
 
isdigit_new:
  addi sp, sp, -16
  sd ra, 0(sp)         # salvo ra
  sd a0, 8(sp)         # salvo a0  
  
  lb a0, 0(a0)         # dereferenzio e prendo il valore di a0
  
  blt a0, a3, return_0 # a3 contiene il val 48
  # se no verifico se è anche <=57
  bgt a0, a4, return_0 # a4 contiene il val 57

return_1:              # se non sono entrato nei branch precedenti è una cifra
  ld ra, 0(sp)         # restore ra
  # ld a0, 8(sp)         # restore a0  
  addi sp, sp, 16
  
  li a0, 1
  jr ra  

return_0:
  ld ra, 0(sp)         # restore ra
  # ld a0, 8(sp)         # restore a0  
  addi sp, sp, 16

  li a0, 0
  jr ra