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
	MOV R0, #0X13;R0=0X13
	MOV R10, #10; R10=A
	MOV R1, R0; R1 is a temp register
	MOV R0, R10
	MOV R10, R1
STOP B STOP
	END