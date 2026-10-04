.data
y: .word 126
h: .word 19

.macro read_int(%x)
	li a7, 5
	ecall
	mv %x, a0
.end_macro

.macro print_int(%x)
	li a7, 1
	mv a0, %x
	ecall
.end_macro
	
.text
main:
	read_int(t0)
	lw t1, y
	lw t2, h
	bgt t0, t1, switch


loop:
	bgt t0, t1, exit
	print_int(t0)
	li a7, 11
	li a0, ' '
	ecall
	add t0, t0, t2
	j loop
	
switch:
	mv t3, t0
	mv t0, t1
	mv t1, t3
	j loop
	
exit:
	li a7, 10
	ecall