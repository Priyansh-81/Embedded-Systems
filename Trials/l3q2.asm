; write a program to add 2 128 bit numbers stored in code segment and store the result in data memory
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
    mov r3, #4
    ldr r4, =ans
    