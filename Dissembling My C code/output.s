	.arch armv8-a
	.file	"findMax.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	mov	w0, 25
	str	w0, [sp]
	mov	w0, 50
	str	w0, [sp, 4]
	mov	w0, 75
	str	w0, [sp, 8]
	mov	w0, 100
	str	w0, [sp, 12]
	ldr	w0, [sp]
	str	w0, [sp, 28]
	str	wzr, [sp, 24]
	b	.L2
.L4:
	ldrsw	x0, [sp, 24]
	lsl	x0, x0, 2
	mov	x1, sp
	ldr	w0, [x1, x0]
	ldr	w1, [sp, 28]
	cmp	w1, w0
	bge	.L3
	ldrsw	x0, [sp, 24]
	lsl	x0, x0, 2
	mov	x1, sp
	ldr	w0, [x1, x0]
	str	w0, [sp, 28]
.L3:
	ldr	w0, [sp, 24]
	add	w0, w0, 1
	str	w0, [sp, 24]
.L2:
	ldr	w0, [sp, 24]
	cmp	w0, 3
	ble	.L4
	mov	w0, 333
	str	w0, [sp, 20]
	mov	w0, 0
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
