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
	ldr r0, =src;load address of src
	ldr r1, =dest; load address of destination
	mov r3,#10; initialize a counter of 10
up ldr r2,[r0],#4; load r2 with the value pointed by r1(source) and increment it to the next one(+4)
	str r2, [r1], #4; store it in the destination array pointed by r1, and increment r1
	sub r3, #1; decrement the counnter
	cmp r3, #0; check for zero
	BNE up; if not zero, loop continues, goes back to the up flag
STOP B STOP; infinite loop

src DCD 0x34,0x66,0x77,0x19,0x56,0x51,0x44,0x32,0x11,0x39; src array in the rom
	AREA mydata, DATA, READWRITE
dest DCD 0,0,0,0,0,0,0,0,0,0; destination at the rom
	END