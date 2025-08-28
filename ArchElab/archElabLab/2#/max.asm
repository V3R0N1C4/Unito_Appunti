.globl _start
.data

.text

_start:
	li t0,56	#carico tre interi
	li t1,100
	li t2,64
	
	add t3,zero,t0	#registro che contiene il massimo
	bge t3,t1,else1		#if!(41 < 47) salto a else1
	add t3,zero,t1	#if t1 > t0  ->  47 > 41 , tengo t1
else1:
	bge t3,t2,else2	#if!(47 < 45) salto a else2 
	add t3, zero,t2	#if t2 > max(t1,t0), tengo t2
else2:
	#t3 ha già il massimo
print: 
	addi a0,t3,0	#enviroment call
	li a7,1		#a0 -> intero da stampare ad schermo
	ecall