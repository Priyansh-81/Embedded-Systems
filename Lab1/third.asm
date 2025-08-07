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
	ldr r0, =N; storing adress of n in r0 register
	ldr r1, [r0]; storing the value of N, like the pointer to N
	ldr r2, =DESTN; getting the adress of destination 
	str r1, [r2];
STOP B STOP
N DCD 0X12345678 ; declaring N with the value 12345678 in hex
	AREA mydata, DATA, READWRITE
DESTN DCD 0
	END
