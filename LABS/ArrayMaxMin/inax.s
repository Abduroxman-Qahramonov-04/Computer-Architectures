.global _start

.section .data
array: .quad 5, 1, 9, 4, 7,-3
min: .quad 0
max: .quad 0

.section .text
_start:
    ldr x1, =array // Load array's first element address
    mov x2, #5     // Array length
    ldr x3, [x1]   // Load first element into X3
    mov x4, x3     // Now x3 = min, x4 = max
    mov x0, #1     // Counter = 1

loop:
    cmp x0, x2     // Check counter >   = array length
    bgt end_loop

    ldr x5, [x1, x0, lsl #3] // Load next element array

    cmp x5, x3  //x3-x5
    blt update_min
    cmp x5, x4   //x4-x5
    bgt update_max

    add x0, x0, #1 // Counter increment
    b loop

update_min:
    mov x3, x5
    add x0, x0, #1 // Counter increment
    b loop

update_max:
    mov x4, x5
    add x0, x0, #1 // Counter increment
    b loop

end_loop:
    // Update min and max variables
    ldr x1, =min
    str x3, [x1]
    ldr x1, =max
    str x4, [x1]

    // Exit syscall (Linux)
