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
	ldr r0,=N
	ldr r0,[r0]		; load number from the ROM
	mov r1,r0		; create a copy of the NUM
	and r0, #0XF	; get the lsb by using and with 0000...001111
	cmp r0, #0XA	
	addlo r0, #0X30	; if less than 10, then add 30
	addhs r0, #0X37	; if more than 10, them add 37
	lsr r1, #4		; get the bit next to lsb and so on by logical right shift
	cmp r1, #0XA
	addlo r1, #0X30	; same operations as the lsb
	addhs r1, #0X37
	lsl r1, #8		; left shift the msb 
	orr r1,r0		; add the lsb to msb to get the packed ascii number
	ldr r2,=ans
	str r1, [r2]	; store it in the RAM
stop b stop
N DCD 0X21
	AREA mydata, DATA, READWRITE
ans DCD 0
	END
