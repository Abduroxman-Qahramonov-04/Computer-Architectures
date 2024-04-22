.section .data
array: .dword 1, 2, 3, 2, 1     // The original array
arrayRev: .dword 0, 0, 0, 0, 0
len: .dword 5                   // Number of elements in the array


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
	
	ldr x0, =array  // address of first element
	ldr x1, =arrayRev
	ldr x2, =len
	ldr x3, [x2]   // x3 = 5
	mov x4, #0 //counter initialization for incrementing loop
              mov x6, #4 //counter for reverse

ReverseArray:
	cmp x4, x3 // x4-x3
          	beq CompareArray
	ldr x5, [x0, x4, LSL 3] // x0+x4*2^3
              str x5, [x1, x6, LSL 3]  // x1+x6*2^3
              add x4, x4, #1  //increment counter
	sub x6, x6, #1 //decrement counter
	b ReverseArray
	
CompareArray: 
	mov x4, #0 // counter initialization
        loop: 
	cmp x4, x2  //x4-counter, x2-length
	beq end_loop
	ldr x5, [x0, x4, LSL 3] // x0+x4*2^3
	ldr x6, [x1, x4, LSL 3] // x0+x4*2^3
	cmp x5, x6  // x5-x6
	beq count
              b end_loop
        count: 
	add x4, x4, #1 // increment loop
	b loop
  
end_loop:  	
	cmp x3, x4
	beq true
              b false
true:         
              mov x5, #1
              b end_print
false:        
              mov x5, #0
end_print:
   	mov	x29, sp
	mov	x1, x5
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
