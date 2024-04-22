.section .data
    array1: .dword   10, 5, 12, 7, 8, 15, 4, 3, 6, 9    // Example array
    array2: .dword    0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    size:   .dword   10                                  // Number of elements in the array

.section .text

	.arch armv8-a
	.file	"Print.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"The result is: %d\n"
	.text
	.align	2
	.global	main
	.type	main, %function


main:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24

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
    	mov	x29, sp
	ldr 	x4, =array2
	mov  	x12, #9
	ldr 	x6, [x4, x12, lsl #3]
	mov	x1, x6
	str	x1, [sp, 32]
	ldr	x1, [sp, 32]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
