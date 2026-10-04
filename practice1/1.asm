.data
number: .byte 0x13 # Номер по списку группы 19 -> 0x13

.text
main:
    li a7, 5
    ecall

    mv t0, a0

    la t1, number
    lbu t1, 0(t1)

    beq t0, t1, equal

    li a0, 0
    li a7, 1
    ecall

    li a7, 10
    ecall

equal:
    li a0, 1
    li a7, 1
    ecall

    li a7, 10
    ecall