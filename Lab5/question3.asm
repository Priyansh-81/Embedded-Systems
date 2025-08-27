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
	ldr r1, =find
	ldr r1, [r1]
	ldr r0, =num
up
	ldr r2, [r0]
	cmp r1, r2
	add r0, #0x4
	bne up
	subs r0, #0x4
	ldr r1, =ls
	str r0, [r1]
stop b stop
find dcd 0x9
num dcd 0x1, 0x2, 0x9, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0xa
   AREA mydata, DATA, READWRITE 
ls DCD 0
	END
 