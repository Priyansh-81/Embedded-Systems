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
	ldr r0, =N1; storing address of n1 in r0 register
	ldr r1, [r0]; storing the value of N1, like the pointer to N1
	ldr r0, =N2; storing address of n2 in r0 this time
	ldr r2, [r0];storing the value of n2
STOP B STOP
N1 DCD 0X12345678 ; declaring N1 with the value 12345678 in hex
N2 DCD 0X3015
	END