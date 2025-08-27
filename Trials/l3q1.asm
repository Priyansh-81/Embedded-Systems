; write a program to add ten 32 bit numbers stored in the code segment and store the result in the data segment
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
    mov r0, #0xA
    ldr r1, =arr
    ldr r2, =ans
    mov r3, #0
    mov r4, #0
    mov r5, #10
up
    ldr r6, [r1], #4
    adds r4,r5
    sub r5, #1
    adc r3, #0
    subs r5,#1
    bne up

    str r3, [r2], #4
    str r4, [r2]
stop 
    b stop
arr DCD 0x1A2B3C4D, 0x5F6E7D8C, 0x9A0B1C2D, 0x3E4F5A6B, 0x7C8D9E0F, 0x12345678, 0xABCDEF01, 0x23456789, 0xDEADBEEF, 0x0F1E2D3C
    AREA mydate, DATA, READWRITE
ans DCD 0, 0
    END
