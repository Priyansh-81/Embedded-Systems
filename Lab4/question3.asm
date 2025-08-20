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
	ldr r0, =N
	ldr r0, [r0]	;number in r0
back bl divide 		
    cmp r0, #0		;check num for 0
	bne back		;divide and check for 0 again
	ldr r4, =bcd	 
	str r2, [r4]	;store it in data_memory
stop b stop

divide 
	mov r1, #0		;r1=0
up  cmp r0, #0xa	;num==10?
    blo exit		; if num<10, then exit loop (remainder) 
	sub r0, #0xa	; if not, sub 10 from num
	add r1, #1		; quotient in r1, so increment 
	b up
exit 
	lsl r0, r3		; lsl and store in num for correct face value adjustment
    add r2, r0
	add r3, #4
	mov r0, r1
	bx lr
N DCD 0X2D
	AREA mydata, DATA, READWRITE
bcd DCD 0X0
	END