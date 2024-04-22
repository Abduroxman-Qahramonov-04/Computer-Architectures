.global _start
.section .data
array1: .dword 18,45,12,89,56,34,7,24,4,7,14,66,3
array2: .dword 10,44,10,8,5,20,5,15,1,5,12,11,12
size: .dword 12
result: .dword 0
.section .text

_start:
	ldr x0,=array1 // address of first element array1
	ldr x1,=array2 // addres of first element array2
	mov x2,#1 //Iterator
	mov x3,#2 // flagOne
	mov x4,#2 //flagTwo
	ldr x5,=size //address of size
	ldr x6,[x5] // size itself
	ldr x7,[x0] // first element arrayOne
	ldr x8,[x1] // first element arrayTwo
	
	mov x25,#0 // final result
	
	bl loop
	b finalCheck

loop:
	cmp x2,x6
	bgt end
	ldr x10,[x0,x2,lsl #3] // array1[i]
	ldr x11,[x1,x2, lsl #3] // array2[i]
	cmp x11,x10
	blt updateFlagOne
	cmp x11,x10
	bgt updateFlagTwo
	adds x2,x2,#1
	b loop

updateFlagOne:
	mov x3,#-1
	adds x2,x2,#1
	b loop

updateFlagTwo:
	mov x4,#1
	adds x2,x2,#1
	b loop

end:
	ret

finalCheck:
	cmp x3,#-1
	beq con
	
	cmp x3,#2
	beq continue
	b finishExam
continue:
	cmp x4,#1
	beq fUpdate
fUpdate:
	mov x25,#1
	b finishExam

con:
	cmp x4,#2
	beq updateRes
	b finishExam	

updateRes:
		mov x25,#-1
		b finishExam

finishExam:
	ldr x20, =result
	str x25,[x20]

//Please Neglect a small mistake!!! Thank you!
	
				


//array1[];
//array2[];
//int i = 1;
//int flagONE = 2;
//int flagTwo = 2;

//int result = 0;
//for(i;i<=size;i++){
//	if(array2[i]<array1[i]){
//		flag1 = -1;
//	}
//	if(array2[i]>array1[i]){
//		flag2=1;
//	}
//}
//if(flag1==-1 && flag2==2){
//	result = -1;
//}
//else if(flag1==2 && flag2=1){
//	result = 1;
//}
