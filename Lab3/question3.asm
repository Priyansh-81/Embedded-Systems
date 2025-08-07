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
    mov r0, #4
    ldr r1, =num1
    ldr r2, =num2
    ldr r6, =sumnum
    mov r3, #0
	movs r7,#0; clear carry
up  ldr r4, [r1], #4
    ldr r5, [r2], #4
    sbcs r3, r4, r5
    str r3, [r6], #4
    sub r0, #1
	teq r0, #0
    bne up
stop b stop
num1 DCD 0xFFFFFFFF, 0XFFFFFFFF, 0xFFFFFFFF, 0xEFFFFFFF
num2 DCD 0x00000001, 0x00000000, 0x00000000, 0x00000000
    AREA mydata, DATA, READWRITE
sumnum DCD 0, 0, 0, 0

    END
