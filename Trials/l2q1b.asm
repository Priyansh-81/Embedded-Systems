; Write an ARM assembly language program to transfer a block of ten 32 bit number from one memory to another
; a-> when the source and destiniation blocks are non-overlapping
; b-> when the source and destination blocks are overlapping
    AREA RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD 0X10001000
    DCD Reset_Handler
    ALIGN
    AREA mycode, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler
Reset_Handler
    ldr r0, =src+(n-1)*4
    ldr r1, =src+(n-1+shift)*4
    mov r2, #0XA ;counter initialized to 10

up 
    ldr r3, [r0], #-4
    str r3, [r1], #-4
    subs r2, #1;
    bne up
n equ 10
shift equ 6
    AREA mydata, DATA, READWRITE
src 0xA,0X9,0X8,0X7,0X6,0X5,0X4,0X3,0X2,0X1
    END