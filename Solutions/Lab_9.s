.global _start
.section .data
    array1:  .dword   10, 5, 12, 7, 8, 15, 4, 3, 6, 9    // Example array
    array2: .dword    0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    size:   .dword   10                                  // Number of elements in the array

.section .text
_start:
    // Load array address and size into registers
    // Load array address and size into registers
    ldr x1, =array1
    ldr x2, =array2
    ldr x7, =size
    ldr x7, [x7]

    // Initialize loop counters and pointers
    mov x3, #0          // Counter for array1 elements
    mov x4, #0          // Counter for even elements
    sub x5, x7, #1      // size-1, counter for odd elements
       
loop:
    cmp x3, x7  // Check if array index is less than the size
    bge end_program
    ldr x9, [x1, x3, lsl #3] //x1+x3*8
    and x10, x9, #1 //check for even number
    cmp x10, #0 
    beq put_even
    b put_odd

put_even:
    str x9, [x2, x4, lsl #3]
    add x4, x4, #1
    add x3, x3, #1
    b loop

put_odd:
    str x9, [x2, x5, lsl #3]
    sub x5, x5, #1
    add x3, x3, #1
    b loop

end_program:
    // End of program
    mov x8, #93       // exit syscall number
    mov x0, #0        // status
    svc #0

