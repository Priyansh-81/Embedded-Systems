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
    ldr r1, =target
    ldr r1, [r1]
up
    ldr r2, [r0], #4
    cmp r1, r2
    add r0, #0x4
    bne up
    subs r0, #0x4
    ldr r1, =ls
    str r0, [r1]
stop
    b stop
target dcd 0x9
arr dcd 0x1, 0x5, 0x3, 0x9, 0x7, 0x2, 0x8, 0x4, 0x6, 0x0
