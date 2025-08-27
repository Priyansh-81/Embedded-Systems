; Reverse an array of 10 32 bit numbers in the memory
    AREA RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD 0x10001000
    DCD Reset_Handler
    ALIGN
    AREA  mycode, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler
Reset_Handler
    ldr r0, =arr
    ldr r1, =arr+(n-1)*4
    mov r2, #(n/2)
up
    ldr r3, [r0], #4
    ldr r4, [r1], #-4
    str r3, [r1, #4]
    str r4, [r0, #-4]
    subs r2, #1
    bne up
stop 
    b stop
n equ 10
    AREA mydata, DATA, READWRITE
arr DCD 0,0,0,0,0,0,0,0,0,0
    END