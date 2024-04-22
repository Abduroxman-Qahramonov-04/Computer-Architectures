.global _start

.section .data
start: .dword 2     // start
end: .dword 12      // end
sumEven: .dword 0 
sumThree: .dword 0
  

.section .text
_start:
	ldr x1, =start
	ldr x14, [x1]
	ldr x2, =end
	ldr x12, [x2]

	ldr x3, =isEven
	bl sum
	ldr x4, =sumEven  //storing sum into memory
	str x0, [x4] 

	ldr x3, =isThree
	bl sum
	ldr x4, =sumThree
	str x0, [x4]
	b end_program
	
sum: 	
	// We need to store into x30 address of returning instruction, if we have nested function call: function inside a function
	stp x29, x30, [sp, #-16]!  // Save frame pointer (X29) and link register (X30) on the stack
   	mov x29, sp                // Update the frame pointer with the current stack pointer

	mov x5, #0 //initialize sum=0
	mov x11, x14 //copy start value
     loop:
	cmp x11, x12 //x11-x12
	bgt exit_sum
	blr x3
	cmp x0, #0 //if x0=0, it is even, x0=1, it is odd
	beq add_to_sum
	add x11, x11, #1 //next value
	b loop
     add_to_sum:
	add x5, x5, x11
	add x11, x11, #1 //next value
	b loop

     exit_sum:
	mov x0, x5
	ldp x29, x30, [sp], #16  // Restore X29 (frame pointer) and X30 (link register) from the stack
	ret            // Return to the caller of sum


isEven:	
	and x7, x11, #1 // even: x7=0 or odd: x7=1
	mov x0, x7
	ret 

isThree: 
	mov x9, x11
      loop2:
	subs x9, x9, #3 // x9=x9-3, and update flags
	bhi loop2 
	cmp x9, #0
	beq divisible
	mov x0, #1
	ret 

     divisible:
	mov x0, #0
	ret
              
 
end_program:
	mov x8, #93       // exit syscall number
    	mov x0, #0        // status
    	svc #0
