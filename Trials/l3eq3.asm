; multiply two 32 bit numbers, product may not fit in 32 bits
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
    umull r3,r4,r0,r1
    str r4, [r2], #4
    str r3, [r4]
stop
    b stop
n1 DCD 0xFFFF1000
n2 DCD 0x2
    AREA mydata, DATA, READWRITE
prod DCD 0,0
    END