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
    ldr r0, =N        ; Load address of N
    ldr r0, [r0]      ; Load value of N into r0
	ldr r3, =ANS      ; Load address of ANS
	bl fact           ; Call factorial function
	str r0, [r3]      ; Store result in ANS
stop b stop            ; Infinite loop to halt
N DCD 5
fact
    cmp r0, #1
    beq exit     
	push {lr,r0}
	sub r0, r0, #1 
	bl fact
	pop {lr, r1} 
	mul r0, r0, r1    
	bx lr             
exit
	bx lr

    AREA mydata, DATA, READWRITE
ANS DCD 0            ; Store factorial result here
    END
