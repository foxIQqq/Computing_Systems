.data
size: .word 35
array: .space 140

.macro read_int(%x)
	li a7, 5
	ecall
	mv %x, a0
.end_macro

.text
main:
	la t0, array
	lw t1, size
	li t6, 0
	
	
loop:
	beq t6, t1, exit
	read_int(t2)
	beq t2, zero, exit
	sw t2, 0(t0)
	addi t0, t0, 4
	addi t6, t6, 1
	j loop
	
exit:
	li a7, 10
	ecall