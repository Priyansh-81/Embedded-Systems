; write an ARM assembly language program to convert two digit hexadecimal number in ASCII packed
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
    ldr r0,[r0]
    mov r1, r0
    and r0,0xF ; r0 has the least significant bit
    lsr r1, #4 ; r1 has the other bit
    cmp r0, #0x9
    addlo r0, #0x30
    addhs r0, #0x37
    cmp r1, #0x9
    addlo r1, #0x30
    addhs r1, #0x37
    lsl r1, #0x8
    orr r1, r0
    ldr r2, =ans
    str r1, [r2]
stop
    b stop
num DCD 0xA8
    AREA mydata, DATA, READWRITE
ans DCD 0
    END