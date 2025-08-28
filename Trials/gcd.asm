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
    ldr r0, =num1
    ldr r0,[r0]
    ldr r1, =num2
    ldr r1,[r1]
loop
    cmp r0, r1
    beq exit
    sublo r1,r1,r0
    subhi r0,r0,r1
    b loop
exit 
    ldr r2, =ans
    str r0, [r2]
stop
    b stop
num1 dcd 0xC
num2 dcd 0x6
    AREA mydata, DATA, READWRITE
ans dcd 0
    END
