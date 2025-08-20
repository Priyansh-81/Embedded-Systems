    .section .vectors, "a"      // Read-only section for vector table
    .global _Vectors
_Vectors:
    .word 0x10001000             // Initial stack pointer
    .word Reset_Handler          // Reset handler address

    .text                        // Code section
    .align 2
    .global Reset_Handler
Reset_Handler:
    ldr r0, =n1                   // r0 = address of n1
    ldr r0, [r0]                   // r0 = *n1 (value at n1)

    ldr r1, =n2                   // r1 = address of n2
    ldr r1, [r1]                   // r1 = *n2 (value at n2)

    add r2, r0, r1                 // r2 = value1 + value2

    ldr r3, =ans                   // r3 = address of ans
    str r2, [r3]                   // store sum into ans

stop:
    b stop                         // Infinite loop

    // Data section
    .data
    .align 2
n1: .word 0x10000000
n2: .word 0x10000001
ans: .word 0