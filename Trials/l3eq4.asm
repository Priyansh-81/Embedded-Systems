; write a program to divide a 32 bit number with a 16 bit number
    AREA RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD 0x10001000
    DCD Reset_Handler
    ALIGN
    AREA mycode, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler
Reset_Handler
    ldr r0, =n1
    ldr r1, =n2
    ldr r0, [r0]
    ldrh r1, [r1]
    mov r2, #0
up
    sub r0, r1
    add r2, #1
    cmp r0, r1
    bcs up
    ldr r3, =quotient
    ldr r4, =rem
    str r0, [r4]
    str r2, [r3]
stop
    b stop
n1 DCD 0x100044FF
n2 DCD 0x4
    AREA mydata, DATA, READWRITE
quotient DCD 0
rem DCD 0
    END