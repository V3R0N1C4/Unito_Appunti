.globl _start
.text

# int main(){
#   int a = 3;
#   int b = 4;
#   int result;
#   result = multiply(a,b);
#   printf("result: %d\n", result);
#   exit(0);
# }

_start:
	li a0, 3          # a in a0
    	li a1, 4          # b in a1

   	li s1, 10         # s1 used in multiply, must be restored by multiply
   	li t0, 13         # t0 used in multiply, must NOT be restored by multiply

 	jal multiply
   	add t1, a0, zero  # result t1
print:
	add a0, s1, zero  # print s1
   	li a7, 1
	ecall    
   
    	addi  a0, zero, 0x0A # print new line
   	li    a7, 11
   	ecall    

  	add a0, t0, zero  # print t0
    	li a7, 1
   	ecall
    
	addi  a0, zero, 0x0A # print new line
    	li    a7, 11
    	ecall    

    	add a0, t1, zero  # print t1 (result)
  	li a7, 1
    	ecall
    	
    	addi  a0, zero, 0x0A # print new line
   	li    a7, 11
   	ecall 
exit:
	li a7, 10
	ecall

# int multiply(int a, int b){		###################################
#   int i = 0;				# Procedure multiply(a,b)
#   int acc = 0;			# a0 -> a
#   while(i < b) {			# return multiply in a0
#     acc += a;				###################################
#     ++i;
#   }
#   return acc;
# }

multiply:
	addi    sp, sp, -8
    	sd      s1, 0(sp)    # s1 -> saved
    	li      s1, 0        # acc
   	li      t0, 0        # i
whileloop:
    	beq     t0, a1, endwhile
    	add     s1, s1, a0
    	addi    t0, t0, 1
    	j whileloop
endwhile:
    	add     a0, s1, zero # s1 -> result
    	ld      s1, 0(sp)    # restore s1
    	addi    sp, sp, 8    # restore sp
    	jr ra