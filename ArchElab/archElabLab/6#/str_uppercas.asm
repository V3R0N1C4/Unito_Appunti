.globl _start

.data
  str: .string "architettura"

# void strupr(char* in_string) {
#   char* c = in_string;
#   while(*c) {
#     printf("%c", (*c-32));
#     ++c;
#   }
#   putchar('\n');
# }

.text

_start:
  la a1, str         # a1 contiene address della stringa
  jal strupr

exit:
  li a7, 10
  ecall


strupr:
  # ciclo sui caratteri
  lbu t0, 0(a1)      # dereferenzio puntatore e carico carattere della stringa
  beq t0, zero, end_procedure # t0 contiene il carattere
                     
  addi a0, t0, -32   # per convertirlo in uppercase sottraggo 32
  li    a7, 11       # stampo il carattere
  ecall

  addi a1, a1, 1     # sposto il puntatore al prossimo carattere
  j strupr

end_procedure:
  jr ra