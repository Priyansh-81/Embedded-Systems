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
    ldr r0, =num
    ldr r0, [r0]
    ldr r1, =ans
    bl fact
    str r2, [r1]
stop 
    b stop
num DCD 0x8
fact
    cmp r0, #1
    beq exit
    push{lr, r0}
    sub r0,0x1
    bl fact
    pop(lr, r3)
    mul r2, r3
    bx lr
exit
    bx lr
    AREA mydata, DATA, READWRITE
ans DCD 0
    END
