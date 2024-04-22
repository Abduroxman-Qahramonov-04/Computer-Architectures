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
	
    mov   x29, sp
    MOV   w1, #0        // Initialize sum to 0
    MOV   w2, #1        // Initialize counter to 1
    MOV   w3, #5        // Number n

loop_sum:
    CMP   w2, w3        // Compare counter with n
    BGT   end_sum       // If counter > n, break the loop
    ADD   w1, w1, w2    // Add counter to sum
    ADD   w2, w2, #1    // Increment counter
    B     loop_sum      // Repeat loop

end_sum:
    // Now w1 contains the sum of numbers from 1 to n

    str	w1, [sp, 28]
    ldr	w1, [sp, 28]
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
