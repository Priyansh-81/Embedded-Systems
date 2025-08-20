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
	ldr r0, [r0]			;get number from the data memory
	mov r1, r0				;create a copy of the number
	and r0, #0XF			;get lsb
	lsr r1, #4				;get the bit next to lsb and so on
	mov r2, #0XA
	mla r3, r2, r1, r0		;reassmble the number so that assembler interprets it in hexadecimal number
	ldr r4, =ans
	str r3, [r4]			;store the answer in the ram
stop b stop
N DCD 0X18
	AREA mydata, DATA, READWRITE
ans DCD 0
	END