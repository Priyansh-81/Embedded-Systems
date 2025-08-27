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
    ldr r0, =arr           ; r0 = base address of array
    mov r1, #size         ; r1 = size of array
    subs r1, r1, #1       ; r1 = size - 1 (outer loop limit)
    mov r2, #0            ; r2 = outer loop index i

Outer_Loop
    cmp r2, r1
    bgt stop               ; if i > size-2, done

    mov r4, r2            ; r4 = min_index = i
    add r5, r2, #1        ; r5 = j = i + 1

Inner_Loop
    cmp r5, #size
    bge After_Inner       ; if j >= size, exit inner loop

    ; Calculate address of arr[j]
    mov r3, r5
    lsl r3, r3, #2
    add r3, r0, r3
    ldr r7, [r3]          ; r7 = arr[j]

    ; Calculate address of arr[min_index]
    mov r6, r4
    lsl r6, r6, #2
    add r6, r0, r6
    ldr r8, [r6]          ; r8 = arr[min_index]

    cmp r7, r8
    bge Skip_Update       ; if arr[j] >= arr[min_index], skip

    mov r4, r5            ; min_index = j

Skip_Update
    add r5, r5, #1        ; j++
    b Inner_Loop

After_Inner
    cmp r4, r2
    beq No_Swap           ; if min_index == i, no swap needed

    ; Swap arr[i] and arr[min_index]

    ; Load arr[i]
    mov r3, r2
    lsl r3, r3, #2
    add r3, r0, r3
    ldr r9, [r3]

    ; Load arr[min_index]
    mov r6, r4
    lsl r6, r6, #2
    add r6, r0, r6
    ldr r10, [r6]

    ; Store arr[min_index] to arr[i]
    str r10, [r3]
    ; Store arr[i] to arr[min_index]
    str r9, [r6]

No_Swap
    add r2, r2, #1        ; i++
    b Outer_Loop

stop
    b stop
size EQU 10
	AREA mydata, DATA, READWRITE
arr DCD 0x9, 0x1, 0x7, 0x6, 0xA, 0x4, 0x3, 0x2, 0x8, 0x0
	END
