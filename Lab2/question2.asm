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
	ldr r0, =arr; load the start of the array
	ldr r1, =arr + (N-1)*4; load the end of the array
	mov r6, #(N/2); initialize counter to n/2
up ldr r2, [r0], #4; load start of array in r2, and increment
	ldr r3, [r1], #-4; load end of array in r3, and decrement
	str r3, [r0,#-4]; store r3, in desired location using r0, using pre indexing, as increment is already done
	str r2, [r1, #4]; store r2, in desired location using r1, using pre indexing, as decrement is already done
	sub r6,#1; decrement counter
	cmp r6,#0; compare to zero
	BNE up; if not zero loop and go to up flag
STOP B STOP
N equ 10
	AREA mydata, DATA, READWRITE
arr DCD 0,0,0,0,0,0,0,0,0,0
	END
