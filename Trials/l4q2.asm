; write an assembly language program to convert a 2 digit bcd number to its equvivalent hexadecimal number

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
    mov r1, r0
    and r0, #0xF
    lsr r1, #0x4
    mov r2, #0xA
    mla r3, r1, r2, r0
    ldr r4 , =ans
    str r3, [r4]
stop
    b stop
num DCD 0x17
    AREA mydata, DATA, READWRITE
ans DCD 0
    END