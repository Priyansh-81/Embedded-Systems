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
	ldr r0, num1
	ldr r1, num2
	ldr r3, =sum
	adds r2, r0, r1
	str r2, [r3]
STOP B STOP
num1 DCD 0x12345678
num2 DCD 0xABCDEF12
	AREA mydata, DATA, READWRITE
sum DCD 0
	END
