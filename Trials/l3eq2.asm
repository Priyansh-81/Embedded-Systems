; write an assembly language program to multiple two 32 bit numbers
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
    ldr r1, [r1]
    ldr r2, =prod
    mul r1, r1, r0
    str r1, [r2]
stop
    b stop
n1 DCD 0x12
n2 DCD 0xAB
    AREA mydata, DATA, READWRITE
prod DCD 0
    END