.section .data
array: .dword 2,5,3,2,8,3,2,8,5,1
//2-5 3-3 5-2 8-3 20-3 ->5
size: .dword 10
.section .text
.global _start
_start:
	ldr x0,=array 
	ldr x1,[x0] // array[0]
	ldr x2,=size
	ldr x3,[x2] // size
	mov x4,x3 // min=size
	mov x5,#0 // iterator
	mov x25,x1 // result
	b loop
loop:
	cmp x5,x3
	beq exit
	mov x6,#0 //counter
	mov x7, #0 // j
	bl loop2
	adds x5,x5,#1 //i++
	cmp x6,x4
	blt updateMin
	b loop
updateMin:
	mov x4,x6 // min = counter
	mov x25,x10 // result = array[i]
	b loop
loop2:
	cmp x7,x3
	beq back
	ldr x10,[x0,x5,lsl #3] // array[i]
	ldr x11, [x0,x7, lsl #3] // array[j]
	adds x7,x7,#1 //j++
	cmp x10,x11 
	beq updateCounter
	b loop2

updateCounter:
	adds x6,x6,#1
	b loop2

back:
	ret
exit:
	//mov x8, #93
	//mov x0,#0
	//svc #0

//Please Neglect a small mistake!!! Thank you!

//int size = 10
//int min = size;
//int i = 1
//int result = array[0]
//for(i;i<=size; i++){
	//int couter = 0;
	//int j = 0;
	//for(j;j<=size;j++){
		//if(array[i]==array[j]){
			//counter++;
		//}
	//}
	//if(counter<min){
		//min = counter;
		//result = array[i];
	//}
//}
