;write a ARM assembly language program to copy 16 bit variable from code memory to data memory
    AREA RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD 10001000
    DCD Reset_Handler
    ALIGN
    AREA mycode, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler
Reset_Handler
    ldr r1, =N
    ldr r2, =Dest
    ldr r1, [r1]
    str r1, [r2]
Stop
    B Stop
N DCD 0x10001000
    AREA mydata ,DATA, READWRITE
Dest DCD 0x0
    END