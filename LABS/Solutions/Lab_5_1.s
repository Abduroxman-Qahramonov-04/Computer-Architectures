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
	mov	x29, sp

              mov           w1, #10 // n = 10
       	mov 	w2, #1  // i = 1, initialization
	mov 	w3, #0  // sum = 0, initialization
	
FOR:
	cmp 	w1, w2  // w1 - w2, comparison
	BLT           end_loop
	add    	w3, w3, w2 // sum = sum + i
	add	w2, w2, #1 // i = i+1
	B FOR

	
end_loop:

	mov	w0, w3
	str	w0, [sp, 28]
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
