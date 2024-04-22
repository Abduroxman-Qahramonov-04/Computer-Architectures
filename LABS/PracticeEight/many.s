.global _start
.section .data
start: .dword 2     // start
end: .dword 12      // end
sumEven: .dword 0 
sumThree: .dword 0
.section .text
_start:
	stp x0,x1,[sp,#-16]! //pushing the registers x0 and x1 into stack
	ldr x0,=start // start's address
	ldr x1,=end // end's address
	ldr x2,[x0] // start's content
	ldr x3,[x1] // end's content
	ldp x0,x1,[sp],#16  //poping them outta stack because I need them again and they're no longer in use!
	//and again temp variables let's take x4 and x5
	stp x4,x5,[sp,#-16]!
	ldr x4,=sumEven
	ldr x5,=sumThree
	ldr x0,[x4] // sumEven
	ldr x1,[x5] // sumMultipleOfThree
	ldp x4,x5,[sp],#16
	//After all of this : x0=sumEven,x1=sumMultipleOfThree,x2=start,x3=end
	stp x5,x7,[sp,#-16]!
	mov x5,x2 //local ITERATOR i=start
	bl calculateEvenSum
	ldp x5,x7,[sp],#16
	b end_prog
calculateEvenSum:
	cmp x5,x3
	bgt multipleOfthree
	bl isEven
	cmp x7,#0
	beq updateSum
	adds x5,x5,#1
	b calculateEvenSum
updateSum:
	adds x0,x0,x5
	adds x5,x5,#1
	b calculateEvenSum
isEven:
	and x7,x5,#1 // check even(0) or odd(1)
	ret
end_prog:
multipleOfthree:
	
	

	

















//int start = 1
//int end = 10
//int sumEven = 0;
//int sumThree = 0;

//sumEven = calculateEvenSum(start,end,sumEven)
//sumThree = calculateThreeSum(start,end,sumThree)

//int calculateEvenSum(start,end,sumEven){
//	int i = start;
//	for(i;i<=end;i++){
//		if(isEven(i)){
//			sumEven+=i;
//		}
//	}
//	return sumEven;
//}


//int calculateThreeSum(start,end,sumThree){
//	int i = start;
//	for(i;i<=end;i++){
//		if(isThree(i)){
//			sumThree+=i;
//		}
//	}
//	return sumThree;
//}
