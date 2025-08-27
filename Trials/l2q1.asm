; Write an ARM assembly language program to transfer a block of ten 32 bit number from one memory to another
; a-> when the source and destiniation blocks are non-overlapping
; b-> when the source and destination blocks are overlapping
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
    ldr r0, =arr
    ldr r1, =dest
    mov r3, #0xA ;initializing a counter with 10
up
    ldr r4, [r0], #4
    str r4, [r1], #4
    subs r3
    bne up
arr DCD 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x7, 0x8, 0x9, 0xA
    AREA mydata, DATA, READWRITE
dest DCD 0,0,0,0,0,0,0,0,0,0
    END
