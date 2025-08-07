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
    ldr r1, =num1
    ldr r2, =num2
    mov r0, #1
    ldr r3, [r1]
    ldr r4, [r2]
up
    mul r5, r0, r3; r5=r0*r3-->i*a
    udiv r6, r5, r4; r6=i*a/r4-->i*a/b
    mls r7, r6, r4, r5; r7=r5-r6*r4--> i*a- i*a/b*b
    cmp r7, #0
    beq result
    add r0, #1
    b up
result
	ldr r8, =LCM
    str r5, [r8]
stop b stop
num1 DCD 0x00000008
num2 DCD 0x00000005
    AREA mydata, DATA, READWRITE
LCM DCD 0x0
    END
