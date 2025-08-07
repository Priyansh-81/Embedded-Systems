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
	ldr r0, =src + (N-1)*4; load r0 with the address of the last element of the array (adding (n-1)*4)
	ldr r1, =src + ((N-1)+Shift)*4; load destination with the address of the new location, so from the end it is shifted appropriately, thats why we are doing +Shift
	mov r3,#10; init counter to 10
up ldr r2,[r0],#-4; load the last element of array in the register, using the pointer created at line 11
	str r2, [r1], #-4; str that at the new shifted location pointed by ptr created at line 12
	sub r3, #1; decrement the counter
	cmp r3, #0; compare counter to zero(nzcv)
	BNE up; if not zero, go to the flag
STOP B STOP
N equ 10
Shift equ 2
	AREA mydata, DATA, READWRITE
src DCD 0,0,0,0,0,0,0,0,0,0,0,0
	END