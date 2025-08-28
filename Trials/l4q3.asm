; write an assembly language program to convert 2 digit hex number to bcd equivalent
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
loop
    bl divide
    cmp r0,#0
    bne loop
    ldr r4, =ans
    str r2, [r4]
stop
    b stop

divide 
up
    mov r1, #0
    cmp r0, #0xA
    blo exit
    sub r0, #0xA
    add r1, 0x1
    b up
exit
    lsl r0, r3
    add r2, r0
    add r3, #4
    mov r0, r1
    bx lr
num DCD 0xAB
    AREA mydata, DATA, READWRITE
ans DCD 0
    END