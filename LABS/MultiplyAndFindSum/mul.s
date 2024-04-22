.global _start
.section .data
array: .quad 1,2, 3, 4, 5
.section .text
_start:
	ldr x0,=array //Base address
	mov x1,#2 //Factor
	mov x2,#5 //Size
	mov x3,#0 //Iterator
	bl mul
	ldr x11,[x0]
	ldr x12,[x0,#8]
	ldr x13,[x0,#16]
	ldr x14,[x0,#24]
	ldr x15,[x0,#32]
	
	mov x4,#0 // second Iterator
	mov x6,#0 // sum
	b sum		
mul:
	cmp x3,x2
	bge exit
	
	ldr x7,[x0,x3,lsl #3] // x7=array[i]
	mul x8,x7,x1 // x8 = element*factor
	str x8,[x0,x3,lsl #3]	//updating the elements of the array
	adds x3,x3,#1 //i++
	b mul
exit:
	ret
sum:
	cmp x4,x2
	bge end
	ldr x5,[x0,x4,lsl #3] // array[i]
	adds x6,x6,x5 // sum += array[i]
	adds x4,x4,#1 // i++
	b sum
end:
//int* mul(array[],sizeOfArray,factor){
//	int i = 0;
//	for(i;i<sizeOfArray;i++){
//		int element = array[i];
//		array[i] = element*factor
//	}
//	return array;
//}

// int sum(arrayp[],sizeOfArray){
//	int sum = 0;
//	int i = 0;
//	for(i;i<sizeOfArray){
//		element = array[i];
//		sum = sum + element;
//	}
//} x6: should be the sum which is 30 in our case