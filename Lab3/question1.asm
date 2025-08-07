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
    ldr r0, =arr
    mov r1, #N
    mov r2, #0
    mov r5, #0
up ldr r3, [r0], #4
    adds r2, r3
    adc r5, #0
    subs r1, #1
    bne up
    ldr r4, =sumnums
    str r2, [r4]
    str r5, [r4, #4]
stop b stop

N EQU 10
arr DCD 0x10000001,0x20000002,0x30000003,0x10000001,0x20000002,0x30000003,0x10000001,0x20000002,0x30000003,0x10000001

    AREA mydata, DATA, READWRITE
sumnums DCD 0, 0

    END
